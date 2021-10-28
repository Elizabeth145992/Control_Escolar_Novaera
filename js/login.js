/* Función para verificar la información de logueo. 
Si es correcta se da acceso al sistema. */
$(document).ready(function(){
    $("#res").click(
      function(){
        $('#r1').modal('show');
      });
});

function verificar() {
    $.post('../php/login.php', { "correo": $('#correo').val(),"contrasena": $('#contrasena').val()},function(data) {
        if(data == "Error"){
            document.getElementById('modal-falla2').innerHTML="Correo o contraseña incorrectos";
            $('#modal_falla').modal('show');
            $('#correo').val("");
            $('#contrasena').val("");
        }
        else{
            window.location="../index.php";
        }
    });
}

function restablecer(){
   var c1 = $('#correo2').val();
    $.post('../php/restablecer.php',{correo:c1}, function(r){
        if(r == "Error"){
            $('#r1').modal('hide');
            document.getElementById('modal-falla2').innerHTML="No se pudo restablecer la contraseña a su correo";
            $('#modal_falla').modal('show');
        }else{
            $('#r1').modal('hide');
            document.getElementById('modal-falla2').innerHTML="Se envió su nueva contraseña a su correo";
            $('#modal_falla').modal('show');
            $('#correo2').val("");
        }
    });
}

