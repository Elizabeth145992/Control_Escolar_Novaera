<?php
/**
* @brief Archivo usado para la obtención de todas las clases del sistema
 */
require 'conexion.php';

$tipo = $_GET['tipo'];

if($tipo == 1){
    $sql3 = mysqli_query($con3, "CALL last_periodo()");
    $row3 = mysqli_fetch_assoc($sql3);
    $periodo = $row3['idP'];

	$sql = "CALL select_claseAll($periodo);";


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
    mysqli_close($con3);
}else if($tipo == 2){
    $clase = $_GET['clase'];

	$sql = "CALL select_claseTipo('$clase');";
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
}else if($tipo == 3){
    $nombre = $_GET['nombreC'];
    $des = $_GET['descripcion'];
    $horaI = $_GET['horaI'];
    $horaT = $_GET['horaT'];
    $docente = $_GET['docente'];
    $nivel = $_GET['nivel'];
    $grado = $_GET['grado'];
    $grupo = $_GET['grupo'];
    $estatus = $_GET['estatus'];
    $clase = $_GET['clase'];

    $sql1 = "CALL update_clase('$nombre', '$des', '$horaI', '$horaT', '$nivel', '$grado', '$docente', '$estatus', '$grupo', '$clase')";
$result1 = mysqli_query($con1, $sql1);

if($result1){
    echo "Correcto";
}else{
    echo "Error";
}

mysqli_close($con1);

}

?>