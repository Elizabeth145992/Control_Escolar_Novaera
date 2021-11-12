var dateR;
var datosUsuario;
var total;
var codigo;
var dire;
var colorba;

document.addEventListener('DOMContentLoaded', function() {
  inicializacion();
    sesionUsuario();
if(tipoUser == 1){
    $('#classe').empty();
    $.post("../php/s_clase.php",{user:idUser}, function(datos){  
        if(datos!="Error"){
            var datosP = JSON.parse(datos);
            $('#classe').append('<option selected>Seleccione</option>');
                for(var i=0;i<datosP["data"].length;i++){
                  $('#classe').append('<option value="'+datosP["data"][i].Id_Clase+'">'
                  +datosP["data"][i].Nombre_Clase+'</option>');
                }
        }      
    });

  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
    },locale: 'es',
     navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      navLinkDayClick: function(date, jsEvent) {
       var ndate = date.toISOString();
       dateR = ndate.substr(0, 10);

        $("#calendario1").modal('show');
        },
        events: function (fetchInfo, successCallback, failureCallback){

          

          $.ajax({
            url: '../php/s_eventos.php?tipo=1&user='+idUser+'',
            method:'GET',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
           success: function (result) {
               var events = [];
               var t = result["data"].length;
               
               for (var i = 0; i < t; i++) {
                if(result["data"][i].Id_Tipo_Evento == 1){
                codigo = "Reunión Teams";
                dire = 'https://www.microsoft.com/es-mx/microsoft-teams/group-chat-software'
                colorba = '#003057'
                }
                else if(result["data"][i].Id_Tipo_Evento == 2){
                codigo = "Reunión en Zoom";
                dire = 'https://zoom.us/signin'
                colorba = '#00A7C7'
                }else if(result["data"][i].Id_Tipo_Evento == 3){
                  codigo = result["data"][i].Titulo;
                  dire = '../view/calendario.php';
                  colorba = '#815C97';
                  }
                   events.push({
                      title: codigo +' '+ result["data"][i].Nombre_Clase,
                       start: result["data"][i].Fecha_Reunion,
                       url: dire,  
                       backgroundColor: colorba,                

                   });                   
               } 
               successCallback(events);
            },

            error: function (err) {

                alert('No funciona!!!');
            }                    
        });
        },

eventClick: function(info) {
  info.jsEvent.preventDefault(); // don't let the browser navigate

  if (info.event.url) {
    window.open(info.event.url);
  }
}
  });

  calendar.render();
}
else if(tipoUser == 6){//Es
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
    },locale: 'es',
     navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      navLinkDayClick: function(date, jsEvent) {
       var ndate = date.toISOString();
       dateR = ndate.substr(0, 10);

        },
        events: function (fetchInfo, successCallback, failureCallback){

          

          $.ajax({
            url: '../php/s_eventos.php?tipo=2&user='+idUser+'',
            method:'GET',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
           success: function (result) {
               var events = [];
               var t = result["data"].length;
               
               for (var i = 0; i < t; i++) {
                if(result["data"][i].Id_Tipo_Evento == 1){
                codigo = "Reunión Teams";
                dire = 'https://www.microsoft.com/es-mx/microsoft-teams/group-chat-software'
                colorba = '#003057'
                }
                else if(result["data"][i].Id_Tipo_Evento == 2){
                codigo = "Reunión en Zoom";
                dire = 'https://zoom.us/signin'
                colorba = '#00A7C7'
                }else if(result["data"][i].Id_Tipo_Evento == 3){
                  codigo = result["data"][i].Titulo;
                  dire = '../view/calendario.php';
                  colorba = '#815C97';
                  }
                   events.push({
                      title: codigo +' '+ result["data"][i].Nombre_Clase,
                       start: result["data"][i].Fecha_Reunion,
                       url: dire,  
                       backgroundColor: colorba,                

                   });                   
               } 
               successCallback(events);
            },

            error: function (err) {

                console.log(err);
            }                    
        });
        },

eventClick: function(info) {
  info.jsEvent.preventDefault(); // don't let the browser navigate

  if (info.event.url) {
    window.open(info.event.url);
  }
}
  });

  calendar.render();
}
});

function crearEveTZ(){
  var v1 = $('#tipo').val();
  var v2 = $('#classe').val();
  var v3 = $('#hora').val()+':00';
  var v4 = dateR +' '+ v3;
  var v5 = $('#titulo').val();

  if(v5 == ''){
    v5 = '---';
  }
console.log(v5);
  $.post("../php/i_eventoTZ.php", {hora:v3, fecha:v4, clase:v2, tipo:v1, user:idUser, titulo:v5}, function(r){
    if(r=="Error"){
      $("#calendario1").modal('hide');
      document.getElementById('modal-falla2').innerHTML="No se pudo guardar la reunión";
      $('#modal_falla').modal('show');
  }
  else{
    $("#calendario1").modal('hide');
    if(v1 == 1){
    document.getElementById('modal-falla2').innerHTML="Lo redireccionaremos al sitio oficial de Microsoft Teams cuando cierre este mensaje para agendar su reunión";
    $('#modal_falla').modal('show');
    $("#modal_falla").on('hidden.bs.modal', function () {
      var win = window.open('https://www.microsoft.com/es-mx/microsoft-teams/group-chat-software', '_blank');
        win.focus();
    paginanueva()});;
      }else if(v1 == 2){
        document.getElementById('modal-falla2').innerHTML="Lo redireccionaremos al sitio oficial de Zoom cuando cierre este mensaje para que agende su reunión";
        $('#modal_falla').modal('show');
        $("#modal_falla").on('hidden.bs.modal', function () {
          var win = window.open('https://zoom.us/signin', '_blank');
            win.focus();
        paginanueva()});;
          }else if(v1 == 3){
            document.getElementById('modal-falla2').innerHTML="Se ha guardado el evento";
            $('#modal_falla').modal('show');
            $("#modal_falla").on('hidden.bs.modal', function () {
            paginanueva()});;
              }
              
    }
  })

}

function paginanueva(){
  pagina ="../view/calendario.php"; 
  location.href=pagina;
}

