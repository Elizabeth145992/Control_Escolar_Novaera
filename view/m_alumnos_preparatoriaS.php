<?php 
session_start();
include("header.php");
echo '<script src="../js/m_usuarioPrepS.js"></script>';
include("principal.html");
?>
<h5 class="clases">Alumnos de Preparatoria</h5>
<div class="margen_body margen_abajo">
<div id="p"></div>
<hr class="linea">
<br><br>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de alumnos del nivel Preparatoria</h6>
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
            <th>Teléfono</th>
            <th>Municipio</th>
            <th>Calle</th>
            <th>Número</th>
            <th>Colonia</th>
            <th>Grado</th>
            <th>Grupo</th>
            <th>Calif. Finales</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
</div>


    <!--Modal para calificaciones parciales-->
    <div class="modal" id="tabla_calif" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" width="100%">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
            <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" id="tabla_calif2">
            <h6 class="centro">Calificaciones</h6><br>
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Listado de calificaciones</h6>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTablecalifP" width="100%" cellspacing="0">
                    <thead id="tabla">
                      <tr>
                        <th>Nombre de la clase</th>
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