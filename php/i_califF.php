<?php
/**
* @brief Documento usado para la inserción de calificaciones finales
*/

require 'conexion.php';
date_default_timezone_set('America/Mexico_City');


$clasea = $_POST['clasea'];
$alumno = $_POST['alumno'];
$calif = $_POST['calif'];
$clase = $_POST['clase'];
$hoy = date("Y-m-d H:i:s");



$sql1 = "CALL insert_calificacionf('$calif','$alumno', '$clasea')";
    $result1 = mysqli_query($con1, $sql1);

    $c = mysqli_query($con3, "CALL select_claseTipo('$clase');");
    $fila = mysqli_fetch_assoc($c);
    $nombrec = $fila['Nombre_Clase'];

    $n = mysqli_query($con2, "CALL Select_usuario_alumno_noti('$alumno');");
    $fila2 = mysqli_fetch_assoc($n);
    $nombreU = $fila2['Id_Usuario'];

    $noti2 = "CALL insert_notificacion('Se ha asignado la calificación final de la clase $nombrec', '$hoy',6, 1, '$nombreU');";
    $consulta2 = mysqli_query($con7, $noti2);

    if($result1){
        echo "Correcto";
    }else{
        echo "Error";
    }

    mysqli_close($con1);
?>