<?php
/**
* @brief Documento usado para la inserción de calificaciones finales
*/

require 'conexion.php';



$clasea = $_POST['clasea'];
$alumno = $_POST['alumno'];
$calif = $_POST['calif'];



$sql1 = "CALL insert_calificacionf('$calif','$alumno', '$clasea')";
    $result1 = mysqli_query($con1, $sql1);

    if($result1){
        echo "Correcto";
    }else{
        echo "Error";
    }

    mysqli_close($con1);
?>