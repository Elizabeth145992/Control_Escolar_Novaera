<?php 
session_start();
include("header.php");
echo '<script src="../js/i_usuario_alumno.js"></script>';
include("principal.html");

?>

<h5  class="clases">Registro de Padre/Tutor</h5>
<div class="margen_body">
<hr class="linea">


<form action="javascript:guardarUsuario();" autocomplete="off">
<div class="form_space">
<div class="row g-3">
<div class="col-1"></div>
<div class="col">
  <br><br>
  <h5>Datos personales</h5>
    <label for="nombre" class="form-label">Nombre</label>
    <input type="text" class="form-control input_tamano" id="nombre" name="nombre" maxlength="60" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+" title="Solamente se permiten letras" required>

    <label for="paterno" class="form-label">Apellido Paterno</label>
    <input type="text" class="form-control input_tamano" id="paterno" name="paterno" maxlength="60" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+" title="Solamente se permiten letras" required>

    <label for="materno" class="form-label">Apellido Materno</label>
    <input type="text" class="form-control input_tamano" id="materno" name="materno" maxlength="60" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+" title="Solamente se permiten letras" required>

    <label for="correo" class="form-label">Correo Eléctronico</label>
    <input type="email" class="form-control input_tamano" id="correo" name="correo" maxlength="100" required>

    <label for="telefono" class="form-label">Teléfono/Celular</label>
    <input type="text" class="form-control input_tamano" id="tele" name="tele" pattern="[0-9]+" title="Ingrese número a 10 dígitos" minlength="10" required>

    <label for="genero" class="form-label">Género</label>
  <select id="genero" class="form-select input_tamano" aria-label="Default select example" required>
    <option selected>Seleccione</option>
    <option value="1">Femenino</option>
    <option value="2">Masculino</option>
    <option value="3">Otro</option>
</select>
</div>
<div class="col">
    <br><br>
    <h5>Datos Escolares</h5>
    <label for="RFC" class="form-label">RFC</label>
    <input type="text" class="form-control input_tamano" id="rfc" name="rfc" pattern="[0-9]+" minlength="6">

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
</div>
<div class="col">
<br><br>
  <h5>Dirección</h5>
  <label for="estado" class="form-label">Estado</label>
  <select id="estado" class="form-select input_tamano" aria-label="Default select example" required>
    <option selected>Seleccione</option>
</select>

<label for="municipio" class="form-label">Municipio</label>
  <select id="municipio" class="form-select input_tamano" aria-label="Default select example" required>
    <option selected>Seleccione</option>
</select>

<label for="colonia" class="form-label">Colonia</label>
    <input type="text" class="form-control input_tamano" maxlength="100" id="colonia" name="colonia" required>

<label for="calle" class="form-label">Calle</label>
    <input type="text" class="form-control input_tamano" maxlength="100" id="calle" name="calle" required>

<label for="numero" class="form-label">Número</label>
    <input type="text" class="form-control input_tamano" id="numero" name="numero" required>

    <label for="postal" class="form-label">Código Postal</label>
    <input type="text" class="form-control input_tamano" id="postal" name="postal" minlength="5" pattern="[0-9]+" title="Solamente se permiten números" required>

</div>
</div>
</div>
  <br><br>

  <div class="centro">
  <input type="submit" class="btn btn-primary boton_guardar" value="Guardar">
  </div>

</form>
<br><br><br>

<h5 style="margin-left:36.5%;">Registre los alumnos por medio de un archivo .csv</h5>
<br>
<input  style="margin-left:20%;" type="file" name="archivo" id="archivo">
<input onclick="registrararchivo();" type="button" class="btn btn-dark boton_guardar" value="Registrar alumnos">

</div>

<?php 
include("footer.html");
?>