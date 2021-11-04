<?php
/**
* @brief Archivo que sirve para restablecer la contraseña
 */

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require 'PHPMailer-master/src/Exception.php';
require 'PHPMailer-master/src/PHPMailer.php';
require 'PHPMailer-master/src/SMTP.php';
require 'conexion.php';
require 'password.php';
date_default_timezone_set('America/Mexico_City');
$hoy = date("Y-m-d H:i:s");


$correo = $_POST['correo'];

$sql1 = mysqli_query($con1, "CALL select_usuarios('$correo')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idC = $row1['Id_Usuario'];

$sql2 = "CALL update_contrasena('$contrasena', '$idC')";
$result1 = mysqli_query($con2, $sql2);




$mail = new PHPMailer();
$mail->IsSMTP();
$mail->Mailer = "smtp";

$mail->SMTPDebug  = 1;  
$mail->SMTPAuth   = TRUE;
$mail->SMTPSecure = "tls";
$mail->Port       = 587;
$mail->Host       = "smtp.gmail.com";
$mail->Username   = "institutonovaeran@gmail.com";
$mail->Password   = "uoNDSD6e1h";

$mail->IsHTML(true);
$mail->AddAddress($correo, $nombre.' '.$paterno.' '.$materno);
$mail->SetFrom("institutonovaeran@gmail.com", "Instituto Novaera");
$mail->Subject = "RESTABLECIMIENTO DE PASSWORD para sistema del Instituto Novaera";
$content = '<p>Utiliza tu correo institucional y el password que se proporciona a continuación para acceder al sistema. </p><b>'.$password;

$mail->MsgHTML($content); 


$sql5 = "CALL insert_notificacion('Cambio de Contraseña del usuario con correo: $correo', '$hoy',5,  1, '$idC')";
$result1 = mysqli_query($con3, $sql5);







if(!$mail->Send() && !$result1){
    echo $password;
}else{
    echo "Error";
}


mysqli_close($con1);
mysqli_close($con2);
mysqli_close($con3);

?>