<?php
/**
* @brief Documento usado para la inserción de un nuevo evento para teasm o zoom
*/

require 'conexion.php';


$hora = $_POST['hora'];
$fecha = $_POST['fecha'];
$clase = $_POST['clase'];
$tipo = $_POST['tipo'];
$user = $_POST['user'];
$titulo = $_POST['titulo'];


$sql1 = "CALL insert_eventoTZ('$titulo','$hora', '$fecha', '$clase', '$tipo', '$user')";
    $result1 = mysqli_query($con1, $sql1);

    if($result1){
        echo "Correcto";
    }else{
        echo "Error";
    }

    mysqli_close($con1);
?>