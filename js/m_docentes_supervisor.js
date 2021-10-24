var usrA;
var usrD;

$(document).ready(function() {
    inicializacion();
    sesionUsuario();
    var table4 = $('#dataTablePersonal').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=14'
        },
        'columns': [
           { data: 'Apellido_Paterno' },
           { data: 'Apellido_Materno' },
           { data: 'Nombre' },
           { data: 'Correo' },
           { data: 'Telefono' },
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
            $('#clasesD').modal('show');

            var table5 = $('#dataTableDocente').DataTable({
                'destroy' : true,
                'ajax': {
                    'method':'POST',
                    'url':'../php/s_alumnos_usuarios.php?tipo=19&usuario='+usrU+''
                },
                'columns': [
                   { data: 'Nombre_Clase' },
                   { data: 'Nivel' },
                   { data: 'Grado' },
                   { data: 'Grupo' },
                   { defaultContent: '<button type="button" class="editar5 btn btn-success"><i class="fas fa-eye"></i></button>' }
                ],
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                }
        
                
             });
            
             obtener_data_editar5("", table5);
            
        });
    }

    function obtener_data_editar5 (tbody, table){
        $(document).on("click", ".editar5", function(){
            var data = table.row($(this).parents("tr")).data();
            usrD = data.Id_Clase;
            claseid(usrD);
        });
    }

    function claseid(clase){
        idC = clase;
        idU = idUser;
        pagina ="vista_clase_profesor.php?"; 
        valores = "idC,idU";
        enviarVariables();
    }
    function enviarVariables(){
        var nomVec= valores.split(",");
        for (var i=0; i<nomVec.length; i++)
            pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
        pagina = pagina.substring(0, pagina.length-1);
        location.href=pagina;
    } 
    
   

      


