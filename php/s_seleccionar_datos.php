<?php
/**
* @brief Archivo usado para la obtención de todos los usuarios docente y periodos en el sistema
* para después enviarlo por el método Json.
 */
require 'conexion.php';

$tipo = $_GET['tipo'];

if($tipo == 1){
	$sql = "CALL Select_usuario_docente();";
}
else if($tipo == 2) {
	$sql = "CALL select_periodo();";
}
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