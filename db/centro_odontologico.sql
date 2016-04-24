-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2016 at 09:28 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `centro_odontologico`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `codigo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `codigoCita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cita`
--

CREATE TABLE `cita` (
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
-- Table structure for table `consultorio`
--

CREATE TABLE `consultorio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cotizacion`
--

CREATE TABLE `cotizacion` (
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
-- Table structure for table `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `historial_paciente`
--

CREATE TABLE `historial_paciente` (
  `codigo` int(11) NOT NULL,
  `idPaciente` bigint(20) NOT NULL,
  `idMedico` bigint(20) NOT NULL,
  `idEspecialidad` int(11) NOT NULL,
  `idTratamiento` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medico`
--

CREATE TABLE `medico` (
  `id` bigint(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `idEspecialidad` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(30) NOT NULL,
  `apellidoMaterno` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`id`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `direccion`, `telefono`) VALUES
(33333333, 'Mariana', 'Gutierrez', 'Arbelaez', 'Solferino', '3203768421'),
(45454545, 'Pepe', 'Perez', 'Perez', 'El centro', '23423445'),
(234345345, 'Sergyv', 'Stakosky', 'Marov', 'St Petersburgo', '44455667567'),
(1053788900, 'Heri Fernando', 'Londoño', 'Arias', 'La enea', '12211221'),
(1053844273, 'Daniel Mauricio', 'Sanchez', 'Avila', 'Solferino', '3203768421'),
(2313234234, 'Camila', 'Giraldo', 'Avila', 'Bengala', '3456787766'),
(2324234234, 'Pepe', 'Perez', 'Arbelaez', 'El centro', '3243535'),
(95063017168, 'Mauricio', 'Avila', 'Avila', 'El centro', '23332324342');

-- --------------------------------------------------------

--
-- Table structure for table `perfiles_usuarios`
--

CREATE TABLE `perfiles_usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfiles_usuarios`
--

INSERT INTO `perfiles_usuarios` (`id`, `nombre`) VALUES
(1, 'Admin'),
(2, 'Personal Medico'),
(3, 'Auxiliar Clinico'),
(4, 'Paciente');

-- --------------------------------------------------------

--
-- Table structure for table `planes_consultorio`
--

CREATE TABLE `planes_consultorio` (
  `id` int(11) NOT NULL,
  `idConsultorio` int(11) DEFAULT NULL,
  `codigoTratamiento` int(11) DEFAULT NULL,
  `valor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tratamiento`
--

CREATE TABLE `tratamiento` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tratamiento`
--

INSERT INTO `tratamiento` (`codigo`, `nombre`) VALUES
(1, 'Odontología General'),
(2, 'Ortodoncia'),
(3, 'Endodoncia'),
(4, 'Radiología');

-- --------------------------------------------------------

--
-- Table structure for table `tratamientopaciente`
--

CREATE TABLE `tratamientopaciente` (
  `numero` int(11) NOT NULL,
  `codigoTratamiento` int(11) NOT NULL,
  `idConsultorio` int(11) NOT NULL,
  `idPaciente` bigint(20) NOT NULL,
  `valor` bigint(20) NOT NULL,
  `estado` enum('En Proceso','Finalizado','Comenzado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `clave` varchar(300) NOT NULL,
  `idPaciente` bigint(20) NOT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `clave`, `idPaciente`, `idPerfil`) VALUES
(1, '1053844273', 'b0baee9d279d34fa1dfd71aadb908c3f', 1053844273, 4),
(2, '1053788900', '827ccb0eea8a706c4c34a16891f84e7b', 1053788900, 4),
(3, '95063017168', '827ccb0eea8a706c4c34a16891f84e7b', 95063017168, 4),
(4, '45454545', '827ccb0eea8a706c4c34a16891f84e7b', 45454545, 4),
(5, '234345345', '827ccb0eea8a706c4c34a16891f84e7b', 234345345, 4),
(6, '33333333', '827ccb0eea8a706c4c34a16891f84e7b', 33333333, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigoCita` (`codigoCita`);

--
-- Indexes for table `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idMedico` (`idMedico`),
  ADD KEY `idConsultorio` (`idConsultorio`),
  ADD KEY `idPaciente` (`idPaciente`),
  ADD KEY `idTratamiento` (`numeroTratamientoPaciente`);

--
-- Indexes for table `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `codigoTratamiento` (`numeroTratamientoPaciente`);

--
-- Indexes for table `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `historial_paciente`
--
ALTER TABLE `historial_paciente`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idMedico` (`idMedico`),
  ADD KEY `idEspecialidad` (`idEspecialidad`),
  ADD KEY `idTratamiento` (`idTratamiento`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEspecialidad` (`idEspecialidad`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfiles_usuarios`
--
ALTER TABLE `perfiles_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planes_consultorio`
--
ALTER TABLE `planes_consultorio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idConsultorio` (`idConsultorio`),
  ADD KEY `codigoTratamiento` (`codigoTratamiento`);

--
-- Indexes for table `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `tratamientopaciente`
--
ALTER TABLE `tratamientopaciente`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `codigoTratamiento` (`codigoTratamiento`),
  ADD KEY `idPaciente` (`idPaciente`),
  ADD KEY `tratamientopaciente_ibfk_4` (`idConsultorio`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPaciente` (`idPaciente`),
  ADD KEY `usuario_ibfk_2` (`idPerfil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cita`
--
ALTER TABLE `cita`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `consultorio`
--
ALTER TABLE `consultorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `historial_paciente`
--
ALTER TABLE `historial_paciente`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `medico`
--
ALTER TABLE `medico`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `perfiles_usuarios`
--
ALTER TABLE `perfiles_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `planes_consultorio`
--
ALTER TABLE `planes_consultorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tratamientopaciente`
--
ALTER TABLE `tratamientopaciente`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`codigoCita`) REFERENCES `cita` (`codigo`);

--
-- Constraints for table `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`id`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`idConsultorio`) REFERENCES `consultorio` (`id`),
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`id`);

--
-- Constraints for table `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`numeroTratamientoPaciente`) REFERENCES `tratamientopaciente` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `historial_paciente`
--
ALTER TABLE `historial_paciente`
  ADD CONSTRAINT `historial_paciente_ibfk_1` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`id`),
  ADD CONSTRAINT `historial_paciente_ibfk_2` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`id`),
  ADD CONSTRAINT `historial_paciente_ibfk_3` FOREIGN KEY (`idTratamiento`) REFERENCES `tratamiento` (`codigo`);

--
-- Constraints for table `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`id`);

--
-- Constraints for table `planes_consultorio`
--
ALTER TABLE `planes_consultorio`
  ADD CONSTRAINT `planes_consultorio_ibfk_1` FOREIGN KEY (`idConsultorio`) REFERENCES `consultorio` (`id`),
  ADD CONSTRAINT `planes_consultorio_ibfk_2` FOREIGN KEY (`codigoTratamiento`) REFERENCES `tratamiento` (`codigo`);

--
-- Constraints for table `tratamientopaciente`
--
ALTER TABLE `tratamientopaciente`
  ADD CONSTRAINT `tratamientopaciente_ibfk_1` FOREIGN KEY (`codigoTratamiento`) REFERENCES `tratamiento` (`codigo`),
  ADD CONSTRAINT `tratamientopaciente_ibfk_2` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`id`),
  ADD CONSTRAINT `tratamientopaciente_ibfk_3` FOREIGN KEY (`numero`) REFERENCES `cita` (`numeroTratamientoPaciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tratamientopaciente_ibfk_4` FOREIGN KEY (`idConsultorio`) REFERENCES `consultorio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idPerfil`) REFERENCES `perfiles_usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
