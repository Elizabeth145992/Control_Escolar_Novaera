<?php
/**
* @brief Archivo que sirve para modificar la contraseña  
* de un usuario.
 */
require 'conexion.php';


$usuario = $_POST['usuario'];
$contrasena = $_POST['contrasena'];


$password = password_hash($contrasena, PASSWORD_DEFAULT, ['cost'=>10]);

$sql2 = "CALL update_contrasena('$password', '$usuario')";
$result1 = mysqli_query($con1, $sql2);

//echo mysqli_error($cone);
if($result1){
    echo "Correcto";
}
else{
    echo "Error";
}

mysqli_close($con1);
?>