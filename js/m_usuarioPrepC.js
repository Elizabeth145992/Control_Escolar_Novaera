var usrA;
var usrD;

$(document).ready(function() {
    $.ajax({
type: "POST",
url: "../php/procesar-estados.php",
data: { estados : "Mexico" } 
}).done(function(data){
$("#estado").html(data);
});
// Obtener municipios
});
$(document).ready(function() {
    inicializacion();
    sesionUsuario();
    var table4 = $('#dataTableAlumnosP').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=13&tipo2=4'
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
           {data: 'Estatus'},
           { defaultContent: '<button type="button" class="editar3 btn btn-warning"><i class="fas fa-pencil-alt"></i></button>' },
           { defaultContent: '<button type="button" class="editar4 btn btn-success"><i class="fas fa-pencil-alt"></i></button>' }
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
            usrD = data.Id_Direccion;
            $.get("../php/s_alumnos_usuarios.php?tipo=5"+"&usuario="+usrU, function(result){
                if(result != "Error"){
                    $('#alumno2').modal('show');
                    
                    datosUsuario = JSON.parse(result);
                    document.getElementById('nombre').value = datosUsuario["data"][0].Nombre;
                    document.getElementById('paterno').value = datosUsuario["data"][0].Apellido_Paterno;
                    document.getElementById('materno').value = datosUsuario["data"][0].Apellido_Materno;
                    document.getElementById('correo').value = datosUsuario["data"][0].Correo;
                    document.getElementById('tele').value = datosUsuario["data"][0].Telefono;
                    document.getElementById('genero').value = datosUsuario["data"][0].Id_Genero;
                    document.getElementById('rfc').value = datosUsuario["data"][0].RFC;
                    document.getElementById('nivel').value = datosUsuario["data"][0].Id_Nivel;
                    document.getElementById('grado').value = datosUsuario["data"][0].Id_Grado;
                    document.getElementById('grupo').value = datosUsuario["data"][0].Id_Grupo;
                    document.getElementById('estado').value = datosUsuario["data"][0].Estado;
                    document.getElementById('municipio').value = datosUsuario["data"][0].Municipio;
                    document.getElementById('colonia').value = datosUsuario["data"][0].Colonia;
                    document.getElementById('calle').value = datosUsuario["data"][0].Calle;
                    document.getElementById('numero').value = datosUsuario["data"][0].Numero;
                    document.getElementById('postal').value = datosUsuario["data"][0].CP;
                } else{
                    document.getElementById('modal-falla2').innerHTML="No se puede editar el registro";
                    $('#modal_falla').modal('show');
                }
            });
            
        });

        $(document).on("click", ".editar4", function(){
            var data = table.row($(this).parents("tr")).data();
            usrU = data.Id_Usuario;

            $.get("../php/s_alumnos_usuarios.php?tipo=5"+"&usuario="+usrU, function(result){
                if(result != "Error"){
                    $('#alumnoestatus').modal('show');
                    datosUsuario = JSON.parse(result);
                    document.getElementById('estatus').value = datosUsuario["data"][0].Id_Estatus;
                } else{
                    document.getElementById('modal-falla2').innerHTML="No se puede editar el registro";
                    $('#modal_falla').modal('show');
                }
            });
            

        });

    }
    
    function editarUsuario(){
        var u1 = $('#nombre').val();
        var u2 = $('#paterno').val();
        var u3 = $('#materno').val();
        var u4 = $('#correo').val();
        var u5 = $('#tele').val();
        var u6 = $('#genero').val();
        var u7 = $('#rfc').val();
        var u8 = $('#nivel').val();
        var u9 = $('#grado').val();
        var u10 = $('#grupo').val();
        var u11 = $('#estado').val();
        var u12 = $('#municipio').val();
        var u13 = $('#colonia').val();
        var u14 = $('#calle').val();
        var u15 = $('#numero').val();
        var u16 = $('#postal').val();

        $.post("../php/u_alumno.php", {nombre:u1, paterno:u2, materno:u3, correo:u4, tele:u5, genero:u6, rfc:u7,
        nivel:u8, grado:u9, grupo:u10, estado:u11, municipio:u12, colonia:u13, calle:u14, numero:u15, 
        postal:u16, usuarioA:usrU, direccion:usrD}, function(datos){
            if(datos=="Error"){
                $('#alumno1').modal('hide');
                document.getElementById('modal-falla2').innerHTML="No se actualizó el alumno";
                $('#modal_falla').modal('show');
            }
            else{
                $('#alumno1').modal('hide');
                document.getElementById('modal-falla2').innerHTML="Se guardo correctamente el alumno"; 
                $('#modal_falla').modal('show');
                $("#modal_falla").on('hidden.bs.modal', function () {
                recargaralum()});;
            }
        });

        function recargaralum() {
            var pagina ="m_alumnos_secundaria.php"; 
               location.href=pagina;
        }

    }

    function editarEstatus(){
        var e1 = $('#estatus').val();

        $.post("../php/u_alumno_es.php", {estatus:e1, usuarioA:usrU}, function(datos){
            if(datos=="Error"){
                $('#alumnoestatus').modal('hide');
                document.getElementById('modal-falla2').innerHTML="No se actualizó el alumno";
                $('#modal_falla').modal('show');
            }
            else{
                $('#alumnoestatus').modal('hide');
                document.getElementById('modal-falla2').innerHTML="Se guardo correctamente el estatus del alumno"; 
                $('#modal_falla').modal('show');
                $("#modal_falla").on('hidden.bs.modal', function () {
                recargaralumPrepe()});;
            }
        });

        function recargaralumPrepe() {
            var pagina ="m_alumnos_preparatoria_c.php"; 
               location.href=pagina;
        }

    }
    


