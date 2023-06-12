-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2023 a las 21:44:31
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `automotriz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `Nro` int(11) NOT NULL,
  `Accion` varchar(30) NOT NULL,
  `Fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_personal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID`, `NOMBRE`) VALUES
(1, 'Motor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `celular` int(11) NOT NULL,
  `sexo` char(1) NOT NULL,
  `carnet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `celular`, `sexo`, `carnet`) VALUES
(1, 'Diego', 'Rojas', 852369, 'M', 78912),
(2, 'Jose', 'Alarcon', 7894561, 'M', 96325),
(3, 'JUAN', 'MOLINA', 85214, 'M', 122),
(4, 'CRISTIANO', 'RONALDO', 741369, 'M', 1235),
(5, 'JHBJHBJ', 'KJNKJN', 66520, 'M', 210),
(6, 'KJNKJN', 'KJNJ', 16543210, 'M', 6541);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledecompra`
--

CREATE TABLE `detalledecompra` (
  `Id` int(11) NOT NULL,
  `Id_mantenimiento` int(11) NOT NULL,
  `Id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallemantemiento`
--

CREATE TABLE `detallemantemiento` (
  `Id` int(11) NOT NULL,
  `Id_mantenimiento` int(11) NOT NULL,
  `Id_personal` int(11) NOT NULL,
  `Id_vehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallemantemiento`
--

INSERT INTO `detallemantemiento` (`Id`, `Id_mantenimiento`, `Id_personal`, `Id_vehiculo`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `id_personal` int(11) NOT NULL,
  `id_vehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `diagnostico`
--

INSERT INTO `diagnostico` (`id`, `fecha`, `hora`, `descripcion`, `id_personal`, `id_vehiculo`) VALUES
(1, '2023-06-12', '15:31:00', 'FALLA EN LOS FRENOS', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID` int(11) NOT NULL,
  `TOTAL` int(11) NOT NULL,
  `DESCRIPCION` varchar(2000) NOT NULL,
  `FECHA` date NOT NULL,
  `NITCLIENTE` int(11) NOT NULL,
  `Id_cliente` int(11) NOT NULL,
  `Id_mantenimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `ID` int(11) NOT NULL,
  `Descripcion` varchar(60) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `PRECIO` float NOT NULL,
  `Id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mantenimiento`
--

INSERT INTO `mantenimiento` (`ID`, `Descripcion`, `marca`, `Modelo`, `PRECIO`, `Id_categoria`) VALUES
(1, 'Mantenimiento 5000 km', 'Suzuki', 'alto 0.8 4x2 mt', 250, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `Id` int(11) NOT NULL,
  `DescripcionMarca` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`Id`, `DescripcionMarca`) VALUES
(1, 'Suzuki');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(40) DEFAULT NULL,
  `Id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`Id`, `Descripcion`, `Id_marca`) VALUES
(1, 'Vitara(LY)', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Apellido` varchar(40) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`Id`, `Nombre`, `Apellido`, `Sexo`, `Email`, `Contraseña`, `Telefono`, `Id_rol`) VALUES
(1, 'DARIANA', 'SOLIZ', 'F', 'DARIANA@GMAIL.COM', 'DARI123', 963258, 1),
(2, 'Alejandro', 'Soliz', 'M', 'alejandro@gmail.com', 'Ale123', 7894561, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuesto`
--

CREATE TABLE `repuesto` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Precio` float NOT NULL,
  `Id_categoria` int(11) NOT NULL,
  `Id_marca` int(11) NOT NULL,
  `Id_modelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `repuesto`
--

INSERT INTO `repuesto` (`Id`, `Nombre`, `Precio`, `Id_categoria`, `Id_marca`, `Id_modelo`) VALUES
(1, 'aceite de motor', 300, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `ID` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `CarnetCliente` int(11) NOT NULL,
  `Id_Cliente` int(11) NOT NULL,
  `Id_Mantenimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Id`, `Descripcion`) VALUES
(1, 'Administrador'),
(2, 'Personal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(60) NOT NULL,
  `PRECIO` float NOT NULL,
  `Repuesto` varchar(50) NOT NULL,
  `Id_mantenimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`ID`, `NOMBRE`, `PRECIO`, `Repuesto`, `Id_mantenimiento`) VALUES
(1, 'FILTRO DE ACEITE', 250, '0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomantenimiento`
--

CREATE TABLE `tipomantenimiento` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipomantenimiento`
--

INSERT INTO `tipomantenimiento` (`Id`, `Nombre`) VALUES
(1, 'preventivo'),
(2, 'limpieza'),
(3, 'correctivo'),
(4, 'programado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL,
  `kilometraje` int(11) NOT NULL,
  `año` int(11) NOT NULL,
  `color` varchar(20) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_modelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id`, `kilometraje`, `año`, `color`, `placa`, `id_cliente`, `id_marca`, `id_modelo`) VALUES
(1, 0, 2023, 'Blanco', '6245DFR', 3, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`Nro`),
  ADD KEY `id_personal` (`id_personal`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalledecompra`
--
ALTER TABLE `detalledecompra`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_mantenimiento` (`Id_mantenimiento`),
  ADD KEY `Id_factura` (`Id_factura`);

--
-- Indices de la tabla `detallemantemiento`
--
ALTER TABLE `detallemantemiento`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_mantenimiento` (`Id_mantenimiento`),
  ADD KEY `Id_personal` (`Id_personal`),
  ADD KEY `Id_vehiculo` (`Id_vehiculo`);

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PERSONAL` (`id_personal`),
  ADD KEY `VEHICULO` (`id_vehiculo`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Id_cliente` (`Id_cliente`),
  ADD KEY `Id_mantenimiento` (`Id_mantenimiento`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `mantenimiento_ibfk_2` (`Id_categoria`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_marca` (`Id_marca`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_rol` (`Id_rol`);

--
-- Indices de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_categoria` (`Id_categoria`),
  ADD KEY `Id_marca` (`Id_marca`),
  ADD KEY `Id_modelo` (`Id_modelo`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Id_Cliente` (`Id_Cliente`),
  ADD KEY `Id_Mantenimiento` (`Id_Mantenimiento`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Id_mantenimiento` (`Id_mantenimiento`);

--
-- Indices de la tabla `tipomantenimiento`
--
ALTER TABLE `tipomantenimiento`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `marca` (`id_marca`),
  ADD KEY `modelo` (`id_modelo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `id_personal` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalledecompra`
--
ALTER TABLE `detalledecompra`
  ADD CONSTRAINT `detalledecompra_ibfk_1` FOREIGN KEY (`Id_mantenimiento`) REFERENCES `mantenimiento` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledecompra_ibfk_2` FOREIGN KEY (`Id_factura`) REFERENCES `factura` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallemantemiento`
--
ALTER TABLE `detallemantemiento`
  ADD CONSTRAINT `detallemantemiento_ibfk_1` FOREIGN KEY (`Id_mantenimiento`) REFERENCES `mantenimiento` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detallemantemiento_ibfk_2` FOREIGN KEY (`Id_personal`) REFERENCES `personal` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detallemantemiento_ibfk_3` FOREIGN KEY (`Id_vehiculo`) REFERENCES `vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `PERSONAL` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `VEHICULO` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`Id_mantenimiento`) REFERENCES `mantenimiento` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `mantenimiento_ibfk_2` FOREIGN KEY (`Id_categoria`) REFERENCES `tipomantenimiento` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`Id_marca`) REFERENCES `marca` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`Id_rol`) REFERENCES `rol` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD CONSTRAINT `repuesto_ibfk_1` FOREIGN KEY (`Id_categoria`) REFERENCES `categoria` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `repuesto_ibfk_2` FOREIGN KEY (`Id_marca`) REFERENCES `marca` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `repuesto_ibfk_3` FOREIGN KEY (`Id_modelo`) REFERENCES `modelo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`Id_Mantenimiento`) REFERENCES `mantenimiento` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_2` FOREIGN KEY (`Id_mantenimiento`) REFERENCES `mantenimiento` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modelo` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
