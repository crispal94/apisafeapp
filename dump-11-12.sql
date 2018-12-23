-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: zkyguhere_apisafeapp
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_post` int(10) unsigned NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comentariouser` (`id_user`),
  KEY `fk_comentariopost` (`id_post`),
  CONSTRAINT `fk_comentariopost` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentariouser` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (4,1,4,'me gusta esto','2018-11-13 22:03:09','2018-11-13 22:03:09',NULL),(5,1,4,'me gusta esto y tu','2018-11-13 22:03:19','2018-11-13 22:03:19',NULL);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consejos`
--

DROP TABLE IF EXISTS `consejos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consejos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_estadoanimo` int(10) unsigned NOT NULL,
  `descripcion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consejos_id_estadoanimo_foreign` (`id_estadoanimo`),
  CONSTRAINT `consejos_id_estadoanimo_foreign` FOREIGN KEY (`id_estadoanimo`) REFERENCES `estadoanimo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consejos`
--

LOCK TABLES `consejos` WRITE;
/*!40000 ALTER TABLE `consejos` DISABLE KEYS */;
INSERT INTO `consejos` VALUES (1,1,'Se feliz y no toxica','2018-11-12 17:47:20',NULL,NULL),(2,2,'El enojo te consume por dentro y no te deja tranquilo','2018-11-12 17:49:10',NULL,NULL),(3,1,'Don\'t worry be happy','2018-11-12 18:15:40',NULL,NULL),(4,1,'Sonreir alimenta el alma :D','2018-11-12 18:15:40',NULL,NULL);
/*!40000 ALTER TABLE `consejos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoanimo`
--

DROP TABLE IF EXISTS `estadoanimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoanimo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoanimo`
--

LOCK TABLES `estadoanimo` WRITE;
/*!40000 ALTER TABLE `estadoanimo` DISABLE KEYS */;
INSERT INTO `estadoanimo` VALUES (1,'alegre','2018-11-06 17:12:34',NULL,NULL),(2,'enojo','2018-11-06 17:12:47',NULL,NULL);
/*!40000 ALTER TABLE `estadoanimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historias`
--

DROP TABLE IF EXISTS `historias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `secuencial_img` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `vigencia_inicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vigencia_fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_historiasuser` (`id_user`),
  CONSTRAINT `fk_historiasuser` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historias`
--

LOCK TABLES `historias` WRITE;
/*!40000 ALTER TABLE `historias` DISABLE KEYS */;
INSERT INTO `historias` VALUES (5,1,1,'C:\\xampp\\htdocs\\apisafeapp\\public\\img-historia\\12018-11-14.jpg','2018-11-15 17:03:35','2018-11-15 14:52:14','2018-11-14 23:52:14','2018-11-15 17:03:35','2018-11-15 17:03:35'),(6,1,2,'C:\\xampp\\htdocs\\apisafeapp\\public\\img-historia\\22018-11-14.jpg','2018-11-14 23:52:34','2018-11-15 23:52:34','2018-11-14 23:52:34','2018-11-14 23:52:34',NULL);
/*!40000 ALTER TABLE `historias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_referenciales` int(10) unsigned NOT NULL,
  `descripcion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secuencial_img` int(10) DEFAULT NULL,
  `id_user` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imagen_id_referenciales_foreign` (`id_referenciales`),
  KEY `fk_userimagen` (`id_user`),
  CONSTRAINT `fk_userimagen` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` VALUES (11,4,'post21.jpg',1,2,'2018-11-07 16:41:46','2018-11-07 16:41:46',NULL),(12,4,'post11.jpg',1,1,'2018-11-07 16:41:51','2018-11-07 16:41:51',NULL),(13,4,'post12.jpg',2,1,'2018-11-07 16:42:18','2018-11-07 16:42:18',NULL),(14,4,'post22.jpg',2,2,'2018-11-07 16:42:56','2018-11-07 16:42:56',NULL);
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interaccion`
--

DROP TABLE IF EXISTS `interaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interaccion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_post` int(10) unsigned NOT NULL,
  `id_referenciales` int(10) unsigned NOT NULL,
  `descripcion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interaccion_id_post_foreign` (`id_post`),
  KEY `interaccion_id_referenciales_foreign` (`id_referenciales`),
  CONSTRAINT `interaccion_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`),
  CONSTRAINT `interaccion_id_referenciales_foreign` FOREIGN KEY (`id_referenciales`) REFERENCES `referenciales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaccion`
--

LOCK TABLES `interaccion` WRITE;
/*!40000 ALTER TABLE `interaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `interaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (25,'2018_11_01_230531_create_tipo_referenciales_table',1),(26,'2018_11_01_230740_create_referenciales_table',1),(27,'2018_11_01_231619_create_imagen',1),(28,'2018_11_01_232119_create_users_table',1),(29,'2018_11_01_233136_create_estadoanimo_table',1),(30,'2018_11_01_233306_create_post_table',1),(31,'2018_11_01_233549_create_interaccion_table',1),(32,'2018_11_01_233955_create_seguidores_table',1),(33,'2018_11_01_234051_create_consejos_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_referenciales` int(10) unsigned NOT NULL,
  `id_imagen` int(10) unsigned DEFAULT NULL,
  `id_estadoanimo` int(10) unsigned NOT NULL,
  `descripcion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `est_comentario` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_user_foreign` (`id_user`),
  KEY `post_id_referenciales_foreign` (`id_referenciales`),
  KEY `post_id_estadoanimo_foreign` (`id_estadoanimo`),
  KEY `post_id_imagen_foreign` (`id_imagen`),
  CONSTRAINT `post_id_estadoanimo_foreign` FOREIGN KEY (`id_estadoanimo`) REFERENCES `estadoanimo` (`id`),
  CONSTRAINT `post_id_imagen_foreign` FOREIGN KEY (`id_imagen`) REFERENCES `imagen` (`id`),
  CONSTRAINT `post_id_referenciales_foreign` FOREIGN KEY (`id_referenciales`) REFERENCES `referenciales` (`id`),
  CONSTRAINT `post_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (4,2,3,11,1,'Hoy estoy feliz!!','1','2018-11-07 16:41:46','2018-11-07 16:41:46',NULL),(5,1,3,12,1,'Hoy estoy feliz!!','1','2018-11-07 16:41:51','2018-11-07 16:41:51',NULL),(6,1,3,13,1,'Hoy estoy feliz!! X2222','1','2018-11-07 16:42:18','2018-11-07 16:42:18',NULL),(7,2,3,14,1,'Hoy estoy feliz Y ME SIENTO EMOCIONADA','1','2018-11-07 16:42:56','2018-11-07 16:42:56',NULL),(11,3,1,NULL,1,'prueba postman uuuuhh','1','2018-12-11 05:46:58','2018-12-11 05:46:58',NULL),(13,3,1,NULL,1,'sdfsdfsddfsfg','1','2018-12-11 05:55:11','2018-12-11 05:55:11',NULL),(14,3,1,NULL,1,'prueba de post ','1','2018-12-11 15:35:05','2018-12-11 15:35:05',NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reaccion`
--

DROP TABLE IF EXISTS `reaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reaccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_post` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reaccionpost` (`id_post`),
  KEY `fk_reaccionuser` (`id_user`),
  CONSTRAINT `fk_reaccionpost` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reaccionuser` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reaccion`
--

LOCK TABLES `reaccion` WRITE;
/*!40000 ALTER TABLE `reaccion` DISABLE KEYS */;
INSERT INTO `reaccion` VALUES (1,1,4,'2018-11-13 22:14:17','2018-11-13 22:14:17',NULL),(2,1,4,'2018-11-13 22:14:21','2018-11-13 22:14:21',NULL),(3,1,4,'2018-11-13 22:14:22','2018-11-13 22:14:22',NULL);
/*!40000 ALTER TABLE `reaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referenciales`
--

DROP TABLE IF EXISTS `referenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referenciales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo` int(10) unsigned NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `referenciales_id_tipo_foreign` (`id_tipo`),
  CONSTRAINT `referenciales_id_tipo_foreign` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_referenciales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referenciales`
--

LOCK TABLES `referenciales` WRITE;
/*!40000 ALTER TABLE `referenciales` DISABLE KEYS */;
INSERT INTO `referenciales` VALUES (1,1,'texto','2018-11-06 17:10:47',NULL,NULL),(2,1,'imagen','2018-11-06 17:11:10',NULL,NULL),(3,1,'texto/imagen','2018-11-06 17:17:27',NULL,NULL),(4,2,'imagen-post','2018-11-06 17:46:02',NULL,NULL);
/*!40000 ALTER TABLE `referenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguidores`
--

DROP TABLE IF EXISTS `seguidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguidores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user_padre` int(11) NOT NULL,
  `id_user_seguidor` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguidores`
--

LOCK TABLES `seguidores` WRITE;
/*!40000 ALTER TABLE `seguidores` DISABLE KEYS */;
INSERT INTO `seguidores` VALUES (1,1,1,'2018-11-13 18:35:58','2018-11-13 18:35:58',NULL);
/*!40000 ALTER TABLE `seguidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_referenciales`
--

DROP TABLE IF EXISTS `tipo_referenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_referenciales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_referenciales`
--

LOCK TABLES `tipo_referenciales` WRITE;
/*!40000 ALTER TABLE `tipo_referenciales` DISABLE KEYS */;
INSERT INTO `tipo_referenciales` VALUES (1,'general-post','2018-11-06 17:07:07',NULL,NULL),(2,'general-imagen','2018-11-06 17:45:25',NULL,NULL);
/*!40000 ALTER TABLE `tipo_referenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_imagen` int(10) unsigned DEFAULT NULL,
  `nombres` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_id_imagen_foreign` (`id_imagen`),
  CONSTRAINT `users_id_imagen_foreign` FOREIGN KEY (`id_imagen`) REFERENCES `imagen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Christian Andres','Palacios Menendez','F','$2y$10$eBbelvdO6lkwmcOOzvHtReze29Eu1PUwm8MtFYpXV.DALUOr0VsOa','94205497d9c6b851365e23d2997d4b7eab66269f','crispal94','crispal94@hotmail.com',2189212,NULL,'2018-11-04 19:11:53','2018-11-05 00:39:51',NULL),(2,NULL,'Domenica Anahi','Palacios Menendez','F','$2y$10$5zk5JaBYYtfbJGakrO5tI.FhVI/sl33lEpfRoc8sU.nnozlsN5T6C','48c3a9183c219cdcb13fc35fe8a3a56a79893e5f','dome06','domenipal06@hotmail.com',2189212,NULL,'2018-11-05 20:19:05','2018-12-02 18:29:03',NULL),(3,NULL,'cris','ramirez','F','$2y$10$DZgE/jS34RB9tuC84LPmWOGjEjeZu3pwlgWWikiXVutWlDGQa0b3S','2eeb0c813dd16e19651ecf958c76446ccb39e8c6','rebekrs92','rebekris92@gmail.com',2427078,NULL,'2018-12-03 23:32:02','2018-12-11 01:05:27',NULL),(4,NULL,'Carlos','Leon','F','$2y$10$08wJY5GcJ24sCqsgz3LbLec2.oKhrL39.tbJv5Az5NS1rY3d9i5hO','307fa9ef478ffa6bec13cbf8bef7b14570e9c2f1','CarlosLeon12','carlosleon@gmail.com',2427078,NULL,'2018-12-04 00:01:48','2018-12-04 00:04:58',NULL),(5,NULL,'Carlos','León','F','$2y$10$Tu5YmzcpMc9yHgyXaI5.Su3zc3wPqCwV6dbKZgVuePegFO7JKR2By','46cb8a6d446d5ceebdf96d8addb44e8677a9f60b','CarlosLeon123','carlosleon@espol.com',2332233,NULL,'2018-12-04 00:33:14','2018-12-04 00:34:42',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-11 12:02:53
