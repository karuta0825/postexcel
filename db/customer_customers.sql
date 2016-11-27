-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `kid` varchar(9) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`kid`),
  UNIQUE KEY `kid_UNIQUE` (`kid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('KID00824','MMMサービスセンター',NULL),('KID02907','RGPホーム',NULL),('KID05015','QUJホーム',NULL),('KID06320','NFGステーション',NULL),('KID06724','JFIサービスセンター',NULL),('KID08385','KRVステーション',NULL),('KID09154','FHKサービスセンター',NULL),('KID09563','XXG事業所',NULL),('KID10177','KSTホーム',NULL),('KID10552','RWI事業所',NULL),('KID12094','LGD事業所',NULL),('KID13032','UYUサービスセンター',NULL),('KID14815','KEQ事業所',NULL),('KID14835','EFT事業所',NULL),('KID15852','IFHサービスセンター',NULL),('KID16319','PMXホーム',NULL),('KID16879','JFZホーム',NULL),('KID16915','RLM事業所',NULL),('KID16930','HVWサービスセンター',NULL),('KID18298','YBZステーション',NULL),('KID19837','JAOステーション',NULL),('KID20749','ZXN事業所',NULL),('KID21748','ATW事業所',NULL),('KID23214','OTMサービスセンター',NULL),('KID24326','KFD事業所',NULL),('KID24500','JVAステーション',NULL),('KID25144','VCI事業所',NULL),('KID25897','JYZホーム',NULL),('KID28129','GBYホーム',NULL),('KID28748','KIVサービスセンター',NULL),('KID29537','TUHサービスセンター',NULL),('KID30141','OAAホーム',NULL),('KID31088','PUK事業所',NULL),('KID31971','DMYサービスセンター',NULL),('KID35321','CBOホーム',NULL),('KID35925','VWDサービスセンター',NULL),('KID36461','JLYホーム',NULL),('KID37133','DZYサービスセンター',NULL),('KID37266','RCSステーション',NULL),('KID40357','NMNホーム',NULL),('KID40831','TGEホーム',NULL),('KID42357','YTWステーション',NULL),('KID45353','FQPホーム',NULL),('KID46502','CGXサービスセンター',NULL),('KID48053','JRO事業所',NULL),('KID48263','LZEステーション',NULL),('KID48845','IYCステーション',NULL),('KID50444','YYYセンター',NULL),('KID52090','MIVサービスセンター',NULL),('KID54041','ERPステーション',NULL),('KID54610','LPB事業所',NULL),('KID56303','XYOステーション',NULL),('KID56944','VINステーション',NULL),('KID57507','GBEステーション',NULL),('KID57740','QLHサービスセンター',NULL),('KID57944','MCP事業所',NULL),('KID57984','LXYステーション',NULL),('KID60004','SLXホーム',NULL),('KID60414','YQL事業所',NULL),('KID60451','ZMMステーション',NULL),('KID62505','LQQサービスセンター',NULL),('KID62816','KYYホーム',NULL),('KID63160','LWAサービスセンター',NULL),('KID63177','VVDホーム',NULL),('KID64117','HMHホーム',NULL),('KID65172','CQXステーション',NULL),('KID66400','DFSサービスセンター',NULL),('KID66863','TERサービスセンター',NULL),('KID68661','VPKサービスセンター',NULL),('KID69629','LEJホーム',NULL),('KID70680','HNOホーム',NULL),('KID71106','CNPホーム',NULL),('KID71644','JAHステーション',NULL),('KID71925','ZYUステーション',NULL),('KID71988','SKIホーム',NULL),('KID73153','FUGステーション',NULL),('KID74418','BYM事業所',NULL),('KID76430','PXWサービスセンター',NULL),('KID76696','JXBステーション',NULL),('KID77160','ABPホーム',NULL),('KID77576','KAK事業所',NULL),('KID77891','PJN事業所',NULL),('KID79115','IMWステーション',NULL),('KID79548','VZBステーション',NULL),('KID80253','YZOステーション',NULL),('KID82466','RUN事業所',NULL),('KID82472','FXQサービスセンター',NULL),('KID83014','BXG事業所',NULL),('KID84785','ITJホーム',NULL),('KID85143','RFSホーム',NULL),('KID87386','AVN事業所',NULL),('KID87388','YHW事業所',NULL),('KID91369','SLPステーション',NULL),('KID92232','WEKサービスセンター',NULL),('KID92468','YAQホーム',NULL),('KID93084','ZRT事業所',NULL),('KID94934','KQHサービスセンター',NULL),('KID95866','OXK事業所',NULL),('KID95975','SPUステーション',NULL),('KID97449','XYMホーム',NULL),('KID98368','SVI事業所',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-27 17:51:02
