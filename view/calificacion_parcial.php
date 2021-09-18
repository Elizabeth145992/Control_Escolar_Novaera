<?php 
include("header.php");
include("principal.html");
?>
<h5 class="clases">Captura de Calificaciones Parciales</h5>
<div class="margen_body margen_abajo">
<hr class="linea">
<br><br>
<div>
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de alumnos de la clase</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTableAlumnos" width="100%" cellspacing="0">
        <thead id="tabla">
          <tr>
            <th>RFC</th>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Nombre</th>
            <th>Calificación</th>
            <th>Capturar</th>
            <th>Editar Calif.</th>
          </tr>
          <tr>
          <td>1</td>
          <td>Cruz</td>
          <td>Ramírez</td>
          <td>Elizabeth</td>
          <td>---</td>
          <td>
              <div class="centro">
          <button id="editar" class="btn btn-primary btn_table boton_guardar"><i class="far fa-keyboard"></i></button>
          </div>
          </td>
          <td>
              <div class="centro">
          <button class="btn btn-warning btn_table"><i class="far fa-edit"></i></button>
          </div>
          </td>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
</div>
</div>
<?php 
include("footer.html");
?>