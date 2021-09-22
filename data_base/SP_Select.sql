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
