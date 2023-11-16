-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-11-2023 a las 19:22:43
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `primecinema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientos`
--

DROP TABLE IF EXISTS `asientos`;
CREATE TABLE IF NOT EXISTS `asientos` (
  `id_asiento` int NOT NULL AUTO_INCREMENT,
  `nombre_asiento` varchar(10) NOT NULL,
  `id_sala` int NOT NULL,
  PRIMARY KEY (`id_asiento`),
  KEY `id_sala` (`id_sala`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
CREATE TABLE IF NOT EXISTS `clasificacion` (
  `id_clasificacion` int NOT NULL AUTO_INCREMENT,
  `nombre_clasificacion` varchar(25) NOT NULL,
  PRIMARY KEY (`id_clasificacion`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id_clasificacion`, `nombre_clasificacion`) VALUES
(1, 'G'),
(2, 'PG'),
(3, 'PG-13'),
(4, 'NC-16'),
(5, 'NC-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

DROP TABLE IF EXISTS `entradas`;
CREATE TABLE IF NOT EXISTS `entradas` (
  `id_entrada` int NOT NULL AUTO_INCREMENT,
  `id_funcion` int NOT NULL,
  `id_asiento` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_entrada`),
  KEY `id_funcion` (`id_funcion`),
  KEY `id_asiento` (`id_asiento`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
CREATE TABLE IF NOT EXISTS `estado_usuario` (
  `id_estadoUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre_estadoU` varchar(25) NOT NULL,
  PRIMARY KEY (`id_estadoUsuario`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_usuario`
--

INSERT INTO `estado_usuario` (`id_estadoUsuario`, `nombre_estadoU`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
CREATE TABLE IF NOT EXISTS `facturacion` (
  `id_facturacion` int NOT NULL AUTO_INCREMENT,
  `hora_emision` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) NOT NULL,
  `id_pelicula` int NOT NULL,
  `id_funcion` int NOT NULL,
  PRIMARY KEY (`id_facturacion`),
  KEY `id_pelicula` (`id_pelicula`),
  KEY `id_funcion` (`id_funcion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formato`
--

DROP TABLE IF EXISTS `formato`;
CREATE TABLE IF NOT EXISTS `formato` (
  `id_formato` int NOT NULL AUTO_INCREMENT,
  `nombre_formato` varchar(25) NOT NULL,
  PRIMARY KEY (`id_formato`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `formato`
--

INSERT INTO `formato` (`id_formato`, `nombre_formato`) VALUES
(1, '2D'),
(2, '3D'),
(3, 'VBox');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

DROP TABLE IF EXISTS `funcion`;
CREATE TABLE IF NOT EXISTS `funcion` (
  `id_funcion` int NOT NULL AUTO_INCREMENT,
  `Fecha_hora_inicio` datetime NOT NULL,
  `Fecha_hora_fin` datetime NOT NULL,
  `id_precio` int NOT NULL,
  `id_sala` int NOT NULL,
  `id_pelicula` int NOT NULL,
  PRIMARY KEY (`id_funcion`),
  KEY `id_precio` (`id_precio`),
  KEY `id_sala` (`id_sala`),
  KEY `id_pelicula` (`id_pelicula`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero_pelicula`
--

DROP TABLE IF EXISTS `genero_pelicula`;
CREATE TABLE IF NOT EXISTS `genero_pelicula` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `nombre_genero` varchar(25) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `genero_pelicula`
--

INSERT INTO `genero_pelicula` (`id_genero`, `nombre_genero`) VALUES
(1, 'Acción'),
(2, 'Comedia'),
(3, 'Drama'),
(4, 'Ciencia Ficción'),
(5, 'Aventura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
CREATE TABLE IF NOT EXISTS `peliculas` (
  `id_pelicula` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `duracion` float NOT NULL,
  `id_genero` int NOT NULL,
  `id_formato` int NOT NULL,
  `id_clasificacion` int NOT NULL,
  PRIMARY KEY (`id_pelicula`),
  KEY `id_genero` (`id_genero`),
  KEY `id_formato` (`id_formato`),
  KEY `id_clasificacion` (`id_clasificacion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio`
--

DROP TABLE IF EXISTS `precio`;
CREATE TABLE IF NOT EXISTS `precio` (
  `id_precio` int NOT NULL AUTO_INCREMENT,
  `precio` decimal(10,2) NOT NULL,
  `id_clasificacion` int NOT NULL,
  `id_formato` int NOT NULL,
  PRIMARY KEY (`id_precio`),
  KEY `id_clasificacion` (`id_clasificacion`),
  KEY `id_formato` (`id_formato`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

DROP TABLE IF EXISTS `salas`;
CREATE TABLE IF NOT EXISTS `salas` (
  `id_sala` int NOT NULL AUTO_INCREMENT,
  `nombre_sala` varchar(50) NOT NULL,
  `id_sucursal` int NOT NULL,
  PRIMARY KEY (`id_sala`),
  KEY `id_sucursal` (`id_sucursal`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`id_sala`, `nombre_sala`, `id_sucursal`) VALUES
(1, 'Sala 1', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE IF NOT EXISTS `sucursales` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` varchar(50) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id_sucursal`, `nombre_sucursal`, `direccion`, `telefono`, `id_usuario`) VALUES
(5, 'San Marcos', 'El Encuentro San Marcos', '6069 5496', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dui` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `numero_telefono` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `correo_electronico` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contraseña` varchar(200) NOT NULL,
  `id_estadoUsuario` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `dui` (`dui`),
  UNIQUE KEY `numero_telefono` (`numero_telefono`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  KEY `id_estadoUsuario` (`id_estadoUsuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `dui`, `direccion`, `numero_telefono`, `correo_electronico`, `contraseña`, `id_estadoUsuario`) VALUES
(1, 'José', 'Álvarez', '067317280', 'Ciudad Credisa', '77865385', 'josemejia61976751@gmail.com', '12345678', 1),
(3, 'Tamara', 'Hernandéz', '059896505', 'San Marcos', '6069 5496', 'tamara.hernandez00@gmail.com', '87654321', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `fk_entrada_asiento` FOREIGN KEY (`id_asiento`) REFERENCES `asientos` (`id_asiento`),
  ADD CONSTRAINT `fk_entrada_funcion` FOREIGN KEY (`id_funcion`) REFERENCES `funcion` (`id_funcion`),
  ADD CONSTRAINT `fk_entrada_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
