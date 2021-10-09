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