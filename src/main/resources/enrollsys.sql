-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: enrollsys
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(300) DEFAULT NULL,
  `short_desc` text,
  `contents` longtext,
  `status` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Bachelor of Science Information Technology (BSIT)','This program focuses on computers and technology.It primarily aims to equipped students to the fast emerging needs of IT industry by instructing them on the principles of computer hardware and software components, algorithms, databases, telecommunications, user tactics, web developments, application testing, and computer graphics. Therefore, be well-prepared upon applying for IT support business processes.1','<p>This program focuses on computers and technology.It primarily aims to equipped students to the fast emerging needs of IT industry by instructing them on the principles of computer hardware and software components, algorithms, databases, telecommunications, user tactics, web developments, application testing, and computer graphics. Therefore, be well-prepared upon applying for IT support business processes.2</p>',1,'2024-06-28 17:44:04','2024-06-28 17:44:04'),(2,'Bachelor of Science in Office Administration (BSOA)','This four-year program course that prepares the students for a career in an outcome-focused, technology rich, professional environment. Courses in the curriculum are those that will thoroughly familiarize the students with current business setup, office administration practices and technology.','<p>This four-year program course that prepares the students for a career in an outcome-focused, technology rich, professional environment. Courses in the curriculum are those that will thoroughly familiarize the students with current business setup, office administration practices and technology.</p>',1,'2024-06-28 17:49:52','2024-06-28 17:49:52'),(3,'Certificate in Computer Sciences (CCS)',NULL,'<p>This two-year ladderized program under the Institute of Information and Communication Technology. It centers on information technoogy, database, and system aministration and maintenance.</p>',1,'2024-06-28 17:55:42','2024-06-28 17:55:42'),(4,'Certificate in Office Administration (COA)','This four-year program course that prepares the students for a career in an outcome-focused, technology rich, professional environment. Courses in the curriculum are those that will thoroughly familiarize the students with current business setup, office administration practices and technology.','<p>This four-year program course that prepares the students for a career in an outcome-focused, technology rich, professional environment. Courses in the curriculum are those that will thoroughly familiarize the students with current business setup, office administration practices and technology.</p>',1,'2024-06-28 17:56:57','2024-06-28 17:56:57'),(5,'Certificate in Hotel and Restaurant Management','This two-year non-degree program offering students a hands-on education on the administrative business aspects of restaurant management. It includes courses namely, food service cost control, sales in food service and calculations of food service operations. Therefore prepares the students to apply for a job in the food service, restaurant management and lodging industries.\r\n\r\n','<p>This two-year non-degree program offering students a hands-on education on the administrative business aspects of restaurant management. It includes courses namely, food service cost control, sales in food service and calculations of food service operations. Therefore prepares the students to apply for a job in the food service, restaurant management and lodging industries.</p>',1,'2024-06-28 18:06:10','2024-06-28 18:06:10'),(6,'testyy',NULL,'',0,'2024-06-28 18:06:56','2024-06-28 18:06:56'),(7,'testyyy',NULL,'',0,'2024-06-28 18:10:57','2024-06-28 18:10:57'),(8,'testyyyy1',NULL,'testyyyy1',0,'2024-06-28 18:19:23','2024-06-28 18:19:23'),(9,'testyyyy2',NULL,'<p>testyyyy2</p>',0,'2024-06-28 18:39:25','2024-06-28 18:39:25'),(10,'testcreate',NULL,'<p>testcreate</p>',0,'2024-06-28 19:20:46','2024-06-28 19:20:46'),(11,'testcreate1',NULL,'<p>testcreate1</p>',0,'2024-06-28 19:24:25','2024-06-28 19:24:25'),(12,'testcreate2',NULL,'<p>testcreate2testcreate2</p>',0,'2024-06-28 20:49:09','2024-06-28 20:49:09'),(13,'testcreatesubj','<p>testcreatecontent</p>','<p>testcreatecontent</p>',0,'2024-06-28 23:09:15','2024-06-28 23:09:15'),(14,'BSBA OM','<p>kmtolkf</p>','<p>kmtolkf</p>',0,'2024-06-30 15:20:02','2024-06-30 15:20:02');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `remarks` text,
  `status` tinyint NOT NULL,
  `processed_by` bigint DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,2,NULL,3,1,'2024-06-30 06:26:41','2024-06-30 06:26:41'),(2,2,2,NULL,2,1,'2024-06-30 06:30:21','2024-06-30 06:30:21'),(3,3,2,NULL,2,1,'2024-06-30 06:32:31','2024-06-30 06:32:31'),(4,4,2,NULL,2,1,'2024-06-30 06:37:15','2024-06-30 06:37:15'),(5,5,2,NULL,2,1,'2024-06-30 06:37:15','2024-06-30 06:37:15'),(6,1,4,NULL,2,NULL,'2024-06-30 15:11:43','2024-06-30 15:11:43'),(7,2,4,NULL,2,NULL,'2024-06-30 15:13:30','2024-06-30 15:13:30'),(8,3,5,NULL,3,1,'2024-06-30 15:35:01','2024-06-30 15:35:01');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `desc` text,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'pending',NULL,'2024-06-30 06:51:36','2024-06-30 06:51:36'),(2,'enrolled',NULL,'2024-06-30 06:51:36','2024-06-30 06:51:36'),(3,'denied',NULL,'2024-06-30 06:51:36','2024-06-30 06:51:36'),(4,'incomplete',NULL,'2024-06-30 06:51:36','2024-06-30 06:51:36'),(5,'complete',NULL,'2024-06-30 06:51:36','2024-06-30 06:51:36');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lname` varchar(300) NOT NULL,
  `fname` varchar(300) NOT NULL,
  `mname` varchar(300) NOT NULL,
  `home_addr` varchar(300) NOT NULL,
  `cell_no` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `user_type` varchar(300) NOT NULL,
  `status` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mariano','Kim Nomar','Varias','1','09876543212','admin@ptc.com','1234','Admin',1,'2024-06-29 20:11:52','2024-06-29 20:11:52'),(2,'Santos','Francis','Bonifacio','Taguig City','09154836673','Francis@ptc.com','123456789','Student',1,'2024-06-29 21:00:04','2024-06-29 21:00:04'),(3,'ong','crish','recuenco','Pasig City','09154836672','admin@ptc.com','1234','Student',1,'2024-06-30 15:07:25','2024-06-30 15:07:25'),(4,'ong','francis','santos','Taguig City','09876543212','crish@ptc.com','123','Student',1,'2024-06-30 15:10:17','2024-06-30 15:10:17'),(5,'Mariano','Kim Nomar','Varias','Taguig City','09876543212','mar@ptc.com','12345','Student',1,'2024-06-30 15:33:40','2024-06-30 15:33:40');
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

-- Dump completed on 2024-06-30 23:58:16
