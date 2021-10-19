<?php
/**
* @brief Archivo usado para la obtención de los alumnos de determinado padre
 */
require 'conexion.php';

$user = $_POST['user'];


    $sql2 = "CALL select_hijos('$user');";
    
    $result = mysqli_query($con2, $sql2);
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
    mysqli_close($con2);
    mysqli_close($con3);

    ?>