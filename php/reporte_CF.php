<?php
/**
* @brief Archivo que sirve para realizar el reporte de las calificaciones finales
 */
require 'conexion.php';
$tipo = $_GET['tipo'];
$clase = $_GET['clase'];

$sql = "CALL select_alumnocalifF('$clase');";
	$result = mysqli_query($con1, $sql);
		while($row = mysqli_fetch_assoc($result)) {
            $datos[] = $row;
        }

        $sql2 = mysqli_query($con2, "CALL select_claseTipo('$clase')");
        $row2 = mysqli_fetch_assoc($sql2);
        $nombreM = $row2['Nombre_Clase'];

require 'fpdf/fpdf.php';

class PDF extends FPDF
{
   //Cabecera de página
   function Header()
   {
    $this->Image('logo.png',10,8,33);
       $this->SetFont('Helvetica','',25);
       $this->Cell(0,0,'',0,1,'C');
       $this->Ln();
       $this->Ln();
      $this->Cell(0,0,'Instituto Novaera',0,1,'C');

   }

   function Footer()
{

$this->SetY(-10);

$this->SetFont('Arial','I',8);

$this->Cell(0,10,'Pagina '.$this->PageNo(),0,0,'C');
   }

   function TablaBasica($header, $datos)
   {
    //Cabecera
    foreach($header as $col)
    $this->Cell(40,7,$col,1,0,'C');
    $this->Ln();
    foreach ($datos as $array) { 
        $ap=$array['Apellido_Paterno'];
        $am=$array['Apellido_Materno'];
        $nom=$array['Nombre'];
        $caf=$array['Calificacion'];

        $this->Cell(40,5,utf8_decode($ap),1,0,'C');
        $this->Cell(40,5,utf8_decode($am),1,0,'C');
        $this->Cell(40,5,utf8_decode($nom),1,0,'C');
        $this->Cell(40,5,$caf,1,0,'C');
        $this->Ln();
    }
   }
   
}


//Creación del objeto de la clase heredada
$pdf=new PDF();
$pdf->AddPage();
$pdf->SetFont('Times','',14);
$pdf->setY(30);
$pdf->Cell(0,0,utf8_decode('Calificaciones Finales de:'.$nombreM),0,1,'C');
$textypos = 5;
$off = $textypos+6;    
$pdf->Ln(5);
$pdf->setY(50);
$pdf->SetFont('Times','',12);
$header=array('Apellido Paterno','Apellido Materno','Nombre',utf8_decode('Calificación Final'));
$pdf->AliasNbPages();
//$pdf->AddPage();
$pdf->TablaBasica($header, $datos);

mysqli_close($con1);
$pdf->Output('reporte.pdf','i');//Salida del archivo <PDF></PDF>
?>