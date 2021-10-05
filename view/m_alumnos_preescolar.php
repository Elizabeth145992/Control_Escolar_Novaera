<?php 
session_start();
include("header.php");
echo '<script src="../js/m_usuarios.js"></script>';
include("principal.html");
?>
<h5 class="clases">Alumnos de Preescolar</h5>
<div class="margen_body margen_abajo">
<div id="p"></div>
<hr class="linea">
<br><br>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado de alumnos del nivel Preescolar</h6>
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
            <th>Editar</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
</div>


 <!--Modal para modificar alumnos
 <div class="modal" id="alumno1" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="alumno2">
                    <p><h3>Edición de alumno</h3></p><br>
                    <div class="form-group"><label for="nombre"><b>Nombre</b></label><br><br>
                        <input type="text" name="nombre" class="form-control input_tamano_login" id="nombre" required></div><br>
                        <div class="form-group"><label for="apellidop"><b>Apellido Paterno</b></label><br><br>
                            <input type="text" name="apellidop" class="form-control input_tamano_login" id="apellidop" required></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger boton_cancelar" data-bs-dismiss="modal">Cancelar</button>
                  <button type="button" class="btn btn-primary boton_guardar">Guardar contraseña</button>
                </div>
              </div>
            </div>
          </div>-->

<?php 
include("footer.html");
?>