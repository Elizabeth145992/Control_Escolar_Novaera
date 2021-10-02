/* Este archivo servirá para la comunicación del cliente al lenguaje del servidor el cambio de
la foto de perfil y mostrar información al usuario*/
window.onload = mostrarperfil();

function mostrarperfil(){
    inicializacion();
    sesionUsuario();
    $.post("../php/s_usuario.php",{user:idUser},function(datos){
        datosUsuario = JSON.parse(datos);
        $('#perfil').append('<label for="" class="form-label">Nombre completo: </label>'
        +'<input type="text" class="form-control input_tamano" readonly placeholder="'+datosUsuario["data"][0].Nombre+' '+datosUsuario["data"][0].Apellido_Paterno+' '+datosUsuario["data"][0].Apellido_Materno+'"><br>'
        +'<label for="" class="form-label">Correo Electrónico: </label>'
        +'<input type="text" class="form-control input_tamano" readonly placeholder="'+datosUsuario["data"][0].Correo+'"><br>'
        +'<label for="" class="form-label">Dirección:</label>'
        +'<textarea class="form-control input_tamano" cols="30" rows="3" readonly placeholder="'+datosUsuario["data"][0].Municipio+', '+datosUsuario["data"][0].Estado+'. '+datosUsuario["data"][0].Calle+' #'+datosUsuario["data"][0].Numero+' Col. '+datosUsuario["data"][0].Colonia+'"></textarea><br>'
        +'<label for="" class="form-label">Teléfono: </label>'
        +'<input type="text" class="form-control input_tamano" readonly placeholder="'+datosUsuario["data"][0].Telefono+'"><br>'
        +'<label for="" class="form-label">Tipo de Usuario: </label>'
        +'<input type="text" class="form-control input_tamano" readonly placeholder="'+datosUsuario["data"][0].Rol+'"><br>');
    }); 
}

