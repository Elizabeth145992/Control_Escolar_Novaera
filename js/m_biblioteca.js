inicializacion();
sesionUsuario();
var idm;

$(document).ready(function() {
    var table4 = $('#dataTableDigital').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_biblioteca.php?tipo=1'
        },
        'columns': [
           { data: 'Nombre_Material' },
           { data: 'Descripcion_Material' },
           { data: 'Nivel' },
           { data: 'Grado' },
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
        
        var data = table.row($(this).parents("tr")).data();
            idm = data.Id_Biblioteca_Virtual;

            $.get('../php/s_biblioteca.php?tipo=2&biblio='+idm+'', function(datos){
                if(datos != "Error"){
                    $('#material1').modal('show');
                    
                    var datosUsuario = JSON.parse(datos);
                   
                        if(datosUsuario["data"][0].Tipo_Material == 1){
                            $('#material2').append('<h3 class="centro">'+datosUsuario["data"][0].Nombre_Material+'</h3>'
                            +'<img src="'+datosUsuario["data"][0].Link_Recurso+'" alt="" style="width: 475px; height: 400px;">')
                        }else  if(datosUsuario["data"][0].Tipo_Material == 2){
                            $('#material2').append('<h3 class="centro">'+datosUsuario["data"][0].Nombre_Material+'</h3>'
                            +'<embed src="'+datosUsuario['data'][0].Link_Recurso+'" type="application/pdf" width="100%" height="600px" />')
                        }else if(datosUsuario["data"][0].Tipo_Material == 3){
                            $('#material2').append('<h3 class="centro">'+datosUsuario["data"][0].Nombre_Material+'</h3>'
                            +'<h6>Se descargará el material cuando este mensaje sea cerrado</h6>'
                            +'<iframe class="embed-responsive-item" src="'+datosUsuario['data'][0].Link_Recurso+'" allowfullscreen></iframe>')
                        }else if(datosUsuario["data"][0].Tipo_Material == 4){
                            $('#material2').append('<h3 class="centro">'+datosUsuario["data"][0].Nombre_Material+'</h3>'
                            +' <div class="ratio ratio-16x9">'
                            +'<iframe class="embed-responsive-item" src="'+datosUsuario['data'][0].Link_Recurso+'" allowfullscreen></iframe</div>')
                        }else  if(datosUsuario["data"][0].Tipo_Material == 5){
                            $('#material2').append('<h3 class="centro">'+datosUsuario["data"][0].Nombre_Material+'</h3>'
                            +' <div class="ratio ratio-16x9">'
                            +'<iframe class="embed-responsive-item" src="'+datosUsuario['data'][0].Link_Recurso+'" allowfullscreen></iframe</div>')
                        } 
                        $("#material1").on('hidden.bs.modal', function () {
                            document.getElementById('material2').innerHTML = '';});
                }

            });
    });
}