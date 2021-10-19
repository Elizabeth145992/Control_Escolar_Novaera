<?php
/**
* @brief Documento usado para la edición de alumnos
*/

require 'conexion.php';

$estatus= $_POST['estatus'];
$usuarioA = $_POST['usuarioA'];


$sql1 = "CALL update_usuario_estatus('$estatus', '$usuarioA')";
$result1 = mysqli_query($con1, $sql1);

if($result1){
    echo "Correcto";
}else{
    echo "Error";
}

mysqli_close($con1);
mysqli_close($con2);
mysqli_close($con3);


?>