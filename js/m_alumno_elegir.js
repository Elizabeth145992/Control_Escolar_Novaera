/*Este archivo sirve para llenar la tabla de padre_alumno para elegir a uno o varios alumnos  */
window.onload = listar;
function listar(){
    cadenaurl = '../php/s_alumnos_elegir.php';
    listarA();

}

/* Función que sirve para mostrar una tabla con todos los alumnos registrados en el sistema */
var listarA = function(){
    var table1 = $('#dataTableAlumnos').DataTable({
        'destroy' : true,
        'ajax': {
            'method':'GET',
            'url':cadenaurl
        },
        'columns': [
           { data: 'Apellido_Paterno' },
           { data: 'Apellido_Materno' },
           { data: 'Nombre' },
           { data: 'Nivel' },
           { data: 'Grado' },
           { data: 'Grupo' },
           { defaultContent: '<button type="button" class="editar1 btn btn-primary boton_guardar">Elegir</button>' }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
     });
     obtener_data_editar1("", table1);
}

var obtener_data_editar1 = function(tbody,table){
    $(document).on("click", ".editar1", function(){
        var data = table.row($(this).parents("tr")).data();
        userA = data.Id_Alumno;
        $.post("../php/i_padre_alumno.php",{alumno:userA}, 
            function(respuesta1){
            if(respuesta1=="Error"){
                document.getElementById('mensaje').innerHTML="No se pudo guardar el nuevo alumno";
                $('#modal_falla').modal('show');
            }
            else{
                var password = respuesta1;
                document.getElementById('mensaje').innerHTML="Se guardo correctamente el alumno y el padre";
                $('#modal_falla').modal('show');
            }
        });
    });
}