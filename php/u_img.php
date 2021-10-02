<?php 
require 'conexion.php';

if(isset($_POST["submit"])){
    $revisar = getimagesize($_FILES["image"]["tmp_name"]);
    if($revisar !== false){
        $image = $_FILES['image']['tmp_name'];
        $imgContenido = addslashes(file_get_contents($image));

        $sql1 = "UPDATE usuario SET Foto= '$imgContenido' where Id_Usuario=67";
        $result1 = mysqli_query($con1, $sql1);
        }
    }

?>