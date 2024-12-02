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

    $username = $content["userName"];
    $password = $content["pswd"];
    $countryCode = $content["country"];

    //get password hash
    $resp = runQuerry("SELECT * FROM users WHERE Name = '$username';",$conn);
    $resp = $resp->fetch_assoc();
    //check password
    if(!password_verify($password,$resp["Password_Hash"])){
        $response["status"] = false;
        $response["data"] = "Invalid credentials";
        echo json_encode($response);
        return;
    }

    //do the action
    try{
        runQuerry("START TRANSACTION",$conn);
        switch($content["action"]){
            case "create":
                runQuerry("INSERT IGNORE INTO visits(`Country_code`, `User_Name`) VALUES ('$countryCode', '$username')",$conn);
            break;
            case "delete":
                runQuerry("DELETE FROM visits WHERE `Country_code`='$countryCode' AND `User_Name`='$username'",$conn);
                //not yet
            break;
        }
        runQuerry("COMMIT",$conn);
        $response["status"] = true;
        $response["data"] = "ok";
        echo json_encode($response);
        return;
    }
    catch(Exception $e){
        runQuerry("ROLLBACK",$conn);
        $response["status"] = false;
        $response["data"] = $e->getMessage();
        echo json_encode($response);
        return;
    }
                
?>