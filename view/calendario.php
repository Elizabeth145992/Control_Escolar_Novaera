<?php 
session_start();
include("header.php");
echo '<script src="../js/main.js"></script>';
include("principal.html");
?>
<h5 class="clases">Calendario de Actividades</h5>
<div class="margen_body">
    <hr class="linea">
    <div class="carac_calendar">
        <div id='calendar'></div>
    </div>
</div>
<?php 
include("footer.html");
?>
<!--Modal para agregar evento-->
<div class="modal" id="calendario1" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="calendario2">
                    <p><h3>Tipo de evento</h3></p><br>
                    <div class="form-group"><label for="contraseña"><b>Seleccione el tipo de evento</b></label><br>
                    <select id="tipo" class="form-select input_tamano" aria-label="Default select example" required>
                        <option selected>Seleccione</option>
                        <option value="1">Reunión en Teams</option>
                        <option value="2">Reunión en Zoom</option>
                        <option value="3">Otro evento</option>
                    </select><br>
                    <div id="ti" style="display:none;">
                    <label for="titulo" class="form-label"><b>Título del Evento</b></label>
                    <input type="text" class="form-control input_tamano" id="titulo" name="titulo">
                    </div>
                    <br>
                    <div class="form-group"><label for="contraseña"><b>Seleccione la clase</b></label><br>
                    <select id="classe" class="form-select input_tamano" aria-label="Default select example" required>
                    </select><br>
    <label for="actividad_nombre" class="form-label"><b>Hora de Inicio</b></label>
    <input type="time" class="form-control input_tamano" id="hora" name="hora" required>
                    <br><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger boton_cancelar" data-bs-dismiss="modal">Cancelar</button>
                  <button onclick="crearEveTZ();" type="button" class="btn btn-primary boton_guardar">Crear evento</button>
                </div>
              </div>
            </div>
          </div>

          <script>
$('#tipo').change(function() {
   if($(this).val()==3){
        var var2=document.getElementById('ti');
        var2.style.display="block";
    }else{
      var var3=document.getElementById('ti');
        var3.style.display="none";
    }
});
</script>

          
