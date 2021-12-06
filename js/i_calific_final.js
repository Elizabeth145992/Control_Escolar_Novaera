/*Este archivo sirve para generar la calificación final de cada alumno, de acuerdo a la calificación de
los parciales*/
inicializacion();
sesionUsuario();
var idClase;
var parcial;
var claseA;
var alumno;
var nombrea;
var calificacion;
var  idcalf;
var i=0;

//Parte del código que sirve para recoger los datos de la variables que se reciben por la barra de navegación,
//este se carga cada vez de que se recrga la página 
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
    
    //Tabla que enlista loss alumnos de una determinada clase para la generación de su calificación final
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
           //ESte botón genera y guarad la calif. final de manera automática cuando es oprimido
           { defaultContent: '<div class="centro"><button class="editar3 btn btn-primary btn_table boton_guardar"><i class="far fa-keyboard"></i></button></div>' }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }});
        calificacion_F("", table4);
//Esta tabla enlista todos los alumnos a los que se les generó una calif. final de la materia
        var table5 = $('#dataTableAlumnosEC').DataTable({
            'destroy' : true,
            'ajax': {
                'method':'GET',
                'url':'../php/s_alumnos_usuarios.php?tipo=8&clase='+idClase+''
            },
            'columns': [
               { data: 'Apellido_Paterno' },
               { data: 'Apellido_Materno' },
               { data: 'Nombre' },
               {data: 'Calificacion'},
               //Este botón sirve para modificar la calificación final que se guardó en la BD
               { defaultContent: '<div class="centro"><button class="editar2 btn btn-warning btn_table"><i class="far fa-edit"></i></button></div>' }
            ],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
            }});
            
            calificacion_FE2("", table5);
        });

        //Esta función genera la calificación final de alumno
        function calificacion_F(tbody, table){

            $(document).on("click", ".editar3", function(){
              
              var data = table.row($(this).parents("tr")).data();
                      claseA = data.Id_Alumno_Clase;
                      alumno = data.Id_Alumno;
      
            $.post("../php/i_califF.php",{clasea:claseA, alumno:alumno, clase:idClase},
            function(resp){
               if(resp == "Error"){
                document.getElementById('modal-falla2').innerHTML="No se puede generar nuevamente la calificacoón de esta alumno";
                $('#modal_falla').modal('show');
                }else{
                document.getElementById('modal-falla2').innerHTML="Se ha generado la calificación final, observe la tabla de abajo";
                $('#modal_falla').modal('show');

                var table6 = $('#dataTableAlumnosEC').DataTable({
                    'destroy' : true,
                    'ajax': {
                        'method':'GET',
                        'url':'../php/s_alumnos_usuarios.php?tipo=8&clase='+idClase+''
                    },
                    'columns': [
                       { data: 'Apellido_Paterno' },
                       { data: 'Apellido_Materno' },
                       { data: 'Nombre' },
                       {data: 'Calificacion'},
                       { defaultContent: '<div class="centro"><button class="editar6 btn btn-warning btn_table"><i class="far fa-edit"></i></button></div>' }
                    ],
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                    }});
                    
                    calificacion_FE("", table6);
                }
            });
        });
    }

        function calificacion_FE2(tbody, table){

            $(document).on("click", ".editar2", function(){
              var data = table.row($(this).parents("tr")).data();
                      idcalf = data.Id_Calificacion_Final;
                      calif = data.Calificacion;
                      $('#e1').modal('show');
            });
        }

        function calificacion_FE(tbody, table){

            $(document).on("click", ".editar6", function(){
              var data = table.row($(this).parents("tr")).data();
                      idcalf = data.Id_Calificacion_Final;
                      calif = data.Calificacion;
                      $('#e1').modal('show');
            });
        }

//Esta fución sirve para editar la calificación
        function edicionCF(){
           var calificacion2 = $('#edit').val();
            $.post("../php/u_califF.php",{caliE:calificacion2, idcali:idcalf},function(resp){
               if(resp == "Error"){
                document.getElementById('modal-falla2').innerHTML="No se pudo guardar la Calificación";
                $('#modal_falla').modal('show');
                }
                else{
                $('#e1').modal('hide');
                document.getElementById('modal-falla2').innerHTML="Se guardó la Calificación";
                $('#modal_falla').modal('show');
                $("#modal_falla").on('hidden.bs.modal', function () {
                    recargarpaginaF();
                });
                }
            });
        }
        

//Sirve para recargar la página cuando se realiza una generación o modificación de calificación
        function  recargarpaginaF(){
            pagina ="calificacion_final.php?"; 
            valores = "idClase";
            enviarVariables();
        }
//Esta función manda las variables por la barra de navegación
        function enviarVariables(){
            var nomVec= valores.split(",");
            for (var i=0; i<nomVec.length; i++)
                pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
            pagina = pagina.substring(0, pagina.length-1);
            location.href=pagina;
        } 