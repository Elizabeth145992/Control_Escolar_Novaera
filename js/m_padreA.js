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
    var table4 = $('#dataTablePersonal').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=17'
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
           { defaultContent: '<button type="button" class="editar3 btn btn-warning"><i class="fas fa-pencil-alt"></i></button>' }
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
            $.get("../php/s_alumnos_usuarios.php?tipo=18"+"&usuario="+usrU, function(result){
                if(result != "Error"){
                    $('#padre1').modal('show');
                    
                    datosUsuario = JSON.parse(result);
                    document.getElementById('nombre').value = datosUsuario["data"][0].Nombre;
                    document.getElementById('paterno').value = datosUsuario["data"][0].Apellido_Paterno;
                    document.getElementById('materno').value = datosUsuario["data"][0].Apellido_Materno;
                    document.getElementById('correo').value = datosUsuario["data"][0].Correo;
                    document.getElementById('tele').value = datosUsuario["data"][0].Telefono;
                    document.getElementById('genero').value = datosUsuario["data"][0].Id_Genero;
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
    }
    
    function editarUsuario(){
        var u1 = $('#nombre').val();
        var u2 = $('#paterno').val();
        var u3 = $('#materno').val();
        var u4 = $('#correo').val();
        var u5 = $('#tele').val();
        var u6 = $('#genero').val();
        var u11 = $('#estado').val();
        var u12 = $('#municipio').val();
        var u13 = $('#colonia').val();
        var u14 = $('#calle').val();
        var u15 = $('#numero').val();
        var u16 = $('#postal').val();

        $.post("../php/u_padres.php", {nombre:u1, paterno:u2, materno:u3, correo:u4, tele:u5, genero:u6, estado:u11, municipio:u12, colonia:u13, calle:u14, numero:u15, 
        postal:u16, usuarioA:usrU, direccion:usrD}, function(datos){
            if(datos=="Error"){
                $('#padre1').modal('hide');
                document.getElementById('modal-falla2').innerHTML="No se actualiz?? el usuario";
                $('#modal_falla').modal('show');
            }
            else{
                $('#padre1').modal('hide');
                document.getElementById('modal-falla2').innerHTML="Se guardo correctamente el usuario"; 
                $('#modal_falla').modal('show');
                $("#modal_falla").on('hidden.bs.modal', function () {
                recargarpadre()});;
            }
        });
    }

    function recargarpadre() {
        var pagina ="m_padre_admin.php"; 
           location.href=pagina;
    }
    


