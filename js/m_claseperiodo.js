inicializacion();
sesionUsuario();
var peri;

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

    peri = parseInt(peri);

    $.post('../php/s_claseperiodo.php',{user:idUser, periodo:peri},function(datos){
        if(datos != "Error"){
        datosUsuario = JSON.parse(datos);
        var total = datosUsuario["data"].length;
        for(var i=0;i<total;i++){
        $('#card_clase').append('<div class="col-sm-6">'
        +'<div id="card_padres" class="card borde sombra centro"  style="width: 36rem;">'
        +'<h5 class="card-header">'+datosUsuario['data'][i].Nombre_Clase+'</h5>'
        +'<div class="card-body">'
        +'<h6 class="card-title">'+datosUsuario['data'][i].Nivel+': '+datosUsuario['data'][i].Grado+datosUsuario['data'][i].Grupo+'</h6><br>' 
        +'<h3 class="card-title">Código: '+datosUsuario['data'][i].Codigo_Clase+'</h3><br>'
        +'<a class="btn btn-primary boton_guardar" onclick="claseT('+datosUsuario["data"][i].Id_Clase
        +')">Vizualizar</a><br><br>'
        +'</div></div></div><br>');
        }
        }
        else{
            $('#card_clase').append('<p>No hay datos por mostrar</p>');
        }
    });
});

function claseT(clase){
    idC = clase;
    pagina ="vista_clase_profesor.php?"; 
    valores = "idC";
    enviarVariables();
}
function enviarVariables(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 