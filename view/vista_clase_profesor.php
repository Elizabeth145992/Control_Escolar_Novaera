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
    <a href="#" class="btn btn-primary boton_guardar" onclick="registrarAs();">Tomar asistencia</a>
    <br><br>
    <a href="#" class="btn btn-primary boton_guardar">Generar reporte</a>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Actividades</h5>
  <div class="card-body">
    <br>
    <a href="#" class="btn btn-primary boton_guardar"  onclick="verAc();">Ver actividades</a>
    <br><br>
    <a href="#" class="btn btn-primary boton_guardar" onclick="registrarAc();">Nueva actividad</a>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Evaluaciones</h5>
  <div class="card-body">
    <br>
    <a href="#" class="btn btn-primary boton_guardar">Ver evaluaciones</a>
    <br><br>
    <a href="#" class="btn btn-primary boton_guardar">Nueva evaluación</a>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Calificaciones Parciales</h5>
  <div class="card-body">
    <br>
    <a href="#" class="btn btn-primary boton_guardar">Capturar calificación</a>
    <br><br>
    <a href="#" class="btn btn-primary boton_guardar">Generar reporte</a>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Calificaciones Finales</h5>
  <div class="card-body">
    <br>
    <a href="#" class="btn btn-primary boton_guardar">Capturar calificación</a>
    <br><br>
    <a href="#" class="btn btn-primary boton_guardar">Generar reporte</a>
  </div>
</div>
      </div>
  </div>
  <br><br>
<?php 
include("footer.html");
?>
     