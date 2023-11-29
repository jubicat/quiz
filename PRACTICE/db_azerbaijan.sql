-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: azerbaijan
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrative_divisions`
--

DROP TABLE IF EXISTS `administrative_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrative_divisions` (
  `division_id` int unsigned NOT NULL AUTO_INCREMENT,
  `division_name` varchar(40) NOT NULL,
  `azerbaijani_name` varchar(40) NOT NULL,
  `capital` varchar(40) DEFAULT NULL,
  `area` float(10,2) NOT NULL,
  `population` int NOT NULL,
  `region` varchar(40) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrative_divisions`
--

LOCK TABLES `administrative_divisions` WRITE;
/*!40000 ALTER TABLE `administrative_divisions` DISABLE KEYS */;
INSERT INTO `administrative_divisions` VALUES (1,'Absheron District','Ab┼ƒeron','Xirdalan',1360.00,192900,'Absheron','Includes an exclave in Baku'),(2,'Aghjabadi District','A─ƒcab╔Ödi','Aghjabadi',1760.00,124000,'Aran',NULL),(3,'Agdam District','A─ƒdam','Alibeyli',1150.00,180600,'Yukhari-Karabakh',NULL),(4,'Agdash District','A─ƒda┼ƒ','Agdash',1050.00,100600,'Aran',NULL),(5,'Agstafa District','A─ƒstafa','Agstafa',1500.00,81400,'Ganja-Qazakh',NULL),(6,'Agsu District','A─ƒsu','Agsu',1020.00,72100,'Daglig-Shirvan',NULL),(7,'Shirvan (city)','┼×irvan',NULL,30.00,78700,'Aran','Named Ali Bayramli (ãÅli Bayraml─▒) until April 24, 2008'),(8,'Astara District','Astara','Astara',620.00,98300,'Lankaran',NULL),(9,'Baku (city)','Bak─▒',NULL,2130.00,2092400,'Absheron','Comprising 12 rayonlar it is the capital and largest city of Azerbaijan'),(10,'Balakan District','Balak╔Ön','Balakan',920.00,91100,'Shaki-Zaqatala',NULL),(11,'Barda District','B╔Örd╔Ö','Barda',960.00,143900,'Aran',NULL),(12,'Beylagan District','Beyl╔Öqan','Beylagan',1130.00,87900,'Aran',NULL),(13,'Bilasuvar District','Bil╔Ösuvar','Bilasuvar',1400.00,90300,'Aran',NULL),(14,'Jabrayil District','C╔Öbray─▒l','Jabrayil',1050.00,72700,'Yukhari-Karabakh',NULL),(15,'Jalilabad District','C╔Ölilabad','Jalilabad',1440.00,196500,'Lankaran',NULL),(16,'Dashkasan District','Da┼ƒk╔Ös╔Ön','Da┼ƒk╔Ös╔Ön',1050.00,33200,'Ganja-Qazakh',NULL),(17,'Shabran District','┼×abran','Shabran',1090.00,53000,'Quba-Khachmaz','Named Davachi (D╔Öv╔Ö├ºi) until 2010'),(18,'Fuzuli District','F├╝zuli','F├╝zuli',1390.00,118900,'Yukhari-Karabakh',NULL),(19,'Gadabay District','G╔Öd╔Öb╔Öy','Gadabay',1290.00,95000,'Ganja-Qazakh',NULL),(20,'Ganja┬á(city)','G╔Önc╔Ö',NULL,110.00,316300,'Ganja-Qazakh','Azerbaijan\'s second-largest city'),(21,'Goranboy District','Goranboy','Goranboy',1760.00,96200,'Ganja-Qazakh',NULL),(22,'Goychay District','G├Ây├ºay','Goychay',740.00,111100,'Aran',NULL),(23,'Hajigabul District','Hac─▒qabul','Hajiqabul',1640.00,67300,'Aran',NULL),(24,'Imishli District','─░mi┼ƒli','Imishli',1820.00,116600,'Aran',NULL),(25,'Ismailli District','─░smay─▒ll─▒','Ismailli',2060.00,80900,'Daglig-Shirvan',NULL),(26,'Kalbajar District','K╔Ölb╔Öc╔Ör','Kalbajar',3050.00,83200,'Kalbajar-Lachin',NULL),(27,'Kurdamir District','K├╝rd╔Ömir','Kurdamir',1630.00,105700,'Aran',NULL),(28,'Lachin District','La├º─▒n','Lachin',1840.00,70900,'Kalbajar-Lachin',NULL),(29,'Lankaran District','L╔Önk╔Öran','Lankaran',1540.00,209900,'Lankaran',NULL),(30,'Lankaran┬á(city)','L╔Önk╔Öran',NULL,70.00,83300,'Lankaran',NULL),(31,'Lerik District','Lerik','Lerik',1080.00,76400,'Lankaran',NULL),(32,'Masally District','Masall─▒','Masally',720.00,202500,'Lankaran',NULL),(33,'Mingachevir┬á(city)','Ming╔Ö├ºevir',NULL,130.00,97800,'Aran',NULL),(34,'Naftalan┬á(city)','Naftalan',NULL,30.00,9100,'Ganja-Qazakh',NULL),(35,'Neftchala District','Neft├ºala','Neftchala',1450.00,81300,'Aran',NULL),(36,'Oghuz District','O─ƒuz','Oghuz',1220.00,40900,'Shaki-Zaqatala',NULL),(37,'Qabala District','Q╔Öb╔Öl╔Ö','Qabala',1550.00,95600,'Shaki-Zaqatala',NULL),(38,'Qakh District','Qax','Qakh',1490.00,53900,'Shaki-Zaqatala',NULL),(39,'Qazakh District','Qazax','Qazakh',700.00,90800,'Ganja-Qazakh',NULL),(40,'Gobustan District','Qobustan','Gobustan',1370.00,41100,'Daglig-Shirvan',NULL),(41,'Quba District','Quba','Quba',2580.00,155600,'Quba-Khachmaz',NULL),(42,'Qubadli District','Qubadl─▒','Qubadli',800.00,36700,'Kalbajar-Lachin',NULL),(43,'Qusar District','Qusar','Qusar',1540.00,89300,'Quba-Khachmaz',NULL),(44,'Saatly District','Saatl─▒','Saatly',1180.00,95100,'Aran',NULL),(45,'Sabirabad District','Sabirabad','Sabirabad',1470.00,155400,'Aran',NULL),(46,'Shaki District','┼×╔Öki','Shaki',2430.00,173500,'Shaki-Zaqatala',NULL),(47,'Shaki┬á(city)','┼×╔Öki',NULL,9.00,63700,'Shaki-Zaqatala',NULL),(48,'Salyan District','Salyan','Salyan',1790.00,124900,'Aran',NULL),(49,'Shamakhi District','┼×amax─▒','Shamakhi',1610.00,93700,'Daglig-Shirvan',NULL),(50,'Shamkir District','┼×╔Ömkir','Shamkir',1660.00,196100,'Ganja-Qazakh',NULL),(51,'Samukh District','Samux','Nebiagali',1450.00,54600,'Ganja-Qazakh',NULL),(52,'Siazan District','Siy╔Öz╔Ön','Siazan',700.00,38400,'Quba-Khachmaz',NULL),(53,'Sumqayit┬á(city)','Sumqay─▒t',NULL,80.00,314800,'Absheron',NULL),(54,'Shusha District','┼×u┼ƒa','Shusha',290.00,29700,'Yukhari-Karabakh',NULL),(55,'Shusha┬á(city)','┼×u┼ƒa',NULL,5.50,4100,'Yukhari-Karabakh',NULL),(56,'Tartar District','T╔Ört╔Ör','Tartar',960.00,98400,'Yukhari-Karabakh',NULL),(57,'Tovuz District','Tovuz','Tovuz',1900.00,160700,'Ganja-Qazakh',NULL),(58,'Ujar District','Ucar','Ujar',850.00,79800,'Aran',NULL),(59,'Khachmaz District','Xa├ºmaz','Khachmaz',1050.00,162100,'Quba-Khachmaz',NULL),(60,'Khankendi┬á(city)','Xank╔Öndi',NULL,8.00,55200,'Yukhari-Karabakh',NULL),(61,'Goygol District','G├Âyg├Âl','Goygol',1030.00,58300,'Ganja-Qazakh','Formerly Khanlar'),(62,'Khizi District','X─▒z─▒','Khizi',1850.00,14700,'Absheron',NULL),(63,'Khojaly District','Xocal─▒','Khojali',940.00,26500,'Yukhari-Karabakh',NULL),(64,'Khojavend District','Xocav╔Önd','Khojavend',1460.00,42100,'Yukhari-Karabakh',NULL),(65,'Yardymli District','Yard─▒ml─▒','Yardymli',670.00,59600,'Lankaran',NULL),(66,'Yevlakh District','Yevlax','Yevlakh',1540.00,119600,'Aran',NULL),(67,'Yevlakh┬á(city)','Yevlax',NULL,95.00,59036,'Aran',NULL),(68,'Zangilan District','Z╔Öngilan','Zangilan',710.00,40500,'Kalbajar-Lachin',NULL),(69,'Zaqatala District','Zaqatala','Zaqatala',1350.00,120300,'Shaki-Zaqatala',NULL),(70,'Zardab District','Z╔Ördab','Zardab',860.00,54000,'Aran',NULL);
/*!40000 ALTER TABLE `administrative_divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `region_id` int unsigned NOT NULL AUTO_INCREMENT,
  `region_name` varchar(50) NOT NULL,
  `area` float(10,2) NOT NULL,
  `population` int NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Absheron',5420.00,2613300),(2,'Ganja-Qazakh',12480.00,1191700),(3,'Shaki-Zaqatala',8969.00,543400),(4,'Lankaran',6140.00,926500),(5,'Guba-Khachmaz',6960.00,498400),(6,'Aran',23375.00,1893036),(7,'Upper Karabakh',7253.50,628200),(8,'Kalbajar-Lachin',6400.00,231300),(9,'Mountainous Shirvan',6060.00,287800),(10,'Nakhchivan',5550.00,414900);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-19  0:22:37
