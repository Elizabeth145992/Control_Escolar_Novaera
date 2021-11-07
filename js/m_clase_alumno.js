/* */
inicializacion();
sesionUsuario();

$(document).ready(function() {

    $.post('../php/s_clase_alumno.php',{user:idUser},function(datos){
        if(datos != "Error"){
        var datosUsuario = JSON.parse(datos);
        var total = datosUsuario["data"].length;
        for(var i=0;i<total;i++){
            $('#card_al').append('<div class="col">'
            +'<div id="card_alumno" class="card borde sombra tamano">'
            +'<img class="img-fluid" src="../img/'+i+'.jpg" class="card-img-top" alt="clases">'
            +'<div class="card-body">'
            +'<h5 class="card-title">'+datosUsuario["data"][i].Nombre_Clase+' '+datosUsuario["data"][i].Grado+' Grado de '+datosUsuario["data"][i].Nivel+'</h5>'
            +'<h6>Docente: '+datosUsuario["data"][i].Nombre+' '+datosUsuario["data"][i].Apellido_Paterno+' '+datosUsuario["data"][i].Apellido_Materno+'</h6>'
            +'<a href="#" class="btn btn-primary boton_guardar" onclick="claseTA('+datosUsuario["data"][i].Id_Clase+')">Ver</a>'  
            +'</div></div></div>');
        }
        }
        else{
            $('#card_al').append('<p>No hay datos por mostrar</p>');
        }
    });

});

function claseTA(clase){
    idC = clase;
    idU = 0;
    pagina ="vista_clase_alumno.php?"; 
    valores = "idC,idU";
    enviarVariables();
}
function enviarVariables(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 

function unirG(){
    $('#unir1').modal('show');
}

function unirseGrupo(){
    var c1 = $('#codigo').val();

    $.post("../php/i_alumno_clase.php",{codigo:c1, usuario:idUser}, function(r){
        if(r=="Error"){
            $('#unir1').modal('hide');
            document.getElementById('modal-falla2').innerHTML="No se agregó a la clase";
            $('#modal_falla').modal('show');
        }
        else{
            $('#unir1').modal('hide');
          document.getElementById('modal-falla2').innerHTML="SE agregó correctamente a la clase";
          $('#modal_falla').modal('show');
          $("#modal_falla").on('hidden.bs.modal', function () {
          paginacodigo()});;
            }
    });
}

function paginacodigo() {
    var pagina ="../view/pagina_principal.php"; 
       location.href=pagina;
}
