-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-04-2024 a las 07:15:57
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `becarios_udb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` int(11) NOT NULL,
  `nombres` text NOT NULL,
  `apellidos` text NOT NULL,
  `codigo` char(8) NOT NULL,
  `fecha_nac` date NOT NULL,
  `correo` text NOT NULL,
  `direccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `nombres`, `apellidos`, `codigo`, `fecha_nac`, `correo`, `direccion`) VALUES
(1, 'Alejandro Antonio', 'Alas Linares', 'AL192188', '2014-04-18', 'alejandro.alas@alumno.udb.edu.sv', 'Soyapango'),
(2, 'Rafael Armando', 'Gutierrez Borja', 'GB236881', '2015-04-14', 'rafael.borja@alumno.udb.edu.sv', 'San Salvador'),
(3, 'Gilberto Emmanuel', 'Duran Melendez', 'DM198234', '2014-04-09', 'gilberto.duran@alumno.udb.edu.sv', 'San Martin'),
(4, 'Vicente Daniel', 'De Paz Velasquez', 'DV18263', '2014-04-18', 'vicente.depaz@alumno.udb.edu.sv', 'Sonsonate'),
(5, 'Mario Antonio', 'Torres Borja', 'TB15625', '2015-04-14', 'mario.torre@alumno.udb.edu.sv', 'Santa Ana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `nota` decimal(10,0) NOT NULL,
  `porcentaje` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`id`, `nombre`, `nota`, `porcentaje`, `id_materia`, `id_alumno`) VALUES
(1, 'Parcial I', 9, 25, 1, 2),
(2, 'Foro de preguntas', 7, 10, 2, 1),
(3, 'Cuestionario', 8, 10, 5, 4),
(4, 'Guia de ejercicios', 10, 25, 2, 1),
(5, 'Cuestionario', 8, 25, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro`
--

CREATE TABLE `maestro` (
  `id` int(11) NOT NULL,
  `nombres` text NOT NULL,
  `apellidos` text NOT NULL,
  `codigo` char(8) NOT NULL,
  `correo` text NOT NULL,
  `fecha_nac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `maestro`
--

INSERT INTO `maestro` (`id`, `nombres`, `apellidos`, `codigo`, `correo`, `fecha_nac`) VALUES
(1, 'Alejandro Armando', 'Borja Torres', 'BT287192', 'alejandro.borja@maestro.udb.edu.sv', '2014-04-18'),
(2, 'Fatima Eugenia', 'Torres Perez', 'TP234987', 'fatima.torres@maestro.udb.edu.sv', '2014-04-18'),
(5, 'Gustavo Antonio', 'Borja Alas', 'BA198655', 'gustavo.borja@maestro.udb.edu.sv', '2001-06-25'),
(6, 'Mario Moreno', 'Perez Alfaro', 'PA234987', 'mario.perez@maestro.udb.edu.sv', '2002-06-25'),
(7, 'Kevin Daniel', 'Gonzales Blanco', 'GB65124', 'kevin.gonzales@maestro.udb.edu.sv', '1999-06-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `codigo` char(8) NOT NULL,
  `id_maestro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `nombre`, `codigo`, `id_maestro`) VALUES
(1, 'Quimica', 'QUI123', 2),
(2, 'Calculo de Varias Variables', 'CVV457', 6),
(3, 'Diseño y Programación de Software Multiplataforma', 'DPS162', 2),
(4, 'Análisis y Evaluación Económica', 'AEE654', 7),
(5, 'Diseño de Redes ', 'DRD476', 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `maestro`
--
ALTER TABLE `maestro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_maestro` (`id_maestro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `maestro`
--
ALTER TABLE `maestro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  ADD CONSTRAINT `evaluacion_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`id_maestro`) REFERENCES `maestro` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
