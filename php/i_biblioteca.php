<?php
/**
* @brief Documento usado para la inserción de un nuevo material para la biblioteca
*/

require 'conexion.php';

$nombre1 = $_POST['nombre'];
$contenido = $_POST['contenido'];
$nivel = $_POST['nivel'];
$grado = $_POST['grado'];
$tipo = $_POST['tipo'];

if($tipo == 1 || $tipo == 2 || $tipo == 3){
    $uploads_dir='../recursos/biblioteca'; 
    $nombre = $_POST['tNombre'];
    $tmp_name = $_FILES["tFile"]["tmp_name"];
    move_uploaded_file($tmp_name, "$uploads_dir/$nombre");
    $direccion = "$uploads_dir"."/"."$nombre";
    $sql1 = "CALL insert_recurso('$direccion', $tipo);";
    $result1 = mysqli_query($con1, $sql1);
}else if($tipo == 4 || $tipo == 5){
    $link = $_POST['link'];
    $sql1 = "CALL insert_recurso('$link', $tipo);";
    $result1 = mysqli_query($con1, $sql1);
}

$sql2 = mysqli_query($con2, "CALL last_recurso()");
    $row1 = mysqli_fetch_assoc($sql2);
    $idR = $row1['idR'];

    $sql4 = "CALL insert_biblioteca('$nombre1', '$contenido', 1, '$idR', '$nivel', '$grado');";
    $result2 = mysqli_query($con4, $sql4);

    if($result2){
        echo "Correcto";
    }else{
        echo "Error";
    }

    mysqli_close($con1);
    mysqli_close($con4);
?>