<?php 
session_start();
include("header.php");
echo '<script src="../js/m_usuarioPago.js"></script>';
include("principal.html");
?>
<h5 class="clases">Registro de Pagos</h5>
<div class="margen_body margen_abajo">
<div id="p"></div>
<hr class="linea">
<br><br>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de alumnos</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTableAlumnosP" width="100%" cellspacing="0">
        <thead id="tabla">
          <tr>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Grado</th>
            <th>Grupo</th>
            <th>Estatus</th>
            <th>Registrar Cantidad</th>
            <th>Consultar pago</th>
            <th>Editar cantidad</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
<br><br>
       
<div>
    <input type="input" value="Registrar pago general" onclick="pagogeneral();" id="reporte" class="btn btn-dark boton_guardar">
</div>
</div>


          <!--Modal para modificar registrar cantidada a pagar-->
 <div class="modal" id="montop" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="montop2">
                    <p><h3>Registro de la cantidad a pagar</h3></p><br>
                    <form action="javascript:rmonto();" autocomplete="off">
<div class="form_space">
<div class="form-group">
    <label for="estatus" class="form-label">Cantidad a pagar</label>
    <input type="number" step="any" name="monto" class="form-control input_tamano_login" id="monto" required>
</div>
  <br><br>

  <div class="centro">
  <input type="submit" class="btn btn-primary boton_guardar" value="Registrar">
  </div>
  <br>
  </div>
</form>
                </div>
              </div>
            </div>
          </div>

                   <!--Modal para modificar registrar cantidada a pagar-->
 <div class="modal" id="montoE" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="montoE2">
                    <p><h3>Edición de la cantidad a pagar</h3></p><br>
                    <form action="javascript:emonto();" autocomplete="off">
<div class="form_space">
<div class="form-group">
    <label for="estatus" class="form-label">Cantidad nueva a pagar</label>
    <input type="number" step="any" name="monto" class="form-control input_tamano_login" id="monto2" required>
</div>
  <br><br>

  <div class="centro">
  <input type="submit" class="btn btn-primary boton_guardar" value="Guardar">
  </div>
  <br>
  </div>
</form>
                </div>
              </div>
            </div>
          </div>

 <!--Modal para registrar cantidad general-->
 <div class="modal" id="montoA" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="montoA2">
                    <p><h3>Registro de la cantidad a pagar</h3></p><br>
                    <form action="javascript:rmontoAll();" autocomplete="off">
<div class="form_space">
<div class="form-group">
    <label for="estatus" class="form-label">Cantidad a pagar</label>
    <input type="number" step="any" name="monto" class="form-control input_tamano_login" id="montoall" required>
</div>
  <br><br>

  <div class="centro">
  <input type="submit" class="btn btn-primary boton_guardar" value="Registrar">
  </div>
  <br>
  </div>
</form>
                </div>
              </div>
            </div>
          </div>          
 
<?php 
include("footer.html");
?>