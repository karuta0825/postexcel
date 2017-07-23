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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `kid` varchar(9) NOT NULL,
  `base_id` int(1) NOT NULL AUTO_INCREMENT,
  `base_name` varchar(45) DEFAULT NULL,
  `postal_cd` varchar(8) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `affliation` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `has_busiv` int(1) DEFAULT NULL,
  `has_fenics` int(1) DEFAULT NULL,
  `has_mobile` int(1) DEFAULT NULL,
  PRIMARY KEY (`base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('KID00824',1,'MMMサービスセンター','1010-191','',NULL,NULL,NULL,NULL,1,1,NULL),('KID02907',2,'RGPホーム',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),('KID05015',3,'QUJホーム','288-8371',NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID06320',4,'NFGステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,0),('KID06724',5,'JFIサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID08385',6,'KRVステーション',NULL,NULL,NULL,NULL,NULL,NULL,1,1,1),('KID09154',7,'FHKサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID09563',8,'XXG事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID10552',9,'RWI事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID12094',10,'LGD事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID13032',11,'UYUサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID14815',12,'KEQ事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID14835',13,'EFT事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID15852',14,'IFHサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID16319',15,'PMXホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID16879',16,'JFZホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID16915',17,'RLM事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID16930',18,'HVWサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID18298',19,'YBZステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID19837',20,'JAOステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID20749',21,'ZXN事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID21748',22,'ATW事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID23214',23,'OTMサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID24326',24,'KFD事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID24500',25,'JVAステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID25144',26,'VCI事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID25897',27,'JYZホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID28129',28,'GBYホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID28748',29,'KIVサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID29537',30,'TUHサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID30141',31,'OAAホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID31088',32,'PUK事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID31971',33,'DMYサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID35321',34,'CBOホーム','0',NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID35925',35,'VWDサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID36461',36,'JLYホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID37133',37,'DZYサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID37266',38,'RCSステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID40357',39,'NMNホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID40831',40,'TGEホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID42357',41,'YTWステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,0),('KID45353',42,'FQPホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID46502',43,'CGXサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID48053',44,'JRO事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID48263',45,'LZEステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID48845',46,'IYCステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID50444',47,'YYYセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID52090',48,'MIVサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID54041',49,'ERPステーション','0',NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID54610',50,'LPB事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID56303',51,'XYOステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID56944',52,'VINステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID57507',53,'GBEステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID57740',54,'QLHサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID57944',55,'MCP事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID57984',56,'LXYステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID60004',57,'SLXホーム','0',NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID60414',58,'YQL事業所','0',NULL,NULL,NULL,NULL,NULL,0,1,0),('KID60451',59,'ZMMステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID62505',60,'LQQサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID62816',61,'KYYホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID63160',62,'LWAサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID63177',63,'VVDホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID64117',64,'HMHホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID65172',65,'CQXステーション','0',NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID66400',66,'DFSサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID66863',67,'TERサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID68661',68,'VPKサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID69629',69,'LEJホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID70680',70,'HNOホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID71106',71,'CNPホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID71644',72,'JAHステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID71925',73,'ZYUステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID71988',74,'SKIホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID73153',75,'FUGステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID74418',76,'BYM事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID76430',77,'PXWサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID76696',78,'JXBステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID77160',79,'ABPホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID77576',80,'KAK事業所','1111-000','afafa','faf;lj','fafj','111','111',1,0,1),('KID77891',81,'PJN事業所','3122','大阪府豊中市3-4','大熊猫','営業部','03-6712-3212','080-1343-1343',0,1,0),('KID79115',82,'IMWステーション','0',NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID79548',83,'VZBステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID80253',84,'YZOステーション','0',NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID82466',85,'RUN事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID82472',86,'FXQサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID83014',87,'BXG事業所',NULL,NULL,NULL,NULL,NULL,NULL,1,0,1),('KID83015',88,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL),('KID84785',89,'ITJホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID85143',90,'RFSホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID87386',91,'AVN事業所','0',NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID87388',92,'YHW事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID91369',93,'SLPステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID92232',94,'WEKサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID92468',95,'YAQホーム改5','1234','豊中市','厚別','システムB',NULL,NULL,0,1,0),('KID93084',96,'ZRT事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID94934',97,'KQHサービスセンター',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID95975',98,'SPUステーション',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID97449',99,'XYMホーム',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID97450',100,NULL,'0',NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID98368',101,'SVI事業所',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID98369',102,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0),('KID98370',103,'A訪問看護ステーション','12341111','東京都太田区北千束1-2-3','介護オーナー','介護情報部','090-333-3333','080-333-3333',NULL,NULL,NULL),('KID98371',104,NULL,'0',NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID98372',105,NULL,'123-456','住所','担当者','所属','090-','12-',0,1,NULL),('KID98373',106,NULL,'1111-222','住所','担当者','所蔵','090','fax',0,1,0),('KID98374',107,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL),('KID08385',108,'KRVステーション　拠点2',NULL,NULL,NULL,NULL,NULL,NULL,0,1,1),('KID88888',112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('KID88888',113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('KID88888',114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),('KID98375',124,'B訪問看護ステーション','12341111','東京都太田区北千束1-2-3','介護オーナー','介護情報部','090-333-3333','080-333-3333',0,1,1),('KID98376',126,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0),('KID98377',127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1);
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

-- Dump completed on 2017-07-23 22:28:43
