-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3310
-- Tiempo de generación: 12-11-2021 a las 02:22:22
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_control_escolar`
--
CREATE DATABASE IF NOT EXISTS `db_control_escolar` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_control_escolar`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `insert_actividad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_actividad` (`a_Nombre` VARCHAR(60), `a_Contenido` LONGTEXT, `a_Fecha` DATE, `a_Docente` INT, `a_Clase` INT, `a_Recurso` INT)  BEGIN
INSERT INTO actividad (Nombre_Actividad, Contenido, Fecha_Entrega, Id_Personal_Escolar, 
Id_Clase, Id_Recurso)
VALUES(a_Nombre, a_Contenido, a_Fecha, a_Docente, a_Clase, a_Recurso);
END$$

DROP PROCEDURE IF EXISTS `insert_alumno`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_alumno` (`a_RFC` VARCHAR(10), `a_Usuario` INT, `a_Nivel` INT, `a_Grado` INT, `a_Grupo` INT)  BEGIN
INSERT INTO alumno (RFC, Id_Usuario, Id_Nivel, Id_Grado, Id_Grupo)
VALUES(a_RFC, a_Usuario, a_Nivel, a_Grado, a_Grupo);
END$$

DROP PROCEDURE IF EXISTS `insert_alumnoclase`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_alumnoclase` (`c_clase` INT, `c_Alumno` INT)  BEGIN
INSERT INTO alumno_clase(Id_Alumno, Id_Clase)
VALUES(c_Alumno, c_clase);
END$$

DROP PROCEDURE IF EXISTS `insert_asistencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_asistencia` (`a_Fecha` DATE, `a_Alumno` INT, `a_Personal` INT, `a_Ac` INT, `a_Tipo` INT)  BEGIN
INSERT INTO asistencia (Fecha, Id_Alumno, Id_Personal_Escolar, Id_Alumno_Clase,
Id_Tipo_Asistencia)
VALUES(a_Fecha, a_Alumno, a_Personal, a_Ac, a_Tipo);
END$$

DROP PROCEDURE IF EXISTS `insert_biblioteca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_biblioteca` (`b_nombre` VARCHAR(100), `b_des` VARCHAR(100), `b_estatus` INT, `b_recurso` INT, `b_nivel` INT, `b_grado` INT)  BEGIN
INSERT INTO biblioteca_virtual(Nombre_Material, Descripcion_Material, Id_Estatus, Id_Recurso,
Id_Nivel, Id_Grado)
VALUES(b_nombre, b_des, b_estatus, b_recurso, b_nivel, b_grado);
END$$

DROP PROCEDURE IF EXISTS `insert_calificacionf`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_calificacionf` (`f_Calif` FLOAT, `f_Alumno` INT, `f_Ac` INT)  BEGIN
INSERT INTO calificacion_final (Calificacion, Id_Alumno, Id_Alumno_Clase)
VALUES(f_Calif, f_Alumno, f_Ac);
END$$

DROP PROCEDURE IF EXISTS `insert_calificacionp`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_calificacionp` (IN `c_Calif` FLOAT, IN `c_Fecha` DATE, IN `c_Alumno` INT, IN `c_Ac` INT, IN `c_Parcial` INT)  BEGIN
INSERT INTO calificacion_parcial (Calificacion, Fecha_Cap, Id_Alumno, Id_Alumno_Clase, Parcial)
VALUES(c_Calif, c_Fecha, c_Alumno, c_Ac, c_Parcial);
END$$

DROP PROCEDURE IF EXISTS `insert_clase`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_clase` (`c_Nombre` VARCHAR(100), `c_Descrip` LONGTEXT, `c_Codigo` VARCHAR(7), `c_HoraI` VARCHAR(45), `c_HoraF` VARCHAR(45), `c_Nivel` INT, `c_Grado` INT, `c_Personal` INT, `c_Estatus` INT, `c_Periodo` INT, `c_Grupo` INT)  BEGIN
INSERT INTO clase (Nombre_Clase, Descripción, Codigo_Clase, Hora_inicio, Hora_final, 
Id_Nivel, Id_Grado, Id_Personal_Escolar, Id_Estatus, Id_Periodo, Id_Grupo)
VALUES(c_Nombre, c_Descrip, c_Codigo, c_HoraI, c_HoraF,
c_Nivel, c_Grado, c_Personal, c_Estatus, c_Periodo, c_Grupo);
END$$

DROP PROCEDURE IF EXISTS `insert_direccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_direccion` (`d_Estado` VARCHAR(60), `d_Municipio` VARCHAR(60), `d_Calle` VARCHAR(100), `d_Numero` VARCHAR(10), `d_CP` VARCHAR(5), `d_Colonia` VARCHAR(100))  BEGIN
INSERT INTO direccion (Estado, Municipio, Calle, Numero, CP, Colonia)
VALUES(d_Estado, d_Municipio, d_Calle, d_Numero, d_CP, d_Colonia);
END$$

DROP PROCEDURE IF EXISTS `insert_evaluacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_evaluacion` (`e_Calif` FLOAT, `e_Fecha` DATE, `e_Nume` INT, `e_Alumno` INT, `e_Ac` INT)  BEGIN
INSERT INTO evaluacion (Calificacion, Fecha_Cap, Num_evaluacion, Id_Alumno, Id_Alumno_Clase)
VALUES(e_Calif, e_Fecha, e_Nume, e_Alumno, e_Ac);
END$$

DROP PROCEDURE IF EXISTS `insert_eventoTZ`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_eventoTZ` (IN `e_titu` VARCHAR(100), IN `e_hora` VARCHAR(45), IN `e_fecha` TIMESTAMP, IN `e_clase` INT, IN `e_tipo` INT, IN `e_user` INT)  BEGIN
INSERT INTO evento_reuniones(Titulo, Hora_Inicio, Fecha_Reunion, Id_Clase, Id_Tipo_Evento, Id_Usuario)
VALUES(e_titu, e_hora, e_fecha, e_clase, e_tipo, e_user);
END$$

DROP PROCEDURE IF EXISTS `insert_mensaje`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_mensaje` (`m_contenido` LONGTEXT, `m_Fecha` TIMESTAMP, `m_remi` INT, `m_des` INT, `m_est` INT)  BEGIN
INSERT INTO mensaje(Contenido, Fecha_hora, Id_Usuario_remitente, Id_Usuario_destinatario,
Id_Estatus)
VALUES(m_contenido, m_Fecha, m_remi, m_des, m_est);
END$$

DROP PROCEDURE IF EXISTS `insert_notificacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_notificacion` (`n_Contenido` LONGTEXT, `n_fecha` TIMESTAMP, `n_tipo` INT, `n_Estatus` INT, `n_usuario` INT)  BEGIN
INSERT INTO notificacion (Contenido, Fecha_hora, Tipo_Noti, Id_Estatus, Id_Usuario)
VALUES(n_Contenido, n_fecha, n_tipo, n_Estatus, n_usuario);
END$$

DROP PROCEDURE IF EXISTS `insert_padre_alumno`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_padre_alumno` (`p_Alumno` INT, `p_Padre` INT)  BEGIN
INSERT INTO padre_alumno (Id_Alumno, Id_Padre)
VALUES(p_Alumno, p_Padre);
END$$

DROP PROCEDURE IF EXISTS `insert_periodo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_periodo` (IN `p_Nombre` VARCHAR(100), IN `p_Inicio` DATE, IN `p_Termino` DATE)  BEGIN
INSERT INTO periodo (Nombre_Periodo, Fecha_Inicio, Fecha_Termino)
VALUES(p_Nombre, p_Inicio, p_Termino);
END$$

DROP PROCEDURE IF EXISTS `insert_personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_personal` (`p_RFC` VARCHAR(10), `p_Puesto` VARCHAR(60), `p_Usuario` INT)  BEGIN
INSERT INTO personal_escolar (RFC, Puesto, Id_Usuario)
VALUES(p_RFC, p_Puesto,  p_Usuario);
END$$

DROP PROCEDURE IF EXISTS `insert_recurso`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_recurso` (IN `r_Recurso` LONGTEXT, `r_tipo` INT)  BEGIN
INSERT INTO recurso (Link_Recurso, Tipo_Material)
VALUES(r_Recurso, r_tipo);
END$$

DROP PROCEDURE IF EXISTS `insert_usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_usuario` (`u_Nombre` VARCHAR(60), `u_Paterno` VARCHAR(60), `u_Materno` VARCHAR(60), `u_Correo` VARCHAR(100), `u_Telefono` VARCHAR(45), `u_foto` VARCHAR(255), `u_Password` VARCHAR(65), `u_Direccion` INT, `u_Rol` INT, `u_Genero` INT, `u_Estatus` INT)  BEGIN
INSERT INTO usuario (Nombre, Apellido_Paterno, Apellido_Materno, Correo, Telefono, 
Foto, Contrasena, Id_Direccion, Id_Rol, Id_Genero, Id_Estatus)
VALUES(u_Nombre, u_Paterno, u_Materno, u_Correo, u_Telefono, u_Foto, u_Password, 
u_Direccion, u_Rol, u_Genero, u_Estatus);
END$$

DROP PROCEDURE IF EXISTS `last_direccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_direccion` ()  BEGIN
  SELECT MAX(Id_Direccion) AS idD FROM direccion;
  END$$

DROP PROCEDURE IF EXISTS `last_padre`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_padre` ()  BEGIN
  SELECT MAX(Id_Usuario) AS idP FROM usuario where Id_Rol=3;
END$$

DROP PROCEDURE IF EXISTS `last_periodo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_periodo` ()  BEGIN
  SELECT MAX(Id_Periodo) AS idP FROM periodo;
  END$$

DROP PROCEDURE IF EXISTS `last_recurso`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_recurso` ()  BEGIN
  SELECT MAX(Id_Recurso) AS idR FROM recurso;
  END$$

DROP PROCEDURE IF EXISTS `last_usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_usuario` ()  BEGIN
  SELECT MAX(Id_Usuario) AS idU FROM usuario;
END$$

DROP PROCEDURE IF EXISTS `select_actividad`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_actividad` (`c_Clase` INT)  BEGIN
SELECT * FROM ((actividad
INNER JOIN personal_escolar
ON personal_escolar.Id_Personal_Escolar = actividad.Id_Personal_Escolar)
INNER JOIN clase
ON clase.Id_Clase = actividad.Id_Clase)
INNER JOIN recurso
ON recurso.Id_Recurso = actividad.Id_Recurso
where clase.Id_Clase = c_Clase;
END$$

DROP PROCEDURE IF EXISTS `select_alumnoA`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnoA` (`a_Clase` INT)  BEGIN
SELECT * FROM ((alumno_clase
INNER JOIN alumno
ON alumno_clase.Id_Alumno = alumno.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN clase
ON clase.Id_Clase = alumno_clase.Id_Clase
where clase.Id_Clase = a_Clase;
END$$

DROP PROCEDURE IF EXISTS `select_alumnocalifF`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnocalifF` (`f_Clase` INT)  BEGIN
SELECT * FROM ((calificacion_final
INNER JOIN alumno
ON alumno.Id_Alumno = calificacion_final.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = calificacion_final.Id_Alumno_Clase
where alumno_clase.Id_Clase = f_Clase;
END$$

DROP PROCEDURE IF EXISTS `select_alumnocalifp`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnocalifp` (`c_Clase` INT)  BEGIN
SELECT * FROM ((calificacion_parcial
INNER JOIN alumno
ON alumno.Id_Alumno = calificacion_parcial.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = calificacion_parcial.Id_Alumno_Clase
where alumno_clase.Id_Clase = c_Clase;
END$$

DROP PROCEDURE IF EXISTS `select_alumnocalifp2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnocalifp2` (`c_Clase` INT, `c_Parcial` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_alumnoclasecomp`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnoclasecomp` (`alumno` INT, `clase` INT)  BEGIN
SELECT * FROM alumno_clase
where Id_Alumno = alumno AND Id_Clase = clase;
END$$

DROP PROCEDURE IF EXISTS `select_alumnos_clase`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnos_clase` (`clase` INT)  BEGIN
SELECT usuario.Id_Usuario FROM ((alumno_clase
INNER JOIN alumno
ON alumno.Id_Alumno = alumno_clase.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN clase
ON clase.Id_Clase = alumno_clase.Id_Clase
WHERE alumno_clase.Id_Clase = clase;
END$$

DROP PROCEDURE IF EXISTS `select_alumnos_clase_csv`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnos_clase_csv` (`c_correo` VARCHAR(100))  BEGIN
SELECT alumno.Id_Alumno FROM alumno
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario
WHERE usuario.Correo = c_correo;
END$$

DROP PROCEDURE IF EXISTS `select_alumnos_elegir`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_alumnos_elegir` ()  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `Select_alumno_nivel`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_alumno_nivel` (`a_nivel` INT)  BEGIN
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
  WHERE usuario.Id_Rol = 6 AND alumno.Id_Nivel = a_nivel AND usuario.Id_Estatus=1;
  END$$

DROP PROCEDURE IF EXISTS `Select_alumno_nivel2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_alumno_nivel2` (`a_usuario` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `Select_alumno_nivel_estatus`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_alumno_nivel_estatus` (`a_nivel` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_asistecia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_asistecia` (`a_Clase` INT)  BEGIN
SELECT * FROM (((asistencia
INNER JOIN alumno
ON alumno.Id_Alumno = asistencia.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = asistencia.Id_Alumno_Clase)
INNER JOIN tipo_asistencia
ON tipo_asistencia.Id_Tipo_Asistencia = asistencia.Id_Tipo_Asistencia
where alumno_clase.Id_Clase = a_Clase ORDER BY usuario.Apellido_Paterno;
END$$

DROP PROCEDURE IF EXISTS `select_asistecia_a`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_asistecia_a` (`a_Clase` INT, `a_ac` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_asistecia_Alum`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_asistecia_Alum` (`a_asis` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_asistenciacomp_a`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_asistenciacomp_a` (`c_alumno` INT, `c_c` INT, `c_fecha` DATE)  BEGIN
SELECT * FROM asistencia
where Id_Alumno = c_alumno AND Id_Alumno_Clase = c_c AND Fecha = c_fecha;
END$$

DROP PROCEDURE IF EXISTS `select_biblioteca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_biblioteca` ()  BEGIN
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

DROP PROCEDURE IF EXISTS `select_bibliotecaID`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_bibliotecaID` (`b_biblio` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_califFcomp_a`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_califFcomp_a` (`c_alumno` INT, `c_ac` INT)  BEGIN
SELECT * FROM calificacion_final
where Id_Alumno = c_alumno AND Id_Alumno_Clase = c_ac;
END$$

DROP PROCEDURE IF EXISTS `select_califF_a`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_califF_a` (`c_a` INT)  BEGIN
SELECT * FROM ((calificacion_final
INNER JOIN alumno
ON alumno.Id_Alumno = calificacion_final.Id_Alumno)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = calificacion_final.Id_Alumno_Clase)
INNER JOIN clase
ON clase.Id_Clase = alumno_clase.Id_Clase
where calificacion_final.Id_Alumno = c_a;
END$$

DROP PROCEDURE IF EXISTS `select_califpcomp_a`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_califpcomp_a` (`c_alumno` INT, `c_ac` INT, `c_parcial` INT)  BEGIN
SELECT * FROM calificacion_parcial
where Id_Alumno = c_alumno AND Id_Alumno_Clase = c_ac AND Parcial = c_parcial;
END$$

DROP PROCEDURE IF EXISTS `select_califP_a`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_califP_a` (IN `c_Clase` INT, IN `c_ac` INT)  BEGIN
SELECT * FROM ((calificacion_parcial
INNER JOIN alumno
ON alumno.Id_Alumno = calificacion_parcial.Id_Alumno)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = calificacion_parcial.Id_Alumno_Clase)
where alumno_clase.Id_Clase = c_Clase and calificacion_parcial.Id_Alumno_Clase = c_ac;
END$$

DROP PROCEDURE IF EXISTS `Select_califp_alumno_`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_califp_alumno_` (`a_user` INT, `a_ca` INT)  BEGIN
  SELECT Calificacion FROM calificacion_parcial
  WHERE Id_Alumno = a_user AND Id_Alumno_Clase = a_ca;
END$$

DROP PROCEDURE IF EXISTS `select_clase`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_clase` (`d_usuario` INT, `d_periodo` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_claseAll`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_claseAll` (`d_periodo` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_claseCodigo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_claseCodigo` (`c_Codigo` VARCHAR(7))  BEGIN
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

DROP PROCEDURE IF EXISTS `select_claseTipo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_claseTipo` (`c_Clase` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `Select_clase_alumno`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_clase_alumno` (`a_alumno` INT, `a_peri` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_docente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_docente` (`d_usuario` INT)  BEGIN
SELECT * FROM personal_escolar
INNER JOIN usuario
ON usuario.Id_Usuario = personal_escolar.Id_Usuario
where usuario.Id_Usuario = d_usuario;
END$$

DROP PROCEDURE IF EXISTS `select_docente2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_docente2` (`d_usuario` INT)  BEGIN
SELECT * FROM personal_escolar
INNER JOIN usuario
ON usuario.Id_Usuario = personal_escolar.Id_Usuario
where personal_escolar.Id_personal_escolar = d_usuario;
END$$

DROP PROCEDURE IF EXISTS `select_evacomp_a`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_evacomp_a` (`c_alumno` INT, `c_c` INT, `c_parcial` INT)  BEGIN
SELECT * FROM evaluacion
where Id_Alumno = c_alumno AND Id_Alumno_Clase = c_c AND Num_evaluacion = c_parcial;
END$$

DROP PROCEDURE IF EXISTS `select_evaluacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_evaluacion` (`c_Clase` INT)  BEGIN
SELECT * FROM ((evaluacion
INNER JOIN alumno
ON alumno.Id_Alumno = evaluacion.Id_Alumno)
INNER JOIN usuario
ON usuario.Id_Usuario = alumno.Id_Usuario)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = evaluacion.Id_Alumno_Clase
where alumno_clase.Id_Clase = c_Clase ORDER BY usuario.Apellido_Paterno;
END$$

DROP PROCEDURE IF EXISTS `select_evaluacion_a`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_evaluacion_a` (`c_alumno` INT, `c_ac` INT)  BEGIN
SELECT * FROM ((evaluacion
INNER JOIN alumno
ON alumno.Id_Alumno = evaluacion.Id_Alumno)
INNER JOIN alumno_clase
ON alumno_clase.Id_Alumno_Clase = evaluacion.Id_Alumno_Clase)
where evaluacion.Id_Alumno_Clase = c_ac and evaluacion.Id_Alumno = c_alumno;
END$$

DROP PROCEDURE IF EXISTS `select_eventos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_eventos` (IN `e_user` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_eventosa`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_eventosa` (IN `e_clase` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_hijos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_hijos` (`u_user` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_mensaje1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_mensaje1` (`m_usuario` INT)  BEGIN
SELECT * FROM (mensaje
INNER JOIN usuario
ON usuario.Id_Usuario = mensaje.Id_Usuario_remitente)
INNER JOIN estatus
ON estatus.Id_Estatus = mensaje.Id_Estatus
where mensaje.Id_Usuario_destinatario = m_usuario AND 
mensaje.Id_Estatus=1 ORDER BY mensaje.Fecha_hora;
END$$

DROP PROCEDURE IF EXISTS `select_mensaje2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_mensaje2` (IN `m_usuario` INT, IN `m_desti` INT)  BEGIN
SELECT * FROM (mensaje
INNER JOIN usuario
ON usuario.Id_Usuario = mensaje.Id_Usuario_remitente)
INNER JOIN estatus
ON estatus.Id_Estatus = mensaje.Id_Estatus
where mensaje.Id_Usuario_remitente = m_usuario 
AND mensaje.Id_Usuario_destinatario = m_desti
OR mensaje.Id_Usuario_remitente = m_desti 
AND mensaje.Id_Usuario_destinatario = m_usuario 
ORDER BY Fecha_hora;
END$$

DROP PROCEDURE IF EXISTS `select_notificacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_notificacion` (`tipo` INT)  BEGIN
SELECT * FROM (notificacion
INNER JOIN estatus
ON estatus.Id_Estatus = notificacion.Id_Estatus)
INNER JOIN usuario
ON usuario.Id_Usuario = notificacion.Id_Usuario
WHERE notificacion.Tipo_Noti = tipo AND notificacion.Id_Estatus = 1
ORDER BY notificacion.Fecha_hora;
END$$

DROP PROCEDURE IF EXISTS `select_notificacionDocente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_notificacionDocente` (`tipo` INT, `user` INT)  BEGIN
SELECT * FROM (notificacion
INNER JOIN estatus
ON estatus.Id_Estatus = notificacion.Id_Estatus)
INNER JOIN usuario
ON usuario.Id_Usuario = notificacion.Id_Usuario
WHERE notificacion.Tipo_Noti = tipo AND notificacion.Id_Estatus = 1
AND notificacion.Id_Usuario = user ORDER BY notificacion.Fecha_hora;
END$$

DROP PROCEDURE IF EXISTS `select_padreacompr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_padreacompr` (`c_alumno` INT)  BEGIN
SELECT * FROM padre_alumno
where Id_Alumno = c_alumno;
END$$

DROP PROCEDURE IF EXISTS `Select_padres`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_padres` ()  BEGIN
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

DROP PROCEDURE IF EXISTS `Select_padres2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_padres2` (`a_usuario` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_peridodcomp`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_peridodcomp` (`c_fechai` DATE, `c_fechat` DATE)  BEGIN
SELECT * FROM periodo
where Fecha_Inicio = c_fechai AND Fecha_Termino = C_fechat;
END$$

DROP PROCEDURE IF EXISTS `select_periodo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_periodo` ()  BEGIN
  SELECT * FROM periodo;
   END$$

DROP PROCEDURE IF EXISTS `Select_personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_personal` ()  BEGIN
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

DROP PROCEDURE IF EXISTS `Select_personal2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_personal2` (`a_usuario` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `Select_personales`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_personales` ()  BEGIN
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

DROP PROCEDURE IF EXISTS `select_supervisor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_supervisor` ()  BEGIN
SELECT Id_Usuario FROM usuario WHERE Id_Rol = 2;
END$$

DROP PROCEDURE IF EXISTS `select_usuarios`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_usuarios` (`u_correo` VARCHAR(100))  BEGIN
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

DROP PROCEDURE IF EXISTS `select_usuarios2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_usuarios2` (`u_user` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `select_usuariosAll`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_usuariosAll` ()  BEGIN
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

DROP PROCEDURE IF EXISTS `Select_usuario_alumno`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_usuario_alumno` (`a_user` INT)  BEGIN
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

DROP PROCEDURE IF EXISTS `Select_usuario_alumno_noti`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_usuario_alumno_noti` (`a_user` INT)  BEGIN
  SELECT * FROM (((alumno
  INNER JOIN usuario
  ON usuario.Id_Usuario = alumno.Id_Usuario)
  INNER JOIN nivel
  ON nivel.Id_Nivel = alumno.Id_Nivel)
  INNER JOIN grado
  ON grado.Id_Grado = alumno.Id_Grado)
  INNER JOIN grupo
  ON grupo.Id_Grupo = alumno.Id_Grupo
  WHERE alumno.Id_Alumno = a_user;
END$$

DROP PROCEDURE IF EXISTS `Select_usuario_docente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_usuario_docente` ()  BEGIN
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

DROP PROCEDURE IF EXISTS `Select_usuario_padre_noti`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_usuario_padre_noti` (`a_user` INT)  BEGIN
  SELECT * FROM padre_alumno
  INNER JOIN usuario
  ON usuario.Id_Usuario = padre_alumno.Id_Padre
  WHERE padre_alumno.Id_Alumno = a_user;
END$$

DROP PROCEDURE IF EXISTS `update_alumno`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_alumno` (`a_RFC` VARCHAR(10), `a_Nivel` INT, `a_Grado` INT, `a_Grupo` INT, `a_Usuario` INT)  BEGIN
update alumno set RFC = a_RFC, Id_Nivel = a_Nivel, Id_Grado = a_Grado, Id_Grupo = a_Grupo
 where Id_Usuario = a_Usuario;
END$$

DROP PROCEDURE IF EXISTS `update_asistencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_asistencia` (`a_asis` INT, `a_Usuario` INT)  BEGIN
update asistencia set Id_Tipo_Asistencia = a_asis
 where Id_Asistencia = a_Usuario;
END$$

DROP PROCEDURE IF EXISTS `update_calF`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_calF` (`f_Ecal` FLOAT, `f_idcal` INT)  BEGIN
update calificacion_final set Calificacion = f_Ecal
 where Id_Calificacion_Final = f_idcal;
END$$

DROP PROCEDURE IF EXISTS `update_calP`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_calP` (`u_Ecal` FLOAT, `u_idcal` INT, `u_FechaN` DATE)  BEGIN
update calificacion_parcial set Calificacion = u_Ecal, Fecha_Cap = u_FechaN
 where Id_Calificacion_Parcial = u_idcal;
END$$

DROP PROCEDURE IF EXISTS `update_clase`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_clase` (`c_Nombrec` VARCHAR(100), `c_Descrip` LONGTEXT, `c_HoraI` VARCHAR(45), `c_HoraF` VARCHAR(45), `c_Nivel` INT, `c_Grado` INT, `c_personal` INT, `c_Estatus` INT, `c_Grupo` INT, `c_clase` INT)  BEGIN
update clase set Nombre_Clase = c_Nombrec, Descripción = c_Descrip, Hora_inicio = c_HoraI,
Hora_final = c_HoraF, Id_Nivel = c_Nivel, Id_Grado = c_Grado, Id_Personal_Escolar = c_personal,
Id_Estatus = c_Estatus, Id_Grupo = c_Grupo
 where Id_Clase = c_clase;
END$$

DROP PROCEDURE IF EXISTS `update_contrasena`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_contrasena` (`a_contrasena` VARCHAR(65), `a_Usuario` INT)  BEGIN
update usuario set Contrasena = a_contrasena
 where Id_Usuario = a_Usuario;
END$$

DROP PROCEDURE IF EXISTS `update_direccion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_direccion` (`d_Estado` VARCHAR(60), `d_Municipio` VARCHAR(60), `d_Calle` VARCHAR(100), `d_Numero` VARCHAR(10), `d_CP` VARCHAR(5), `d_Colonia` VARCHAR(100), `d_Direccion` INT)  BEGIN
update direccion set Estado = d_Estado, Municipio = d_Municipio, Calle = d_Calle, 
Numero = d_Numero, CP = d_CP, Colonia = d_Colonia
 where Id_Direccion = d_Direccion;
END$$

DROP PROCEDURE IF EXISTS `update_evaluacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_evaluacion` (`u_Ecal` FLOAT, `u_idcal` INT, `u_FechaN` DATE)  BEGIN
update evaluacion set Calificacion = u_Ecal, Fecha_Cap = u_FechaN
 where Id_Evaluación = u_idcal;
END$$

DROP PROCEDURE IF EXISTS `update_mensajeE`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mensajeE` (`u_user` INT, `u_userD` INT)  BEGIN
update mensaje set Id_Estatus = 2
 where Id_Usuario_remitente = u_userD AND Id_Usuario_destinatario = u_user;
END$$

DROP PROCEDURE IF EXISTS `update_notificacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_notificacion` (`u_noti` INT)  BEGIN
update notificacion set Id_Estatus = 2
 where Id_Notificacion = u_noti;
END$$

DROP PROCEDURE IF EXISTS `update_personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_personal` (`a_RFC` VARCHAR(10), `a_Puesto` VARCHAR(60), `a_Usuario` INT)  BEGIN
update personal_escolar set RFC = a_RFC, Puesto = a_Puesto
 where Id_Usuario = a_Usuario;
END$$

DROP PROCEDURE IF EXISTS `update_usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_usuario` (`u_Nombre` VARCHAR(60), `u_Paterno` VARCHAR(60), `u_Materno` VARCHAR(60), `u_Correo` VARCHAR(100), `u_Tele` VARCHAR(45), `u_Genero` INT, `u_Usuario` INT)  BEGIN
update usuario set Nombre = u_Nombre, Apellido_Paterno = u_Paterno, Apellido_Materno = u_Materno,
Correo = u_Correo, Telefono = u_Tele, Id_Genero = u_Genero
 where Id_Usuario = u_Usuario;
END$$

DROP PROCEDURE IF EXISTS `update_usuario_estatus`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_usuario_estatus` (`u_estatus` INT, `u_Usuario` INT)  BEGIN
update usuario set Id_Estatus = u_estatus
 where Id_Usuario = u_Usuario;
END$$

DROP PROCEDURE IF EXISTS `update_usuario_foto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_usuario_foto` (`u_foto` VARCHAR(255), `u_Usuario` INT)  BEGIN
update usuario set Foto = u_foto
 where Id_Usuario = u_Usuario;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `actividad`;
CREATE TABLE `actividad` (
  `Id_Actividad` int(11) NOT NULL,
  `Nombre_Actividad` varchar(60) NOT NULL,
  `Contenido` longtext NOT NULL,
  `Fecha_Entrega` date DEFAULT NULL,
  `Id_Personal_Escolar` int(11) NOT NULL,
  `Id_Clase` int(11) NOT NULL,
  `Id_Recurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`Id_Actividad`, `Nombre_Actividad`, `Contenido`, `Fecha_Entrega`, `Id_Personal_Escolar`, `Id_Clase`, `Id_Recurso`) VALUES
(11, 'Prueba1', 'Esta es una prueba', '2021-10-27', 4, 6, 1),
(12, 'Actividad prueba 2', 'Esta es una actividad de prueba 2', '2021-11-03', 4, 6, 2),
(13, 'Hola', 'Hola de nuevo', '2021-10-12', 4, 6, 3),
(14, 'inglés', 'esto es inglés', '2021-11-04', 4, 6, 4),
(15, 'Prueba modal', 'Esta es una prueba de modal', '2021-10-21', 4, 6, 5),
(46, 'vi', 'g', '2021-11-05', 4, 6, 49),
(47, '67', 'y', '2021-12-02', 4, 6, 50),
(48, 'eye', 'h', '2021-11-17', 4, 6, 51),
(49, 'h', 'uj', '2021-12-10', 4, 6, 52),
(50, 'h', 'g', '2021-11-30', 4, 6, 53),
(51, 'h', 'g', '2021-11-10', 4, 6, 54),
(52, 'g', 'n', '2021-11-24', 4, 6, 55),
(53, 'mpo', 'mm', '2021-11-02', 4, 6, 56),
(54, 'wdw', 'vvf', '2021-12-07', 4, 6, 57),
(55, 'gf', 'sxs', '2021-11-09', 4, 6, 58),
(56, 'gyg', 'iio', '2021-11-17', 4, 6, 59),
(57, 'nvnvjk', 'cndsnv', '2021-12-02', 4, 6, 60),
(58, 'gg', 'okop', '2021-11-16', 4, 6, 61),
(59, 'fhefu', 'jxisjx', '2021-11-15', 4, 6, 62),
(60, 'cdscvds', 'cdsv', '2021-12-09', 4, 6, 63),
(61, 'w', 'xcds', '2021-11-24', 4, 6, 64),
(62, 'ffre', 'ccasx', '2021-11-03', 4, 6, 65),
(63, 'gggb', 'vfvd', '2021-11-25', 4, 6, 66),
(64, 'vf', 'frrve', '2021-11-29', 4, 6, 67),
(65, 'x', 's', '2021-11-10', 4, 6, 68),
(66, 'cdacdc', 'xsaca', '2021-11-01', 4, 6, 69);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE `alumno` (
  `Id_Alumno` int(11) NOT NULL,
  `RFC` varchar(10) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Id_Nivel` int(11) NOT NULL,
  `Id_Grado` int(11) NOT NULL,
  `Id_Grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`Id_Alumno`, `RFC`, `Id_Usuario`, `Id_Nivel`, `Id_Grado`, `Id_Grupo`) VALUES
(5, '890123', 67, 3, 1, 1),
(6, '890102', 72, 4, 6, 3),
(7, '765412', 73, 3, 3, 6),
(8, '981230', 84, 1, 3, 1),
(9, '987561', 86, 1, 4, 4),
(10, '981290', 87, 4, 2, 3),
(11, '896721', 88, 2, 2, 1),
(13, '890765', 90, 4, 4, 5),
(14, '101010', 91, 2, 6, 4),
(15, '890765', 92, 3, 2, 2),
(16, '890675', 93, 3, 3, 5),
(17, '765432', 101, 3, 2, 1),
(18, '765432', 107, 3, 2, 1),
(19, '765432', 108, 3, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_clase`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `alumno_clase`;
CREATE TABLE `alumno_clase` (
  `Id_Alumno_Clase` int(11) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno_clase`
--

INSERT INTO `alumno_clase` (`Id_Alumno_Clase`, `Id_Alumno`, `Id_Clase`) VALUES
(1, 5, 6),
(2, 7, 6),
(3, 9, 6),
(4, 7, 2),
(16, 7, 5),
(17, 15, 6),
(72, 7, 9),
(73, 17, 9),
(76, 17, 6),
(77, 14, 6),
(78, 7, 4),
(79, 19, 6),
(80, 13, 6),
(81, 8, 6),
(82, 10, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_pago`
--
-- Creación: 22-09-2021 a las 19:14:21
--

DROP TABLE IF EXISTS `alumno_pago`;
CREATE TABLE `alumno_pago` (
  `Id_Alumno_Pago` int(11) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
  `Id_Asistencia` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Personal_Escolar` int(11) NOT NULL,
  `Id_Alumno_Clase` int(11) NOT NULL,
  `Id_Tipo_Asistencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`Id_Asistencia`, `Fecha`, `Id_Alumno`, `Id_Personal_Escolar`, `Id_Alumno_Clase`, `Id_Tipo_Asistencia`) VALUES
(10, '2021-10-08', 7, 4, 2, 2),
(11, '2021-10-08', 7, 4, 2, 2),
(12, '2021-10-08', 5, 4, 1, 4),
(13, '2021-10-08', 9, 4, 3, 3),
(14, '2021-10-09', 7, 4, 2, 2),
(15, '2021-10-09', 5, 4, 1, 1),
(16, '2021-10-09', 9, 4, 3, 1),
(17, '2021-10-11', 5, 4, 1, 2),
(18, '2021-10-13', 7, 4, 2, 3),
(19, '2021-10-13', 5, 4, 1, 1),
(20, '2021-10-13', 9, 4, 3, 1),
(21, '2021-10-25', 7, 4, 2, 3),
(22, '2021-10-26', 15, 4, 17, 1),
(23, '2021-11-06', 7, 4, 2, 1),
(24, '2021-11-06', 15, 4, 17, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `biblioteca_virtual`
--
-- Creación: 29-10-2021 a las 19:05:54
--

DROP TABLE IF EXISTS `biblioteca_virtual`;
CREATE TABLE `biblioteca_virtual` (
  `Id_Biblioteca_Virtual` int(11) NOT NULL,
  `Nombre_Material` varchar(100) NOT NULL,
  `Descripcion_Material` varchar(100) NOT NULL,
  `Id_Estatus` int(11) NOT NULL,
  `Id_Recurso` int(11) NOT NULL,
  `Id_Nivel` int(11) NOT NULL,
  `Id_Grado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `biblioteca_virtual`
--

INSERT INTO `biblioteca_virtual` (`Id_Biblioteca_Virtual`, `Nombre_Material`, `Descripcion_Material`, `Id_Estatus`, `Id_Recurso`, `Id_Nivel`, `Id_Grado`) VALUES
(9, 'Prueba 1', 'Imagen', 1, 17, 2, 3),
(10, 'prueba 2', 'PDF', 1, 18, 4, 3),
(11, 'Prueba 3', 'Word', 1, 19, 2, 2),
(12, 'prueba 4', 'video', 1, 20, 1, 1),
(13, 'prueba 5', 'Página', 1, 21, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_final`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `calificacion_final`;
CREATE TABLE `calificacion_final` (
  `Id_Calificacion_Final` int(11) NOT NULL,
  `Calificacion` float NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Alumno_Clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `calificacion_final`
--

INSERT INTO `calificacion_final` (`Id_Calificacion_Final`, `Calificacion`, `Id_Alumno`, `Id_Alumno_Clase`) VALUES
(14, 5.16667, 7, 2),
(15, 8.75, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_parcial`
--
-- Creación: 30-10-2021 a las 23:04:17
--

DROP TABLE IF EXISTS `calificacion_parcial`;
CREATE TABLE `calificacion_parcial` (
  `Id_Calificacion_Parcial` int(11) NOT NULL,
  `Calificacion` float NOT NULL,
  `Fecha_Cap` date NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Alumno_Clase` int(11) NOT NULL,
  `Parcial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `calificacion_parcial`
--

INSERT INTO `calificacion_parcial` (`Id_Calificacion_Parcial`, `Calificacion`, `Fecha_Cap`, `Id_Alumno`, `Id_Alumno_Clase`, `Parcial`) VALUES
(114, 10, '2021-10-30', 7, 2, 1),
(115, 9, '2021-10-30', 7, 2, 2),
(117, 9, '2021-11-03', 5, 1, 3),
(119, 8.5, '2021-11-03', 5, 1, 5),
(120, 8, '2021-11-03', 5, 1, 2),
(127, 9.5, '2021-11-03', 5, 1, 1),
(128, 9, '2021-11-03', 7, 2, 3),
(129, 9, '2021-11-04', 9, 3, 4),
(130, 8, '2021-11-04', 15, 17, 5),
(131, 1, '2021-11-06', 7, 2, 6),
(132, 1, '2021-11-06', 7, 2, 5),
(133, 1, '2021-11-06', 7, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `clase`;
CREATE TABLE `clase` (
  `Id_Clase` int(11) NOT NULL,
  `Nombre_Clase` varchar(100) NOT NULL,
  `Descripción` longtext,
  `Codigo_Clase` varchar(7) NOT NULL,
  `Hora_inicio` varchar(45) NOT NULL,
  `Hora_final` varchar(45) NOT NULL,
  `Id_Nivel` int(11) NOT NULL,
  `Id_Grado` int(11) NOT NULL,
  `Id_Personal_Escolar` int(11) NOT NULL,
  `Id_Estatus` int(11) NOT NULL,
  `Id_Periodo` int(11) NOT NULL,
  `Id_Grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`Id_Clase`, `Nombre_Clase`, `Descripción`, `Codigo_Clase`, `Hora_inicio`, `Hora_final`, `Id_Nivel`, `Id_Grado`, `Id_Personal_Escolar`, `Id_Estatus`, `Id_Periodo`, `Id_Grupo`) VALUES
(2, 'Matemáticas 3', 'Esta es una clase matemáticas', 'LCMBZE6', '11:50', '09:56', 3, 3, 4, 1, 1, 4),
(3, 'Español Avanzado', 'Esta es una clase de Español para preparatoria', 'W2ZHPXY', '02:53', '09:54', 4, 1, 4, 1, 1, 5),
(4, 'Biología', 'Esta es una clase de Biología', '8ESNXYD', '17:51', '17:51', 3, 3, 8, 1, 1, 2),
(5, 'Inglés 2', 'Esta es una clase de inglés', 'PF7TC3F', '13:05', '14:00', 3, 2, 8, 1, 1, 4),
(6, 'Geografía', 'Esta es una clase de geografía', 'ND0NHM1', '13:10', '15:05', 2, 6, 4, 1, 1, 3),
(7, 'Química', 'Esta es una clase de química', 'KHQ3BZ2', '19:18', '17:18', 3, 3, 4, 1, 1, 5),
(8, 'Álgebra', 'Esta es una clase de álgebra', '6PFWRLR', '13:25', '17:20', 4, 1, 8, 1, 1, 5),
(9, 'Clase de prueba', 'Esta es una clase de prueba', '7IMV7YS', '18:51', '12:45', 4, 3, 4, 1, 1, 2),
(10, 'Clase prueba 2', 'Esta es una clase de prueba', '2R90MH', '20:47', '18:52', 2, 4, 4, 1, 1, 1),
(11, 'Prueba 3', 'Esta es una clase de prueba ', 'III5DVE', '18:00', '21:57', 3, 2, 4, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--
-- Creación: 20-09-2021 a las 23:06:53
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE `direccion` (
  `Id_Direccion` int(11) NOT NULL,
  `Estado` varchar(60) NOT NULL,
  `Municipio` varchar(60) NOT NULL,
  `Calle` varchar(100) NOT NULL,
  `Numero` varchar(10) NOT NULL,
  `CP` varchar(5) NOT NULL,
  `Colonia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`Id_Direccion`, `Estado`, `Municipio`, `Calle`, `Numero`, `CP`, `Colonia`) VALUES
(69, 'Guanajuato', 'Silao de la Victoria', 'Insurgentes', '30', '38987', 'Loma'),
(70, 'Durango', 'El Salto', 'Los amoles', '78', '56712', 'Linda Vista'),
(71, 'Guanajuato', 'Uriangato', '1ra. Priv. Vasco de Quirga', '8', '38983', 'La joyita'),
(72, 'Guanajuato', 'Irapuato', '5 de Mayo', '67', '38986', 'Los Pinos'),
(73, 'Guanajuato', 'Jaral del Progreso', 'Prolongación Hidalgo', '45', '38986', 'Centro'),
(74, 'Guanajuato', 'Irapuato', 'Fray Juan de Zumarraga', '78', '78232', 'Los amoles'),
(75, 'Guanajuato', 'Irapuato', 'Independencia 34', '67', '38981', 'Centro'),
(76, 'Guanajuato', 'Coroneo', 'La piedra', '89', '78091', 'Centro'),
(77, 'Guanajuato', 'Coroneo', 'La piedra', '89', '78091', 'Centro'),
(78, 'Guanajuato', 'Atarjea', 'Morelos', '56', '56789', 'Centro'),
(79, 'Guanajuato', 'Apaseo el Grande', 'Morelos', '34', '34561', 'Centro'),
(80, 'Guanajuato', 'Uriangato', '12 de Marzo', '23', '38986', 'Centro'),
(81, 'Guanajuato', 'San Miguel de Allende', 'Morelos', '23', '98762', 'Centro'),
(82, 'Guanajuato', 'Guanajuato', 'Insurgentes', '89', '38970', 'Centro'),
(83, 'Guanajuato', 'Irapuato', '5 de mayo', '2', '38976', 'Centro'),
(84, 'Guanajuato', 'Coroneo', '12 de octubre', '76', '38975', 'Centro'),
(85, 'Guanajuato', 'Salamanca', '16 de septiembre', '45', '38981', 'Centro'),
(86, 'Guanajuato', 'Guanajuato', 'Zaragoza', '67', '45120', 'Guanajuato'),
(87, 'Chihuahua', 'Batopilas', 'Nose', '45', '34567', 'Centro'),
(88, 'Guanajuato', 'Comonfort', 'Centro', '12', '76590', 'Centro'),
(89, 'Guanajuato', 'Celaya', 'Principal', '89', '98123', 'Centro'),
(90, 'Guanajuato', 'Manuel Doblado', 'La deseada', '67', '98761', 'Centro'),
(91, 'Coahuila', 'Allende', 'central', '89', '98764', 'Centro'),
(92, 'Colima', 'Comala', 'Linda vista', '89', '90341', 'centro'),
(93, 'Guanajuato', 'Irapuato', 'Los mochis', '78', '98961', 'Centro'),
(94, 'Guanajuato', 'Dolores Hidalgo Cuna de la Independencia Nacional', 'centro', '90', '90875', 'centro'),
(95, 'Guanajuato', 'Irapuato', 'Loma', '98', '98990', 'Centro'),
(96, 'Guanajuato', 'Uriangato', '5 de mayo', '67', '38983', 'Centro'),
(97, 'Guanajuato', 'Uriangato', '5 de mayo', '67', '38983', 'Centro'),
(98, 'Guanajuato', 'MoroleÃ³n', '6 de mayo', '89', '38984', 'Centro'),
(99, 'Guanajuato', 'Uriangato', '5 de mayo', '67', '38983', 'Centro'),
(100, 'Guanajuato', 'MoroleÃ³n', '6 de mayo', '89', '38984', 'Centro'),
(101, 'Guanajuato', 'Uriangato', '5 de mayo', '67', '38983', 'Centro'),
(102, 'Guanajuato', 'MoroleÃ³n', '6 de mayo', '89', '38984', 'Centro'),
(103, 'Guanajuato', 'Uriangato', '5 de mayo', '67', '38983', 'Centro'),
(104, 'Guanajuato', 'MoroleÃ³n', '6 de mayo', '89', '38984', 'Centro'),
(105, 'Guanajuato', 'Guanajuato', 'Centro', '89', '98761', 'Centro'),
(106, 'Guanajuato', 'Doctor Mora', 'Centro', '45', '98381', 'Centro'),
(107, 'Guanajuato', 'Doctor Mora', 'Centro', '45', '98381', 'Centro'),
(108, 'Guanajuato', 'Manuel Doblado', 'Centro', '10', '98970', 'Centro'),
(109, 'Guanajuato', 'Uriangato', '5 de mayo', '67', '38983', 'Centro'),
(110, 'Guanajuato', 'Uriangato', '5 de mayo', '67', '38983', 'Centro'),
(111, 'Chiapas', 'Palenque', 'centro', '7', '98761', 'centeo'),
(112, 'Chihuahua', 'Allende', 'centro', '90', '87651', 'centro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--
-- Creación: 20-09-2021 a las 23:06:55
--

DROP TABLE IF EXISTS `estatus`;
CREATE TABLE `estatus` (
  `Id_Estatus` int(11) NOT NULL,
  `Estatus` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`Id_Estatus`, `Estatus`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--
-- Creación: 01-11-2021 a las 19:20:20
--

DROP TABLE IF EXISTS `evaluacion`;
CREATE TABLE `evaluacion` (
  `Id_Evaluación` int(11) NOT NULL,
  `Calificacion` float NOT NULL,
  `Fecha_Cap` date NOT NULL,
  `Num_evaluacion` int(11) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Alumno_Clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`Id_Evaluación`, `Calificacion`, `Fecha_Cap`, `Num_evaluacion`, `Id_Alumno`, `Id_Alumno_Clase`) VALUES
(9, 10, '2021-11-06', 1, 7, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `evento`;
CREATE TABLE `evento` (
  `Id_Evento` int(11) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Fecha_inicio` date NOT NULL,
  `Hora_inicio` varchar(45) NOT NULL,
  `Hora_final` varchar(45) NOT NULL,
  `Comentario` longtext,
  `Id_Clase` int(11) NOT NULL,
  `Id_Tipo_Evento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento_reuniones`
--
-- Creación: 11-11-2021 a las 23:27:44
--

DROP TABLE IF EXISTS `evento_reuniones`;
CREATE TABLE `evento_reuniones` (
  `Id_Evento_Reuniones` int(11) NOT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `Hora_Inicio` varchar(45) DEFAULT NULL,
  `Fecha_Reunion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Id_Clase` int(11) NOT NULL,
  `Id_Tipo_Evento` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `evento_reuniones`
--

INSERT INTO `evento_reuniones` (`Id_Evento_Reuniones`, `Titulo`, `Hora_Inicio`, `Fecha_Reunion`, `Id_Clase`, `Id_Tipo_Evento`, `Id_Usuario`) VALUES
(18, '---', '17:00:00', '2021-11-11 23:00:00', 7, 1, 68),
(19, 'Obtener Califi', '09:54:00', '2021-11-11 15:54:00', 6, 3, 68),
(20, '---', '10:54:00', '2021-11-12 16:54:00', 10, 2, 68),
(21, '---', '22:30:00', '2021-11-18 04:30:00', 6, 1, 68);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--
-- Creación: 20-09-2021 a las 23:06:54
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE `genero` (
  `Id_Genero` int(11) NOT NULL,
  `Genero` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`Id_Genero`, `Genero`) VALUES
(1, 'Femenino'),
(2, 'Masculino'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--
-- Creación: 20-09-2021 a las 23:07:00
--

DROP TABLE IF EXISTS `grado`;
CREATE TABLE `grado` (
  `Id_Grado` int(11) NOT NULL,
  `Grado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`Id_Grado`, `Grado`) VALUES
(1, '1°'),
(2, '2°'),
(3, '3°'),
(4, '4°'),
(5, '5°'),
(6, '6°');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--
-- Creación: 20-09-2021 a las 23:07:00
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `Id_Grupo` int(11) NOT NULL,
  `Grupo` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`Id_Grupo`, `Grupo`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E'),
(6, 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--
-- Creación: 27-10-2021 a las 00:48:11
--

DROP TABLE IF EXISTS `mensaje`;
CREATE TABLE `mensaje` (
  `Id_Mensaje` int(11) NOT NULL,
  `Contenido` longtext NOT NULL,
  `Fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Id_Usuario_remitente` int(11) NOT NULL,
  `Id_Usuario_destinatario` int(11) NOT NULL,
  `Id_Estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`Id_Mensaje`, `Contenido`, `Fecha_hora`, `Id_Usuario_remitente`, `Id_Usuario_destinatario`, `Id_Estatus`) VALUES
(90, 'Prueba 1. envío de mensaje', '2021-11-09 00:46:41', 69, 68, 2),
(91, 'Prueba 2: verificación', '2021-11-09 00:46:41', 69, 68, 2),
(92, 'Prueba 3. Recibido con éxito', '2021-11-09 00:47:25', 68, 69, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--
-- Creación: 20-09-2021 a las 23:06:59
--

DROP TABLE IF EXISTS `nivel`;
CREATE TABLE `nivel` (
  `Id_Nivel` int(11) NOT NULL,
  `Nivel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`Id_Nivel`, `Nivel`) VALUES
(1, 'Preescolar'),
(2, 'Primaria'),
(3, 'Secundaria'),
(4, 'Preparatoria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--
-- Creación: 03-11-2021 a las 00:15:51
--

DROP TABLE IF EXISTS `notificacion`;
CREATE TABLE `notificacion` (
  `Id_Notificacion` int(11) NOT NULL,
  `Contenido` longtext NOT NULL,
  `Fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Tipo_Noti` int(11) NOT NULL,
  `Id_Estatus` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`Id_Notificacion`, `Contenido`, `Fecha_hora`, `Tipo_Noti`, `Id_Estatus`, `Id_Usuario`) VALUES
(12, 'Cambio de Contraseña del usuario con correo: cruz.ramirez.liz@gmail.com', '2021-11-03 15:48:20', 5, 1, 92),
(15, 'Se ha su clase: Prueba 3', '2021-11-03 19:20:29', 1, 2, 68),
(32, 'Se ha creado una nueva actividad en la clase: Geografía', '2021-11-04 01:08:07', 6, 1, 67),
(33, 'Se ha creado una nueva actividad en la clase: Geografía', '2021-11-04 01:08:07', 6, 1, 73),
(34, 'Se ha creado una nueva actividad en la clase: Geografía', '2021-11-04 01:08:07', 6, 1, 86),
(35, 'Se ha creado una nueva actividad en la clase: Geografía', '2021-11-04 01:08:07', 6, 1, 92),
(36, 'Se ha asignado una calificación al parcial 1 de la clase Geografía', '2021-11-04 01:51:30', 6, 1, 67),
(37, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-04 01:54:36', 6, 1, 67),
(38, 'Se ha asignado una calificación a la evaluación número 5 de la clase Geografía', '2021-11-04 01:57:43', 6, 1, 67),
(39, 'Se ha asignado una calificación a la evaluación número 4 de la clase Geografía', '2021-11-04 02:04:52', 6, 1, 73),
(40, 'Se ha asignado una calificación al parcial 3 de la clase Geografía', '2021-11-04 02:05:14', 6, 1, 73),
(41, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-04 02:05:35', 6, 1, 73),
(42, 'Se ha asignado una calificación al parcial 4 de la clase Geografía', '2021-11-04 19:31:52', 6, 1, 86),
(43, 'Se ha asignado una calificación al parcial 4 de la clase Geografía de su hijo Román Zepeda Tellez', '2021-11-04 19:31:52', 3, 1, 79),
(44, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-04 19:35:11', 6, 1, 86),
(45, 'Se ha asignado una calificación al parcial  de la clase Geografía de su hijo Román Zepeda Tellez', '2021-11-04 19:55:26', 3, 2, 79),
(46, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-04 19:36:19', 6, 1, 86),
(47, 'Se ha asignado la calificación final de la clase Geografía de su hijo Román Zepeda Tellez', '2021-11-04 19:36:19', 3, 1, 79),
(48, 'Se ha asignado una calificación a la evaluación número 6 de la clase Geografía', '2021-11-04 19:38:43', 6, 1, 86),
(49, 'Se ha asignado una calificación a la evaluación número 6 de la clase Geografía de su hijo Román Zepeda Tellez', '2021-11-04 19:38:43', 3, 1, 79),
(50, 'Se ha asignado una calificación al parcial 5 de la clase Geografía', '2021-11-04 20:16:37', 6, 1, 92),
(52, 'Se ha comenzado la captura de las calificaciones del parcial 5 de la materia de Geografía de Primaria del 6° C', '2021-11-04 20:16:37', 2, 1, 71),
(53, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-04 20:27:53', 6, 1, 67),
(54, 'Se ha asignado la calificación final de la clase Geografía de su hijo Laura Torres Ruiz', '2021-11-04 20:27:53', 3, 1, 78),
(55, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-04 20:27:53', 2, 1, 71),
(56, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-04 23:36:32', 6, 1, 73),
(57, 'Se ha asignado la calificación final de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-04 23:36:32', 3, 1, 79),
(58, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-04 23:36:32', 2, 1, 71),
(59, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-04 23:40:37', 6, 1, 73),
(60, 'Se ha asignado la calificación final de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-04 23:40:37', 3, 1, 79),
(61, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-04 23:40:37', 2, 1, 71),
(62, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-04 23:43:19', 6, 1, 67),
(63, 'Se ha asignado la calificación final de la clase Geografía de su hijo Laura Torres Ruiz', '2021-11-04 23:43:19', 3, 1, 78),
(64, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-04 23:43:19', 2, 1, 71),
(65, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-04 23:46:31', 6, 1, 86),
(66, 'Se ha asignado la calificación final de la clase Geografía de su hijo Román Zepeda Tellez', '2021-11-04 23:46:31', 3, 1, 79),
(67, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-04 23:46:31', 2, 1, 71),
(68, 'Se ha asignado una calificación al parcial 6 de la clase Geografía', '2021-11-06 21:24:50', 6, 1, 73),
(69, 'Se ha asignado una calificación al parcial 6 de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-06 21:24:50', 3, 1, 79),
(70, 'Se ha comenzado la captura de las calificaciones del parcial 6 de la materia de Geografía de Primaria del 6° C', '2021-11-06 21:24:50', 2, 1, 71),
(71, 'Se ha asignado una calificación al parcial 5 de la clase Geografía', '2021-11-06 21:25:27', 6, 1, 73),
(72, 'Se ha asignado una calificación al parcial 5 de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-06 21:25:27', 3, 1, 79),
(73, 'Se ha comenzado la captura de las calificaciones del parcial 5 de la materia de Geografía de Primaria del 6° C', '2021-11-06 21:25:27', 2, 1, 71),
(74, 'Se ha asignado una calificación al parcial 7 de la clase Geografía', '2021-11-06 21:27:50', 6, 1, 73),
(75, 'Se ha asignado una calificación al parcial 7 de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-06 21:27:50', 3, 1, 79),
(76, 'Se ha comenzado la captura de las calificaciones del parcial 7 de la materia de Geografía de Primaria del 6° C', '2021-11-06 21:27:50', 2, 1, 71),
(77, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 21:35:04', 6, 1, 73),
(78, 'Se ha asignado la calificación final de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-06 21:35:04', 3, 1, 79),
(79, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 21:35:04', 2, 1, 71),
(80, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 21:35:21', 6, 1, 67),
(81, 'Se ha asignado la calificación final de la clase Geografía de su hijo Laura Torres Ruiz', '2021-11-06 21:35:21', 3, 1, 78),
(82, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 21:35:21', 2, 1, 71),
(83, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 21:36:54', 6, 1, 86),
(84, 'Se ha asignado la calificación final de la clase Geografía de su hijo Román Zepeda Tellez', '2021-11-06 21:36:54', 3, 1, 79),
(85, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 21:36:54', 2, 1, 71),
(86, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 21:37:00', 6, 1, 92),
(88, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 21:37:00', 2, 1, 71),
(89, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 21:37:50', 6, 1, 73),
(90, 'Se ha asignado la calificación final de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-06 21:37:50', 3, 1, 79),
(91, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 21:37:50', 2, 1, 71),
(92, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 23:20:36', 6, 1, 73),
(93, 'Se ha asignado la calificación final de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-06 23:20:36', 3, 1, 79),
(94, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 23:20:36', 2, 1, 71),
(95, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 23:20:41', 6, 1, 92),
(97, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 23:20:41', 2, 1, 71),
(98, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 23:20:47', 6, 1, 67),
(99, 'Se ha asignado la calificación final de la clase Geografía de su hijo Laura Torres Ruiz', '2021-11-06 23:20:47', 3, 1, 78),
(100, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 23:20:47', 2, 1, 71),
(101, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 23:20:51', 6, 1, 86),
(102, 'Se ha asignado la calificación final de la clase Geografía de su hijo Román Zepeda Tellez', '2021-11-06 23:20:51', 3, 1, 79),
(103, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 23:20:51', 2, 1, 71),
(104, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 23:29:41', 6, 1, 73),
(105, 'Se ha asignado la calificación final de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-06 23:29:41', 3, 1, 79),
(106, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 23:29:41', 2, 1, 71),
(107, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 23:31:15', 6, 1, 92),
(109, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 23:31:15', 2, 1, 71),
(110, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 23:37:06', 6, 1, 73),
(111, 'Se ha asignado la calificación final de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-06 23:37:06', 3, 1, 79),
(112, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 23:37:06', 2, 1, 71),
(113, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 23:40:25', 6, 1, 86),
(114, 'Se ha asignado la calificación final de la clase Geografía de su hijo Román Zepeda Tellez', '2021-11-06 23:40:25', 3, 1, 79),
(115, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 23:40:25', 2, 1, 71),
(116, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-06 23:41:02', 6, 1, 73),
(117, 'Se ha asignado la calificación final de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-06 23:41:02', 3, 1, 79),
(118, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-06 23:41:02', 2, 1, 71),
(119, 'Se ha asignado una calificación a la evaluación número 1 de la clase Geografía', '2021-11-06 23:49:20', 6, 1, 73),
(120, 'Se ha asignado una calificación a la evaluación número 1 de la clase Geografía de su hijo Rosa María Perez Torres', '2021-11-06 23:49:20', 3, 1, 79),
(121, 'Se ha asignado la calificación final de la clase Geografía', '2021-11-08 20:14:28', 6, 1, 67),
(122, 'Se ha asignado la calificación final de la clase Geografía de su hijo Laura Torres Ruiz', '2021-11-08 20:14:28', 3, 1, 78),
(123, 'Se ha comenzado la captura de las calificaciones finales de la materia de Geografía de Primaria del 6° C', '2021-11-08 20:14:28', 2, 1, 71);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `padre_alumno`
--
-- Creación: 22-09-2021 a las 19:17:47
--

DROP TABLE IF EXISTS `padre_alumno`;
CREATE TABLE `padre_alumno` (
  `Id_Padre_Alumno` int(11) NOT NULL,
  `Id_Alumno` int(11) NOT NULL,
  `Id_Padre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `padre_alumno`
--

INSERT INTO `padre_alumno` (`Id_Padre_Alumno`, `Id_Alumno`, `Id_Padre`) VALUES
(1, 6, 78),
(2, 5, 78),
(3, 7, 79),
(7, 9, 79),
(8, 10, 103),
(9, 17, 103),
(10, 11, 109);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago` (
  `Id_Pago` int(11) NOT NULL,
  `Descripcion_Pago` longtext NOT NULL,
  `Total_Pago` decimal(11,0) NOT NULL,
  `Fecha_Pago` date NOT NULL,
  `Id_Tipo_Pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--
-- Creación: 20-10-2021 a las 19:45:21
--

DROP TABLE IF EXISTS `periodo`;
CREATE TABLE `periodo` (
  `Id_Periodo` int(11) NOT NULL,
  `Nombre_Periodo` varchar(100) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Termino` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`Id_Periodo`, `Nombre_Periodo`, `Fecha_Inicio`, `Fecha_Termino`) VALUES
(1, 'Agos-Dic 2021', '2021-10-10', '2021-12-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_escolar`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `personal_escolar`;
CREATE TABLE `personal_escolar` (
  `Id_Personal_Escolar` int(11) NOT NULL,
  `RFC` varchar(10) NOT NULL,
  `Puesto` varchar(60) DEFAULT NULL,
  `Id_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personal_escolar`
--

INSERT INTO `personal_escolar` (`Id_Personal_Escolar`, `RFC`, `Puesto`, `Id_Usuario`) VALUES
(4, '789001', 'Docente de tiempo completo', 68),
(5, '145992', 'Programador Junior', 69),
(6, '456789', 'Secretario', 70),
(7, '561290', 'Director', 71),
(8, '456789', 'Docente', 83);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso`
--
-- Creación: 30-10-2021 a las 00:42:10
--

DROP TABLE IF EXISTS `recurso`;
CREATE TABLE `recurso` (
  `Id_Recurso` int(11) NOT NULL,
  `Link_Recurso` longtext NOT NULL,
  `Tipo_Material` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recurso`
--

INSERT INTO `recurso` (`Id_Recurso`, `Link_Recurso`, `Tipo_Material`) VALUES
(1, '../recursos/Formato de reporte Actividad I.pdf', 0),
(2, '../recursos/Formato de reporte Actividad I.pdf', 0),
(3, '../recursos/Formato de reporte Actividad I.pdf', 0),
(4, '../recursos/Formato de reporte Actividad I.pdf', 0),
(5, '../recursos/Formato de reporte Actividad I.pdf', 0),
(6, '../recursos/Formato de reporte Actividad I.pdf', 0),
(7, '../recursos/Formato de reporte Actividad I.pdf', 0),
(8, '../recursos/Formato de reporte Actividad I.pdf', 0),
(17, '../recursos/biblioteca/Captura de pantalla (34).png', 1),
(18, '../recursos/biblioteca/Constancia_digital_de_realizacin_de_actividad.pdf', 2),
(19, '../recursos/biblioteca/Consigna 2.docx', 3),
(20, 'https://www.youtube.com/embed/GZjt_sA2eso', 4),
(21, 'https://venewlive.com/concerts/bts-ptd-onstage/#/', 5),
(22, '../recursos/Constancia_digital_de_realizacin_de_actividad.pdf', 2),
(23, '../recursos/Consigna2+Elizabeth+Cruz+Ramírez+ensayo.pdf', 2),
(24, '../recursos/Constancia_digital_de_realizacin_de_actividad.pdf', 2),
(25, '../recursos/Sistema de inventario y toma de pedidos para el control de productos de un super.pdf', 2),
(26, '../recursos/Sistema de inventario y toma de pedidos para el control de productos de un super.pdf', 2),
(27, '../recursos/Diagrama_Gantt.pdf', 2),
(28, '../recursos/Manual de usuario.pdf', 2),
(29, '../recursos/Petición_cambios3.pdf', 2),
(30, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(31, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(32, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(33, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(34, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(35, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(36, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(37, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(38, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(39, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(40, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(41, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(42, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(43, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(44, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(45, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(46, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(47, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(48, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(49, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(50, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(51, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(52, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(53, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(54, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(55, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(56, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(57, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(58, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(59, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(60, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(61, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(62, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(63, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(64, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(65, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(66, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(67, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(68, '../recursos/Administración de costos en proyectos de TI.pdf', 2),
(69, '../recursos/Administración de costos en proyectos de TI.pdf', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `revision`;
CREATE TABLE `revision` (
  `Id_Revision` int(11) NOT NULL,
  `Retroalimentación` longtext,
  `Link_Revision` varchar(100) DEFAULT NULL,
  `Calificacion` decimal(10,0) NOT NULL,
  `Id_Evaluación` int(11) NOT NULL,
  `Id_Alumno_Clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--
-- Creación: 20-09-2021 a las 23:06:54
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `Id_Rol` int(11) NOT NULL,
  `Rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Id_Rol`, `Rol`) VALUES
(1, 'Docente'),
(2, 'Supervisor'),
(3, 'Padre/Tutor'),
(4, 'Control'),
(5, 'Administrador'),
(6, 'Alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_asistencia`
--
-- Creación: 20-09-2021 a las 23:07:24
--

DROP TABLE IF EXISTS `tipo_asistencia`;
CREATE TABLE `tipo_asistencia` (
  `Id_Tipo_Asistencia` int(11) NOT NULL,
  `Tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_asistencia`
--

INSERT INTO `tipo_asistencia` (`Id_Tipo_Asistencia`, `Tipo`) VALUES
(1, 'Asistencia'),
(2, 'No sistió'),
(3, 'Retardo'),
(4, 'Justificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_evento`
--
-- Creación: 20-09-2021 a las 23:07:35
--

DROP TABLE IF EXISTS `tipo_evento`;
CREATE TABLE `tipo_evento` (
  `Id_Tipo_Evento` int(11) NOT NULL,
  `Evento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_evento`
--

INSERT INTO `tipo_evento` (`Id_Tipo_Evento`, `Evento`) VALUES
(1, 'Reunión en Teams'),
(2, 'Reunión en Zoom'),
(3, 'Otra reunión');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--
-- Creación: 20-09-2021 a las 23:07:17
--

DROP TABLE IF EXISTS `tipo_pago`;
CREATE TABLE `tipo_pago` (
  `Id_Tipo_Pago` int(11) NOT NULL,
  `Tipo_Pago` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--
-- Creación: 20-09-2021 a las 23:06:56
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `Id_Usuario` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Apellido_Paterno` varchar(60) NOT NULL,
  `Apellido_Materno` varchar(60) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Contrasena` varchar(65) NOT NULL,
  `Id_Direccion` int(11) NOT NULL,
  `Id_Rol` int(11) NOT NULL,
  `Id_Genero` int(11) NOT NULL,
  `Id_Estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usuario`, `Nombre`, `Apellido_Paterno`, `Apellido_Materno`, `Correo`, `Telefono`, `Foto`, `Contrasena`, `Id_Direccion`, `Id_Rol`, `Id_Genero`, `Id_Estatus`) VALUES
(67, 'Laura', 'Torres', 'Ruiz', 'd.torres@novaera.edu.mx', '4451239080', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$mcakKemHWRFwXmLmwMdv9OnDFr0lB1I1qIXwW4UKpS6HTpEvSBN9e', 69, 6, 1, 1),
(68, 'Daniel', 'García ', 'Ruiz', 'd.garcia@novaera.edu.mx', '4456789021', '../foto_perfil/5df062ca6a1043d0b88d10688368cddd262.jpg', '$2y$10$q0d7UEnKQLEdLfaoGHgUYOdNCpcWczMG.wZyNyhyYsLISRY7oAkNm', 70, 1, 2, 1),
(69, 'Elizabeth', 'Cruz', 'Ramírez', 'e.cruz@novaera.edu.mx', '4454623136', '../foto_perfil/descargar (1).jpg', '$2y$10$q0d7UEnKQLEdLfaoGHgUYOdNCpcWczMG.wZyNyhyYsLISRY7oAkNm', 71, 5, 1, 1),
(70, 'Raúl', 'Sosa', 'López', 'r.sosa@novaera.edu.mx', '4452349087', '../foto_perfil/5e21d25051544a72ada9450d67f149c5715.jpg', '$2y$10$q0d7UEnKQLEdLfaoGHgUYOdNCpcWczMG.wZyNyhyYsLISRY7oAkNm', 72, 4, 2, 1),
(71, 'Ana', 'Tellez', 'Martínez', 'a.tellez@novaera.edu.mx', '4451238767', '../foto_perfil/71b95af61b7c4e51b5f8065d798d54ff476.jpg', '$2y$10$q0d7UEnKQLEdLfaoGHgUYOdNCpcWczMG.wZyNyhyYsLISRY7oAkNm', 73, 2, 1, 1),
(72, 'Oscar', 'Salazar', 'Domínguez', 'o.salazar@novaera.ed.mx', '4457890403', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$tSv4ncINAph36v58NdTtl.00/9PuR.q6LBCooWUbomOu/RNTWzdv2', 74, 6, 2, 1),
(73, 'Rosa María', 'Perez', 'Torres', 'r.torres@novaera.edu.mx', '4450987123', '../foto_perfil/70d5607f42ca4070be40bf057a881cb8619.jpg', '$2y$10$q0d7UEnKQLEdLfaoGHgUYOdNCpcWczMG.wZyNyhyYsLISRY7oAkNm', 75, 6, 1, 1),
(78, 'César Antonio', 'Martínez', 'Lopez', 'c.m@gmail.com', '4451236789', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$VJh6x/Ss1VlhQnRw/wc6uuK53GC81zKZIhecpCBnjU4v/iaQsloGe', 80, 3, 2, 1),
(79, 'Luz María', 'Torres', 'Carmona', 'l.torres@gmail.com', '4450981234', '../foto_perfil/1d7f2ffbeedf46a89900f5bbe88e316e571.jpg', '$2y$10$q0d7UEnKQLEdLfaoGHgUYOdNCpcWczMG.wZyNyhyYsLISRY7oAkNm', 81, 3, 1, 1),
(80, 'Rosé', 'Lopez', 'Ruiz', 'r.lopez@gmail.com', '4458900987', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$Rb4EHwlBGytU1jl0l8r10emAGGjY/w.PqJT8Ibj9dy/3BzT0PIMNW', 82, 3, 1, 1),
(81, 'Daniel', 'Torres', 'Ruiz', 'd@gmail.com', '4456789800', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$BLoG/06r6s41URzv2pmvd.4zp9QbzrzmTf7QQ2s9M/dHPtD8cThYu', 83, 3, 2, 1),
(82, 'Carlos', 'Sosa', 'Torres', 'carlos@gmail.com', '4453218976', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$jkix9hQCM9ra2V9WqnWgPum5fKSkciXWTxQ9e.Z0sZKBrP6TchrZO', 84, 3, 2, 1),
(83, 'Luis Javier', 'Parámo', 'Ortiz', 'j.paramo@novaera.edu.mx', '4451230987', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$e0.yeB/EGDSlGlNqn6Y.3OL7Nt6m2qJjnOOcdPLL34y6bMHhOVZqu', 85, 1, 2, 1),
(84, 'Aaaron', 'González', 'Ramírez', 'a.gonzalez@novaera.edu.mx', '4459875634', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$tEYJu7BcjnxOelPTFn1FYujLzRfJHAuPPaKXe9PB.iv2o7FlZlp0e', 86, 6, 2, 1),
(85, 'Cesar', 'Yepez', 'Guzmán', 'c.yepez@gmail.com', '4456789456', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$imS3lymPl0PPVj.3zcufa.7Loceotaq9Dk19NDgsfiB3rBRJa71Y2', 87, 3, 2, 1),
(86, 'Román', 'Zepeda', 'Tellez', 'rzepeda@novaera.edu.mx', '4457890609', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$hyNW4OLgT88XVUBlMeVfkuui70ZFbqqplMk20g.zHTUtjQz.eegwq', 88, 6, 2, 1),
(87, 'Paola', 'Guzmán', 'Rosas', 'e.cruzramirez@ugto.mx', '4451239867', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$Ixik11DHOpz9oYMDuUl54.nHAW.aJAvOiyHEhGG87xm/16/M7hHSW', 89, 6, 1, 1),
(88, 'Estela', 'Durán', 'López', 'e.cruzramirez@ugto.mx', '4455670987', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$Jpnt7uFoEhUm0eiMttS0pubGOyFHwwWmpH2Yd5zd3LEZxB/xHhc2O', 90, 6, 1, 1),
(89, 'usuario', 'prueba', 'prueba', 'prueba@gmaaail.com', '4456789009', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$O89Rzf9949zPukNs0RShiu5fLmRdmuw0SXDCC9yV/hrpuzFeYk1bG', 91, 6, 1, 1),
(90, 'Prueba', 'Prueba', 'prueba', 'prueba@gmail.com', '6780953421', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$i.HLHTuQe7v7OtciqezP6OwtlLY0N3xYj/3YM3vC4/c0ek0O4.u6m', 92, 6, 2, 1),
(91, 'Prueba prueba', 'Prueba prueba', 'Prueba prueba', 'e.cruzramirez@gmail.com', '4458972188', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$uE.pslIQNDvg72gGnHv57OidFGJCLPUKy.htczQGy3CUvTIPp8fgm', 93, 6, 1, 1),
(92, 'Omar', 'Perez', 'Parámo', 'cruz.ramirez.liz@gmail.com', '4451230987', '../foto_perfil/61dMr8RTFvL._SL1469_.jpg', '$2y$10$PuOlQ0.rJT0io.X9891VdeySFz7BD8huuM3u6aYwg0Rz7LyHZSLpu', 94, 6, 2, 1),
(93, 'usuario', 'prueba', 'prueba', 'e.cruzramirez@gmail.com', '4454623136', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$e/p/M28i1xrEtOehcJCWi.YW/c/HsrZ5BnXV.A8uTvcvB7jpzsLxm', 95, 6, 1, 1),
(94, 'Gael', 'Olmos', 'Peréz', 'g.olmos@novaera.edu.mx', '4454623136', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$Cq6tNb3BQKEJ4HAofKiiAOa3QU7sJgHE/FunD2HMAk.o/4q9ZnRa6', 96, 6, 2, 1),
(101, 'Gael', 'Olmos', 'Peréz', 'o.perez@gmail.com', '4454623136', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$bZ40n7gTr.wwLkfwtm/Ah.3b6vJ.gPgwXEs7iwUteVVHxni1PQ46K', 103, 6, 2, 1),
(102, 'yo', 'yo', 'yo', 'yo@gmail.com', '4454623136', 'C:\nmpphtdocsControl_Escolar_Novaeraimg1.jpg', '$2y$10$Y0vVVXaqZTsa9yyVoN6xq.pNH/IP3Nks3PCCZDXJUgfU.FwrX2Xnm', 104, 6, 1, 1),
(103, 'Padre Prueba', 'Prueba', 'Prueba', 'prueba@gmail.com', '4458903134', '../img/g_novaera.jpg', '$2y$10$Leeeyk4OOkYUjcoAdsRef.M/A8Jx/vVGFRbduY4tU.Eb4y0zObl1O', 105, 3, 1, 1),
(104, 'prueba', 'prueba', 'prueba', 'e.cruzramirez@gmail.com', '4451234723', '../img/g_novaera.jpg', '$2y$10$eUaq.8N1X8.ONO.Fzby/q.kClqfT0.A1cla3kv0FJHV/sw8sfvaia', 106, 3, 1, 1),
(105, 'prueba', 'prueba', 'prueba', 'e.cruzramirez@gmail.com', '4451234723', '../img/g_novaera.jpg', '$2y$10$/zT4tMe4aSquc/A89PiJZ.KlDJ0JzFiSMXVBSNwmWYOa4NmNW6JVK', 107, 3, 1, 1),
(106, 'Nombre', 'Apellidop', 'ApellidoP', 'e.cruzramirez@ugto.mx', '4457890987', '../img/g_novaera.jpg', '$2y$10$/NQPZIUEwLwBO4RcCTuSNecSB9kGHf/KEKfs6hdF9h3lDu/VcUqiG', 108, 3, 1, 1),
(107, 'Gael', 'Olmos', 'PerÃ©z', 'e.cruzramirez@ugto.mx', '4454623136', '../img/g_novaera.jpg', '$2y$10$TsyCELXCro7VSPKnRQgJduBvi5M3NMJmOCndHRIuQywbdURcXBYCC', 109, 6, 2, 1),
(108, 'Gael', 'Olmos', 'PerÃ©z', 'e.cruzramirez@ugto.mx', '4454623136', '../img/g_novaera.jpg', '$2y$10$JFEaYHV3qS/KTjOtq4kDce5SQLREpgTt7uzWycLmjio1b0cp70hFO', 110, 6, 2, 1),
(109, 'padreuno', 'padreuno', 'padreuno', 'padre@novaera.edu.mx', '4451239067', '../img/g_novaera.jpg', '$2y$10$nU.Dxxk3vxP07YdvNPGXdux3c04bMuFRQBwc70EcL7wkbIIkiYhH.', 111, 3, 2, 1),
(110, 'pruebados', 'pruebados', 'pruebados', 'prueb@ugto.mx', '4453212134', '../img/g_novaera.jpg', '$2y$10$hQRQ/DWFfvsG.FhbamLfTO69rWR8DCxd36di1xk9DQeFzYPGnhnBO', 112, 3, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`Id_Actividad`,`Id_Personal_Escolar`,`Id_Clase`,`Id_Recurso`),
  ADD KEY `fk_Actividad_Personal_Escolar1_idx` (`Id_Personal_Escolar`),
  ADD KEY `fk_Actividad_Clase1_idx` (`Id_Clase`),
  ADD KEY `fk_Actividad_Recurso1_idx` (`Id_Recurso`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`Id_Alumno`,`Id_Usuario`,`Id_Nivel`,`Id_Grado`,`Id_Grupo`),
  ADD KEY `fk_Alumno_Usuario1_idx` (`Id_Usuario`),
  ADD KEY `fk_Alumno_Nivel1_idx` (`Id_Nivel`),
  ADD KEY `fk_Alumno_Grado1_idx` (`Id_Grado`),
  ADD KEY `fk_Alumno_Grupo1_idx` (`Id_Grupo`);

--
-- Indices de la tabla `alumno_clase`
--
ALTER TABLE `alumno_clase`
  ADD PRIMARY KEY (`Id_Alumno_Clase`,`Id_Alumno`,`Id_Clase`),
  ADD KEY `fk_Alumno_Clase_Alumno1_idx` (`Id_Alumno`),
  ADD KEY `fk_Alumno_Clase_Clase1_idx` (`Id_Clase`);

--
-- Indices de la tabla `alumno_pago`
--
ALTER TABLE `alumno_pago`
  ADD PRIMARY KEY (`Id_Alumno_Pago`,`Id_Alumno`,`Id_Pago`),
  ADD KEY `fk_Alumno_Pago_Alumno1_idx` (`Id_Alumno`),
  ADD KEY `fk_Alumno_Pago_Pago1_idx` (`Id_Pago`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`Id_Asistencia`,`Id_Alumno`,`Id_Personal_Escolar`,`Id_Alumno_Clase`,`Id_Tipo_Asistencia`),
  ADD KEY `fk_Asistencia_Alumno1_idx` (`Id_Alumno`),
  ADD KEY `fk_Asistencia_Personal_Escolar1_idx` (`Id_Personal_Escolar`),
  ADD KEY `fk_Asistencia_Alumno_Clase1_idx` (`Id_Alumno_Clase`),
  ADD KEY `fk_Asistencia_Tipo_Asistenciaa1_idx` (`Id_Tipo_Asistencia`);

--
-- Indices de la tabla `biblioteca_virtual`
--
ALTER TABLE `biblioteca_virtual`
  ADD PRIMARY KEY (`Id_Biblioteca_Virtual`,`Id_Estatus`,`Id_Recurso`,`Id_Nivel`,`Id_Grado`),
  ADD KEY `fk_Biblioteca_Virtual_Estatus1_idx` (`Id_Estatus`),
  ADD KEY `fk_Biblioteca_Virtual_Recurso1_idx` (`Id_Recurso`),
  ADD KEY `fk_Biblioteca_Virtual_Nivel1_idx` (`Id_Nivel`),
  ADD KEY `fk_Biblioteca_Virtual_Grado1_idx` (`Id_Grado`);

--
-- Indices de la tabla `calificacion_final`
--
ALTER TABLE `calificacion_final`
  ADD PRIMARY KEY (`Id_Calificacion_Final`,`Id_Alumno`,`Id_Alumno_Clase`),
  ADD KEY `fk_Calificacion_Final_Alumno1_idx` (`Id_Alumno`),
  ADD KEY `fk_Calificacion_Final_Alumno_Clase1_idx` (`Id_Alumno_Clase`);

--
-- Indices de la tabla `calificacion_parcial`
--
ALTER TABLE `calificacion_parcial`
  ADD PRIMARY KEY (`Id_Calificacion_Parcial`,`Id_Alumno`,`Id_Alumno_Clase`),
  ADD KEY `fk_Calificacion_Parcial_Alumno1_idx` (`Id_Alumno`),
  ADD KEY `fk_Calificacion_Parcial_Alumno_Clase1_idx` (`Id_Alumno_Clase`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`Id_Clase`,`Id_Nivel`,`Id_Grado`,`Id_Personal_Escolar`,`Id_Estatus`,`Id_Periodo`,`Id_Grupo`),
  ADD KEY `fk_Clase_Nivel1_idx` (`Id_Nivel`),
  ADD KEY `fk_Clase_Grado1_idx` (`Id_Grado`),
  ADD KEY `fk_Clase_Personal_Escolar1_idx` (`Id_Personal_Escolar`),
  ADD KEY `fk_Clase_Estatus1_idx` (`Id_Estatus`),
  ADD KEY `fk_Clase_Periodo1_idx` (`Id_Periodo`),
  ADD KEY `fk_Clase_Grupo1_idx` (`Id_Grupo`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`Id_Direccion`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`Id_Estatus`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`Id_Evaluación`,`Id_Alumno`,`Id_Alumno_Clase`),
  ADD KEY `fk_Evaluacionl_Alumno1_idx` (`Id_Alumno`),
  ADD KEY `fk_Evaluacionl_Alumno_Clase1_idx` (`Id_Alumno_Clase`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`Id_Evento`,`Id_Clase`,`Id_Tipo_Evento`),
  ADD KEY `fk_Evento_Clase1_idx` (`Id_Clase`),
  ADD KEY `fk_Evento_Tipo_Evento1_idx` (`Id_Tipo_Evento`);

--
-- Indices de la tabla `evento_reuniones`
--
ALTER TABLE `evento_reuniones`
  ADD PRIMARY KEY (`Id_Evento_Reuniones`,`Id_Clase`,`Id_Tipo_Evento`,`Id_Usuario`),
  ADD KEY `fk_Evento_Reuniones_Clase1_idx` (`Id_Clase`),
  ADD KEY `fk_Evento_Reuniones_Tipo_Evento1_idx` (`Id_Tipo_Evento`),
  ADD KEY `fk_Evento_Reuniones_Usuario1_idx` (`Id_Usuario`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`Id_Genero`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`Id_Grado`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`Id_Grupo`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`Id_Mensaje`,`Id_Usuario_remitente`,`Id_Usuario_destinatario`,`Id_Estatus`),
  ADD KEY `fk_Mensaje_Usuario1_idx` (`Id_Usuario_remitente`),
  ADD KEY `fk_Mensaje_Usuario2_idx` (`Id_Usuario_destinatario`),
  ADD KEY `fk_Mensaje_Estatus1_idx` (`Id_Estatus`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`Id_Nivel`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`Id_Notificacion`,`Id_Estatus`,`Id_Usuario`),
  ADD KEY `fk_Notificacion_Estatus1_idx` (`Id_Estatus`),
  ADD KEY `fk_Notificacion_Usuario1_idx` (`Id_Usuario`);

--
-- Indices de la tabla `padre_alumno`
--
ALTER TABLE `padre_alumno`
  ADD PRIMARY KEY (`Id_Padre_Alumno`,`Id_Alumno`,`Id_Padre`),
  ADD KEY `fk_Padre_Alumno_Alumno1_idx` (`Id_Alumno`),
  ADD KEY `fk_Padre_Alumno_Usuario1_idx` (`Id_Padre`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`Id_Pago`,`Id_Tipo_Pago`),
  ADD KEY `fk_Pago_Tipo_Pago1_idx` (`Id_Tipo_Pago`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`Id_Periodo`);

--
-- Indices de la tabla `personal_escolar`
--
ALTER TABLE `personal_escolar`
  ADD PRIMARY KEY (`Id_Personal_Escolar`,`Id_Usuario`),
  ADD KEY `fk_Docente_Usuario1_idx` (`Id_Usuario`);

--
-- Indices de la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`Id_Recurso`);

--
-- Indices de la tabla `revision`
--
ALTER TABLE `revision`
  ADD PRIMARY KEY (`Id_Revision`,`Id_Evaluación`,`Id_Alumno_Clase`),
  ADD KEY `fk_Revision_Evaluacion1_idx` (`Id_Evaluación`),
  ADD KEY `fk_Revision_Alumno_Clase1_idx` (`Id_Alumno_Clase`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_Rol`);

--
-- Indices de la tabla `tipo_asistencia`
--
ALTER TABLE `tipo_asistencia`
  ADD PRIMARY KEY (`Id_Tipo_Asistencia`);

--
-- Indices de la tabla `tipo_evento`
--
ALTER TABLE `tipo_evento`
  ADD PRIMARY KEY (`Id_Tipo_Evento`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`Id_Tipo_Pago`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`,`Id_Direccion`,`Id_Rol`,`Id_Genero`,`Id_Estatus`),
  ADD KEY `fk_Usuario_Direccion_idx` (`Id_Direccion`),
  ADD KEY `fk_Usuario_Rol1_idx` (`Id_Rol`),
  ADD KEY `fk_Usuario_Genero1_idx` (`Id_Genero`),
  ADD KEY `fk_Usuario_Estatus1_idx` (`Id_Estatus`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `Id_Actividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `Id_Alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `alumno_clase`
--
ALTER TABLE `alumno_clase`
  MODIFY `Id_Alumno_Clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `alumno_pago`
--
ALTER TABLE `alumno_pago`
  MODIFY `Id_Alumno_Pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `Id_Asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `biblioteca_virtual`
--
ALTER TABLE `biblioteca_virtual`
  MODIFY `Id_Biblioteca_Virtual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `calificacion_final`
--
ALTER TABLE `calificacion_final`
  MODIFY `Id_Calificacion_Final` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `calificacion_parcial`
--
ALTER TABLE `calificacion_parcial`
  MODIFY `Id_Calificacion_Parcial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `Id_Clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `Id_Direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
  MODIFY `Id_Estatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `Id_Evaluación` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `Id_Evento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento_reuniones`
--
ALTER TABLE `evento_reuniones`
  MODIFY `Id_Evento_Reuniones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `Id_Genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `Id_Grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `Id_Grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `Id_Mensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `nivel`
--
ALTER TABLE `nivel`
  MODIFY `Id_Nivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `Id_Notificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `padre_alumno`
--
ALTER TABLE `padre_alumno`
  MODIFY `Id_Padre_Alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `Id_Pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `Id_Periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personal_escolar`
--
ALTER TABLE `personal_escolar`
  MODIFY `Id_Personal_Escolar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `recurso`
--
ALTER TABLE `recurso`
  MODIFY `Id_Recurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `revision`
--
ALTER TABLE `revision`
  MODIFY `Id_Revision` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_asistencia`
--
ALTER TABLE `tipo_asistencia`
  MODIFY `Id_Tipo_Asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_evento`
--
ALTER TABLE `tipo_evento`
  MODIFY `Id_Tipo_Evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `Id_Tipo_Pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `fk_Actividad_Clase1` FOREIGN KEY (`Id_Clase`) REFERENCES `clase` (`Id_Clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Actividad_Personal_Escolar1` FOREIGN KEY (`Id_Personal_Escolar`) REFERENCES `personal_escolar` (`Id_Personal_Escolar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Actividad_Recurso1` FOREIGN KEY (`Id_Recurso`) REFERENCES `recurso` (`Id_Recurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `fk_Alumno_Grado1` FOREIGN KEY (`Id_Grado`) REFERENCES `grado` (`Id_Grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Alumno_Grupo1` FOREIGN KEY (`Id_Grupo`) REFERENCES `grupo` (`Id_Grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Alumno_Nivel1` FOREIGN KEY (`Id_Nivel`) REFERENCES `nivel` (`Id_Nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Alumno_Usuario1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alumno_clase`
--
ALTER TABLE `alumno_clase`
  ADD CONSTRAINT `fk_Alumno_Clase_Alumno1` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumno` (`Id_Alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Alumno_Clase_Clase1` FOREIGN KEY (`Id_Clase`) REFERENCES `clase` (`Id_Clase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alumno_pago`
--
ALTER TABLE `alumno_pago`
  ADD CONSTRAINT `fk_Alumno_Pago_Alumno1_idx` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumno` (`Id_Alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Alumno_Pago_Pago1_idx` FOREIGN KEY (`Id_Pago`) REFERENCES `pago` (`Id_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `fk_Asistencia_Alumno1` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumno` (`Id_Alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Asistencia_Alumno_Clase1` FOREIGN KEY (`Id_Alumno_Clase`) REFERENCES `alumno_clase` (`Id_Alumno_Clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Asistencia_Personal_Escolar1` FOREIGN KEY (`Id_Personal_Escolar`) REFERENCES `personal_escolar` (`Id_Personal_Escolar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Asistencia_Tipo_Asistenciaa1` FOREIGN KEY (`Id_Tipo_Asistencia`) REFERENCES `tipo_asistencia` (`Id_Tipo_Asistencia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `biblioteca_virtual`
--
ALTER TABLE `biblioteca_virtual`
  ADD CONSTRAINT `fk_Biblioteca_Virtual_Estatus1` FOREIGN KEY (`Id_Estatus`) REFERENCES `estatus` (`Id_Estatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Biblioteca_Virtual_Grado1` FOREIGN KEY (`Id_Grado`) REFERENCES `grado` (`Id_Grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Biblioteca_Virtual_Nivel1` FOREIGN KEY (`Id_Nivel`) REFERENCES `nivel` (`Id_Nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Biblioteca_Virtual_Recurso1` FOREIGN KEY (`Id_Recurso`) REFERENCES `recurso` (`Id_Recurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `calificacion_final`
--
ALTER TABLE `calificacion_final`
  ADD CONSTRAINT `fk_Calificacion_Final_Alumno1` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumno` (`Id_Alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Calificacion_Final_Alumno_Clase1` FOREIGN KEY (`Id_Alumno_Clase`) REFERENCES `alumno_clase` (`Id_Alumno_Clase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `calificacion_parcial`
--
ALTER TABLE `calificacion_parcial`
  ADD CONSTRAINT `fk_Calificacion_Parcial_Alumno1` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumno` (`Id_Alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Calificacion_Parcial_Alumno_Clase1` FOREIGN KEY (`Id_Alumno_Clase`) REFERENCES `alumno_clase` (`Id_Alumno_Clase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `fk_Clase_Estatus1` FOREIGN KEY (`Id_Estatus`) REFERENCES `estatus` (`Id_Estatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Clase_Grado1` FOREIGN KEY (`Id_Grado`) REFERENCES `grado` (`Id_Grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Clase_Grupo1` FOREIGN KEY (`Id_Grupo`) REFERENCES `grupo` (`Id_Grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Clase_Nivel1` FOREIGN KEY (`Id_Nivel`) REFERENCES `nivel` (`Id_Nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Clase_Periodo1` FOREIGN KEY (`Id_Periodo`) REFERENCES `periodo` (`Id_Periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Clase_Personal_Escolar1` FOREIGN KEY (`Id_Personal_Escolar`) REFERENCES `personal_escolar` (`Id_Personal_Escolar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `fk_Evaluacion_Alumno1` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumno` (`Id_Alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evaluacion_Alumno_Clase1` FOREIGN KEY (`Id_Alumno_Clase`) REFERENCES `alumno_clase` (`Id_Alumno_Clase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_Evento_Clase1` FOREIGN KEY (`Id_Clase`) REFERENCES `clase` (`Id_Clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evento_Tipo_Evento1` FOREIGN KEY (`Id_Tipo_Evento`) REFERENCES `tipo_evento` (`Id_Tipo_Evento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `evento_reuniones`
--
ALTER TABLE `evento_reuniones`
  ADD CONSTRAINT `fk_Evento_Reuniones_Clase1` FOREIGN KEY (`Id_Clase`) REFERENCES `clase` (`Id_Clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evento_Reuniones_Tipo_Evento1` FOREIGN KEY (`Id_Tipo_Evento`) REFERENCES `tipo_evento` (`Id_Tipo_Evento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evento_Reuniones_Usuario1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `fk_Mensaje_Estatus1` FOREIGN KEY (`Id_Estatus`) REFERENCES `estatus` (`Id_Estatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Mensaje_Usuario1` FOREIGN KEY (`Id_Usuario_remitente`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Mensaje_Usuario2` FOREIGN KEY (`Id_Usuario_destinatario`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `fk_Notificacion_Estatus1` FOREIGN KEY (`Id_Estatus`) REFERENCES `estatus` (`Id_Estatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Notificacion_Usuario1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `padre_alumno`
--
ALTER TABLE `padre_alumno`
  ADD CONSTRAINT `fk_Padre_Alumno_Alumno1` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumno` (`Id_Alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Padre_Alumno_Usuario1` FOREIGN KEY (`Id_Padre`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_Pago_Tipo_Pago1` FOREIGN KEY (`Id_Tipo_Pago`) REFERENCES `tipo_pago` (`Id_Tipo_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personal_escolar`
--
ALTER TABLE `personal_escolar`
  ADD CONSTRAINT `fk_Docente_Usuario1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `revision`
--
ALTER TABLE `revision`
  ADD CONSTRAINT `fk_Revision_Alumno_Clase1` FOREIGN KEY (`Id_Alumno_Clase`) REFERENCES `alumno_clase` (`Id_Alumno_Clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Revision_Evaluacion1` FOREIGN KEY (`Id_Evaluación`) REFERENCES `evaluacion` (`Id_Evaluación`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Direccion` FOREIGN KEY (`Id_Direccion`) REFERENCES `direccion` (`Id_Direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Estatus1` FOREIGN KEY (`Id_Estatus`) REFERENCES `estatus` (`Id_Estatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Genero1` FOREIGN KEY (`Id_Genero`) REFERENCES `genero` (`Id_Genero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Id_Rol`) REFERENCES `rol` (`Id_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
