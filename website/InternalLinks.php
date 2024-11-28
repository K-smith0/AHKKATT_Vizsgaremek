<?php
header("Content-Type: application/json");
$links = array("home"=>"./public/pages/home.html","signUp"=>"./public/pages/signUp.html","signIn"=>"./public/pages/signIn.html");
echo json_encode($links);
?>