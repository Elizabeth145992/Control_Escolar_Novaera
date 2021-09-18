<?php 
include("header.php");
include("principal.html");
?>
<h5 class="clases">Mi perfil</h5>
<div class="margen_body">
    <hr class="linea">
    <div class="container">
        <div class="row">
            <div class="col">
            <div class="centro">
    <img class="img-profile2 rounded-circle" src="../img/k.jpg"><br><br>
    <input type="file" value="Cargar imagen"><br><br>
    <a href="#" class="btn btn-primary boton_guardar">Guardar foto</a></div>
    </div>
    <div class="col">
    <form action="">
        <br><br>
        <label for="" class="form-label">Nombre completo:</label>
        <input type="text" class="form-control input_tamano" placeholder="Elizabeth Cruz Ramírez"><br>
        <label for="" class="form-label">Correo electrónico:</label>
        <input type="text" class="form-control input_tamano" placeholder="ecruz@novaer.edu.mx"><br>
        <label for="" class="form-label">Dirección:</label>
        <input type="text" class="form-control input_tamano" placeholder="1ra. Priv. Vasco de Quiroda #8"><br>
        <label for="" class="form-label">Teléfono:</label>
        <input type="text" class="form-control input_tamano" placeholder="4454623136"><br>
        <label for="" class="form-label">Tipo de usuario:</label>
        <input type="text" class="form-control input_tamano" placeholder="Alumno"><br>
    </form>
    </div>
    </div>
    </div>
</div>
<?php 
include("footer.html");
?>