<?php
    $path = parse_url($_SERVER['REQUEST_URI'])["path"];
    $path = explode("/",$path);
    $path = end($path);
    switch($path){
        case "":
            require_once("index.html");
        break;
        case "signUp":
            require_once("SignUpResolve.php");
        break;
        case "signIn":
            require_once("SignInResolve.php");
        break;
        case "links":
            require_once("InternalLinks.php");
        break;
        case "":

        break;
    }


?>