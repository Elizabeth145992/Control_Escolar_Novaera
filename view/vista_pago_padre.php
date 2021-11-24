<?php 
session_start();
include("header.php");
echo '<script src="../js/m_padrePago.js"></script>';
include("principal.html");
?>
<h5 class="clases">Reporte de pagos</h5>
<div class="margen_body margen_abajo">
<div id="p"></div>
<hr class="linea">
<br><br>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de mis hijos</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTableHijosP" width="100%" cellspacing="0">
        <thead id="tabla">
          <tr>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Nombre</th>
            <th>Periodo</th>
            <th>Generar reporte de pago</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
<br><br>
</div>


<?php 
include("footer.html");
?>