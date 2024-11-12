let links = {};
let req = new XMLHttpRequest();
req.open("GET","./public/API/internalLinks.php");
req.onreadystatechange = ()=>{
    if(req.status === 200 && req.readyState === 4){
        console.log(JSON.parse(req.responseText));
        links = JSON.parse(req.responseText);
        start();
    }
};
req.send();

function load(target){
    console.log(links,target);
    req = new XMLHttpRequest();
    req.open("GET",links[target]);
    req.onreadystatechange = () =>{
        if(req.status === 200 && req.readyState === 4){
            console.log(req.responseText);
            document.getElementById("frame").innerHTML = req.responseText;
        }
    }
    req.send();

}



function start(){
    req = new XMLHttpRequest();
    req.open("GET",links["home"]);
    req.onreadystatechange = () =>{
        if(req.status === 200 && req.readyState === 4){
            console.log(req.responseText);
            document.getElementById("frame").innerHTML = req.responseText;
            document.getElementById("signUp").onclick = ()=>{
                load("signUp");
            };
            document.getElementById("signIn").onclick = ()=>{
                load("signIn");
            };
        }
    }
    req.send();
}