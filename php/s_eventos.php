<?php
/**
* @brief Archivo usado para la obtención de eventos
 */
header('Content-Type: application/json');
require 'conexion.php';
$user = $_GET['user'];
$tipo = $_GET['tipo'];

	$sql = "CALL select_eventos('$user');";
	$result = mysqli_query($con1, $sql);
	$arreglo["data"] = []; 
	if (!$result) {
		echo "Error";
    }
    else{
		while($data = mysqli_fetch_assoc($result)) {
            $arreglo["data"][] = $data;
		}
		echo json_encode($arreglo);
	} 

	mysqli_free_result($result);
	mysqli_close($con1);
?>