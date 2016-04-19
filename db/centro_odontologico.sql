-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-04-2016 a las 04:22:58
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `centro_odontologico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE IF NOT EXISTS `agenda` (
  `codigo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `codigoCita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE IF NOT EXISTS `cita` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `idMedico` bigint(20) NOT NULL,
  `idConsultorio` int(11) NOT NULL,
  `idPaciente` bigint(20) NOT NULL,
  `numeroTratamientoPaciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio`
--

CREATE TABLE IF NOT EXISTS `consultorio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE IF NOT EXISTS `cotizacion` (
  `numero` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `unidad` varchar(20) NOT NULL,
  `descripcion` text NOT NULL,
  `valor` bigint(20) NOT NULL,
  `valorTotal` bigint(20) NOT NULL,
  `numeroTratamientoPaciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE IF NOT EXISTS `especialidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_paciente`
--

CREATE TABLE IF NOT EXISTS `historial_paciente` (
  `codigo` int(11) NOT NULL,
  `idPaciente` bigint(20) NOT NULL,
  `idMedico` bigint(20) NOT NULL,
  `idEspecialidad` int(11) NOT NULL,
  `idTratamiento` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE IF NOT EXISTS `medico` (
  `id` bigint(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `idEspecialidad` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(30) NOT NULL,
  `apellidoMaterno` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `direccion`, `telefono`) VALUES
(45454545, 'Pepe', 'Perez', 'Perez', 'El centro', '23423445'),
(234345345, 'Sergyv', 'Stakosky', 'Marov', 'St Petersburgo', '44455667567'),
(1053788900, 'Heri Fernando', 'Londoño', 'Arias', 'La enea', '12211221'),
(1053844273, 'Daniel Mauricio', 'Sanchez', 'Avila', 'Solferino', '3203768421'),
(2313234234, 'Camila', 'Giraldo', 'Avila', 'Bengala', '3456787766'),
(2324234234, 'Pepe', 'Perez', 'Arbelaez', 'El centro', '3243535'),
(95063017168, 'Mauricio', 'Avila', 'Avila', 'El centro', '23332324342');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles_usuarios`
--

CREATE TABLE IF NOT EXISTS `perfiles_usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE IF NOT EXISTS `tratamiento` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`codigo`, `nombre`) VALUES
(1, 'Odontología General'),
(2, 'Ortodoncia'),
(3, 'Endodoncia'),
(4, 'Radiología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientopaciente`
--

CREATE TABLE IF NOT EXISTS `tratamientopaciente` (
  `numero` int(11) NOT NULL,
  `codigoTratamiento` int(11) NOT NULL,
  `idPaciente` bigint(20) NOT NULL,
  `valor` bigint(20) NOT NULL,
  `estado` enum('En Proceso','Finalizado','Comenzado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `clave` varchar(300) NOT NULL,
  `idPaciente` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `clave`, `idPaciente`) VALUES
(1, '1053844273', '827ccb0eea8a706c4c34a16891f84e7b', 1053844273),
(2, '1053788900', '827ccb0eea8a706c4c34a16891f84e7b', 1053788900),
(3, '95063017168', '827ccb0eea8a706c4c34a16891f84e7b', 95063017168),
(4, '45454545', '827ccb0eea8a706c4c34a16891f84e7b', 45454545),
(5, '234345345', '827ccb0eea8a706c4c34a16891f84e7b', 234345345);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigoCita` (`codigoCita`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idMedico` (`idMedico`),
  ADD KEY `idConsultorio` (`idConsultorio`),
  ADD KEY `idPaciente` (`idPaciente`),
  ADD KEY `idTratamiento` (`numeroTratamientoPaciente`);

--
-- Indices de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `codigoTratamiento` (`numeroTratamientoPaciente`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_paciente`
--
ALTER TABLE `historial_paciente`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idMedico` (`idMedico`),
  ADD KEY `idEspecialidad` (`idEspecialidad`),
  ADD KEY `idTratamiento` (`idTratamiento`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEspecialidad` (`idEspecialidad`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles_usuarios`
--
ALTER TABLE `perfiles_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `tratamientopaciente`
--
ALTER TABLE `tratamientopaciente`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `codigoTratamiento` (`codigoTratamiento`),
  ADD KEY `idPaciente` (`idPaciente`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPaciente` (`idPaciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `historial_paciente`
--
ALTER TABLE `historial_paciente`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `perfiles_usuarios`
--
ALTER TABLE `perfiles_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tratamientopaciente`
--
ALTER TABLE `tratamientopaciente`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`codigoCita`) REFERENCES `cita` (`codigo`);

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`id`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`idConsultorio`) REFERENCES `consultorio` (`id`),
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`id`);

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`numeroTratamientoPaciente`) REFERENCES `tratamientopaciente` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_paciente`
--
ALTER TABLE `historial_paciente`
  ADD CONSTRAINT `historial_paciente_ibfk_1` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`id`),
  ADD CONSTRAINT `historial_paciente_ibfk_2` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`id`),
  ADD CONSTRAINT `historial_paciente_ibfk_3` FOREIGN KEY (`idTratamiento`) REFERENCES `tratamiento` (`codigo`);

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`id`);

--
-- Filtros para la tabla `tratamientopaciente`
--
ALTER TABLE `tratamientopaciente`
  ADD CONSTRAINT `tratamientopaciente_ibfk_1` FOREIGN KEY (`codigoTratamiento`) REFERENCES `tratamiento` (`codigo`),
  ADD CONSTRAINT `tratamientopaciente_ibfk_2` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`id`),
  ADD CONSTRAINT `tratamientopaciente_ibfk_3` FOREIGN KEY (`numero`) REFERENCES `cita` (`numeroTratamientoPaciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
