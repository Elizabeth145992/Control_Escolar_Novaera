<?php
/**
* @brief Archivo usado para la obtención de la clase determinada
 */
require 'conexion.php';
$clase = $_POST['clase'];

	$sql = "CALL select_actividad('$clase');";
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