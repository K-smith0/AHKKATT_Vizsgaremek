<!DOCTYPE html>
<html>
<?php
	$path = parse_url($_SERVER['REQUEST_URI'])["path"];
	$pathArray = explode('/',$path);
	$subPath = end($pathArray);
	//echo($subPath .'<br>');
	
	switch($subPath){
		default:
			echo "<a href='./signUp' target='_self'>Sign up</a>";
			break;
		case "signUp":
			require_once("SignUp.html");
			break;
		case "signUpResolve":
			//(...)
			require_once("SignUpResolve.php");
			break;
	}

?>
</html>