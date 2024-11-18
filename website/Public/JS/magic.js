console.log("here");
let bod = document.querySelectorAll("body")[0];
let svg = document.querySelectorAll("svg")[0];
let cont = document.getElementById("contain");
const maxScale = 500;
let currentScale = 1;
let currentMoved = {x:0,y:0};
let isMouseDown = false;
let moved = false;
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

    //window.scrollBy(svg.width.baseVal.value*(currentScale-1)/2,svg.height.baseVal.value*(currentScale-1)/2);
    svg.style.strokeWidth = 1/currentScale;
    renderChanges();
}
document.querySelectorAll("path").forEach((x)=>{
    x.onclick=()=>{
        if(moved){
            moved=false;
            return;
        }
        document.getElementsByClassName("info")[0].innerHTML = `<p>id: ${x.id}<br>name: ${x.attributes["title"].textContent}</p>`;
        console.log(x.attributes["title"].textContent);
    };
    //x.innerHTML=`<title>${x.attributes["title"].textContent}</title>`;
});
function renderChanges(){
    svg.style.transform = `scale(${currentScale}) translate(${currentMoved.x}px,${currentMoved.y}px)`;
}