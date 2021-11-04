<?php
/**
* @brief Documento usado para la inserción de una nueva actividad y recurso
*/

require 'conexion.php';

date_default_timezone_set('America/Mexico_City');
$hoy = date("Y-m-d H:i:s");

$uploads_dir='../recursos'; 
$nombre = $_POST['tNombre'];
$tmp_name = $_FILES["tFile"]["tmp_name"];

move_uploaded_file($tmp_name, "$uploads_dir/$nombre");
$direccion = "$uploads_dir"."/"."$nombre";

$user = $_POST['user'];
$clase = $_POST['clase'];
$contenido = $_POST['contenido'];
$activi = $_POST['activi'];
$fecha = $_POST['fecha'];

$sql1 = "CALL insert_recurso('$direccion', 2);";
$result1 = mysqli_query($con1, $sql1);

$sql2 = mysqli_query($con2, "CALL last_recurso()");
    $row1 = mysqli_fetch_assoc($sql2);
    $idR = $row1['idR'];

    $sql3 = mysqli_query($con3, "CALL select_docente('$user')");
    $row2 = mysqli_fetch_assoc($sql3);
    $idD = $row2['Id_Personal_Escolar'];

    $sql4 = "CALL insert_actividad('$activi', '$contenido', '$fecha', '$idD', '$clase', '$idR');";
    $result2 = mysqli_query($con4, $sql4);



    $c = mysqli_query($con5, "CALL select_claseTipo('$clase');");
    $fila = mysqli_fetch_assoc($c);
    $nombrec = $fila['Nombre_Clase'];


       $noti1 = "CALL select_alumnos_clase('$clase');";
        $consulta1 = mysqli_query($con6, $noti1);
        while($data = mysqli_fetch_assoc($consulta1)) {
            $arrayf = $data['Id_Usuario'];
            $noti2 = "CALL insert_notificacion('Se ha creado una nueva actividad en la clase: $nombrec', '$hoy',6, 1, '$arrayf');";
            $consulta2 = mysqli_query($con7, $noti2);
        }

    if($result2){
        echo "Correcto";
    }else{
        echo "Error";
    }
    mysqli_close($con1);
    mysqli_close($con2);
    mysqli_close($con3);
    mysqli_close($con4);
    mysqli_close($con5);
    mysqli_close($con6);
    mysqli_close($con7);

?>