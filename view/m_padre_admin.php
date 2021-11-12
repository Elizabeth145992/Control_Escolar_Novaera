<?php 
session_start();
include("header.php");
echo '<script src="../js/m_padreA.js"></script>';
include("principal.html");
?>
<h5 class="clases">Padres de Familia/Tutores</h5>
<div class="margen_body margen_abajo">
<div id="p"></div>
<hr class="linea">
<br><br>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Listado del padres de famila/tutores</h6>
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
            <th>Municipio</th>
            <th>Calle</th>
            <th>Número</th>
            <th>Colonia</th>
            <th>Editar</th>
          </tr>
        </thead>
                </table>
              </div>
            </div>
        </div>
</div>
 <!--Modal para modificar padre-->
 <div class="modal" id="padre1" tabindex="-1" ole="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
                  <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="padre2">
                    <p><h3>Edición de Padres de familia/tutores</h3></p><br>
                    <form action="javascript:editarUsuario();" autocomplete="off">
<div class="form_space">
<div class="row g-2">
<div class="col-1"></div>
<div class="col">
  <h5>Datos personales</h5>
    <label for="nombre" class="form-label">Nombre</label>
    <input type="text" class="form-control input_tamano" id="nombre" name="nombre" maxlength="60" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+" title="Solamente se permiten letras" required>

    <label for="paterno" class="form-label">Apellido Paterno</label>
    <input type="text" class="form-control input_tamano" id="paterno" name="paterno" maxlength="60" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+" title="Solamente se permiten letras" required>

    <label for="materno" class="form-label">Apellido Materno</label>
    <input type="text" class="form-control input_tamano" id="materno" name="materno" maxlength="60" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+" title="Solamente se permiten letras" required>

    <label for="correo" class="form-label">Correo Eléctronico</label>
    <input type="email" class="form-control input_tamano" id="correo" name="correo" maxlength="100" required>

    <label for="telefono" class="form-label">Teléfono/Celular</label>
    <input type="text" class="form-control input_tamano" id="tele" name="tele" pattern="[0-9]+" title="Ingrese número a 10 dígitos" minlength="10" required>

    <label for="genero" class="form-label">Género</label>
  <select id="genero" class="form-select input_tamano" aria-label="Default select example" required>
    <option selected>Seleccione</option>
    <option value="1">Femenino</option>
    <option value="2">Masculino</option>
    <option value="3">Otro</option>
</select>
</div>
</div>
<br>
<div class="row g-3">
<div class="col-1"></div>
<div class="col-1"></div>
<div class="col-1"></div>
<div class="col">
  <h5>Dirección</h5>
  <label for="estado" class="form-label">Estado</label>
  <select id="estado" class="form-select input_tamano" aria-label="Default select example" required>
    <option selected>Seleccione</option>
</select>

<label for="municipio" class="form-label">Municipio</label>
    <input type="text" class="form-control input_tamano" maxlength="100" id="municipio" name="municipio" required>

<label for="colonia" class="form-label">Colonia</label>
    <input type="text" class="form-control input_tamano" maxlength="100" id="colonia" name="colonia" required>

<label for="calle" class="form-label">Calle</label>
    <input type="text" class="form-control input_tamano" maxlength="100" id="calle" name="calle" required>

<label for="numero" class="form-label">Número</label>
    <input type="text" class="form-control input_tamano" id="numero" name="numero" required>

    <label for="postal" class="form-label">Código Postal</label>
    <input type="text" class="form-control input_tamano" id="postal" name="postal" minlength="5" pattern="[0-9]+" title="Solamente se permiten números" required>
</div>
</div>
</div>
  <br><br>

  <div class="centro">
  <input type="submit" class="btn btn-primary boton_guardar" value="Guardar">
  </div>
  <br>

</form>
                </div>
              </div>
            </div>
          </div>

<?php 
include("footer.html");
?>