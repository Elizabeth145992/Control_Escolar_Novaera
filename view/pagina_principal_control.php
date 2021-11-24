<?php 
session_start();
include("header.php");
echo '<script src="../js/i_clase.js"></script>';
include("principal.html");
?>
        <h5 class="clases">Bienvenido!!!</h5>
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
    <a href="m_alumnos_preescolar_c.php" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div><br>
<div class="col-sm-6">
<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">
  <h5 class="card-header">Alumnos Primaria</h5>
  <div class="card-body">
    <h6 class="card-title">Visualización y edición de alumnos</h6><br>
    <a href="m_alumnos_primaria_c.php" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div><br>
<div class="col-sm-6">
<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">
  <h5 class="card-header">Alumnos Secundaria</h5>
  <div class="card-body">
    <h6 class="card-title">Visualización y edición de alumnos</h6><br>
    <a href="m_alumnos_secundaria_c.php" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div><br>
<div class="col-sm-6">
<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">
  <h5 class="card-header">Alumnos Preparatoria</h5>
  <div class="card-body">
    <h6 class="card-title">Visualización y edición de alumnos</h6><br>
    <a href="m_alumnos_preparatoria_c.php" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div><br>
<div class="col-sm-6">
<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">
  <h5 class="card-header">Personal Escolar</h5>
  <div class="card-body">
    <h6 class="card-title">Visualización y edición de empleados</h6><br>
    <a href="m_personal_escolarC.php" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div>
<div class="col-sm-6">
<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">
  <h5 class="card-header">Padres de familia/Tutores</h5>
  <div class="card-body">
    <h6 class="card-title">Visualización y edición de empleados</h6><br>
    <a href="m_padres.php" class="btn btn-primary boton_guardar">Vizualizar</a><br><br>
  </div>
</div>
</div>
</div>
</div>
<br><br>

<?php 
include("footer.html");
?>
           
            
      