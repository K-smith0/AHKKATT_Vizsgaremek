
<?php
    header("Content-Type:application/json");
    function runQuerry($sql,$conn){
        return $conn->query($sql);
    }
    $response = array("status"=>false, "data"=>"unrecognised action");
    $servername = "localhost";
    $username = "root";
    $password = "";
    $database = "ahkkatt";
    $conn = new mysqli($servername,$username,$password,$database);
    $content = json_decode(trim(file_get_contents("php://input")),true);

    $username = $content["userName"];
    $password = $content["pswd"];

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
            case "delete":
                //delete EVERYTHING
                runQuerry("DELETE FROM visits WHERE `User_Name`='$username'",$conn);
                runQuerry("DELETE FROM users WHERE `Name`='$username'",$conn);
            break;
            default:
            echo json_encode($response);
            return;
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