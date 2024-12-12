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
    $query = "SELECT countries.Name as CounName, countries.`Alpha-code-2`, countries.`Alpha-code-3`, countries.Currency, climates.Name as ClimName FROM countires JOIN climate_connection ON climate_connection.Country_ID = countries.`Alpha-code-3` JOIN climates ON climate_connection.ClimateID = climates.ID WHERE";
    
    foreach($content["params"] as $line){
        $query .= $line["column"] ."LIKE". $line["cond"] ."AND";
    }
    $resp = runQuerry($query, $conn);
    $response["data"] = [];
    while($row = $resp->fetch_assoc()){
        array_push($response->data,[
            "Name"=>$row["CounName"],
            "Aplha-code-3"=>$row["Alpha-code-3"],
            "Alpha-code-2"=>$row["Alpha-code-2"],
            "Currency"=>$row["Currency"],
            "Climate"=>$row["ClimName"]
        ]);
    }
    $response["status"] = true;
    echo json_encode($response);
?>