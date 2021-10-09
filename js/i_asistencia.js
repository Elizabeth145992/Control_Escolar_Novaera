/**/
inicializacion();
sesionUsuario();
var idClase;
var today;

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
    today = new Date();
var dd = today.getDate();
var mm = today.getMonth() + 1;
var yyyy = today.getFullYear();

if (dd < 10) {
  dd = '0' + dd;
}

if (mm < 10) {
  mm = '0' + mm;
}

today =yyyy + '/' + mm + '/' + dd;
    $('#p').append('<label for="">Fecha: </label><input type="text" placeholder='+today+' readonly>');

    var tableA = $('#dataTableAlumnosA').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=6, &clase='+idClase+''
        },
        'columns': [
           { data: 'Apellido_Paterno' },
           { data: 'Apellido_Materno' },
           { data: 'Nombre' },
           { defaultContent: '<input class="editar3 form-check-input check_color" type="checkbox" value="" id="flexCheckDefault">'
                             +'<label for="">Normal</label><br>'
                             +'<input class="editar4 form-check-input check_color" type="checkbox" value="" id="flexCheckDefault">'
                             +'<label for="">No asistió</label><br>'
                             +'<input class="editar5 form-check-input check_color" type="checkbox" value="" id="flexCheckDefault">'
                             +'<label for="">Retardo</label><br>'
                             +'<input class="editar6 form-check-input check_color" type="checkbox" value="" id="flexCheckDefault">'
                             +'<label for="">Justificada</label><br>'
                            }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }

        
     });
    
     asistencia_data_editar3("", tableA);
});

function asistencia_data_editar3 (tbody, table){

  $(document).on("click", ".editar3", function(){
    
    var data = table.row($(this).parents("tr")).data();
            claseA = data.Id_Alumno_Clase;
            alumno = data.Id_Alumno;
    $.post("../php/i_asistencia.php",{
      fecha:today, usuario:idUser, alumno:alumno, tipo:1, ac:claseA}, function(result){
        if(result=="Error"){
          alert("Error");
        }else{
          alert("Correcto");
        }
      });
  });


  $(document).on("click", ".editar4", function(){
    var data = table.row($(this).parents("tr")).data();
    claseA = data.Id_Alumno_Clase;
    alumno = data.Id_Alumno;
$.post("../php/i_asistencia.php",{
fecha:today, usuario:idUser, alumno:alumno, tipo:2, ac:claseA}, function(result){
if(result=="Error"){
  alert("Error");
}else{
  alert("Correcto");
}
});
  });


  $(document).on("click", ".editar5", function(){
    var data = table.row($(this).parents("tr")).data();
            claseA = data.Id_Alumno_Clase;
            alumno = data.Id_Alumno;
    $.post("../php/i_asistencia.php",{
      fecha:today, usuario:idUser, alumno:alumno, tipo:3, ac:claseA}, function(result){
        if(result=="Error"){
          alert("Error");
        }else{
          alert("Correcto");
        }
      });
  });


  $(document).on("click", ".editar6", function(){
    var data = table.row($(this).parents("tr")).data();
            claseA = data.Id_Alumno_Clase;
            alumno = data.Id_Alumno;
    $.post("../php/i_asistencia.php",{
      fecha:today, usuario:idUser, alumno:alumno, tipo:4, ac:claseA}, function(result){
        if(result=="Error"){
          alert("Error");
        }else{
          alert("Correcto");
        }
      });
  });
}
