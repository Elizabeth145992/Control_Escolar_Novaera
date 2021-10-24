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
<h2 class="centro">Visualiza aquí todas las asistencias de tus alumnos</h2>
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
            <th>Editar Asistencia</th>
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

  <!--Modal para modificar asistencia del alumnos-->
  <div class="modal" id="alumnoasis" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="alumnoasis2">
                    <p><h3>Edición de la asistencia del alumno</h3></p><br>
                    <form action="javascript:editarAsis();" autocomplete="off">
<div class="form_space">
<div class="form-group">
    <label for="estatus" class="form-label">Estatus</label>
  <select id="asis" class="form-select input_tamano_login" aria-label="Default select example" required>
    <option selected>Seleccione</option>
    <option value="1">Normal</option>
    <option value="2">No asistió</option>
    <option value="3">Retardo</option>
    <option value="4">Justificada</option>
</select>
</div>
  <br><br>

  <div class="centro">
  <input type="submit" class="btn btn-primary boton_guardar" value="Guardar">
  </div>
  <br>

</form>
                </div>
              </div>
            </div>
          </div>
<?php 
include("footer.html");
?>