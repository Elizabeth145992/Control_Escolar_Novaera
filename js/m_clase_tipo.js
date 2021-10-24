/**/
inicializacion();
sesionUsuario();
var idClase;
var idUsuario;

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

    idClase = parseInt(idC);
    idUsuario = parseInt(idU);

    $.post('../php/s_clase_id.php', {clase:idClase}, function(datos){
        if(datos != "Error"){
        datosClase = JSON.parse(datos);
        $('#clase').append('<h5 class="clases">Clase: '+datosClase['data'][0].Nombre_Clase+'</h5>');
        }
    });
console.log(tipoUser);
    if(tipoUser == 2){
        $('#ocultar1').hide();
        $('#ocultar2').hide();
        $('#ocultar3').hide();
        $('#ocultar4').hide();
        $('#ocultar5').hide();
    }
});

function registrarAc(){
    pagina ="form_actividad.php?"; 
    valores = "idClase";
    enviarVariables();
}
function verAc(){
    pagina ="m_actividades.php?"; 
    valores = "idClase";
    enviarVariables2();
}

function registrarAs(){
    pagina ="form_asistencia.php?"; 
    valores = "idClase";
    enviarVariables3();
}
function registrarCP(){
    pagina ="calificacion_parcial.php?"; 
    valores = "idClase";
    enviarVariables4();
}
function registrarCF(){
    pagina ="calificacion_final.php?"; 
    valores = "idClase";
    enviarVariables5();
}

function reporteCF(){
    pagina ="vista_reporte_calif_F.php?"; 
    valores = "idClase";
    enviarVariables6();
}

function reporteAs(){
    pagina ="vista_reporte_asistencia.php?"; 
    valores = "idClase";
    enviarVariables7();
}
//Funciones para alumnos
function verAs(){
    if(idUsuario == 0){
    $('#tabla_asis').modal('show');
            $('#dataTableAsis').DataTable({
                'destroy' : true,
                'ajax': {
                    'method':'GET',
                    'url':'../php/s_alumnos_usuarios.php?tipo=10&clase='+idClase+'&usuario='+idUser+''
                },
        
                'columns': [
                   { data: 'Fecha' },
                   { data: 'Tipo' },
                ],
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                }
             });
    }else{
        $('#tabla_asis').modal('show');
        $('#dataTableAsis').DataTable({
            'destroy' : true,
            'ajax': {
                'method':'GET',
                'url':'../php/s_alumnos_usuarios.php?tipo=10&clase='+idClase+'&usuario='+idUsuario+''
            },
    
            'columns': [
               { data: 'Fecha' },
               { data: 'Tipo' },
            ],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
            }
         });
    }

}

function verCP(){
    if(idUsuario==0){
    $('#tabla_calif').modal('show');
    $('#dataTablecalifP').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=11&clase='+idClase+'&usuario='+idUser+''
        },

        'columns': [
           { data: 'Parcial' },
           { data: 'Calificacion' },
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
     });
     }else{
        $('#tabla_calif').modal('show');
    $('#dataTablecalifP').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=11&clase='+idClase+'&usuario='+idUsuario+''
        },

        'columns': [
           { data: 'Parcial' },
           { data: 'Calificacion' },
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
     }); 
     }
}

function enviarVariables(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 

function enviarVariables2(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 

function enviarVariables3(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 

function enviarVariables4(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 
function enviarVariables5(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 


function enviarVariables6(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 

function enviarVariables7(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 
