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
$hoy = date("Y-m-d H:i:s");
$clase = $_POST['clase'];

$sql1 = "CALL insert_calificacionp('$calif', '$fecha', '$alumno', '$clasea', '$parcial')";
    $result1 = mysqli_query($con1, $sql1);

    $c = mysqli_query($con3, "CALL select_claseTipo('$clase');");
    $fila = mysqli_fetch_assoc($c);
    $nombrec = $fila['Nombre_Clase'];
    $nivel = $fila['Nivel'];
    $grado = $fila['Grado'];
    $grupo = $fila['Grupo'];

    $n = mysqli_query($con2, "CALL Select_usuario_alumno_noti('$alumno');");
    $fila2 = mysqli_fetch_assoc($n);
    $nombreU = $fila2['Id_Usuario'];
    $nombren = $fila2['Nombre'];
    $nombrep = $fila2['Apellido_Paterno'];
    $nombrem = $fila2['Apellido_Materno'];

    $noti2 = "CALL insert_notificacion('Se ha asignado una calificación al parcial $parcial de la clase $nombrec', '$hoy',6, 1, '$nombreU');";
    $consulta2 = mysqli_query($con7, $noti2);
   

    $p = mysqli_query($con4, "CALL Select_usuario_padre_noti('$alumno');");
    $fila3 = mysqli_fetch_assoc($p);
    $idp = $fila3['Id_Usuario'];

    $noti3 = "CALL insert_notificacion('Se ha asignado una calificación al parcial $parcial de la clase $nombrec de su hijo $nombren $nombrep $nombrem', '$hoy',3, 1, '$idp');";
    $consulta3 = mysqli_query($con5, $noti3);

        $noti1 = "CALL select_supervisor();";
        $consulta1 = mysqli_query($con6, $noti1);
        while($data = mysqli_fetch_assoc($consulta1)) {
            $arrayf = $data['Id_Usuario'];
            $noti4 = "CALL insert_notificacion('Se ha comenzado la captura de las calificaciones del parcial $parcial de la materia de $nombrec de $nivel del $grado $grupo', '$hoy',2, 1, '$arrayf');";
        $consulta4 = mysqli_query($con8, $noti4);
        }




    if($result1){
        echo "Correcto";
    }else{
        echo "Error";
    }

    mysqli_close($con1);
?>