--Registros para la tabla estatus
INSERT INTO `estatus`(`Estatus`) VALUES 
    ('Activo'),
    ('Inactivo');


--Registros para la tabla género
INSERT INTO `genero`(`Genero`) VALUES 
    ('Femenino'),  
    ('Masculino'), 
    ('Otro');


--Registros para la tabla grado
INSERT INTO `grado`(`Grado`) VALUES 
    ('1°'), 
    ('2°'), 
    ('3°'), 
    ('4°'), 
    ('5°'), 
    ('6°');


--Registros para la tabla rol
INSERT INTO `rol`(`Rol`) VALUES 
    ('Docente'), 
    ('Supervisor'), 
    ('Padre/Tutor'), 
    ('Control'), 
    ('Administrador'), 
    ('Alumno');


--Registros para la tabla asistencia
INSERT INTO `tipo_asistencia`(`Tipo`) VALUES 
    ('Asistencia'), 
    ('No sistió'), 
    ('Retardo'), 
    ('Justificada');


--Registros para la tabla tipo de evento
INSERT INTO `tipo_evento`(`Evento`) VALUES 
    ('Reunión en Teams'), 
    ('Reunión en Zoom'), 
    ('Otra reunión');


--Registros para la tabla nivel
INSERT INTO `nivel`(`Nivel`) VALUES 
    ('Preescolar'), 
    ('Primaria'), 
    ('Secundaria'), 
    ('Preparatoria');