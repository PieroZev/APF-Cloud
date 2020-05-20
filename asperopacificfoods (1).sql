-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 20-05-2020 a las 18:05:49
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asperopacificfoods`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `NomCategoria` varchar(30) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `fotoCategoria` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`IdCategoria`, `NomCategoria`, `Descripcion`, `fotoCategoria`) VALUES
(1, 'PESCADOS', NULL, 'PESCADOS.jpg'),
(2, 'LANGOSTINOS', NULL, 'LANGOSTINOS.jpg'),
(3, 'CANGREJOS', NULL, 'CANGREJOS.jpg'),
(4, 'MARISCOS Y MOLUSCOS', NULL, 'MARISCOS.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `NomCliente` varchar(50) NOT NULL,
  `RUC` char(11) NOT NULL,
  `nomContacto` varchar(50) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `numSedes` int(11) NOT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `NomCliente`, `RUC`, `nomContacto`, `telefono`, `email`, `numSedes`) VALUES
(1, 'CENTRO NAVAL DEL PERU', '20502707770', 'CARLA REYES', NULL, NULL, 5),
(2, 'GRAN CHIFA BRASIL YE S.A.C.', '20551553567', 'CHIFA BRASIL', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

DROP TABLE IF EXISTS `distritos`;
CREATE TABLE IF NOT EXISTS `distritos` (
  `idDistrito` int(11) NOT NULL AUTO_INCREMENT,
  `nomDistrito` varchar(30) NOT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `departamento` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idDistrito`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`idDistrito`, `nomDistrito`, `ciudad`, `provincia`, `departamento`) VALUES
(1, 'BREÑA', 'LIMA', NULL, NULL),
(2, 'LA VICTORIA', 'LIMA', NULL, NULL),
(3, 'LIMA', 'LIMA', NULL, NULL),
(4, 'LINCE', 'LIMA', NULL, NULL),
(5, 'RIMAC', 'LIMA', NULL, NULL),
(6, 'BARRANCO', 'LIMA', NULL, NULL),
(7, 'JESUS MARIA', 'LIMA', NULL, NULL),
(8, 'LA MOLINA', 'LIMA', NULL, NULL),
(9, 'MAGDALENA', 'LIMA', NULL, NULL),
(10, 'MIRAFLORES', 'LIMA', NULL, NULL),
(11, 'PUEBLO LIBRE', 'LIMA', NULL, NULL),
(12, 'SAN BORJA', 'LIMA', NULL, NULL),
(13, 'SAN ISIDRO', 'LIMA', NULL, NULL),
(14, 'SAN LUIS', 'LIMA', NULL, NULL),
(15, 'SAN MIGUEL', 'LIMA', NULL, NULL),
(16, 'SURCO', 'LIMA', NULL, NULL),
(17, 'SURQUILLO', 'LIMA', NULL, NULL),
(18, 'BELLAVISTA', NULL, 'CALLAO', NULL),
(19, 'CALLAO', NULL, 'CALLAO', NULL),
(20, 'CARMEN DE LA LEGUA-REYNOSO', NULL, 'CALLAO', NULL),
(21, 'LA PERLA', NULL, 'CALLAO', NULL),
(22, 'LA PUNTA', NULL, 'CALLAO', NULL),
(23, 'MI PERU', NULL, 'CALLAO', NULL),
(24, 'VENTANILLA', NULL, 'CALLAO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `IdPedido` int(11) NOT NULL AUTO_INCREMENT,
  `IdSede` int(11) NOT NULL,
  `IdRepartidor` int(11) NOT NULL,
  `FechaPedido` date DEFAULT NULL,
  `PrecioTotal` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `IdRepartidor` (`IdRepartidor`),
  KEY `IdSede` (`IdSede`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`IdPedido`, `IdSede`, `IdRepartidor`, `FechaPedido`, `PrecioTotal`) VALUES
(1, 1, 3, '2020-05-20', '300.0000'),
(2, 2, 3, '2020-05-20', '1500.0000'),
(3, 1, 3, '2020-05-20', '800.0000'),
(4, 3, 3, '2020-05-20', '600.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `NomProducto` varchar(50) NOT NULL,
  `Precio` decimal(15,4) NOT NULL,
  `IdCategoria` int(11) NOT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `IdCategoria` (`IdCategoria`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `NomProducto`, `Precio`, `IdCategoria`, `imagen`, `tipo`) VALUES
(1, 'Filete de lenguado grande', '70.0000', 1, 'lenguado1.jpg', 'Frescos'),
(2, 'Filete de lenguado mediano', '65.0000', 1, 'lenguado2.jpg', 'Frescos'),
(3, 'Filete de congrio rojo grande', '80.0000', 1, 'congriogrande.jpg', 'Frescos'),
(4, 'Filete de congrio rojo mediano', '65.0000', 1, 'congriomediano.jpg', 'Frescos'),
(5, 'Filete de mero', '125.0000', 1, 'filetemero.jpg', 'Frescos'),
(6, 'Filete de Corvina', '100.0000', 1, 'filetecorvina.jpg', 'Frescos'),
(7, 'Filete de Robalo', '110.0000', 1, 'fileterobalo.jpg', 'Frescos'),
(8, 'Filete de Atún', '65.0000', 1, 'fileteatun.jpg', 'Frescos'),
(9, 'Perico entero', '7.0000', 1, 'pericoentero.jpg', 'congelados'),
(10, 'PERICO FILETE', '14.5000', 1, 'pericofilete.jpg', 'congelados'),
(11, 'CHARELA ENTERA', '28.0000', 1, 'charela.jpg', 'congelados'),
(12, 'BONITO ENTERO', '6.4000', 1, 'bonito.jpg', 'congelados'),
(13, 'CORVINA ENTERA', '28.5000', 1, 'corvina.jpg', 'congelados'),
(14, 'TRUCHA', '20.5000', 1, 'trucha.jpg', 'congelados'),
(15, 'TUCUNARE', '23.5000', 1, 'tucunare.jpg', 'congelados'),
(16, 'LANGOSTINO JUMBO U= 5 – 7', '135.0000', 2, 'langostinos.jpg', 'Frescos'),
(17, 'LANGOSTINO JUMBO U= 8', '130.0000', 2, 'langostinos.jpg', 'Frescos'),
(18, 'LANGOSTINO JUMBO U= 10', '125.0000', 2, 'langostinos.jpg', 'Frescos'),
(19, 'LANGOSTINO JUMBO U= 12-15', '95.0000', 2, 'langostinos.jpg', 'Frescos'),
(20, 'LANGOSTINO JUMBO U= 16-20', '80.0000', 2, 'langostinos.jpg', 'Frescos'),
(21, 'LANGOSTINO JUMBO U= 21-25', '70.0000', 2, 'langostinos.jpg', 'Frescos'),
(22, 'LANGOSTINO JUMBO U= 26-30', '60.0000', 2, 'langostinos.jpg', 'Frescos'),
(23, 'LANGOSTINO JUMBO U= 31-35', '55.0000', 2, 'langostinos.jpg', 'Frescos'),
(24, 'LANGOSTINO JUMBO U= 36-40', '45.0000', 2, 'langostinos.jpg', 'Frescos'),
(25, 'LANGOSTINO JUMBO U= 41-50', '40.0000', 2, 'langostinos.jpg', 'Frescos'),
(26, 'LANGOSTINO JUMBO U= 51-60', '35.0000', 2, 'langostinos.jpg', 'Frescos'),
(27, 'LANGOSTINO JUMBO U= 61-70', '30.0000', 2, 'langostinos.jpg', 'Frescos'),
(28, 'LANGOSTINO 16-20', '60.0000', 2, 'langostinos.jpg', 'Frescos'),
(29, 'LANGOSTINO 21-25', '55.0000', 2, 'langostinos.jpg', 'Frescos'),
(30, 'LANGOSTINO 26-30', '50.0000', 2, 'langostinos.jpg', 'Frescos'),
(31, 'LANGOSTINO 31-35', '45.0000', 2, 'langostinos.jpg', 'Frescos'),
(32, 'LANGOSTINO 36-40', '40.0000', 2, 'langostinos.jpg', 'Frescos'),
(33, 'LANGOSTINO 41-50', '36.0000', 2, 'langostinos.jpg', 'Frescos'),
(34, 'LANGOSTINO 51-60', '32.0000', 2, 'langostinos.jpg', 'Frescos'),
(35, 'LANGOSTINO 61-70', '28.0000', 2, 'langostinos.jpg', 'Frescos'),
(36, 'PULPA DE CANGREJOS', '80.0000', 3, 'pulpacangrejo.jpg', 'Frescos'),
(37, 'UÑAS DE CANGREJOS', '130.0000', 3, 'uñacangrejo.jpg', 'Frescos'),
(38, 'CONCHA DE ABANICO PELADA', '55.0000', 4, 'conchaabanico.jpg', 'Frescos'),
(39, 'CALAMAR LIMPIO', '48.0000', 4, 'calamarlimpio.jpg', 'Frescos'),
(40, 'PULPO LIMPIO', '50.0000', 4, 'pulpolimpio.jpg', 'Frescos'),
(41, 'CARACOL', '40.0000', 4, 'caracol.jpg', 'Frescos'),
(42, 'MIXTURA DE MARISCOS', '32.0000', 4, 'mixtura.jpg', 'Frescos'),
(43, 'OSTION GRANDE', '50.0000', 4, 'ostiongrande.jpg', 'Frescos'),
(44, 'OSTION MEDIANO', '40.0000', 4, 'ostionmediano.jpg', 'Frescos'),
(45, 'CONCHA DE ABANICO PELADA', '35.0000', 4, 'conchaabanico.jpg', 'Frescos'),
(46, 'CONCHA ABANICO ENTERA (MANOJO)', '55.0000', 4, 'conchaabanicoe.jpg', 'Frescos'),
(47, 'PULPO', '42.0000', 4, 'pulpo.jpg', 'Frescos'),
(48, 'CALAMAR GRANDE', '40.0000', 4, 'calamargrande.jpg', 'Frescos'),
(49, 'CALAMAR MEDIANO', '30.0000', 4, 'calamarmediano.jpg', 'Frescos'),
(50, 'CARACOL', '28.0000', 4, 'caracol.jpg', 'Frescos'),
(51, 'CHITA ENTERA', '25.5000', 1, 'chita.jpg', 'congelados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_pedido`
--

DROP TABLE IF EXISTS `producto_pedido`;
CREATE TABLE IF NOT EXISTS `producto_pedido` (
  `IdPedido` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`IdPedido`,`IdProducto`),
  KEY `IdProducto` (`IdProducto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_pedido`
--

INSERT INTO `producto_pedido` (`IdPedido`, `IdProducto`, `cantidad`, `subtotal`) VALUES
(1, 12, 5, '60.0000'),
(2, 20, 10, '150.0000'),
(3, 31, 3, '200.0000'),
(3, 10, 1, '200.0000'),
(4, 24, 10, '60.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidores`
--

DROP TABLE IF EXISTS `repartidores`;
CREATE TABLE IF NOT EXISTS `repartidores` (
  `idRepartidor` int(11) NOT NULL AUTO_INCREMENT,
  `nomRepartidor` varchar(30) NOT NULL,
  `apeRepartidor` varchar(30) NOT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `fechaContratacion` date DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `idDistrito` int(11) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idRepartidor`),
  KEY `idDistrito` (`idDistrito`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `repartidores`
--

INSERT INTO `repartidores` (`idRepartidor`, `nomRepartidor`, `apeRepartidor`, `cargo`, `fechaNacimiento`, `fechaContratacion`, `direccion`, `idDistrito`, `telefono`) VALUES
(1, 'PEDRO FERNANDO', 'ZEVALLOS COSSIO', 'GERENTE', '1967-09-01', NULL, 'Benito Juarez 850', 9, '+51999224670'),
(2, 'PIERO JESUS', 'ZEVALLOS ESCOBAR', 'JEFE DE TI', '1994-12-23', NULL, 'Jabier Camaron 123', 9, '+51970698358'),
(3, 'GINA MARIA', 'ESCOBAR CORONEL', 'ADMINISTRADORA', '1970-08-11', NULL, 'Tito Lopez 456', 9, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

DROP TABLE IF EXISTS `sedes`;
CREATE TABLE IF NOT EXISTS `sedes` (
  `idSede` int(11) NOT NULL AUTO_INCREMENT,
  `nomSede` varchar(30) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  `idDistrito` int(11) NOT NULL,
  PRIMARY KEY (`idSede`),
  KEY `idCliente` (`idCliente`),
  KEY `idDistrito` (`idDistrito`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`idSede`, `nomSede`, `descripcion`, `direccion`, `idCliente`, `idDistrito`) VALUES
(1, 'san borja', NULL, NULL, 1, 12),
(2, 'La Punta', NULL, NULL, 1, 22),
(3, 'Callao', NULL, NULL, 1, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nom_usuario` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `pin` int(11) NOT NULL,
  `perfil` varchar(30) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nom_usuario`, `correo`, `clave`, `pin`, `perfil`, `estado`) VALUES
(1, 'Jose Linares', 'jlinares@gmail.com', '123456', 123456, 'user', 1),
(2, 'Juan Zavala', 'jzavala@gmail.com', '123456', 123456, 'client', 1),
(3, 'Piero Zevallos', 'pzevallos@gmail.com', '123456', 123456, 'admin', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
