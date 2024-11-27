<?php
    $path = parse_url($_SERVER['REQUEST_URI'])["path"];
    if(preg_match('*api/*',$path)){
        $phpName = explode("api/",$path);
        $phpName = end($phpName);
        require_once("API/".$phpName.".php");
    }
    else{
        require_once("index.html");
    }
?>