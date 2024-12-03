<?php
    header("Content-Type:application/json");
    function runQuerry($sql,$conn){
        return $conn->query($sql);
    }
    $response = array("status"=>false, "data"=>null);
    $servername = "localhost";
    $username = "root";
    $password = "";
    $database = "ahkkatt";
    $conn = new mysqli($servername,$username,$password,$database);
    $content = json_decode(trim(file_get_contents("php://input")),true);
    $username = $content["username"];
    $password = $content["pswd"];
    
    $resp = runQuerry("SELECT * FROM users WHERE Name = '$username';",$conn);
    $resp = $resp->fetch_assoc();
    if(!password_verify($password,$resp["Password_Hash"])){
        $response["status"] = false;
        $response["data"] = "Invalid credentials";
        echo json_encode($response);
        return;
    }
    $query = "SELECT `Alpha-code-2` FROM countries JOIN visits ON countries.`Alpha-code-3`=visits.Country_code JOIN users ON visits.User_Name=users.Name WHERE users.Name = '$username';";
    $resp=runQuerry($query,$conn);
    $codes = [];
    while($row = $resp->fetch_assoc()){
        array_push($codes,$row["Alpha-code-2"]);
    }
    $response["status"]=true;
    $response["data"]=$codes;
    echo json_encode($response);
    return;
?>