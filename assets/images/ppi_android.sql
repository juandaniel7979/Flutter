-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-02-2022 a las 01:01:09
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
-- Base de datos: `ppi_android`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id_archivos` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `id_contenido_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_profesor_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`, `id_profesor_fk`) VALUES
(1, 'PPI', 'Este apartado se encarga de explicar brevemente la categoria', 1),
(2, 'PPI', 'Este apartado se encarga de explicar brevemente la categoria', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido`
--

CREATE TABLE `contenido` (
  `id_contenido` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `subcategoria_id_subcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL,
  `uid` varchar(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(40) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `nombre_2` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) NOT NULL,
  `apellido_2` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `uid`, `correo`, `contrasena`, `nombre`, `nombre_2`, `apellido`, `apellido_2`) VALUES
(1, '123213', 'jose@gmail.com', '1234', 'pedro', 'pedro', 'Vargas', 'Ramírez'),
(2, '123213', 'jose@gmail.com', '1234', 'pedro', 'pedro', 'Vargas', 'Ramírez'),
(3, '123213', 'jose@gmail.com', '1234', 'pedro', 'pedro', 'Vargas', 'Ramírez'),
(4, '123213', 'juan@gmail.com', '1234', 'pedro', 'pedro', 'Vargas', 'Ramírez'),
(5, '123213', 'juan23@gmail.com', '1234', 'pedro', 'pedro', 'Vargas', 'Ramírez'),
(6, '6546818', 'pablo@gmail.com', '1234', 'Jorge', 'Pablo', 'Alvarez', 'Bedoya'),
(7, '51351351', 'pedro@gmail.com', '1234', 'Pedro', 'Niel', 'Castro', 'Londono');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id_imagen` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `id_contenido_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitacion`
--

CREATE TABLE `invitacion` (
  `id_invitacion` int(11) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `profesor_id_profesor` int(11) NOT NULL,
  `id_categoria_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitacion_estudiante`
--

CREATE TABLE `invitacion_estudiante` (
  `id_invitacion_fk` int(11) NOT NULL,
  `id_estudiante_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int(11) NOT NULL,
  `uid` varchar(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(40) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `nombre_2` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) NOT NULL,
  `apellido_2` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `uid`, `correo`, `contrasena`, `nombre`, `nombre_2`, `apellido`, `apellido_2`) VALUES
(1, '123213', 'jose@gmail.com', '1234', 'pedro', 'pedro', 'Vargas', 'Ramírez'),
(2, '123213', 'jose@gmail.com', '1234', 'pedro', 'pedro', 'Vargas', 'Ramírez'),
(3, '123213', 'jose@gmail.com', '1234', 'pedro', 'pedro', 'Vargas', 'Ramírez'),
(4, '1515151', 'juan@gmail.com', '1234', 'Juan', 'Felipe', 'Londono', 'Garcia'),
(5, '123451', 'juan@gmail.com', '1234', 'Juan', '', 'Garcia', ''),
(6, '123451', 'juan@gmail.com', '1234', 'Juan', '', 'Garcia', ''),
(7, '12345', 'carlos@builes.com', '1234', 'Carlos', '', 'Builes', ''),
(8, '12345', 'carlos@builes.com', '1234', 'Carlos', '', 'Builes', ''),
(9, '12345', 'carlos@builes.com', '1234', 'Carlos', '', 'Builes', ''),
(10, '1234343', 'carlos@builes.com', '1234', 'Juan', '', 'Vargas', ''),
(11, '1234343', 'carlos@builes.com', '1234', 'Juan', '', 'Vargas', ''),
(12, '1234343', 'carlos@builes.com', '1234', 'Juan', '', 'Vargas', ''),
(13, '6165165', 'david@gmail.com', '1234', 'Pedro', '', 'Cano', ''),
(14, '6165165', 'david@gmail.com', '1234', 'Pedro', '', 'Cano', ''),
(15, '6165165', 'david@gmail.com', '1234', 'Pedro', '', 'Cano', ''),
(16, '123515', 'carlos@gmail.com', '1234', 'Carlos', 'Alberto', 'Builes', 'Velez'),
(17, '1007455860', 'panda@gmail.com', '1234', 'Juan', 'Daniel ', 'Vargas ', 'Ramirez'),
(18, '1007455860', 'panda@gmail.com', '1234', 'Juan', 'Daniel ', 'Vargas ', 'Ramirez'),
(19, '1007455860', 'panda@gmail.com', '1234', 'Juan', 'Daniel ', 'Vargas ', 'Ramirez'),
(20, '1007455860', 'panda@gmail.com', '1234', 'Juan', 'Daniel ', 'Vargas ', 'Ramirez'),
(21, '53135135', 'juan2@gmail.com', '1234', 'Juan', 'Daniel', 'Vargas', 'Ramirez'),
(22, '1234135', 'aldair@gmail.com', '1234', 'Aldair', 'Andres', 'Meza', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `id_subcategoria` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `id_categoria_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`id_subcategoria`, `nombre`, `descripcion`, `id_categoria_fk`) VALUES
(1, 'Tematicas PPI', 'Este apartado se encarga de explicar brevemente la subcategoria', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `id_videos` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `id_contenido_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id_archivos`),
  ADD KEY `archivos_contenido_fk` (`id_contenido_fk`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `categoria_profesor_fk` (`id_profesor_fk`);

--
-- Indices de la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD PRIMARY KEY (`id_contenido`),
  ADD KEY `contenido_subcategoria_fk` (`subcategoria_id_subcategoria`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `imagenes_contenido_fk` (`id_contenido_fk`);

--
-- Indices de la tabla `invitacion`
--
ALTER TABLE `invitacion`
  ADD PRIMARY KEY (`id_invitacion`),
  ADD UNIQUE KEY `invitacion__idxv1` (`id_categoria_fk`);

--
-- Indices de la tabla `invitacion_estudiante`
--
ALTER TABLE `invitacion_estudiante`
  ADD PRIMARY KEY (`id_invitacion_fk`,`id_estudiante_fk`),
  ADD KEY `id_invitacion_estudiante_fk` (`id_estudiante_fk`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`id_subcategoria`),
  ADD KEY `subcategoria_categoria_fk` (`id_categoria_fk`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id_videos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id_archivos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contenido`
--
ALTER TABLE `contenido`
  MODIFY `id_contenido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  MODIFY `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_videos` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_contenido_fk` FOREIGN KEY (`id_contenido_fk`) REFERENCES `contenido` (`id_contenido`);

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_profesor_fk` FOREIGN KEY (`id_profesor_fk`) REFERENCES `profesor` (`id_profesor`);

--
-- Filtros para la tabla `contenido`
--
ALTER TABLE `contenido`
  ADD CONSTRAINT `contenido_subcategoria_fk` FOREIGN KEY (`subcategoria_id_subcategoria`) REFERENCES `subcategoria` (`id_subcategoria`);

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `imagenes_contenido_fk` FOREIGN KEY (`id_contenido_fk`) REFERENCES `contenido` (`id_contenido`);

--
-- Filtros para la tabla `invitacion_estudiante`
--
ALTER TABLE `invitacion_estudiante`
  ADD CONSTRAINT `id_invitacion_estudiante_fk` FOREIGN KEY (`id_estudiante_fk`) REFERENCES `estudiante` (`id_estudiante`),
  ADD CONSTRAINT `id_invitacion_fk_invitacion_fk` FOREIGN KEY (`id_invitacion_fk`) REFERENCES `invitacion` (`id_invitacion`);

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `subcategoria_categoria_fk` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
