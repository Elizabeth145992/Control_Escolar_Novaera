<?php 
include("header.php");
include("principal.html");
?>
<h5 class="clases">Calificaciones Generales</h5>
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
            <th>Nombre Completo</th>
            <th>Parcial 1</th>
            <th>Parcial 2</th>
            <th>Parcial 3</th>
            <th>Califi. Final</th>
            <th>Editar Calif.</th>
          </tr>
          <td>1</td>
          <td>Cruz Ramírez Elizabeth</td>
          <td>8</td>
          <td>10</td>
          <td>9</td>
          <td>9<td>
              <div class="centro">
          <button class="btn btn-warning btn_table"><i class="far fa-edit"></i></button>
          </div>
          </td>
          </td>
        </thead>
                </table>
              </div>
            </div>
        </div>
        <br><br><br>
        <div class="alinear">
        <button class="btn btn-dark boton_guardar">Generar Reporte PDF</button>
        </div>
        <br><br><br>
        
</div>
<?php 
include("footer.html");
?>