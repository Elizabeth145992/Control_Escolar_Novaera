<?php 
session_start();
include("header.php");
echo '<script src="../js/i_clase.js"></script>';
include("principal.html");

?>

<h5 class="clases">Registro de nueva clase</h5>
<div class="margen_body">
<hr class="linea">


<form action="javascript:guardarClase();" autocomplete="off">
<div class="form_space">
<div class="row g-3">
<div class="col-2"></div>
<div class="col">
  <br><br>
    <label for="nombreC" class="form-label">Nombre de la clase</label>
    <input type="text" class="form-control input_tamano" id="nombreC" name="nombreC" maxlength="100" required>

    <label for="descripcion" class="form-label">Descripción de la Clase</label>
    <textarea class="form-control input_tamano" name="descripcion" id="descripcion" cols="30" rows="6" required></textarea>

    <label for="horaI" class="form-label">Hora de inicio de clase</label>
    <input type="time" class="form-control input_tamano" id="horaI" name="horaI" required>

    <label for="horaT" class="form-label">Hora de termino de la clase</label>
    <input type="time" class="form-control input_tamano" id="horaT" name="HoraT" required>
</div>

<div class="col">
<br><br>
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

<label for="periodo" class="form-label">Periodo</label>
  <select id="periodo" class="form-select input_tamano" aria-label="Default select example" required>
</select>
</div>
</div>
</div>
  <br><br>

  <div class="centro">
  <input type="submit" class="btn btn-primary boton_guardar" value="Guardar">
  </div>
  <br><br>

</form>
</div>

<?php 
include("footer.html");
?>