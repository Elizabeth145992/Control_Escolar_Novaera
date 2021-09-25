<?php 
session_start();
include("header.php");
include("principal.html");
?>
<h5 class="clases">Nueva Clase</h5>
<div class="margen_body">
<hr class="linea">
<div class="container">
  <div class="row justify-content-md-center">
  <div class="col-3">
    </div>
    <div class="col-8">
<form action="" class="margen_form">
<div class="form_space">
  <div class="mb-3">
    <label for="clase_nombre" class="form-label">Nombre de la Clase</label>
    <input type="text" class="form-control input_tamano" id="clase" name="clase" required>
  </div>
  <div class="mb-3">
    <label for="descripcion" class="form-label">Descripción de la Clase</label>
    <textarea class="form-control input_tamano" name="descripcion" id="descripcion" cols="30" rows="6" required></textarea>
  </div>
  <div class="form-group row">
  <div class="col-4">
    <label for="hora1" class="form-label">Hora de inicio</label>
    <input type="time" class="form-control input_tamano" id="hora_i" name="hora_i" required>
  </div>
  <div class="col-4">
    <label for="hora2" class="form-label">Hora de termino</label>
    <input type="time" class="form-control input_tamano" id="hora_f" name="hora_f" required>
  </div>
  </div>
  <div class="mb-3">
  <label for="nomre_profesor" class="form-label">Profesor</label>
  <select class="form-select input_tamano" aria-label="Default select example" required>
    <option selected>Seleccione</option>
    <option value="1">One</option>
    <option value="2">Two</option>
</select>
  </div>
  <div class="mb-3">
  <label for="nivel" class="form-label">Nivel</label>
  <select class="form-select input_tamano" aria-label="Default select example" required>
    <option selected>Seleccione</option>
    <option value="1">Preescolar</option>
    <option value="2">Primaria</option>
    <option value="2">Secundaria</option>
    <option value="2">Preparatoria</option>
</select>
  </div>
  <div class="form-group row">
  <div class="col-4">
  <label for="grado" class="form-label">Grado</label>
  <select id="grado" class="form-select input_tamano" aria-label="Default select example" required>
    <option selected>Seleccione</option>
    <option value="1">1°</option>
    <option value="2">2°</option>
    <option value="2">3°</option>
    <option value="2">4°</option>
    <option value="2">5°</option>
    <option value="2">6°</option>
</select>
  </div>
  <div class="col-4">
  <label for="grupo" class="form-label">Grupo</label>
  <select id="grupo" class="form-select input_tamano" aria-label="Default select example" required>
    <option selected>Seleccione</option>
    <option value="1">Preescolar</option>
    <option value="2">Primaria</option>
    <option value="2">Secundaria</option>
    <option value="2">Preparatoria</option>
</select>
  </div>
</div>
  <br><br>
  <div class="centro">
  <button type="submit" class="btn btn-primary boton_guardar">Guardar</button>
  </div>
  <br><br>
  </div>
</form>
</div>
</div>
</div>
<?php 
include("footer.html");
?>