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
});


function guardarAc(){
    var fichero = $('#archi')[0].files[0];
    var nombre = fichero.name;
    var des = $('#contenidoA').val();
    var nombreA = $('#activi').val();
    var fecha = $('#fecha').val();
    
  var datos = new FormData();
  datos.append('tFile', fichero);
  datos.append('tNombre', nombre);
  datos.append('user',idUser);
  datos.append('clase', idClase);
  datos.append('contenido', des);
  datos.append('activi', nombreA);
  datos.append('fecha', fecha);
  
  $.ajax({
    type: "POST",
    url: "../php/i_actividad.php?",
    data: datos,
    contentType: false,
    processData: false,
    dataType: "json",
    error: function(r) {
      if(r=="Error"){
        document.getElementById('modal-falla2').innerHTML="No se pudo guardar la actividad";
        $('#modal_falla').modal('show');
    }
    else{
      console.log(r);
      document.getElementById('modal-falla2').innerHTML=r;
      $('#modal_falla').modal('show');
      $("#modal_falla").on('hidden.bs.modal', function () {
      pagina_c()});;
        }
    }
  });
}

function pagina_c(){
  pagina ="form_actividad.php?"; 
  valores = "idClase";
  enviarVariables();
}
function enviarVariables(){
  var nomVec= valores.split(",");
  for (var i=0; i<nomVec.length; i++)
      pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
  pagina = pagina.substring(0, pagina.length-1);
  location.href=pagina;
} 

