<?php
/**
* @brief Archivo que sirve para el inicio de las variables para el inicio de sesión 
* de un usuario.
 */
	session_start();
	if(!isset($_SESSION['userID'])){
		echo "Error";
	}
	else{
		echo $_SESSION['userID'];
	}	
?>