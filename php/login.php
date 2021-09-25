<?php
/**
* @brief Archivo que sirve para hacer la consulta de los usuarios que pertenecen
* al sistema y verificar si es que este usuario es parte del sistema, si es asi
* guarda el tipo de usuario, y su id, para después ser usado para el inicio de su sesión
* correspondiente.
 */
require 'conexion.php';

$correo = $_POST["correo"];
$contrasena = $_POST["contrasena"];

$sql1 = "CALL select_usuarios('$correo')";
$consulta1 = mysqli_query($con1, $sql1);
    
if (mysqli_num_rows($consulta1)>0){
    $row1 = mysqli_fetch_assoc($consulta1);
        if(password_verify($contrasena, $row1['Contrasena'])){
            $_SESSION['userID'] = $row1['Id_Usuario'];
            $_SESSION['userTIPO'] = $row1['Id_Rol'];
            $_SESSION['CORREO'] = $row1['Correo'];
            echo "Correcto";
        }
        else{
            echo "Error";
        }  
    }
?>