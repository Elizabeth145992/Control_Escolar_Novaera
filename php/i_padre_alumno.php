<?php
/**
* @brief Documento usado para la inserción de nuevo registro para la 
* tabla padre_alumno
*/

require 'conexion.php';

$alumno = $_POST['alumno'];

$sql3 = mysqli_query($con2, "CALL select_padreacompr('$alumno');");

if(mysqli_num_rows($sql3)>0){
    echo "Error";
    mysqli_close($con2);
}else{
$sql4 = mysqli_query($con4, "CALL last_padre()");
    $row2 = mysqli_fetch_assoc($sql4);
    $idP = $row2['idP'];

$sql1 = "CALL insert_padre_alumno('$alumno', '$idP')";
    $result1 = mysqli_query($con1, $sql1);

    if($result1){
        echo "Correcto";
    }
    else{
        echo "Error";
    }
    mysqli_close($con1);
    mysqli_close($con4);
}
?>