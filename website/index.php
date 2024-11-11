<?php
	$path = parse_url($_SERVER['REQUEST_URI'])["path"];
	$pathArray = explode('/',$path);
	$subPath = end($pathArray);
	//echo($subPath .'<br>');
	
	switch($subPath){
		case "signUp":
			require_once("SignUp.html");
			break;
		case "signUpResolve":
			//(...)
			require_once("SignUpResolve.php");
			break;
		default:
			echo "<a href='./signUp' target='_self'>Sign up</a>";
			break;
	}

?>