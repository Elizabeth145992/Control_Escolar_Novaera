<?php 
include("header.php");
echo '<script src="../js/i_usuario_padre.js"></script>';
include("principal.html");

?>

<h5 class="clases">Registro de Padre/Tutor</h5>
<div class="margen_body">
<hr class="linea">


<form action="javascript:guardarUsuario();" autocomplete="off">
<div class="form_space">
<div class="row g-3">
<div class="col-2"></div>
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
    <option value="2">Otro</option>
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
  <br><br>

</form>
</div>

<?php 
include("footer.html");
?>