/* */
inicializacion();
sesionUsuario();
var idClase;
var usrU;


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

    idClase = parseInt(idClase);

        var table5 = $('#dataTableAlumnosEC').DataTable({
            'destroy' : true,
            'ajax': {
                'method':'GET',
                'url':'../php/s_alumnos_usuarios.php?tipo=9&clase='+idClase+''
            },
            'columns': [
               { data: 'Apellido_Paterno' },
               { data: 'Apellido_Materno' },
               { data: 'Nombre' },
               {data: 'Fecha'},
               {data: 'Tipo'},
               {defaultContent: '<button type="button" class="editar3 btn btn-warning"><i class="fas fa-pencil-alt"></i></button>'}
            ],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
            }});
            obtener_data_editar3("", table5);
        });


        function obtener_data_editar3 (tbody, table){
            $(document).on("click", ".editar3", function(){
                var data = table.row($(this).parents("tr")).data();
                usrU = data.Id_Asistencia;
                $.get("../php/s_alumnos_usuarios.php?tipo=20"+"&asis="+usrU, function(result){
                    if(result != "Error"){
                        $('#alumnoasis').modal('show');
                        
                        datosUsuario = JSON.parse(result);
                        document.getElementById('asis').value = datosUsuario["data"][0].Id_Tipo_Asistencia;
                    } else{
                        document.getElementById('modal-falla2').innerHTML="No se puede editar el registro";
                        $('#modal_falla').modal('show');
                    }
                });
                
            });
            }

        function reporte(){
            $.get("../php/reporte_A.php?tipo=1"+"&clase="+idClase, function(res){
                pagina_p();  
             });
        }
               //Función que sirve para abrir en otra ventana el reporte
              function pagina_p(){
                window.open("../php/reporte_A.php?tipo=1"+"&clase="+idClase, "Diseño Web", "width=300, height=200");
    }


function editarAsis(){
    var e1 = $('#asis').val();
    $.post('../php/u_asistencia.php', {asistencia:e1, usr:usrU}, function(r){
        if(r=="Error"){
            $('#alumnoasis').modal('hide');
            document.getElementById('modal-falla2').innerHTML="No se actualizó el alumno";
            $('#modal_falla').modal('show');
        }
        else{
            $('#alumnoasis').modal('hide');
            document.getElementById('modal-falla2').innerHTML="Se guardo correctamente el alumno"; 
            $('#modal_falla').modal('show');
            $("#modal_falla").on('hidden.bs.modal', function () {
            recargaraasis()});;
        }
    });
}

    function recargaraasis() {
        pagina ="../view/vista_reporte_asistencia.php?"; 
        valores = "idClase";
        enviarVariables6();
   }

   function enviarVariables6(){
    var nomVec= valores.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
}