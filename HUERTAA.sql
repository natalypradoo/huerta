CREATE DATABASE  IF NOT EXISTS `huerta` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `huerta`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: huerta
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comentario_hp`
--

DROP TABLE IF EXISTS `comentario_hp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario_hp` (
  `id_c_hp` int NOT NULL AUTO_INCREMENT,
  `id_hp` int NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('A','B') DEFAULT 'A',
  PRIMARY KEY (`id_c_hp`),
  UNIQUE KEY `id_c_hp_UNIQUE` (`id_c_hp`),
  KEY `fk_comentario-hp_huerta-planta1_idx` (`id_hp`),
  CONSTRAINT `fk_comentario-hp_huerta-planta1` FOREIGN KEY (`id_hp`) REFERENCES `huerta_planta` (`id_hp`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario_hp`
--

LOCK TABLES `comentario_hp` WRITE;
/*!40000 ALTER TABLE `comentario_hp` DISABLE KEYS */;
INSERT INTO `comentario_hp` VALUES (1,1,'las zanahoria crecieron solo 3 de 10 semillas','0000-00-00 00:00:00','A'),(2,1,'no crecio mas','2023-03-03 00:00:00','A'),(3,2,'Se murio 1 :(','2023-03-03 00:00:00','A'),(4,10,'lindo día','2023-03-03 13:00:00','A'),(5,10,'holi','2023-03-04 16:55:44','A'),(6,10,'holi','2023-03-04 16:00:00','A'),(7,10,'tuki','2023-03-04 16:00:00','A'),(8,10,'tuki2','2023-03-04 17:16:48','A'),(9,10,'tukituki','2023-03-04 17:21:37','A'),(10,10,'A','2023-03-04 19:13:52','A');
/*!40000 ALTER TABLE `comentario_hp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario_planta`
--

DROP TABLE IF EXISTS `comentario_planta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario_planta` (
  `id_pc` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_planta` int NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('A','B') DEFAULT 'A',
  PRIMARY KEY (`id_pc`),
  UNIQUE KEY `id_pc_UNIQUE` (`id_pc`),
  KEY `fk_planta-comentario_plantas1_idx` (`id_planta`),
  KEY `fk_planta-comentario_usuarios1_idx` (`id_usuario`),
  CONSTRAINT `fk_planta-comentario_plantas1` FOREIGN KEY (`id_planta`) REFERENCES `plantas` (`id_planta`),
  CONSTRAINT `fk_planta-comentario_usuarios1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario_planta`
--

LOCK TABLES `comentario_planta` WRITE;
/*!40000 ALTER TABLE `comentario_planta` DISABLE KEYS */;
INSERT INTO `comentario_planta` VALUES (1,1,1,'metodo de siembre: por voleo que consiste basicamente en tirar a lo largo del terreno las semillas','0000-00-00 00:00:00','A'),(2,2,1,'sdafdsf','2023-02-17 00:00:00','A'),(3,1,1,'no crece nada loko','2023-03-06 23:12:32','A');
/*!40000 ALTER TABLE `comentario_planta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huerta`
--

DROP TABLE IF EXISTS `huerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huerta` (
  `id_huerta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `estado` enum('A','B') DEFAULT 'A',
  PRIMARY KEY (`id_huerta`),
  UNIQUE KEY `id_huerta_UNIQUE` (`id_huerta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huerta`
--

LOCK TABLES `huerta` WRITE;
/*!40000 ALTER TABLE `huerta` DISABLE KEYS */;
INSERT INTO `huerta` VALUES (1,'La feliz','Posadas','A'),(2,':)','Oberá','A'),(3,'aa','Oberá','A'),(4,'undefined','undefined','A'),(5,'Casa2','Oberá','A'),(6,'Casajgvl','Oberá','A');
/*!40000 ALTER TABLE `huerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huerta_planta`
--

DROP TABLE IF EXISTS `huerta_planta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huerta_planta` (
  `id_hp` int NOT NULL AUTO_INCREMENT,
  `id_huerta` int NOT NULL,
  `id_planta` int NOT NULL,
  `cantidad` int NOT NULL,
  `fecha` date NOT NULL,
  `estado` enum('A','B') DEFAULT 'A',
  PRIMARY KEY (`id_hp`),
  UNIQUE KEY `id_hp_UNIQUE` (`id_hp`) /*!80000 INVISIBLE */,
  KEY `fk_huerta-planta_huerta1_idx` (`id_huerta`),
  KEY `fk_huerta-planta_plantas1_idx` (`id_planta`),
  CONSTRAINT `fk_huerta-planta_huerta1` FOREIGN KEY (`id_huerta`) REFERENCES `huerta` (`id_huerta`),
  CONSTRAINT `fk_huerta-planta_plantas1` FOREIGN KEY (`id_planta`) REFERENCES `plantas` (`id_planta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huerta_planta`
--

LOCK TABLES `huerta_planta` WRITE;
/*!40000 ALTER TABLE `huerta_planta` DISABLE KEYS */;
INSERT INTO `huerta_planta` VALUES (1,1,1,2,'2022-00-00','A'),(2,1,2,1,'2020-00-00','A'),(3,2,1,4,'0000-00-00','B'),(4,1,1,5,'2023-03-04','A'),(5,1,2,5,'2023-03-04','A'),(6,1,2,5,'2023-03-04','A'),(7,1,2,5,'2023-03-04','A'),(8,1,2,5,'2023-03-04','A'),(9,1,1,10,'2023-03-04','A'),(10,1,2,15,'2023-03-04','A');
/*!40000 ALTER TABLE `huerta_planta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `estado` enum('A','B') DEFAULT 'A',
  `contacto` enum('SI','NO') NOT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `id_persona_UNIQUE` (`id_persona`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Macrina','Avancini','1996-01-26 00:00:00','macrina@gmail.com','A','SI'),(2,'Nataly','Prado','2004-10-26 00:00:00','natalypradomoreno@gmail.com','A','NO'),(3,'Leonardo','Fernandez','2000-03-25 00:00:00','Lp@gmail.com','A','SI'),(4,'Pedro','Perez','1999-05-28 00:00:00','pedro@gmail.com','A','SI'),(5,'Pedro2','Perez2','1999-05-28 00:00:00','pedro2@gmail.com','A','SI'),(6,'Pedro','Perez3','1999-05-28 00:00:00','pedro3@gmail.com','A','SI'),(7,'Pedro','Perez4','1999-05-28 00:00:00','pedro4@gmail.com','A','SI'),(8,'Pedro','Perez5','1999-05-28 00:00:00','pedro5@gmail.com','A','SI'),(9,'Pedro','Perez6','1999-05-28 00:00:00','pedro6@gmail.com','A','SI'),(26,'Pedro','Perez13','1999-05-28 00:00:00','pedro13@gmail.com','A','SI'),(27,'Pedro','Perez14','1999-05-28 00:00:00','pedro14@gmail.com','A','SI'),(28,'Pedro','Perez16','1999-05-28 00:00:00','pedro16@gmail.com','A','SI'),(29,'Pedro','Perez17','1999-05-28 00:00:00','pedro17@gmail.com','A','SI'),(30,'Pedro','Perez18','1999-05-28 00:00:00','pedro18@gmail.com','A','SI'),(31,'Graciela','Graciela','2000-05-15 00:00:00','graciela@gmail.com','A','SI'),(32,'cacho','cacho','1999-05-06 00:00:00','cacho@gmail.co','A','NO'),(33,'ale','ale','1998-01-01 00:00:00','ale@gmail.com','A','NO'),(34,'tito','tito','1980-01-01 00:00:00','tito@gmail.com','A','SI'),(35,'aa','aaa','2020-02-01 00:00:00','aaa@gmail.com','A','SI'),(36,'ppp','ppp','1970-04-28 00:00:00','ppp@gmail.com','A','NO'),(37,'hhhadsf','fouhsadbfasadfsg','1980-01-30 00:00:00','hhh@gmail.com','A','NO'),(38,'ooo','ooo','1980-01-30 00:00:00','ooo@gmail.com','A','NO'),(39,'kkk','kkk','1980-01-30 00:00:00','kkk@gmail.com','A','SI'),(40,'Pedro','Perez18','1999-05-28 00:00:00','macrinAA@gmail.com','A','SI'),(41,'Pedro','Perez18','1999-05-28 00:00:00','m@gmail.com','A','SI'),(42,'Pedro','Perez18','1999-05-28 00:00:00','e@gmail.com','A','SI'),(43,'Pedro','Perez18','1999-05-28 00:00:00','ee@gmail.com','A','SI'),(44,'Pedro','Perez18','1999-05-28 00:00:00','eee@gmail.com','A','SI'),(47,'Pedro','Perez18','1999-05-28 00:00:00','eeee@gmail.com','A','SI'),(48,'Pedro','Perez18','1999-05-28 00:00:00','eeeee@gmail.com','A','SI'),(49,'Pedro','Perez18','1999-05-28 00:00:00','eeeeee@gmail.com','A','SI'),(50,'Pedro','Perez18','1999-05-28 00:00:00','eeeeeee@gmail.com','A','SI'),(51,'uuu','uuu','1980-01-30 00:00:00','uuu@gmail.com','A','SI'),(52,'DIOR','DIOR','2023-03-16 00:00:00','DIOR@gmail.com','A','NO');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantas`
--

DROP TABLE IF EXISTS `plantas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plantas` (
  `id_planta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  `epoca` enum('VERANO','OTOÑO','INVIERNO','PRIMAVERA') NOT NULL,
  `luna` varchar(45) DEFAULT NULL,
  `forma` enum('directa','germinación') NOT NULL,
  `estado` enum('A','B') DEFAULT 'A',
  PRIMARY KEY (`id_planta`),
  UNIQUE KEY `id_planta_UNIQUE` (`id_planta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantas`
--

LOCK TABLES `plantas` WRITE;
/*!40000 ALTER TABLE `plantas` DISABLE KEYS */;
INSERT INTO `plantas` VALUES (1,'zanahoria',NULL,'INVIERNO','Cuarto Menguante','directa','A'),(2,'Tomate','null','PRIMAVERA','Llena','directa','A'),(3,'Papas','con la papa','VERANO','Luna Menguante','directa','A'),(4,'Remolacha','wep','VERANO','Luna Menguante','directa','A'),(5,'Rabanos','','VERANO','Cuarto Menguante','directa','A'),(6,'Pitanga','','PRIMAVERA','Cuarto Menguante','directa','A');
/*!40000 ALTER TABLE `plantas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantas_usuarios`
--

DROP TABLE IF EXISTS `plantas_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plantas_usuarios` (
  `id_pu` int NOT NULL AUTO_INCREMENT,
  `id_planta` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_pu`),
  UNIQUE KEY `id_planta_UNIQUE` (`id_planta`),
  KEY `fk2_idx` (`id_usuario`),
  CONSTRAINT `fk1` FOREIGN KEY (`id_planta`) REFERENCES `plantas` (`id_planta`),
  CONSTRAINT `fk2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantas_usuarios`
--

LOCK TABLES `plantas_usuarios` WRITE;
/*!40000 ALTER TABLE `plantas_usuarios` DISABLE KEYS */;
INSERT INTO `plantas_usuarios` VALUES (1,1,1),(2,2,1),(3,3,2),(4,5,1);
/*!40000 ALTER TABLE `plantas_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_huerta`
--

DROP TABLE IF EXISTS `usuario_huerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_huerta` (
  `id_uh` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_huerta` int NOT NULL,
  `estado` enum('A','B') DEFAULT 'A',
  PRIMARY KEY (`id_uh`),
  UNIQUE KEY `id_uh_UNIQUE` (`id_uh`),
  KEY `fk_usuario-huerta_usuarios1_idx` (`id_usuario`),
  KEY `fk_usuario-huerta_huerta1_idx` (`id_huerta`),
  CONSTRAINT `fk_usuario-huerta_huerta1` FOREIGN KEY (`id_huerta`) REFERENCES `huerta` (`id_huerta`),
  CONSTRAINT `fk_usuario-huerta_usuarios1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_huerta`
--

LOCK TABLES `usuario_huerta` WRITE;
/*!40000 ALTER TABLE `usuario_huerta` DISABLE KEYS */;
INSERT INTO `usuario_huerta` VALUES (1,1,1,'A'),(2,1,2,'A'),(3,2,1,'A'),(4,2,2,'B'),(5,1,3,'A'),(7,1,5,'A'),(8,1,6,'A'),(9,2,1,'A');
/*!40000 ALTER TABLE `usuario_huerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_persona`
--

DROP TABLE IF EXISTS `usuario_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_persona` (
  `id_up` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_persona` int NOT NULL,
  `estado` enum('A','B') DEFAULT 'A',
  PRIMARY KEY (`id_up`),
  UNIQUE KEY `id_up_UNIQUE` (`id_usuario`),
  KEY `fk_usuario-persona_usuarios_idx` (`id_usuario`),
  KEY `fk_usuario-persona_personas1_idx` (`id_persona`),
  CONSTRAINT `fk_usuario-persona_personas1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  CONSTRAINT `fk_usuario-persona_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_persona`
--

LOCK TABLES `usuario_persona` WRITE;
/*!40000 ALTER TABLE `usuario_persona` DISABLE KEYS */;
INSERT INTO `usuario_persona` VALUES (1,1,1,'A'),(2,2,2,'A'),(3,3,3,'A'),(4,4,4,'A'),(5,5,5,'A'),(6,6,6,'A'),(7,7,7,'A'),(8,8,8,'A'),(9,9,9,'B'),(18,27,29,'A'),(19,28,30,'A'),(20,32,34,'A'),(21,33,35,'A'),(22,34,36,'A'),(23,35,37,'A'),(24,46,48,'A'),(25,47,49,'B'),(26,48,50,'B'),(27,49,51,'A'),(28,50,52,'A');
/*!40000 ALTER TABLE `usuario_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  `estado` enum('A','B') DEFAULT 'A',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'macrina','$2b$10$cW1lFF7s3k2/MkrhSwzvlOpxpgDqIgyx/asBTvl0eqNa7sFIb/I2m','A'),(2,'nataly','1234','A'),(3,'Leonardo','lp2','A'),(4,'Pedro','$2b$10$ouch2IEZcsrW2JijUAp/duhGoL293Uv6YiiaxQl1JVtGdWG6qZWu2','A'),(5,'Pedro2','$2b$10$cA2xWsF5llm/pi2wD/pEqeV3NO2nYkKYmfJ17dvcBy/m639wiiVSe','A'),(6,'Pedro3','$2b$10$uDHP4C772e1TPYcphuCgd.511fj7s0Dx1KlNExTsKswwM.PJZoOOe','A'),(7,'Pedro4','$2b$10$VcbgjO.jRUMvA/8Msl6nn.6gMxIoq/X53HyyGY4cIrf8X8.kJTinm','A'),(8,'Pedro5','$2b$10$P2G6/BesaXXmVBINp.XjGOUCfMWuCnibTbLq5kPYm5.glnytyrnQa','A'),(9,'Pedro6','$2b$10$fzfBS70d7HCi3wnXt1rQMO96x.s.CvH9aIr6HhbUUEV7pRKGp8rJm','A'),(18,'Pedro13','$2b$10$nPygKPw7eb8skhRK0Nwz7OyCNaK6iXGLmsmKc/dTdjDDN/ScPHzPq','A'),(20,'Pedro14','$2b$10$FV.k8X2SOoXater9Cg/DgelKn5eg9WlsSAdlb6V/RksheM8d8yZ8e','A'),(21,'Pedro15','$2b$10$SBBT81V0SdEfMNURQt2wP.XvWGbcnN4XB4wtMd0bqD0h0Tru5Doju','A'),(22,'Pedro16','$2b$10$vc0B6RPUVaot.Im3x9rZK.os.zWuCE8sp.3xEjXDsDri8aU1bk49i','A'),(27,'Pedro17','$2b$10$6CYJDIrYTEu/cmSkBj9sjObQlxdmFpP1npiZ.FXxabhs286zYaGUe','A'),(28,'Pedro18','$2b$10$peYddrU6x7gFl91H6UFWwO62ieyXlhHW9rbA3YNff5LMElozejm0q','A'),(29,'Graciela','$2b$10$DBtpOIW5y4qS.kK3lazwg.qDerpaEl2xSv1vFUhCHVSNu.Vb.BQyG','A'),(30,'Cacho','$2b$10$I6WAQpbva8FZuB2wT3UA.eHZDMVju7F8.ixx3EhcxJ.egaYNzlaYW','A'),(31,'ale','$2b$10$QT9ysSDU0JWuBP6P2LS4HOcQULajneyjMh6PwRegPcBYKNy0bT5RO','A'),(32,'titoO','$2b$10$XCr.p/0Ut8Fo1AbCvgB47O3S23rnti7t9JempFZOFQBzh4YNPW7n6','A'),(33,'aaa','$2b$10$aPelK0ISau9yVCehvHeY/uRHT6un6/j.PB861dRTRgFpxV54QxaFC','A'),(34,'ppp','$2b$10$ZbjXZ8w98o6aCukeLH0Wp.dLz0VhJqPxLjk601cRl9c51Tothg5.O','A'),(35,'hhh','$2b$10$Cun045d3gHZHoFqTEsVFT.AWu5xVY8xbfdggKJ1N5uMmIa8l0odWO','A'),(36,'ooo','$2b$10$8CXMj9iC9kRcxWlyb.lsB.Zu03fh/LGPFEIG5ToaFIMdNW7YR0jz.','A'),(37,'kkk','$2b$10$b0gdO6204neyWSd3JBwcD.AG51saUKZuTdnl/H0Cih6YxfnqS.4bG','A'),(38,'macrinAA','$2b$10$Mub2it2pj6eXjUlYFzT9z.1stR1r1B95XegQP4A2hgDWqpAYqoRyq','A'),(39,'m','$2b$10$HXA1BaSjCeDA.bq6PMxobesllo1lDmJLV3SV0Afd7RIw6QKLZEw.e','A'),(40,'e','$2b$10$HzGcw8Ziaw631SRnwCrX0ub3FIqg1Bav1P7i2qs34mvH/AinXgp7i','A'),(41,'ee','$2b$10$xoLAB2AAb7knLrDkJvfOVekgkcyml3QRDPbu73mEenrgELg0MU9.y','A'),(42,'eee','$2b$10$GWvRDEIdH9OT7ohAfzL9VuP7S5HEA01Fg8IOfCCvOBwd3H2mD5ltW','A'),(45,'eeee','$2b$10$2px3Sw9DJ1rBqrds/Jid4url91xuYVH0wMg/lgLlgqXOIAyOaRC0e','A'),(46,'eeeee','$2b$10$FMdwyQicGi0o7FuRXxNxXeIFkfOKUHocMBkMJZREgzxAt74Vm8N/.','A'),(47,'eeeeee','$2b$10$r9FEW9JrVs35nbXENiL8f.ueWeiSrXpKu8fEXMvq.JTvlcJVtm.fu','A'),(48,'eeeeeee','$2b$10$pxgIKcp0eH/C42pOanAJXu2mQ3yaP3Gt90tndm32d4Ks9aIY1/gyC','A'),(49,'uuu','$2b$10$0OmvqAVNn1mz9iYwwNqXPOSssgfFdXLeYsYeVyDNvQeQT0xpyttlW','A'),(50,'DIOR','$2b$10$UsUP7WqaiFab5bXjPqo3Ru3lUfZQbRNKanTFj7sUjTyyzRREfp3jS','A');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'huerta'
--

--
-- Dumping routines for database 'huerta'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-14 19:01:24
