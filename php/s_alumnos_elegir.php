<?php
/**
* @brief Archivo usado para la obtención de los alumnos del sistema
 */
require 'conexion.php';


	$sql = "CALL select_alumnos_elegir();";
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