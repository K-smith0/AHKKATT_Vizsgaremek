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

		if($conn->connect_error){
			die("connection failed: " . $conn->connect_error);
		}
		else{
		}
		runQuerry('START TRANSACTION', $conn);
		try{
			if($content["pswd"] == NULL){
				throw(new Exception("no password"));
			}
			$resp = runQuerry("SELECT Name FROM users",$conn);
			while($name = $resp->fetch_assoc()){
				if($content["userName"] == $name["Name"]){
					throw(new Exception("username already in use"));
				}
			}
			if($content["testing"]){
				runQuerry("ROLLBACK", $conn);
				$response["status"] = true;
				$response["data"] = "test resp: ok";
				echo json_encode($response);
				return;
			}
			$hash =  password_hash($content["pswd"], PASSWORD_DEFAULT);
			$name = $content["userName"];
			runQuerry("INSERT INTO users(Name, Password_Hash) VALUES (\"$name\", \"$hash\")", $conn);
			runQuerry("COMMIT", $conn);
			$response["status"] = true;
			$response["data"] = "all good";
			echo json_encode($response);
		}
		catch(Exception $e){
			runQuerry("ROLLBACK", $conn);
			$response["status"] = false;
			$response["data"] = "Error: " . $e->getMessage();
			echo json_encode($response);
		}
?>