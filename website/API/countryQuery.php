<?php
    header("Content-Type:application/json");
    function runQuerry($sql,$conn){
        return $conn->query($sql);
    }
    $response = array("status"=>false);
    $servername = "localhost";
    $username = "root";
    $password = "";
    $database = "ahkkatt";
    $conn = new mysqli($servername,$username,$password,$database);
    $content = json_decode(trim(file_get_contents("php://input")),true);
    $query = "SELECT countries.Name as CounName, countries.`Alpha-code-2`, countries.`Alpha-code-3`, countries.Currency, climates.Name as ClimName, languages.Name as LangName
        FROM countries
        JOIN climate_connection ON climate_connection.Country_ID = countries.`Alpha-code-3`
        JOIN climates ON climate_connection.Climate_ID = climates.ID
        JOIN languages_connection ON languages_connection.Country_ID = countries.`Alpha-code-3`
        JOIN languages ON languages_connection.Language_ID = languages.ID";
    
    if(count($content["params"])!=0){$query.="\nWHERE";}
    foreach($content["params"] as $line){
        $query .= "\n" . $line["column"] ." LIKE '%". $line["cond"] ."%' AND";
    }
    $query = substr($query, 0,strlen($query)-3);
    $resp = runQuerry($query, $conn);
    $response["data"] = [];
    while($row = $resp->fetch_assoc()){
        array_push($response["data"],[
            "Name"=>$row["CounName"],
            "Aplha-code-3"=>$row["Alpha-code-3"],
            "Alpha-code-2"=>$row["Alpha-code-2"],
            "Currency"=>$row["Currency"],
            "Climate"=>$row["ClimName"],
            "Language"=>$row["LangName"]
        ]);
    }
    $response["status"] = true;
    echo json_encode($response);
?>