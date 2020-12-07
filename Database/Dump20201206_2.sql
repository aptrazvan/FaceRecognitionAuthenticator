-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: bcr
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `carduri`
--

DROP TABLE IF EXISTS `carduri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carduri` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iban` varchar(24) NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  `card_no` int NOT NULL DEFAULT '1',
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `carduri_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `main` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carduri`
--

LOCK TABLES `carduri` WRITE;
/*!40000 ALTER TABLE `carduri` DISABLE KEYS */;
INSERT INTO `carduri` VALUES (1,'LPJAAORYAOQ65UCMRDUD',0,1,1),(2,'LYB240OQV5T44SL5N69A',0,1,2),(3,'J6A3JH6NFSUVVCCGEBTG',0,1,3),(4,'J6A3JH6NFSUVVCCGEBTG',0,2,3),(5,'KTUJ1FTOH8FA415XFAUF',0,1,4),(6,'LXIPMWF5VDWPR9ABI7EU',0,1,5),(7,'RZQPIEHKM6IBCXCN6ZJR',0,1,6),(8,'91AZ53XUS46EFL8DF2RD',0,1,7),(9,'91AZ53XUS46EFL8DF2RD',0,2,7),(10,'5OAZ53VUS46EFL8WV2RD',0,1,8),(11,'QP8B8TC1H4VFJVUJAOU6',0,1,9),(12,'6YFUFWRQCTJPRIFTGCRK',0,1,10),(13,'ORB6AHHROCIHVLIOLFM1',0,1,11);
/*!40000 ALTER TABLE `carduri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conturi`
--

DROP TABLE IF EXISTS `conturi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conturi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iban` varchar(24) NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `conturi_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `main` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conturi`
--

LOCK TABLES `conturi` WRITE;
/*!40000 ALTER TABLE `conturi` DISABLE KEYS */;
INSERT INTO `conturi` VALUES (1,'LPJAAORYAOQ65UCMRDUD',0,1),(2,'LYB240OQV5T44SL5N69A',0,2),(3,'J6A3JH6NFSUVVCCGEBTG',0,3),(4,'KTUJ1FTOH8FA415XFAUF',0,4),(5,'LXIPMWF5VDWPR9ABI7EU',0,5),(6,'RZQPIEHKM6IBCXCN6ZJR',0,6),(7,'91AZ53XUS46EFL8DF2RD',0,7),(8,'5OAZ53VUS46EFL8WV2RD',0,8),(9,'QP8B8TC1H4VFJVUJAOU6',0,9),(10,'6YFUFWRQCTJPRIFTGCRK',0,10),(11,'ORB6AHHROCIHVLIOLFM1',0,11);
/*!40000 ALTER TABLE `conturi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main`
--

DROP TABLE IF EXISTS `main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cnp` varchar(13) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `prenume` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main`
--

LOCK TABLES `main` WRITE;
/*!40000 ALTER TABLE `main` DISABLE KEYS */;
INSERT INTO `main` VALUES (1,'0521841849892','Celibidache','Costache'),(2,'1778708443593','Cristescu','Adi'),(3,'3993797864741','Celibidache','Iulia'),(4,'2656317617169','Tismaneanu','Valentin'),(5,'5780798294872','Paler','Iulio'),(6,'1781017431536','Bria','Alexandru-Bogdan'),(7,'2346707127615','Dobrescu','Georgiana'),(8,'7619712277202','Basescu','Traian'),(9,'7619712277202','Piturca','Livia'),(10,'9302362845354','Barbulescu','Sorin'),(11,'5671377732238','Georgescu','George');
/*!40000 ALTER TABLE `main` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-06  8:43:26
