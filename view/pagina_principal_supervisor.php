<?php 
session_start();
include("header.php");
echo '<script src="../js/m_docentes_supervisor.js"></script>';
include("principal.html");
?>
<h5 class="clases">¡Bienvenido!</h5>
<div class="margen_body margen_abajo">
<div id="p"></div>
<hr class="linea">
<br><br>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de los docentes</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTablePersonal" width="100%" cellspacing="0">
        <thead id="tabla">
          <tr>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Teléfono</th>
            <th>Ver Clases</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
</div>

<!--Modal para mostrar alumnos y elegirlos--> 
     <div class="modal" id="clasesD" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" width="100%">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
            <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" id="claseD2">
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Listado de clases de los docentes</h6>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTableDocente" width="100%" cellspacing="0">
                    <thead id="tabla">
                      <tr>
                        <th>Nombre de la clase</th>
                        <th>Nivel</th>
                        <th>Grado</th>
                        <th>Grupo</th>
                        <th>Ver</th>
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