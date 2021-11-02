var dateR;
var datosUsuario;
var total;

document.addEventListener('DOMContentLoaded', function() {
  inicializacion();
    sesionUsuario();

    $('#classe').empty();
    $.post("../php/s_clase.php",{user:idUser}, function(datos){  
        if(datos!="Error"){
            var datosP = JSON.parse(datos);
            //alert(datosP["data"].length)
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

        //console.log('day', date.toISOString());
        //console.log('coords', jsEvent.pageX, jsEvent.pageY);
        $("#calendario1").modal('show');
        },
        events: function (callback){

          $.ajax({
            url: '../php/s_eventos.php?tipo=1&user='+idUser+'',
            method:'GET',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
           success: function (result) {
               var events = [];
               var t = Object.keys(result).length;
               for (var i = 0; i < t; i++) {
                   events.push({

                       title: result["data"][i].Evento,
                       start: result["data"][i].Fecha_Reunion                      

                   });
                   
               }
               
               callback(events);                      
            },

            error: function (err) {

                alert('No funciona!!!');
            }                    
        });
        }

  });

  calendar.render();
});

function crearEveTZ(){
  var v1 = $('#tipo').val();
  var v2 = $('#classe').val();
  var v3 = $('#hora').val();

  $.post("../php/i_eventoTZ.php", {hora:v3, fecha:dateR, clase:v2, tipo:v1, user:idUser}, function(r){
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
          }
    }
  })

}

function paginanueva(){
  pagina ="../view/calendario.php"; 
  location.href=pagina;
}

