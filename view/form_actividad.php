<?php 
session_start();
include("header.php");
echo '<script src="../js/i_actividad.js"></script>';
include("principal.html");
?>

<h5 class="clases">Registro de actividades</h5>
<div class="margen_body margen_abajo">
<div id="p"></div>

<hr class="linea">

<div class="container">
  <div class="row justify-content-md-center">
  <div class="col-3">
    </div>
    <div class="col-8">
<form action="javascript:guardarAc();" class="margen_form" enctype="multipart/form-data">
<div class="form_space">
<div class="mb-3">
    <label for="actividad_nombre" class="form-label">Nombre de la actividad</label>
    <input type="text" class="form-control input_tamano" id="activi" name="actividad" required>
  </div>
  <div class="mb-3">
    <label for="contenido_descripcion" class="form-label">Descripción de la actividad</label>
    <textarea class="form-control input_tamano" name="contenido" id="contenido" cols="30" rows="10" required></textarea>
  </div>
 <div class="mb-3">
    <label for="actividad_nombre" class="form-label">Actividad</label>
    <input type="file" class="form-control input_tamano" id="archi" name="archi" required>
  </div>
  <div class="mb-3">
    <label for="fecha_entrega" class="form-label">Fecha de entrega</label>
    <input type="date" class="form-control input_tamano" id="fecha" name="fecha" required>
  </div>
  <br><br>
  <div class="centro">
  <input type="submit" class="btn btn-primary boton_guardar" value="Guardar">
  </div>
  </div>
</form>
</div>
</div>
</div>
</div>
<?php 
include("footer.html");
?>
    