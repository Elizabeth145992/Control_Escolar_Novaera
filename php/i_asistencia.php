<?php
/**
* @brief Documento usado para la inserción de asistencias
*/

require 'conexion.php';


$fecha = $_POST['fecha'];
$usuario = $_POST['usuario'];
$alumno = $_POST['alumno'];
$tipo = $_POST['tipo'];
$ac = $_POST['ac'];

$sql3 = mysqli_query($con3, "CALL select_docente('$usuario')");
    $row2 = mysqli_fetch_assoc($sql3);
    $idD = $row2['Id_Personal_Escolar'];


$sql1 = "CALL insert_asistencia('$fecha', '$alumno', '$idD', '$ac', '$tipo')";
    $result1 = mysqli_query($con1, $sql1);

    if($result1){
        echo "Correcto";
    }else{
        echo "Error";
    }

    mysqli_close($con1);
?>