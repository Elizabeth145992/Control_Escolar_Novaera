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