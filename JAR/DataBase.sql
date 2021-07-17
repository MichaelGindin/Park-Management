-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: parkdb
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
-- Table structure for table `creditcards`
--

DROP TABLE IF EXISTS `creditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcards` (
  `creditCardNumber` varchar(19) NOT NULL,
  `ownerID` varchar(20) DEFAULT NULL,
  `nameOnCard` varchar(30) DEFAULT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  `edMonth` varchar(2) DEFAULT NULL,
  `edYear` varchar(4) DEFAULT NULL,
  `cardType` enum('VISA','MASTERCARD','AMERICANEXPRESS') DEFAULT NULL,
  PRIMARY KEY (`creditCardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcards`
--

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;
INSERT INTO `creditcards` VALUES ('1111-1111-1111-1111','111111111','Geralt of Rivia','111','01','2022','VISA'),('1111-1111-1111-1114','111111114','Dante Son of Sparda','114','07','2026','MASTERCARD'),('1111-1111-1111-1115','111111115','Vergil Son of Sparda','115','09','2028','MASTERCARD'),('1111-1111-1111-1118','111111118','Link of Hyrule','118','08','2028','VISA'),('1111-1111-1111-1121','111111121','Dio Brando','121','10','2021','MASTERCARD'),('1111-1111-1111-1126','111111126','Ned Stark','126','04','2034','MASTERCARD'),('1111-111111-11113','111111113','Mario Nintendo','1113','05','2025','AMERICANEXPRESS'),('1111-111111-11119','111111119','Belle Delphine','1119','06','2029','AMERICANEXPRESS'),('1111-111111-11122','111111122','Joseph Joestar','1122','08','2024','AMERICANEXPRESS');
/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `discountID` varchar(40) NOT NULL,
  `discountValue` float DEFAULT NULL,
  `startDate` timestamp(1) NULL DEFAULT NULL,
  `endDate` timestamp(1) NULL DEFAULT NULL,
  `isApproved` tinyint DEFAULT NULL,
  PRIMARY KEY (`discountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES ('Christmas2021',0.45,'2021-12-24 18:30:00.0','2021-12-31 18:30:00.0',1),('LalaDay2021',0.5,'2021-03-09 18:30:00.0','2021-03-10 18:30:00.0',0),('Passover2021',0.3,'2021-03-27 16:30:00.0','2021-04-02 16:30:00.0',1),('Purim2021',0.2,'2021-02-25 18:30:00.0','2021-02-28 18:30:00.0',1),('VivaLaVida',0.15,'2021-07-31 16:30:00.0','2021-08-31 16:30:00.0',0);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motd`
--

DROP TABLE IF EXISTS `motd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motd`
--

LOCK TABLES `motd` WRITE;
/*!40000 ALTER TABLE `motd` DISABLE KEYS */;
INSERT INTO `motd` VALUES (1,'Purim2021!'),(2,'from 25.02.2021 to 28.02.2021'),(3,'20% off!'),(4,'*'),(5,'*'),(6,'*'),(7,'Passover2021!'),(8,'from 27.03.2021 to 02.04.2021'),(9,'30% off!'),(10,'*'),(11,'*'),(12,'*'),(13,'Christmas2021!'),(14,'from 24.12.2021 to 31.12.2021'),(15,'45% off!'),(16,'*'),(17,'*'),(18,'*'),(19,'Looking for a trip Guide?'),(20,'~Muhammad Avdol~'),(21,'      ~YES I AM~'),(22,'the perfect guide for your group trip'),(23,'Call now: 050-0000010 !'),(24,'*'),(25,'*'),(26,'*');
/*!40000 ALTER TABLE `motd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `parkSite` varchar(20) DEFAULT NULL,
  `numberOfVisitors` int DEFAULT NULL,
  `orderID` int NOT NULL,
  `priceOfOrder` float DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `type` enum('PRIVATE','PRIVATEGROUP','GUIDE','FAMILY') DEFAULT NULL,
  `orderStatus` enum('CANCEL','SEMICANCELED','IDLE','CONFIRMED','WAITINGLIST','WAITINGLISTMASSAGESENT') DEFAULT NULL,
  `visitTime` timestamp(1) NULL DEFAULT NULL,
  `timeOfOrder` timestamp(1) NULL DEFAULT NULL,
  `isUsed` tinyint(1) DEFAULT NULL,
  `ownerID` varchar(20) DEFAULT NULL,
  `numberOfSubscribers` int DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('Gold',15,1,1050,'Jack@gmail.com','0500000002','GUIDE','IDLE','2021-01-15 06:00:00.0','2021-01-03 13:33:02.0',0,'111111112',0),('Gold',15,2,1050,'Yoda@gmail.com','0500000007','GUIDE','IDLE','2021-01-15 06:00:00.0','2021-01-03 13:34:25.0',0,'111111117',0),('Gold',8,3,525,'Avdol@gmail.com','0500000010','GUIDE','IDLE','2021-01-15 06:00:00.0','2021-01-03 14:26:42.0',0,'111111120',0),('Gold',1,4,68,'Geralt@gmail.com','0500000001','PRIVATE','IDLE','2021-01-15 06:00:00.0','2021-01-03 14:27:30.0',0,'111111111',1),('Gold',1,5,68,'Belle@gmail.com','0500000009','PRIVATE','IDLE','2021-01-15 06:00:00.0','2021-01-03 14:28:15.0',0,'111111119',1),('Platinum',1,7,68,'Geralt@gmail.com','0500000001','PRIVATE','CANCEL','2020-12-04 06:00:00.0','2020-11-03 17:07:05.0',1,'111111111',1),('Platinum',3,8,238,'Geralt@gmail.com','0500000001','PRIVATEGROUP','CANCEL','2020-12-05 06:00:00.0','2020-11-03 17:08:05.0',1,'111111111',1),('Platinum',3,9,204,'Geralt@gmail.com','0500000001','FAMILY','CONFIRMED','2020-12-06 06:00:00.0','2020-11-03 17:09:16.0',1,'111111111',3),('Platinum',15,10,1050,'Jack@gmail.com','0500000002','GUIDE','CONFIRMED','2020-12-04 06:00:00.0','2020-11-03 17:10:01.0',1,'111111112',0),('Platinum',1,11,85,'Random@gmail.com','0500500500','PRIVATE','CONFIRMED','2020-12-04 06:00:00.0','2020-11-03 17:41:24.0',1,'123456789',0),('Platinum',1,12,85,'Random1@gmail.com','0500500500','PRIVATE','CONFIRMED','2020-12-04 06:00:00.0','2020-11-03 17:41:24.0',0,'987654321',0),('Silver',4,13,272,'Geralt@gmail.com','0500000001','FAMILY','CONFIRMED','2021-01-13 11:00:00.0','2021-01-09 15:11:42.0',0,'111111111',4),('Silver',1,14,85,'nirpikk@gmail.com','0500000000','PRIVATE','CONFIRMED','2021-01-13 11:00:00.0','2021-01-09 15:12:42.0',0,'206231920',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park`
--

DROP TABLE IF EXISTS `park`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `park` (
  `parkId` varchar(20) NOT NULL,
  `parkName` varchar(20) DEFAULT NULL,
  `maxCapacity` int DEFAULT NULL,
  `managerId` varchar(20) DEFAULT NULL,
  `maxPreOrder` int DEFAULT NULL,
  `avgVisitTime` double DEFAULT NULL,
  `currentNumOfVisitors` int DEFAULT NULL,
  `openTime` int DEFAULT NULL,
  `closeTime` int DEFAULT NULL,
  PRIMARY KEY (`parkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park`
--

LOCK TABLES `park` WRITE;
/*!40000 ALTER TABLE `park` DISABLE KEYS */;
INSERT INTO `park` VALUES ('Gold','Gold',50,'000000003',40,4,0,8,16),('Platinum','Platinum',200,'000000004',160,4,0,8,16),('Silver','Silver',100,'000000002',80,4,0,8,16);
/*!40000 ALTER TABLE `park` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkentry`
--

DROP TABLE IF EXISTS `parkentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parkentry` (
  `entryType` enum('Personal','Subscriber','Group','PrivateGroup') DEFAULT NULL,
  `personID` varchar(20) NOT NULL,
  `parkID` varchar(20) DEFAULT NULL,
  `arriveTime` timestamp(1) NOT NULL,
  `exitTime` timestamp(1) NULL DEFAULT NULL,
  `numberOfVisitors` int DEFAULT NULL,
  `numberOfSubscribers` int DEFAULT NULL,
  `isCasual` tinyint DEFAULT NULL,
  `priceOfOrder` float DEFAULT NULL,
  `priceOfEntry` float DEFAULT NULL,
  PRIMARY KEY (`personID`,`arriveTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkentry`
--

LOCK TABLES `parkentry` WRITE;
/*!40000 ALTER TABLE `parkentry` DISABLE KEYS */;
INSERT INTO `parkentry` VALUES ('Subscriber','333333333','Silver','2020-12-01 06:01:00.0','2020-12-01 10:01:00.0',3,3,0,204,204),('Subscriber','333333333','Silver','2021-01-01 06:01:00.0','2021-01-01 10:01:00.0',3,3,0,204,204),('Group','333333334','Silver','2020-12-01 06:01:00.0','2020-12-01 09:30:00.0',10,0,0,800,800),('Group','333333334','Silver','2021-01-01 06:01:00.0','2021-01-01 09:30:00.0',10,0,0,800,800),('Personal','333333335','Silver','2020-12-01 06:01:00.0','2020-12-01 09:01:00.0',1,0,0,85,85),('Personal','333333335','Silver','2021-01-01 06:01:00.0','2021-01-01 09:01:00.0',1,0,0,85,85),('PrivateGroup','333333336','Silver','2020-12-01 06:01:00.0','2020-12-01 10:01:00.0',15,8,1,670,670),('PrivateGroup','333333336','Silver','2021-01-01 06:01:00.0','2021-01-01 10:01:00.0',15,8,1,670,670),('PrivateGroup','333333337','Silver','2020-12-01 11:01:00.0','2020-12-01 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333337','Silver','2021-01-01 11:01:00.0','2021-01-01 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333338','Silver','2020-12-01 13:01:00.0','2020-12-01 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333338','Silver','2021-01-01 13:01:00.0','2021-01-01 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333339','Silver','2020-12-01 13:01:00.0','2020-12-01 14:01:00.0',22,12,0,1666,1666),('PrivateGroup','333333339','Silver','2021-01-01 13:01:00.0','2021-01-01 14:01:00.0',22,12,0,1666,1666),('Subscriber','333333340','Silver','2020-12-02 06:01:00.0','2020-12-02 10:01:00.0',3,3,0,204,204),('Subscriber','333333340','Silver','2021-01-02 06:01:00.0','2021-01-02 10:01:00.0',3,3,0,204,204),('PrivateGroup','333333341','Silver','2020-12-02 06:01:00.0','2020-12-02 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333341','Silver','2021-01-02 06:01:00.0','2021-01-02 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333342','Silver','2020-12-02 08:01:00.0','2020-12-02 11:01:00.0',20,15,0,1445,1445),('PrivateGroup','333333342','Silver','2021-01-02 08:01:00.0','2021-01-02 11:01:00.0',20,15,0,1445,1445),('Personal','333333343','Silver','2020-12-02 08:01:00.0','2020-12-02 11:01:00.0',1,0,1,100,100),('Personal','333333343','Silver','2021-01-02 08:01:00.0','2021-01-02 11:01:00.0',1,0,1,100,100),('Subscriber','333333344','Silver','2020-12-02 09:01:00.0','2020-12-02 13:01:00.0',2,2,1,160,160),('Subscriber','333333344','Silver','2021-01-02 09:01:00.0','2021-01-02 13:01:00.0',2,2,1,160,160),('Group','333333345','Silver','2020-12-02 10:01:00.0','2020-12-02 14:01:00.0',14,0,0,1120,1120),('Group','333333345','Silver','2021-01-02 10:01:00.0','2021-01-02 14:01:00.0',14,0,0,1120,1120),('PrivateGroup','333333346','Silver','2020-12-02 12:01:00.0','2020-12-02 14:01:00.0',22,8,0,1734,1734),('PrivateGroup','333333346','Silver','2021-01-02 12:01:00.0','2021-01-02 14:01:00.0',22,8,0,1734,1734),('Subscriber','333333347','Silver','2020-12-03 06:01:00.0','2020-12-03 10:01:00.0',2,2,0,136,136),('Subscriber','333333347','Silver','2021-01-03 06:01:00.0','2021-01-03 10:01:00.0',2,2,0,136,136),('Group','333333348','Silver','2020-12-03 06:01:00.0','2020-12-03 09:30:00.0',10,0,0,800,800),('Group','333333348','Silver','2021-01-03 06:01:00.0','2021-01-03 09:30:00.0',10,0,0,800,800),('Personal','333333349','Silver','2020-12-03 06:01:00.0','2020-12-03 09:01:00.0',1,0,0,85,85),('Personal','333333349','Silver','2021-01-03 06:01:00.0','2021-01-03 09:01:00.0',1,0,0,85,85),('PrivateGroup','333333350','Silver','2020-12-03 06:01:00.0','2020-12-03 10:01:00.0',12,8,1,520,520),('PrivateGroup','333333350','Silver','2021-01-03 06:01:00.0','2021-01-03 10:01:00.0',12,8,1,520,520),('PrivateGroup','333333351','Silver','2020-12-03 11:01:00.0','2020-12-03 14:01:00.0',18,10,1,800,800),('PrivateGroup','333333351','Silver','2021-01-03 11:01:00.0','2021-01-03 14:01:00.0',18,10,1,800,800),('PrivateGroup','333333352','Silver','2020-12-03 13:01:00.0','2020-12-03 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333352','Silver','2021-01-03 13:01:00.0','2021-01-03 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333353','Silver','2020-12-03 13:01:00.0','2020-12-03 14:01:00.0',22,12,0,1666,1666),('PrivateGroup','333333353','Silver','2021-01-03 13:01:00.0','2021-01-03 14:01:00.0',22,12,0,1666,1666),('Subscriber','333333354','Silver','2020-12-04 06:01:00.0','2020-12-04 10:01:00.0',3,3,0,204,204),('Subscriber','333333354','Silver','2021-01-04 06:01:00.0','2021-01-04 10:01:00.0',3,3,0,204,204),('PrivateGroup','333333355','Silver','2020-12-04 06:01:00.0','2020-12-04 10:01:00.0',15,12,0,630,630),('PrivateGroup','333333355','Silver','2021-01-04 06:01:00.0','2021-01-04 10:01:00.0',15,12,0,630,630),('PrivateGroup','333333356','Silver','2020-12-04 08:01:00.0','2020-12-04 11:01:00.0',16,11,0,690,690),('PrivateGroup','333333356','Silver','2021-01-04 08:01:00.0','2021-01-04 11:01:00.0',16,11,0,690,690),('Personal','333333357','Silver','2020-12-04 08:01:00.0','2020-12-04 11:01:00.0',1,0,1,100,100),('Personal','333333357','Silver','2021-01-04 08:01:00.0','2021-01-04 11:01:00.0',1,0,1,100,100),('Subscriber','333333358','Silver','2020-12-04 09:01:00.0','2020-12-04 13:01:00.0',2,2,1,160,160),('Subscriber','333333358','Silver','2021-01-04 09:01:00.0','2021-01-04 13:01:00.0',2,2,1,160,160),('Group','333333359','Silver','2020-12-04 10:01:00.0','2020-12-04 14:01:00.0',14,0,0,1120,1120),('Group','333333359','Silver','2021-01-04 10:01:00.0','2021-01-04 14:01:00.0',14,0,0,1120,1120),('PrivateGroup','333333360','Silver','2020-12-04 12:01:00.0','2020-12-04 14:01:00.0',22,8,0,1734,1734),('PrivateGroup','333333360','Silver','2021-01-04 12:01:00.0','2021-01-04 14:01:00.0',22,8,0,1734,1734),('Subscriber','333333361','Silver','2020-12-05 06:01:00.0','2020-12-05 10:01:00.0',3,3,0,204,204),('Subscriber','333333361','Silver','2021-01-05 06:01:00.0','2021-01-05 10:01:00.0',3,3,0,204,204),('Group','333333362','Silver','2020-12-05 06:01:00.0','2020-12-05 09:30:00.0',12,0,0,960,960),('Group','333333362','Silver','2021-01-05 06:01:00.0','2021-01-05 09:30:00.0',12,0,0,960,960),('Personal','333333363','Silver','2020-12-05 06:01:00.0','2020-12-05 09:01:00.0',1,0,0,85,85),('Personal','333333363','Silver','2021-01-05 06:01:00.0','2021-01-05 09:01:00.0',1,0,0,85,85),('PrivateGroup','333333364','Silver','2020-12-05 06:01:00.0','2020-12-05 10:01:00.0',27,16,1,1190,1190),('PrivateGroup','333333364','Silver','2021-01-05 06:01:00.0','2021-01-05 10:01:00.0',27,16,1,1190,1190),('PrivateGroup','333333365','Silver','2020-12-05 11:01:00.0','2020-12-05 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333365','Silver','2021-01-05 11:01:00.0','2021-01-05 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333366','Silver','2020-12-05 13:01:00.0','2020-12-05 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333366','Silver','2021-01-05 13:01:00.0','2021-01-05 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333367','Silver','2020-12-05 13:01:00.0','2020-12-05 14:01:00.0',26,12,0,1230,1180),('PrivateGroup','333333367','Silver','2021-01-05 13:01:00.0','2021-01-05 14:01:00.0',26,12,0,1230,1180),('Subscriber','333333368','Silver','2020-12-06 06:01:00.0','2020-12-06 10:01:00.0',3,3,0,204,204),('Subscriber','333333368','Silver','2021-01-06 06:01:00.0','2021-01-06 10:01:00.0',3,3,0,204,204),('PrivateGroup','333333369','Silver','2020-12-06 06:01:00.0','2020-12-06 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333369','Silver','2021-01-06 06:01:00.0','2021-01-06 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333370','Silver','2020-12-06 08:01:00.0','2020-12-06 11:01:00.0',20,15,0,1445,1445),('PrivateGroup','333333370','Silver','2021-01-06 08:01:00.0','2021-01-06 11:01:00.0',20,15,0,1445,1445),('Personal','333333371','Silver','2020-12-06 08:01:00.0','2020-12-06 11:01:00.0',1,0,1,100,100),('Personal','333333371','Silver','2021-01-06 08:01:00.0','2021-01-06 11:01:00.0',1,0,1,100,100),('Subscriber','333333372','Silver','2020-12-06 09:01:00.0','2020-12-06 13:01:00.0',7,7,1,560,560),('Subscriber','333333372','Silver','2021-01-06 09:01:00.0','2021-01-06 13:01:00.0',7,7,1,560,560),('Group','333333373','Silver','2020-12-06 10:01:00.0','2020-12-06 14:01:00.0',14,0,0,1120,1120),('Group','333333373','Silver','2021-01-06 10:01:00.0','2021-01-06 14:01:00.0',14,0,0,1120,1120),('PrivateGroup','333333374','Silver','2020-12-06 12:01:00.0','2020-12-06 14:01:00.0',22,5,0,1050,1050),('PrivateGroup','333333374','Silver','2021-01-06 12:01:00.0','2021-01-06 14:01:00.0',22,5,0,1050,1050),('Subscriber','333333375','Silver','2020-12-07 06:01:00.0','2020-12-07 10:01:00.0',6,6,0,408,408),('Subscriber','333333375','Silver','2021-01-07 06:01:00.0','2021-01-07 10:01:00.0',6,6,0,408,408),('Group','333333376','Silver','2020-12-07 06:01:00.0','2020-12-07 09:30:00.0',10,0,0,800,800),('Group','333333376','Silver','2021-01-07 06:01:00.0','2021-01-07 09:30:00.0',10,0,0,800,800),('Personal','333333377','Silver','2020-12-07 06:01:00.0','2020-12-07 09:01:00.0',1,0,0,85,85),('Personal','333333377','Silver','2021-01-07 06:01:00.0','2021-01-07 09:01:00.0',1,0,0,85,85),('PrivateGroup','333333378','Silver','2020-12-07 06:01:00.0','2020-12-07 10:01:00.0',11,8,1,470,470),('PrivateGroup','333333378','Silver','2021-01-07 06:01:00.0','2021-01-07 10:01:00.0',11,8,1,470,470),('PrivateGroup','333333379','Silver','2020-12-07 11:01:00.0','2020-12-07 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333379','Silver','2021-01-07 11:01:00.0','2021-01-07 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333380','Silver','2020-12-07 13:01:00.0','2020-12-07 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333380','Silver','2021-01-07 13:01:00.0','2021-01-07 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333381','Silver','2020-12-07 13:01:00.0','2020-12-07 14:01:00.0',29,14,0,2227,2227),('PrivateGroup','333333381','Silver','2021-01-07 13:01:00.0','2021-01-07 14:01:00.0',29,14,0,2227,2227),('Subscriber','333333382','Silver','2020-12-08 06:01:00.0','2020-12-08 10:01:00.0',3,3,0,204,204),('Subscriber','333333382','Silver','2021-01-08 06:01:00.0','2021-01-08 10:01:00.0',3,3,0,204,204),('PrivateGroup','333333383','Silver','2020-12-08 06:01:00.0','2020-12-08 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333383','Silver','2021-01-08 06:01:00.0','2021-01-08 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333384','Silver','2020-12-08 08:01:00.0','2020-12-08 11:01:00.0',20,15,0,1445,1445),('Subscriber','333333384','Silver','2020-12-09 06:01:00.0','2020-12-09 10:01:00.0',3,3,0,204,204),('PrivateGroup','333333384','Silver','2021-01-08 08:01:00.0','2021-01-08 11:01:00.0',20,15,0,1445,1445),('Subscriber','333333384','Silver','2021-01-09 06:01:00.0','2021-01-09 10:01:00.0',3,3,0,204,204),('Personal','333333385','Silver','2020-12-08 08:01:00.0','2020-12-08 11:01:00.0',1,0,1,100,100),('Group','333333385','Silver','2020-12-09 06:01:00.0','2020-12-09 09:30:00.0',10,0,0,800,800),('Personal','333333385','Silver','2021-01-08 08:01:00.0','2021-01-08 11:01:00.0',1,0,1,100,100),('Group','333333385','Silver','2021-01-09 06:01:00.0','2021-01-09 09:30:00.0',10,0,0,800,800),('Subscriber','333333386','Silver','2020-12-08 09:01:00.0','2020-12-08 13:01:00.0',2,2,1,160,160),('Personal','333333386','Silver','2020-12-09 06:01:00.0','2020-12-09 09:01:00.0',1,0,0,85,85),('Subscriber','333333386','Silver','2021-01-08 09:01:00.0','2021-01-08 13:01:00.0',2,2,1,160,160),('Personal','333333386','Silver','2021-01-09 06:01:00.0','2021-01-09 09:01:00.0',1,0,0,85,85),('Group','333333387','Silver','2020-12-08 10:01:00.0','2020-12-08 14:01:00.0',14,0,0,1120,1120),('PrivateGroup','333333387','Silver','2020-12-09 06:01:00.0','2020-12-09 10:01:00.0',15,8,1,670,670),('Group','333333387','Silver','2021-01-08 10:01:00.0','2021-01-08 14:01:00.0',14,0,0,1120,1120),('PrivateGroup','333333387','Silver','2021-01-09 06:01:00.0','2021-01-09 10:01:00.0',15,8,1,670,670),('PrivateGroup','333333388','Silver','2020-12-08 12:01:00.0','2020-12-08 14:01:00.0',22,8,0,1734,1734),('PrivateGroup','333333388','Silver','2020-12-09 11:01:00.0','2020-12-09 14:01:00.0',20,18,1,820,820),('PrivateGroup','333333388','Silver','2021-01-08 12:01:00.0','2021-01-08 14:01:00.0',22,8,0,1734,1734),('PrivateGroup','333333388','Silver','2021-01-09 11:01:00.0','2021-01-09 14:01:00.0',20,18,1,820,820),('PrivateGroup','333333389','Silver','2020-12-09 13:01:00.0','2020-12-09 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333389','Silver','2021-01-09 13:01:00.0','2021-01-09 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333390','Silver','2020-12-09 13:01:00.0','2020-12-09 14:01:00.0',22,2,0,1836,1836),('PrivateGroup','333333390','Silver','2021-01-09 13:01:00.0','2021-01-09 14:01:00.0',22,2,0,1836,1836),('Subscriber','333333391','Silver','2020-12-10 06:01:00.0','2020-12-10 10:01:00.0',3,3,0,204,204),('Subscriber','333333391','Silver','2021-01-10 06:01:00.0','2021-01-10 10:01:00.0',3,3,0,204,204),('PrivateGroup','333333392','Silver','2020-12-10 06:01:00.0','2020-12-10 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333392','Silver','2021-01-10 06:01:00.0','2021-01-10 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333393','Silver','2020-12-10 08:01:00.0','2020-12-10 11:01:00.0',20,15,0,1445,1445),('PrivateGroup','333333393','Silver','2021-01-10 08:01:00.0','2021-01-10 11:01:00.0',20,15,0,1445,1445),('Personal','333333394','Silver','2020-12-10 08:01:00.0','2020-12-10 11:01:00.0',1,0,1,100,100),('Personal','333333394','Silver','2021-01-10 08:01:00.0','2021-01-10 11:01:00.0',1,0,1,100,100),('Subscriber','333333395','Silver','2020-12-10 09:01:00.0','2020-12-10 13:01:00.0',2,2,1,160,160),('Subscriber','333333395','Silver','2021-01-10 09:01:00.0','2021-01-10 13:01:00.0',2,2,1,160,160),('Group','333333396','Silver','2020-12-10 10:01:00.0','2020-12-10 14:01:00.0',14,0,0,1120,1120),('Group','333333396','Silver','2021-01-10 10:01:00.0','2021-01-10 14:01:00.0',14,0,0,1120,1120),('PrivateGroup','333333397','Silver','2020-12-10 12:01:00.0','2020-12-10 14:01:00.0',22,8,0,1734,1734),('PrivateGroup','333333397','Silver','2021-01-10 12:01:00.0','2021-01-10 14:01:00.0',22,8,0,1734,1734),('Subscriber','333333398','Silver','2020-12-11 06:01:00.0','2020-12-11 10:01:00.0',3,3,0,120,120),('Subscriber','333333398','Silver','2021-01-11 06:01:00.0','2021-01-11 10:01:00.0',3,3,0,204,204),('Group','333333399','Silver','2020-12-11 06:01:00.0','2020-12-11 09:30:00.0',10,0,0,510,460),('Group','333333399','Silver','2021-01-11 06:01:00.0','2021-01-11 09:30:00.0',10,0,0,510,460),('Personal','333333400','Silver','2020-12-11 06:01:00.0','2020-12-11 09:01:00.0',1,0,0,85,85),('Personal','333333400','Silver','2021-01-11 06:01:00.0','2021-01-11 09:01:00.0',1,0,0,85,85),('PrivateGroup','333333401','Silver','2020-12-11 06:01:00.0','2020-12-11 10:01:00.0',15,8,1,670,670),('PrivateGroup','333333401','Silver','2021-01-11 06:01:00.0','2021-01-11 10:01:00.0',15,8,1,670,670),('PrivateGroup','333333402','Silver','2020-12-11 11:01:00.0','2020-12-11 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333402','Silver','2021-01-11 11:01:00.0','2021-01-11 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333403','Silver','2020-12-11 13:01:00.0','2020-12-11 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333403','Silver','2021-01-11 13:01:00.0','2021-01-11 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333404','Silver','2020-12-11 13:01:00.0','2020-12-11 14:01:00.0',22,12,0,1666,1666),('PrivateGroup','333333404','Silver','2021-01-11 13:01:00.0','2021-01-11 14:01:00.0',22,12,0,1666,1666),('Subscriber','333333405','Silver','2020-12-12 06:01:00.0','2020-12-12 10:01:00.0',3,3,0,204,204),('Subscriber','333333405','Silver','2021-01-12 06:01:00.0','2021-01-12 10:01:00.0',3,3,0,204,204),('PrivateGroup','333333406','Silver','2020-12-12 06:01:00.0','2020-12-12 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333406','Silver','2021-01-12 06:01:00.0','2021-01-12 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333407','Silver','2020-12-12 08:01:00.0','2020-12-12 11:01:00.0',20,15,0,1445,1445),('PrivateGroup','333333407','Silver','2021-01-12 08:01:00.0','2021-01-12 11:01:00.0',20,15,0,1445,1445),('Personal','333333408','Silver','2020-12-12 08:01:00.0','2020-12-12 11:01:00.0',1,0,1,100,100),('Personal','333333408','Silver','2021-01-12 08:01:00.0','2021-01-12 11:01:00.0',1,0,1,100,100),('Subscriber','333333409','Silver','2020-12-12 09:01:00.0','2020-12-12 13:01:00.0',2,2,1,160,160),('Subscriber','333333409','Silver','2021-01-12 09:01:00.0','2021-01-12 13:01:00.0',2,2,1,160,160),('Group','333333410','Silver','2020-12-12 10:01:00.0','2020-12-12 14:01:00.0',14,0,0,1120,1120),('Group','333333410','Silver','2021-01-12 10:01:00.0','2021-01-12 14:01:00.0',14,0,0,1120,1120),('PrivateGroup','333333411','Silver','2020-12-12 12:01:00.0','2020-12-12 14:01:00.0',22,8,0,1734,1734),('PrivateGroup','333333411','Silver','2021-01-12 12:01:00.0','2021-01-12 14:01:00.0',22,8,0,1734,1734),('Subscriber','333333412','Silver','2020-12-13 06:01:00.0','2020-12-13 10:01:00.0',3,3,0,120,120),('Subscriber','333333412','Silver','2021-01-13 06:01:00.0','2021-01-13 10:01:00.0',3,3,0,204,204),('Group','333333413','Silver','2020-12-13 06:01:00.0','2020-12-13 09:30:00.0',10,0,0,800,800),('Group','333333413','Silver','2021-01-13 06:01:00.0','2021-01-13 09:30:00.0',10,0,0,800,800),('Personal','333333414','Silver','2020-12-13 06:01:00.0','2020-12-13 09:01:00.0',1,0,0,85,85),('Personal','333333414','Silver','2021-01-13 06:01:00.0','2021-01-13 09:01:00.0',1,0,0,85,85),('PrivateGroup','333333415','Silver','2020-12-13 06:01:00.0','2020-12-13 10:01:00.0',15,8,1,670,670),('PrivateGroup','333333415','Silver','2021-01-13 06:01:00.0','2021-01-13 10:01:00.0',15,8,1,670,670),('PrivateGroup','333333416','Silver','2020-12-13 11:01:00.0','2020-12-13 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333416','Silver','2021-01-13 11:01:00.0','2021-01-13 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333417','Silver','2020-12-13 13:01:00.0','2020-12-13 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333417','Silver','2021-01-13 13:01:00.0','2021-01-13 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333418','Silver','2020-12-13 13:01:00.0','2020-12-13 14:01:00.0',22,12,0,1666,1666),('PrivateGroup','333333418','Silver','2021-01-13 13:01:00.0','2021-01-13 14:01:00.0',22,12,0,1666,1666),('Subscriber','333333419','Silver','2020-12-14 06:01:00.0','2020-12-14 10:01:00.0',3,3,0,204,204),('Subscriber','333333419','Silver','2021-01-14 06:01:00.0','2021-01-14 10:01:00.0',3,3,0,204,204),('PrivateGroup','333333420','Silver','2020-12-14 06:01:00.0','2020-12-14 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333420','Silver','2021-01-14 06:01:00.0','2021-01-14 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333421','Silver','2020-12-14 08:01:00.0','2020-12-14 11:01:00.0',20,15,0,1445,1445),('PrivateGroup','333333421','Silver','2021-01-14 08:01:00.0','2021-01-14 11:01:00.0',20,15,0,1445,1445),('Personal','333333422','Silver','2020-12-14 08:01:00.0','2020-12-14 11:01:00.0',1,0,1,100,100),('Personal','333333422','Silver','2021-01-14 08:01:00.0','2021-01-14 11:01:00.0',1,0,1,100,100),('Subscriber','333333423','Silver','2020-12-14 09:01:00.0','2020-12-14 13:01:00.0',2,2,1,160,160),('Subscriber','333333423','Silver','2021-01-14 09:01:00.0','2021-01-14 13:01:00.0',2,2,1,160,160),('Group','333333424','Silver','2020-12-14 10:01:00.0','2020-12-14 14:01:00.0',14,0,0,1120,1120),('Group','333333424','Silver','2021-01-14 10:01:00.0','2021-01-14 14:01:00.0',14,0,0,1120,1120),('PrivateGroup','333333425','Silver','2020-12-14 12:01:00.0','2020-12-14 14:01:00.0',22,8,0,1734,1734),('PrivateGroup','333333425','Silver','2021-01-14 12:01:00.0','2021-01-14 14:01:00.0',22,8,0,1734,1734),('Subscriber','333333426','Silver','2020-12-15 06:01:00.0','2020-12-15 10:01:00.0',3,3,0,204,204),('Subscriber','333333426','Silver','2021-01-15 06:01:00.0','2021-01-15 10:01:00.0',3,3,0,204,204),('Group','333333427','Silver','2020-12-15 06:01:00.0','2020-12-15 09:30:00.0',10,0,0,800,800),('Group','333333427','Silver','2021-01-15 06:01:00.0','2021-01-15 09:30:00.0',10,0,0,800,800),('Personal','333333428','Silver','2020-12-15 06:01:00.0','2020-12-15 09:01:00.0',1,0,0,85,85),('Personal','333333428','Silver','2021-01-15 06:01:00.0','2021-01-15 09:01:00.0',1,0,0,85,85),('PrivateGroup','333333429','Silver','2020-12-15 06:01:00.0','2020-12-15 10:01:00.0',15,8,1,670,670),('PrivateGroup','333333429','Silver','2021-01-15 06:01:00.0','2021-01-15 10:01:00.0',15,8,1,670,670),('PrivateGroup','333333430','Silver','2020-12-15 11:01:00.0','2020-12-15 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333430','Silver','2021-01-15 11:01:00.0','2021-01-15 14:01:00.0',20,10,1,900,900),('PrivateGroup','333333431','Silver','2020-12-15 13:01:00.0','2020-12-15 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333431','Silver','2021-01-15 13:01:00.0','2021-01-15 14:01:00.0',23,13,1,2040,2040),('PrivateGroup','333333432','Silver','2020-12-15 13:01:00.0','2020-12-15 14:01:00.0',22,12,0,1666,1666),('PrivateGroup','333333432','Silver','2021-01-15 13:01:00.0','2021-01-15 14:01:00.0',22,12,0,1666,1666),('Subscriber','333333433','Silver','2020-12-16 06:01:00.0','2020-12-16 10:01:00.0',3,3,0,204,204),('Subscriber','333333433','Silver','2021-01-16 06:01:00.0','2021-01-16 10:01:00.0',3,3,0,204,204),('PrivateGroup','333333434','Silver','2020-12-16 06:01:00.0','2020-12-16 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333434','Silver','2021-01-16 06:01:00.0','2021-01-16 10:01:00.0',15,15,0,1020,1020),('PrivateGroup','333333435','Silver','2020-12-16 08:01:00.0','2020-12-16 11:01:00.0',20,15,0,1445,1445),('PrivateGroup','333333435','Silver','2021-01-16 08:01:00.0','2021-01-16 11:01:00.0',20,15,0,1445,1445),('Personal','333333436','Silver','2020-12-16 08:01:00.0','2020-12-16 11:01:00.0',1,0,1,100,100),('Personal','333333436','Silver','2021-01-16 08:01:00.0','2021-01-16 11:01:00.0',1,0,1,100,100),('Subscriber','333333437','Silver','2020-12-16 09:01:00.0','2020-12-16 13:01:00.0',2,2,1,160,160),('Subscriber','333333437','Silver','2021-01-16 09:01:00.0','2021-01-16 13:01:00.0',2,2,1,160,160),('Group','333333438','Silver','2020-12-16 10:01:00.0','2020-12-16 14:01:00.0',14,0,0,1120,1120),('Group','333333438','Silver','2021-01-16 10:01:00.0','2021-01-16 14:01:00.0',14,0,0,1120,1120),('PrivateGroup','333333439','Silver','2020-12-16 12:01:00.0','2020-12-16 14:01:00.0',60,25,0,4675,4675),('PrivateGroup','333333439','Silver','2021-01-16 12:01:00.0','2021-01-16 14:01:00.0',60,25,0,4675,4675);
/*!40000 ALTER TABLE `parkentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers` (
  `subscriberID` varchar(20) NOT NULL,
  `personalID` varchar(20) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `creditCardNumber` varchar(19) DEFAULT NULL,
  `familySize` int DEFAULT NULL,
  `type` enum('SUBSCRIBER','GUIDE') DEFAULT NULL,
  PRIMARY KEY (`subscriberID`),
  KEY `creditCardNumber` (`creditCardNumber`),
  CONSTRAINT `subscribers_ibfk_1` FOREIGN KEY (`creditCardNumber`) REFERENCES `creditcards` (`creditCardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES ('S111111111','111111111','Geralt','of Rivia','0500000001','Geralt@gmail.com','1111-1111-1111-1111',5,'GUIDE'),('S111111112','111111112','Jack','Sparrow','0500000002','Jack@gmail.com',NULL,1,'GUIDE'),('S111111113','111111113','Mario','Nintendo','0500000003','Mario@nintendo.com','1111-111111-11113',5,'SUBSCRIBER'),('S111111114','111111114','Dante','Son of Sparda','0500000004','Dante@gmail.com','1111-1111-1111-1114',3,'SUBSCRIBER'),('S111111115','111111115','Vergil','Son of Sparda','0500000005','Vergil@gmail.com','1111-1111-1111-1115',2,'SUBSCRIBER'),('S111111116','111111116','Luke','Skywalker','0500000006','Luke@gmail.com',NULL,1,'SUBSCRIBER'),('S111111117','111111117','Yoda','Master','0500000007','Yoda@gmail.com',NULL,1,'GUIDE'),('S111111118','111111118','Link','of Hyrule','0500000008','Link@walla.com','1111-1111-1111-1118',2,'SUBSCRIBER'),('S111111119','111111119','Belle','Delphine','0500000009','Belle@gmail.com','1111-111111-11119',1,'GUIDE'),('S111111120','111111120','Muhammad','Avdol','0500000010','Avdol@gmail.com',NULL,1,'GUIDE'),('S111111121','111111121','Dio','Brando','0500000021','Dio@gmail.com','1111-1111-1111-1121',2,'SUBSCRIBER'),('S111111122','111111122','Joseph','Joestar','0500000022','Joseph@gmail.com','1111-111111-11122',3,'SUBSCRIBER'),('S111111123','111111123','Ash','Ketchum','0500000023','Ash@gmail.com',NULL,3,'SUBSCRIBER'),('S111111124','111111124','Gary','Oak','0500000024','Gary@gmail.com',NULL,2,'SUBSCRIBER'),('S111111125','111111125','Kratos','God of War','0500000025','Kratos@gmail.com',NULL,1,'GUIDE'),('S111111126','111111126','Ned','Stark','0500000026','Ned@gmail.com','1111-1111-1111-1126',7,'GUIDE');
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuechangerequest`
--

DROP TABLE IF EXISTS `valuechangerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valuechangerequest` (
  `parkId` varchar(20) NOT NULL,
  `attributeName` enum('MaxCapacity','MaxPreOrder','AvgVisitTime') NOT NULL,
  `requestedValue` double DEFAULT NULL,
  `currentValue` double DEFAULT NULL,
  PRIMARY KEY (`parkId`,`attributeName`),
  CONSTRAINT `valuechangerequest_ibfk_1` FOREIGN KEY (`parkId`) REFERENCES `park` (`parkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuechangerequest`
--

LOCK TABLES `valuechangerequest` WRITE;
/*!40000 ALTER TABLE `valuechangerequest` DISABLE KEYS */;
INSERT INTO `valuechangerequest` VALUES ('Silver','MaxCapacity',120,100),('Silver','MaxPreOrder',96,80);
/*!40000 ALTER TABLE `valuechangerequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitinglist`
--

DROP TABLE IF EXISTS `waitinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitinglist` (
  `parkSite` varchar(20) DEFAULT NULL,
  `numberOfVisitors` int DEFAULT NULL,
  `orderID` int NOT NULL,
  `priceOfOrder` float DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `type` enum('PRIVATE','PRIVATEGROUP','GUIDE','FAMILY') DEFAULT NULL,
  `orderStatus` enum('CANCEL','IDLE','CONFIRMED','WAITINGLIST','WAITINGLISTMASSAGESENT') DEFAULT NULL,
  `visitTime` timestamp(1) NULL DEFAULT NULL,
  `timeOfOrder` timestamp(1) NULL DEFAULT NULL,
  `isUsed` tinyint(1) DEFAULT NULL,
  `ownerID` varchar(20) DEFAULT NULL,
  `numberOfSubscribers` int DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitinglist`
--

LOCK TABLES `waitinglist` WRITE;
/*!40000 ALTER TABLE `waitinglist` DISABLE KEYS */;
INSERT INTO `waitinglist` VALUES ('Gold',1,6,68,'Ned@gmail.com','0500000026','FAMILY','WAITINGLIST','2021-01-15 06:00:00.0','2021-01-03 16:10:48.0',0,'111111126',1);
/*!40000 ALTER TABLE `waitinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers` (
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `workerID` varchar(12) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `userName` varchar(20) NOT NULL,
  `workerType` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `isLogged` varchar(4) DEFAULT NULL,
  `permissions` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES ('Nir','Pikan','000000001','nir@gmail.com','depManager','departmentManager','Aa123456','NO','department Registration VistitorsView ReportExport ApproveParameters ApproveDiscounts'),('Or','Man','000000003','or@gmail.com','goldManager','parkManager','Aa123456','NO','Gold Registration VistitorsView ReportExport EditParameters AddDiscounts'),('Giorno','Giovanna','000000006','giorno@gmail.com','goldWorker','parkWorker','Aa123456','NO','Gold Registration VistitorsView'),('Michael','Gindin','000000004','michael@gmail.com','platinumManager','parkManager','Aa123456','NO','Platinum Registration VistitorsView ReportExport EditParameters AddDiscounts'),('Jotaro','Kujo','000000007','jotaro@gmail.com','platinumWorker','parkWorker','Aa123456','NO','Platinum Registration VistitorsView'),('Roman','Kozak','000000002','roman@gmail.com','silverManager','parkManager','Aa123456','NO','Silver Registration VistitorsView ReportExport EditParameters AddDiscounts'),('Aviv','Vanunu','000000005','aviv@gmail.com','silverWorker','parkWorker','Aa123456','NO','Silver Registration VistitorsView');
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-09 17:14:55
