/*Este archivo sirve para poder mandar los datos de asistencia de un alumno para que sea registrada */
inicializacion();
sesionUsuario();
var idClase;
var today;

//Esta parte del código sirve madar las variables mandadas desde la barra de navegación
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
    today = new Date();//Obtener fecha de hoy
var dd = today.getDate();//Día
var mm = today.getMonth() + 1;//Mes
var yyyy = today.getFullYear();//Año

if (dd < 10) {
  dd = '0' + dd;
}

if (mm < 10) {
  mm = '0' + mm;
}

today =yyyy + '/' + mm + '/' + dd;
    $('#p').append('<label for="">Fecha: </label><input type="text" placeholder='+today+' readonly>');

    //Tabla ajax donde se enlistan los alumnos de una determinada clase para tomar asistencia
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
           { defaultContent: '<input class="editar3 form-check-input" type="radio" value="" name="flexRadioDefault" id="flexCheckDefault">'
                             +'<label for="">Normal</label><br>'
                             +'<input class="editar4 form-check-input" type="radio" value="" name="flexRadioDefault" id="flexCheckDefault">'
                             +'<label for="">No asistió</label><br>'
                             +'<input class="editar5 form-check-input" type="radio" value="" name="flexRadioDefault" id="flexCheckDefault">'
                             +'<label for="">Retardo</label><br>'
                             +'<input class="editar6 form-check-input" type="radio" value="" name="flexRadioDefault" id="flexCheckDefault">'
                             +'<label for="">Justificada</label><br>'
                            }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }

        
     });
    
     asistencia_data_editar3("", tableA);
});

//Fubción que sirve para registar el tipo de sistencia de un determinado alumno de la clase
function asistencia_data_editar3 (tbody, table){

  $(document).on("click", ".editar3", function(){
    
    var data = table.row($(this).parents("tr")).data();
            claseA = data.Id_Alumno_Clase;
            alumno = data.Id_Alumno;
            nombrea = data.Nombre;
    $.post("../php/i_asistencia.php",{
      fecha:today, usuario:idUser, alumno:alumno, tipo:1, ac:claseA}, function(result){
        if(result=="Error"){
          document.getElementById('modal-falla2').innerHTML="Este alumno ya tiene asistencia en la fecha: "+today;
          $('#modal_falla').modal('show');
        }else{
          document.getElementById('modal-falla2').innerHTML="Se guardo la asistencia de "+nombrea;
          $('#modal_falla').modal('show');
        }
      });
  });


  $(document).on("click", ".editar4", function(){
    var data = table.row($(this).parents("tr")).data();
    claseA = data.Id_Alumno_Clase;
    alumno = data.Id_Alumno;
    nombrea = data.Nombre;
$.post("../php/i_asistencia.php",{
fecha:today, usuario:idUser, alumno:alumno, tipo:2, ac:claseA}, function(result){
  if(result=="Error"){
    document.getElementById('modal-falla2').innerHTML="Este alumno ya tiene asistencia en la fecha: "+today;
    $('#modal_falla').modal('show');
  }else{
    document.getElementById('modal-falla2').innerHTML="Se guarado la asistencia de "+nombrea;
    $('#modal_falla').modal('show');
  }
});
  });


  $(document).on("click", ".editar5", function(){
    var data = table.row($(this).parents("tr")).data();
            claseA = data.Id_Alumno_Clase;
            alumno = data.Id_Alumno;
            nombrea = data.Nombre;
    $.post("../php/i_asistencia.php",{
      fecha:today, usuario:idUser, alumno:alumno, tipo:3, ac:claseA}, function(result){
        if(result=="Error"){
          document.getElementById('modal-falla2').innerHTML="Este alumno ya tiene asistencia en la fecha: "+today;
          $('#modal_falla').modal('show');
        }else{
          document.getElementById('modal-falla2').innerHTML="Se guarado la asistencia de "+nombrea;
          $('#modal_falla').modal('show');
        }
      });
  });


  $(document).on("click", ".editar6", function(){
    var data = table.row($(this).parents("tr")).data();
            claseA = data.Id_Alumno_Clase;
            alumno = data.Id_Alumno;
            nombrea = data.Nombre;
    $.post("../php/i_asistencia.php",{
      fecha:today, usuario:idUser, alumno:alumno, tipo:4, ac:claseA}, function(result){
        if(result=="Error"){
          document.getElementById('modal-falla2').innerHTML="Este alumno ya tiene asistencia en la fecha: "+today;
          $('#modal_falla').modal('show');
        }else{
          document.getElementById('modal-falla2').innerHTML="Se guarado la asistencia de "+nombrea;
          $('#modal_falla').modal('show');
        }
      });
  });
}
