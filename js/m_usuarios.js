/**/
var usrAP;
var usrR;
var usrID;

$(document).ready(function() {
    inicializacion();
    sesionUsuario();
    var table2 = $('#dataTableAlumnosP').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=1'
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
           { defaultContent: '<button type="button" class="editar1 btn btn-warning"><i class="fas fa-pencil-alt"></i></button>' }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }

        
     });
     var table3 = $('#dataTableAlumnosE').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=2'
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
           { defaultContent: '<button type="button" class="editar1 btn btn-warning"><i class="fas fa-pencil-alt"></i></button>' }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }});

        var table4 = $('#dataTableAlumnosS').DataTable({
            'destroy' : true,
            'ajax': {
                'method':'GET',
                'url':'../php/s_alumnos_usuarios.php?tipo=3'
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
               { defaultContent: '<button type="button" class="editar1 btn btn-warning"><i class="fas fa-pencil-alt"></i></button>' }
            ],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
            }});

            var table5 = $('#dataTableAlumnosP3').DataTable({
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
                   { defaultContent: '<button type="button" class="editar1 btn btn-warning"><i class="fas fa-pencil-alt"></i></button>' }
                ],
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                }});
     obtener_data_editar1("", table2);
    });

    var obtener_data_editar1 = function(tbody, table){
        $(document).on("click", ".editar1", function(){
            var data = table.row($(this).parents("tr")).data();
            usrAP = data.Id_Alumno;
            usrR = data.Id_Rol;
            usrID = data.Id_Usuario;
            enviar();
        });
    }


