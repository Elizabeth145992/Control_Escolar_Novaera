<?php
/**
* @brief Documento usado para la generación de contraseñas aleatorias
*/

 $str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890@#$%=";
 $password = "";
 //Reconstruimos la contraseña segun la longitud que se quiera
 for($i=0;$i<10;$i++) {
    //obtenemos un caracter aleatorio escogido de la cadena de caracteres
    $password .= substr($str,rand(0,67),1);
 }
 //Mostramos la contraseña generada
// echo 'Password generado: '.$password;
 //echo '<br>';
 //Encriptación de la contraseña
 $contrasena = password_hash($password, PASSWORD_DEFAULT, ['cost'=>10]);
 //echo 'hash: '.$contrasena;

?>