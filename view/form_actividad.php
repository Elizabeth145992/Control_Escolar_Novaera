<?php 
include("header.php");
include("principal.html");
?>
<div>
<h5 class="clases">Registro de actividades</h5>
<hr class="linea">
<div class="form_space">
<form>
  <div class="mb-3">
    <label for="actividad_nombre" class="form-label">Nombre de la actividad</label>
    <input type="text" class="form-control input_tamano" id="actividad" name="actividad" required>
  </div>
  <div class="mb-3">
    <label for="contenido_descripcion" class="form-label">Descripción de la actividad</label>
    <textarea class="form-control input_tamano" name="contenido" id="contenido" cols="30" rows="10" required></textarea>
  </div>
  <div class="mb-3">
  <label for="nomre_recurso" class="form-label">Recurso a usar</label>
  <select class="form-select input_tamano" aria-label="Default select example" required>
    <option selected>Open this select menu</option>
    <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
</select>
  </div>
  <div class="mb-3">
    <label for="fecha_entrega" class="form-label">Fecha de entrega</label>
    <input type="date" class="form-control input_tamano" id="fecha" name="fecha" required>
  </div>
  <br><br>
  <div class="centro">
  <button type="submit" class="btn btn-primary boton_guardar">Guardar</button>
  </div>
  <br><br>
</form>
</div>
</div>

<?php 
include("footer.html");
?>
    