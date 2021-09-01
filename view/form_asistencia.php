<?php 
include("header.php");
include("principal.html");
?>

<div>
    <h5 class="clases">Toma de asistencia</h5>
    <hr class="linea">
    <br><br>
    <form action="">
        <label for="">Fecha:</label>
        <input type="text">
        <br><br><br>
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
            <th>Asistencia</th>
          </tr>
          <td>1</td>
          <td>Cruz</td>
          <td>Ramírez</td>
          <td>Elizabeth</td>
          <td>
          <input class="form-check-input check_color" type="checkbox" value="" id="flexCheckDefault">
          </td>
        </thead>
                </table>
              </div>
            </div>
        </div>
        <div class="centro">
        <button class="btn btn-primary boton_guardar">Guardar</button>
        </div>
    </form>
    <div class="alinear">
        <button class="btn btn-dark boton_guardar">Editar Asistencia</button>
        </div>
</div>

<?php 
include("footer.html");
?>
   