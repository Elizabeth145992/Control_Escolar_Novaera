<?php
/**
* @brief Archivo usado para la obtención de clases para los alumnos
 */
require 'conexion.php';

$user = $_POST['user'];


$sql1 = mysqli_query($con1, "CALL Select_usuario_alumno('$user')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idA = $row1['Id_Alumno'];

    $sql3 = mysqli_query($con3, "CALL last_periodo()");
    $row3 = mysqli_fetch_assoc($sql3);
    $periodo = $row3['idP'];

    $sql2 = "CALL Select_clase_alumno('$idA', '$periodo');";
    
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