<?php 
session_start();
include("header.php");
echo '<script src="../js/i_calific_final.js"></script>';
include("principal.html");
?>
<h5 class="clases">Captura de Calificaciones Finales</h5>
<div class="margen_body margen_abajo">
<hr class="linea">
<br>
<div>
<h2 class="centro">Captura de calificaciones</h2>
  <!--Captura de calificaciones-->
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de alumnos de la clase</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTableAlumnosCC" width="100%" cellspacing="0">
        <thead id="tabla">
          <tr>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Nombre</th>
            <th>Capturar</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
        <br><br>
<!--Edición de calificaciones-->
<div id="tabla2">
<h2 class="centro">Edición de calificaciones</h2>
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de alumnos de la clase</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTableAlumnosEC" width="100%" cellspacing="0">
        <thead id="tabla">
          <tr>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Nombre</th>
            <th>Calificación</th>
            <th>Capturar</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
        </div>

</div>
</div>



 <!--Modal para captura de calificaciones parciales-->
 <div class="modal" id="c1" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="c2">
                    <p><h3>Captura de Calificación Final</h3></p><br>
                    <form action="javascript:capturaCF();">
                    <div class="form-group"><label for="cal"><b>Calificación</b></label><br><br>
                        <input type="number" step="any" name="cal" class="form-control input_tamano_login" id="cal" required></div><br>
                       
                </div>
                <div class="modal-footer">
                <input type="submit" class="btn btn-primary boton_guardar" value="Guardar Calificación">
                  </form>
                </div>
                
              </div>
            </div>
          </div>

<!--Modal para edición de calificaciones parciales-->
<div class="modal" id="e1" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="e2">
                    <p><h3>Edición de Calificación Final</h3></p><br>
                    <div id="p"></div>
                    <form action="javascript:edicionCF();">
                    <div class="form-group"><label for="edit"><b>Nueva Calificación</b></label><br><br>
                        <input type="number" step="any" name="edit" class="form-control input_tamano_login" id="edit" required></div><br> 
                </div>
                <div class="modal-footer">
                <input type="submit" class="btn btn-primary boton_guardar" value="Guardar Calificación">
                  </form>
                </div>
                
              </div>
            </div>
          </div>
<?php 
include("footer.html");
?>