var usrD;
var usrI;
var total;
var i = 0 ;
window.onload = mensajes();

function mensajes(){
    $.get('../php/s_mensaje.php?user='+idUser+'&tipo=5', function(datos){
        if(datos != "Error"){
                   var datoU = JSON.parse(datos);
                   total = datoU["data"].length;  
                   document.getElementById("t").innerHTML = total;      
        }
   });
}
setInterval(mensajes,1000);

$(document).ready(function() {


    $.post("../php/s_usuario.php",{user:idUser},function(datos){
        datosUsuario = JSON.parse(datos);

        $('#foto_arriba').append('<div class="menu"> <div id="logo" class="logo_cont"><img id="logo" src="../img/instituto-novaera-logo (1).png" alt="Novaera"></div>'
        +'<h1 class="titulo centro">Instituto Novaera</h1><div>' 
        +'<ul id="menu_icono"><div class="dropdown">'
        +'<a href="#" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false"class="dropdown-toggle"><img class="img-profile rounded-circle" src="'+datosUsuario["data"][0].Foto+'"></a>'
        +' <ul class="dropdown-menu" aria-labelledby="dropdownMenu2" id="menu">'
        +'<li><a href="../view/u_perfil.php" class="dropdown-item" type="button">Perfil <i class="icono_submenu fas fa-eye"></i></a></li>'
        +'<li><a id="contrasena" onclick="con();" class="dropdown-item" type="button">Cambio de contraseña <i class="icono_submenu fas fa-edit"></i></a></li></ul>'
        +' <a style="position: relative;" href="#" id="dropdownMenu3" data-bs-toggle="dropdown" aria-expanded="false"class="dropdown-toggle"><i class="separacion fas fa-bell fa-fw"></i><span class="badge-danger badge-counter">3+</span></a>'
        +'<ul class="dropdown-menu" aria-labelledby="dropdownMenu3" id="menu"><p class="submenu glyphicon glyphicon-bell">Notificaciones</p>'
        +'<hr class="azul"></ul>'
        +'<a onclick="modal_mensaje();" style="position: relative;" href="#" id="dropdownMenu4" data-bs-toggle="dropdown" aria-expanded="false"class="dropdown-toggle"><i class="separacion fas fa-envelope"></i><span id="t" class="badge-danger badge-counter">'+total+'</span></a>'
        +'<a href="../php/logout.php" id="salir" class="menu_icono separacion"><i class="fas fa-sign-out-alt"></i></a></div></ul></div></div>');
        
    });
});

function con(){
    console.log('hola');
    $('#contrasena1').modal('show');
}

function u_contrasena(){
    var v1 = $('#con1').val();
    var v2 = $('#con2').val();

    if(v1 == v2){
    $.post("../php/u_contrasena.php", {contrasena:v1, usuario:idUser}, function(r){
        if(r == "Error"){
            $('#contrasena1').modal('hide');
            document.getElementById('modal-falla2').innerHTML="No se actualizó la contraseña";
            $('#modal_falla').modal('show');
        }else{
            $('#contrasena1').modal('hide');
                document.getElementById('modal-falla2').innerHTML="Se actualizó correctamente la contraseña"; 
                $('#modal_falla').modal('show');
        }
    });
    }else{
        $('#contrasena1').modal('hide');
        document.getElementById('modal-falla2').innerHTML="Las contraseñas no coinciden";
            $('#modal_falla').modal('show');
    }
}

function modal_mensaje(){
    $('#mchat').modal('show');
    
    var table4 = $('#dataTableChat').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_mensaje.php?user='+idUser+'&tipo=1'
        },
        'columns': [
           { data: 'Apellido_Paterno' },
           { data: 'Apellido_Materno' },
           { data: 'Nombre' },
           { data: 'Fecha_hora' },
           { defaultContent: '<button type="button" class="editar4 btn btn-success"><i class="fas fa-glasses"></i></button>' }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }

        
     });
    
     obtener_data_editar3("", table4);
}

function obtener_data_editar3 (tbody, table){
    $(document).on("click", ".editar4", function(){
        $('#mchat').modal('hide');
        $('#chatp').modal('show');

        var data = table.row($(this).parents("tr")).data();
        usrD = data.Id_Usuario_remitente;


 $.get('../php/s_mensaje.php?user='+idUser+'&tipo=3&usrD='+usrD+'', function(r){

 });

        $.get('../php/s_mensaje.php?user='+idUser+'&tipo=2&usrD='+usrD+'', function(datos){
            if(datos != "Error"){
                var datosUsuario = JSON.parse(datos);
                var total = datosUsuario["data"].length;
                for(var i=0;i<total;i++){
                    
                   if(datosUsuario["data"][i].Id_Usuario_destinatario == idUser){
                       $('#mensajesC').append('<div class="input-group"><label style="float:left; class="input-group-text">'+datosUsuario["data"][i].Nombre+' '+datosUsuario["data"][i].Apellido_Paterno+'</label>'
                       +'<textarea style="float:left; class="form-control" margin-bottom: 10%;"' 
                       +'name="" id="" cols="30" rows="4" readonly placeholder="'+datosUsuario["data"][i].Contenido+'"></textarea></div><br><br>');
                   }else{
                    $('#mensajesC').append('<div class="input-group"><textarea style="float:right; class="form-control" margin-bottom: 10%;"' 
                    +'name="" id="" cols="30" rows="4" readonly placeholder="'+datosUsuario["data"][i].Contenido+'"></textarea></div><br><br>');
                   }
                }
                }
                else{
                    $('#card_clase').append('<p>No hay datos por mostrar</p>');
                }
        });
         $("#chatp").on('hidden.bs.modal', function () {
                recargarchat()});
    });
}

function iniciar(){
    $('#mchat').modal('hide');
    $('#iniciarC').modal('show');

     var table5 = $('#dataTableiniciar').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_mensaje.php?tipo=4'
        },
        'columns': [
           { data: 'Apellido_Paterno' },
           { data: 'Apellido_Materno' },
           { data: 'Nombre' },
           { data: 'Rol' },
           { defaultContent: '<button type="button" class="editar5 btn btn-success"><i class="fas fa-glasses"></i></button>' }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }

        
     });
    
     obtener_data_editar5("", table5);
}

function obtener_data_editar5(tbody, table){
    $(document).on("click", ".editar5", function(){
        $('#iniciarC').modal('hide');
        $('#chatp').modal('show');

        var data = table.row($(this).parents("tr")).data();
        usrI = data.Id_Usuario;

        console.log(usrI);
         $.get('../php/s_mensaje.php?user='+idUser+'&tipo=2&usrD='+usrI+'', function(datos){
            if(datos != "Error"){
                var datosUsuario = JSON.parse(datos);
                var total = datosUsuario["data"].length;
                for(var i=0;i<total;i++){
                    
                   if(datosUsuario["data"][i].Id_Usuario_destinatario == idUser){
                       $('#mensajesC').append('<div class="input-group"><label style="float:left; class="input-group-text">'+datosUsuario["data"][i].Nombre+' '+datosUsuario["data"][i].Apellido_Paterno+'</label>'
                       +'<textarea style="float:left; class="form-control" margin-bottom: 10%;"' 
                       +'name="" id="" cols="30" rows="4" readonly placeholder="'+datosUsuario["data"][i].Contenido+'"></textarea></div><br><br>');
                   }else{
                    $('#mensajesC').append('<div class="input-group"><textarea style="float:right; class="form-control" margin-bottom: 10%;"' 
                    +'name="" id="" cols="30" rows="4" readonly placeholder="'+datosUsuario["data"][i].Contenido+'"></textarea></div><br><br>');
                   }
                }
                }
                else{
                    $('#card_clase').append('<p>No hay datos por mostrar</p>');
                }
        });
         $("#chatp").on('hidden.bs.modal', function () {
                recargarchat()});
    });
}


function enviar(){
    var cont = $('#contenido').val();
    if(usrI == undefined){
        $.post('../php/i_mensaje.php',{cont:cont, user:idUser, userD:usrD}, function(datos){
             console.log(datos);
        if(datos == "Error"){
        }else{
            document.getElementById('mensajesC').innerHTML = '';
             $.get('../php/s_mensaje.php?user='+idUser+'&tipo=2&usrD='+usrD+'', function(datos){
            if(datos != "Error"){
                var datosUsuario = JSON.parse(datos);
                var total = datosUsuario["data"].length;
                for(var i=0;i<total;i++){
                    
                   if(datosUsuario["data"][i].Id_Usuario_destinatario == idUser){
                       $('#mensajesC').append('<div class="input-group"><label style="float:left; class="input-group-text">'+datosUsuario["data"][i].Nombre+' '+datosUsuario["data"][i].Apellido_Paterno+'</label>'
                       +'<textarea style="float:left; class="form-control" margin-bottom: 10%;"' 
                       +'name="" id="" cols="30" rows="4" readonly placeholder="'+datosUsuario["data"][i].Contenido+'"></textarea></div><br><br>');
                   }else{
                    $('#mensajesC').append('<div class="input-group"><textarea style="float:right; class="form-control" margin-bottom: 10%;"' 
                    +'name="" id="" cols="30" rows="4" readonly placeholder="'+datosUsuario["data"][i].Contenido+'"></textarea></div><br><br>');
                   }
                }
                }
                else{
                    $('#card_clase').append('<p>No hay datos por mostrar</p>');
                }
        });
        $("#chatp").on('hidden.bs.modal', function () {
                recargarchat()});
        }

    });
    }else{
    $.post('../php/i_mensaje.php',{cont:cont, user:idUser, userD:usrI}, function(datos){
        if(datos == "Error"){
        }else{
            document.getElementById('mensajesC').innerHTML = '';
             $.get('../php/s_mensaje.php?user='+idUser+'&tipo=2&usrD='+usrI+'', function(datos){
            if(datos != "Error"){
                var datosUsuario = JSON.parse(datos);
                var total = datosUsuario["data"].length;
                for(var i=0;i<total;i++){
                    
                   if(datosUsuario["data"][i].Id_Usuario_destinatario == idUser){
                       $('#mensajesC').append('<div class="input-group"><label style="float:left; class="input-group-text">'+datosUsuario["data"][i].Nombre+' '+datosUsuario["data"][i].Apellido_Paterno+'</label>'
                       +'<textarea style="float:left; class="form-control" margin-bottom: 10%;"' 
                       +'name="" id="" cols="30" rows="4" readonly placeholder="'+datosUsuario["data"][i].Contenido+'"></textarea></div><br><br>');
                   }else{
                    $('#mensajesC').append('<div class="input-group"><textarea style="float:right; class="form-control" margin-bottom: 10%;"' 
                    +'name="" id="" cols="30" rows="4" readonly placeholder="'+datosUsuario["data"][i].Contenido+'"></textarea></div><br><br>');
                   }
                }
                }
                else{
                    $('#card_clase').append('<p>No hay datos por mostrar</p>');
                }
        });
        $("#chatp").on('hidden.bs.modal', function () {
                recargarchat()});
        }

    });
}
}

function recargarchat() {
        var pagina ="../view/pagina_principal_admin.php"; 
           location.href=pagina;
    }