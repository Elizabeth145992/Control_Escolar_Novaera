<?php
/**
* @brief Documento usado para la inserción de nuevos usuarios alumno
*/

require 'conexion.php';
require 'password.php';

$nombre = $_POST['nombre'];
$paterno = $_POST['paterno'];
$materno = $_POST['materno'];
$correo = $_POST['correo'];
$genero = $_POST['genero'];
$estado = $_POST['estado'];
$municipio = $_POST['municipio'];
$calle = $_POST['calle'];
$numero = $_POST['numero'];
$postal = $_POST['postal'];
$tele = $_POST['tele'];
$rfc = $_POST['rfc'];
$nivel = $_POST['nivel'];
$grado = $_POST['grado'];
$grupo = $_POST['grupo'];
$colonia = $_POST['colonia'];

$sql1 = "CALL insert_direccion('$estado', '$municipio', '$calle', '$numero', '$postal', '$colonia')";
    $result1 = mysqli_query($con1, $sql1);
if($result1){
    $sql2 = mysqli_query($con2, "CALL last_direccion()");
    $row = mysqli_fetch_assoc($sql2);
    $idD = $row['idD'];

    $sql3 = "CALL insert_usuario('$nombre', '$paterno', '$materno', '$correo', '$tele', 
    'C:\xampp\htdocs\Control_Escolar_Novaera\img\b1.jpg', '$contrasena', '$idD', 6, '$genero', 1)";
    $result3 = mysqli_query($con3, $sql3);

}
if($result3){
    $sql4 = mysqli_query($con4, "CALL last_usuario()");
    $row2 = mysqli_fetch_assoc($sql4);
    $idU = $row2['idU'];

    $sql5 = "CALL insert_alumno('$rfc', '$idU', '$nivel', '$grado', '$grupo')";
    $result5 = mysqli_query($con5, $sql5);
}
if($result5){
    echo "Correcto";
}
else{
    echo "Error";
}

mysqli_close($con1);
mysqli_close($con2);
mysqli_close($con3);
mysqli_close($con4);
mysqli_close($con5);
?>
