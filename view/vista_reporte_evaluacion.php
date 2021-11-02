<?php 
session_start();
include("header.php");
echo '<script src="../js/m_evaluacion.js"></script>';
include("principal.html");
?>
<h5 class="clases">Reporte de Evaluaciones</h5>
<div class="margen_body margen_abajo">
<hr class="linea">
<br>
<div>

<!--visualiación de calificaciones-->
<div id="tabla2">
<h2 class="centro">Visualiza aquí todas las calificaciones de las evaluaciones de tus alumnos</h2>
<div id=p></div>
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
            <th># de Evaluación</th>
            <th>Calificación</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
        </div>
        <div>
    <input type="input" value="Reporte de Evaluaciones" onclick="reporte();" id="reporte" class="btn btn-dark boton_guardar">
</div>
</div>
</div>
<?php 
include("footer.html");
?>