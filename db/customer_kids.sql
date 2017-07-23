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
-- Table structure for table `kids`
--

DROP TABLE IF EXISTS `kids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kid` varchar(9) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `userkey` varchar(6) DEFAULT NULL,
  `server` varchar(6) DEFAULT NULL,
  `db_password` varchar(45) DEFAULT NULL,
  `fenics_key` varchar(10) DEFAULT NULL,
  `number_pc` int(4) DEFAULT '0',
  `environment_id` int(2) DEFAULT NULL,
  `has_mobile` int(1) DEFAULT '0',
  `number_id` int(3) DEFAULT '0',
  `start_id` int(11) DEFAULT '0',
  `is_new_contract` int(1) DEFAULT NULL,
  `is_registered` int(1) DEFAULT '0',
  `create_user_id` int(11) DEFAULT NULL,
  `create_on` date DEFAULT NULL,
  `register_on` date DEFAULT NULL,
  PRIMARY KEY (`id`,`kid`),
  UNIQUE KEY `kid_UNIQUE` (`kid`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `db_password_UNIQUE` (`db_password`),
  UNIQUE KEY `userkey_UNIQUE` (`userkey`),
  UNIQUE KEY `fenics_key_UNIQUE` (`fenics_key`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kids`
--

LOCK TABLES `kids` WRITE;
/*!40000 ALTER TABLE `kids` DISABLE KEYS */;
INSERT INTO `kids` VALUES (5,'KID77891','PJN事業所','UYAQES','AP2-5','UPJNPN','pjn',6,3,0,50,10,NULL,1,2,'2016-09-24','2016-09-24'),(6,'KID92468','YAQホーム改5','VERVRA','AP2-4','UYAQDA','yacc',10,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(7,'KID60414','YQL事業所','YQLBW','AP1-3','UYQLBW','yglq',8,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(9,'KID42357','YTWステーション','YTWBV','AP2-3','UYTWBV','ytwu',3,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(10,'KID77576','KAK事業所',NULL,'AP1-1',NULL,NULL,5,1,1,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(11,'KID06320','NFGステーション','NFGGL','AP5-5','UNFGGL','nfgc',3,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(12,'KID56303','XYOステーション','XYOUJ','AP3-2','UXYOUJ','xyo',3,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(13,'KID60451','ZMMステーション','ZMMCW','AP3-5','UZMMCW','zmm',3,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(14,'KID83014','BXG事業所',NULL,NULL,NULL,NULL,3,2,1,0,0,NULL,1,2,'2016-09-24','2016-09-24'),(15,'KID08385','KRVステーション',NULL,NULL,NULL,'aaaa',5,2,1,0,0,NULL,1,2,'2016-09-24','2016-09-24'),(16,'KID29537','TUHサービスセンター','TUHDM','AP2-5','UTUHDM','tuh',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(18,'KID62505','LQQサービスセンター','LQQJX','AP4-5','ULQQJX','lqq',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(19,'KID35321','CBOホーム','CBOVD','AP5-2','UCBOVD','cbo',4,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(20,'KID87388','YHW事業所','YHWWZ','AP5-5','UYHWWZ','yhw',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(21,'KID02907','RGPホーム','RGPPS','AP3-1','URGPPS','rgp',2,3,0,50,101,NULL,1,2,'2016-09-24','2016-09-24'),(22,'KID57507','GBEステーション','GBEQD','AP4-2','UGBEQD','gbe',2,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(23,'KID09154','FHKサービスセンター','FHKUE','AP3-3','UFHKUE','fhk',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(24,'KID19837','JAOステーション','JAOAN','AP1-4','UJAOAN','jao',1,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(25,'KID05015','QUJホーム','QUJVK','AP3-2','UQUJVK','quj',1,3,0,50,251,NULL,1,3,'2016-09-24','2016-09-24'),(26,'KID69629','LEJホーム','LEJHA','AP3-4','ULEJHA','lej',1,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(27,'KID79115','IMWステーション','IMWNJ','AP5-1','UIMWNJ','imw',4,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(28,'KID54610','LPB事業所','LPBHE','AP3-4','ULPBHE','lpb',1,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(29,'KID48263','LZEステーション','LZEQJ','AP5-3','ULZEQJ','lze',1,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(30,'KID66400','DFSサービスセンター','DFSUD','AP4-1','UDFSUD','dfs',1,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(31,'KID60004','SLXホーム','SLXXO','AP1-4','USLXXO','slx',5,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(32,'KID80253','YZOステーション','YZOBI','AP4-5','UYZOBI','yzo',2,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(33,'KID71644','JAHステーション','JAHGD','AP4-2','UJAHGD','jah',1,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(34,'KID16930','HVWサービスセンター','HVWVZ','AP3-1','UHVWVZ','hvw',2,3,0,50,1000,NULL,1,3,'2016-09-24','2016-09-24'),(35,'KID16879','JFZホーム','JFZJH','AP4-3','UJFZJH','jfz',2,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(36,'KID54041','ERPステーション','ERPTF','AP4-4','UERPTF','erp',3,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(37,'KID85143','RFSホーム','RFSHM','AP3-2','URFSHM','rfs',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(38,'KID74418','BYM事業所','BYMUS','AP2-1','UBYMUS','bym',2,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(39,'KID77160','ABPホーム','ABPBN','AP5-1','UABPBN','abp',2,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(40,'KID10552','RWI事業所','RWIOH','AP5-4','URWIOH','rwi',2,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(41,'KID21748','ATW事業所','ATWGU','AP1-5','UATWGU','atw',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(42,'KID95975','SPUステーション','SPUXI','AP1-4','USPUXI','spu',2,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(43,'KID28748','KIVサービスセンター','KIVVP','AP1-3','UKIVVP','kiv',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(44,'KID24326','KFD事業所','KFDMX','AP5-4','UKFDMX','kfd',2,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(45,'KID48053','JRO事業所','JROKE','AP1-2','UJROKE','jro',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(46,'KID16915','RLM事業所','RLMGZ','AP5-2','URLMGZ','rlm',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(47,'KID18298','YBZステーション','YBZXG','AP2-2','UYBZXG','ybz',3,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(48,'KID20749','ZXN事業所','ZXNJJ','AP5-1','UZXNJJ','zxn',3,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(49,'KID35925','VWDサービスセンター','VWDVC','AP1-5','UVWDVC','vwd',3,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(50,'KID76430','PXWサービスセンター','PXWSF','AP5-1','UPXWSF','pxw',3,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(51,'KID97449','XYMホーム','XYMMS','AP5-4','UXYMMS','xym',3,3,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(52,'KID73153','FUGステーション','FUGNG','AP3-2','UFUGNG','fug',2,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(53,'KID57944','MCP事業所','MCPVZ','AP1-1','UMCPVZ','mcp',2,3,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(54,'KID24500','JVAステーション','JVADI','AP2-5','UJVADI','jva',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(55,'KID76696','JXBステーション','JXBZI','AP1-4','UJXBZI','jxb',2,3,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(56,'KID71106','CNPホーム','CNPJH','LAP5-5','UCNPJH','cnp',3,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(57,'KID57740','QLHサービスセンター','QLHZF','LAP2-5','UQLHZF','qlh',2,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(58,'KID25897','JYZホーム','JYZVJ','LAP3-5','UJYZVJ','jyz',2,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(59,'KID36461','JLYホーム','JLYOL','LAP4-2','UJLYOL','jly',2,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(60,'KID94934','KQHサービスセンター','KQHCQ','LAP2-2','UKQHCQ','kqh',2,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(61,'KID62816','KYYホーム','KYYBW','LAP5-3','UKYYBW','kyy',2,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(62,'KID16319','PMXホーム','PMXOE','LAP5-1','UPMXOE','pmx',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(63,'KID13032','UYUサービスセンター','UYUXB','LAP4-4','UUYUXB','uyu',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(64,'KID84785','ITJホーム','ITJZY','LAP1-1','UITJZY','itj',3,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(65,'KID52090','MIVサービスセンター','MIVZR','LAP2-5','UMIVZR','miv',1,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(66,'KID57984','LXYステーション','LXYFY','LAP4-1','ULXYFY','lxy',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(67,'KID23214','OTMサービスセンター','OTMHT','LAP3-5','UOTMHT','otm',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(68,'KID48845','IYCステーション','IYCUT','LAP1-4','UIYCUT','iyc',1,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(69,'KID63160','LWAサービスセンター','LWAPO','LAP3-4','ULWAPO','lwa',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(70,'KID87386','AVN事業所','AVNQR','LAP5-1','UAVNQR','avn',5,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(71,'KID15852','IFHサービスセンター','IFHOI','LAP2-4','UIFHOI','ifh',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(72,'KID14815','KEQ事業所','KEQKU','LAP4-2','UKEQKU','keq',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(73,'KID25144','VCI事業所','VCILY','LAP4-5','UVCILY','vci',1,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(74,'KID46502','CGXサービスセンター','CGXXV','LAP5-3','UCGXXV','cgx',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(75,'KID40831','TGEホーム','TGEOP','LAP4-4','UTGEOP','tge',1,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(76,'KID91369','SLPステーション','SLPHY','LAP1-2','USLPHY','slp',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(77,'KID31971','DMYサービスセンター','DMYVC','LAP1-2','UDMYVC','dmy',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(78,'KID40357','NMNホーム','NMNML','LAP2-3','UNMNML','nmn',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(79,'KID06724','JFIサービスセンター','JFIQC','LAP4-3','UJFIQC','jfi',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(80,'KID71988','SKIホーム','SKIZO','LAP1-1','USKIZO','ski',1,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(81,'KID28129','GBYホーム','GBYYE','LAP3-1','UGBYYE','gby',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(82,'KID68661','VPKサービスセンター','VPKMJ','LAP4-3','UVPKMJ','vpk',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(83,'KID56944','VINステーション','VINJH','LAP5-3','UVINJH','vin',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(84,'KID82472','FXQサービスセンター','FXQDO','LAP1-4','UFXQDO','fxq',1,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(85,'KID64117','HMHホーム','HMHPH','LAP3-3','UHMHPH','hmh',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(86,'KID37133','DZYサービスセンター','DZYIN','LAP2-4','UDZYIN','dzy',1,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(87,'KID31088','PUK事業所','PUKHU','LAP1-3','UPUKHU','puk',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(88,'KID45353','FQPホーム','FQPKI','LAP3-2','UFQPKI','fqp',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(89,'KID92232','WEKサービスセンター','WEKEB','LAP5-4','UWEKEB','wek',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(90,'KID65172','CQXステーション','CQXOT','LAP1-4','UCQXOT','cqx',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(91,'KID93084','ZRT事業所','ZRTLC','LAP4-3','UZRTLC','zrt',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(92,'KID09563','XXG事業所','XXGWP','LAP4-3','UXXGWP','xxg',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(93,'KID14835','EFT事業所','EFTVU','LAP1-3','UEFTVU','eft',1,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(94,'KID70680','HNOホーム','HNOJW','LAP5-5','UHNOJW','hno',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(95,'KID00824','MMMサービスセンター','MMMRG','LAP1-2','UMMMRG','mmm',9,4,0,50,501,NULL,1,1,'2016-09-24','2016-09-24'),(96,'KID71925','ZYUステーション','ZYUYG','LAP4-1','UZYUYG','zyu',1,4,0,50,0,NULL,1,2,'2016-09-24','2016-09-24'),(97,'KID66863','TERサービスセンター','TERCF','LAP1-3','UTERCF','ter',1,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(98,'KID30141','OAAホーム','OAAOW','LAP2-5','UOAAOW','oaa',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(99,'KID63177','VVDホーム','VVDIL','LAP2-2','UVVDIL','vvd',1,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(100,'KID98368','SVI事業所','SVIHT','LAP4-2','USVIHT','svi',1,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(101,'KID12094','LGD事業所','LGDIY','LAP4-2','ULGDIY','lgd',3,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(102,'KID82466','RUN事業所','RUNSB','LAP4-1','URUNSB','run',3,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(103,'KID79548','VZBステーション','VZBCM','LAP5-4','UVZBCM','vzb',3,4,0,50,0,NULL,1,3,'2016-09-24','2016-09-24'),(104,'KID37266','RCSステーション','RCSID','LAP2-1','URCSID','rcs',3,4,0,50,0,NULL,1,1,'2016-09-24','2016-09-24'),(105,'KID50444','YYYセンター','YYYYY','LAP1-2','UYYYYY','yyyy',3,4,0,50,0,NULL,1,1,'2016-09-25','2016-09-25'),(106,'KID98369',NULL,'ZAXAEM','LAP1-1','UVTCJGT',NULL,0,4,0,0,0,NULL,0,1,'2017-05-14','2017-05-14'),(107,'KID98370','A訪問看護ステーション','YLTXPD','LAP2-3','UIQFLQA',NULL,0,4,0,0,0,NULL,1,1,'2017-05-14','2017-05-14'),(111,'KID97450',NULL,'CJHKCO','AP1-3','UZWHFLZ','bea',11,3,0,0,0,NULL,0,2,'2017-05-21','2017-05-21'),(115,'KID98371',NULL,'DHQRBY','LAP1-4','UOCNILQ','xwr',4,4,0,0,0,NULL,0,1,'2017-05-25','2017-05-25'),(120,'KID83015',NULL,'QYAHRK','','UKOPSXO','bnm',0,2,0,0,0,NULL,0,1,'2017-05-30','2017-05-30'),(122,'KID98372',NULL,'IQQYYV','LAP1-1','UFRCVYH','kie',0,4,0,0,0,NULL,0,1,'2017-06-17','2017-06-17'),(123,'KID98373',NULL,'RAUQHD','LAP1-1','UUOZHNN','aif',3,4,0,0,0,NULL,0,1,'2017-06-17','2017-06-17'),(125,'KID97451',NULL,'YGNBBD','AP1-1','UQZXVAC','hwr',0,3,0,0,0,NULL,0,1,'2017-06-20',NULL),(126,'KID98374','jh','ORMZNM','LAP1-1','UYXISGJ','ili',0,4,0,0,0,NULL,0,1,'2017-06-20',NULL),(136,'KID98375',NULL,'SBBAZR','LAP1-1','UGNLTYF','wlm',12,4,0,0,0,NULL,1,1,'2017-07-05','2017-07-05'),(138,'KID98376',NULL,'GTXRCD','LAP1-1','UQKQOQA','nar',0,4,0,0,0,NULL,0,1,'2017-07-09',NULL),(139,'KID98377',NULL,'VXYNVF','LAP1-1','ULRJEOI','mgi',2,4,0,0,0,NULL,0,1,'2017-07-12',NULL);
/*!40000 ALTER TABLE `kids` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-23 22:28:44
