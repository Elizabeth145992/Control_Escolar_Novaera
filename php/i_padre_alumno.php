<?php
/**
* @brief Documento usado para la inserción de nuevo registro para la 
* tabla padre_alumno
*/

require 'conexion.php';

$alumno = $_POST['alumno'];

$sql4 = mysqli_query($con4, "CALL last_padre()");
    $row2 = mysqli_fetch_assoc($sql4);
    $idP = $row2['idP'];

$sql1 = "CALL insert_padre_alumno('$alumno', '$idP')";
    $result1 = mysqli_query($con1, $sql1);

    if($result1){
        echo "Correcto";
    }
    else{
        echo "Error";
    }
?>