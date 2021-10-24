<?php
/**
* @brief Archivo usado para la inserción usuarios alumnos mediante la cargar de un archivo .csv
* Se guarda la información de los usuarios y se les envía a cada uno su contraseña por medio 
* de un correo electrónico.
 */
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require 'PHPMailer-master/src/Exception.php';
require 'PHPMailer-master/src/PHPMailer.php';
require 'PHPMailer-master/src/SMTP.php';
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
$tipo2 = $_POST['tipo2'];

$delimiter = ",";


$i=0;

$mail = [];

foreach ($lineas as $linea_num => $linea)
{ 
$con1 = mysqli_connect($host, $usuario, $pass, $bd, $port);
$con2 = mysqli_connect($host, $usuario, $pass, $bd, $port);
$con3 = mysqli_connect($host, $usuario, $pass, $bd, $port);
$con4 = mysqli_connect($host, $usuario, $pass, $bd, $port);
$con5 = mysqli_connect($host, $usuario, $pass, $bd, $port);

mysqli_query($con1, "set names 'utf8'");
mysqli_query($con2, "set names 'utf8'");
mysqli_query($con3, "set names 'utf8'");
mysqli_query($con4, "set names 'utf8'");
mysqli_query($con5, "set names 'utf8'");

   if($i != 0) 
   { 
       $datos = explode(",",$linea);

require 'password.php';

$nombre = utf8_encode($datos[0]);
$paterno = utf8_encode($datos[1]); 
$materno =utf8_encode($datos[2]);
$correo = utf8_encode($datos[3]);
$tele = utf8_encode($datos[4]);
$genero = $datos[11];
$estado = utf8_encode($datos[5]);
$municipio = utf8_encode($datos[6]);
$colonia = utf8_encode($datos[7]);
$calle = utf8_encode($datos[8]);
$numero = utf8_encode($datos[9]);
$cp = utf8_encode($datos[10]);

$sql1 = "CALL insert_direccion('$estado', '$municipio', '$calle', '$numero', '$cp', '$colonia')";
    $result1 = mysqli_query($con1, $sql1);

    $sql2 = mysqli_query($con2, "CALL last_direccion()");
    $row = mysqli_fetch_assoc($sql2);
    $idD = $row['idD'];

    $sql3 = "CALL insert_usuario('$nombre', '$paterno', '$materno', '$correo', '$tele', 
    '../img/g_novaera.jpg', '$contrasena', '$idD', 6, '$genero', 1)";
    $result3 = mysqli_query($con3, $sql3);


    $sql4 = mysqli_query($con4, "CALL last_usuario()");
    $row2 = mysqli_fetch_assoc($sql4);
    $idU = $row2['idU'];

    if($tipo2 == 1){
        $rfc = $datos[12];
        $nivel = $datos[13];
        $grado = $datos[14];
        $grupo = $datos[15];

        $sql5 = "CALL insert_alumno('$rfc', '$idU', '$nivel', '$grado', '$grupo')";
    $result5 = mysqli_query($con5, $sql5);
    } else if($tipo2 == 2){
        $rfc = $datos[12];
        $puesto = $datos[13];
        
        $sql5 = "CALL insert_personal('$rfc', '$puesto', '$idU')";
        $result5 = mysqli_query($con5, $sql5);
    }

    $mail[$i] = new PHPMailer();
    $mail[$i]->IsSMTP();
    $mail[$i]->Mailer = "smtp";
    $mail[$i]->SMTPDebug  = 1;  
    $mail[$i]->SMTPAuth   = TRUE;
    $mail[$i]->SMTPSecure = "tls";
    $mail[$i]->Port       = 587;
    $mail[$i]->Host       = "smtp.gmail.com";
    $mail[$i]->Username   = "institutonovaeran@gmail.com";
    $mail[$i]->Password   = "uoNDSD6e1h";
    $mail[$i]->IsHTML(true);
    $mail[$i]->SetFrom("institutonovaeran@gmail.com", "Instituto Novaera");
    $mail[$i]->Subject = "Asignación de contraseña para el sistema del Instituto Novaera";
    $mail[$i]->AddAddress($correo, "Instituto Novaera");
    $content = '<p>Utiliza tu correo institucional y el password que se proporciona a continuación para acceder al sistema. </p><b>'.$password;
    $mail[$i]->MsgHTML($content); 
    $mail[$i]->Send();

}


mysqli_close($con1);
mysqli_close($con2);
mysqli_close($con3);
mysqli_close($con4);
mysqli_close($con5);
$i++;


   }

exit;
?>
