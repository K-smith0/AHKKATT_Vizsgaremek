let bod = document.querySelectorAll("body")[0];
let svg = document.querySelectorAll("svg")[0];
let cont = document.getElementById("contain");
const maxScale = 500;
let countriesJSON;
async function load() {
    await fetch("../JSON/Countries.json").then((e) => e.json().then((resp) => {countriesJSON = resp;}));
}
load();
let currentScale = 1;
let currentMoved = {x:0,y:0};
let isMouseDown = false;
let moved = false;

//testing
let username = localStorage.getItem("worldExplorerUserName");
let password = localStorage.getItem("worldExplorerPswd");
localStorage.setItem("worldExplorerUserName", null);
localStorage.setItem("worldExplorerPswd", null);

bod.onmousemove=(e)=>{
    if(isMouseDown){
        moved = true;
        currentMoved.x += e.movementX/currentScale;
        currentMoved.y += e.movementY/currentScale;
        renderChanges();
    }
}
bod.onmousedown=()=>isMouseDown=true;
bod.onmouseup=()=>isMouseDown=false;

bod.onwheel=(e)=>{
    if(e.deltaY<0){
        currentScale = Math.min(maxScale, currentScale*1.1);
    }
    else{
        currentScale = Math.max(1,currentScale/1.1);
    }
    svg.style.strokeWidth = 1/currentScale;
    renderChanges();
}
document.querySelectorAll("div#contain > svg > path").forEach((z)=>{
    z.onclick=()=>{
        if(moved){
            moved=false;
            return;
        }
            fetch("../../api/countryData",{
                method: "POST",
                body: JSON.stringify({"Alpha-code-3":
                    countriesJSON.filter((y)=>y.alpha2==z.id)[0]["alpha3"]
                }),
                headers:{
                    "Content-Type":"application/json",
                }
            }).then((resp) => {
                return resp.json();
            }).then(
                (x)=>{
                    console.log(x);
                    document.getElementsByClassName("info")[0].innerHTML = `<div><img src="https://flagcdn.com/${z.id.toLowerCase()}.svg"><p class="flagtext">${x["Alpha-code-3"]}</p></div><div><p>${x["Name"]}</p></div><div><p>${x["Currency"]}</p></div><div><p>${x["Languages"].reduce((total,value) => total+`<a target="_" href=${value.Wikipedia}>${value.Name}</a>; `,"")}</p></div><div><p>${x["Climates"].reduce((total,value)=>total+`${value.Name}; `,"")}</p></div><div><button id="newvisit">I WAS HERE</button><button id="delvisit">I WASN'T HERE</button></div>`;
                    
                    //add new visit
                    document.getElementById("newvisit").onclick=()=>{
                        fetch("../../api/modifyVisit",{
                            method:"POST",
                            headers:{
                                "Content-Type":"application/json",
                            },
                            body:JSON.stringify({
                                action:"create",
                                pswd : password,
                                userName : username,
                                country : x["Alpha-code-3"]
                            })
                        }).then((resp)=>{
                            return resp.text();
                        }).then((respJSON)=>{
                            console.log(respJSON);
                        }).catch((err)=>console.error(err));
                    }
                    //remove visit
                    document.getElementById("delvisit").onclick=()=>{
                        fetch("../../api/modifyVisit",{
                            method:"POST",
                            headers:{
                                "Content-Type":"application/json",
                            },
                            body:JSON.stringify({
                                action:"delete",
                                pswd : password,
                                userName : username,
                                country : x["Alpha-code-3"]
                            })
                        }).then((resp)=>{
                            return resp.text();
                        }).then((respJSON)=>{
                            console.log(respJSON);
                        }).catch((err)=>console.error(err));
                    }
                }
            ).catch(error => {
                document.getElementsByClassName("info")[0].innerHTML = `<div><img src="https://flagcdn.com/${z.id.toLowerCase()}.svg"><p class="flagtext">${z.id}</p></div><div><p>${z.attributes["title"].textContent}</p></div>`;
            });
        
    };
});
function renderChanges(){
    svg.style.transform = `scale(${currentScale}) translate(${currentMoved.x}px,${currentMoved.y}px)`;
}