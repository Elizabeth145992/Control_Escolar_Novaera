var usrA;
var usrD;

inicializacion();
sesionUsuario();



$(document).ready(function() {
    var table4 = $('#dataTableAlumnosP').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=4'
        },
        'columns': [
           { data: 'Apellido_Paterno' },
           { data: 'Apellido_Materno' },
           { data: 'Nombre' },
           { data: 'Correo' },
           { data: 'Telefono' },
           { data: 'Municipio'},
           {data: 'Calle'},
           {data: 'Numero'},
           {data: 'Colonia'},
           { data: 'Grado' },
           { data: 'Grupo' },
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
            usrU = data.Id_Usuario;

            $('#tabla_calif').modal('show');
            $('#dataTablecalifP').DataTable({
                'destroy' : true,
                'ajax': {
                    'method':'GET',
                    'url':'../php/s_alumnos_usuarios.php?tipo=12&usuario='+usrU+''
                },
        
                'columns': [
                   { data: 'Nombre_Clase' },
                   { data: 'Calificacion' },
                ],
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                }
             });
        });
    }
    


