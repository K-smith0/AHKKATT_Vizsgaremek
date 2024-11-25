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

    $password = $content["pswd"];
    $username = $content["userName"];

    $resp = runQuerry("SELECT * FROM users WHERE Name = '$username';",$conn);
    if($resp->num_rows == 0){
        $response["status"] = false;
        $response["data"] = "no user registered with this username";
        echo json_encode($response);
        return;
    }
    $resp = $resp->fetch_assoc();
    if(password_verify($password,$resp["Password_Hash"])){
        $response["status"] = true;
        $response["data"] = "no comment";
        echo json_encode($response);
        return;
    }
    else{
        $response["status"] = false;
        $response["data"] = "incorrect password or username";
        echo json_encode($response);
        return;
    }

?>