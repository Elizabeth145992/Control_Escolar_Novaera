<?php 
session_start();
include("header.php");
    
    include("principal.html");

    ?>
    
    
        <h5 class="clases">Actividades: Matemáticas</h5>
            <hr class="linea">
            <!--Cards para actividades-->
              <div class="col">
                <p>
                  <div class="card borde sombra">
                    <div class="card-header">
                     <span class="actividad_estilo"><span class="actividad">Actividad 1:</span>Ecuaciones de primer grado<a class="dropdown-toggle pestana" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"></a></span>
                    </div>
                  </div>
                </p>
                <div class="collapse" id="collapseExample">
                  <div class="card card-body borde sombra texto_actividad">
                    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
                  </div>
                </div>
              </div>
              
              <div class="col">
                <p>
                  <div class="card borde sombra">
                    <div class="card-header">
                    <span class="actividad_estilo"><span class="actividad">Actividad 1:</span>Ecuaciones de primer grado<a class="dropdown-toggle pestana" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2"></a></span>
                    </div>
                  </div>
                </p>
                <div class="collapse" id="collapseExample2">
                  <div class="card card-body borde sombra texto_actividad">
                    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
                  </div>
                </div>
              </div>
              
              <div class="col">
                <p>
                  <div class="card borde sombra">
                    <div class="card-header">
                    <span class="actividad_estilo"><span class="actividad">Actividad 1:</span>Ecuaciones de primer grado<a class="dropdown-toggle pestana" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample3"></a></span>
                    </div>
                  </div>
                </p>
                <div class="collapse" id="collapseExample3">
                  <div class="card card-body borde sombra texto_actividad">
                    Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger.
                  </div>
                </div>
              </div>


<?php 
include("footer.html");
    ?>
           