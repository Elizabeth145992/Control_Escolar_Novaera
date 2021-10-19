/*Este archivo sirve para la incialización de las variables globales del sistema,
  así como carga el menú de la barra lateral izquierda para cada tipo de usuario*/
var userCorreo;
var idUser;
var tipoUser;
var peri;

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
        $('#menulateral').append('<div class="dropdown"><hr>'
        +'<li><a href="pagina_principal.php"><i class="paginas esconder fas fa-chart-line"></i>'
        +'<span  class="pagina">Página Principal</span><hr></a></li><br>'
        +'<li><a href="#">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Blioteca Digital</span></a></li><hr>'
        +'<li><a href="#" onclick="cf('+idUser+')">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Calif. Finales</span></a></li><hr>');
    }
    else if(tipoUser==5){
        $('#menulateral').append('<div class="dropdown"><hr>'
        +'<li><a href="pagina_principal_admin.php"><i class="paginas esconder fas fa-chart-line"></i>'
        +'<span  class="pagina">Página Principal</span><hr></a></li><br>'
        +'<a href="#" class="dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Registro de <br> Usuarios</span></a><hr>'
        +'<ul class="dropdown-menu dropdown-menu-dark fuente_lateral" aria-labelledby="dropdownMenuButton1">'
        +'<li><a class="dropdown-item" href="../view/form_usuario_padre.php">Padre/Tutor</a></li>'
        +'<li><a class="dropdown-item" href="../view/form_usuario_alumno.php">Alumnos</a></li>'
        +'<li><a class="dropdown-item" href="../view/form_usuario_personal.php">Personal Escolar</a></li>'
        +'<li><hr class="dropdown-divider"></li>'
        +'</ul>'
        +'</div>'
        +'<li><a id="Gperiodo1" href="#">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Nuevo periodo</span></a></li><hr>'
        +'<li><a href="../view/form_clase.php">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Nueva Clase</span></a></li><hr>'
        +'<li><a href="#">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Editar Clase</span></a></li><hr>'
        +'<div class="dropdown">'
        +'<a href="#" class="dropdown-toggle" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Periodo</span></a><hr>'
        +'<ul class="dropdown-menu dropdown-menu-dark fuente_lateral" aria-labelledby="dropdownMenuButton2">'
        +'<div id="periodoL"></div>'
        +'<li><hr class="dropdown-divider"></li>'
        +'</ul>'
        +'</div>');
    }else if(tipoUser==1){
        $('#menulateral').append('<div class="dropdown"><hr>'
        +'<li><a href="pagina_principal_docente.php"><i class="paginas esconder fas fa-chart-line"></i>'
        +'<span  class="pagina">Página Principal</span><hr></a></li><br>'
        +'<li><a href="#">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Blioteca Digital</span></a></li><hr>'
        +'<div class="dropdown">'
        +'<a href="#" class="dropdown-toggle" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Periodo</span></a><hr>'
        +'<ul class="dropdown-menu dropdown-menu-dark fuente_lateral" aria-labelledby="dropdownMenuButton2">'
        +'<div id="periodoL"></div>'
        +'<li><hr class="dropdown-divider"></li>'
        +'</ul>'
        +'</div>');
    }else if(tipoUser==3){
        $('#menulateral').append('<div class="dropdown"><hr>'
        +'<li><a href="pagina_principal_padre.php"><i class="paginas esconder fas fa-chart-line"></i>'
        +'<span  class="pagina">Página Principal</span><hr></a></li><br>'
        +'<li><a href="#">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Pagos</span></a></li><hr>');
    }else if(tipoUser==4){
        $('#menulateral').append('<div class="dropdown"><hr>'
        +'<li><a href="pagina_principal_control.php"><i class="paginas esconder fas fa-chart-line"></i>'
        +'<span  class="pagina">Página Principal</span><hr></a></li><br>'
        +'<div class="dropdown">'
        +'<a href="#" class="dropdown-toggle" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">'
        +'<i class="paginas esconder fas fa-chart-line"></i>'
        +'<span class="pagina">Periodo</span></a><hr>'
        +'<ul class="dropdown-menu dropdown-menu-dark fuente_lateral" aria-labelledby="dropdownMenuButton2">'
        +'<div id="periodoL"></div>'
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

    $.get("../php/s_seleccionar_datos.php?tipo=2", function(datos){  
        if(datos!="Error"){
            var datosPe = JSON.parse(datos);
                for(var i=0;i<datosPe["data"].length;i++){
                    $('#periodoL').append('<li><a onclick="periodo('+datosPe["data"][i].Id_Periodo+')" id="'+datosPe["data"][i].Id_Periodo+'" class="dropdown-item" href="#">'+datosPe["data"][i].Nombre+'</a></li>');
                }
        }      
    });
    
}
function periodo(perio){
    peri = perio;
    m_clase(peri);
}
function cf(usuario){
    user = usuario;
    $('#tabla_califF').modal('show');
    $('#dataTablecalifF').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=12&usuario='+user+''
        },

        'columns': [
           { data: 'Nombre_Clase' },
           { data: 'Calificacion' },
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
     });
}
