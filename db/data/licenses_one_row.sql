-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: customer
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `kid` varchar(8) NOT NULL,
  `K1` int(2) DEFAULT NULL,
  `A1` int(2) DEFAULT NULL,
  `U2` int(2) DEFAULT NULL,
  `U3` int(2) DEFAULT NULL,
  `U4` int(2) DEFAULT NULL,
  `U5` int(2) DEFAULT NULL,
  `U6` int(2) DEFAULT NULL,
  `U7` int(2) DEFAULT NULL,
  `U8` int(2) DEFAULT NULL,
  `U9` int(2) DEFAULT NULL,
  `UA` int(2) DEFAULT NULL,
  `UB` int(2) DEFAULT NULL,
  `UC` int(2) DEFAULT NULL,
  `UD` int(2) DEFAULT NULL,
  `UE` int(2) DEFAULT NULL,
  `UF` int(2) DEFAULT NULL,
  `UG` int(2) DEFAULT NULL,
  `UH` int(2) DEFAULT NULL,
  `UI` int(2) DEFAULT NULL,
  `C1` int(2) DEFAULT NULL,
  `C2` int(2) DEFAULT NULL,
  `C3` int(2) DEFAULT NULL,
  `C4` int(2) DEFAULT NULL,
  `S2` int(2) DEFAULT NULL,
  `S3` int(2) DEFAULT NULL,
  `S9` int(2) DEFAULT NULL,
  `SC` int(2) DEFAULT NULL,
  `SE` int(2) DEFAULT NULL,
  `SH` int(2) DEFAULT NULL,
  `SI` int(2) DEFAULT NULL,
  `SJ` int(2) DEFAULT NULL,
  `SL` int(2) DEFAULT NULL,
  `SM` int(2) DEFAULT NULL,
  `SO` int(2) DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-02  7:17:34
