let bod = document.querySelectorAll("body")[0];
let svg = document.querySelectorAll("svg")[0];
let cont = document.getElementById("contain");
let tabContent = document.getElementById("tab-content");
let CountryList = true;
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
if(username=='null' || password=='null' || username==null || password==null) {
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

let prevTouch = {x:0,y:0};
bod.ontouchstart=(e)=>{
    const touch = e.touches[0];
    console.log(touch);
    prevTouch = {x: touch.pageX, y: touch.pageY};
}
bod.ontouchmove=(e)=>{
    const touch = e.changedTouches[0];
    const movementX = touch.pageX-prevTouch.x;
    const movementY = touch.pageY-prevTouch.y;
    currentMoved.x += movementX/currentScale;
    currentMoved.y += movementY/currentScale;
    prevTouch = {x: touch.pageX, y: touch.pageY};
    renderChanges();
}


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
                        if(document.getElementById(`${x["Alpha-code-3"]}`) != null) return;
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
                        if(CountryList){
                            let d = document.createElement("div");
                            d.id=`${x["Alpha-code-3"]}`;
                            d.classList.add("listdata");
                            list.appendChild(d);
                            d.innerHTML=`<div><img src="https://flagcdn.com/${x["Alpha-code-2"].toLowerCase()}.svg"></div><div><p>${x["Alpha-code-3"]}</p><p>${x["Name"]}</p></div><div><button class="${document.getElementById(x["Alpha-code-2"]).classList[0]}" onclick="changeColour(${x["Alpha-code-2"]},event)"></button></div>`;
                        }
                        localStorage.setItem(`AHKKATT_${username}_${z.id}`,document.getElementById(z.id).classList);
                    }
                    //remove visit
                    document.getElementById("delvisit").onclick=()=>{
                        if(CountryList)document.getElementById(x["Alpha-code-3"]).remove();
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
                        localStorage.setItem(`AHKKATT_${username}_${z.id}`,document.getElementById(z.id).classList);
                    }
                }
            ).catch(error => {
                document.getElementsByClassName("info")[0].innerHTML = `<div><img src="https://flagcdn.com/${z.id.toLowerCase()}.svg"><p class="flagtext">${z.id}</p></div><div><p>${z.attributes["title"].textContent}</p></div>`;
            });
        
    };
});

//load visited
function loadVisited(){        
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
            if (localStorage.getItem(`AHKKATT_${username}_${code}`)=='null' ||localStorage.getItem(`AHKKATT_${username}_${code}`)==null) document.getElementById(code).classList = (`visited${Math.floor(Math.random()*4+1)}`);
            else document.getElementById(code).classList = localStorage.getItem(`AHKKATT_${username}_${code}`);
        });
        for (x of svg.children) localStorage.setItem(`AHKKATT_${username}_${x.id}`,x.classList);
        let list=document.createElement("div");
        list.id = "list";
        document.getElementById("sidebarContent").appendChild(list);
        if(CountryList){
            respJSON.data.forEach(data => {
                let d = document.createElement("div");
                d.id=`${data["Alpha-code-3"]}`;
                d.classList.add("listdata");
                d.innerHTML=`<div><img src="https://flagcdn.com/${data["Alpha-code-2"].toLowerCase()}.svg"></div><div><p>${data["Alpha-code-3"]}</p><p>${data["Name"]}</p></div><div><button class="${document.getElementById(data["Alpha-code-2"]).classList[0]}" onclick="changeColour(${data["Alpha-code-2"]},event)"></button></div>`;
                list.appendChild(d);
            });
        }
    });
}
loadVisited();
function changeColour(path,e){
    let element = document.getElementById(path.id);
    let styleclass = element.classList[0];
    styleclass = styleclass.replace(styleclass.charAt(styleclass.length-1), parseInt(styleclass.charAt(styleclass.length-1))+1);
    if (styleclass == "visited5") styleclass = "visited1";
    element.classList = styleclass;
    e.target.classList = styleclass;
    localStorage.setItem(`AHKKATT_${username}_${path.id}`,element.classList);
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
function eraseData(){
    let pswdCheck = prompt("Are you sure you want to delete your data? Enter your password below to confirm:","");
    if(pswdCheck == null){
        return;
    }
    fetch("../../api/modifyAccount",{
        method:"POST",
        headers:{
            "Content-Type":"application/json",
        },
        body:JSON.stringify({
            action:"reset",
            pswd : pswdCheck,
            userName : username
        })
    }).then((resp)=>{
        return resp.json();
    }).then((respJSON)=>{
        //no action yet
    }).catch((err)=>console.error(err));
    localStorage.setItem(`AHKKATT_${username}_visited${1}`, "#dda0dd");
    localStorage.setItem(`AHKKATT_${username}_visited${2}`, "#f08080");
    localStorage.setItem(`AHKKATT_${username}_visited${3}`, "#f0e68c");
    localStorage.setItem(`AHKKATT_${username}_visited${4}`, "#20b2aa");
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
        <div class="danger" title="delete user data">
        <svg width="40" height="40" viewBox="0 0 24 24" fill="none" onclick="eraseData()">
            <path  fill-rule="evenodd" clip-rule="evenodd" d="M12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2ZM11.6064 7.67004C12.7197 6.55668 13.2764 6 13.9682 6C14.6599 6 15.2166 6.55668 16.33 7.67004C17.4433 8.7834 18 9.34008 18 10.0318C18 10.7236 17.4433 11.2803 16.33 12.3936L13.7114 15.0122L8.98781 10.2886L11.6064 7.67004ZM7.92715 11.3493L12.6507 16.0729L12.3936 16.33C11.2803 17.4433 10.7236 18 10.0318 18C9.34008 18 8.7834 17.4433 7.67004 16.33C6.55668 15.2166 6 14.6599 6 13.9682C6 13.2764 6.55668 12.7197 7.67004 11.6064L7.92715 11.3493Z"/>
        </svg>
        </div>
    `;
}
document.getElementById("settings").onclick = ()=>{
    openTab();
    tabContent.innerHTML = `
        <input id="col1" type="color" value="${localStorage.getItem(`AHKKATT_${username}_visited${1}`)}" oninput="changeCol(visited1)"/>
        <input id="col2" type="color" value="${localStorage.getItem(`AHKKATT_${username}_visited${2}`)}" oninput="changeCol(visited2)"/>
        <input id="col3" type="color" value="${localStorage.getItem(`AHKKATT_${username}_visited${3}`)}" oninput="changeCol(visited3)"/>
        <input id="col4" type="color" value="${localStorage.getItem(`AHKKATT_${username}_visited${4}`)}" oninput="changeCol(visited4)"/>
    `;
}
//colours load
for(let i = 1; i < 5; i++){
    let col = localStorage.getItem(`AHKKATT_${username}_visited${i}`);
    if(col == 'null' || col == null) continue;
    document.getElementById(`visited${i}`).innerHTML = `
    .visited${i}{
      fill: ${col};
      background-color: ${col};
    }
    `
}
function changeCol(whose){
    let col = document.getElementById(`col${whose.id[7]}`).value;
    localStorage.setItem(`AHKKATT_${username}_${whose.id}`,col);
    whose.innerHTML = `
        .${whose.id}{
          fill: ${col};
          background-color: ${col};
        }
    `
}

document.getElementById("visits").onclick=()=>{
    hr.classList.remove("barright");
    hr.classList.add("barleft");
    CountryList=true;
    document.getElementById("sidebarContent").innerHTML = "";
    loadVisited();
}
let cols = {
    "name":"countries.Name",
    "currency":"countries.Currency",
    "climate":"climates.Name",
    "language":"languages.Name",
    "continent":"countries.Continent"
};
document.getElementById("query").onclick=()=>{
    hr.classList.remove("barleft");
    hr.classList.add("barright");
    CountryList=false;
    let form = document.createElement("form");
    form.id="searchForm";
        
    document.getElementById("sidebarContent").innerHTML = "";
    document.getElementById("sidebarContent").appendChild(form);
    
    form.innerHTML = `
        <label>Name: </label><input type="text" name="name"/>
        <label>Language: </label><input type="text" name="language"/>
        <label>Climate: </label><input type="text" name="climate"/>
        <label>Currency: </label><input type="text" name="currency"/>
        <label>Continent: </label><input type="text" name="continent"/>
        <button type="submit">Search</button>
    `;
    form.onsubmit = (e)=>{
        e.preventDefault();
        let params = [];
        document.querySelectorAll("#searchForm input").forEach((x)=>{
            if(x.value!=""){
                params.push({column: cols[x.name], cond: x.value});
            }
        });
        fetch("../../api/countryQuery",{
            method:"POST",
            headers:{
                "Content-Type":"application/json"
            },
            body:JSON.stringify({
                "params":params  
            })
        }).then(resp=>resp.json()).then(respJSON=>{
            console.log(respJSON);
            let list = document.getElementById("list")
            if(list ==null){
                list=document.createElement("div");
                list.id = "list";
            }
            list.innerHTML = "";
            document.getElementById("sidebarContent").appendChild(list);
            respJSON.data.forEach(data => {
                console.log(data);
                let d = document.createElement("div");
                d.id=`${data["Alpha-code-3"]}`;
                d.classList.add("listdata");
                d.onclick = ()=>{selectCountry(document.getElementById(data["Alpha-code-2"]));}
                d.innerHTML=`<div><img src="https://flagcdn.com/${data["Alpha-code-2"].toLowerCase()}.svg"></div><div><p>${data["Alpha-code-3"]}</p><p>${data["Name"]}</p></div>`;
                list.appendChild(d);
            });
        });
    };
}
function selectCountry(path){
    path.onclick();
}
document.querySelectorAll("div#tab-container > div > div")[0].onclick=()=>{
    document.getElementById("tab-container").classList.remove("wider");
    document.getElementById("tab-container").classList.add("thinner");

}
function openTab(){
    document.getElementById("tab-container").classList.remove("thinner");
    document.getElementById("tab-container").classList.add("wider");
}