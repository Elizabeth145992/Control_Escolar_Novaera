/* Este archi servirá para la comunicación del cliente al lenguaje del servidor para la inserción
de un nuevo usuario de tipo padre/tutor*/

$(document).ready(function() {
    $.ajax({
type: "POST",
url: "../php/procesar-estados.php",
data: { estados : "Mexico" } 
}).done(function(data){
$("#estado").html(data);
});
// Obtener municipios
$("#estado").change(function(){
var estado = $("#estado option:selected").val();
$.ajax({
type: "POST",
url: "../php/procesar-estados.php",
data: { municipios : estado } 
}).done(function(data){
$("#municipio").html(data);
});
});
});
function guardarUsuario(){
    var c1 = $('#nombre').val();
    var c2 = $('#paterno').val();
    var c3 = $('#materno').val();
    var c4 = $('#correo').val();
    var c11 = $('#tele').val();
    var c5 = $('#genero').val();
    var c6 = $('#estado').val();
    var c7 = $('#municipio').val();
    var c8 = $('#calle').val();
    var c9 = $('#numero').val();
    var c10 = $('#postal').val();
    var c12 = $('#colonia').val();

    $.post("../php/i_usuario_padre.php",{
        nombre:c1, paterno:c2, materno:c3, correo:c4, tele:c11, genero:c5, estado:c6, municipio:c7,
        calle:c8, numero:c9, postal:c10, colonia:c12}, 
        function(respuesta1){
        if(respuesta1=="Error"){
            document.getElementById('mensaje').innerHTML="No se pudo guardar el nuevo usuario";
            $('#modal_falla').modal('show');
        }
        else{
            var password = respuesta1;
            document.getElementById('mensaje').innerHTML="Se guardo correctamente el usuario. El password es:"+password;
            $('#alumnos').modal('show');
            $("#alumnos").on('hidden.bs.modal', function () {
                recargarpagina();
            });
            }
            
           
    });
}

function recargarpagina() {
     var pagina ="../view/form_usuario_padre.php"; 
        location.href=pagina;
}