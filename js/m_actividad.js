/* */
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

    idClase = parseInt(idClase);
    $.post('../php/s_clase_id.php', {clase:idClase}, function(datos){
        if(datos != "Error"){
        datosClase = JSON.parse(datos);
        $('#clase1').append('<h5 class="clases">Clase: '+datosClase['data'][0].Nombre_Clase+'</h5>');
        }
    });
    m_actividad();
});

function m_actividad(){
    $.post("../php/s_actividad.php",{clase:idClase}, function(datos){
        if(datos != "Error"){
            datosactividad = JSON.parse(datos);
            var total = datosactividad["data"].length;
            for(var i=0;i<total;i++){
                $('#actividad').append('<div class="col"><p>'
                  +'<div class="card borde sombra"><div class="card-header">'
                  +'<span class="actividad_estilo"><span class="actividad">Actividad '+[i+1]+':</span>'+datosactividad['data'][i].Nombre_Actividad+'' 
                  +'<a class="dropdown-toggle pestana" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample'+i+'"' 
                  +'aria-expanded="false" aria-controls="collapseExample"></a></span></div></div></p>'
                  +'<div class="collapse" id="collapseExample'+i+'">'
                  +'<div class="card card-body borde sombra texto_actividad">'
                  +'<embed src="'+datosactividad['data'][i].Link_Recurso+'" type="application/pdf" width="100%" height="600px" />'
                  +'</div></div></div>');
            }
        }
    });
}