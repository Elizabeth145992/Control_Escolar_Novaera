<?php
/**
* @brief Archivo usado para la obtención de todos los materiales de la biblioteca
 */
require 'conexion.php';
$tipo = $_GET['tipo'];

if($tipo == 1){
$sql = "CALL Select_biblioteca();";
}else if($tipo == 2){
	$biblio = $_GET['biblio'];
	$sql = "CALL select_bibliotecaID('$biblio');";
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