<?php
/**
* @brief Archivo usado para la obtención de todos los usuarios alumnos y docentes del sistema
 */
require 'conexion.php';

$tipo = $_GET['tipo'];

if($tipo == 1){
	$sql = "CALL Select_alumno_nivel($tipo);";
}else if($tipo == 2){
	$sql = "CALL Select_alumno_nivel($tipo);";
}
else if($tipo == 3){
	$sql = "CALL Select_alumno_nivel($tipo);";
}else if($tipo == 4){
	$sql = "CALL Select_alumno_nivel($tipo);";
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