<?php 
session_start();
include("header.php");
echo '<script src="../js/m_clase_alumnoPadre.js"></script>';
include("principal.html");
?>
        <h5 class="clases">Bienvenido!! Revisa todas tus clases</h5>
        <div class="margen_body">
            <hr class="linea">
            <!--Cards para ver las clases-->
            <div id="card_al" class="row row-cols-1 row-cols-md-2 g-4">
</div>

</div>
<?php 
include("footer.html");
?>