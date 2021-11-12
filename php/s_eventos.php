<?php
/**
* @brief Archivo usado para la obtención de eventos
 */
header('Content-Type: application/json');
require 'conexion.php';
$user = $_GET['user'];
$tipo = $_GET['tipo'];
if($tipo == 1){
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

}else if($tipo == 2){
	$arreglo["data"] = []; 
	$sql1 = mysqli_query($con2, "CALL Select_usuario_alumno('$user')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idA = $row1['Id_Alumno'];

	$sql3 = mysqli_query($con3, "CALL last_periodo()");
    $row3 = mysqli_fetch_assoc($sql3);
    $periodo = $row3['idP'];

    $sql2 = "CALL Select_clase_alumno('$idA', '$periodo');";
	$result = mysqli_query($con4, $sql2);

	while($data2 = mysqli_fetch_assoc($result)) {
		$arrayf = $data2['Id_Clase'];
		$sql = "CALL select_eventosa('$arrayf');";
		$result2 = mysqli_query($con1, $sql);
		if (!$result2) {
			
		}else{
		while($data = mysqli_fetch_assoc($result2)) {
            $arreglo["data"][] = $data;
		}
	}
	}
	echo json_encode($arreglo);


	mysqli_free_result($result);
	//mysqli_free_result($result2);
	mysqli_close($con1);
	mysqli_close($con2);
	mysqli_close($con3);
	mysqli_close($con4);
}
	
	
?>