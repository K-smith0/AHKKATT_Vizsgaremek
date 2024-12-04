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
let hr = document.querySelectorAll("hr")[0];

//testing
let username = localStorage.getItem("worldExplorerUserName");
let password = localStorage.getItem("worldExplorerPswd");
if(username=='null' || password=='null') {
    //instant redirect
    let a = window.parent.document.createElement("a");
    a.href="../../index.html";
    a.click();
};

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
    z.classList.add("unvisited");
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
                    document.getElementsByClassName("info")[0].innerHTML = `<div><img src="https://flagcdn.com/${z.id.toLowerCase()}.svg"><p class="flagtext">${x["Alpha-code-3"]}</p></div><div><p>${x["Name"]}</p></div><div><p>${x["Currency"]}</p></div><div><p>${x["Languages"].reduce((total,value) => total+`<a target="_" href=${value.Wikipedia}>${value.Name}</a>; `,"")}</p></div><div><p>${x["Climates"].reduce((total,value)=>total+`${value.Name}; `,"")}</p></div><div class="buttons"><button id="newvisit">I WAS HERE</button><button id="delvisit">I WASN'T HERE</button></div>`;
                    
                    //add new visit
                    document.getElementById("newvisit").onclick=()=>{
                        z.innerHTML="";
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
                            return resp.json();
                        }).then((respJSON)=>{
                            console.log(respJSON);
                        }).catch((err)=>console.error(err));
                    }
                    //remove visit
                    document.getElementById("delvisit").onclick=()=>{
                        z.style.fill="whitesmoke";
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
                            return resp.json();
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

//load visited
fetch("../../api/getVisited",{
    method:"POST",
    headers:{
        "Content-Type":"application/json"
    },
    body:JSON.stringify({
        "username":username,
        "pswd":password     
    })
}).then(resp=>{
    return resp.json();
}).then(respJSON=>{
    /*respJSON["data"].forEach((code)=>{
        z=document.getElementById(code);
        z.innerHTML="";
        let st = document.createElement("style");
        st.textContent = `path{fill:${"hsl("+Math.floor(Math.random()*360)+",60%,70%)"};}`
        z.appendChild(st);
    });*/
});

function renderChanges(){
    svg.style.transform = `scale(${currentScale}) translate(${currentMoved.x}px,${currentMoved.y}px)`;
}
document.getElementById("signOut").onclick=()=>{
    console.log("works");
    //unset variables
    password = null;
    username = null;
    localStorage.setItem("worldExplorerUserName",null);
    localStorage.setItem("worldExplorerPswd",null);
    //redirect
    let a = window.parent.document.createElement("a");
    a.href="../../index.html";
    a.click();
}
document.getElementById("visits").onclick=()=>{
    hr.classList.remove("barright");
    hr.classList.add("barleft");
}
document.getElementById("query").onclick=()=>{
    hr.classList.remove("barleft");
    hr.classList.add("barright");
}