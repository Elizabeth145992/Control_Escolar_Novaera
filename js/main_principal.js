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
        +' <a style="position: relative;" href="#" id="dropdownMenu4" data-bs-toggle="dropdown" aria-expanded="false"class="dropdown-toggle"><i class="separacion fas fa-envelope"></i><span class="badge-danger badge-counter">1+</span></a>'
        +'<ul class="dropdown-menu" aria-labelledby="dropdownMenu4" id="menu"><p class="submenu">Mensajes</p><hr class="azul">'
        +'<div class="card shadow mb-4"><div class="card-header py-3"></div><div class="card-body"><div class="table-responsive">'
        +'<table class="table table-bordered" id="dataTableTiempo" width="100%" cellspacing="0"><thead id="tabla"></thead><tbody>'
        +'tr><td class="sin_borde">Emily Cruz</td><td class="sin_borde">¿Cuál página...</td>'
        +'<td class="sin_borde"><button type="button" class="btn btn-primary boton_guardar">Leer</button></td></tr>'
        +'<tr></tbody></table></div></div></div></ul><a href="../php/logout.php" id="salir" class="menu_icono separacion"><i class="fas fa-sign-out-alt"></i></a></div></ul></div></div>');
        
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