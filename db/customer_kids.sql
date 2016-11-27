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
-- Table structure for table `kids`
--

DROP TABLE IF EXISTS `kids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kid` varchar(9) NOT NULL,
  `server` varchar(5) NOT NULL,
  `genics` varchar(10) NOT NULL,
  `userkey` varchar(5) NOT NULL,
  `update_on` datetime DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`kid`),
  UNIQUE KEY `kid_UNIQUE` (`kid`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kids`
--

LOCK TABLES `kids` WRITE;
/*!40000 ALTER TABLE `kids` DISABLE KEYS */;
INSERT INTO `kids` VALUES (5,'KID77891','AP2-5','pjn','PJNPN','2016-09-24 00:12:37',2),(6,'KID92468','AP2-4','yaq','YAQDF','2016-09-24 00:12:37',1),(7,'KID60414','AP1-3','yql','YQLBW','2016-09-24 00:12:37',1),(8,'KID95866','AP3-1','oxk','OXKZO','2016-09-24 00:12:37',2),(9,'KID42357','AP2-3','ytw','YTWBV','2016-09-24 00:12:37',3),(10,'KID77576','AP3-1','kak','KAKCD','2016-09-24 00:12:38',1),(11,'KID06320','AP5-5','nfg','NFGGL','2016-09-24 00:12:38',2),(12,'KID56303','AP3-2','xyo','XYOUJ','2016-09-24 00:12:38',3),(13,'KID60451','AP3-5','zmm','ZMMCW','2016-09-24 00:12:38',2),(14,'KID83014','AP1-2','bxg','BXGNQ','2016-09-24 00:12:38',2),(15,'KID08385','AP1-5','krv','KRVQH','2016-09-24 00:12:38',2),(16,'KID29537','AP2-5','tuh','TUHDM','2016-09-24 00:12:38',2),(17,'KID10177','AP2-4','kst','KSTFX','2016-09-24 00:12:38',1),(18,'KID62505','AP4-5','lqq','LQQJX','2016-09-24 00:12:38',2),(19,'KID35321','AP5-2','cbo','CBOVD','2016-09-24 00:12:38',1),(20,'KID87388','AP5-5','yhw','YHWWZ','2016-09-24 00:12:38',2),(21,'KID02907','AP3-1','rgp','RGPPS','2016-09-24 00:12:38',2),(22,'KID57507','AP4-2','gbe','GBEQD','2016-09-24 00:12:38',1),(23,'KID09154','AP3-3','fhk','FHKUE','2016-09-24 00:12:38',2),(24,'KID19837','AP1-4','jao','JAOAN','2016-09-24 00:12:38',3),(25,'KID05015','AP3-2','quj','QUJVK','2016-09-24 00:12:38',3),(26,'KID69629','AP3-4','lej','LEJHA','2016-09-24 00:12:38',2),(27,'KID79115','AP5-1','imw','IMWNJ','2016-09-24 00:12:38',1),(28,'KID54610','AP3-4','lpb','LPBHE','2016-09-24 00:12:38',3),(29,'KID48263','AP5-3','lze','LZEQJ','2016-09-24 00:12:38',2),(30,'KID66400','AP4-1','dfs','DFSUD','2016-09-24 00:12:38',3),(31,'KID60004','AP1-4','slx','SLXXO','2016-09-24 00:12:38',1),(32,'KID80253','AP4-5','yzo','YZOBI','2016-09-24 00:12:38',1),(33,'KID71644','AP4-2','jah','JAHGD','2016-09-24 00:12:38',3),(34,'KID16930','AP3-1','hvw','HVWVZ','2016-09-24 00:12:38',3),(35,'KID16879','AP4-3','jfz','JFZJH','2016-09-24 00:12:38',3),(36,'KID54041','AP4-3','erp','ERPTF','2016-09-24 00:12:39',1),(37,'KID85143','AP3-2','rfs','RFSHM','2016-09-24 00:12:39',2),(38,'KID74418','AP2-1','bym','BYMUS','2016-09-24 00:12:39',3),(39,'KID77160','AP5-1','abp','ABPBN','2016-09-24 00:12:39',3),(40,'KID10552','AP5-4','rwi','RWIOH','2016-09-24 00:12:39',3),(41,'KID21748','AP1-5','atw','ATWGU','2016-09-24 00:12:39',2),(42,'KID95975','AP1-4','spu','SPUXI','2016-09-24 00:12:39',3),(43,'KID28748','AP1-3','kiv','KIVVP','2016-09-24 00:12:39',2),(44,'KID24326','AP5-4','kfd','KFDMX','2016-09-24 00:12:39',1),(45,'KID48053','AP1-2','jro','JROKE','2016-09-24 00:12:40',2),(46,'KID16915','AP5-2','rlm','RLMGZ','2016-09-24 00:12:40',2),(47,'KID18298','AP2-2','ybz','YBZXG','2016-09-24 00:12:40',2),(48,'KID20749','AP5-1','zxn','ZXNJJ','2016-09-24 00:12:40',3),(49,'KID35925','AP1-5','vwd','VWDVC','2016-09-24 00:12:40',1),(50,'KID76430','AP5-1','pxw','PXWSF','2016-09-24 00:12:40',3),(51,'KID97449','AP5-4','xym','XYMMS','2016-09-24 00:12:40',1),(52,'KID73153','AP3-2','fug','FUGNG','2016-09-24 00:12:40',3),(53,'KID57944','AP1-2','mcp','MCPVZ','2016-09-24 00:12:40',3),(54,'KID24500','AP2-5','jva','JVADI','2016-09-24 00:12:40',2),(55,'KID76696','AP1-4','jxb','JXBZI','2016-09-24 00:12:40',2),(56,'KID71106','AP5-5','cnp','CNPJH','2016-09-24 00:12:40',1),(57,'KID57740','AP2-5','qlh','QLHZF','2016-09-24 00:12:40',3),(58,'KID25897','AP3-5','jyz','JYZVJ','2016-09-24 00:12:40',1),(59,'KID36461','AP4-2','jly','JLYOL','2016-09-24 00:12:41',1),(60,'KID94934','AP2-2','kqh','KQHCQ','2016-09-24 00:12:41',2),(61,'KID62816','AP5-3','kyy','KYYBW','2016-09-24 00:12:41',2),(62,'KID16319','AP5-1','pmx','PMXOE','2016-09-24 00:12:41',2),(63,'KID13032','AP4-4','uyu','UYUXB','2016-09-24 00:12:41',2),(64,'KID84785','AP1-1','itj','ITJZY','2016-09-24 00:12:41',3),(65,'KID52090','AP2-5','miv','MIVZR','2016-09-24 00:12:41',3),(66,'KID57984','AP4-1','lxy','LXYFY','2016-09-24 00:12:41',2),(67,'KID23214','AP3-5','otm','OTMHT','2016-09-24 00:12:41',2),(68,'KID48845','AP1-4','iyc','IYCUT','2016-09-24 00:12:41',3),(69,'KID63160','AP3-5','lwa','LWAPO','2016-09-24 00:12:41',2),(70,'KID87386','AP5-1','avn','AVNQR','2016-09-24 00:12:41',1),(71,'KID15852','AP2-4','ifh','IFHOI','2016-09-24 00:12:41',2),(72,'KID14815','AP4-2','keq','KEQKU','2016-09-24 00:12:41',2),(73,'KID25144','AP4-5','vci','VCILY','2016-09-24 00:12:41',3),(74,'KID46502','AP5-3','cgx','CGXXV','2016-09-24 00:12:41',1),(75,'KID40831','AP4-4','tge','TGEOP','2016-09-24 00:12:41',3),(76,'KID91369','AP1-2','slp','SLPHY','2016-09-24 00:12:41',1),(77,'KID31971','AP1-2','dmy','DMYVC','2016-09-24 00:12:41',1),(78,'KID40357','AP2-3','nmn','NMNML','2016-09-24 00:12:41',1),(79,'KID06724','AP4-3','jfi','JFIQC','2016-09-24 00:12:41',2),(80,'KID71988','AP1-1','ski','SKIZO','2016-09-24 00:12:41',3),(81,'KID28129','AP3-2','gby','GBYYE','2016-09-24 00:12:41',1),(82,'KID68661','AP4-3','vpk','VPKMJ','2016-09-24 00:12:41',1),(83,'KID56944','AP5-3','vin','VINJH','2016-09-24 00:12:41',1),(84,'KID82472','AP1-4','fxq','FXQDO','2016-09-24 00:12:42',3),(85,'KID64117','AP3-3','hmh','HMHPH','2016-09-24 00:12:42',1),(86,'KID37133','AP2-4','dzy','DZYIN','2016-09-24 00:12:42',3),(87,'KID31088','AP1-3','puk','PUKHU','2016-09-24 00:12:42',2),(88,'KID45353','AP3-2','fqp','FQPKI','2016-09-24 00:12:42',1),(89,'KID92232','AP5-4','wek','WEKEB','2016-09-24 00:12:42',2),(90,'KID65172','AP1-4','cqx','CQXOT','2016-09-24 00:12:42',2),(91,'KID93084','AP4-3','zrt','ZRTLC','2016-09-24 00:12:42',1),(92,'KID09563','AP4-3','xxg','XXGWP','2016-09-24 00:12:42',2),(93,'KID14835','AP1-3','eft','EFTVU','2016-09-24 00:12:42',3),(94,'KID70680','AP5-5','hno','HNOJW','2016-09-24 00:12:42',1),(95,'KID00824','AP4-2','mmm','MMMRG','2016-09-24 00:12:42',1),(96,'KID71925','AP4-1','zyu','ZYUYG','2016-09-24 00:12:42',2),(97,'KID66863','AP1-3','ter','TERCF','2016-09-24 00:12:42',3),(98,'KID30141','AP2-5','oaa','OAAOW','2016-09-24 00:12:42',1),(99,'KID63177','AP2-2','vvd','VVDIL','2016-09-24 00:12:42',1),(100,'KID98368','AP4-2','svi','SVIHT','2016-09-24 00:12:42',3),(101,'KID12094','AP4-2','lgd','LGDIY','2016-09-24 00:12:42',1),(102,'KID82466','AP4-1','run','RUNSB','2016-09-24 00:12:42',3),(103,'KID79548','AP5-4','vzb','VZBCM','2016-09-24 00:12:42',3),(104,'KID37266','AP2-2','rcs','RCSID','2016-09-24 00:12:42',1),(105,'KID50444','AP1-2','yyyy','YYYYY','2016-09-25 20:26:54',1),(106,'','','','','2016-09-25 20:51:44',1);
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

-- Dump completed on 2016-11-27 17:51:02
