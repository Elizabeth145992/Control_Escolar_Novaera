<?php 
session_start();
include("header.php");
echo '<script src="../js/m_clase_alumno.js"></script>';
include("principal.html");
?>
        <h5 class="clases">Bienvenido!! Revisa todas tus clases</h5>
        <input type="button" class="btn btn-primary boton_guardar" value="Unirse a grupo" onclick="unirG();">
        <div class="margen_body">
            <hr class="linea">
            <!--Cards para ver las clases-->
            <div id="card_al" class="row row-cols-1 row-cols-md-2 g-4">
</div>
</div>



<!--Modal para unirse a grupo-->
<div class="modal" id="unir1" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="unir2">
                    <p><h3>Unirse a clase</h3></p><br>
                    <div class="form-group"><label for="codigo"><b>Ingrese el código del grupo</b></label><br><br>
                        <input type="text" name="codigo" class="form-control input_tamano_login" id="codigo" maxlength="7" required></div><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger boton_cancelar" data-bs-dismiss="modal">Cancelar</button>
                  <button type="button" class="btn btn-primary boton_guardar" onclick="unirseGrupo();">Unirse</button>
                </div>
              </div>
            </div>
          </div>
<?php 
include("footer.html");
?>
           
            
      