<?php 
session_start();
include("header.php");
echo '<script src="../js/u_perfil.js"></script>';
include("principal.html");
?>
<h5 class="clases">Mi perfil</h5>
<div class="margen_body">
    <hr class="linea">
    <div class="container">
        <div class="row">
            <div class="col">
            <div class="centro">
                <div id="foto_p"></div>
    <form action="javascript:ufoto();">
    <input id="image" name="image" type="file" value="Cargar imagen"><br><br>
    <input type="submit" class="btn btn-primary boton_guardar" value="Guardar"></div>
    </form>
    </div>

    <div class="col">
    <br><br>
        <div id="perfil"></div>
    </div>
    </div>
    </div>
</div>
<?php 
include("footer.html");
?>