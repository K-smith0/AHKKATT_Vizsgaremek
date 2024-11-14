console.log("here");
let bod = document.querySelectorAll("body")[0];
let svg = document.querySelectorAll("svg")[0];
let cont = document.getElementById("contain");
const maxScale = 20;
let currentScale = 1;
let isMouseDown = false;
let moved = false;
bod.onmousemove=(e)=>{
    if(isMouseDown){
        moved = true;
        window.scrollBy(-e.movementX,-e.movementY);
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
    svg.style.transform = `scale(${currentScale}) translate(${svg.width.baseVal.value*(currentScale-1)/2}px,${svg.height.baseVal.value*(currentScale-1)/2}px)`;
    //window.scrollBy(svg.width.baseVal.value*(currentScale-1)/2,svg.height.baseVal.value*(currentScale-1)/2);
    svg.style.strokeWidth = 1/currentScale;
}
document.querySelectorAll("path").forEach((x)=>{
    x.onclick=()=>{
        if(moved){
            moved=false;
            return;
        }
        console.log(x.attributes["title"].textContent);
    };
    //x.innerHTML=`<title>${x.attributes["title"].textContent}</title>`;
});