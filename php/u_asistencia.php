<<?php
/**
* @brief Documento usado para la edición de calificaciones parciales
*/

require 'conexion.php';


$asistencia = $_POST['asistencia'];
$usr = $_POST['usr'];



$sql1 = "CALL update_asistencia('$asistencia', '$usr')";
$result1 = mysqli_query($con1, $sql1);

if($result1){
    echo "Correcto";
}else{
    echo "Error";
}

mysqli_close($con1);
?>
