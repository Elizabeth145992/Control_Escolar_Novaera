<?php
/**
* @brief Documento usado para la inserción de nuevos usuarios padre/tutor
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

$sql1 = "CALL insert_direccion('$estado', '$municipio', '$calle', '$numero', '$postal')";
    $result1 = mysqli_query($con1, $sql1);
if($result1){
    $sql2 = mysqli_query($con2, "CALL last_direccion()");
    $row = mysqli_fetch_assoc($sql2);
    $idD = $row['idD'];

    $sql3 = "CALL insert_usuario('$nombre', '$paterno', '$materno', '$correo', '$tele', 
    'C:\xampp\htdocs\Control_Escolar_Novaera\img\b1.jpg', '$contrasena', '$idD', 3, '$genero', 1)";
    $result3 = mysqli_query($con3, $sql3);

    if($result3){
        echo "Correcto";
    }else{
        echo "Error";
    }
}
else{
    echo "Error";
}

mysqli_close($con1);
mysqli_close($con2);
mysqli_close($con3);
?>
