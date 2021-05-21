-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2021 a las 17:40:03
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_res`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_direcciones`
--

CREATE TABLE `tbl_direcciones` (
  `ID_DIRECCION` int(11) NOT NULL,
  `DIRRECCION` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_direcciones`
--

INSERT INTO `tbl_direcciones` (`ID_DIRECCION`, `DIRRECCION`) VALUES
(1, 'BARRIO ALTAMIRA'),
(2, 'COLONIA CASA BLANCA'),
(3, 'COLONIA PIEDRAS BONITAS\r\n'),
(4, 'COLONIA PIEDRAS BONITAS\r\n'),
(5, 'COLONIA PIEDRAS BONITAS\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_envios`
--

CREATE TABLE `tbl_envios` (
  `ID_ENVIO` int(11) NOT NULL,
  `DESCRIPCION _ENVIO` varchar(200) DEFAULT NULL,
  `FECHA` int(50) NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_factura`
--

CREATE TABLE `tbl_factura` (
  `ID_FACTURA` int(11) NOT NULL,
  `DESCRIPCION_FACTURA` varchar(50) NOT NULL,
  `FECHA` int(50) NOT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventario`
--

CREATE TABLE `tbl_inventario` (
  `ID_INVENTARIO` int(11) NOT NULL,
  `PRODUCTO` varchar(200) DEFAULT NULL,
  `PRECIO` double DEFAULT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pedidos`
--

CREATE TABLE `tbl_pedidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `DESCARGA_PEDIDO` varchar(200) DEFAULT NULL,
  `FECHA` int(50) DEFAULT NULL,
  `ID_DIRECCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_pedidos`
--

INSERT INTO `tbl_pedidos` (`ID_PEDIDO`, `DESCARGA_PEDIDO`, `FECHA`, `ID_DIRECCION`) VALUES
(1, 'PAPELES', 20, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  ADD PRIMARY KEY (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl_envios`
--
ALTER TABLE `tbl_envios`
  ADD PRIMARY KEY (`ID_ENVIO`),
  ADD KEY `FK_RELACIONAR_DIRECCION` (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD PRIMARY KEY (`ID_FACTURA`),
  ADD UNIQUE KEY `FK_DIRECCIONES_FACTURA` (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD PRIMARY KEY (`ID_INVENTARIO`),
  ADD UNIQUE KEY `FK_DIRECCIONES_INVENTARIO` (`ID_DIRECCION`);

--
-- Indices de la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD KEY `FK_DIRECCIONES_PEDIDOS` (`ID_DIRECCION`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_direcciones`
--
ALTER TABLE `tbl_direcciones`
  MODIFY `ID_DIRECCION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_envios`
--
ALTER TABLE `tbl_envios`
  MODIFY `ID_ENVIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  MODIFY `ID_FACTURA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  MODIFY `ID_INVENTARIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  MODIFY `ID_PEDIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_envios`
--
ALTER TABLE `tbl_envios`
  ADD CONSTRAINT `tbl_envios_ibfk_1` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD CONSTRAINT `tbl_factura_ibfk_1` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD CONSTRAINT `tbl_inventario_ibfk_1` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_pedidos`
--
ALTER TABLE `tbl_pedidos`
  ADD CONSTRAINT `tbl_pedidos_ibfk_1` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `tbl_direcciones` (`ID_DIRECCION`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
