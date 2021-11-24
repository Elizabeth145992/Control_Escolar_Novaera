var idpago;
$(document).ready(function() {
    inicializacion();
    sesionUsuario();

    var table4 = $('#dataTableHijosP').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_pago_padre.php?padre='+idUser+''
        },
        'columns': [
           { data: 'Apellido_Paterno' },
           { data: 'Apellido_Materno' },
           { data: 'Nombre' },
           { data: 'Nombre_Periodo'},
           { defaultContent: '<button type="button" class="editar4 btn btn-success"><i class="fas fa-file-powerpoint"></i></button>' }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }

        
     });
    
     obtener_data_editar4("", table4);
    });

    function obtener_data_editar4(tbody, table){
        $(document).on("click", ".editar4", function(){
            var data = table.row($(this).parents("tr")).data();
            idpago = data.Id_Pago_Reporte;
            reporte();
        });
    }

    function reporte(){
        $.get('../php/reporte_pago.php?idpago='+idpago+'', function(res){
            pagina_pago();  
         });
    }
           //Función que sirve para abrir en otra ventana el reporte
          function pagina_pago(){
            window.open('../php/reporte_pago.php?idpago='+idpago+'', "Diseño Web", "width=300, height=200");
}
