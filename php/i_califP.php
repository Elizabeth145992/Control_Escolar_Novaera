<?php
/**
* @brief Documento usado para la inserción de calificaciones parciales
*/

require 'conexion.php';
date_default_timezone_set('America/Mexico_City');


$clasea = $_POST['clasea'];
$alumno = $_POST['alumno'];
$parcial = $_POST['parcial'];
$calif = $_POST['calif'];
$fecha = date('Y-m-d');


$sql1 = "CALL insert_calificacionp('$calif', '$fecha', '$alumno', '$clasea', '$parcial')";
    $result1 = mysqli_query($con1, $sql1);

    if($result1){
        echo "Correcto";
    }else{
        echo "Error";
    }

    mysqli_close($con1);
?>