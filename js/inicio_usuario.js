/*Este archivo sirve para la incialización de las variables globales del sistema,
  así como carga el menú de la barra lateral izquierda para cada tipo de usuario*/
var userCorreo;
var idUser;
var tipoUser;
inicializacion();
sesionUsuario();
function inicializacion(){
    $.post("../php/session.php",{},function(data){
        if(data=="Error"){
            window.location="../index.php";
        }
        else{
            sesionUsuario();
           
            menu();
        }
    });  
}

function menu() {
    sesionUsuario();
    if(tipoUser==6){
        $('#menulateral').append('<li><a href="#">'
          +'<i class="paginas esconder fas fa-chart-line"></i>'
          +'<span class="pagina">Calificaciones Generales</span></a></li><hr>'
          +'<li><a href="#">'
          +'<i class="paginas esconder fas fa-chart-line"></i>'
          +'<span class="pagina">Biblioteca Virtual</span></a></li><hr>');
    }
    else if(tipoUser==5){
        $('#menulateral').append('<div class="dropdown">'
        +'<a href="#" class="dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Registro de <br> Usuarios</span></a><hr>'
        +'<ul class="dropdown-menu dropdown-menu-dark fuente_lateral" aria-labelledby="dropdownMenuButton1">'
        +'<li><a class="dropdown-item active" href="#">Padre/Tutor</a></li>'
        +'<li><a class="dropdown-item" href="#">Alumnos</a></li>'
        +'<li><a class="dropdown-item" href="#">Personal Escolar</a></li>'
        +'<li><hr class="dropdown-divider"></li>'
        +'</ul>'
        +'</div>'
        +'<li><a href="#">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Nuevo periodo</span></a></li><hr>'
        +'<li><a href="#">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Nueva Clase</span></a></li><hr>'
        +'<li><a href="#">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Editar Clase</span></a></li><hr>'
        +'<div class="dropdown">'
        +'<a href="#" class="dropdown-toggle" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Peridod</span></a><hr>'
        +'<ul class="dropdown-menu dropdown-menu-dark fuente_lateral" aria-labelledby="dropdownMenuButton2">'
        +'<li><a class="dropdown-item active" href="#">Padre/Tutor</a></li>'
        +'<li><a class="dropdown-item" href="#">Ago-Diciembre 2021</a></li>'
        +'<li><a class="dropdown-item" href="#">Ene-Juni 2021</a></li>'
        +'<li><hr class="dropdown-divider"></li>'
        +'</ul>'
        +'</div>');
    }

    $.post("../php/s_usuario.php",{user:idUser},function(datos){
        datosUsuario = JSON.parse(datos);
        $('#usuario').append('<span class="nombre centro"><i class="esconder user fas fa-user"></i>'
        +datosUsuario["data"][0].Nombre+' '+datosUsuario["data"][0].Apellido_Paterno+'</span><br>'
        +'<span class="nombre centro">'+datosUsuario["data"][0].Rol+'</span><br>');
    });
    
}