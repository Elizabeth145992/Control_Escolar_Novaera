<?php
/**
* @brief Archivo usado insertar en la tabla alumno_clase
 */
require 'conexion.php';

$usuario = $_POST['usuario'];
$codigo = $_POST['codigo'];


$sql1 = mysqli_query($con1, "CALL Select_usuario_alumno('$usuario')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idA = $row1['Id_Alumno'];

    $sql2 = mysqli_query($con2, "CALL select_claseCodigo('$codigo')");
    $row2 = mysqli_fetch_assoc($sql2);
    $idC = $row2['Id_Clase'];

    $sql6 = mysqli_query($con6, "CALL select_alumnoclasecomp('$idA', '$idC');");

if(mysqli_num_rows($sql6)>0){
    echo "Error";
    mysqli_close($con6);
}else{

$sql3 = "CALL insert_alumnoclase('$idC', '$idA')";
    $result1 = mysqli_query($con3, $sql3);

    if($result1){
        echo "Correcto";
    }else{
        echo "Error";
    }

    mysqli_close($con1);
    mysqli_close($con2);
    mysqli_close($con3);
}
    ?>
    