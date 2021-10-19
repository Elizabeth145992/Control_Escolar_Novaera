<?php
/**
* @brief Documento usado para la edición de calificaciones finales
*/

require 'conexion.php';

$caliE = $_POST['caliE'];
$idcali = $_POST['idcali'];



$sql1 = "CALL update_calF('$caliE', '$idcali')";
$result1 = mysqli_query($con1, $sql1);

if($result1){
    echo "Correcto";
}else{
    echo "Error";
}

mysqli_close($con1);


?>