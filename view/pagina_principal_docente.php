<?php 
session_start();
include("header.php");
echo '<script src="../js/m_clase.js"></script>';
include("principal.html");
?>
        <h5 class="clases">Revisa todas tus clases!!!</h5>
        <div id="p"></div>
        <div class="margen_body">
            <hr class="linea">
            <br>
            <div id="card_clase" class="row row-cols-1 row-cols-md-3 g-4">
<!--Card para que los padres vean las clases de sus hijos, para control, para Admin-->

</div>
</div>


<?php 
include("footer.html");
?>
           
            
      