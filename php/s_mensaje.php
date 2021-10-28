<?php
/**
* @brief Archivo usado para la obtención de los alumnos del sistema
 */
require 'conexion.php';

$tipo = $_GET['tipo'];


if($tipo==1){
    $user = $_GET['user'];

	$sql = "CALL select_mensaje1('$user');";
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

}else if($tipo==2){
    $user = $_GET['user'];
    $usrD = $_GET['usrD'];

	$sql = "CALL select_mensaje2('$user', '$usrD');";
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

}else if($tipo == 3){
	$user = $_GET['user'];
    $usrD = $_GET['usrD'];

	$sql = "CALL update_mensajeE('$user', '$usrD');";
	$result = mysqli_query($con1, $sql);

}else if($tipo==4){

	$sql = "CALL select_usuariosAll();";
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

}else if($tipo==5){
	$user = $_GET['user'];
	$sql = "CALL select_mensaje1('$user');";
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

}
	mysqli_close($con1);
?>