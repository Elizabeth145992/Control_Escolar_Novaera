<?php
/**
* @brief Archivo que sirve para realizar el reporte de las calificaciones finales
 */
require 'conexion.php';
date_default_timezone_set('America/Mexico_City');
$idpago = $_GET['idpago'];
$fecha = date('Y-m-d');


        $sql2 = mysqli_query($con2, "CALL select_pago_alumno('$idpago')");
        $row2 = mysqli_fetch_assoc($sql2);
        $periodo = $row2['Nombre_Periodo'];
        $nombred = $row2['Nombre'];
        $paterno = $row2['Apellido_Paterno'];
        $materno = $row2['Apellido_Materno'];
        $rfc = $row2['RFC'];
        $monto = $row2['Monto'];

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
   
}


//Creación del objeto de la clase heredada
$pdf=new PDF();
$pdf->AddPage();
$pdf->SetFont('Times','',14);
$pdf->setY(30);
$pdf->Cell(0,0,utf8_decode('Reporte de pago del periodo '.$periodo),0,1,'C');
$pdf->setY(37);
$pdf->Cell(0,0,utf8_decode('Fecha de Emisión: '.$fecha),0,1,'C');
$pdf->setY(55);
$pdf->SetFont('Times','',18);
$pdf->setY(60);
$pdf->Cell(0,0,utf8_decode('Nombre del alumno: '.$nombred.' '.$paterno.' '.$materno),0,1,'C');
$pdf->setY(70);
$pdf->Cell(0,0,utf8_decode('Número de control: '.$rfc),0,1,'C');
$pdf->setY(80);
$pdf->Cell(0,0,utf8_decode('Cantidad total a pagar: $'.$monto),0,1,'C');

$pdf->AliasNbPages();
//$pdf->AddPage();


mysqli_close($con1);
$pdf->Output('reportePago.pdf','i');//Salida del archivo <PDF></PDF>
?>