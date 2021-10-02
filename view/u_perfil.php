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
    <img id="foto_perfil" class="img-profile2 rounded-circle" src="../img/k.jpg"><br><br>

    <form action="../u_img.php">
    <input id="image" name="image" type="file" value="Cargar imagen"><br><br>
    <a type="submit" name="submit" class="btn btn-primary boton_guardar">Guardar foto</a></div>
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