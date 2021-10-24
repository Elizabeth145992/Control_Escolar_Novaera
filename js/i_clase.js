/* Este archivo servirá para la comunicación del cliente al lenguaje del servidor para la inserción
de una nueva clase*/

inicializacion();

$(document).ready(function() {
    $('#periodo').empty();
    $('#docente').empty();
    $.get("../php/s_seleccionar_datos.php?tipo=1", function(datos){  
        if(datos!="Error"){
            var datosP = JSON.parse(datos);
            $('#docente').append('<option selected>Seleccione</option>');
                for(var i=0;i<datosP["data"].length;i++){
                    $('#docente').append('<option value="'+datosP["data"][i].Id_Personal_Escolar+'">'
                    +datosP["data"][i].Nombre+' '+datosP["data"][i].Apellido_Paterno+' '+datosP["data"][i].Apellido_Materno+'</option>');
                }
        }      
    });
    
    $.get("../php/s_seleccionar_datos.php?tipo=2", function(datos){  
        if(datos!="Error"){
            var datosPe = JSON.parse(datos);
            $('#periodo').append('<option selected>Seleccione</option>');
                for(var i=0;i<datosPe["data"].length;i++){
                    $('#periodo').append('<option value="'+datosPe["data"][i].Id_Periodo+'">'
                    +datosPe["data"][i].Nombre+'</option>');
                }
        }      
    });
});

function guardarClase(){
    var c1 = $('#nombreC').val();
    var c2 = $('#descripcion').val();
    var c3 = $('#horaI').val();
    var c4 = $('#horaT').val();
    var c5 = $('#docente').val();
    var c6 = $('#nivel').val();
    var c7 = $('#grado').val();
    var c8 = $('#grupo').val();
    var c9 = $('#periodo').val();

    $.post("../php/i_clase.php",{
        nombre:c1, descri:c2, horaI:c3, horaT:c4, docente:c5, nivel:c6, grado:c7, grupo:c8,
        periodo:c9}, 
        function(respuesta1){
        if(respuesta1=="Error"){
            document.getElementById('modal-falla2').innerHTML="No se pudo crear la clase";
            $('#modal_falla').modal('show');
        }
        else{
            var codigo = respuesta1;
            document.getElementById('modal-falla2').innerHTML="Se creo correctamente la clase";
            $('#modal_falla').modal('show');
            $("#modal_falla").on('hidden.bs.modal', function () {
            recargarpaginaC()});
        }
    });
}

function recargarpaginaC() {
     var pagina ="../view/form_clase.php"; 
        location.href=pagina;
}
function recargarpaginaPA() {
    var pagina ="../view/pagina_principal_admin.php"; 
       location.href=pagina;
}