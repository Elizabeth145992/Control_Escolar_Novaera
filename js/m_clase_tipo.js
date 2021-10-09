/**/
inicializacion();
sesionUsuario();
var idClase;

$(document).ready(function() {
    var cadVariables = location.search.substring(1,location.search.length);
    var arrVariables = cadVariables.split("&");
    for (i=0; i<arrVariables.length; i++) {
      var arrVariableActual = arrVariables[i].split("=");
      if (isNaN(parseFloat(arrVariableActual[1])))
        eval(arrVariableActual[0]+"='"+unescape(arrVariableActual[1])+"';");
      else
        eval(arrVariableActual[0]+"="+arrVariableActual[1]+";");
    } 

    idClase = parseInt(idC);

    $.post('../php/s_clase_id.php', {clase:idClase}, function(datos){
        if(datos != "Error"){
        datosClase = JSON.parse(datos);
        $('#clase').append('<h5 class="clases">Clase: '+datosClase['data'][0].Nombre_Clase+'</h5>');
        }
    });
});

function registrarAc(){
    pagina ="form_actividad.php?"; 
    valores = "idClase";
    enviarVariables();
}
function verAc(){
    pagina ="m_actividades.php?"; 
    valores = "idClase";
    enviarVariables2();
}

function registrarAs(){
    pagina ="form_asistencia.php?"; 
    valores = "idClase";
    enviarVariables3();
}

function enviarVariables(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 

function enviarVariables2(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 

function enviarVariables3(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 