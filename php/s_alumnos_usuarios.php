<?php
/**
* @brief Archivo usado para la obtención de todos los usuarios alumnos y docentes del sistema
 */
require 'conexion.php';

$tipo = $_GET['tipo'];

if($tipo == 1){
	$sql = "CALL Select_alumno_nivel($tipo);";
}else if($tipo == 2){
	$sql = "CALL Select_alumno_nivel($tipo);";
}
else if($tipo == 3){
	$sql = "CALL Select_alumno_nivel($tipo);";
}else if($tipo == 4){
	$sql = "CALL Select_alumno_nivel($tipo);";
}else if($tipo == 5){
	$usuario = $_GET['usuario'];
	$sql = "CALL Select_alumno_nivel2($usuario);";
}else if($tipo == 6){
	$clase = $_GET['clase'];
	$sql = "CALL select_alumnoA($clase);";
}else if($tipo == 7){
	$clase = $_GET['clase'];
	$sql = "CALL select_alumnocalifp($clase);";
}else if($tipo==8){
	$clase = $_GET['clase'];
	$sql = "CALL select_alumnocalifF($clase);";
}else if($tipo==9){
	$clase = $_GET['clase'];
	$sql = "CALL select_asistecia($clase);";
}else if($tipo==10){
	$clase = $_GET['clase'];
	$usuario = $_GET['usuario'];

	$sql1 = mysqli_query($con3, "CALL Select_usuario_alumno('$usuario')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idA = $row1['Id_Alumno'];

	$sql2 = mysqli_query($con2, "CALL Select_clase_alumno('$idA')");
    $row2 = mysqli_fetch_assoc($sql2);
    $idAC = $row2['Id_Alumno_Clase'];

	$sql = "CALL select_asistecia_a('$clase', '$idAC');";
}else if($tipo==11){
	$clase = $_GET['clase'];
	$usuario = $_GET['usuario'];

	$sql1 = mysqli_query($con3, "CALL Select_usuario_alumno('$usuario')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idA = $row1['Id_Alumno'];

	$sql2 = mysqli_query($con2, "CALL Select_clase_alumno('$idA')");
    $row2 = mysqli_fetch_assoc($sql2);
    $idAC = $row2['Id_Alumno_Clase'];

	$sql = "CALL select_califP_a('$clase', '$idAC');";
}else if($tipo==12){
	$usuario = $_GET['usuario'];

	$sql1 = mysqli_query($con3, "CALL Select_usuario_alumno('$usuario')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idA = $row1['Id_Alumno'];

	$sql = "CALL select_califF_a( '$idA');";
}else if($tipo==13){
	$tipo2 = $_GET['tipo2'];
	$sql = "CALL Select_alumno_nivel_estatus($tipo2);";
}
else if($tipo==14){
	$sql = "CALL Select_personal();";
}else if($tipo == 15){
	$usuario = $_GET['usuario'];
	$sql = "CALL Select_personal2($usuario);";
}else if($tipo==16){
	$sql = "CALL Select_personales();";
}else if($tipo==17){
	$sql = "CALL Select_padres();";
}else if($tipo == 18){
	$usuario = $_GET['usuario'];
	$sql = "CALL Select_padres2($usuario);";
}else if($tipo == 19){
	$usuario = $_GET['usuario'];
	$sql1 = mysqli_query($con2, "CALL select_docente('$usuario')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idD = $row1['Id_Personal_Escolar'];

    $sql3 = mysqli_query($con3, "CALL last_periodo()");
    $row3 = mysqli_fetch_assoc($sql3);
    $periodo = $row3['idP'];
    $sql = "CALL select_clase('$idD', '$periodo');"; 
}else if($tipo == 20){
	$usuario = $_GET['asis'];
	$sql = "CALL select_asistecia_Alum($usuario);";
}else if($tipo == 21){
	$clase = $_GET['clase'];
	$sql = "CALL select_evaluacion($clase);";
}else if($tipo==22){
	$clase = $_GET['clase'];
	$usuario = $_GET['usuario'];

	$sql1 = mysqli_query($con3, "CALL Select_usuario_alumno('$usuario')");
    $row1 = mysqli_fetch_assoc($sql1);
    $idA = $row1['Id_Alumno'];

	$sql2 = mysqli_query($con2, "CALL Select_clase_alumno('$idA')");
    $row2 = mysqli_fetch_assoc($sql2);
    $idAC = $row2['Id_Alumno_Clase'];

	$sql = "CALL select_evaluacion_a('$idA', '$idAC');";
}




	$result = mysqli_query($con1, $sql);
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
	mysqli_close($con1);
?>