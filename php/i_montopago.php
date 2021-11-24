<?php
/**
* @brief Archivo usado insertar en la tabla alumno_clase
 */
require 'conexion.php';
date_default_timezone_set('America/Mexico_City');
$tipo = $_POST['tipo'];
$hoy = date("Y-m-d H:i:s");


if($tipo == 1){
$usuario = $_POST['usuario'];
$monto = $_POST['monto'];

$sql1 = mysqli_query($con1, "CALL Select_usuario_alumno('$usuario')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idA = $row1['Id_Alumno'];

    $sql3 = mysqli_query($con2, "CALL last_periodo()");
    $row3 = mysqli_fetch_assoc($sql3);
    $periodo = $row3['idP'];

    $sql6 = mysqli_query($con9, "CALL select_pago_reporte('$idA', '$periodo');");

if(mysqli_num_rows($sql6)>0){
    echo "Error";
    mysqli_close($con9);
    mysqli_close($con1);
}else{
    $sql4 = mysqli_query($con4, "CALL select_padre_alumno('$idA')");
    $row2 = mysqli_fetch_assoc($sql4);
    $idP = $row2['Id_Padre'];

    $sql2 = "CALL insert_monto_pago('$idA', '$monto', '$periodo')";
    $result1 = mysqli_query($con3, $sql2);

    $n = mysqli_query($con6, "CALL Select_usuario_alumno_noti('$idA');");
        $fila2 = mysqli_fetch_assoc($n);
        $nombren = $fila2['Nombre'];
        $nombrep = $fila2['Apellido_Paterno'];
        $nombrem = $fila2['Apellido_Materno'];

        $noti3 = "CALL insert_notificacion('Se ha asignado la cantidad a pagar de su hijo $nombren $nombrep $nombrem', '$hoy',3, 1, '$idP');";
    $consulta3 = mysqli_query($con5, $noti3);
    
    if($result1){
        echo "Correcto";
    }else{
        echo "Error";
    }

    mysqli_close($con1);
    mysqli_close($con3);
    mysqli_close($con2);
    mysqli_close($con4);
    mysqli_close($con5);
    mysqli_close($con6);
}
}else if($tipo == 2){
    $usuario = $_POST['usuario'];

    $sql3 = mysqli_query($con2, "CALL last_periodo()");
    $row3 = mysqli_fetch_assoc($sql3);
    $periodo = $row3['idP'];

    $sql1 = mysqli_query($con1, "CALL Select_usuario_alumno('$usuario')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idA = $row1['Id_Alumno'];

    $sql6 = mysqli_query($con9, "CALL select_pago_reporte('$idA', '$periodo');");
    $fila = mysqli_fetch_assoc($sql6);
    $monto = $fila['Monto'];
    $nombre = $fila['Nombre'];
    $paterno = $fila['Apellido_Paterno'];
    $materno = $fila['Apellido_Materno'];

    if(mysqli_num_rows($sql6)>0){
        echo "La cantidad a pagar es de $$monto del alumno $nombre $paterno $materno";
    }else{
        echo "Error";
    }

    mysqli_close($con9);
    mysqli_close($con1);
}else if($tipo == 3){
    $usuario = $_POST['usuario'];

    $sql3 = mysqli_query($con2, "CALL last_periodo()");
    $row3 = mysqli_fetch_assoc($sql3);
    $periodo = $row3['idP'];

    $sql1 = mysqli_query($con1, "CALL Select_usuario_alumno('$usuario')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idA = $row1['Id_Alumno'];

    $sql2 =  "CALL select_pago_reporte('$idA', '$periodo');";
    
    $result = mysqli_query($con9, $sql2);
    $arreglo["data"] = []; 
	if (!$result) {
		echo "Error";
    }
    else{
		while($data = mysqli_fetch_assoc($result)) {
            $arreglo["data"][] = $data;
		}
		echo json_encode($arreglo);
	} 

	mysqli_free_result($result);
    


    mysqli_close($con9);
    mysqli_close($con1);   
    mysqli_close($con2);
}else if($tipo == 4){
    $nuevo = $_POST['monton'];
    $pago = $_POST['idmonto'];

    $sql1 = "CALL update_cantidad_pago('$nuevo', '$pago');";
$result1 = mysqli_query($con1, $sql1);

if($result1){
    echo "Correcto";
}else{
    echo "Error";
}
mysqli_close($con1);
}else if($tipo = 5){
    $nivel = $_POST['tipo2'];
    $monto = $_POST['monto'];


    $sql3 = mysqli_query($con2, "CALL last_periodo()");
    $row3 = mysqli_fetch_assoc($sql3);
    $periodo = $row3['idP'];


    $sql = "CALL Select_alumno_nivel_estatus($nivel);";
    $consulta1 = mysqli_query($con1, $sql);
    while($data = mysqli_fetch_assoc($consulta1)) {
        $arrayf = $data['Id_Alumno'];

    $valor = validar($arrayf, $periodo);

        if($valor == 1){
            echo "Error";
            
    }else{
        $noti2 = "CALL insert_monto_pago('$arrayf', '$monto', '$periodo')";
        $consulta2 = mysqli_query($con7, $noti2);

    $nombreAlu = nu($arrayf);
    $nombrepadre = padre($arrayf);

    $noti3 = "CALL insert_notificacion('Se ha asignado la cantidad a pagar de su hijo $nombreAlu', '$hoy',3, 1, '$nombrepadre');";
$consulta3 = mysqli_query($con5, $noti3);

    }
    
    
}
mysqli_close($con1);   
mysqli_close($con2);
mysqli_close($con7);
mysqli_close($con5);

}

function validar($m, $p){
    $host = "127.0.0.1:3310";
$usuario = "root";
$password = "root";
$bd = "db_control_escolar";
$port = 3310;

$c1 = mysqli_connect($host, $usuario, $password, $bd, $port);
mysqli_query($c1, "set names 'utf8'");
    $sql6 = "CALL select_pago_reporte('$m', '$p');";
    $valida = mysqli_query($c1, $sql6);

    if(mysqli_num_rows($valida)>0){
        return 1;
    }else
    return 0;
}

function nu($m){
    $host = "127.0.0.1:3310";
$usuario = "root";
$password = "root";
$bd = "db_control_escolar";
$port = 3310;

$c2 = mysqli_connect($host, $usuario, $password, $bd, $port);
mysqli_query($c2, "set names 'utf8'");
    
$n = mysqli_query($c2, "CALL Select_usuario_alumno_noti('$m');");
$fila2 = mysqli_fetch_assoc($n);
$nombren = $fila2['Nombre'];
$nombrep = $fila2['Apellido_Paterno'];
$nombrem = $fila2['Apellido_Materno'];

$nombreC = $nombren.' '.$nombrep.' '.$nombrem;

    return $nombreC;
}

function padre($m){
    $host = "127.0.0.1:3310";
$usuario = "root";
$password = "root";
$bd = "db_control_escolar";
$port = 3310;

$c3 = mysqli_connect($host, $usuario, $password, $bd, $port);
mysqli_query($c3, "set names 'utf8'");
    
$sql4 = mysqli_query($c3, "CALL select_padre_alumno('$m')");
    $row2 = mysqli_fetch_assoc($sql4);
    $idP = $row2['Id_Padre'];

    return $idP;
}
?>