/* Este archivo servirá para la comunicación del cliente al lenguaje del servidor el cambio de
la foto de perfil y mostrar información al usuario*/
window.onload = mostrarperfil();

function mostrarperfil(){
    inicializacion();
    sesionUsuario();

    $.post("../php/s_usuario.php",{user:idUser},function(datos){
        datosUsuario = JSON.parse(datos);

        $('#foto_p').append('<img id="foto_perfil" class="img-profile2 rounded-circle"' 
        +'src="'+datosUsuario["data"][0].Foto+'"><br><br>');
        console.log(datosUsuario["data"][0].Foto)

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

function ufoto(){
    var fichero = $('#image')[0].files[0];
    var nombre = fichero.name;

    var datos = new FormData();
  datos.append('tFile', fichero);
  datos.append('tNombre', nombre);
  datos.append('user', idUser);

  $.ajax({
    type: "POST",
    url: "../php/u_img.php?",
    data: datos,
    contentType: false,
    processData: false,
    dataType: "json",
    error: function(r) {
      if(r=="Error"){
        document.getElementById('modal-falla2').innerHTML="No se pudo guardar la nueva foto de perfil";
        $('#modal_falla').modal('show');
    }
    else{
      document.getElementById('modal-falla2').innerHTML="Se guardo correctamente la nueva foto de perfil";
      $('#modal_falla').modal('show');
      $("#modal_falla").on('hidden.bs.modal', function () {
      pagina_up()});;
        }
    }
  });
}

function pagina_up(){
    var pagina ="../view/u_perfil.php"; 
    location.href=pagina;
}

