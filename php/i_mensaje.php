<?php
/**
* @brief Archivo usado para insertar mensajes
 */
require 'conexion.php';
date_default_timezone_set('America/Mexico_City');

$hoy = date("Y-m-d H:i:s");
$user = $_POST['user'];
$userD = $_POST['userD'];
$cont = $_POST['cont'];

	$sql = "CALL insert_mensaje('$cont', '$hoy', '$user', '$userD', 1);";
	$result = mysqli_query($con1, $sql);
	if($result){
		echo "correcto";
	}else{
		echo "Error";
	}

    mysqli_close($con1);
    ?>