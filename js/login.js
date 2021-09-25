/* Función para verificar la información de logueo. 
Si es correcta se da acceso al sistema. */
function verificar() {
    $.post('../php/login.php', {
        "correo": $('#correo').val(),
        "contrasena": $('#contrasena').val()
      },function(data) {
        if(data=="Error"){
            document.getElementById('mensaje').innerHTML = "Usuario y/o contraseña incorrectos";
            $('#modal_falla').modal('show');
            $('#correo').val("");
            $('#contrasena').val("");
        }
        else{
            window.location="../index.php";
        }
    });
}