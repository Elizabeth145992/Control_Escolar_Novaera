inicializacion();
sesionUsuario();

$(document).ready(function() {
    $.post('../php/s_clase_hijos.php',{user:idUser},function(datos){
        if(datos != "Error"){
        var datosUsuario = JSON.parse(datos);
        var total = datosUsuario["data"].length;
        for(var i=0;i<total;i++){
            $('#card_hijo').append('<div class="col-sm-6"><div class="card">'
                +'<div class="card-header">'
                +'<h5 class="card-title">'+datosUsuario["data"][i].Nombre+' '+datosUsuario["data"][i].Apellido_Paterno+' '+datosUsuario["data"][i].Apellido_Materno+'</h5></div>'
                +'<div class="card-body"><br>'
                +'<h4 class="card-title">'+datosUsuario["data"][i].Grado+' Grado. Grupo '+datosUsuario["data"][i].Grupo+' de '+datosUsuario["data"][i].Nivel+'</h4><br>'
                +'<a class="btn btn-primary boton_guardar" onclick="claseT('+datosUsuario["data"][i].Id_Usuario
                +')">Vizualizar Clases</a><br><br>'
                +'<a class="btn btn-primary boton_guardar" onclick="califFp('+datosUsuario["data"][i].Id_Usuario
                +')">Vizualizar Calificaciones Finales</a><br><br>'
                +'</div></div></div>');
        }
        }
        else{
            $('#card_clase').append('<p>No hay datos por mostrar</p>');
        }
    });
});

function califFp(user){
    $('#tabla_califFP').modal('show');
    $('#dataTablecalifFP').DataTable({
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

function claseT(usuario){
    idC = usuario;
    pagina ="pagina_principal_AP.php?"; 
    valores = "idC";
    enviarVariabless();
}
function enviarVariabless(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
} 