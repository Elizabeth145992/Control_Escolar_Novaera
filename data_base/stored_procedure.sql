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
`d_Municipio` VARCHAR(60), `d_Calle` VARCHAR(100), `d_Numero` VARCHAR(10),`d_CP` VARCHAR(5))
BEGIN
INSERT INTO direccion (Estado, Municipio, Calle, Numero, CP)
VALUES(d_Estado, d_Municipio, d_Calle, d_Numero, d_CP);
END$$
DELIMITER ;

--SP para la inserción de nuevo alumno
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_alumno`( `a_RFC` VARCHAR(10),
`a_Nivel` INT, `a_Grado` INT, `a_Grupo` INT)
BEGIN
INSERT INTO alumno (RFC,Id_Nivel, Id_Grado, Id_Grupo)
VALUES(a_RFC, a_Usuario, a_Nivel, a_Grado, a_Grupo);
END$$
DELIMITER ;