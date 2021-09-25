<?php
/**
* @brief Archivo que sirve para la destrucción de las variables de inicio de sesión
 */
session_start();
session_destroy();
header("location: ../index.php");
exit();
?>