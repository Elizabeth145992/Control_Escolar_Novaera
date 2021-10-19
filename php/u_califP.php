<?php
/**
* @brief Documento usado para la edición de calificaciones parciales
*/

require 'conexion.php';
date_default_timezone_set('America/Mexico_City');

$caliE = $_POST['caliE'];
$idcali = $_POST['idcali'];
$fecha = date('Y-m-d');


$sql1 = "CALL update_calP('$caliE', '$idcali', '$fecha')";
$result1 = mysqli_query($con1, $sql1);

if($result1){
    echo "Correcto";
}else{
    echo "Error";
}

mysqli_close($con1);
mysqli_close($con2);
mysqli_close($con3);


?>