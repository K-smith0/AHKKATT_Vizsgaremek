console.log("here");
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
console.log(username,password);
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
document.querySelectorAll("div#contain > svg > path").forEach((x)=>{
    x.onclick=()=>{
        if(moved){
            moved=false;
            return;
        }
        console.log('just before try');
        try{
            document.getElementsByClassName("info")[0].innerHTML = `<div><img src="https://flagcdn.com/${x.id.toLowerCase()}.svg"><p class="flagtext">${countriesJSON.filter((y)=>y.alpha2==x.id)[0]["alpha3"]}</p></div><div><p>${countriesJSON.filter((y)=>y.alpha2==x.id)[0]["name"]}</p></div>`;
            fetch("../../api/countryData",{
                method: "POST",
                body: JSON.stringify({"Alpha-code-3":
                    countriesJSON.filter((y)=>y.alpha2==x.id)[0]["alpha3"]
                }),
                headers:{
                    "Content-Type":"application/json",
                }
            }).then((resp) => {
                return resp.text();
            }).then(
                (x)=>{
                    console.log(x);
                }
            );
            console.log('good');
        }
        catch{
            console.log('catched');
            document.getElementsByClassName("info")[0].innerHTML = `<div><img src="https://flagcdn.com/${x.id.toLowerCase()}.svg"><p class="flagtext">${x.id}</p></div><div><p>${x.attributes["title"].textContent}</p></div>`;
        }
        
    };
});
function renderChanges(){
    svg.style.transform = `scale(${currentScale}) translate(${currentMoved.x}px,${currentMoved.y}px)`;
}