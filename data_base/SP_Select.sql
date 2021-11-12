--Este archivo contiene todos los SP de consultas del sistema

--SP que sirve para seleccionar el último ID de la tabla dirección
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_direccion`()
BEGIN
  SELECT MAX(Id_Direccion) AS idD FROM direccion;
  END$$
DELIMITER ; 

--SP que sirve para seleccionar el último ID de la tabla usuario
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_usuario`()
BEGIN
  SELECT MAX(Id_Usuario) AS idU FROM usuario;
  END$$
DELIMITER ; 

--SP que sirve para obtener los alumnos
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnos_elegir` ()  
BEGIN
  SELECT * FROM (((usuario 
  INNER JOIN alumno 
  ON usuario.Id_Usuario = alumno.Id_Usuario)
  INNER JOIN nivel 
  ON nivel.Id_Nivel = alumno.Id_Nivel)
  INNER JOIN grupo 
  ON grupo.Id_grupo = alumno.Id_grupo)
  INNER JOIN grado 
  ON grado.Id_grado = alumno.Id_grado
  ORDER BY usuario.Apellido_Paterno;
END $$
DELIMITER ;

--SP para elegir el ultimo padre registrado
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_padre`()
BEGIN
  SELECT MAX(Id_Usuario) AS idP FROM usuario where Id_Rol=3;
  END$$
  DELIMITER ;

--SP para consultar a todos los usuarios en el sistema
DELIIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_usuarios`(`u_correo` VARCHAR(100))
BEGIN
  SELECT * FROM (((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus
   WHERE usuario.Correo = u_correo;
END$$
DELIMITER ;

--SP que sirve para consultar usuarios por ID
DELIIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_usuarios2`(`u_user` INT)
BEGIN
  SELECT * FROM (((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus
   WHERE usuario.Id_Usuario = u_user;
END$$
DELIMITER ;

--SP que sirve para seleccionar todos los profesores
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_usuario_docente`()
BEGIN
  SELECT * FROM ((((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus)
  INNER JOIN personal_escolar
  ON personal_escolar.Id_Usuario = usuario.Id_Usuario
  WHERE usuario.Id_Rol = 1;
END$$
DELIMITER ;

--SP que sirve para seleccionar todos los peridos registrados del sistema
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_periodo`()
BEGIN
  SELECT * FROM periodo;
  END$$
  DELIMITER ;

--SP que sirve para seleccionar todos los alumnos dependiendo su nivel
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_alumno_nivel`(`a_nivel` INT)
BEGIN
  SELECT * FROM ((((((((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus)
  INNER JOIN alumno
  ON alumno.Id_Usuario = usuario.Id_Usuario)
  INNER JOIN nivel
  ON nivel.Id_Nivel = alumno.Id_Nivel)
  INNER JOIN grado
  ON grado.Id_Grado = alumno.Id_grupo)
  INNER JOIN grupo
  ON grupo.Id_Grupo = alumno.Id_Grupo)
  INNER JOIN padre_alumno
  ON padre_alumno.Id_Alumno = alumno.Id_Alumno 
  WHERE usuario.Id_Rol = 6 AND alumno.Id_Nivel = a_nivel AND usuario.Id_Estatus=1 ;
END$$
DELIMITER ;

--SP que sirve para seleccionar todos los alumnos dependiendo su nivel
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_alumno_nivel2`(`a_usuario` INT)
BEGIN
  SELECT * FROM ((((((((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus)
  INNER JOIN alumno
  ON alumno.Id_Usuario = usuario.Id_Usuario)
  INNER JOIN nivel
  ON nivel.Id_Nivel = alumno.Id_Nivel)
  INNER JOIN grado
  ON grado.Id_Grado = alumno.Id_grupo)
  INNER JOIN grupo
  ON grupo.Id_Grupo = alumno.Id_Grupo)
  INNER JOIN padre_alumno
  ON padre_alumno.Id_Alumno = alumno.Id_Alumno 
  WHERE usuario.Id_Rol = 6 AND usuario.Id_Estatus=1 AND usuario.Id_Usuario=a_usuario;
END$$
DELIMITER ;

--SP para seleccionar las clases de un determindao periodo
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_clase`(`d_usuario` INT, `d_periodo` INT)
BEGIN
SELECT * FROM (((((clase
INNER JOIN nivel
ON nivel.Id_Nivel = clase.Id_Nivel)
INNER JOIN grado
ON grado.Id_Grado = clase.Id_Grado)
INNER JOIN personal_escolar
ON personal_escolar.Id_Personal_Escolar = clase.Id_Personal_Escolar)
INNER JOIN estatus
ON estatus.Id_Estatus = clase.Id_Estatus)
INNER JOIN periodo
ON periodo.Id_Periodo = clase.Id_Periodo)
INNER JOIN grupo
ON grupo.Id_grupo = clase.Id_grupo
where personal_escolar.Id_Personal_Escolar = d_usuario AND 
periodo.Id_Periodo = d_periodo AND estatus.Id_Estatus = 1;
END$$
DELIMITER ;


--SP para seleccionar los docentes y personal escolar
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_docente`(`d_usuario` INT)
BEGIN
SELECT * FROM personal_escolar
INNER JOIN usuario
ON usuario.Id_Usuario = personal_escolar.Id_Usuario
where usuario.Id_Usuario = d_usuario;
END$$
DELIMITER ;

--SP que sirve para seleccionar el último ID de la tabla periodo
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_periodo`()
BEGIN
  SELECT MAX(Id_Periodo) AS idP FROM periodo;
  END$$
DELIMITER ;

--SP para seleccionar las clases con id determinado
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_claseTipo`(`c_Clase` INT)
BEGIN
SELECT * FROM ((((((clase
INNER JOIN nivel
ON nivel.Id_Nivel = clase.Id_Nivel)
INNER JOIN grado
ON grado.Id_Grado = clase.Id_Grado)
INNER JOIN personal_escolar
ON personal_escolar.Id_Personal_Escolar = clase.Id_Personal_Escolar)
INNER JOIN usuario
ON usuario.Id_Usuario = personal_escolar.Id_Usuario)
INNER JOIN estatus
ON estatus.Id_Estatus = clase.Id_Estatus)
INNER JOIN periodo
ON periodo.Id_Periodo = clase.Id_Periodo)
INNER JOIN grupo
ON grupo.Id_grupo = clase.Id_grupo
where clase.Id_Clase = c_Clase;
END$$
DELIMITER ;

--SP que sirve para seleccionar el último ID de la tabla recurso
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_recurso`()
BEGIN
  SELECT MAX(Id_Recurso) AS idR FROM recurso;
  END$$
DELIMITER ;

--SP para seleccionar las cactividades de determinada clase
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_actividad`(`c_Clase` INT)
BEGIN
SELECT * FROM ((actividad
INNER JOIN personal_escolar
ON personal_escolar.Id_Personal_Escolar = actividad.Id_Personal_Escolar)
INNER JOIN clase
ON clase.Id_Clase = actividad.Id_Clase)
INNER JOIN recurso
ON recurso.Id_Recurso = actividad.Id_Recurso
where clase.Id_Clase = c_Clase;
END$$
DELIMITER ;

--SP para seleccionar todos los alumnos pertenecientes a una clase
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnoA`(`a_Clase` INT)
BEGIN
SELECT * FROM ((alumno_clase
INNER JOIN alumno
ON alumno_clase.Id_Alumno = alumno.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN clase
ON clase.Id_Clase = alumno_clase.Id_Clase
where clase.Id_Clase = a_Clase;
END$$
DELIMITER ;

--SP para seleccionar las calificaciones parciales de una clase y de un parcial
DELIIMIT$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnocalifp`(`c_Clase` INT)
BEGIN
SELECT * FROM ((calificacion_parcial
INNER JOIN alumno
ON alumno.Id_Alumno = calificacion_parcial.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = calificacion_parcial.Id_Alumno_Clase
where alumno_clase.Id_Clase = c_Clase;
END$$
DELIIMITER ;

--SP para seleccionar las calificaciones parciales de una clase
DELIIMIT$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnocalifp2`(`c_Clase` INT,
`c_Parcial` INT)
BEGIN
SELECT * FROM (((calificacion_parcial
INNER JOIN alumno
ON alumno.Id_Alumno = calificacion_parcial.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN parcial
ON parcial.Id_Parcial = calificacion_parcial.Id_Parcial)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = calificacion_parcial.Id_Alumno_Clase
where alumno_clase.Id_Clase = c_Clase;
END$$
DELIIMITER ;

--SP para seleccionar las calificaciones finales de una clase
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnocalifF`(`f_Clase` INT)
BEGIN
SELECT * FROM ((calificacion_final
INNER JOIN alumno
ON alumno.Id_Alumno = calificacion_final.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = calificacion_final.Id_Alumno_Clase
where alumno_clase.Id_Clase = f_Clase;
END$$
DELIIMITER ;

--SP para seleccionar las asistencias de una determinada clase
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_asistecia`(`a_Clase` INT)
BEGIN
SELECT * FROM (((asistencia
INNER JOIN alumno
ON alumno.Id_Alumno = asistencia.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = asistencia.Id_Alumno_Clase)
INNER JOIN tipo_asistencia
ON tipo_asistencia.Id_Tipo_Asistencia = asistencia.Id_Tipo_Asistencia
where alumno_clase.Id_Clase = a_Clase;
END$$
DELIIMITER ;

--SP que sirve para seleccionar todos los alumno
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_usuario_alumno`(`a_user` INT)
BEGIN
  SELECT * FROM (((alumno
  INNER JOIN usuario
  ON usuario.Id_Usuario = alumno.Id_Usuario)
  INNER JOIN nivel
  ON nivel.Id_Nivel = alumno.Id_Nivel)
  INNER JOIN grado
  ON grado.Id_Grado = alumno.Id_Grado)
  INNER JOIN grupo
  ON grupo.Id_Grupo = alumno.Id_Grupo
  WHERE alumno.Id_Usuario = a_user;
END$$
DELIMITER ;

--SP para seleccionar todas las clases de un determinado alumno
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_clase_alumno`(`a_alumno` INT,
`a_peri` INT)
BEGIN
  SELECT * FROM ((((((((alumno_clase
  INNER JOIN clase
  ON clase.Id_Clase = alumno_clase.Id_Clase)
  INNER JOIN nivel
  ON nivel.Id_Nivel = clase.Id_Nivel)
  INNER JOIN grado
  ON grado.Id_Grado = clase.Id_Grado)
  INNER JOIN personal_escolar
  ON personal_escolar.Id_Personal_Escolar = clase.Id_Personal_Escolar)
  INNER JOIN grupo
  ON grupo.Id_Grupo = clase.Id_Grupo)
  INNER JOIN usuario
  ON usuario.Id_Usuario = personal_escolar.Id_Usuario)
  INNER JOIN alumno
  ON alumno.Id_Alumno = alumno_clase.Id_Alumno)
  INNER JOIN periodo
  ON periodo.Id_Periodo = clase.Id_Periodo)
  INNER JOIN estatus
  ON estatus.Id_Estatus = clase.Id_Estatus
  WHERE alumno.Id_Alumno = a_alumno AND clase.Id_Periodo = a_peri AND clase.Id_Estatus = 1;
END$$
DELIMITER ;

--SP para seleccionar las asistencias de un determinado alumno
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_asistecia_a`(`a_Clase` INT, `a_ac` INT)
BEGIN
SELECT * FROM (((asistencia
INNER JOIN alumno
ON alumno.Id_Alumno = asistencia.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = asistencia.Id_Alumno_Clase)
INNER JOIN tipo_asistencia
ON tipo_asistencia.Id_Tipo_Asistencia = asistencia.Id_Tipo_Asistencia
where alumno_clase.Id_Clase = a_Clase and asistencia.Id_Alumno_Clase = a_ac;
END$$
DELIIMITER ;

--SP para seleccionar las calificaciones parciales para un mdeterminado alumno
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_califP_a`(`c_Clase` INT, `c_ac` INT)
BEGIN
SELECT * FROM ((calificacion_parcial
INNER JOIN alumno
ON alumno.Id_Alumno = calificacion_parcial.Id_Alumno)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = calificacion_parcial.Id_Alumno_Clase)
INNER JOIN parcial
ON parcial.Id_Parcial = calificacion_parcial.Id_Parcial
where alumno_clase.Id_Clase = c_Clase and calificacion_parcial.Id_Alumno_Clase = c_ac;
END$$
DELIMITER ;

--SP seleccionar las calificaciones finales de un alumno determinado
DELIMIER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_califF_a`(`c_a` INT)
BEGIN
SELECT * FROM ((calificacion_final
INNER JOIN alumno
ON alumno.Id_Alumno = calificacion_final.Id_Alumno)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = calificacion_final.Id_Alumno_Clase)
INNER JOIN clase
ON clase.Id_Clase = alumno_clase.Id_Clase
where calificacion_final.Id_Alumno = c_a;
END$$
DELIMITER ;

--SP que sirve para consultar usuarios poadre
DELIIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_hijos`(`u_user` INT)
BEGIN
   SELECT * FROM ((((padre_alumno
  INNER JOIN alumno 
  ON alumno.Id_Alumno = padre_alumno.Id_Alumno)
  INNER JOIN usuario 
  ON usuario.Id_Usuario = alumno.Id_Usuario)
  INNER JOIN nivel
  ON nivel.Id_NIvel = alumno.Id_Nivel)
  INNER JOIN grado
  ON grado.Id_Grado = alumno.Id_Grado)
  INNER JOIN grupo
  ON grupo.Id_Grupo = alumno.Id_Grupo
   WHERE padre_alumno.Id_Padre = u_user;
END$$
DELIMITER ;

--SP que sirve para seleccionar todos los alumnos dependiendo su nivel y sin importat estatus
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_alumno_nivel_estatus`(`a_nivel` INT)
BEGIN
  SELECT * FROM ((((((((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus)
  INNER JOIN alumno
  ON alumno.Id_Usuario = usuario.Id_Usuario)
  INNER JOIN nivel
  ON nivel.Id_Nivel = alumno.Id_Nivel)
  INNER JOIN grado
  ON grado.Id_Grado = alumno.Id_grupo)
  INNER JOIN grupo
  ON grupo.Id_Grupo = alumno.Id_Grupo)
  INNER JOIN padre_alumno
  ON padre_alumno.Id_Alumno = alumno.Id_Alumno 
  WHERE usuario.Id_Rol = 6 AND alumno.Id_Nivel = a_nivel;
END$$
DELIMITER ;

  --SP que sirve para seleccionar todos el personal escolar
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_personal`()
BEGIN
  SELECT * FROM ((((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus)
  INNER JOIN personal_escolar
  ON personal_escolar.Id_Usuario = usuario.Id_Usuario
  WHERE usuario.Id_Rol = 1 AND usuario.Id_Estatus=1 ;
END$$
DELIMITER ;

--SP que sirve para seleccionar todos los alumnos dependiendo su nivel
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_personal2`(`a_usuario` INT)
BEGIN
  SELECT * FROM ((((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus)
  INNER JOIN personal_escolar
  ON personal_escolar.Id_Usuario = usuario.Id_Usuario 
  WHERE usuario.Id_Rol = 1 AND usuario.Id_Estatus=1 AND usuario.Id_Usuario=a_usuario;
END$$
DELIMITER ;

 --SP que sirve para seleccionar todos el personal escolar sin importar estatus
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_personales`()
BEGIN
  SELECT * FROM ((((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus)
  INNER JOIN personal_escolar
  ON personal_escolar.Id_Usuario = usuario.Id_Usuario
  WHERE usuario.Id_Rol = 1;
END$$
DELIMITER ;

--SP que sirve para seleccionar los padres de familia
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_padres`()
BEGIN
  SELECT * FROM (((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus
  WHERE usuario.Id_Rol = 3;
END$$
DELIMITER ;

--SP que sirve para seleccionar un solo padre de familia
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_padres2`(`a_usuario` INT)
BEGIN
  SELECT * FROM ((((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus)
  WHERE usuario.Id_Rol = 3 AND usuario.Id_Estatus=1 AND usuario.Id_Usuario=a_usuario;
END$$
DELIMITER ;

--SP para seleccionar las clases de un determindao periodo
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_claseAll`(`d_periodo` INT)
BEGIN
SELECT * FROM ((((((clase
INNER JOIN nivel
ON nivel.Id_Nivel = clase.Id_Nivel)
INNER JOIN grado
ON grado.Id_Grado = clase.Id_Grado)
INNER JOIN personal_escolar
ON personal_escolar.Id_Personal_Escolar = clase.Id_Personal_Escolar)
INNER JOIN usuario
ON usuario.Id_Usuario = personal_escolar.Id_Usuario)
INNER JOIN estatus
ON estatus.Id_Estatus = clase.Id_Estatus)
INNER JOIN periodo
ON periodo.Id_Periodo = clase.Id_Periodo)
INNER JOIN grupo
ON grupo.Id_grupo = clase.Id_grupo
where periodo.Id_Periodo = d_periodo;
END$$
DELIMITER ;

--SP para seleccionar las asistencias de un alumno
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_asistecia_Alum`(`a_asis` INT)
BEGIN
SELECT * FROM (((asistencia
INNER JOIN alumno
ON alumno.Id_Alumno = asistencia.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = asistencia.Id_Alumno_Clase)
INNER JOIN tipo_asistencia
ON tipo_asistencia.Id_Tipo_Asistencia = asistencia.Id_Tipo_Asistencia
where asistencia.Id_Asistencia = a_asis;
END$$
DELIIMITER ;

--SP para seleccionar las clases con id determinado
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_claseCodigo`(`c_Codigo` VARCHAR(7))
BEGIN
SELECT * FROM (((((clase
INNER JOIN nivel
ON nivel.Id_Nivel = clase.Id_Nivel)
INNER JOIN grado
ON grado.Id_Grado = clase.Id_Grado)
INNER JOIN personal_escolar
ON personal_escolar.Id_Personal_Escolar = clase.Id_Personal_Escolar)
INNER JOIN estatus
ON estatus.Id_Estatus = clase.Id_Estatus)
INNER JOIN periodo
ON periodo.Id_Periodo = clase.Id_Periodo)
INNER JOIN grupo
ON grupo.Id_grupo = clase.Id_grupo
where clase.Codigo_Clase = c_Codigo;
END$$
DELIMITER ;

--SP para seleccionar los mensajes 
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_mensaje1`(`m_usuario` INT)
BEGIN
SELECT * FROM (mensaje
INNER JOIN usuario
ON usuario.Id_Usuario = mensaje.Id_Usuario_remitente)
INNER JOIN estatus
ON estatus.Id_Estatus = mensaje.Id_Estatus
where mensaje.Id_Usuario_destinatario = m_usuario ORDER BY mensaje.Fecha_hora;
END$$
DELIIMITER ;

--SP para seleccionar los mensajes de remitentes y destinatarios
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_mensaje2`(`m_usuario` INT,
`m_desti` INT)
BEGIN
SELECT * FROM (mensaje
INNER JOIN usuario
ON usuario.Id_Usuario = mensaje.Id_Usuario_remitente)
INNER JOIN estatus
ON estatus.Id_Estatus = mensaje.Id_Estatus
where mensaje.Id_Usuario_remitente = m_usuario 
AND mensaje.Id_Usuario_destinatario = m_desti
OR mensaje.Id_Usuario_remitente = m_desti 
AND mensaje.Id_Usuario_destinatario = m_usuario 
ORDER BY Fecha_hora mensaje.Fecha_hora AND mensaje.Id_Estatus=1;
END$$
DELIIMITER ;

--SP para consultar a todos los usuarios en el sistema
DELIIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_usuariosAll`()
BEGIN
  SELECT * FROM (((usuario 
  INNER JOIN direccion 
  ON direccion.Id_Direccion = usuario.Id_Direccion)
  INNER JOIN rol 
  ON rol.Id_Rol = usuario.Id_Rol)
  INNER JOIN genero 
  ON genero.Id_Genero = usuario.Id_Genero)
  INNER JOIN estatus 
  ON estatus.Id_Estatus = usuario.Id_Estatus ORDER BY usuario.Apellido_Paterno;
END$$
DELIMITER ;

--SP para consultar a todos los eventos de un suario
DELIIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_eventos`(`e_user` INT)
BEGIN
  SELECT * FROM (((((evento_reuniones 
  INNER JOIN tipo_evento 
  ON tipo_evento.Id_Tipo_Evento = evento_reuniones.Id_Tipo_Evento)
  INNER JOIN usuario
  ON usuario.Id_Usuario =  evento_reuniones.Id_Usuario)
  INNER JOIN clase
  ON clase.Id_Clase =  evento_reuniones.Id_Clase)
  INNER JOIN nivel
  ON nivel.Id_Nivel = clase.Id_Nivel)
  INNER JOIN grado
  ON grado.Id_Grado = clase.Id_Grado)
  INNER JOIN grupo 
  ON grupo.Id_Grupo = clase.Id_Grupo
  WHERE  evento_reuniones.Id_Usuario = e_user;
END$$
DELIMITER ;

--SP para consultar a todoslos materiales de la biblioteca
DELIIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_biblioteca`()
BEGIN
  SELECT * FROM (((biblioteca_virtual
  INNER JOIN estatus 
  ON estatus.Id_Estatus = biblioteca_virtual.Id_Estatus)
  INNER JOIN recurso 
  ON recurso.Id_Recurso = biblioteca_virtual.Id_Recurso)
  INNER JOIN nivel 
  ON nivel.Id_Nivel = biblioteca_virtual.Id_Nivel)
  INNER JOIN grado 
  ON grado.Id_Grado = biblioteca_virtual.Id_Grado ORDER BY biblioteca_virtual.Nombre_Material;
END$$
DELIMITER ;

--SP para consultar a  un solo material de la biblioteca
DELIIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_bibliotecaID`(`b_biblio` INT)
BEGIN
  SELECT * FROM (((biblioteca_virtual
  INNER JOIN estatus 
  ON estatus.Id_Estatus = biblioteca_virtual.Id_Estatus)
  INNER JOIN recurso 
  ON recurso.Id_Recurso = biblioteca_virtual.Id_Recurso)
  INNER JOIN nivel 
  ON nivel.Id_Nivel = biblioteca_virtual.Id_Nivel)
  INNER JOIN grado 
  ON grado.Id_Grado = biblioteca_virtual.Id_Grado
  WHERE biblioteca_virtual.Id_Biblioteca_Virtual = b_biblio;
END$$
DELIMITER ;

--SP para seleccionar las evaluaciones
DELIIMIT$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_evaluacion`(`c_Clase` INT)
BEGIN
SELECT * FROM ((evaluacion
INNER JOIN alumno
ON alumno.Id_Alumno = evaluacion.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = evaluacion.Id_Alumno_Clase
where alumno_clase.Id_Clase = c_Clase;
END$$
DELIIMITER ;

--SP para seleccionar los docentes
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_docente2`(`d_usuario` INT)
BEGIN
SELECT * FROM personal_escolar
INNER JOIN usuario
ON usuario.Id_Usuario = personal_escolar.Id_Usuario
where personal_escolar.Id_personal_escolar = d_usuario;
END$$
DELIMITER ;

--SP para seleccionar notificaciones
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_notificacion`(`tipo` INT)
BEGIN
SELECT * FROM (notificacion
INNER JOIN estatus
ON estatus.Id_Estatus = notificacion.Id_Estatus)
INNER JOIN usuario
ON usuario.Id_Usuario = notificacion.Id_Usuario
WHERE notificacion.Tipo_Noti = tipo AND notificacion.Id_Estatus = 1;
END$$
DELIMITER ;

--SP para seleccionar notificaciones docente
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_notificacionDocente`(`tipo` INT,
`user` INT)
BEGIN
SELECT * FROM (notificacion
INNER JOIN estatus
ON estatus.Id_Estatus = notificacion.Id_Estatus)
INNER JOIN usuario
ON usuario.Id_Usuario = notificacion.Id_Usuario
WHERE notificacion.Tipo_Noti = tipo AND notificacion.Id_Estatus = 1
AND notificacion.Id_Usuario = user;
END$$
DELIMITER ;

--SP para seleccionar a los alumnos de una clase
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnos_clase`(`clase` INT)
BEGIN
SELECT usuario.Id_Usuario FROM ((alumno_clase
INNER JOIN alumno
ON alumno.Id_Alumno = alumno_clase.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN clase
ON clase.Id_Clase = alumno_clase.Id_Clase
WHERE alumno_clase.Id_Clase = clase;
END$$
DELIMITER ;

--SP que sirve para seleccionar a un padre de determinado alumno
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_usuario_padre_noti`(`a_user` INT)
BEGIN
  SELECT * FROM padre_alumno
  INNER JOIN usuario
  ON usuario.Id_Usuario = padre_alumno.Id_Padre
  WHERE padre_alumno.Id_Alumno = a_user;
END$$
DELIMITER ;

--SP para seleccionar los id de los supervisores
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_supervisor`()
BEGIN
SELECT Id_Usuario FROM usuario WHERE Id_Rol = 2;
END$$
DELIMITER ;

--SP que sirve para seleccionar las calificaciones parciales de un alumno
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_califp_alumno_`(`a_user` INT, `a_ca` INT)
BEGIN
  SELECT Calificacion FROM calificacion_parcial
  WHERE Id_Alumno = a_user AND Id_Alumno_Clase = a_ca;
END$$
DELIMITER ;

--SP para seleccionar a los alumnos con su determinado correo
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnos_clase_csv`(`c_correo` VARCHAR(100))
BEGIN
SELECT alumno.Id_Alumno FROM alumno
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario
WHERE usuario.Correo = c_correo;
END$$
DELIMITER ;

--SP para seleccionar las evaluaciones para un determinado alumno
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_evaluacion_a`(`c_alumno` INT, `c_ac` INT)
BEGIN
SELECT * FROM ((evaluacion
INNER JOIN alumno
ON alumno.Id_Alumno = evaluacion.Id_Alumno)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = evaluacion.Id_Alumno_Clase)
where evaluacion.Id_Alumno_Clase = c_ac and evaluacion.Id_Alumno = c_alumno;
END$$
DELIMITER ;

--SP para verificar si algun alumno ya se le asigno una calificación de algún parcial
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_califpcomp_a`(`c_alumno` INT, `c_ac` INT,
`c_parcial` INT)
BEGIN
SELECT * FROM calificacion_parcial
where Id_Alumno = c_alumno AND Id_Alumno_Clase = c_ac AND Parcial = c_parcial;
END$$
DELIMITER ;

--SP para verificar si algún alumno ya se le asigno una calificación final de una materia
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_califFcomp_a`(`c_alumno` INT, `c_ac` INT)
BEGIN
SELECT * FROM calificacion_final
where Id_Alumno = c_alumno AND Id_Alumno_Clase = c_ac;
END$$
DELIMITER ;

--SP para verificar si algun alumno ya se le asigno una calificación a alguna evaluación
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_evacomp_a`(`c_alumno` INT, `c_c` INT,
`c_parcial` INT)
BEGIN
SELECT * FROM evaluacion
where Id_Alumno = c_alumno AND Id_Alumno_Clase = c_c AND Num_evaluacion = c_parcial;
END$$
DELIMITER ;

--SP para verificar si algun alumno ya se le tomo asistencia en cierta fecha
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_asistenciacomp_a`(`c_alumno` INT, `c_c` INT,
`c_fecha` DATE)
BEGIN
SELECT * FROM asistencia
where Id_Alumno = c_alumno AND Id_Alumno_Clase = c_c AND Fecha = c_fecha;
END$$
DELIMITER ;

--SP para verificar si algun alumno ya tiene registrado un padre
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_padreacompr`(`c_alumno` INT)
BEGIN
SELECT * FROM padre_alumno
where Id_Alumno = c_alumno;
END$$
DELIMITER ;

--SP para verificar si algún periodo con la fceha dada ya esta creado
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_peridodcomp`(`c_fechai` DATE,
`c_fechat` DATE)
BEGIN
SELECT * FROM periodo
where Fecha_Inicio = c_fechai AND Fecha_Termino = C_fechat;
END$$
DELIMITER ;

--SP para verificar si algún alumno se encuentra inscrito en algún grupo
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnoclasecomp`(`alumno` INT,
`clase` INT)
BEGIN
SELECT * FROM alumno_clase
where Id_Alumno = alumno AND Id_Clase = clase;
END$$
DELIMITER ;

--SP para eventos de allumnos
DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_eventosa`(IN `e_clase` INT)
BEGIN
 SELECT * FROM (((((evento_reuniones 
  INNER JOIN tipo_evento 
  ON tipo_evento.Id_Tipo_Evento = evento_reuniones.Id_Tipo_Evento)
  INNER JOIN usuario
  ON usuario.Id_Usuario =  evento_reuniones.Id_Usuario)
  INNER JOIN clase
  ON clase.Id_Clase =  evento_reuniones.Id_Clase)
  INNER JOIN nivel
  ON nivel.Id_Nivel = clase.Id_Nivel)
  INNER JOIN grado
  ON grado.Id_Grado = clase.Id_Grado)
  INNER JOIN grupo 
  ON grupo.Id_Grupo = clase.Id_Grupo
  WHERE  evento_reuniones.Id_Clase = e_clase;
END$$
DELIMITER ;