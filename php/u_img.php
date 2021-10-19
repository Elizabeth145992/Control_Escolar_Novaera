<?php
/**
* @brief Documento usado para la inserción de una nueva actividad y recurso
*/

require 'conexion.php';

$uploads_dir='../foto_perfil'; 
$nombre = $_POST['tNombre'];
$tmp_name = $_FILES["tFile"]["tmp_name"];
$user = $_POST['user'];

move_uploaded_file($tmp_name, "$uploads_dir/$nombre");
$direccion = "$uploads_dir"."/"."$nombre";

$sql1 = "CALL update_usuario_foto('$direccion', $user);";
$result1 = mysqli_query($con1, $sql1);

if($result1){
    echo "Correcto";
}else{
    echo "Error";
}

mysqli_close($con1);

?>