<?php 
session_start();
include("header.php");
echo '<script src="../js/i_biblioteca.js"></script>';
include("principal.html");
?>

<h5 class="clases">Registro de Nuevo Material en Biblioteca Digital</h5>
<div class="margen_body margen_abajo">
<div id="p"></div>

<hr class="linea">

<div class="container">
  <div class="row justify-content-md-center">
  <div class="col-3">
    </div>
    <div class="col-8">
<form action="javascript:guardarMaterial();" class="margen_form" enctype="multipart/form-data">
<div class="form_space">
<div class="mb-3">
    <label for="actividad_nombre" class="form-label">Nombre del Material</label>
    <input type="text" class="form-control input_tamano" id="nmaterial" name="actividad" required>
  </div>
  <div class="mb-3">
    <label for="contenido_descripcion" class="form-label">Descripción del Material</label>
    <textarea class="form-control input_tamano" name="contenido" id="des" cols="30" rows="10" required></textarea>
  </div><br>
  <div class="mb-3">
      <p>NOTA: Los archivos Word, Excel, Power Point no serán visibles en el sistema,<br> solo serán descargables</p>
  <label for="grado" class="form-label">Tipo de material</label>
  <select id="tmaterial" class="form-select input_tamano" aria-label="Default select example" required>
  <option selected>Seleccione</option>
    <option value="1">Imagen</option>
    <option value="2">Archivo PDF</option>
    <option value="3">Archivo Word, Excel, Power Point</option>
    <option value="4">Video de YouTube</option>
    <option value="5">Link de Página</option>
</select>
  </div>

 <div id="marchi" class="mb-3" style="display:none;">
    <label for="actividad_nombre" class="form-label">Material</label>
    <input type="file" class="form-control input_tamano" id="archi" name="archi">
  </div>

  <div id="mlink" class="mb-3" style="display:none;">
    <label for="actividad_nombre" class="form-label">Link del Material(YouTube, Página web)</label>
    <input type="text" class="form-control input_tamano" id="link" name="archi">
  </div>

  <div class="mb-3">
  <label for="nivel" class="form-label">Nivel</label>
  <select id="nivel" class="form-select input_tamano" aria-label="Default select example" required>
  <option selected>Seleccione</option>
    <option value="1">Preescolar</option>
    <option value="2">Primaria</option>
    <option value="3">Secundaria</option>
    <option value="4">Preparatoria</option>
</select>
  </div>

  <div class="mb-3">
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

<script>
$('#tmaterial').change(function() {

   // alert('The option with value ' + $(this).val() + ' and text ' + $(this).text() + ' was selected.');
   if($(this).val()==1 || $(this).val()==2 || $(this).val()==3){
        var var2=document.getElementById('marchi');
        var2.style.display="block";
        var var3=document.getElementById('mlink');
        var3.style.display="none";
    }else if($(this).val()==4 || $(this).val()==5){
        var var2=document.getElementById('mlink');
        var2.style.display="block";
        var var3=document.getElementById('marchi');
        var3.style.display="none";
    }
});
</script>
<?php 
include("footer.html");
?>