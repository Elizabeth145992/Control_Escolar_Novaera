<?php

/**
* @brief Documento usado para la conexión en general a la base de datos
*/
header('Content-type: text/html; charset=utf-8');
session_start();

$host = "127.0.0.1:3310";
$usuario = "root";
$password = "root";
$bd = "db_control_escolar";
$port = 3310;

$con1 = mysqli_connect($host, $usuario, $password, $bd, $port);
$con2 = mysqli_connect($host, $usuario, $password, $bd, $port);
$con3 = mysqli_connect($host, $usuario, $password, $bd, $port);
$con4 = mysqli_connect($host, $usuario, $password, $bd, $port);
$con5 = mysqli_connect($host, $usuario, $password, $bd, $port);

mysqli_query($con1, "set names 'utf8'");
mysqli_query($con2, "set names 'utf8'");
mysqli_query($con3, "set names 'utf8'");
mysqli_query($con4, "set names 'utf8'");
mysqli_query($con5, "set names 'utf8'");

?>
