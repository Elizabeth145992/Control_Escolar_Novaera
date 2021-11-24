var usrU1;
var monto1;
var tipo;


$(document).ready(function() {
    inicializacion();
    sesionUsuario();

    var cadVariables = location.search.substring(1,location.search.length);
    var arrVariables = cadVariables.split("&");
    for (i=0; i<arrVariables.length; i++) {
      var arrVariableActual = arrVariables[i].split("=");
      if (isNaN(parseFloat(arrVariableActual[1])))
        eval(arrVariableActual[0]+"='"+unescape(arrVariableActual[1])+"';");
      else
        eval(arrVariableActual[0]+"="+arrVariableActual[1]+";");
    } 

    tipo = parseInt(tipo);
    var table4 = $('#dataTableAlumnosP').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=13&tipo2='+tipo+''
        },
        'columns': [
           { data: 'Apellido_Paterno' },
           { data: 'Apellido_Materno' },
           { data: 'Nombre' },
           { data: 'Correo' },
           { data: 'Grado' },
           { data: 'Grupo' },
           {data: 'Estatus'},
           { defaultContent: '<button type="button" class="editar3 btn btn-warning"><i class="fas fa-pen-alt"></i></button>' },
           { defaultContent: '<button type="button" class="editar2 btn btn-info"><i class="fas fa-search"></i></button>' },
           { defaultContent: '<button type="button" class="editar10 btn btn-success"><i class="fas fa-edit"></i></button>' }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }

        
     });
    
     obtener_data_editar4("", table4);
    });

    function obtener_data_editar4(tbody, table){
        $(document).on("click", ".editar3", function(){
            var data = table.row($(this).parents("tr")).data();
            $('#montop').modal('show');
            usrU1 = data.Id_Usuario;
        });
        $(document).on("click", ".editar2", function(){
            var data = table.row($(this).parents("tr")).data();
            usrU1 = data.Id_Usuario;

            $.post('../php/i_montopago.php', {usuario:usrU1, tipo:2}, function(r){
                if(r=="Error"){
                    document.getElementById('modal-falla2').innerHTML="Aún no se registra una cantidad a pagar";
                    $('#modal_falla').modal('show');
                }
                else{
                    document.getElementById('modal-falla2').innerHTML=r; 
                    $('#modal_falla').modal('show');
                    $("#modal_falla").on('hidden');
                }
            });
        });

        $(document).on("click", ".editar10", function(){
            var data = table.row($(this).parents("tr")).data();
            
            usrU1 = data.Id_Usuario;
            $.post('../php/i_montopago.php', {usuario:usrU1, tipo:3}, function(r){
                if(r != "Error"){
                    $('#montoE').modal('show');
                datosUsuario = JSON.parse(r);
                monto1 = datosUsuario["data"][0].Id_Pago_Reporte;
                document.getElementById('monto2').value = datosUsuario["data"][0].Monto;
                }else{
                    document.getElementById('modal-falla2').innerHTML="No se puede editar la cantidad";
                    $('#modal_falla').modal('show');
                }
            });
        });
    }

    function rmonto(){
        var v1 = $('#monto').val();
        $.post('../php/i_montopago.php', {monto:v1, usuario:usrU1, tipo:1}, function(r){
            if(r=="Error"){
                $('#montop').modal('hide');
                document.getElementById('modal-falla2').innerHTML="No se registró la cantidad de pago, ya hay una cantidad de pago registrada";
                $('#modal_falla').modal('show');
            }
            else{
                $('#montop').modal('hide');
                document.getElementById('modal-falla2').innerHTML="Se guardo correctamente la cantidad de pago"; 
                $('#modal_falla').modal('show');
                $("#modal_falla").on('hidden.bs.modal', function () {
                pago()});;
            }
        });
    }
    
    function emonto(){
        var v2 = $('#monto2').val();
        $.post('../php/i_montopago.php', {monton:v2, idmonto:monto1, tipo:4}, function(r){
            if(r=="Error"){
                $('#montoE').modal('hide');
                document.getElementById('modal-falla2').innerHTML="No se editó correctamente la cantidad";
                $('#modal_falla').modal('show');
            }
            else{
                $('#montoE').modal('hide');
                document.getElementById('modal-falla2').innerHTML="Se guardó correctamente la cantidad de pago"; 
                $('#modal_falla').modal('show');
                $("#modal_falla").on('hidden.bs.modal', function () {
                pago()});;
            }
        });
    }

    function pagogeneral(){
        $('#montoA').modal('show');
    }
    
    function rmontoAll(){
        var m2 = $('#montoall').val();

        $.post('../php/i_montopago.php', {monto:m2, tipo:5, tipo2:tipo}, function(r){
            console.log(r);
            if(r =="Error"){
                $('#montoA').modal('hide');
                document.getElementById('modal-falla2').innerHTML="No se registró la cantidad de pago, ya hay una cantidad de pago registrada";
                $('#modal_falla').modal('show');
            }
            else{
                $('#montoA').modal('hide');
                document.getElementById('modal-falla2').innerHTML="Se guardo correctamente la cantidad de pago"; 
                $('#modal_falla').modal('show');
                $("#modal_falla").on('hidden.bs.modal', function () {
                pago()});;
            }
        });

    }

    function pago() {
        pagina ="vista_pago_c.php?"; 
        valores = "tipo";
           enviarVariables20();
    }

    


