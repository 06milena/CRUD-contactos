/ *! 40101 ESTABLECER NOMBRES utf8 * /;
/ *! 40014 SET FOREIGN_KEY_CHECKS = 0 * /;
/ *! 40101 SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' * /;
/ *! 40111 SET SQL_NOTES = 0 * /;
CREAR BASE DE DATOS / *! 32312 SI NO EXISTE * / blog / *! 40100 CONJUNTO DE CARACTERES POR DEFECTO utf8mb4 * /;
USE blog;

DROP TABLE SI EXISTE categorias;
CREAR TABLA `categorias` (
  `id` int (11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar (255) NOT NULL,
  CLAVE PRIMARIA (`id`)
) MOTOR = JUEGO DE CARTOS POR DEFECTO InnoDB = utf8mb4;

DROP TABLE SI EXISTE comentarios;
CREAR TABLA `comentarios` (
  `id` int (11) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int (11) unsigned NOT NULL,
  `comentario_id` int (11) unsigned DEFAULT NULL,
  `publicacion_id` int (11) unsigned NOT NULL,
  `comentario` varchar (255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp () ON UPDATE current_timestamp (),
  CLAVE PRIMARIA (`id`),
  CLAVE `fk_comentarios_usuarios` (` usuario_id`),
  CLAVE `fk_publicaciones_comentarios` (` publicacion_id`),
  CLAVE `fk_comentarios_comentarios` (` comentario_id`),
  CONSTRAINT `fk_comentarios_comentarios` CLAVE EXTRANJERA (` comentario_id`) REFERENCIAS `comentarios` (` id`),
  RESTRICCIÓN `fk_comentarios_usuarios` LLAVE EXTRANJERA (` usuario_id`) REFERENCIAS `usuarios` (` id`),
  RESTRICCIÓN `fk_publicaciones_comentarios` CLAVE EXTRANJERA (` publicacion_id`) REFERENCIAS `publicaciones` (` id`)
) MOTOR = JUEGO DE CARTOS POR DEFECTO InnoDB = utf8mb4;

DROP TABLE SI EXISTE publicaciones;
CREAR TABLA `publicaciones` (
  `id` int (11) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int (11) unsigned NOT NULL,
  `categoria_id` int (11) unsigned NOT NULL,
  `titulo` varchar (255) NOT NULL,
  `cuerpo` texto NO NULO,
  `imagen` varchar (255) DEFAULT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp () ON UPDATE current_timestamp (),
  CLAVE PRIMARIA (`id`),
  CLAVE `fk_usuarios_publicaciones` (` usuario_id`),
  CLAVE `fk_categorias_publicaciones` (` categoria_id`),
  RESTRICCIÓN `fk_categorias_publicaciones` LLAVE EXTRANJERA (` categoria_id`) REFERENCIAS `categorias` (` id`),
  RESTRICCIÓN `fk_usuarios_publicaciones` CLAVE EXTRANJERA (` usuario_id`) REFERENCIAS `usuarios` (` id`)
) MOTOR = JUEGO DE CARTOS POR DEFECTO InnoDB = utf8mb4;

DROP TABLE SI EXISTE usuarios;
CREAR TABLA `usuarios` (
  `id` int (11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar (50) NOT NULL,
  `email` varchar (50) NOT NULL,
  `contrasena` varchar (50) NOT NULL,
  CLAVE PRIMARIA (`id`),
  CLAVE ÚNICA `email` (` email`)
) MOTOR = InnoDB AUTO_INCREMENT = 8 CARSET POR DEFECTO = utf8mb4;