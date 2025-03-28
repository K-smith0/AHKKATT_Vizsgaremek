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
    $alpha2 = $content["Alpha-code-2"];
    //country: alpha, nev, currency; languages: nev, wiki; climates: nev, discussion
        //first get the country data
    $query = 'SELECT `Alpha-code-2`,`Alpha-code-3`, Name, Currency FROM countries WHERE `Alpha-code-2`="'.$alpha2.'"';
    $countryData = runQuerry($query,$conn)->fetch_assoc();
    $alpha3 = $countryData["Alpha-code-3"];
        //get languages data
    $query = 'SELECT Name, Wikipedia FROM languages_connection JOIN languages ON languages_connection.Language_ID = languages.ID WHERE Country_ID ="'. $alpha3.'"';
    $resp = runQuerry($query,$conn);
    $langs = [];
    while($row = $resp->fetch_assoc()){
        array_push($langs, $row);
    }
        //get climates data
    $query = 'SELECT Name FROM climate_connection JOIN climates ON climate_connection.Climate_ID = climates.ID WHERE Country_ID ="'. $alpha3.'"';
    $resp = runQuerry($query,$conn);
    $climates = [];
    while($row = $resp->fetch_assoc()){
        array_push($climates, $row);
    }
    $respJson = [
        "Alpha-code-2"=> $countryData["Alpha-code-2"],
        "Alpha-code-3" => $alpha3,
        "Name" => $countryData["Name"],
        "Currency" => $countryData["Currency"],
        "Languages" => $langs,
        "Climates" => $climates
    ];
    echo json_encode($respJson);
?>