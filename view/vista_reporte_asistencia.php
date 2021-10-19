<?php 
session_start();
include("header.php");
echo '<script src="../js/m_asistencia.js"></script>';
include("principal.html");
?>
<h5 class="clases">Reporte de asistecias</h5>
<div class="margen_body margen_abajo">
<hr class="linea">
<br>
<div>

<!--visualiación de calificaciones-->
<div id="tabla2">
<h2 class="centro">Visualiza aquí todas las asistecias de tus alumnos</h2>
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de alumnos de la clase</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTableAlumnosEC" width="100%" cellspacing="0">
        <thead id="tabla">
          <tr>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Nombre</th>
            <th>Fecha</th>
            <th>Tipo de Asistencia</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
        </div>
        <div>
    <input type="input" value="Reporte de asistencia" onclick="reporte();" id="reporte" class="btn btn-dark boton_guardar">
</div>
</div>
</div>
<?php 
include("footer.html");
?>