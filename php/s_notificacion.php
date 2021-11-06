<?php
/**
* @brief Archivo usado para la obtención de los alumnos del sistema
 */
require 'conexion.php';

$tipo = $_GET['tipo'];


if($tipo==5){
   
	$sql = "CALL select_notificacion('$tipo');";
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

}else if($tipo == 10){
	$noti = $_GET['noti'];
	$sql2 = "CALL update_notificacion('$noti')";
	$result1 = mysqli_query($con1, $sql2);
	if (!$result) {
		echo "Error";
    }else{
		echo "Correcto";
	}
}else if($tipo==1){
   $user = $_GET['user'];
	$sql = "CALL select_notificacionDocente('$tipo', '$user');";
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

}else if($tipo==6){
   $user = $_GET['user'];
	$sql = "CALL select_notificacionDocente('$tipo', '$user');";
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

}else if($tipo==3){
	$user = $_GET['user'];
	 $sql = "CALL select_notificacionDocente('$tipo', '$user');";
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
	 $sql = "CALL select_notificacionDocente('$tipo', '$user');";
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
 
 }else if($tipo==4){
	$user = $_GET['user'];
	 $sql = "CALL select_notificacionDocente('$tipo', '$user');";
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
?>