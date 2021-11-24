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

$c1 = mysqli_connect($host, $usuario, $password, $bd, $port);
$c2 = mysqli_connect($host, $usuario, $password, $bd, $port);
$c3 = mysqli_connect($host, $usuario, $password, $bd, $port);
$c4 = mysqli_connect($host, $usuario, $password, $bd, $port);
$c5 = mysqli_connect($host, $usuario, $password, $bd, $port);
$c6 = mysqli_connect($host, $usuario, $password, $bd, $port);
$c7 = mysqli_connect($host, $usuario, $password, $bd, $port);
$c8 = mysqli_connect($host, $usuario, $password, $bd, $port);
$c9 = mysqli_connect($host, $usuario, $password, $bd, $port);
$c10 = mysqli_connect($host, $usuario, $password, $bd, $port);

mysqli_query($c1, "set names 'utf8'");
mysqli_query($c2, "set names 'utf8'");
mysqli_query($c3, "set names 'utf8'");
mysqli_query($c4, "set names 'utf8'");
mysqli_query($c5, "set names 'utf8'");
mysqli_query($c6, "set names 'utf8'");
mysqli_query($c7, "set names 'utf8'");
mysqli_query($c8, "set names 'utf8'");
mysqli_query($c9, "set names 'utf8'");
mysqli_query($c10, "set names 'utf8'");

?>
