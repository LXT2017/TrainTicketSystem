
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: train
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `train`
--
drop database if exists `train`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `train` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `train`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123456');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `holiday` (
  `vacation` date NOT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`vacation`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday`
--

LOCK TABLES `holiday` WRITE;
/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;
INSERT INTO `holiday` VALUES ('2020-07-01',2),('2020-07-07',2);
/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
/*!50001 DROP VIEW IF EXISTS `orderinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `orderinfo` AS SELECT 
 1 AS `id`,
 1 AS `idcard`,
 1 AS `realname`,
 1 AS `seattype`,
 1 AS `status`,
 1 AS `carriage`,
 1 AS `seat`,
 1 AS `traindate`,
 1 AS `createtime`,
 1 AS `trainname`,
 1 AS `trainid`,
 1 AS `price`,
 1 AS `order_id`,
 1 AS `duration`,
 1 AS `startcity`,
 1 AS `starttime`,
 1 AS `endcity`,
 1 AS `endtime`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `status` int(2) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `traindate` date DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  `train_id` int(20) DEFAULT NULL,
  `seattype` int(2) DEFAULT NULL,
  `carriage` int(3) DEFAULT NULL,
  `seat` varchar(10) DEFAULT NULL,
  `order_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `train_id` (`train_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1100000039 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1100000013,3,15.00,'2020-06-28','2020-06-28 15:55:11',3,7,2,2,'01B',1),(1100000014,3,30.00,'2020-06-28','2020-06-28 15:55:17',4,7,1,1,'01A',1),(1100000036,4,21.00,'2020-07-07','2020-07-03 15:26:50',2,9,1,1,'01B',1),(1100000037,4,30.00,'2020-07-10','2020-07-03 15:37:03',2,2,1,1,'01A',1),(1100000038,5,38.50,'2020-07-10','2020-07-03 15:37:56',4,2,1,1,'01B',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderseat`
--

DROP TABLE IF EXISTS `orderseat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderseat` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `status` int(2) DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  `train_id` int(20) DEFAULT NULL,
  `seat_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `train_id` (`train_id`),
  KEY `seat_id` (`seat_id`),
  CONSTRAINT `orderseat_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`),
  CONSTRAINT `orderseat_ibfk_2` FOREIGN KEY (`seat_id`) REFERENCES `trainseat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderseat`
--

LOCK TABLES `orderseat` WRITE;
/*!40000 ALTER TABLE `orderseat` DISABLE KEYS */;
INSERT INTO `orderseat` VALUES (1,1,'2020-06-03',1,1),(2,0,'2020-06-24',1,2),(3,1,'2020-06-24',1,3),(4,0,'2020-06-24',1,4),(5,0,'2020-06-24',1,1),(6,0,'2020-06-12',1,1),(7,0,'2020-06-12',1,2),(8,0,'2020-06-12',1,3),(9,0,'2020-06-12',1,4),(10,0,'2020-06-12',1,5),(11,0,'2020-06-12',1,6),(12,0,'2020-06-12',1,7),(13,0,'2020-06-12',1,8),(14,0,'2020-06-12',1,9),(15,0,'2020-06-12',1,10),(16,0,'2020-06-12',1,11),(17,0,'2020-06-12',1,12),(18,0,'2020-06-12',1,13),(19,0,'2020-06-12',1,14),(20,0,'2020-06-12',1,15),(21,0,'2020-06-12',1,16),(22,0,'2020-06-12',1,17),(23,0,'2020-06-12',1,18),(24,0,'2020-06-12',1,19),(25,0,'2020-06-12',1,20),(26,0,'2020-06-13',1,1),(27,0,'2020-06-13',1,2),(28,0,'2020-06-13',1,3),(29,0,'2020-06-13',1,4),(30,0,'2020-06-13',1,5),(31,0,'2020-06-13',1,6),(32,0,'2020-06-13',1,7),(33,0,'2020-06-13',1,8),(34,0,'2020-06-13',1,9),(35,0,'2020-06-13',1,10),(36,0,'2020-06-13',1,11),(37,0,'2020-06-13',1,12),(38,0,'2020-06-13',1,13),(39,0,'2020-06-13',1,14),(40,0,'2020-06-13',1,15),(41,0,'2020-06-13',1,16),(42,0,'2020-06-13',1,17),(43,0,'2020-06-13',1,18),(44,0,'2020-06-13',1,19),(45,0,'2020-06-13',1,20),(46,1,'2020-06-15',2,42),(47,1,'2020-06-15',2,43),(48,1,'2020-06-15',2,44),(49,1,'2020-06-15',2,45),(50,1,'2020-06-15',2,46),(51,1,'2020-06-15',2,47),(52,1,'2020-06-15',2,48),(53,1,'2020-06-15',2,49),(54,1,'2020-06-15',2,50),(55,1,'2020-06-15',2,51),(56,1,'2020-06-15',2,52),(57,1,'2020-06-15',2,53),(58,1,'2020-06-15',2,54),(59,1,'2020-06-15',2,55),(60,1,'2020-06-15',2,56),(61,1,'2020-06-15',2,57),(62,1,'2020-06-15',2,58),(63,1,'2020-06-15',2,59),(64,1,'2020-06-15',2,60),(65,1,'2020-06-15',2,61),(66,1,'2020-06-15',3,62),(67,1,'2020-06-15',3,63),(68,1,'2020-06-15',3,64),(69,1,'2020-06-15',3,65),(70,1,'2020-06-15',3,66),(71,1,'2020-06-15',3,67),(72,1,'2020-06-15',3,68),(73,1,'2020-06-15',3,69),(74,1,'2020-06-15',3,70),(75,1,'2020-06-15',3,71),(76,1,'2020-06-15',3,72),(77,1,'2020-06-15',3,73),(78,1,'2020-06-15',3,74),(79,1,'2020-06-15',3,75),(80,1,'2020-06-15',3,76),(81,1,'2020-06-15',3,77),(82,1,'2020-06-15',3,78),(83,1,'2020-06-15',3,79),(84,1,'2020-06-15',3,80),(85,1,'2020-06-15',3,81),(86,1,'2020-06-16',2,42),(87,1,'2020-06-16',2,43),(88,1,'2020-06-16',2,44),(89,1,'2020-06-16',2,45),(90,1,'2020-06-16',2,46),(91,1,'2020-06-16',2,47),(92,1,'2020-06-16',2,48),(93,1,'2020-06-16',2,49),(94,1,'2020-06-16',2,50),(95,1,'2020-06-16',2,51),(96,1,'2020-06-16',2,52),(97,1,'2020-06-16',2,53),(98,1,'2020-06-16',2,54),(99,1,'2020-06-16',2,55),(100,1,'2020-06-16',2,56),(101,1,'2020-06-16',2,57),(102,1,'2020-06-16',2,58),(103,1,'2020-06-16',2,59),(104,1,'2020-06-16',2,60),(105,1,'2020-06-16',2,61),(106,1,'2020-06-16',3,62),(107,1,'2020-06-16',3,63),(108,1,'2020-06-16',3,64),(109,1,'2020-06-16',3,65),(110,1,'2020-06-16',3,66),(111,1,'2020-06-16',3,67),(112,1,'2020-06-16',3,68),(113,1,'2020-06-16',3,69),(114,1,'2020-06-16',3,70),(115,1,'2020-06-16',3,71),(116,1,'2020-06-16',3,72),(117,1,'2020-06-16',3,73),(118,1,'2020-06-16',3,74),(119,1,'2020-06-16',3,75),(120,1,'2020-06-16',3,76),(121,1,'2020-06-16',3,77),(122,1,'2020-06-16',3,78),(123,1,'2020-06-16',3,79),(124,1,'2020-06-16',3,80),(125,1,'2020-06-16',3,81),(126,1,'2020-06-23',2,42),(127,1,'2020-06-23',2,43),(128,1,'2020-06-23',2,44),(129,1,'2020-06-23',2,45),(130,1,'2020-06-23',2,46),(131,1,'2020-06-23',2,47),(132,1,'2020-06-23',2,48),(133,1,'2020-06-23',2,49),(134,1,'2020-06-23',2,50),(135,1,'2020-06-23',2,51),(136,1,'2020-06-23',2,52),(137,1,'2020-06-23',2,53),(138,1,'2020-06-23',2,54),(139,1,'2020-06-23',2,55),(140,1,'2020-06-23',2,56),(141,1,'2020-06-23',2,57),(142,1,'2020-06-23',2,58),(143,1,'2020-06-23',2,59),(144,1,'2020-06-23',2,60),(145,1,'2020-06-23',2,61),(146,1,'2020-06-23',3,62),(147,1,'2020-06-23',3,63),(148,1,'2020-06-23',3,64),(149,1,'2020-06-23',3,65),(150,1,'2020-06-23',3,66),(151,1,'2020-06-23',3,67),(152,1,'2020-06-23',3,68),(153,1,'2020-06-23',3,69),(154,1,'2020-06-23',3,70),(155,1,'2020-06-23',3,71),(156,1,'2020-06-23',3,72),(157,1,'2020-06-23',3,73),(158,1,'2020-06-23',3,74),(159,1,'2020-06-23',3,75),(160,1,'2020-06-23',3,76),(161,1,'2020-06-23',3,77),(162,1,'2020-06-23',3,78),(163,1,'2020-06-23',3,79),(164,1,'2020-06-23',3,80),(165,1,'2020-06-23',3,81),(166,0,'2020-06-26',3,62),(167,0,'2020-06-26',3,63),(168,0,'2020-06-26',3,64),(169,0,'2020-06-26',3,65),(170,0,'2020-06-26',3,66),(171,0,'2020-06-26',3,67),(172,0,'2020-06-26',3,68),(173,0,'2020-06-26',3,69),(174,0,'2020-06-26',3,70),(175,0,'2020-06-26',3,71),(176,0,'2020-06-26',3,72),(177,0,'2020-06-26',3,73),(178,0,'2020-06-26',3,74),(179,0,'2020-06-26',3,75),(180,0,'2020-06-26',3,76),(181,0,'2020-06-26',3,77),(182,0,'2020-06-26',3,78),(183,0,'2020-06-26',3,79),(184,0,'2020-06-26',3,80),(185,0,'2020-06-26',3,81),(246,0,'2020-06-28',5,102),(247,0,'2020-06-28',5,103),(248,0,'2020-06-28',5,104),(249,0,'2020-06-28',5,105),(250,0,'2020-06-28',5,106),(251,0,'2020-06-28',5,107),(252,0,'2020-06-28',5,108),(253,0,'2020-06-28',5,109),(254,0,'2020-06-28',5,110),(255,0,'2020-06-28',5,111),(256,0,'2020-06-28',5,112),(257,0,'2020-06-28',5,113),(258,0,'2020-06-28',5,114),(259,0,'2020-06-28',5,115),(260,0,'2020-06-28',5,116),(261,0,'2020-06-28',5,117),(262,0,'2020-06-28',5,118),(263,0,'2020-06-28',5,119),(264,0,'2020-06-28',5,120),(265,0,'2020-06-28',5,121),(266,0,'2020-06-28',8,162),(267,0,'2020-06-28',8,163),(268,0,'2020-06-28',8,164),(269,0,'2020-06-28',8,165),(270,0,'2020-06-28',8,166),(271,0,'2020-06-28',8,167),(272,0,'2020-06-28',8,168),(273,0,'2020-06-28',8,169),(274,0,'2020-06-28',8,170),(275,0,'2020-06-28',8,171),(276,0,'2020-06-28',8,172),(277,0,'2020-06-28',8,173),(278,0,'2020-06-28',8,174),(279,0,'2020-06-28',8,175),(280,0,'2020-06-28',8,176),(281,0,'2020-06-28',8,177),(282,0,'2020-06-28',8,178),(283,0,'2020-06-28',8,179),(284,0,'2020-06-28',8,180),(285,0,'2020-06-28',8,181),(286,0,'2020-06-28',9,182),(287,0,'2020-06-28',9,183),(288,0,'2020-06-28',9,184),(289,0,'2020-06-28',9,185),(290,0,'2020-06-28',9,186),(291,0,'2020-06-28',9,187),(292,0,'2020-06-28',9,188),(293,0,'2020-06-28',9,189),(294,0,'2020-06-28',9,190),(295,0,'2020-06-28',9,191),(296,0,'2020-06-28',9,192),(297,0,'2020-06-28',9,193),(298,0,'2020-06-28',9,194),(299,0,'2020-06-28',9,195),(300,0,'2020-06-28',9,196),(301,0,'2020-06-28',9,197),(302,0,'2020-06-28',9,198),(303,0,'2020-06-28',9,199),(304,0,'2020-06-28',9,200),(305,0,'2020-06-28',9,201),(306,1,'2020-06-28',7,142),(307,0,'2020-06-28',7,143),(308,0,'2020-06-28',7,144),(309,0,'2020-06-28',7,145),(310,0,'2020-06-28',7,146),(311,0,'2020-06-28',7,147),(312,0,'2020-06-28',7,148),(313,0,'2020-06-28',7,149),(314,0,'2020-06-28',7,150),(315,0,'2020-06-28',7,151),(316,0,'2020-06-28',7,152),(317,1,'2020-06-28',7,153),(318,0,'2020-06-28',7,154),(319,0,'2020-06-28',7,155),(320,0,'2020-06-28',7,156),(321,0,'2020-06-28',7,157),(322,0,'2020-06-28',7,158),(323,0,'2020-06-28',7,159),(324,0,'2020-06-28',7,160),(325,0,'2020-06-28',7,161),(366,0,'2020-07-07',1,1),(367,0,'2020-07-07',1,2),(368,0,'2020-07-07',1,3),(369,0,'2020-07-07',1,4),(370,0,'2020-07-07',1,5),(371,0,'2020-07-07',1,6),(372,0,'2020-07-07',1,7),(373,0,'2020-07-07',1,8),(374,0,'2020-07-07',1,9),(375,0,'2020-07-07',1,10),(376,0,'2020-07-07',1,11),(377,0,'2020-07-07',1,12),(378,0,'2020-07-07',1,13),(379,0,'2020-07-07',1,14),(380,0,'2020-07-07',1,15),(381,0,'2020-07-07',1,16),(382,0,'2020-07-07',1,17),(383,0,'2020-07-07',1,18),(384,0,'2020-07-07',1,19),(385,0,'2020-07-07',1,20),(387,1,'2020-07-07',2,43),(388,1,'2020-07-07',2,44),(389,0,'2020-07-07',2,45),(390,0,'2020-07-07',2,46),(391,0,'2020-07-07',2,47),(392,0,'2020-07-07',2,48),(393,0,'2020-07-07',2,49),(394,0,'2020-07-07',2,50),(395,0,'2020-07-07',2,51),(396,0,'2020-07-07',2,52),(397,0,'2020-07-07',2,53),(398,0,'2020-07-07',2,54),(399,0,'2020-07-07',2,55),(400,0,'2020-07-07',2,56),(401,0,'2020-07-07',2,57),(402,0,'2020-07-07',2,58),(403,0,'2020-07-07',2,59),(404,0,'2020-07-07',2,60),(405,0,'2020-07-07',2,61),(406,1,'2020-07-07',3,63),(408,1,'2020-07-07',3,64),(409,1,'2020-07-07',3,65),(410,1,'2020-07-07',3,66),(411,0,'2020-07-07',3,67),(412,0,'2020-07-07',3,68),(413,0,'2020-07-07',3,69),(414,0,'2020-07-07',3,70),(415,0,'2020-07-07',3,71),(416,0,'2020-07-07',3,72),(417,0,'2020-07-07',3,73),(418,0,'2020-07-07',3,74),(419,0,'2020-07-07',3,75),(420,0,'2020-07-07',3,76),(421,0,'2020-07-07',3,77),(422,0,'2020-07-07',3,78),(423,0,'2020-07-07',3,79),(424,0,'2020-07-07',3,80),(425,0,'2020-07-07',3,81),(426,0,'2020-07-07',4,82),(427,0,'2020-07-07',4,83),(428,0,'2020-07-07',4,84),(429,0,'2020-07-07',4,85),(430,0,'2020-07-07',4,86),(431,0,'2020-07-07',4,87),(432,0,'2020-07-07',4,88),(433,0,'2020-07-07',4,89),(434,0,'2020-07-07',4,90),(435,0,'2020-07-07',4,91),(436,0,'2020-07-07',4,92),(437,0,'2020-07-07',4,93),(438,0,'2020-07-07',4,94),(439,0,'2020-07-07',4,95),(440,0,'2020-07-07',4,96),(441,0,'2020-07-07',4,97),(442,0,'2020-07-07',4,98),(443,0,'2020-07-07',4,99),(444,0,'2020-07-07',4,100),(445,0,'2020-07-07',4,101),(446,0,'2020-07-07',5,102),(447,0,'2020-07-07',5,103),(448,0,'2020-07-07',5,104),(449,0,'2020-07-07',5,105),(450,0,'2020-07-07',5,106),(451,0,'2020-07-07',5,107),(452,0,'2020-07-07',5,108),(453,0,'2020-07-07',5,109),(454,0,'2020-07-07',5,110),(455,0,'2020-07-07',5,111),(456,0,'2020-07-07',5,112),(457,0,'2020-07-07',5,113),(458,0,'2020-07-07',5,114),(459,0,'2020-07-07',5,115),(460,0,'2020-07-07',5,116),(461,0,'2020-07-07',5,117),(462,0,'2020-07-07',5,118),(463,0,'2020-07-07',5,119),(464,0,'2020-07-07',5,120),(465,0,'2020-07-07',5,121),(466,0,'2020-07-07',6,122),(467,0,'2020-07-07',6,123),(468,0,'2020-07-07',6,124),(469,0,'2020-07-07',6,125),(470,0,'2020-07-07',6,126),(471,0,'2020-07-07',6,127),(472,0,'2020-07-07',6,128),(473,0,'2020-07-07',6,129),(474,0,'2020-07-07',6,130),(475,0,'2020-07-07',6,131),(476,0,'2020-07-07',6,132),(477,0,'2020-07-07',6,133),(478,0,'2020-07-07',6,134),(479,0,'2020-07-07',6,135),(480,0,'2020-07-07',6,136),(481,0,'2020-07-07',6,137),(482,0,'2020-07-07',6,138),(483,0,'2020-07-07',6,139),(484,0,'2020-07-07',6,140),(485,0,'2020-07-07',6,141),(488,1,'2020-07-07',7,144),(489,0,'2020-07-07',7,145),(490,0,'2020-07-07',7,146),(491,0,'2020-07-07',7,147),(492,0,'2020-07-07',7,148),(493,0,'2020-07-07',7,149),(494,0,'2020-07-07',7,150),(495,0,'2020-07-07',7,151),(496,0,'2020-07-07',7,152),(497,0,'2020-07-07',7,153),(498,0,'2020-07-07',7,154),(499,0,'2020-07-07',7,155),(500,0,'2020-07-07',7,156),(501,0,'2020-07-07',7,157),(502,0,'2020-07-07',7,158),(503,0,'2020-07-07',7,159),(504,0,'2020-07-07',7,160),(505,0,'2020-07-07',7,161),(506,0,'2020-07-07',8,162),(507,0,'2020-07-07',8,163),(508,0,'2020-07-07',8,164),(509,0,'2020-07-07',8,165),(510,0,'2020-07-07',8,166),(511,0,'2020-07-07',8,167),(512,0,'2020-07-07',8,168),(513,0,'2020-07-07',8,169),(514,0,'2020-07-07',8,170),(515,0,'2020-07-07',8,171),(516,0,'2020-07-07',8,172),(517,0,'2020-07-07',8,173),(518,0,'2020-07-07',8,174),(519,0,'2020-07-07',8,175),(520,0,'2020-07-07',8,176),(521,0,'2020-07-07',8,177),(522,0,'2020-07-07',8,178),(523,0,'2020-07-07',8,179),(524,0,'2020-07-07',8,180),(525,0,'2020-07-07',8,181),(526,0,'2020-07-07',9,182),(527,0,'2020-07-07',9,183),(528,0,'2020-07-07',9,184),(529,0,'2020-07-07',9,185),(530,0,'2020-07-07',9,186),(531,0,'2020-07-07',9,187),(532,0,'2020-07-07',9,188),(533,0,'2020-07-07',9,189),(534,0,'2020-07-07',9,190),(535,0,'2020-07-07',9,191),(536,0,'2020-07-07',9,192),(537,0,'2020-07-07',9,193),(538,0,'2020-07-07',9,194),(539,0,'2020-07-07',9,195),(540,0,'2020-07-07',9,196),(541,0,'2020-07-07',9,197),(542,0,'2020-07-07',9,198),(543,0,'2020-07-07',9,199),(544,0,'2020-07-07',9,200),(545,0,'2020-07-07',9,201),(546,0,'2020-07-07',10,202),(547,0,'2020-07-07',10,203),(548,0,'2020-07-07',10,204),(549,0,'2020-07-07',10,205),(550,0,'2020-07-07',10,206),(551,0,'2020-07-07',10,207),(552,0,'2020-07-07',10,208),(553,0,'2020-07-07',10,209),(554,0,'2020-07-07',10,210),(555,0,'2020-07-07',10,211),(556,0,'2020-07-07',10,212),(557,0,'2020-07-07',10,213),(558,0,'2020-07-07',10,214),(559,0,'2020-07-07',10,215),(560,0,'2020-07-07',10,216),(561,0,'2020-07-07',10,217),(562,0,'2020-07-07',10,218),(563,0,'2020-07-07',10,219),(564,0,'2020-07-07',10,220),(565,0,'2020-07-07',10,221),(566,0,'2020-07-08',2,42),(567,0,'2020-07-08',2,43),(568,0,'2020-07-08',2,44),(569,0,'2020-07-08',2,45),(570,0,'2020-07-08',2,46),(571,0,'2020-07-08',2,47),(572,0,'2020-07-08',2,48),(573,0,'2020-07-08',2,49),(574,0,'2020-07-08',2,50),(575,0,'2020-07-08',2,51),(576,0,'2020-07-08',2,52),(577,0,'2020-07-08',2,53),(578,0,'2020-07-08',2,54),(579,0,'2020-07-08',2,55),(580,0,'2020-07-08',2,56),(581,0,'2020-07-08',2,57),(582,0,'2020-07-08',2,58),(583,0,'2020-07-08',2,59),(584,0,'2020-07-08',2,60),(585,0,'2020-07-08',2,61),(586,0,'2020-07-08',3,62),(587,0,'2020-07-08',3,63),(588,0,'2020-07-08',3,64),(589,0,'2020-07-08',3,65),(590,0,'2020-07-08',3,66),(591,0,'2020-07-08',3,67),(592,0,'2020-07-08',3,68),(593,0,'2020-07-08',3,69),(594,0,'2020-07-08',3,70),(595,0,'2020-07-08',3,71),(596,0,'2020-07-08',3,72),(597,0,'2020-07-08',3,73),(598,0,'2020-07-08',3,74),(599,0,'2020-07-08',3,75),(600,0,'2020-07-08',3,76),(601,0,'2020-07-08',3,77),(602,0,'2020-07-08',3,78),(603,0,'2020-07-08',3,79),(604,0,'2020-07-08',3,80),(605,0,'2020-07-08',3,81),(606,0,'2020-07-09',2,42),(607,0,'2020-07-09',2,43),(608,0,'2020-07-09',2,44),(609,0,'2020-07-09',2,45),(610,0,'2020-07-09',2,46),(611,0,'2020-07-09',2,47),(612,0,'2020-07-09',2,48),(613,0,'2020-07-09',2,49),(614,0,'2020-07-09',2,50),(615,0,'2020-07-09',2,51),(616,0,'2020-07-09',2,52),(617,0,'2020-07-09',2,53),(618,0,'2020-07-09',2,54),(619,0,'2020-07-09',2,55),(620,0,'2020-07-09',2,56),(621,0,'2020-07-09',2,57),(622,0,'2020-07-09',2,58),(623,0,'2020-07-09',2,59),(624,0,'2020-07-09',2,60),(625,0,'2020-07-09',2,61),(626,0,'2020-07-09',3,62),(627,0,'2020-07-09',3,63),(628,0,'2020-07-09',3,64),(629,0,'2020-07-09',3,65),(630,0,'2020-07-09',3,66),(631,0,'2020-07-09',3,67),(632,0,'2020-07-09',3,68),(633,0,'2020-07-09',3,69),(634,0,'2020-07-09',3,70),(635,0,'2020-07-09',3,71),(636,0,'2020-07-09',3,72),(637,0,'2020-07-09',3,73),(638,0,'2020-07-09',3,74),(639,0,'2020-07-09',3,75),(640,0,'2020-07-09',3,76),(641,0,'2020-07-09',3,77),(642,0,'2020-07-09',3,78),(643,0,'2020-07-09',3,79),(644,0,'2020-07-09',3,80),(645,0,'2020-07-09',3,81),(646,0,'2020-07-10',2,42),(647,1,'2020-07-10',2,43),(648,0,'2020-07-10',2,44),(649,0,'2020-07-10',2,45),(650,0,'2020-07-10',2,46),(651,0,'2020-07-10',2,47),(652,0,'2020-07-10',2,48),(653,0,'2020-07-10',2,49),(654,0,'2020-07-10',2,50),(655,0,'2020-07-10',2,51),(656,0,'2020-07-10',2,52),(657,0,'2020-07-10',2,53),(658,0,'2020-07-10',2,54),(659,0,'2020-07-10',2,55),(660,0,'2020-07-10',2,56),(661,0,'2020-07-10',2,57),(662,0,'2020-07-10',2,58),(663,0,'2020-07-10',2,59),(664,0,'2020-07-10',2,60),(665,0,'2020-07-10',2,61),(666,0,'2020-07-10',3,62),(667,0,'2020-07-10',3,63),(668,0,'2020-07-10',3,64),(669,0,'2020-07-10',3,65),(670,0,'2020-07-10',3,66),(671,0,'2020-07-10',3,67),(672,0,'2020-07-10',3,68),(673,0,'2020-07-10',3,69),(674,0,'2020-07-10',3,70),(675,0,'2020-07-10',3,71),(676,0,'2020-07-10',3,72),(677,0,'2020-07-10',3,73),(678,0,'2020-07-10',3,74),(679,0,'2020-07-10',3,75),(680,0,'2020-07-10',3,76),(681,0,'2020-07-10',3,77),(682,0,'2020-07-10',3,78),(683,0,'2020-07-10',3,79),(684,0,'2020-07-10',3,80),(685,0,'2020-07-10',3,81);
/*!40000 ALTER TABLE `orderseat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `passenger` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `type` int(2) DEFAULT '0',
  `idcard` varchar(20) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  `userrelation_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `userrelation_id` (`userrelation_id`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `passenger_ibfk_2` FOREIGN KEY (`userrelation_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'小红',0,'330621195402324252',2,1),(2,'小李',0,'330214568754123589',3,1),(3,'杨戬',0,'330214568754123589',4,1);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricemanage`
--

DROP TABLE IF EXISTS `pricemanage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pricemanage` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `returnprice` double DEFAULT NULL,
  `discount1` double DEFAULT NULL,
  `discount2` double DEFAULT NULL,
  `discount3` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricemanage`
--

LOCK TABLES `pricemanage` WRITE;
/*!40000 ALTER TABLE `pricemanage` DISABLE KEYS */;
INSERT INTO `pricemanage` VALUES (1,0.95,0.9,0.7,0.55);
/*!40000 ALTER TABLE `pricemanage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seat` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `carriage` int(3) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `seat` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,1,'01A'),(2,1,1,'01B'),(3,1,1,'02A'),(4,1,1,'02B'),(5,1,1,'03A'),(6,1,1,'03B'),(7,1,1,'04A'),(8,1,1,'04B'),(9,1,1,'05A'),(10,1,1,'05B'),(11,2,2,'01A'),(12,2,2,'01B'),(13,2,2,'02A'),(14,2,2,'02B'),(15,2,2,'03A'),(16,2,2,'03B'),(17,2,2,'04A'),(18,2,2,'04B'),(19,2,2,'05A'),(20,2,2,'05B');
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `seatinfo`
--

DROP TABLE IF EXISTS `seatinfo`;
/*!50001 DROP VIEW IF EXISTS `seatinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `seatinfo` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `traintype`,
 1 AS `carriage`,
 1 AS `seattype`,
 1 AS `seat`,
 1 AS `status`,
 1 AS `orderdate`,
 1 AS `orderseatid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `train` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `type` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'G100',0),(2,'G101',0),(3,'G102',0),(4,'G104',0),(5,'G105',0),(6,'G106',0),(7,'G107',0),(8,'G108',0),(9,'G109',0),(10,'G110',0);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `newtrainseats` AFTER INSERT ON `train` FOR EACH ROW BEGIN

	CALL newtrainseat(NEW.id);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `traininfo`
--

DROP TABLE IF EXISTS `traininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `traininfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `startcity` varchar(20) DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `endcity` varchar(20) DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `fprice` decimal(8,2) DEFAULT NULL,
  `sprice` decimal(8,2) DEFAULT NULL,
  `fnum` int(8) DEFAULT NULL,
  `snum` int(8) DEFAULT NULL,
  `train_id` int(20) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `traininfo_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traininfo`
--

LOCK TABLES `traininfo` WRITE;
/*!40000 ALTER TABLE `traininfo` DISABLE KEYS */;
INSERT INTO `traininfo` VALUES (1,'杭州','14:59:35','绍兴','15:59:52',33.00,19.00,10,10,1,'1小时25分种'),(2,'杭州','15:35:55','宁波','17:59:52',30.00,15.00,10,10,2,'2小时25分种'),(3,'杭州','15:11:55','宁波','15:59:52',55.00,25.00,10,10,3,'25分种'),(4,'绍兴','10:16:52','金华','13:16:55',22.00,11.00,10,10,4,'1小时33分种'),(5,'温州','11:17:36','绍兴','17:17:45',105.00,65.00,10,10,5,'5小时59分种'),(6,'杭州','11:18:08','温州','15:59:52',125.00,75.00,10,10,6,'4小时25分种'),(8,'杭州','08:11:55','宁波','08:59:52',30.00,15.00,10,10,7,'35分钟'),(9,'杭州','10:11:55','宁波','15:59:52',55.00,25.00,10,10,8,'45分种'),(10,'杭州','12:11:55','宁波','12:59:52',55.00,25.00,10,10,9,'45分种'),(11,'杭州','18:29:20','宁波','23:29:30',45.00,32.00,10,10,10,'2小时3分钟');
/*!40000 ALTER TABLE `traininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `traininfos`
--

DROP TABLE IF EXISTS `traininfos`;
/*!50001 DROP VIEW IF EXISTS `traininfos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `traininfos` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `type`,
 1 AS `starttime`,
 1 AS `startcity`,
 1 AS `endtime`,
 1 AS `endcity`,
 1 AS `fprice`,
 1 AS `sprice`,
 1 AS `fnum`,
 1 AS `snum`,
 1 AS `status`,
 1 AS `duration`,
 1 AS `ticketdate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trainseat`
--

DROP TABLE IF EXISTS `trainseat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trainseat` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `carriage` int(3) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `seat` varchar(10) DEFAULT NULL,
  `train_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `trainseat_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainseat`
--

LOCK TABLES `trainseat` WRITE;
/*!40000 ALTER TABLE `trainseat` DISABLE KEYS */;
INSERT INTO `trainseat` VALUES (1,1,1,'01A',1),(2,1,1,'01B',1),(3,1,1,'02A',1),(4,1,1,'02B',1),(5,1,1,'03A',1),(6,1,1,'03B',1),(7,1,1,'04A',1),(8,1,1,'04B',1),(9,1,1,'05A',1),(10,1,1,'05B',1),(11,2,2,'01A',1),(12,2,2,'01B',1),(13,2,2,'02A',1),(14,2,2,'02B',1),(15,2,2,'03A',1),(16,2,2,'03B',1),(17,2,2,'04A',1),(18,2,2,'04B',1),(19,2,2,'05A',1),(20,2,2,'05B',1),(42,1,1,'01A',2),(43,1,1,'01B',2),(44,1,1,'02A',2),(45,1,1,'02B',2),(46,1,1,'03A',2),(47,1,1,'03B',2),(48,1,1,'04A',2),(49,1,1,'04B',2),(50,1,1,'05A',2),(51,1,1,'05B',2),(52,2,2,'01A',2),(53,2,2,'01B',2),(54,2,2,'02A',2),(55,2,2,'02B',2),(56,2,2,'03A',2),(57,2,2,'03B',2),(58,2,2,'04A',2),(59,2,2,'04B',2),(60,2,2,'05A',2),(61,2,2,'05B',2),(62,1,1,'01A',3),(63,1,1,'01B',3),(64,1,1,'02A',3),(65,1,1,'02B',3),(66,1,1,'03A',3),(67,1,1,'03B',3),(68,1,1,'04A',3),(69,1,1,'04B',3),(70,1,1,'05A',3),(71,1,1,'05B',3),(72,2,2,'01A',3),(73,2,2,'01B',3),(74,2,2,'02A',3),(75,2,2,'02B',3),(76,2,2,'03A',3),(77,2,2,'03B',3),(78,2,2,'04A',3),(79,2,2,'04B',3),(80,2,2,'05A',3),(81,2,2,'05B',3),(82,1,1,'01A',4),(83,1,1,'01B',4),(84,1,1,'02A',4),(85,1,1,'02B',4),(86,1,1,'03A',4),(87,1,1,'03B',4),(88,1,1,'04A',4),(89,1,1,'04B',4),(90,1,1,'05A',4),(91,1,1,'05B',4),(92,2,2,'01A',4),(93,2,2,'01B',4),(94,2,2,'02A',4),(95,2,2,'02B',4),(96,2,2,'03A',4),(97,2,2,'03B',4),(98,2,2,'04A',4),(99,2,2,'04B',4),(100,2,2,'05A',4),(101,2,2,'05B',4),(102,1,1,'01A',5),(103,1,1,'01B',5),(104,1,1,'02A',5),(105,1,1,'02B',5),(106,1,1,'03A',5),(107,1,1,'03B',5),(108,1,1,'04A',5),(109,1,1,'04B',5),(110,1,1,'05A',5),(111,1,1,'05B',5),(112,2,2,'01A',5),(113,2,2,'01B',5),(114,2,2,'02A',5),(115,2,2,'02B',5),(116,2,2,'03A',5),(117,2,2,'03B',5),(118,2,2,'04A',5),(119,2,2,'04B',5),(120,2,2,'05A',5),(121,2,2,'05B',5),(122,1,1,'01A',6),(123,1,1,'01B',6),(124,1,1,'02A',6),(125,1,1,'02B',6),(126,1,1,'03A',6),(127,1,1,'03B',6),(128,1,1,'04A',6),(129,1,1,'04B',6),(130,1,1,'05A',6),(131,1,1,'05B',6),(132,2,2,'01A',6),(133,2,2,'01B',6),(134,2,2,'02A',6),(135,2,2,'02B',6),(136,2,2,'03A',6),(137,2,2,'03B',6),(138,2,2,'04A',6),(139,2,2,'04B',6),(140,2,2,'05A',6),(141,2,2,'05B',6),(142,1,1,'01A',7),(143,1,1,'01B',7),(144,1,1,'02A',7),(145,1,1,'02B',7),(146,1,1,'03A',7),(147,1,1,'03B',7),(148,1,1,'04A',7),(149,1,1,'04B',7),(150,1,1,'05A',7),(151,1,1,'05B',7),(152,2,2,'01A',7),(153,2,2,'01B',7),(154,2,2,'02A',7),(155,2,2,'02B',7),(156,2,2,'03A',7),(157,2,2,'03B',7),(158,2,2,'04A',7),(159,2,2,'04B',7),(160,2,2,'05A',7),(161,2,2,'05B',7),(162,1,1,'01A',8),(163,1,1,'01B',8),(164,1,1,'02A',8),(165,1,1,'02B',8),(166,1,1,'03A',8),(167,1,1,'03B',8),(168,1,1,'04A',8),(169,1,1,'04B',8),(170,1,1,'05A',8),(171,1,1,'05B',8),(172,2,2,'01A',8),(173,2,2,'01B',8),(174,2,2,'02A',8),(175,2,2,'02B',8),(176,2,2,'03A',8),(177,2,2,'03B',8),(178,2,2,'04A',8),(179,2,2,'04B',8),(180,2,2,'05A',8),(181,2,2,'05B',8),(182,1,1,'01A',9),(183,1,1,'01B',9),(184,1,1,'02A',9),(185,1,1,'02B',9),(186,1,1,'03A',9),(187,1,1,'03B',9),(188,1,1,'04A',9),(189,1,1,'04B',9),(190,1,1,'05A',9),(191,1,1,'05B',9),(192,2,2,'01A',9),(193,2,2,'01B',9),(194,2,2,'02A',9),(195,2,2,'02B',9),(196,2,2,'03A',9),(197,2,2,'03B',9),(198,2,2,'04A',9),(199,2,2,'04B',9),(200,2,2,'05A',9),(201,2,2,'05B',9),(202,1,1,'01A',10),(203,1,1,'01B',10),(204,1,1,'02A',10),(205,1,1,'02B',10),(206,1,1,'03A',10),(207,1,1,'03B',10),(208,1,1,'04A',10),(209,1,1,'04B',10),(210,1,1,'05A',10),(211,1,1,'05B',10),(212,2,2,'01A',10),(213,2,2,'01B',10),(214,2,2,'02A',10),(215,2,2,'02B',10),(216,2,2,'03A',10),(217,2,2,'03B',10),(218,2,2,'04A',10),(219,2,2,'04B',10),(220,2,2,'05A',10),(221,2,2,'05B',10);
/*!40000 ALTER TABLE `trainseat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainstate`
--

DROP TABLE IF EXISTS `trainstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trainstate` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `status` int(2) DEFAULT NULL,
  `train_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `trainstate_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainstate`
--

LOCK TABLES `trainstate` WRITE;
/*!40000 ALTER TABLE `trainstate` DISABLE KEYS */;
INSERT INTO `trainstate` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10);
/*!40000 ALTER TABLE `trainstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainticket`
--

DROP TABLE IF EXISTS `trainticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trainticket` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `fnum` int(8) DEFAULT NULL,
  `snum` int(8) DEFAULT NULL,
  `ticketdate` date DEFAULT NULL,
  `train_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `train_id` (`train_id`),
  CONSTRAINT `trainticket_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainticket`
--

LOCK TABLES `trainticket` WRITE;
/*!40000 ALTER TABLE `trainticket` DISABLE KEYS */;
INSERT INTO `trainticket` VALUES (1,10,10,'2020-06-12',1),(2,10,10,'2020-06-13',1),(3,10,10,'2020-06-15',2),(4,10,10,'2020-06-15',3),(5,10,10,'2020-06-16',2),(6,10,10,'2020-06-16',3),(7,10,10,'2020-06-23',2),(8,10,10,'2020-06-23',3),(9,10,10,'2020-06-26',3),(13,10,10,'2020-06-28',5),(16,0,10,'2020-06-28',8),(17,10,10,'2020-06-28',9),(18,9,9,'2020-06-28',7),(21,10,10,'2020-07-07',1),(22,10,10,'2020-07-07',2),(23,10,10,'2020-07-07',3),(24,10,10,'2020-07-07',4),(25,10,10,'2020-07-07',5),(26,10,10,'2020-07-07',6),(27,10,10,'2020-07-07',7),(28,10,10,'2020-07-07',8),(29,10,10,'2020-07-07',9),(30,10,10,'2020-07-07',10),(31,10,10,'2020-07-08',2),(32,10,10,'2020-07-08',3),(33,10,10,'2020-07-09',2),(34,10,10,'2020-07-09',3),(35,9,10,'2020-07-10',2),(36,10,10,'2020-07-10',3);
/*!40000 ALTER TABLE `trainticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `newtickets` AFTER INSERT ON `trainticket` FOR EACH ROW BEGIN

	CALL newticket(NEW.train_id,NEW.ticketdate);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int(2) DEFAULT '0',
  `idcard` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `type` int(2) DEFAULT '0',
  `country` varchar(20) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'匿名用户','张三','e10adc3949ba59abbe56e057f20f883e',1,'330621195402324252','17326262154',0,NULL,'2020-06-17 00:00:00'),(2,'test11','小红','e10adc3949ba59abbe56e057f20f883e',1,'330214568754134582',NULL,0,NULL,'2020-06-17 00:00:00'),(3,'test12','小李','e10adc3949ba59abbe56e057f20f883e',0,'330214568754122483',NULL,0,NULL,'2020-06-02 18:43:01'),(4,'test13','杨戬','e10adc3949ba59abbe56e057f20f883e',1,'330214568754123582',NULL,0,NULL,'2020-06-16 00:00:00'),(7,'test1234','李四','e10adc3949ba59abbe56e057f20f883e',1,'','3242432',0,NULL,'2020-06-04 00:00:00'),(8,'12345678','王五','fcea920f7412b5da7be0cf42b8c93759',0,'','',0,NULL,'2020-06-01 18:43:13'),(9,'123','玉儿','e10adc3949ba59abbe56e057f20f883e',1,'','',0,NULL,'2020-06-03 00:00:00'),(10,'2423','34','e10adc3949ba59abbe56e057f20f883e',0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'train'
--

--
-- Dumping routines for database 'train'
--
/*!50003 DROP PROCEDURE IF EXISTS `newticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `newticket`(

IN trainid INT,

IN orderdate VARCHAR(20)

)
BEGIN

	DECLARE done BOOLEAN DEFAULT 0;

	DECLARE seatid INT;



	DECLARE queryseat CURSOR

	FOR

	SELECT id FROM trainseat WHERE train_id=trainid;

-- 	当索引到最后

	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;  

	open queryseat;

	REPEAT

	FETCH queryseat INTO seatid;

-- 	防止最后一条数据重复

	IF done<>1 THEN

	INSERT INTO orderseat(`status`,orderdate,train_id,seat_id) 

	VALUES(0,orderdate,trainid,seatid);

-- 	结束循环

	END IF;

	 UNTIL done END REPEAT;

	CLOSE queryseat;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newtrainseat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `newtrainseat`(

IN trainid INT

)
BEGIN

	DECLARE done BOOLEAN DEFAULT 0;

	DECLARE carriages INT;

	DECLARE types INT;

	DECLARE seats VARCHAR(10);

	DECLARE queryseat CURSOR

	FOR

	SELECT carriage,type,seat FROM seat;

-- 	当索引到最后

	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;  

	open queryseat;

	REPEAT

	FETCH queryseat INTO carriages,types,seats;

	IF done<>1 THEN

		INSERT INTO trainseat(carriage,type,seat,train_id) 

		VALUES(carriages,types,seats,trainid);

	END if;

-- 	结束循环

	 UNTIL done END REPEAT;

	CLOSE queryseat;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `returndiscount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `returndiscount`(

	IN `status` INT,

	OUT outdiscount DOUBLE

)
BEGIN

	DECLARE outdiscount DOUBLE;

	DECLARE outdiscount1 DOUBLE;

	DECLARE outdiscount2 DOUBLE;

	DECLARE outdiscount3 DOUBLE;

	SELECT discount1,discount2,discount3 into outdiscount1 ,outdiscount2,outdiscount3 from pricemanage where id =1;

	if status=1 THEN

		set outdiscount = outdiscount1;

	ELSEIF status=2 THEN

		set outdiscount = outdiscount2;

	ELSEIF status=3 then

		set outdiscount = outdiscount3;

	ELSE 

		set outdiscount = 1;

	END if;

	SELECT outdiscount;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ticketprice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ticketprice`(

INOUT price DECIMAL(8,2),

IN weektype BOOLEAN

)
    COMMENT 'query price'
BEGIN

	DECLARE discounts DOUBLE;

	if weektype THEN

		SELECT discount

		FROM pricemanage

		WHERE id=1

		INTO discounts;

		SELECT price * discounts INTO price;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `totalprice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `totalprice`(

IN traindates DATE,

OUT totalprice DECIMAL(8,2)

)
    COMMENT 'query price'
BEGIN

	SELECT SUM(price) 

	FROM orders 

	WHERE Date(createtime)=Date(traindates)

	AND status=2

	INTO totalprice;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unorderseat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `unorderseat`(

IN seattypes INT,

IN trainname VARCHAR(10),

IN traindate VARCHAR(10)

)
BEGIN

	DECLARE done BOOLEAN DEFAULT 0;

	DECLARE traincarriage INT;

	DECLARE seats VARCHAR(10);

	DECLARE queryseat CURSOR

	FOR

	SELECT carriage,seat FROM seatinfo 

	WHERE `name`=trainname AND seattype=seattypes

	AND orderdate=traindate AND seatinfo.`status`=0;

-- 	当索引到最后

	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;  

	

	open queryseat;

	REPEAT

	FETCH queryseat INTO traincarriage,seats;

	SELECT traincarriage,seats;

-- 	结束循环

	 UNTIL done END REPEAT;

	CLOSE queryseat;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `train`
--

USE `train`;

--
-- Final view structure for view `orderinfo`
--

/*!50001 DROP VIEW IF EXISTS `orderinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `orderinfo` AS select `o`.`id` AS `id`,`u`.`idcard` AS `idcard`,`u`.`realname` AS `realname`,`o`.`seattype` AS `seattype`,`o`.`status` AS `status`,`o`.`carriage` AS `carriage`,`o`.`seat` AS `seat`,`o`.`traindate` AS `traindate`,`o`.`createtime` AS `createtime`,`t`.`name` AS `trainname`,`t`.`id` AS `trainid`,`o`.`price` AS `price`,`o`.`order_id` AS `order_id`,`tf`.`duration` AS `duration`,`tf`.`startcity` AS `startcity`,`tf`.`starttime` AS `starttime`,`tf`.`endcity` AS `endcity`,`tf`.`endtime` AS `endtime` from (((`orders` `o` join `train` `t`) join `traininfo` `tf`) join `user` `u`) where ((`t`.`id` = `tf`.`train_id`) and (`o`.`user_id` = `u`.`id`) and (`o`.`train_id` = `t`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `seatinfo`
--

/*!50001 DROP VIEW IF EXISTS `seatinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `seatinfo` AS select `t`.`id` AS `id`,`t`.`name` AS `name`,`t`.`type` AS `traintype`,`ts`.`carriage` AS `carriage`,`ts`.`type` AS `seattype`,`ts`.`seat` AS `seat`,`os`.`status` AS `status`,`os`.`orderdate` AS `orderdate`,`os`.`id` AS `orderseatid` from ((`train` `t` join `trainseat` `ts`) join `orderseat` `os`) where ((`t`.`id` = `ts`.`train_id`) and (`os`.`seat_id` = `ts`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `traininfos`
--

/*!50001 DROP VIEW IF EXISTS `traininfos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `traininfos` AS select `train`.`id` AS `id`,`train`.`name` AS `name`,`train`.`type` AS `type`,`f`.`starttime` AS `starttime`,`f`.`startcity` AS `startcity`,`f`.`endtime` AS `endtime`,`f`.`endcity` AS `endcity`,`f`.`fprice` AS `fprice`,`f`.`sprice` AS `sprice`,`tt`.`fnum` AS `fnum`,`tt`.`snum` AS `snum`,`s`.`status` AS `status`,`f`.`duration` AS `duration`,`tt`.`ticketdate` AS `ticketdate` from (((`train` join `traininfo` `f`) join `trainstate` `s`) join `trainticket` `tt`) where ((`f`.`train_id` = `train`.`id`) and (`s`.`train_id` = `train`.`id`) and (`tt`.`train_id` = `train`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-20 15:15:21
