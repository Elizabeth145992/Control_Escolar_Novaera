<?php 
session_start();
include("header.php");
echo '<script src="../js/m_usuarios.js"></script>';
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
      <table class="table table-bordered" id="dataTableAlumnosP3" width="100%" cellspacing="0">
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
<?php 
include("footer.html");
?>