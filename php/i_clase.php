<?php
/**
* @brief Documento usado para la inserción de una nueva clase
*/

require 'conexion.php';
require 'codigo.php';
date_default_timezone_set('America/Mexico_City');
$hoy = date("Y-m-d H:i:s");

$nombre = $_POST['nombre'];
$descri = $_POST['descri'];
$horaI = $_POST['horaI'];
$horaT = $_POST['horaT'];
$docente = $_POST['docente'];
$nivel = $_POST['nivel'];
$grado = $_POST['grado'];
$grupo = $_POST['grupo'];
$periodo = $_POST['periodo'];

$sql1 = "CALL insert_clase('$nombre', '$descri', '$codigo', '$horaI', '$horaT', '$nivel', '$grado', '$docente',
                            1, '$periodo', '$grupo')";
    $result1 = mysqli_query($con1, $sql1);

    $sql2 = mysqli_query($con2, "CALL select_docente2('$docente')");
    $row1 = mysqli_fetch_assoc($sql2);
    $idC = $row1['Id_Usuario'];

    if($result1){
        echo $codigo;
        $sql5 = "CALL insert_notificacion('Se le ha asignado a la clase: $nombre', '$hoy',1, 1, '$idC')";
$result2 = mysqli_query($con3, $sql5);
    }else{
        echo "Error";
    }

    mysqli_close($con1);
    mysqli_close($con3);
    mysqli_close($con2);
?>