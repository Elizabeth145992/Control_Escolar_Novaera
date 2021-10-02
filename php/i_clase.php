<?php
/**
* @brief Documento usado para la inserción de una nueva clase
*/

require 'conexion.php';
require 'codigo.php';

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

    if($result1){
        echo $codigo;
    }else{
        echo "Error";
    }

    mysqli_close($con1);
?>