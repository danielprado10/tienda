usuario-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2021 a las 23:13:43
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `distrinvent`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_admin`
--

CREATE TABLE `detalle_admin` (
  `ID_ADMIN` int(20) NOT NULL,
  `ID_PRODUCTO` int(15) NOT NULL,
  `CANTIDAD` int(20) NOT NULL,
  `VAL_CANTIDAD` int(20) NOT NULL,
  `VAL_TOTAL` int(20) NOT NULL,
  `ID_VENTA` int(20) NOT NULL,
  `ID_USUARIO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_mesa`
--

CREATE TABLE `detalle_mesa` (
  `ID_MESA` int(20) NOT NULL,
  `ID_PRODUCTO` int(15) NOT NULL,
  `CANTIDAD` int(20) NOT NULL,
  `VAL_CANTIDAD` int(20) NOT NULL,
  `VAL_TOTAL` int(20) NOT NULL,
  `ID_VENTA` int(20) NOT NULL,
  `ID_USUARIO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_PRODUCTO` int(15) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `CATEGORIA` varchar(20) NOT NULL,
  `CANTIDAD_COMPRADA` int(20) NOT NULL,
  `CANTIDAD_DISPONIBLE` int(15) NOT NULL,
  `FECHA_VENCIMIENTO` date NOT NULL,
  `VAL_COMPRA` int(20) NOT NULL,
  `VAL_VENTA` int(20) NOT NULL,
  `VAL_ADICIONAL` int(20) NOT NULL,
  `ID_USUARIO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_venta`
--

CREATE TABLE `registro_venta` (
  `ID_VENTA` int(20) NOT NULL,
  `CLIENTE` int(30) NOT NULL,
  `IDENT_CLIENTE` int(15) NOT NULL,
  `FECHA` date NOT NULL,
  `VAL_TOTAL` int(20) NOT NULL,
  `ID_USUARIO` int(15) NOT NULL,
  `ID_PRODUCTO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(15) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `N_IDENTIFICACION` int(15) NOT NULL,
  `E_MAIL` varchar(50) NOT NULL,
  `TEL` int(20) NOT NULL,
  `CONTRASEÑA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_admin`
--
ALTER TABLE `detalle_admin`
  ADD PRIMARY KEY (`ID_ADMIN`),
  ADD KEY `ID_VENTA` (`ID_VENTA`,`ID_USUARIO`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `detalle_mesa`
--
ALTER TABLE `detalle_mesa`
  ADD PRIMARY KEY (`ID_MESA`),
  ADD KEY `ID_VENTA` (`ID_VENTA`,`ID_USUARIO`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `registro_venta`
--
ALTER TABLE `registro_venta`
  ADD PRIMARY KEY (`ID_VENTA`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`),
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_admin`
--
ALTER TABLE `detalle_admin`
  MODIFY `ID_ADMIN` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_mesa`
--
ALTER TABLE `detalle_mesa`
  MODIFY `ID_MESA` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_PRODUCTO` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_venta`
--
ALTER TABLE `registro_venta`
  MODIFY `ID_VENTA` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(15) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_admin`
--
ALTER TABLE `detalle_admin`
  ADD CONSTRAINT `detalle_admin_ibfk_1` FOREIGN KEY (`ID_VENTA`) REFERENCES `registro_venta` (`ID_VENTA`),
  ADD CONSTRAINT `detalle_admin_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `detalle_mesa`
--
ALTER TABLE `detalle_mesa`
  ADD CONSTRAINT `detalle_mesa_ibfk_1` FOREIGN KEY (`ID_VENTA`) REFERENCES `registro_venta` (`ID_VENTA`),
  ADD CONSTRAINT `detalle_mesa_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `registro_venta`
--
ALTER TABLE `registro_venta`
  ADD CONSTRAINT `registro_venta_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`),
  ADD CONSTRAINT `registro_venta_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
