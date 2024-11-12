let links = {};
let req = new XMLHttpRequest();
req.open("GET","./public/API/internalLinks.php");
req.onreadystatechange = ()=>{
    if(req.status === 200 && req.readyState === 4){
        console.log(JSON.parse(req.responseText));
        links = JSON.parse(req.responseText);
    }
};
req.send();

function load(target){
    frame.src= links[target];
}