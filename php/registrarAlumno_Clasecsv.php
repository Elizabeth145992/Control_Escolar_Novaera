<?php
/**
* @brief Archivo usado para la inserción usuarios alumnos mediante la cargar de un archivo .csv
* Se guarda la información de los usuarios y se les envía a cada uno su contraseña por medio 
* de un correo electrónico.
 */

header('Content-type: text/html; charset=utf-8');
session_start();

$host = "127.0.0.1:3310";
$usuario = "root";
$pass = "root";
$bd = "db_control_escolar";
$port = 3310;

$tipo = $_FILES['archivo']['type'];
$tamanio = $_FILES['archivo']['size'];
$archivotmp = $_FILES['archivo']['tmp_name'];
$lineas = file($archivotmp);
$clase = $_POST['clase'];
//$correo = $_POST['correo'];

$i=0;

foreach ($lineas as $linea_num => $linea)
{ 
    
    $con1 = mysqli_connect($host, $usuario, $pass, $bd, $port);
    $con2 = mysqli_connect($host, $usuario, $pass, $bd, $port);
    $con6 = mysqli_connect($host, $usuario, $pass, $bd, $port);
    mysqli_query($con1, "set names 'utf8'");
    mysqli_query($con2, "set names 'utf8'");
    mysqli_query($con6, "set names 'utf8'");

   if($i != 0) 
   {
    
       $datos = explode(",",$linea);

$sql2 = "CALL select_alumnos_clase_csv('$datos[0]');";
$consulta1 = mysqli_query($con1, $sql2);
$row = mysqli_fetch_assoc($consulta1);
$idD = $row['Id_Alumno'];


$sql6 = mysqli_query($con6, "CALL select_alumnoclasecomp('$idD', '$clase');");

if(mysqli_num_rows($sql6)>0){
    echo "Error";
    mysqli_close($con6);
}else{

$ac = "CALL insert_alumnoclase('$clase', '$idD');";
$consulta2 = mysqli_query($con2, $ac);


}
mysqli_close($con1);
mysqli_close($con2);
   }
$i++;


   }

exit;
?>
