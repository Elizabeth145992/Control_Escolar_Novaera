<?php 
session_start();
include("header.php");
echo '<script src="../js/m_usuarios.js"></script>';
include("principal.html");
?>
        <h5 class="clases">Clases: 3° Grado de Secundaria</h5>
        <div id="prueba"></div>
        <div class="margen_body">
            <hr class="linea">
            <br><br>
            <div class="row row-cols-1 row-cols-md-3 g-4">
<!--Card para que los padres vean las clases de sus hijos, para control, para Admin-->
<div class="col-sm-6">
<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">
  <h5 class="card-header">Alumnos Preescolar</h5>
  <div class="card-body">
    <h6 class="card-title">Visualización y edición de alumnos</h6><br>
    <a href="m_alumnos_preescolar.php" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div><br>
<div class="col-sm-6">
<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">
  <h5 class="card-header">Alumnos Primaria</h5>
  <div class="card-body">
    <h6 class="card-title">Visualización y edición de alumnos</h6><br>
    <a href="m_alumnos_primaria.php" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div><br>
<div class="col-sm-6">
<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">
  <h5 class="card-header">Alumnos Secundaria</h5>
  <div class="card-body">
    <h6 class="card-title">Visualización y edición de alumnos</h6><br>
    <a href="m_alumnos_secundaria.php" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div><br>
<div class="col-sm-6">
<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">
  <h5 class="card-header">Alumnos Preparatoria</h5>
  <div class="card-body">
    <h6 class="card-title">Visualización y edición de alumnos</h6><br>
    <a href="m_alumnos_preparatoria.php" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div><br>
<div class="col-sm-6">
<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">
  <h5 class="card-header">Personal Escolar</h5>
  <div class="card-body">
    <h6 class="card-title">Visualización y edición de empleados</h6><br>
    <a href="#" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div>
<br><br>
</div><br>
</div>
<br><br>

 <!--Modal para crear nuevo periodo-->
 <div class="modal fade" id="periodo1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Instituto Novaera</h5>
            <button type="button" class="btn-close" id="close2" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" id="periodo2">
              <p><h3>Nuevo Periodo Escolar</h3></p><br>
              <form action="javascript:guardarPeriodo();" autocomplete="off">
              <div class="form-group">
                <label for="nombreP"><b>Nombre del periodo</b></label><br><br>
                  <input type="text" name="nombreP" class="form-control input_tamano_login" id="nombreP" maxlength="100" required></div><br>
                  <div class="form-group"><label for="inicio"><b>Fecha de Inicio</b></label><br><br>
                      <input type="date" name="inicio" class="form-control input_tamano_login" id="inicio" required></div><br>
                    <div class="form-group"><label for="termino"><b>Fecha de Termino</b></label><br><br>
                  <input type="date" name="termino" class="form-control input_tamano_login" id="termino"required></div>
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-danger boton_cancelar" data-bs-dismiss="modal">Cancelar</button>
            <input type="submit" class="btn btn-primary boton_guardar" value="Guardar Periodo">
            </form>
          </div>
        </div>
      </div>
    </div>
<?php 
include("footer.html");
?>
           
            
      