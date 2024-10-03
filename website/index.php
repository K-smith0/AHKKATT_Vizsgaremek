<!DOCTYPE html>
<html>
<?php
	$path = parse_url($_SERVER['REQUEST_URI'])["path"];
	//echo($path.'<br>');
	switch($path){
		case "./":
			echo "<a href='./signUp' target='_self'>Sign up</a>";
			break;
		case "./signUp":
			require_once("SignUp.html");
			break;
		case "./signUpResolve":
			//(...)
			require_once("SignUpResolve.php");
			break;
	}

?>
</html>