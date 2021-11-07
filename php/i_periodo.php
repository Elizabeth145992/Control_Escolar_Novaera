<?php
/**
* @brief Documento usado para la inserción de una nueva clase
*/

require 'conexion.php';


$nombreP = $_POST['nombreP'];
$inicio = $_POST['inicio'];
$termino = $_POST['termino'];

$sql6 = mysqli_query($con9, "CALL select_peridodcomp('$inicio', '$termino');");

if(mysqli_num_rows($sql6)>0){
    echo "Error";
    mysqli_close($con9);
}else{

$sql1 = "CALL insert_periodo('$nombreP', '$inicio', '$termino')";
    $result1 = mysqli_query($con1, $sql1);

    if($result1){
        echo "Correcto";
    }else{
        echo "Error";
    }

    mysqli_close($con1);
}
?>