<!DOCTYPE html>
<html>
<?php
		function runQuerry($sql,$conn){
			return $conn->query($sql);
		}
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
			$hash =  password_hash($_POST["pswd"], PASSWORD_DEFAULT);
			$resp = runQuerry("SELECT COUNT(*) AS count FROM users", $conn);
			$ID = $resp->fetch_assoc()["count"];
			$name = $_POST["userName"] . "$ID";
			echo "<h3>Your user name is: $name; (please note the number at the end)</h3>";
			runQuerry("INSERT INTO users(Name, Password_Hash) VALUES (\"$name\", \"$hash\")", $conn);
			runQuerry("COMMIT", $conn);
			echo "<br><h4>Sucessful sign up!</h4>";
		}
		catch(Exception $e){
			runQuerry("ROLLBACK", $conn);
			echo "<span class='error'>the program has encountered an unexpected error, please contact the developers regarding this issue: $e</span>";
		}
		
		
?>
<a href="./">Return to Home page</a>
</html>