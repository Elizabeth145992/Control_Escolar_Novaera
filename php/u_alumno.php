<?php
/**
* @brief Documento usado para la edición de alumnos
*/

require 'conexion.php';

$nombre = $_POST['nombre'];
$paterno = $_POST['paterno'];
$materno = $_POST['materno'];
$correo = $_POST['correo'];
$tele = $_POST['tele'];
$genero = $_POST['genero'];
$rfc = $_POST['rfc'];
$nivel = $_POST['nivel'];
$grado = $_POST['grado'];
$grupo = $_POST['grupo'];
$estado = $_POST['estado'];
$municipio = $_POST['municipio'];
$colonia = $_POST['colonia'];
$calle = $_POST['calle'];
$numero = $_POST['numero'];
$postal = $_POST['postal'];
$usuarioA = $_POST['usuarioA'];
$direccion = $_POST['direccion'];

$sql1 = "CALL update_usuario('$nombre', '$paterno', '$materno', '$correo', '$tele', '$genero', '$usuarioA')";
$result1 = mysqli_query($con1, $sql1);

$sql2 = "CALL update_direccion('$estado', '$municipio', '$calle', '$numero', '$postal', '$colonia', '$direccion')";
$result2 = mysqli_query($con2, $sql2);

$sql3 = "CALL update_alumno('$rfc', '$nivel', '$grado', '$grupo', '$usuarioA')";
$result3 = mysqli_query($con3, $sql3);

if($result1 && $result2 && $result3){
    echo "Correcto";
}else{
    echo "Error";
}

mysqli_close($con1);
mysqli_close($con2);
mysqli_close($con3);


?>