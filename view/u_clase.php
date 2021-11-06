<?php 
session_start();
include("header.php");
echo '<script src="../js/u_clase.js"></script>';
include("principal.html");
?>
<h5 class="clases">Clases registradas en el sistema</h5>
<div class="margen_body margen_abajo">
<div id="p"></div>
<hr class="linea">
<br><br>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de clases</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTableClase" width="100%" cellspacing="0">
        <thead id="tabla">
          <tr>
            <th>Nombre de la clase</th>
            <th>Descripción</th>
            <th>Hora de inicio</th>
            <th>Hora de fin</th>
            <th>Nivel</th>
            <th>Grado</th>
            <th>Grupo</th>
            <th>Periodo</th>
            <th>Apellido paterno del Docente</th>
            <th>Nombre del Docente</th>
            <th>Estatus</th>
            <th>Registrar alumnos en clase</th>
            <th>Editar</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
</div>

 <!--Modal para registrar alumnos en clase-->
 <div class="modal" id="alumnoc" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="alumnoc2">
                <p><h3>Registre a los alumnos de a la clase por medio de un archivo .csv</h3></p><br>
                <input  style="margin-left:20%;" type="file" name="archivo" id="archivos">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger boton_cancelar" data-bs-dismiss="modal">Cancelar</button>
                  <button type="button" class="btn btn-primary boton_guardar" onclick="alumnos();">Registrar</button>
                </div>
              </div>
            </div>
          </div>

<!--Modal para modificar clases-->
<div class="modal" id="clase1" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="clase2">
                    <p><h3>Edición de clases</h3></p><br>
                    <form action="javascript:editarClase();" autocomplete="off">
<div class="form_space">
<div class="row g-2">
<div class="col-1"></div>
<div class="col">
    <label for="nombre" class="form-label">Nombre de la clase</label>
    <input type="text" class="form-control input_tamano" id="nombreC" name="nombreC" maxlength="100" required>

    <label for="paterno" class="form-label">Descripción</label>
    <textarea class="form-control input_tamano" name="descripcion" id="descripcion" cols="30" rows="6" required></textarea>

    <label for="horaI" class="form-label">Hora de inicio de clase</label>
    <input type="time" class="form-control input_tamano" id="horaI" name="horaI" required>

    <label for="horaT" class="form-label">Hora de termino de la clase</label>
    <input type="time" class="form-control input_tamano" id="horaT" name="HoraT" required>
</div>

<div class="col">
<label for="docente" class="form-label">Docente</label>
  <select id="docente" class="form-select input_tamano" aria-label="Default select example" required>
</select>

  <label for="nivel" class="form-label">Nivel</label>
  <select id="nivel" class="form-select input_tamano" aria-label="Default select example" required>
  <option selected>Seleccione</option>
    <option value="1">Preescolar</option>
    <option value="2">Primaria</option>
    <option value="3">Secundaria</option>
    <option value="4">Preparatoria</option>
</select>

<label for="grado" class="form-label">Grado</label>
  <select id="grado" class="form-select input_tamano" aria-label="Default select example" required>
  <option selected>Seleccione</option>
    <option value="1">1°</option>
    <option value="2">2°</option>
    <option value="3">3°</option>
    <option value="4">4°</option>
    <option value="5">5°</option>
    <option value="6">6°</option>
</select>

<label for="grupo" class="form-label">Grupo</label>
  <select id="grupo" class="form-select input_tamano" aria-label="Default select example" required>
  <option selected>Seleccione</option>
    <option value="1">A</option>
    <option value="2">B</option>
    <option value="3">C</option>
    <option value="4">D</option>
    <option value="5">E</option>
    <option value="6">F</option>
</select>

<label for="estatus" class="form-label">Estatus</label>
  <select id="estatus" class="form-select input_tamano" aria-label="Default select example" required>
  <option selected>Seleccione</option>
    <option value="1">Activo</option>
    <option value="2">Inactivo</option>
</select>
</div>
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