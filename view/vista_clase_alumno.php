<?php 
session_start();
include("header.php");
echo '<script src="../js/m_clase_tipo.js"></script>';
include("principal.html");
?>
 <div id="clase"></div>
  <hr class="linea">
  <div class="row row-cols-1 row-cols-md-2 g-4">
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Listado de Asistencia</h5>
  <div class="card-body">
    <br>
    <a href="#" class="btn btn-primary boton_guardar" onclick="verAs();">Ver asistencias</a>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Actividades</h5>
  <div class="card-body">
    <br>
    <a href="#" class="btn btn-primary boton_guardar"  onclick="verAc();">Ver actividades</a>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Evaluaciones</h5>
  <div class="card-body">
    <br>
    <a href="#" class="btn btn-primary boton_guardar" onclick="verEv();">Ver evaluaciones</a>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Calificaciones Parciales</h5>
  <div class="card-body">
    <br>
    <a href="#" class="btn btn-primary boton_guardar" onclick="verCP();">Ver Calificaciones</a>
  </div>
</div>
      </div>
  </div>

<!--Modal para asistencia-->
  <div class="modal" id="tabla_asis" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" width="100%">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
            <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" id="tablaasis2">
            <h6 class="centro">Mis asistencias</h6><br>
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Listado de asistencias</h6>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTableAsis" width="100%" cellspacing="0">
                    <thead id="tabla">
                      <tr>
                        <th>Fecha</th>
                        <th>Tipo de asistencia</th>
                      </tr>
                    </thead>
                            </table>
                          </div>
                        </div>
                    </div>
          </div>
        </div>
      </div>
    </div> 

    <!--Modal para calificaciones-->
  <div class="modal" id="tabla_calif" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" width="100%">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
            <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" id="tabla_calif2">
            <h6 class="centro">Mis calificaciones</h6><br>
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Listado de calificaciones</h6>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTablecalifP" width="100%" cellspacing="0">
                    <thead id="tabla">
                      <tr>
                        <th>Bloque/Parcial</th>
                        <th>Calificación</th>
                      </tr>
                    </thead>
                            </table>
                          </div>
                        </div>
                    </div>
          </div>
        </div>
      </div>
    </div> 

    <!--Modal para evaluaciones-->
  <div class="modal" id="tabla_eva" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" width="100%">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
            <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" id="tabla_eva2">
            <h6 class="centro">Mis Evaluaciones</h6><br>
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Listado de Evaluaciones</h6>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTableEva" width="100%" cellspacing="0">
                    <thead id="tabla">
                      <tr>
                        <th># de evaluación</th>
                        <th>Calificación</th>
                      </tr>
                    </thead>
                            </table>
                          </div>
                        </div>
                    </div>
          </div>
        </div>
      </div>
    </div> 
<?php 
include("footer.html");
?>
     