let bod = document.querySelectorAll("body")[0];
let svg = document.querySelectorAll("svg")[0];
let cont = document.getElementById("contain");
let tabContent = document.getElementById("tab-content");
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

svg.onwheel=(e)=>{
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
                        let d = document.createElement("div");
                        d.id=`${x["Alpha-code-3"]}`;
                        d.classList.add("listdata");
                        list.appendChild(d);
                        z.classList = "";
                        z.classList.add(`visited${Math.floor(Math.random()*4+1)}`)
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
                        d.innerHTML=`<div><img src="https://flagcdn.com/${x["Alpha-code-2"].toLowerCase()}.svg"></div><div><p>${x["Alpha-code-3"]}</p><p>${x["Name"]}</p></div><div><button class="${document.getElementById(x["Alpha-code-2"]).classList[0]}" onclick="changeColour(${x["Alpha-code-2"]},event)"></button></div>`;
                    }
                    //remove visit
                    document.getElementById("delvisit").onclick=()=>{
                        document.getElementById(x["Alpha-code-3"]).remove();
                        z.classList = "";
                        z.classList.add("unvisited");
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
    respJSON.data.map((row)=>row["Alpha-code-2"]).forEach((code)=>{
        document.getElementById(code).classList.remove("unvisited");
        document.getElementById(code).classList.add(`visited${Math.floor(Math.random()*4+1)}`);
    });
    let list=document.getElementById("list");
    respJSON.data.forEach(data => {
        let d = document.createElement("div");
        d.id=`${data["Alpha-code-3"]}`;
        d.classList.add("listdata");
        d.innerHTML=`<div><img src="https://flagcdn.com/${data["Alpha-code-2"].toLowerCase()}.svg"></div><div><p>${data["Alpha-code-3"]}</p><p>${data["Name"]}</p></div><div><button class="${document.getElementById(data["Alpha-code-2"]).classList[0]}" onclick="changeColour(${data["Alpha-code-2"]},event)"></button></div>`;
        list.appendChild(d);
    });
});
function changeColour(path,e){
    let element = document.getElementById(path.id);
    let styleclass = element.classList[0];
    styleclass = styleclass.replace(styleclass.charAt(styleclass.length-1), parseInt(styleclass.charAt(styleclass.length-1))+1);
    if (styleclass == "visited5") styleclass = "visited1";
    element.classList = styleclass;
    e.target.classList = styleclass;
}
function renderChanges(){
    svg.style.transform = `scale(${currentScale}) translate(${currentMoved.x}px,${currentMoved.y}px)`;
}
document.getElementById("signOut").onclick=()=>{
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
function deleteAccount(){
    let pswdCheck = prompt("Are you sure you want to delete your account? This action will PERMANENTLY delete all data associated with it! Enter your password below to confirm:","");
    if(pswdCheck == null){
        return;
    }
    fetch("../../api/modifyAccount",{
        method:"POST",
        headers:{
            "Content-Type":"application/json",
        },
        body:JSON.stringify({
            action:"delete",
            pswd : pswdCheck,
            userName : username
        })
    }).then((resp)=>{
        return resp.json();
    }).then((respJSON)=>{
        //resdirect if successful
        if(respJSON["status"]){
            let a = window.parent.document.createElement("a");
            a.href="../../index.html";
            a.click();
        }
        console.log(respJSON);
    }).catch((err)=>console.error(err));
    
}
document.getElementById("profile").onclick=()=>{
    openTab();
    tabContent.innerHTML = `
        <div class="danger" title="delete account" onclick="deleteAccount()">
        <svg width="40" height="40" viewBox="123 199.5 21 21">
            <g stroke="none" fill-rule="evenodd">
                <path d="M130.35,216 L132.45,216 L132.45,208 L130.35,208 L130.35,216 Z M134.55,216 L136.65,216 L136.65,208 L134.55,208 L134.55,216 Z M128.25,218 L138.75,218 L138.75,206 L128.25,206 L128.25,218 Z M130.35,204 L136.65,204 L136.65,202 L130.35,202 L130.35,204 Z M138.75,204 L138.75,200 L128.25,200 L128.25,204 L123,204 L123,206 L126.15,206 L126.15,220 L140.85,220 L140.85,206 L144,206 L144,204 L138.75,204 Z" id="delete-[#1487]">
                </path>
            </g>
        </svg>
        </div>
    `;
}

document.getElementById("visits").onclick=()=>{
    hr.classList.remove("barright");
    hr.classList.add("barleft");
}
document.getElementById("query").onclick=()=>{
    hr.classList.remove("barleft");
    hr.classList.add("barright");
}
document.querySelectorAll("div#tab-container > div > div")[0].onclick=()=>{
    document.getElementById("tab-container").classList.remove("wider");
    document.getElementById("tab-container").classList.add("thinner");

}
function openTab(){
    document.getElementById("tab-container").classList.remove("thinner");
    document.getElementById("tab-container").classList.add("wider");
}