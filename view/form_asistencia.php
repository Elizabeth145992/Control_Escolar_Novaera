<?php 
session_start();
include("header.php");
echo '<script src="../js/i_asistencia.js"></script>';
include("principal.html");
?>

<div class="margen_body">
    <h5 class="clases">Toma de asistencia</h5>
    <hr class="linea">
    <br><br>
      <div id="p"></div>
        <br><br><br>
        <div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de alumnos de la clase</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTableAlumnosA" width="100%" cellspacing="0">
        <thead id="tabla">
          <tr class="table-active">
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Nombre</th>
            <th>Asistencia</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
    <div class="alinear">
        <button class="btn btn-dark boton_guardar">Editar Asistencia</button>
        </div>
</div>

<?php 
include("footer.html");
?>
   