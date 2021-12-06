/*ESte archivo sirve para comunicar los datos de un nuevo material de la 
biblioteca que envía un usuario para que los reciba el lenguaje del servidor y los registre en la BD*/
inicializacion();
sesionUsuario();
//Función que recibe y guarda los datos del nuevo material de la biblioteca
function guardarMaterial(){
    var v1 = $('#nmaterial').val();
    var v2 = $('#des').val();
    var v3 = $('#tmaterial').val();
    var v5 = $('#nivel').val();
    var v6 = $('#grado').val();
    var datos = new FormData();

    //Depende del tipo de archivo o dato que el usuario registro se va a guardar en la BD
    if(v3 == 1 || v3 == 2 || v3 == 3){
        var fichero = $('#archi')[0].files[0];
        var nombre = fichero.name;
        datos.append('tFile', fichero);
        datos.append('tNombre', nombre);
    }else{
        var v4 = $('#link').val();
        datos.append('link',v4);
    }

    datos.append('nombre',v1);
    datos.append('contenido',v2);
    datos.append('nivel', v5);
    datos.append('grado',v6);
    datos.append('tipo', v3);

    $.ajax({
        type: "POST",
        url: "../php/i_biblioteca.php?",
        data: datos,
        contentType: false,
        processData: false,
        dataType: "json",
        error: function(r) {
          if(r=="Error"){
            document.getElementById('modal-falla2').innerHTML="No se pudo guardar el material";
            $('#modal_falla').modal('show');
        }
        else{
          document.getElementById('modal-falla2').innerHTML="Se guardo correctamente el material";
          $('#modal_falla').modal('show');
          $("#modal_falla").on('hidden.bs.modal', function () {
          pagina_biblio()});;
            }
        }
      });

}

//Función que sirve para recargar la página cada vez de que se registra correctamente un nuevo material
function pagina_biblio(){
    pagina ="form_biblioteca.php"; 
    location.href=pagina;
}