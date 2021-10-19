/* */
inicializacion();
sesionUsuario();
var idClase;


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
               {data: 'Tipo'}
            ],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
            }});
        });

        function reporte(){
            $.get("../php/reporte_A.php?tipo=1"+"&clase="+idClase, function(res){
                pagina_p();  
             });
        }
               //Función que sirve para abrir en otra ventana el reporte
              function pagina_p(){
                window.open("../php/reporte_A.php?tipo=1"+"&clase="+idClase, "Diseño Web", "width=300, height=200");
    }