<?php 
session_start();
include("header.php");
echo '<script src="../js/m_biblioteca.js"></script>';
include("principal.html");
?>
<h5 class="clases">Biblioteca Digital</h5>
<div class="margen_body margen_abajo">

<hr class="linea">
<br><br>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de material de la biblioteca digital</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTableDigital" width="100%" cellspacing="0">
        <thead id="tabla">
          <tr>
            <th>Nombre del material</th>
            <th>Descripción</th>
            <th>Nivel</th>
            <th>Grado</th>
            <th>Ver</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
</div>


<!--Modal para visualizar material-->
<div class="modal" id="material1" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="material2">
               <!-- <div class="ratio ratio-16x9">
  <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/GZjt_sA2eso" allowfullscreen></iframe>
  </div>-->
  <!--<img src="../recursos/biblioteca/Captura de pantalla (5).png" alt="" style="width: 475px; height: 400px;">-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger boton_cancelar" data-bs-dismiss="modal">Cancelar</button>
                </div>
              </div>
            </div>
          </div>

          <!--<div id="material1" class="modal-dialog modal-fullscreen-sm-down">...</div>-->

<?php 
include("footer.html");
?>