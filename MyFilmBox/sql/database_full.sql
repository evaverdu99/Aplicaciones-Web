DROP DATABASE  IF EXISTS `usuarios`;
DROP DATABASE  IF EXISTS `peliculas`;
DROP DATABASE  IF EXISTS `productos`;

CREATE DATABASE IF NOT EXISTS `usuarios` DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `peliculas` DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
CREATE DATABASE IF NOT EXISTS `productos` DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;

CREATE USER IF NOT EXISTS 'admingrupo7'@'localhost' IDENTIFIED BY 'molamaswordpress';
GRANT ALL PRIVILEGES ON `usuarios`.* TO 'admingrupo7'@'%';
GRANT ALL PRIVILEGES ON `peliculas`.* TO 'admingrupo7'@'%';
GRANT ALL PRIVILEGES ON `productos`.* TO 'admingrupo7'@'%';



use usuarios;

--
-- Estructura de tabla para la tabla `usuarios`
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `Usuarios` (
  `id` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `password` varchar(80) NOT NULL,
  `rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `Usuarios` (`id`, `nombreUsuario`, `nombre`, `password`, `rol`) VALUES
(1, 'chbalbas@ucm.es', 'Christian Balbás', '$2y$10$TV5rVVtg8MbtSnKnEm6/wuueUv09jiddeRl0zLT6L6QBt6cPNgVaS', 'admin'),
(2, 'terfer02@ucm.es', 'teresa fernandez merino', '$2y$10$9Ybw1l5TMgy/ba5UL4/Dpukjc59/UimBP3Yv./me7dt7gDCjR7sl6', 'admin'),
(3, 'davfer13@ucm.es', 'David Fernández', '$2y$10$PO2gP8rTPf9/sGpG8Ohv4O2dHeAUTWMqqW2kKz.UbOvVd7uX4XyMu', 'admin'),
(5, 'usuario1@gmail.com', 'Usuario1', '$2y$10$LNaq3jonGnFc.j6P3p3p9.UgJtPMUw0.jXo4JyDjNoxTAWr90okom', 'user'),
(6, 'profeusuario@gmail.com', 'Profe Usuario', '$2y$10$Bhn4zNB4l5kBtXaABfY5pe1V/w.f0pZXIj1OF3TkRVBv.UY9DxEGa', 'user'),
(7, 'profeadmin@gmail.com', 'Profe Admin', '$2y$10$ts4PkT3MF/0E/WON3vwbkO.TnilH0VClR3.SSloPIV/A/9/kooW6O', 'admin'),
(8, 'profecritico@gmail.com', 'Profe Critico', '$2y$10$RvTS.X7.1Ym/6TEYerWTg.QwD74N7E62r3e1mx6dKtYW7DRAqgnje', 'critico'),
(9, 'cinefilo1@gmail.com', 'Cinéfilo1', '$2y$10$a5KeNwoc70aloaU3mpX1nuKALnTUsR28ZsQK2eE6INRLexySRIFQi', 'user'),
(10, 'everdu@ucm.es', 'Eva Verdu', '$2y$10$XYImANoYLziecBWfnExDduqvH7BipteRX3PtCOoyxAB3uB8TLq.Hq', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;



use peliculas;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `comentarios` (
  `id_post` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `Fecha` date NOT NULL DEFAULT current_timestamp(),
  `texto` text NOT NULL,
  `id_pelicula` int(11) NOT NULL,
  `valoracion` int(10) UNSIGNED NOT NULL,
  `is_critic` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_post`, `usuario`, `titulo`, `Fecha`, `texto`, `id_pelicula`, `valoracion`, `is_critic`) VALUES
(1, 'Eva Verdú', 'Me encanta', '2020-04-22', 'Esta película es muy entretenida e interesante, las canciones son preciosas.\r\nDisney siempre trae lo mejor. ', 4, 5, 0),
(2, 'Christian', 'Horrenda', '2020-05-01', 'No me gusta nada, la vi muy aburrida.', 4, 2, 0),
(3, 'Carlos Gonzalez', 'Simple', '2020-05-08', 'Una película simple, pero que merece, en sus modestos términos, recibir un \'bien hecho\' por parte del espectador. \r\n', 2, 3, 0),
(4, 'David Férnandez', 'Mágica', '2020-05-08', 'Dafoe y un grupo de perros de trineo protagonizan esta conmovedora nueva película de acción basada en una historia real .Las secuencias en las que Togo aparece como un cachorro travieso son pura magia.', 2, 5, 0),
(5, 'Jose Luis Martínez', 'Fenomenal para los niños', '2020-05-08', 'Impresionantes efectos especiales, una buena interpretación de Dafoe y una increíble cantidad de adorables perritos elevan la película por encima de otras ofertas recientes de Disney+.', 2, 5, 0),
(6, 'Elisa Garat', 'Fascinante y divertida', '2020-05-08', 'A pesar del paso de los años esta película sigue siendo icónica. Me encanta.', 1, 5, 0),
(7, 'Eva Verdu', 'Me ha sorprendido', '2020-05-08', 'Sinister me ha sorprendido gratamente, terror psicológico del bueno.', 1, 5, 0),
(8, 'Paco Perez', 'Me ha decepcionado', '2020-06-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 1, 2, 0),
(9, 'Maria Fernández', 'Normalilla, sin más', '2020-05-10', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 2, 3, 0),
(10, 'Fernando Cerezo', 'Totalmente recomendada', '2020-06-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante', 2, 4, 0),
(11, 'Cholo Simeone', 'Espectacular', '2020-05-08', 'Esto es una obra de arte, y con esto lo digo todo.', 3, 5, 1),
(12, 'Paco Perez', 'No tengo palabras...', '2020-06-10', 'Ver esta pelicula es una perdida de tiempo.', 3, 1, 0),
(13, 'Maria Fernández', 'Me ha decepcionado', '2020-05-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 4, 2, 0),
(14, 'Fernando Cerezo', 'Normalilla, sin más', '2020-06-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 4, 3, 0),
(15, 'Cholo Simeone', 'Totalmente recomendada', '2020-05-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante!', 5, 4, 1),
(16, 'Paco Perez', 'Espectacular', '2020-06-08', 'Esto es una obra de arte, y con esto lo digo todo.', 5, 5, 0),
(17, 'Maria Fernández', 'No tengo palabras...', '2020-05-10', 'Ver esta pelicula es una perdida de tiempo.', 6, 1, 0),
(18, 'Fernando Cerezo', 'Me ha decepcionado', '2020-06-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 6, 2, 0),
(19, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 7, 3, 1),
(20, 'Paco Perez', 'Totalmente recomendada', '2020-06-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante!', 7, 4, 0),
(21, 'Maria Fernández', 'Espectacular', '2020-05-08', 'Esto es una obra de arte, y con esto lo digo todo.', 8, 5, 0),
(22, 'Fernando Cerezo', 'Totalmente recomendada', '2020-06-10', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante!', 8, 4, 0),
(23, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 9, 3, 1),
(24, 'Paco Perez', 'Me ha decepcionado', '2020-06-08', 'Sinister me ha sorprendido gratamente, terror psicológico del bueno.', 9, 2, 0),
(25, 'Maria Fernández', 'No tengo palabras...', '2020-05-08', 'Ver esta pelicula es una perdida de tiempo.', 10, 1, 0),
(26, 'Fernando Cerezo', 'Me ha sorprendido', '2020-06-10', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 11, 2, 0),
(27, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 11, 3, 1),
(28, 'Paco Perez', 'Totalmente recomendada', '2020-06-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante!', 12, 4, 0),
(29, 'Maria Fernández', 'Espectacular', '2020-05-08', 'Esto es una obra de arte, y con esto lo digo todo.', 13, 5, 0),
(30, 'Fernando Cerezo', 'Totalmente recomendada', '2020-06-10', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante!', 13, 4, 0),
(33, 'Maria Fernández', 'No tengo palabras...', '2020-05-10', 'Ver esta pelicula es una perdida de tiempo.', 15, 1, 0),
(34, 'Fernando Cerezo', 'Me ha decepcionado', '2020-06-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 16, 2, 0),
(35, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 16, 3, 1),
(36, 'Paco Perez', 'Totalmente recomendada', '2020-06-10', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante!', 17, 4, 0),
(37, 'Maria Fernández', 'Espectacular', '2020-05-08', 'Esto es una obra de arte, y con esto lo digo todo.', 17, 5, 0),
(38, 'Fernando Cerezo', 'Totalmente recomendada', '2020-06-10', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante!', 18, 4, 0),
(39, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 18, 3, 1),
(42, 'Fernando Cerezo', 'Me ha decepcionado', '2020-06-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 20, 2, 0),
(43, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-10', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 20, 3, 1),
(44, 'Paco Perez', 'Totalmente recomendada', '2020-06-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante', 21, 4, 0),
(45, 'Maria Fernández', 'Espectacular', '2020-05-08', 'Esto es una obra de arte, y con esto lo digo todo.', 21, 5, 0),
(46, 'Fernando Cerezo', 'Totalmente recomendada', '2020-06-10', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante', 22, 4, 0),
(47, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 22, 3, 1),
(48, 'Paco Perez', 'Me ha decepcionado', '2020-06-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 23, 2, 0),
(49, 'Maria Fernández', 'No tengo palabras...', '2020-06-10', 'Ver esta pelicula es una perdida de tiempo.', 23, 1, 0),
(50, 'Fernando Cerezo', 'Me ha decepcionado', '2020-05-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 24, 2, 0),
(51, 'Cholo Simeone', 'Normalilla, sin más', '2020-06-10', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 24, 3, 1),
(52, 'Paco Perez', 'Totalmente recomendada', '2020-05-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante', 24, 4, 0),
(53, 'Maria Fernández', 'Espectacular', '2020-06-08', 'Esto es una obra de arte, y con esto lo digo todo.', 25, 5, 0),
(54, 'Fernando Cerezo', 'Totalmente recomendada', '2020-05-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante', 25, 4, 0),
(55, 'Cholo Simeone', 'Normalilla, sin más', '2020-06-10', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 26, 3, 1),
(56, 'Paco Perez', 'Me ha decepcionado', '2020-05-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 26, 2, 0),
(57, 'Maria Fernández', 'No tengo palabras...', '2020-05-10', 'Ver esta pelicula es una perdida de tiempo.', 26, 1, 0),
(58, 'Fernando Cerezo', 'Me ha decepcionado', '2020-06-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 27, 2, 0),
(61, 'Maria Fernández', 'Espectacular', '2020-05-10', 'Esto es una obra de arte, y con esto lo digo todo.', 29, 5, 0),
(62, 'Fernando Cerezo', 'Impresionante', '2020-06-08', 'La vería todos los días....', 29, 5, 0),
(63, 'Cholo Simeone', 'Totalmente recomendada', '2020-05-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante', 29, 4, 1),
(64, 'Paco Perez', 'Normalilla, sin más', '2020-06-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 30, 3, 0),
(65, 'Maria Fernández', 'Me ha decepcionado', '2020-05-10', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 31, 2, 0),
(66, 'Fernando Cerezo', 'No tengo palabras...', '2020-05-08', 'Ver esta pelicula es una perdida de tiempo.', 31, 1, 0),
(69, 'Maria Fernández', 'Espectacular', '2020-06-08', 'Esto es una obra de arte, y con esto lo digo todo.', 33, 5, 0),
(70, 'Fernando Cerezo', 'Totalmente recomendada', '2020-05-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante', 33, 4, 0),
(71, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-10', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 34, 3, 1),
(72, 'Paco Perez', 'Me ha decepcionado', '2020-06-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 35, 2, 0),
(73, 'Maria Fernández', 'No tengo palabras...', '2020-05-08', 'Ver esta pelicula es una perdida de tiempo.', 35, 1, 0),
(74, 'Fernando Cerezo', 'Me ha decepcionado', '2020-06-10', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 36, 2, 0),
(75, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 36, 3, 1),
(76, 'Paco Perez', 'Totalmente recomendada', '2020-06-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante', 36, 4, 0),
(77, 'Maria Fernández', 'Espectacular', '2020-05-08', 'Esto es una obra de arte, y con esto lo digo todo.', 37, 5, 0),
(78, 'Fernando Cerezo', 'Totalmente recomendada', '2020-06-10', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante', 37, 4, 0),
(79, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 38, 3, 1),
(80, 'Paco Perez', 'Me ha decepcionado', '2020-06-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 38, 2, 0),
(81, 'Maria Fernández', 'No tengo palabras...', '2020-05-10', 'Ver esta pelicula es una perdida de tiempo.', 38, 1, 0),
(82, 'Fernando Cerezo', 'Me ha decepcionado', '2020-06-08', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 39, 2, 0),
(83, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-10', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 40, 3, 1),
(84, 'Paco Perez', 'Totalmente recomendada', '2020-06-08', 'Me la habían recomendado mis amigos, y no se queda por detrás de las espectativas, Alucinante', 41, 4, 0),
(85, 'Maria Fernández', 'Espectacular', '2020-05-08', 'Esto es una obra de arte, y con esto lo digo todo.', 41, 5, 0),
(86, 'Fernando Cerezo', 'Me ha encantado', '2020-06-10', 'Tras muchas recomendaciones he de decir que no se queda por detrás de las espectativas, Alucinante', 42, 4, 0),
(87, 'Cholo Simeone', 'Normalilla, sin más', '2020-05-08', 'Me esparaba algo más de la película, he pasado un buen rato, pero no se si la volveré a ver.', 43, 3, 1),
(88, 'Paco Perez', 'Me ha decepcionado', '2020-06-10', 'La película podía haber dado más de si, aunque se salva por la calidad de las tomas y por algún que otro diálogo.', 44, 2, 0),
(89, 'Maria Fernández', 'No tengo palabras...', '2020-04-08', 'Ver esta pelicula es una perdida de tiempo.', 44, 1, 0),
(90, 'Eva Verdu', 'Genial', '2020-05-23', 'Otra maravillosa película de Marvel. La recomiendo mucho.', 43, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `anyo` int(5) NOT NULL,
  `duracion` int(10) NOT NULL,
  `director` varchar(50) NOT NULL,
  `origen` varchar(50) NOT NULL,
  `calificacion` enum('Todas las edades','+7','+12','+16','+18','XXX') NOT NULL,
  `reparto` varchar(1000) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `productora` varchar(100) NOT NULL,
  `genero` enum('Accion','Ciencia Ficcion','Drama','Terror','Thriller','Romance','Aventuras','Musical','Belica','Comedia','Oeste','Infantiles','Adultas') NOT NULL,
  `sinopsis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `nombre`, `anyo`, `duracion`, `director`, `origen`, `calificacion`, `reparto`, `imagen`, `productora`, `genero`, `sinopsis`) VALUES
(1, 'Regreso al futuro', 1985, 116, 'Robert Zemeckis', 'Estados Unidos', 'Todas las edades', 'Michael J. Fox, Christopher Lloyd, Lea Thompson, Crispin Glover, Claudia Wells, Thomas F. Wilson, James Tolkan, Billy Zane, Sachi Parker', 'img/regresoalfuturo.jpg', 'Universal Pictures / Amblin Entertainment', 'Ciencia Ficcion', 'El adolescente Marty McFly es amigo de Doc, un científico al que todos toman por loco. Cuando Doc crea una máquina para viajar en el tiempo, un error fortuito hace que Marty llegue a 1955, año en el que sus futuros padres aún no se habían conocido. Después de impedir su primer encuentro, deberá conseguir que se conozcan y se casen; de lo contrario, su existencia no sería posible.'),
(2, 'Togo', 2019, 113, 'Ericson Core', 'Estados Unidos', '+7', 'Willem Dafoe, Julianne Nicholson, Christopher Heyerdahl, Richard Dormer, Adrien Dorval, Madeline Wickins, Michael Greyeyes, Nive Nielsen, Nikolai Nikolaeff, Thorbjørn Harr, Catherine McGregor, Michael McElhatton, Brandon Oakes, Paul Piaskowski, Michael Gaston, Shaun Benson, Jamie McShane, Sean Hoy, Tom Carey, Chad Nobert, Malik McCall, Mark Krysko, Elena Porter, Dave Trimble, Barb Mitchell, Steven McCarthy, Sarah Wheeldon', 'img/togo.jpg', 'Walt Disney Pictures. Distribuida por Disney+', 'Aventuras', 'Cuenta la historia de Togo, un perro de trineos que ganó la carrera más importante de esta disciplina en 1925 pese a haber sido considerado incapaz de terminarla siquiera debido a su pequeño tamaño.'),
(3, 'Sinister', 2012, 110, 'Scott Derrickson', 'Estados Unidos', '+18', 'Ethan Hawke, James Ransone, Juliet Rylance, Vincent D\'Onofrio, Fred Dalton Thompson, Clare Foley, Michael Hall D\'Addario, Victoria Leigh', 'img/sinister.jpg', 'Automatik Entertainment / Blumhouse Productions / ', 'Terror', 'Un periodista viaja con su familia a lo largo y ancho del país para investigar terribles asesinatos que luego convierte en libros. Cuando llega a una casa donde ha tenido lugar el asesinato de una familia, encuentra una cinta que desvela horribles pistas que van más allá del esclarecimiento de la tragedia.'),
(4, 'Pocahontas', 1995, 78, 'Mike Gabriel, Eric Goldberg', 'Estados Unidos', 'Todas las edades', 'Animacion', 'img/pocahontas.jpg', 'Walt Disney Pictures', 'Infantiles', 'Pocahontas, la hija del Jefe Powhatan, vigila la llegada de un gran grupo de colonos ingleses, guiados por el ambicioso gobernador Radcliff y el valiente capitán John Smith. Con su juguetón compañero Meeko, un travieso mapache, y con Flit, un alegre pájaro, Pocahontas entabla una fuerte amistad con el Capitán Smith. Pero cuando empiezan a surgir tensiones entre las dos culturas, Pocahontas recurre a la sabiduría de la Abuela Sauce para encontrar una manera de lograr la paz entre su pueblo y los conquistadores.'),
(5, 'John Wick', 2014, 101, 'Chad Stahelski, David Leitch', 'Estados Unidos', '+12', 'Keanu Reeves, Michael Nyqvist, Alfie Allen, Willem Dafoe, Dean Winters, Adrianne Palicki, Omer Barnea, Toby Leonard Moore, Daniel Bernhardt, Bridget Moynahan, John Leguizamo, Ian McShane, Bridget Regan, Lance Reddick, Keith Jardine, Thomas Sadoski, Clarke Peters, Kevin Nash, Randall Duk Kim, David Patrick Kelly', 'img/jonhwick.jpg', '87Eleven/Company Films/DefyNite Films/Thunder Road Pictures', 'Accion', 'En Nueva York, John Wick, un asesino a sueldo retirado, vuelve otra vez a la acción para vengarse de los gángsters que le quitaron todo.'),
(6, 'Saving Private Ryan', 1998, 170, 'Steven Spielberg', 'Estados Unidos', '+7', 'Tom Hanks, Tom Sizemore, Edward Burns, Matt Damon, Barry Pepper, Giovanni Ribisi, Adam Goldberg, Jeremy Davies, Vin Diesel, Ted Danson, Paul Giamatti, Max Martini, Dennis Farina, Harrison Young, Kathleen Byron, Harve Presnell, Dale Dye, Leland Orser, Bryan Cranston, Nathan Fillion, Ryan Hurst, Corey Johnson, Andrew Scott, Joerg Stadler, Dylan Bruno', 'img/saving_private_ryan.jpg', 'DreamWorks SKG / Paramount Pictures / Amblin Entertainment', 'Belica', 'Segunda Guerra Mundial (1939-1945). Tras el desembarco de los Aliados en Normandía, a un grupo de soldados americanos se le encomienda una peligrosa misión: poner a salvo al soldado James Ryan. Los hombres de la patrulla del capitán John Miller deben arriesgar sus vidas para encontrar a este soldado, cuyos tres hermanos han muerto en la guerra. Lo único que se sabe del soldado Ryan es que se lanzó con su escuadrón de paracaidistas detrás de las líneas enemigas.'),
(7, 'La La Land', 2016, 128, 'Damien Chazelle', 'Hong Kong', 'Todas las edades', 'Ryan Gosling - Sebastian\r\nEmma Stone - Mia', 'img/lalaland.jpg', 'Summit Entertainment', 'Musical', 'La película cuenta la historia de Mia, una barista de una cafetería que aspira a ser una gran actriz y Sebastian, un pianista de jazz desempleado con grandes ambiciones.​ A pesar de sus diferencias y sus distintas personalidades, gracias a una serie de acontecimientos harán que sus caminos acaben cruzándose.'),
(8, 'Aladdin', 2019, 128, 'Guy Ritchie', 'Estados Unidos', 'Todas las edades', 'Mena Massoud\r\nNaomi Scott\r\nWill Smith\r\nMarwan Kenzari\r\nNavid Negahban\r\nNasim Pedrad\r\nAlan Tudyk\r\nFrank Welker\r\nBilly Magnussen\r\nNuman Acar', 'img/aladdin.jpg', 'Walt Disney Pictures', 'Musical', 'Aladdín (Mena Massoud) es un joven ladrón de buen corazón que vive en la ciudad árabe de Agrabah junto a su mono mascota Abu. Un día rescata y se hace amigo de la princesa Jasmín (Naomi Scott), quien se escabulló del palacio para explorar la ciudad, cansada de su vida sobre-protegida. Mientras tanto, el Gran Visir, Jafar (Marwan Kenzari), planea derrocar al padre de Jasmín (Navid Negahban) como el Sultán. El y su loro mascota, Iago, buscan una lámpara de aceite mágica escondida en la Cueva de las Maravillas que le concederá sus deseos. Sin embargo, solo una persona es digna de entrar: \"el diamante en bruto\", y Jafar decide que éste es Aladdín. Al caer la noche mientras intentaba devolverle a Jasmín un brazalete de oro que perteneció a la madre de ésta, Aladdín rápidamente es capturado por los guardias y enviado al calabozo, y posteriormente Jafar lo convence para que recupere la lámpara. Dentro de la cueva, Aladdín encuentra una alfombra mágica y obtiene la lámpara. Se la entrega a Jafar, quien lo traiciona y lo arroja de nuevo a la cueva, aunque Abu se las arregla para robarle la lámpara justo a tiempo.'),
(9, 'Dios mío, ¿pero qué te hemos hecho?', 2014, 93, 'Philippe de Chauveron', 'Francia', '+7', 'Christian Clavier, Chantal Lauby, Ary Abittan, Medi Sadoun, Frédéric Chau, Noom Diawara, Frédérique Bel, Julia Piaton, Émilie Caen, Élodie Fontan, Pascal Nzonzi', 'img/diosmioperoquetehemoshecho.jpg', 'Les films du 24 / TF1 Droits Audiovisuels / TF1 Films Production', 'Comedia', 'Claude y Marie Verneuil, un matrimonio católico y muy conservador, tienen cuatro hijas, a las que han tratado de inculcar sus valores y principios. Sin embargo, las chicas sólo les han dado disgustos: la mayor se casó con un musulmán; la segunda, con un judío, y la tercera, con un chino. El matrimonio deposita todas sus esperanzas en la hija menor, esperando que, al menos ella, se case por la iglesia.'),
(10, 'Ratatouille', 2007, 110, 'Brad Bird', 'Estados Unidos', 'Todas las edades', '	Patton Oswalt\r\nBrian Dennehy\r\nBrad Garrett\r\nJaneane Garofalo\r\nIan Holm\r\nPeter O\'Toole', 'img/ratatouille.jpg', 'Walt Disney Pictures\r\nPixar Animation Studios', 'Infantiles', 'Remy es una rata que vive en el ático de una casa francesa con su hermano Emile y una colonia liderada por su padre Django. Dotado con un agudo sentido del olfato y gusto, Remy aspira a convertirse en un chef gourmet, inspirado por el reconocido y recientemente fallecido chef Auguste Gusteau (el cual veía en la televisión de la casa de la señora en la cual estaba instalada la colonia), pero en lugar de eso, su habilidad es utilizada para detectar el veneno en la comida, lo cual no lo hace nada feliz. Cuando la anciana que habita en la casa descubre la existencia de la colonia de ratas, huyen a las alcantarillas; Remy se separa de ellas por recuperar un libro de cocina escrito por Gusteau, titulado \"Cualquiera puede cocinar\", por lo que se pierde, yéndose por la intersección equivocada de la alcantarilla (la izquierda, mientras que su colonia se fue por la de la derecha).'),
(11, 'Gladiator', 2000, 155, 'Ridley Scott', 'Reino Unido', '+16', 'Russell Crowe\r\nJoaquín Phoenix\r\nConnie Nielsen', 'img/gladiator.jpg', 'Scott Free Productions', 'Accion', 'En el año 180 d. C. el general hispanorromano Máximo Décimo Meridio lidera al ejército romano hacia una importante victoria sobre las tribus germánicas cerca de Vindobona, poniendo fin a una larga guerra en el limes del imperio romano. Se gana así la estima del anciano y enfermo emperador Marco Aurelio, quien a pesar de tener un hijo, Cómodo, decide que a su muerte sea el general el que ostente el poder temporal hasta que el senado de Roma asuma finalmente el gobierno del imperio. Cuando su padre le informa de su decisión, Cómodo asesina a su progenitor en un ataque de rabia y se hace con el poder. Cómodo intenta ganarse la lealtad de Máximo, pero el militar se percata de lo que ha sucedido. En ese momento el general es traicionado por su amigo, Quinto, que a su pesar instruye a los pretorianos para que lo ejecuten a él y a su familia en Hispania. Máximo consigue deshacerse de sus verdugos y emprende el retorno a su hogar a toda velocidad, pero no llega a tiempo de salvar a su mujer y a su hijo.'),
(12, 'Braveheart', 1995, 177, 'Mel Gibson', 'Estados Unidos', '+18', '	Mel Gibson\r\nSophie Marceau\r\nIan Bannen\r\nBrendan Gleeson\r\nPatrick McGoohan\r\nCatherine McCormack\r\nJames Cosmo\r\nTommy Flanagan', 'img/braveheart.jpg', 'The Ladd Company\r\nIcon Productions', 'Belica', 'En 1280, el rey Eduardo I de Inglaterra invade y conquista Escocia tras la muerte de Alejandro III de Escocia, que no dejó heredero al trono. El joven William Wallace es testigo de la traición del rey inglés, sobrevive a la muerte de su padre y su hermano, y es llevado al extranjero en una peregrinación por toda Europa por su tío paterno Argyle, donde es educado. Años después, Eduardo I le otorga a sus nobles tierras y privilegios en Escocia, incluida la prima noctis. Mientras tanto, un adulto Wallace regresa a Escocia y se enamora de su amiga de la infancia Murron MacClannough, y los dos se casan en secreto. Wallace rescata a Murron de ser violada por soldados ingleses, pero mientras lucha contra su segundo intento, Murron es capturada y ejecutada públicamente. En venganza, Wallace lidera a su clan y asesina a la guarnición inglesa en su ciudad natal y envía a la guarnición invasora de Lanark de regreso a Inglaterra.'),
(13, 'El último samurái', 2003, 144, 'Edward Zwick', 'Estados Unidos', '+16', 'Tom Cruise\r\nShin Koyamada\r\nTimothy Spall\r\nNakamura Shichinosuke II', 'img/elultimosamurai.jpg', 'Bedford Falls Productions\r\nCruise/Wagner Productions', 'Belica', 'El capitán Nathan Algren (Tom Cruise) es un hombre a la deriva, atormentado moral y espiritualmente por los remordimientos de las batallas contra los indígenas norteamericanos. Una vez arriesgó su vida por el honor y por la patria, pero en los años transcurridos desde la guerra de Secesión estadounidense el mundo ha cambiado. El pragmatismo ha reemplazado al valor, el interés personal ha ocupado el lugar del sacrificio y el honor no se encuentra en ninguna parte. Recibe la oferta de marchar a Japón para entrenar a su inexperto ejército de reclutas y campesinos, aceptando inmediatamente debido al excelente salario que recibirá. El mediador del pacto es su antiguo superior en el 7.º Regimiento de Caballería, el coronel Bagley (Tony Goldwyn), que lo reconoce como un hombre muy capaz a pesar de sus limitaciones como el alcoholismo; Algren, sin embargo, lo considera un asesino frío y sin escrúpulos.'),
(15, 'Forrest Gump', 1994, 142, 'Robert Zemeckis', 'Estados Unidos', 'Todas las edades', 'Tom Hanks\r\nRobin Wright\r\nGary Sinise\r\nMykelti Williamson\r\nSally Field\r\nMichael Conner Humphreys', 'img/forrestgump.jpg', 'Paramount Pictures', 'Drama', 'Mientras espera sentado en una parada de autobús, Forrest Gump comienza a relatar la historia de su vida a diversos extraños que se sientan junto a él. Su narración comienza por la infancia, cuando tuvo que llevar unos aparatos ortopédicos en las piernas, que provocaron el acoso y la burla de otros niños. Él vivía con su madre en una casa en el campo en la que alquilaban habitaciones. Allí Forrest enseñó a uno de los huéspedes, un joven Elvis Presley, a bailar de una forma peculiar que luego este haría mundialmente famosa. En el bus escolar durante su primer día de clase Forrest conoce a Jenny, de la que se enamora inmediatamente y de la que se hace su mejor amigo. También en su infancia Forrest descubre que es capaz de correr muy rápido, una habilidad que impresiona al entrenador de fútbol americano Bear Bryant y que le permite ingresar, a pesar de su leve retraso mental, en la Universidad de Alabama. Allí es testigo de la Parada en la Puerta de la Escuela que protagonizó George Wallace en 1963. En esa época también es seleccionado por el equipo All-America de fútbol y conoce en persona en la Casa Blanca al presidente John F. Kennedy.'),
(16, 'Ocho apellidos vascos', 2014, 98, 'Emilio Martínez-Lázaro', 'España', 'Todas las edades', 'Clara Lago\r\nDani Rovira\r\nCarmen Machi\r\nKarra Elejalde', 'img/ochoapellidosvascos.jpg', 'Telecinco Cinema', 'Comedia', 'Rafa (Dani Rovira), un sevillano que nunca ha salido de Andalucía, decide abandonar su tierra natal para seguir a Amaia (Clara Lago), una joven vasca que, a diferencia de otras mujeres que ha conocido, se resiste a sus técnicas de seducción. Para ello, y en contra de los consejos de sus amigos, decide viajar al pueblo de su pretendida, Argoitia, en el corazón abertzale del País Vasco. Una serie de circunstancias llevarán al joven sevillano a tener que hacerse pasar por un auténtico vasco e ir enredándose cada vez más en el personaje para lograr sus propósitos.'),
(17, 'Los juegos del hambre', 2012, 142, 'Gary Ross', 'Estados Unidos', '+12', 'Jennifer Lawrence\r\nJosh Hutcherson\r\nLiam Hemsworth\r\nWoody Harrelson\r\nElizabeth Banks\r\nLenny Kravitz\r\nStanley Tucci\r\nDonald Sutherland\r\nAlexander Ludwig\r\nIsabelle Fuhrman\r\nAmandla Stenberg', 'img/losjuegosdelhambre.jpg', 'Lions Gate Entertainment', 'Accion', 'La nación de Panem salió de las ruinas de lo que una vez fue conocido como Norteamérica. Hace 74 años, los 12 distritos afectados por la pobreza en Panem se rebelaron en contra de la riqueza que controla el Capitolio. Después de su aplastante victoria, el Capitolio ideó \"Los Juegos del Hambre\". Cada año, cada distrito debe llevar a cabo una rifa (conocida como la cosecha) para elegir a un hombre y a una mujer (con edades desde los 12 hasta los 18 años) para participar en \"Los Juegos del Hambre\", una competición en la que cada uno de los 24 participantes (conocidos como tributos) pelearán a muerte en una arena televisada hasta que solo uno quede vivo. Sin embargo esto es simplemente un recordatorio anual a los doce distritos de su autoridad y como castigo por la rebelión hecha hace 74 años.'),
(18, 'Divergente', 2014, 139, 'Neil Burger', 'Estados Unidos', '+12', 'Shailene Woodley\r\nTheo James\r\nAshley Judd\r\nJai Courtney\r\nRay Stevenson\r\nZoë Kravitz\r\nMiles Teller\r\nTony Goldwyn\r\nAnsel Elgort\r\nMaggie Q\r\nMekhi Phifer\r\nKate Winslet', 'img/divergente.jpg', 'Summit Entertainment\r\nRed Wagon Productions', 'Accion', 'En una futurista y distópica Chicago, la sociedad se divide en cinco facciones: Abnegación (los altruistas), Cordialidad (los pacíficos), Verdad (los sinceros), Osadía (los valientes) y Erudición (los inteligentes). El resto de la población son los Abandonados, que no tienen ningún estatus o privilegio en esta sociedad. Cuando los niños alcanzan la edad de 16 años, se someten a una prueba de aptitud psicológica inducida por suero que indica su facción más adecuada, aunque se les permite elegir cualquier facción como su grupo permanente en la posterior ceremonia de elección.'),
(20, 'Sentido y sensibilidad', 1995, 135, 'Ang Lee', 'Reino Unido', 'Todas las edades', 'Emma Thompson\r\nKate Winslet\r\nGemma Jones\r\nHugh Grant\r\nEmilie François\r\nAlan Rickman\r\nGreg Wise\r\nJames Fleet\r\nElizabeth Spriggs\r\nTom Wilkinson\r\nRobert Hardy\r\nImelda Staunton\r\nHarriet Walter\r\nHugh Laurie\r\nImogen Stubbs', 'img/sentidoysensibilidad.jpg', 'Columbia Pictures', 'Romance', 'La señora Dashwood, Elinor, Marianne y Margaret, son tres hermanas del segundo matrimonio del señor Dashwood. Cuando este muere, deja toda la herencia al hijo de su primer matrimonio. Las Dashwood, se quedan un corto tiempo en la que era su casa, donde conocen a Edward Ferrars, cuñado de su hermanastro del cual Elinor se enamora. Cuando se trasladan a una casa en el campo, Marianne se enamora de John Willoughby, que vive cerca de su nueva casa. Durante su estancia allí ella aprenderá a madurar acerca de los conceptos del amor.'),
(21, 'Passengers', 2016, 116, 'Morten Tyldum', 'Estados Unidos', '+16', 'Jennifer Lawrence\r\nChris Pratt\r\nMichael Sheen\r\nLaurence Fishburne', 'img/passengers.jpg', 'LStar Capital\r\nVillage Roadshow Pictures\r\nOriginal Film\r\nWanda Pictures\r\nCompany Films\r\nStart Motion', 'Ciencia Ficcion', 'La Ávalon, una nave espacial gigante que viaja a Homestead II, un lejano planeta-colonia y que transporta a 5000 personas y 258 tripulantes en su interior en hibernación, entra en un campo de asteroides. Su escudo frena la mayor parte de los impactos, pero un asteroide de grandes dimensiones impacta con su escudo. Al iniciar las reparaciones, la computadora de a bordo sufre una avería y despierta accidentalmente a Jim Preston (Chris Pratt), un ingeniero pasajero de la Ávalon, 90 años antes de llegar (el viaje duraría unos 120 años).'),
(22, 'E.T., el extraterrestre', 1982, 115, 'Steven Spielberg', 'Estados Unidos', '+16', '	Henry Thomas\r\nRobert MacNaughton\r\nDrew Barrymore\r\nDee Wallace\r\nPeter Coyote\r\nK. C. Martel\r\nSean Frye\r\nC. Thomas Howell\r\nErika Eleniak\r\nPat Welsh', 'img/et.jpg', 'Universal Pictures', 'Ciencia Ficcion', 'El filme comienza en Crescent City, California, con un grupo de botánicos extraterrestres que reúnen muestras de la vegetación. Agentes del gobierno de Estados Unidos aparecen y los extraterrestres huyen en su nave espacial, dejando atrás a uno de los suyos en sus prisas. La escena cambia a un hogar en los suburbios de California, donde un niño llamado Elliott (Henry Thomas) hace de sirviente de su hermano mayor, Michael (Robert MacNaughton), y sus amigos (K. C. Martel, Sean Frye y C. Thomas Howell). Cuando él va por la pizza, Elliott descubre al extraterrestre abandonado, quien huye con prontitud. A pesar de la incredulidad de su familia, Elliott deja dulces de Reese\'s Pieces en el bosque para atraerlo a su dormitorio. Antes de que se vaya a la cama, Elliott le advierte al extraterrestre imitando sus movimientos.'),
(23, 'Un paseo para recordar', 2002, 98, 'Adam Shankman', 'Estados Unidos', 'Todas las edades', 'Mandy Moore\r\nShane West\r\nPeter Coyote,\r\nDaryl Hannah', 'img/unpaseopararecordar.jpg', 'Di Novi Pictures', 'Romance', 'Landon es un chico rebelde y Jamie es la chica buena, hija del reverendo. Hasta antes de interpretar una obra juntos ellos dos no hablaban y él se burlaba de ella con sus amigos, pero al causar un accidente, Landon es obligado a participar en una obra teatral.\r\n\r\nViendo que tenía problemas para interpretar el rol principal de la obra, le pide ayuda a Jamie, quien también tiene el rol principal en la obra y a pesar de que, en un principio, no esta dispuesta a ayudarlo, acepta hacerlo con una extraña condición: que Landon prometiera nunca enamorarse de ella; una proposición que Landon no encontró difícil de aceptar.\r\n\r\nLas prácticas comienzan, pero Landon evita hablar con Jamie mientras no están en sus ensayos por miedo a lo que los demás puedan decir. Jamie se siente ofendida de cómo Landon la trata cuando no están en privado, y aún peor cuando él está con sus amigos; así que se niega a seguir con las prácticas. Sabiendo lo mal que pudo haber hecho sentir a Jamie, Landon le pide una segunda oportunidad para compensarlo.'),
(24, 'La vida es bella', 1997, 116, 'Roberto Benigni', 'Italia', '+16', 'Roberto Benigni\r\nNicoletta Braschi\r\nGiorgio Cantarini', 'img/lavidaesbella.jpg', 'Melampo Cinematografica\r\nCecchi Gori Group', 'Drama', 'La película comienza con una voz en off diciendo: Esta es una historia sencilla, pero no es fácil contarla. Como en una fábula, hay dolor, y como una fábula, está llena de maravillas y felicidad.\r\n\r\nEn 1939, Guido Orefice (Roberto Benigni), un alegre, divertido y carismático joven italiano de origen judío, llega a la casa de su tío Eliseo en Arezzo para trabajar como camarero en su hotel. Allí conoce a una joven y bella profesora llamada Dora (Nicoletta Braschi, esposa en la vida real de Roberto Benigni), de la que se enamora inmediatamente y hace lo posible por conquistarla, llamándola princesa y saludándola alegremente con la frase ¡Buenos días, princesa! cada vez que la ve, aunque resulta que ella es la prometida de un funcionario fascista local llamado Rodolfo.'),
(25, 'Una cenicienta moderna', 2004, 95, 'Mark Rosman', 'Estados Unidos', 'Todas las edades', 'Hilary Duff\r\nChad Michael Murray\r\nJennifer Coolidge\r\nRegina King\r\nDan Byrd\r\nMadeline Zima', 'img/unacenicientamoderna.jpg', 'Warner Bros', 'Romance', 'Samantha Montgomery, tras el fallecimiento de su padre, vive en una familia que no la respeta, haciéndola trabajar como camarera duramente, gracias a su madrastra Fiona y sus dos hermanastras. Sam, en su poco tiempo libre, usa el ordenador, donde conoce a un amigo cibernético, con el cual se está comunicando todo el día, mediante mensajes de texto y chats. Ese chico un día la invita a una fiesta de Halloween, aunque cuando ella ve que es Austin, uno de los chicos más admirados de su instituto, Sam escapa de la fiesta porque debía ir a trabajar a la cafetería, dejando caer su móvil por descuido.'),
(26, 'Zipi y Zape y el club de la canica', 2013, 97, 'Oskar Santos', 'España', 'Todas las edades', 'Raúl Rivas\r\nDaniel Cerezo\r\nJavier Gutiérrez Álvarez\r\nClaudia Vega', 'img/zipiyzape.jpg', 'Zeta Cinema', 'Infantiles', 'El director Oskar Santos (El mal ajeno, El soñador) nos trae esta adaptación cinematográfica del famoso tebeo \'Zipi y Zape\' creado por José Escobar en 1948. En esta ocasión, los traviesos mellizos viven una nueva aventura cuando son internados en el colegio \'Esperanza\', aunque en este lugar poca esperanza hay... lo único que encuentran son duras normas que prohiben a los niños divertirse y jugar.\r\n\r\nPara evitar esto, Zipi y Zape fundan el Club de la Canica con el que pretenderán poder continuar con sus juegos y frenar el despotismo de los adultos. Pero en su lucha por defender la amistad, ellos y el resto de miembros del club descubrirán un extraño secreto que se alberga entre los muros del colegio. ¿Podrán finalmente derrocar la autoridad de los mayores?, y lo que es más importante... ¿serán capaces de salir sanos y salvos de esta aventura?'),
(27, 'Ocho apellidos catalanes', 2015, 99, 'Emilio Martínez-Lázaro', 'España', 'Todas las edades', 'Dani Rovira\r\nKarra Elejalde\r\nCarmen Machi\r\nClara Lago\r\nRosa María Sardà\r\nBerto Romero\r\nBelén Cuesta\r\nAlfonso Sánchez\r\nAlberto López', 'img/ochoapellidoscatalanes.jpg', 'Lazonafilms', 'Comedia', 'Después de que Rafa (Dani Rovira) rompiera su relación con Amaia (Clara Lago), el padre de ella, Koldo (Karra Elejalde), se presenta en Sevilla para anunciarle los nuevos planes de boda de su hija con un catalán. Arrepentido por provocar la ruptura, Rafa acompaña a Koldo a la masía gerundense del pretendiente, Pau (Berto Romero), que ha movilizado al pueblo para hacer creer a su abuela, Roser (Rosa María Sardà), que Cataluña consiguió la independencia y que su boda será la primera que albergue el nuevo país.'),
(29, 'Frozen: El reino del hielo', 2013, 102, 'Chris Buck, Jennifer Lee', 'Estados Unidos', 'Todas las edades', 'Kristen Bell\r\nIdina Menzel\r\nJonathan Groff\r\nJosh Gad\r\nSantino Fontana', 'img/frozen1.jpg', 'Walt Disney Animation Studios\r\nWalt Disney Pictures', 'Infantiles', 'La historia se centra en la Princesa Elsa de Arendelle, quien tiene poderes mágicos para generar hielo; una habilidad que usa para jugar con su hermana menor, la Princesa Anna. En uno de sus juegos, Elsa hiere accidentalmente a su hermana. Sus padres, El Rey y La Reina de Arendelle, llevan a su hija Anna a una colonia de trolls liderados por Grand Pabbie. Él la cura, y por su bien «borra» los recuerdos de ella con Elsa, su hermana mayor; y le aconseja a Elsa controlar sus poderes mágicos. El Rey y la Reina de Arendelle aíslan a sus dos hijas, Anna y Elsa, dentro del palacio. Elsa empieza a despreciar a Anna, su hermana menor, lo que provoca el distanciamiento entre ellas. Elsa elige suprimir su magia en lugar de dominarla, haciendo que se vuelva más insegura. Cuando las hermanas son adolescentes, sus padres desafortunadamente mueren en el mar durante un fuerte huracán'),
(30, 'Frozen  2', 2019, 103, 'Chris Buck, Jennifer Lee', 'Estados Unidos', 'Todas las edades', 'Idina Menzel\r\nKristen Bell\r\nJonathan Groff\r\nJosh Gad', 'img/frozen2.jpg', 'Walt Disney Pictures\r\nWalt Disney Animation Studios', 'Infantiles', 'En una secuencia retrospectiva, el Rey Runeard, fundador y primer rey de Arendelle, establece un tratado con la tribu de los Northuldra mediante la construcción de una presa en la tierra natal de los Northuldra, el Bosque Encantado. Sin embargo, se produce una pelea y enfurece a los espíritus de la tierra, el fuego, el viento y el agua que habitan en el bosque. Los espíritus desaparecen y un muro de niebla encierra a todos en el bosque. El hijo de Runeard, el príncipe Agnarr, apenas escapa con la ayuda de un salvador desconocido.'),
(31, 'El niño con el pijama a rayas', 2008, 94, 'Mark Herman', 'Reino Unido', '+16', 'Vera Farmiga\r\nDavid Thewlis\r\nRupert Friend\r\nAsa Butterfield\r\nJack Scanlon', 'img/pijamaarayas.jpg', 'BBC Films', 'Drama', 'Bruno, un niño alemán de 8 años que vive durante el régimen nazi en la Segunda Guerra Mundial en 1942, es hijo de un estricto comandante que acaba de ser asignado a su nuevo puesto en un campo de concentración. Bruno, que convive junto con su hermana mayor Gretel en un barrio acomodado de Berlín, se ve entonces repentinamente obligado a mudarse, trasladándose a un lugar aislado llamado \"Auschwitz\". Bruno se desespera por no encontrar ningún amigo con quien jugar en su nueva casa, más pequeña y con menos terreno para explorar. Desde su ventana se puede ver un grupo de casas tras una valla y mucha gente vestida con pijamas de rayas. Todos los que allí se encuentran son judíos confinados en el campo de concentración de Auschwitz. Bruno, en su inocencia, da por supuesto que son granjeros.'),
(33, 'La pasión de Cristo', 2004, 126, 'Mel Gibson', 'Estados Unidos', '+18', 'James Caviezel\r\nMaia Morgenstern\r\nHristo Jivkov\r\nMonica Bellucci\r\nFrancesco DeVito', 'img/lapasion.jpg', 'Newmarket Films', 'Drama', 'Año 30 de nuestra era. En la provincia romana de Judea, un misterioso carpintero llamado Jesús de Nazareth comienza a anunciar la llegada del \"reino de Dios\" y se rodea de un grupo de humildes pescadores: los Apóstoles. Durante siglos, el pueblo judío había esperado la llegada del Mesías - personaje providencial que liberaría su sagrada patria e instauraría un nuevo orden basado en la justicia-. Las enseñanzas de Jesús atraen a una gran multitud de seguidores que lo reconocen como el Mesías. Alarmado por la situación, el Sanedrín, con la ayuda de Judas Iscariote, uno de los doce Apóstoles, arresta a Jesús. Acusado de traición a Roma, Cristo es entregado a Poncio Pilato, quien, para evitar un motín, lo condena a a morir en la cruz como un vulgar criminal.'),
(34, 'Misión imposible', 1996, 110, 'Brian De Palma', 'Estados Unidos', '+12', 'Tom Cruise\r\nEmmanuelle Béart\r\nJon Voight\r\nJean Reno\r\nVing Rhames', 'img/misionimposible.jpg', 'Paramount Pictures', 'Aventuras', 'La característica de las misiones de este equipo de espías es que serían prácticamente imposibles para cualquier grupo común de agentes. Las misiones son inverosímiles y los agentes se convierten en superagentes. En esta versión, el grupo de agentes ultrasecretos debe recuperar un disco para computadora que tiene importante información para el gobierno. En el intento mueren varios agentes y el protagonista de la película es acusado de su muerte. Además de intentar recuperar el material robado, el agente Ethan Hunt, protagonizado por Tom Cruise, deberá probar su inocencia.'),
(35, 'Harry Potter y la piedra filosofal', 2001, 152, 'Chris Columbus', 'Reino Unido', '+7', 'Daniel Radcliffe\r\nRupert Grint\r\nEmma Watson\r\nRichard Harris\r\nMaggie Smith\r\nAlan Rickman\r\nRobbie Coltrane', 'img/harrypotter1.jpg', 'Heyday Films', 'Aventuras', 'Harry Potter es un niño huérfano que vive con sus únicos parientes vivos, la familia Dursley, en un barrio residencial inglés. En su cumpleaños número 11, Harry es visitado por un misterioso individuo llamado Rubeus Hagrid, quien le revela que realmente él es un mago bastante popular en el mundo mágico por haber sobrevivido al ataque mortal de Lord Voldemort cuando solamente tenía un año de edad. Tras haber asesinado a sus padres (James y Lily Potter), Voldemort intentó matar a Harry pero no lo consiguió, dejándole solamente una cicatriz en forma de rayo sobre su frente. Sabiendo esto, Hagrid acompaña a Harry para comprar lo necesario con tal de comenzar su formación en el Colegio Hogwarts de Magia y Hechicería.'),
(36, 'Harry Potter y la cámara secreta', 2002, 161, 'Chris Columbus', 'Reino Unido', '+7', 'Daniel Radcliffe\r\nRupert Grint\r\nEmma Watson\r\nToby Jones\r\nKenneth Branagh', 'img/harrypotter2.jpg', 'Heyday Films', 'Aventuras', 'Preparándose para una visita de un potencial cliente del tío Vernon, los Dursley confinan a Harry Potter en su habitación. Sin embargo este recibe la visita inesperada de Dobby, un elfo doméstico, que le advierte que no debe regresar a Hogwarts, ya que ahora el lugar no es seguro. Debido a la negativa de Harry, Dobby arruina la cena haciendo que los tíos culparan a Harry. Este incidente fuerza al tío Vernon a encerrar a Harry en su cuarto para que no pueda volver al colegio. Ron, Fred y George Weasley llegan en un volador Ford Anglia celeste, rescatan a Harry y lo llevan a La Madriguera. Harry conoce a la hermana menor de Ron, Ginny, que se sorprende al verlo debido a que le gusta. Ésta empieza su primer año en Hogwarts. También conoce al padre de Ron, Arthur Weasley.'),
(37, 'Harry Potter y el prisionero de Azkaban', 2004, 141, 'Alfonso Cuarón', 'Reino Unido', '+7', 'Daniel Radcliffe\r\nEmma Watson\r\nRupert Grint\r\nGary Oldman\r\nDavid Thewlis\r\nEmma Thompson\r\nMichael Gambon\r\nMaggie Smith', 'img/harrypotter3.jpg', 'Heyday Films', 'Aventuras', 'Harry Potter ha pasado otro verano insatisfactorio con los Dursley. Cuando tía Marge le insulta a sus padres, pierde los estribos y hace que esta se infle accidentalmente como un globo y se aleje flotando. Harto de todo, Harry huye luego de los Dursley con su equipaje. El Autobús Noctámbulo lo lleva al Caldero Chorreante, donde es perdonado por Cornelius Fudge, el ministro de Magia, por usar la magia fuera de Hogwarts. Después de reunirse con sus mejores amigos Ron Weasley y Hermione Granger, Harry descubre que Sirius Black, un convicto partidario del mago oscuro Lord Voldemort, escapó de la prisión de Azkaban y tiene la intención de matarlo.'),
(38, 'Harry Potter y el cáliz de fuego', 2005, 157, 'Mike Newell', 'Reino Unido', '+7', 'Daniel Radcliffe\r\nRupert Grint\r\nEmma Watson\r\nRalph Fiennes\r\nMichael Gambon\r\nBrendan Gleeson\r\nAlan Rickman\r\nMaggie Smith\r\nRobert Pattinson\r\nClémence Poésy\r\nStanislav Ianevski', 'img/harrypotter4.jpg', 'Heyday Films', 'Aventuras', 'La película inicia cuando Harry Potter (Daniel Radcliffe) empieza a ver en sus sueños al jardinero de los Riddle, Frank Bryce, quien escucha a Lord Voldemort conspirando junto con Peter Pettigrew (Timothy Spall), su serpiente Nagini y otro joven en la habitación de una casa. Bryce es asesinado por Voldemort al asomarse tras ver luz proveniente de la casa. Más tarde, Harry y sus amigos visitan la final de la Copa Mundial de Quidditch, pero posterior al partido la celebración es interrumpida por los mortífagos que aterrorizan a los espectadores.'),
(39, '300', 2006, 110, 'Zack Snyder', 'Estados Unidos', '+12', 'Gerard Butler\r\nLena Headey\r\nDavid Wenham\r\nRodrigo Santoro\r\nVincent Regan\r\nMichael Fassbender', 'img/300.jpg', 'Legendary Pictures', 'Accion', 'La película comienza narrando la infancia de Leónidas y su entrenamiento para ser el próximo rey espartano, que logró el asombro de todos, al matar a un gigantesco lobo con una lanza de madera en mitad de una tormenta de nieve. Un día, siendo ya monarca de Esparta, llega a visitarlo un emisario persa del rey Jerjes que le comunica la exigencia de pagar un tributo de tierra y agua como prueba de la sumisión de la polis hacia Persia. Leónidas se niega y tira enfurecido a un pozo al emisario, junto con los escoltas de este que son masacrados por los guardias de Leónidas. Después de esto, visita a los Éforos proponiendo hacer retroceder a los persas, numéricamente superiores, a través de las Termópilas; este plan comprendía la construcción de una muralla con la finalidad de embutir a los persas en un pasillo estrecho entre las rocas y el mar. Los Éforos consultan al Oráculo y este decreta que Esparta no debe ir a la guerra durante las Carneas. Partiendo Leónidas enfadado, aparece un emisario de Jerjes para recompensar a los Éforos por su apoyo encubierto.'),
(40, 'Cómo acabar con tu jefe', 2011, 100, 'Seth Gordon', 'Estados Unidos', '+7', 'Jason Bateman, Charlie Day, Jason Sudeikis, Jennifer Aniston, Colin Farrell, Kevin Spacey, Jamie Foxx, Julie Bowen, Donald Sutherland, Lindsay Sloane, John Francis Daley, Isaiah Mustafa, Ioan Gruffudd', 'img/comoacabarcontujefe.jpg', 'New Line Cinema', 'Comedia', 'Para Nick, Kurt y Dale, la única solución para hacer su rutina diaria más tolerable sería hacer desaparecer a sus insoportables jefes. Con la ayuda de unas copas de más y el consejo poco fiable de un expresidiario buscavidas, los tres idean un enrevesado e infalible plan para deshacerse para siempre de sus superiores. El único problema es que el plan es tan infalible como el cerebro que lo concibe.'),
(41, 'Indiana Jones y la última cruzada', 1989, 127, 'Steven Spielberg', 'Estados Unidos', 'Todas las edades', 'Harrison Ford\r\nSean Connery\r\nDenholm Elliott\r\nAlison Doody\r\nJohn Rhys-Davies\r\nJulian Glover\r\nRiver Phoenix\r\nMichael Byrne\r\nKevork Malikyan\r\nRobert Eddison\r\nRichard Young\r\nAlexei Sayle', 'img/indianajones3.jpg', '	\r\nLucasfilm\r\nParamount Pictures', 'Aventuras', 'La historia comienza en 1912, cuando un Indiana Jones de trece años aparece cabalgando con su compañía de boy scouts en una zona desértica de Utah. El joven Indiana descubre a unos buscadores de tesoros furtivos en una cueva, los cuales acababan de encontrar una cruz que había pertenecido al conquistador español Francisco Vázquez de Coronado, la Cruz de Coronado.'),
(42, 'Indiana Jones en busca del arca perdida', 1981, 115, 'Steven Spielberg', 'Estados Unidos', 'Todas las edades', '	Harrison Ford\r\nKaren Allen\r\nPaul Freeman\r\nRonald Lacey\r\nJohn Rhys-Davies\r\nDenholm Elliott\r\nAlfred Molina\r\nWolf Kahler\r\nAnthony Higgins\r\nVic Tablian\r\nDon Fellows\r\nWilliam Hootkins', 'img/indianajones1.jpg', 'Lucasfilm', 'Aventuras', 'La trama se desarrolla en 1936, durante el expansionismo nazi. Adolf Hitler está inmerso en una búsqueda para encontrar el Arca de la Alianza, en la que se hallan guardados los diez mandamientos cuyos poderes sobrenaturales, de acuerdo con un mito, pueden eliminar a ejércitos en su totalidad.\r\n\r\nEl gobierno de los Estados Unidos quiere encontrar el Arca antes que Hitler y para ello deciden enviar al Dr. Henry Jones (Indiana Jones), un profesor de arqueología que acaba de regresar de una fallida expedición que tenía como objetivo recuperar un ídolo sagrado de las junglas sudamericanas.'),
(43, 'Los Vengadores', 2012, 143, 'Joss Whedon', 'Estados Unidos', 'Todas las edades', 'Robert Downey Jr.\r\nChris Evans\r\nMark Ruffalo\r\nChris Hemsworth\r\nScarlett Johansson\r\nJeremy Renner\r\nTom Hiddleston\r\nClark Gregg\r\nCobie Smulders\r\nStellan Skarsgård\r\nSamuel L. Jackson', 'img/losvengadores.jpg', 'Marvel Studios', 'Ciencia Ficcion', 'El dios asgardiano exiliado Loki se encuentra con El Otro,7​ un líder de una raza extraterrestre conocida como los Chitauri. Llega a un trato con ellos; a cambio de recuperar el Teseracto, una fuente de poderosa energía de potencial desconocido, el Otro le promete a Loki un ejército con el que pueda subyugar a la Tierra. Nick Fury, director de la Agencia de espionaje S.H.I.E.L.D. y su teniente, la agente María Hill, llegan a un centro de investigación remoto donde se empieza una evacuación inmediata de las instalaciones y donde el físico Dr. Erik Selvig está liderando un equipo de investigación y experimentando con el Teseracto. El agente Phil Coulson explica que el Teseracto ha comenzado a liberar una forma inusual de energía, mucho antes de que empezara la evacuación. Inesperadamente el Teseracto se activa y abre un agujero de gusano, permitiendo al dios asgardiano Loki llegar a la tierra. Loki consigue robar el Teseracto y utiliza su cetro para esclavizar a Selvig y a un par de agentes, incluyendo a Clint Barton y ayudarlo en su escape.'),
(44, 'Thor', 2011, 227, 'Kenneth Branagh', 'Estados Unidos', 'Todas las edades', 'Chris Hemsworth\r\nTom Hiddleston\r\nIdris Elba\r\nAnthony Hopkins', 'img/thor.jpg', 'Marvel Studios', 'Ciencia Ficcion', 'En 965 d.C., Odín, rey de Asgard, libra una guerra contra los Gigantes de Hielo de Jotunheim y contra su líder Laufey, para evitar que conquisten los Nueve Reinos, comenzando con la Tierra. Los guerreros asgardianos derrotan a los Gigantes de Hielo y aprovechan la fuente de su poder, el Cofre de los Viejos Inviernos. En el presente, el hijo de Odín, Thor se prepara para ascender al trono de Asgard, pero es interrumpido cuando los Gigantes de Hielo intentan recuperar el cofre. Desobedeciendo la orden de Odín, Thor viaja a Jotunheim para hacer frente a Laufey, acompañado por su hermano Loki (Tom Hiddleston), su amiga de la infancia Sif y los Tres Guerreros: Volstagg, Fandral y Hogun. Estalla una batalla hasta que Odín interviene para salvar a los asgardianos, destruyendo la frágil tregua entre las dos razas. Por la arrogancia de Thor, Odín le arrebata a su hijo su poder divino y lo exilia a la Tierra, acompañado de su martillo Mjolnir –la fuente de su poder-, ahora protegido por un hechizo para permitir que sólo los dignos lo levanten.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `comentarios_ibfk_1` (`id_pelicula`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;




use productos;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `producto` (
  `Id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `precio` float NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `categoria` enum('pelicula','serie','accesorio','merchandicing') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id`, `nombre`, `precio`, `descripcion`, `imagen`, `categoria`) VALUES
(1, 'Cascos inalámbricos', 19.99, 'Cascos inalámbricos para conectar mediante bluetooth.', 'img/cascos.jpg', 'accesorio'),
(2, 'Pocahontas (Pelicula)', 15.4, 'DVD con la pelicula de pocahontas', 'img/pocahontasdvd.jpg', 'pelicula'),
(3, 'Gladiator película', 12.3, 'Gladiator (Gladiador en Hispanoamérica y Gladiator en España) es una película épica del género péplum y acción de 2000 dirigida por Ridley Scott y protagonizada por Russell Crowe, Joaquin Phoenix y Connie Nielsen. Crowe interpreta a Máximo Décimo Meridio, un leal general hispano del ejército del Imperio romano que es traicionado por Cómodo, el ambicioso hijo del emperador Marco Aurelio, quien ha asesinado a su padre y se ha hecho con el trono. Forzado a convertirse en esclavo, Máximo triunfa como gladiador mientras anhela vengar la muerte de su familia y la del emperador.', 'img/gladiatordvd.jpg', 'pelicula'),
(4, 'Suits (la clave del éxito)', 140.45, 'Mike Ross es un joven con una mente brillante que siempre ha soñado con ser abogado, pero un incidente desafortunado le impide cumplirlo. Naturalmente inteligente y con una memoria eidética, se gana la vida suplantando a otros en los exámenes de admisión para la escuela de derecho. Envuelto en un encargo de tráfico de drogas, Mike sospecha que le han tendido una trampa y consigue deshacerse de la policía al colarse en una entrevista de trabajo para uno de los bufetes más importantes de Nueva York (Pearson Hardman).\r\n\r\nHarvey Specter es el mejor abogado de Manhattan. Brillante, calculador, elegante y atractivo, Harvey tiene fama de ganar todos sus casos, aunque a veces recurra a su propia interpretación de las reglas y recientemente ha sido promovido a socio mayoritario de su bufete, y tiene derecho, por la política de la empresa, a contratar a un asociado. A pesar de no ser licenciado y de presentarse en la entrevista con un maletín lleno de marihuana, Mike consigue impresionar a Harvey, demostrándole que posee un conocimiento enciclopédico del derecho.', 'img/suits.jpg', 'serie'),
(5, 'Varit Harry Potter', 44.99, 'Replpica exacta de la varita de Harry Potter en madera de sauco. Mantener fuera del alcance de los niños. \r\n', 'img/varitaharry.jpg', 'merchandicing'),
(6, 'Taza Star Wars', 9.95, '¿La taza perfecta para tomarte el desayuno y disfrutarlo a tope!', 'img/taza.jpg', 'merchandicing'),
(7, 'El último samurái (DVD)', 17.8, 'El capitán Nathan Algren (Tom Cruise) es un hombre a la deriva, atormentado moral y espiritualmente por los remordimientos de las batallas contra los indígenas norteamericanos. Una vez arriesgó su vida por el honor y por la patria, pero en los años transcurridos desde la guerra de Secesión estadounidense el mundo ha cambiado. El pragmatismo ha reemplazado al valor, el interés personal ha ocupado el lugar del sacrificio y el honor no se encuentra en ninguna parte. Recibe la oferta de marchar a Japón para entrenar a su inexperto ejército de reclutas y campesinos, aceptando inmediatamente debido al excelente salario que recibirá. El mediador del pacto es su antiguo superior en el 7.º Regimiento de Caballería, el coronel Bagley (Tony Goldwyn), que lo reconoce como un hombre muy capaz a pesar de sus limitaciones como el alcoholismo; Algren, sin embargo, lo considera un asesino frío y sin escrúpulos.', 'img/ultsamurai.jpg', 'pelicula'),
(8, 'Funko Baby Yoda', 11.95, 'Amplia tu colección con la siguiente edición Star Wars de la serie Mandalorian, personaje The Child Baby Yoda.', 'img/funkobabyyoda.jpg', 'merchandicing'),
(9, 'Soporte de mesa universal para móvil', 19.99, 'Base de silicona antideslizante + base de aluminio, en la que puedes escribir o dibujar sin tambalear., Con los modos de ajuste de longitud de 0-70 mm se pueden satisfacer las personas con diferentes necesidades de altura., Ajuste de visualización múltiple de 5° ~ 45°, le permite encontrar un cómodo ángulo de visión en interiores y exteriores., El diseño de bajo centro de gravedad y los ganchos alargados mantienen la tableta segura y firme., Puede mantener el dispositivo al mismo tiempo y cargar, el cable de carga se ajusta bien al espacio de carga reservado.', 'img/p9.jpg', 'accesorio'),
(10, 'Funda mv. HarryPotter (iPhone)', 9.99, 'Si te consideras un autentico fan de la saga de Harry Potter, estas en el sitio adecuado. Cuantos recuerdos nos trae este mago y sus trucos... Como nos hacían vibrar esos partidos de Quidditch frente a las otrascasas Slitheryn, Ravenclaw, Hufflepuff... o esas batallas en las que nos quedábamos sin uñas contra Voldemort... Revive las aventuras de Harry Potter, Hermione y Ron con nuestra gama de fundas para iPhone.Hazte con la carcasa de tus dibujos favoritos para tu iPhone. Material de silicona.¡No dejes escapar esta oportunidad y protege tu preciado teléfono móvil a un precio de escándalo con una de nuestras bonitas carcasas!', 'img/p10.jpg', 'accesorio'),
(11, 'Apple AirPods Pro', 229.95, 'Dos micrófonos con tecnología beamforming, Dos sensores ópticos, Acelerómetro con detección de movimiento, Acelerómetro con detección de voz.', 'img/p11.jpg', 'accesorio'),
(12, 'Auriculares Gaming', 96.04, 'Auriculares gaming Kimera V2 Ivory con retroiluminación RGB personalizable en 16.8 millones de colores. Gracias a su sonido virtual 7.1 podrás disfrutar de cada detalle de tus juegos y con sus grandes almohadillas acolchadas lo llevarás durante horas sin problema. Además cuenta con micrófono omnidireccional y extraíble  con filtro anti-pop. ', 'img/p12.jpg', 'accesorio'),
(13, 'Manta Pokémon con Forro Polar', 11.95, 'Manta suave para que disfrutes de todas tus experiencias televisivas acompañado de tus pokémon preferidos.', 'img/p13.jpg', 'accesorio'),
(14, 'Gafas Realidad Virtual VR', 39.97, 'Gafas de Realidad Virtual VR – Virtual Reality toma la delantera del diseño patentado de una pieza, combinado con auriculares insonorizado de graves altos, entrará al nuevo mundo de inmediato y olvidará el entorno real.', 'img/p14.jpg', 'accesorio'),
(15, 'La casa de papel - Serie completa', 28.40, 'Un enigmático personaje llamado El Profesor planea algo grande, único: llevar a cabo el mayor atraco de la historia. Para ello recluta una banda de ocho personas que reúnen un único requisito: ninguno tiene nada que perder. Como Tokio, una joven experta en atracos que se encuentra en busca y captura por la policía. Ella se unirá al grupo reclutado por El Profesor y conformado por: Berlín, el cabecilla; Moscú, el experto en perforaciones; Río, el informático; Nairobi, la falsificadora; Denver, hijo de Moscú; Helsinki y Oslo, la fuerza bruta. Cinco meses de reclusión memorizando cada paso, cada detalle, cada probabilidad... y por n, el gran asalto a la Fábrica de Moneda y Timbre. Cinco días de encierro, rodeados de los cuerpos de élite de la policía y con más de 65 rehenes en su poder (casi 20 adolescentes) para saber si saldrán vencedores de su apuesta suicida. Será todo o nada. Fuera de la Fábrica de Moneda y Timbre se librará una partida de ajedrez no menos importante para el devenir de los acontecimientos: la que mantendrá El Profesor con Raquel, la oficial de Policía encargada de las negociaciones con los atracadores.', 'img/p15.jpg', 'serie'),
(16, 'Juego de tronos (T.1-T.8)', 129.99, '8 temporadas. 73 episodios. Tras un largo verano de varios años, el temible invierno acecha a los Siete Reinos. Los Caminantes Blancos se acercan a Poniente para enfrentarse a los vivos, divididos entre sí por una cruel guerra, mientras al otro lado del mar la madre de dragones, Daenerys Targaryen, está decidida a recuperar el Trono de Hierro de su familia. Basada en los best-sellers de George R. R. Martin.  EXTRAS:Con más de 15 horas de contenido extra incluyendo Juego de Tronos: la reunión especial presentada...', 'img/p16.jpg', 'serie'),
(17, 'Victoria', 14.96, 'Serie de TV. Primera Temporada Completa. Sinopsis: Drama histórico sigue los primeros años de la Reina Victoria, desde su ascensión al trono a la temprana edad de 18 años hasta su matrimonio con el Príncipe Alberto, en lo que continuó como un reinado de más de 60 años. Premios: 2016: Premios BAFTA TV: Nominada a Mejor maquillaje y peluquería de TV', 'img/p17.jpg', 'serie'),
(18, 'Prison break', 62.96, 'De las mejores series de la primera decada del siglo, la cual sera sin duda recordada como la epoca dorada de las series. Sobre todo la primera temporada.', 'img/p18.jpg', 'serie'),
(19, 'Stranger Things', 7.81, 'Sumérgete en el mundo de "Stranger Things" y disfruta de esta apasionante temporada con tus seres queridos.', 'img/p19.jpg', 'serie'),
(20, 'El Mentalista T.2-T.7', 74.00, 'En esta última Temporada de EL Mentalista, Jane se da cuenta fi nalmente de sus sentimientos y toma el coraje necesario para hacer lo que deseaba. Decidido a hacer cambiar de opinión a Lisbon y que se quede a su lado, el mentalista primero usa sus subterfugios habituales, antes de decidirse a declarar su amor. Evidentemente, esta declaración no se queda sin continuación y, después de seis temporadas, podemos ver fi nalmente un desenlace acorde con la magnitud de la seríe, mientras que, por otra vertiente, flecos de temporadas pasadas encontrarán al fin respuesta.', 'img/p20.jpg', 'serie'),
(21, 'Capitana Marvel', 10.01, 'Ambientada en la década de 1990, "Capitana Marvel" de Marvel Studios es una aventura totalmente inédita de un período nunca visto en la historia del Universo Cinematográfico Marvel. La película cuenta la historia de Carol Danvers cuando se convierte en uno de los héroes más poderosos del universo. Una guerra galáctica entre dos razas alienígenas llega a la Tierra y Danvers y un pequeño grupo de aliados se ven atrapados en plena vorágine.', 'img/p21.jpg', 'pelicula'),
(22, 'Thor: Ragnarok', 11.99, 'Thor está preso al otro lado del universo sin su poderoso martillo y se enfrenta a una carrera contra el tiempo. Su objetivo es volver a Asgard y parar el Ragnarok porque significaría la destrucción de su planeta natal y el fin de la civilización Asgardiana a manos de una todopoderosa y nueva amenaza, la implacable Hela. Pero, primero deberá sobrevivir a una competición letal de gladiadores que lo enfrentará a su aliado y compañero en los Vengadores, ¡el Increíble Hulk!.', 'img/p22.jpg', 'pelicula'),
(23, 'Capitán América', 2.99, 'El Capitán América lidera la lucha por la libertad en esta superproducción repleta de acción y protagonizada por Chris Evans, como el arma definitiva contra el mal. Cuando una fuerza aterradora amenaza al planeta entero, el mejor soldado del mundo hace la guerra a la diabólica organización HYDRA, dirigida por el malvado Cráneo Rojo (Hogo Weaving, Matrix).', 'img/p23.jpg', 'pelicula'),
(24, 'Jumanji: Siguiente nivel', 12.99, 'La película de animación y aventuras de Jake Kasdan que te hará volver a tu infancia y acompañar a los protagonistas en sus mejores aventuras', 'img/p24.jpg', 'pelicula'),
(25, 'Frozen II', 18.99, 'La segunda parte de la gran aventura de estas dos hermanas en el reino del hielo.', 'img/p25.jpg', 'pelicula'),
(26, '1917', 23.99, 'El drama de Sam Mendes con el que podrás acompañar a los soldados a la guerra.', 'img/p26.jpg', 'pelicula'),
(27, 'El ascenso de Skywalker', 19.95, 'Y continua nuestra gran aventura con la historica saga de Star Wars', 'img/p27.jpg', 'pelicula'),
(28, 'Spider Man: Lejos de Casa', 9.99, '¿Habías olvidado ya las telarañas de Spider Man? Aquí viene una película de aventuras que te absorverá desde el primer momento.', 'img/p28.jpg', 'pelicula'),
(29, 'Bad Boys for life', 18.99, 'La gran comedia policiaca que te hará pasar un buen rato con tus seres queridos.', 'img/p29.jpg', 'pelicula'),
(30, 'Figura Amiibo Mario', 13.99, 'Continua la colección de super Mario y recopila todas las figuras!.', 'img/p30.jpg', 'merchandicing'),
(31, 'Figura Amiibo Smash Mewtow', 13.99, 'Continua esta gran colección de Nintendo, ¿Cuantas figuritas podrás conseguir....?.', 'img/p31.jpg', 'merchandicing'),
(32, 'Taza Gru Mi Villano Favorito 3', 8.79, 'Otra cosa más que tener en casa con temática minions! Que desayuno tan divertido!.', 'img/p32.jpg', 'merchandicing'),
(33, 'Taza Pokémon', 11.99, 'Otra cosa más que tener en casa con temática pokémon! que desayuno tan divertido!.', 'img/p33.jpg', 'merchandicing'),
(34, 'Taza Chewbacca', 8.79, 'Otra cosa más que tener en casa con temática Star Wars! Qué desayuno tan divertido!', 'img/p34.jpg', 'merchandicing'),
(35, 'Taza Picachu', 11.95, 'Otra cosa más que tener en casa con temática pokémon! que desayuno tan divertido!.', 'img/p35.png', 'merchandicing'),
(36, 'Funko Catwoman', 15.99, 'Amplía tu colección de funkos Funko-POP con esta figura de Catwoman.', 'img/p36.jpg', 'merchandicing'),
(37, 'Funko Batwoman', 15.99, 'Amplía tu colección de funkos Funko-POP con esta figura de Batwoman.', 'img/p37.jpg', 'merchandicing'),
(38, 'Funko Joe Mc Quack', 11.95, 'Amplía tu colección de funkos Funko-POP con esta figura de Disney.', 'img/p38.jpg', 'merchandicing'),
(39, 'Funko Gosalyn Mallard', 15.99, 'Amplía tu colección de funkos Funko-POP con esta figura de Disney.', 'img/p39.jpg', 'merchandicing'),
(40, 'Funko Heihachi', 15.99, 'Amplía tu colección de funkos Funko-POP con esta figura de Tekken.', 'img/p40.jpg', 'merchandicing'),
(41, 'Puñales por la espalda', 9.99, 'Disfruta de estos grandes actores en esta obre cinematográfica.', 'img/p41.jpg', 'pelicula'),
(42, 'El padrino', 18.99, 'Disfruta de este gran clásico cuando y donde quieras. Esta gran obra de arte disponible hoy para ti.', 'img/p42.jpg', 'pelicula'),
(43, 'Hook', 14.99, 'La versión de Peter Pan que ya no es para niños pequeños. Haz un viaje al pasado disfrutando de esta version para adultos de la famosa historia de Peter Pan.', 'img/p43.jpg', 'pelicula'),
(44, '¡Canta!', 8.99, 'Inicia a tus hijos en el amor por la música desde pequeños y ayúdales a desarrollar su imaginación acompañados de estos divertidos personajes.', 'img/p44.jpg', 'pelicula'),
(45, 'Jason Bourne', 29.99, 'La coleccion definitiva de las cinco peliculas en blu-ray.', 'img/p45.jpg', 'pelicula'),
(46, 'Fast&Furious:Hobbs & Shaw', 9.99, '¿Eres un amante de los coches y la adrenalina? No dejes pasar ni una sola película de la saga de Fast & Furious.', 'img/p46.jpg', 'pelicula'),
(47, 'Hotel Transilvania 3', 13.99, 'La tercera película de esta espectacular saga infantil que termina haciendo que todos amemos a los monstruos.', 'img/p47.jpg', 'pelicula'),
(48, 'La ciudad de las estrellas', 7.19, 'Romance, drama, comedia... Esta película lo tiene todo. Dejate envolver por su banda sonora.', 'img/p48.jpg', 'pelicula'),
(49, 'Los ángeles de Charlie', 12.99, 'Divertida película de aventuras con los tres personajes femeninos más conocidos de la historia.', 'img/p49.jpg', 'pelicula'),
(50, 'Zombieland 2', 13.99, 'La segunda parte de esta aventura espeluznante... Mata y Remata, en 4k Ultra HD.', 'img/p50.jpg', 'pelicula'),
(51, 'El reino caído', 14.95, 'Otro episodio más de la saga de Jurassic World, no te pierdas esta gran aventura!.', 'img/p51.jpg', 'pelicula'),
(52, 'Funda Iphone 6 Star Wars', 29.95, 'Si estás buscando una funda de Star Wars para tu móvil, ya la has encontrado!. Gran resistencia al calor y los líquidos.', 'img/funda.jpg', 'accesorio');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id`);
COMMIT;

ALTER TABLE `producto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
