<!DOCTYPE html>
<html>
<?php
	$path = parse_url($_SERVER['REQUEST_URI'])["path"];
	//echo($path.'<br>');
	switch($path){
		case "/13G/ahkkatt/":
			echo "<a href='/13G/ahkkatt/signUp' target='_self'>Sign up</a>";
			break;
		case "/13G/ahkkatt/signUp":
			require_once("SignUp.html");
			break;
		case "/13G/ahkkatt/signUpResolve":
			//(...)
			require_once("SignUpResolve.php");
			break;
	}

?>
</html>