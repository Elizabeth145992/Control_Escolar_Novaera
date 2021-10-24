/* */
var usrC;

inicializacion();
sesionUsuario();



$(document).ready(function() {

    $('#docente').empty();
    $.get("../php/s_seleccionar_datos.php?tipo=1", function(datos){  
        if(datos!="Error"){
            var datosP = JSON.parse(datos);
            $('#docente').append('<option selected>Seleccione</option>');
                for(var i=0;i<datosP["data"].length;i++){
                    $('#docente').append('<option value="'+datosP["data"][i].Id_Personal_Escolar+'">'
                    +datosP["data"][i].Nombre+' '+datosP["data"][i].Apellido_Paterno+' '+datosP["data"][i].Apellido_Materno+'</option>');
                }
        }      
    });

    var table4 = $('#dataTableClase').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/u_clase.php?tipo=1'
        },
        'columns': [
           { data: 'Nombre_Clase' },
           { data: 'Descripción' },
           { data: 'Hora_inicio' },
           { data: 'Hora_final' },
           { data: 'Nivel' },
           { data: 'Grado'},
           { data: 'Grupo'},
           { data: 'Nombre_Periodo'},
           { data: 'Apellido_Paterno'},
           { data: 'Nombre'},
           { data: 'Estatus' },
           { defaultContent: '<button type="button" class="editar3 btn btn-success"><i class="fas fa-eye"></i></button>' }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }

        
     });
    
     obtener_data_editar3("", table4);
    });

    function obtener_data_editar3 (tbody, table){
        $(document).on("click", ".editar3", function(){
            var data = table.row($(this).parents("tr")).data();
            usrC = data.Id_Clase;

            $.get("../php/u_clase.php?tipo=2"+"&clase="+usrC, function(result){
                if(result != "Error"){
                    $('#clase1').modal('show');

                    datosUsuario = JSON.parse(result);
                    document.getElementById('nombreC').value = datosUsuario["data"][0].Nombre_Clase;
                    document.getElementById('descripcion').value = datosUsuario["data"][0].Descripción;
                    document.getElementById('horaI').value = datosUsuario["data"][0].Hora_inicio;
                    document.getElementById('horaT').value = datosUsuario["data"][0].Hora_final;
                    document.getElementById('docente').value = datosUsuario["data"][0].Id_Personal_Escolar;
                    document.getElementById('nivel').value = datosUsuario["data"][0].Id_Nivel;
                    document.getElementById('grado').value = datosUsuario["data"][0].Id_Grado;
                    document.getElementById('grupo').value = datosUsuario["data"][0].Id_Grupo;
                    document.getElementById('estatus').value = datosUsuario["data"][0].Id_Estatus;

                } else{
                    document.getElementById('modal-falla2').innerHTML="No se puede editar el registro";
                    $('#modal_falla').modal('show');
                }
            });
        });
    }

    function editarClase(){
        var u1 = $('#nombreC').val();
        var u2 = $('#descripcion').val();
        var u3 = $('#horaI').val();
        var u4 = $('#horaT').val();
        var u5 = $('#docente').val();
        var u6 = $('#nivel').val();
        var u7 = $('#grado').val();
        var u8 = $('#grupo').val();
        var u9 = $('#estatus').val();

        $.get('../php/u_clase.php?tipo=3&nombreC='+u1+'&descripcion='+u2+'&horaI='+u3+'&horaT='+u4
        +'&docente='+u5+'&nivel='+u6+'&grado='+u7+'&grupo='+u8+'&estatus='+u9+'&clase='+usrC, function(datos){
            if(datos=="Error"){
                $('#clase1').modal('hide');
                document.getElementById('modal-falla2').innerHTML="No se actualizó la clase";
                $('#modal_falla').modal('show');
            }
            else{
                $('#clase1').modal('hide');
                document.getElementById('modal-falla2').innerHTML="Se actualizó correctamente la clase"; 
                $('#modal_falla').modal('show');
                $("#modal_falla").on('hidden.bs.modal', function () {
                recargaralum()});;
            }
        });

        function recargaralum() {
            var pagina ="u_clase.php"; 
               location.href=pagina;
        }

    }
    


