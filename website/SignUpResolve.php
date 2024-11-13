<?php
	header("Content-Type:application/json");
		function runQuerry($sql,$conn){
			return $conn->query($sql);
		}
		$response = array("status"=>true, "data"=>null);
		$servername = "localhost";
		$username = "root";
		$password = "";
		$database = "ahkkatt";
		$conn = new mysqli($servername,$username,$password,$database);
		if($conn->connect_error){
			die("connection failed: " . $conn->connect_error);
		}
		else{
		}
		runQuerry('START TRANSACTION', $conn);
		try{
			if($_POST["pswd"] == NULL){
				throw(new Exception("no password"));
			}
			$resp = runQuerry("SELECT ");
			if($_POST["userName"]){

			}
			$hash =  password_hash($_POST["pswd"], PASSWORD_DEFAULT);
			$resp = runQuerry("SELECT COUNT(*) AS count FROM users", $conn);
			$ID = $resp->fetch_assoc()["count"];
			$name = $_POST["userName"];
			runQuerry("INSERT INTO users(Name, Password_Hash) VALUES (\"$name\", \"$hash\")", $conn);
			runQuerry("COMMIT", $conn);
			
			echo "<br><h4>Sucessful sign up!</h4>";
		}
		catch(Exception $e){
			runQuerry("ROLLBACK", $conn);

		}
		
		
?>