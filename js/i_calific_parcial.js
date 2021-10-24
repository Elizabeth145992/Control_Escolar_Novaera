/* */
inicializacion();
sesionUsuario();
var idClase;
var parcial;
var claseA;
var alumno;
var nombrea;
var calificacion;
var  idcalf;
var m = 5;


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
    

    var table4 = $('#dataTableAlumnosCC').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':'../php/s_alumnos_usuarios.php?tipo=6, &clase='+idClase+''
        },
        'columns': [
           { data: 'Apellido_Paterno' },
           { data: 'Apellido_Materno' },
           { data: 'Nombre' },
           { defaultContent: '<div class="centro"><button class="editar3 btn btn-primary btn_table boton_guardar"><i class="far fa-keyboard"></i></button></div>' }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }});
        calificacion_p("", table4);
        });

        function calificacion_p (tbody, table){

            $(document).on("click", ".editar3", function(){
              
              var data = table.row($(this).parents("tr")).data();
                      claseA = data.Id_Alumno_Clase;
                      alumno = data.Id_Alumno;
                      nombrea = data.Nombre;
                      $('#calif1').modal('show');
            });
        }

        function capturaC(){
            calificacion = $('#cal').val();
            parcial = $('#calP').val();
            $.post("../php/i_califP.php",{clasea:claseA, alumno:alumno, parcial:parcial, calif:calificacion},
            function(resp){
               if(resp == "Error"){
                document.getElementById('modal-falla2').innerHTML="No se pudo guardar la Calificación";
                $('#modal_falla').modal('show');
                }else{
                $('#calif1').modal('hide');
                document.getElementById('modal-falla2').innerHTML="se guardó la Calificación";
                $('#modal_falla').modal('show');
                llamartabla();
                }
            });
        }

        function edicionC(){
           var calificacion2 = $('#edit').val();
            $.post("../php/u_califP.php",{caliE:calificacion2, idcali:idcalf},
            function(resp){
               if(resp == "Error"){
                document.getElementById('modal-falla2').innerHTML="No se pudo guardar la Calificación";
                $('#modal_falla').modal('show');
                }else{
                $('#edit1').modal('hide');
                document.getElementById('modal-falla2').innerHTML="Se guardó la Calificación";
                $('#modal_falla').modal('show');
                llamartabla();
                }
            });
        }

        function llamartabla(){
            var table5 = $('#dataTableAlumnosEC').DataTable({
                'destroy' : true,
                'ajax': {
                    'method':'GET',
                    'url':'../php/s_alumnos_usuarios.php?tipo=7&clase='+idClase+'&parcial='+parcial+''
                },
                'columns': [
                   { data: 'Apellido_Paterno' },
                   { data: 'Apellido_Materno' },
                   { data: 'Nombre' },
                   {data: 'Parcial'},
                   {data: 'Calificacion'},
                   { defaultContent: '<div class="centro"><button class="editar'+m+' btn btn-warning btn_table"><i class="far fa-edit"></i></button></div>' }
                ],
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                }});
                
                /*$(document).on("click", ".editar9", function(){
                    var data = table5.row($(this).parents("tr")).data();
                          idcalf = data.Id_Calificacion_Parcial;
                           calif = data.Calificacion;
                            $('#edit1').modal('show');
                  });*/
                calificacion_pE("",table5);
        }
       
        function calificacion_pE(tbody, table){
            $(document).on("click", '.editar'+m+'', function(){
              var data = table.row($(this).parents("tr")).data();
                    idcalf = data.Id_Calificacion_Parcial;
                     calif = data.Calificacion;
                      $('#edit1').modal('show');
            });
        }
        

        


