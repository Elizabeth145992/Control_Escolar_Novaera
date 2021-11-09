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
    <div id="ocultar5">
    <a href="#" class="btn btn-primary boton_guardar" onclick="registrarAs();">Tomar asistencia</a>
    <br><br></div>
    <a href="#" class="btn btn-primary boton_guardar" onclick="reporteAs();">Generar reporte</a>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Actividades</h5>
  <div class="card-body">
    <br>
    <a href="#" class="btn btn-primary boton_guardar"  onclick="verAc();">Ver actividades</a>
    <div id="ocultar4">
    <br>
    <a href="#" class="btn btn-primary boton_guardar" onclick="registrarAc();">Nueva actividad</a></div>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Evaluaciones</h5>
  <div class="card-body">
    <br>
    <a href="#" class="btn btn-primary boton_guardar" onclick="registrarE();">Nueva evaluación</a>
    <div id="ocultar3">
    <br>
    <a href="#" class="btn btn-primary boton_guardar" onclick="reporteE();">Generar reporte</a>
  </div>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Calificaciones Parciales</h5>
  <div class="card-body">
    <br>
    <div id="ocultar2">
    <a href="#" class="btn btn-primary boton_guardar" onclick="registrarCP();">Capturar calificación</a>
    <br><br></div>
    <a href="#" class="btn btn-primary boton_guardar" onclick="reporteP();">Generar reporte</a>
  </div>
</div>
      </div>
      <div class="col separar_card">
      <div id="card_padres" class="card borde sombra centro">
  <h5 class="card-header">Calificaciones Finales</h5>
  <div class="card-body">
    <br>
    <div id="ocultar1">
    <a href="#" class="btn btn-primary boton_guardar"onclick="registrarCF();">Capturar calificación</a>
    <br><br></div>
    <a href="#" class="btn btn-primary boton_guardar" onclick="reporteCF();">Generar reporte</a>
  </div>
</div>
      </div>
  </div>
<?php 
include("footer.html");
?>
     