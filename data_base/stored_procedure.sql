--Este archivo contendrá todos los SP para la realización de CRUD

--SP para la inserción de un nuevo usuario
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_usuario` ( `u_Nombre` VARCHAR(60), `u_Paterno` VARCHAR(60),
`u_Materno` VARCHAR(60), `u_Correo` VARCHAR(100), `u_Telefono` VARCHAR(45),
`u_foto` VARCHAR(255), `u_Password` VARCHAR(65), `u_Direccion` INT, `u_Rol` INT, 
`u_Genero` INT, `u_Estatus` INT)
BEGIN
INSERT INTO usuario (Nombre, Apellido_Paterno, Apellido_Materno, Correo, Telefono, 
Foto, Contrasena, Id_Direccion, Id_Rol, Id_Genero, Id_Estatus)
VALUES(u_Nombre, u_Paterno, u_Materno, u_Correo, u_Telefono, u_Foto, u_Password, 
u_Direccion, u_Rol, u_Genero, u_Estatus);
END$$
DELIMITER ;

--SP para la inserción de una nueva dirección
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_direccion`( `d_Estado` VARCHAR(60),
`d_Municipio` VARCHAR(60), `d_Calle` VARCHAR(100), `d_Numero` VARCHAR(10),
`d_CP` VARCHAR(5), `d_Colonia` VARCHAR(100))
BEGIN
INSERT INTO direccion (Estado, Municipio, Calle, Numero, CP, Colonia)
VALUES(d_Estado, d_Municipio, d_Calle, d_Numero, d_CP, d_Colonia);
END$$
DELIMITER ;

--SP para la inserción de nuevo alumno
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_alumno`( `a_RFC` VARCHAR(10),
`a_Usuario` INT, `a_Nivel` INT, `a_Grado` INT, `a_Grupo` INT)
BEGIN
INSERT INTO alumno (RFC, Id_Usuario, Id_Nivel, Id_Grado, Id_Grupo)
VALUES(a_RFC, a_Usuario, a_Nivel, a_Grado, a_Grupo);
END$$
DELIMITER ;

--SP para la inserción de nuevo personal escolar
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_personal`( `p_RFC` VARCHAR(10),
`p_Puesto` VARCHAR(60), `p_Usuario` INT)
BEGIN
INSERT INTO personal_escolar (RFC, Puesto, Id_Usuario)
VALUES(p_RFC, p_Puesto,  p_Usuario);
END $$
DELIMITER ;

--SP para la inserción en la tabla padre_alumno
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_padre_alumno`( `p_Alumno` INT,
`p_Padre` INT)
BEGIN
INSERT INTO padre_alumno (Id_Alumno, Id_Padre)
VALUES(p_Alumno, p_Padre);
END$$
DELIMITER ;

--SP para la inserción de una nueva clase
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_clase`( `c_Nombre` VARCHAR(100),
`c_Descrip` LONGTEXT, `c_Codigo` VARCHAR(7), `c_HoraI` VARCHAR(45), `c_HoraF` VARCHAR(45),
`c_Nivel` INT, `c_Grado` INT, `c_Personal` INT, `c_Estatus` INT, `c_Periodo` INT, `c_Grupo` INT)
BEGIN
INSERT INTO clase (Nombre_Clase, Descripción, Codigo_Clase, Hora_inicio, Hora_final, 
Id_Nivel, Id_Grado, Id_Personal_Escolar, Id_Estatus, Id_Periodo, Id_Grupo)
VALUES(c_Nombre, c_Descrip, c_Codigo, c_HoraI, c_HoraF,
c_Nivel, c_Grado, c_Personal, c_Estatus, c_Periodo, c_Grupo);
END$$
DELIMITER ;

--SP para la inserción de un nuevo periodo
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_periodo`( `p_Nombre` VARCHAR(100),
`p_Inicio` DATE, `p_Termino` DATE)
BEGIN
INSERT INTO periodo (Nombre_Periodo, Fecha_Inicio, Fecha_Termino)
VALUES(p_Nombre, p_Inicio, p_Termino);
END$$
DELIMITER ;

--SP para la inserción de una nueva actividad
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_actividad`( `a_Nombre` VARCHAR(60),
`a_Contenido` LONGTEXT, `a_Fecha` DATE,  `a_Docente` INT,  `a_Clase` INT,  `a_Recurso` INT)
BEGIN
INSERT INTO actividad (Nombre_Actividad, Contenido, Fecha_Entrega, Id_Personal_Escolar, 
Id_Clase, Id_Recurso)
VALUES(a_Nombre, a_Contenido, a_Fecha, a_Docente, a_Clase, a_Recurso);
END$$
DELIMITER ;

--SP para inserción de un nuevo recurso
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_recurso`(IN `r_Recurso` LONGTEXT, `r_tipo` INT)
BEGIN
INSERT INTO recurso (Link_Recurso, Tipo_Material)
VALUES(r_Recurso, r_tipo);
END$$
DELIMITER ;

--SP para la edición de usuarios
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_usuario`(`u_Nombre` VARCHAR(60),
`u_Paterno` varchar(60), `u_Materno` VARCHAR(60), `u_Correo` VARCHAR(100),
`u_Tele` VARCHAR(45), `u_Genero` INT, `u_Usuario` INT)
BEGIN
update usuario set Nombre = u_Nombre, Apellido_Paterno = u_Paterno, Apellido_Materno = u_Materno,
Correo = u_Correo, Telefono = u_Tele, Id_Genero = u_Genero
 where Id_Usuario = u_Usuario;
END$$
DELIMITER ;

--SP para la edición de alumno
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_alumno`(`a_RFC` VARCHAR(10),
`a_Nivel` INT, `a_Grado` INT,  `a_Grupo` INT,  `a_Usuario` INT)
BEGIN
update alumno set RFC = a_RFC, Id_Nivel = a_Nivel, Id_Grado = a_Grado, Id_Grupo = a_Grupo
 where Id_Usuario = a_Usuario;
END$$
DELIMITER ;

--SP para la edición de dirección
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_direccion`(`d_Estado` VARCHAR(60),
`d_Municipio` VARCHAR(60), `d_Calle` VARCHAR(100),  `d_Numero` VARCHAR(10), `d_CP` VARCHAR(5),  
`d_Colonia` VARCHAR(100),`d_Direccion` INT)
BEGIN
update direccion set Estado = d_Estado, Municipio = d_Municipio, Calle = d_Calle, 
Numero = d_Numero, CP = d_CP, Colonia = d_Colonia
 where Id_Direccion = d_Direccion;
END$$
DELIMITER ;


--SP para la inserción de una nueva asistencia
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_asistencia`( `a_Fecha` DATE,
`a_Alumno` INT, `a_Personal` INT, `a_Ac` INT, `a_Tipo` INT)
BEGIN
INSERT INTO asistencia (Fecha, Id_Alumno, Id_Personal_Escolar, Id_Alumno_Clase,
Id_Tipo_Asistencia)
VALUES(a_Fecha, a_Alumno, a_Personal, a_Ac, a_Tipo);
END$$
DELIMITER ;

--SP para la inserción de una nueva calificación parcial
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_calificacionp`( `c_Calif` FLOAT,
`c_Fecha` DATE, `c_Alumno` INT, `c_Ac` INT, `c_Parcial` INT)
BEGIN
INSERT INTO calificacion_parcial (Calificacion, Fecha_Cap, Id_Alumno, Id_Alumno_Clase,
Parcial)
VALUES(c_Calif, c_Fecha, c_Alumno, c_Ac, c_Parcial);
END$$
DELIMITER ;

--SP para la edición de calificaciones parciales
DELIIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_calP`(`u_Ecal` FLOAT,`u_idcal` INT,
`u_FechaN` DATE)
BEGIN
update calificacion_parcial set Calificacion = u_Ecal, Fecha_Cap = u_FechaN
 where Id_Calificacion_Parcial = u_idcal;
END$$
DELIIMITER ;

--SP para la inserción de una nueva calificación final
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_calificacionf`( `f_Calif` FLOAT,
 `f_Alumno` INT, `f_Ac` INT)
BEGIN
INSERT INTO calificacion_final (Calificacion, Id_Alumno, Id_Alumno_Clase)
VALUES(f_Calif, f_Alumno, f_Ac);
END$$
DELIMITER ;

--SP para la edición de calificaciones finales
DELIIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_calF`(`f_Ecal` FLOAT,`f_idcal` INT)
BEGIN
update calificacion_final set Calificacion = f_Ecal
 where Id_Calificacion_Final = f_idcal;
END$$
DELIIMITER ;

--SP para la edición de estatus de usuario
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_usuario_estatus`(`u_estatus` INT, `u_Usuario` INT)
BEGIN
update usuario set Id_Estatus = u_estatus
 where Id_Usuario = u_Usuario;
END$$
DELIMITER ;

--SP para la edición de foto
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_usuario_foto`(`u_foto` VARCHAR(255), `u_Usuario` INT)
BEGIN
update usuario set Foto = u_foto
 where Id_Usuario = u_Usuario;
END$$
DELIMITER ;

--SP para la edición de personal escolar
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_personal`(`a_RFC` VARCHAR(10),
`a_Puesto` VARCHAR(60), `a_Usuario` INT)
BEGIN
update personal_escolar set RFC = a_RFC, Puesto = a_Puesto
 where Id_Usuario = a_Usuario;
END$$
DELIMITER ;

--SP para la edición de contraseña
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_contrasena`(`a_contrasena` VARCHAR(65),
`a_Usuario` INT)
BEGIN
update usuario set Contrasena = a_contrasena
 where Id_Usuario = a_Usuario;
END$$
DELIMITER ;

--SP para la edición de una clase
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_clase`(`c_Nombrec` VARCHAR(100),
`c_Descrip` longtext, `c_HoraI` VARCHAR(45), `c_HoraF` VARCHAR(45), `c_Nivel` INT,
`c_Grado` INT, `c_personal` INT, `c_Estatus` INT, `c_Grupo` INT, `c_clase` INT)
BEGIN
update clase set Nombre_Clase = c_Nombrec, Descripción = c_Descrip, Hora_inicio = c_HoraI,
Hora_final = c_HoraF, Id_Nivel = c_Nivel, Id_Grado = c_Grado, Id_Personal_Escolar = c_personal,
Id_Estatus = c_Estatus, Id_Grupo = c_Grupo
 where Id_Clase = c_clase;
END$$
DELIMITER ;

--SP para la edición de asistencia
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_asistencia`(`a_asis` INT,
`a_Usuario` INT)
BEGIN
update asistencia set Id_Tipo_Asistencia = a_asis
 where Id_Asistencia = a_Usuario;
END$$
DELIMITER ;

--SP para la inserción a la tabla alumno_clase
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_alumnoclase`( `c_clase` INT,
 `c_Alumno` INT)
BEGIN
INSERT INTO alumno_clase(Id_Alumno, Id_Clase)
VALUES(c_Alumno, c_clase);
END$$
DELIMITER ;

--SP para edición de estatus de un mensaje
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mensajeE`(`u_user` INT,
`u_userD` INT)
BEGIN
update mensaje set Id_Estatus = 2
 where Id_Usuario_remitente = u_userD AND Id_Usuario_destinatario = u_user;
END$$
DELIMITER ;

--SP para la inserción de un nuevo mensaje
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_mensaje`( `m_contenido` LONGTEXT,
 `m_Fecha` timestamp, `m_remi` INT, `m_des` INT, `m_est` INT)
BEGIN
INSERT INTO mensaje(Contenido, Fecha_hora, Id_Usuario_remitente, Id_Usuario_destinatario,
Id_Estatus)
VALUES(m_contenido, m_fecha, m_remi, m_des, m_est);
END$$
DELIMITER ;

--SP para la inserción de un nuevo evento en teams o zoom
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_eventoTZ`( `e_hora` VARCHAR(45),
 `e_fecha` date, `e_clase` INT, `e_tipo` INT, `e_user` INT)
BEGIN
INSERT INTO evento_reuniones(Hora_Inicio, Fecha_Reunion, Id_Clase, Id_Tipo_Evento, Id_Usuario)
VALUES(e_hora, e_fecha, e_clase, e_tipo, e_user);
END$$
DELIMITER ;

--SP para la inserción de un nuevo material para la biblioteca
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_biblioteca`( `b_nombre` VARCHAR(100),
 `b_des` VARCHAR(100), `b_estatus` INT, `b_recurso` INT, `b_nivel` INT, `b_grado` INT)
BEGIN
INSERT INTO biblioteca_virtual(Nombre_Material, Descripcion_Material, Id_Estatus, Id_Recurso,
Id_Nivel, Id_Grado)
VALUES(b_nombre, b_des, b_estatus, b_recurso, b_nivel, b_grado);
END$$
DELIMITER ;

--SP para la inserción de una nueva evaluación
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_evaluacion`( `e_Calif` FLOAT,
`e_Fecha` DATE, `e_Nume` INT, `e_Alumno` INT, `e_Ac` INT )
BEGIN
INSERT INTO evaluacion (Calificacion, Fecha_Cap, Num_evaluacion, Id_Alumno, Id_Alumno_Clase)
VALUES(e_Calif, e_Fecha, e_Nume, e_Alumno, e_Ac);
END$$
DELIMITER ;

--SP para la edición de evaluaciones
DELIIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_evaluacion`(`u_Ecal` FLOAT,`u_idcal` INT,
`u_FechaN` DATE)
BEGIN
update evaluacion set Calificacion = u_Ecal, Fecha_Cap = u_FechaN
 where Id_Evaluación = u_idcal;
END$$
DELIIMITER ;

--SP para la inserción de una notificación general
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_notificacion`( `n_Contenido` LONGTEXT,
`n_fecha` TIMESTAMP, `n_tipo` INT, `n_Estatus` INT, `n_usuario` INT)
BEGIN
INSERT INTO notificacion (Contenido, Fecha_hora, Tipo_Noti, Id_Estatus, Id_Usuario)
VALUES(n_Contenido, n_fecha, n_tipo, n_Estatus, n_usuario);
END$$
DELIMITER ;

--SP para edición de estatus de un mensaje
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_notificacion`(`u_noti` INT)
BEGIN
update notificacion set Id_Estatus = 2
 where Id_Notificacion = u_noti;
END$$
DELIMITER ;

--SP para insertar el monto a pagar
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_monto_pago`( `p_alumno` INT,
 `p_monto` FLOAT, `p_periodo` INT)
BEGIN
INSERT INTO pago_reporte(Monto, Id_Alumno, Id_Periodo)
VALUES(p_monto, p_alumno, p_periodo);
END$$
DELIMITER ;

--SP para edición de cantidad de pago
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_cantidad_pago`(`p_monto` INT, `p_idp`)
BEGIN
update pago_reporte set Monto = p_monto
 where Id_Pago_Reporte = p_idp;
END$$
DELIMITER ;

