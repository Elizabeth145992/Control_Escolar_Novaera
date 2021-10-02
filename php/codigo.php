<?php
/**
* @brief Documento usado para la generación de códigos aleatorias
*/

 $str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
 $codigo = "";
 //Reconstruimos la contraseña segun la longitud que se quiera
 for($i=0;$i<7;$i++) {
    //obtenemos un caracter aleatorio escogido de la cadena de caracteres
    $codigo .= substr($str,rand(0,36),1);
 }
 
 echo 'Código generado: '.$codigo;
 //echo '<br>';


?>