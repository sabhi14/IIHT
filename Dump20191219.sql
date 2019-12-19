-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: stockexchange
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `boardof_directors` varchar(255) DEFAULT NULL,
  `brief_write_up` varchar(255) DEFAULT NULL,
  `ceo_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `is_company_blocked` bit(1) NOT NULL,
  `listed_in_stock_exchanges` bit(1) DEFAULT NULL,
  `stock_code` varchar(255) DEFAULT NULL,
  `turnover` bigint(20) NOT NULL,
  `sector` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  KEY `FKbvan8smq7yndgj8l32tuehcst` (`sector`),
  CONSTRAINT `FKbvan8smq7yndgj8l32tuehcst` FOREIGN KEY (`sector`) REFERENCES `sectors` (`sector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (16),(16),(16),(16);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipodetails`
--

DROP TABLE IF EXISTS `ipodetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipodetails` (
  `ipo_id` bigint(20) NOT NULL,
  `numberof_shares` int(11) NOT NULL,
  `price_per_share` double NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `company_name` bigint(20) DEFAULT NULL,
  `stock_exchange` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ipo_id`),
  KEY `FKsxdb70q42pts3cud3772g73xt` (`company_name`),
  KEY `FKk2gssh2n7xupn9a96qtpbwblr` (`stock_exchange`),
  CONSTRAINT `FKk2gssh2n7xupn9a96qtpbwblr` FOREIGN KEY (`stock_exchange`) REFERENCES `stock_exchange` (`stock_exchange_id`),
  CONSTRAINT `FKsxdb70q42pts3cud3772g73xt` FOREIGN KEY (`company_name`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipodetails`
--

LOCK TABLES `ipodetails` WRITE;
/*!40000 ALTER TABLE `ipodetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipodetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ro_id` int(11) NOT NULL AUTO_INCREMENT,
  `ro_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectors` (
  `sector_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brief` varchar(255) DEFAULT NULL,
  `sector_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
INSERT INTO `sectors` VALUES (1,'IT','IT'),(2,'Finance','Finance');
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_exchange`
--

DROP TABLE IF EXISTS `stock_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_exchange` (
  `stock_exchange_id` bigint(20) NOT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `stock_exchange_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stock_exchange_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_exchange`
--

LOCK TABLES `stock_exchange` WRITE;
/*!40000 ALTER TABLE `stock_exchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_exchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_price`
--

DROP TABLE IF EXISTS `stock_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_price` (
  `stockprice_id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `stock_exchange` varchar(255) DEFAULT NULL,
  `stock_price` double NOT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`stockprice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_price`
--

LOCK TABLES `stock_price` WRITE;
/*!40000 ALTER TABLE `stock_price` DISABLE KEYS */;
INSERT INTO `stock_price` VALUES (15,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `stock_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `ur_us_id` bigint(20) NOT NULL,
  `ur_ro_id` int(11) NOT NULL,
  PRIMARY KEY (`ur_us_id`,`ur_ro_id`),
  KEY `FKjia4161ecu6h4p0egc2oc04lt` (`ur_ro_id`),
  CONSTRAINT `FKey5dviu01003a0149d6sxvpnx` FOREIGN KEY (`ur_us_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKjia4161ecu6h4p0egc2oc04lt` FOREIGN KEY (`ur_ro_id`) REFERENCES `role` (`ro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (0,1),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `confirmed` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'','admin','1234','$2a$10$r1UU77TCgzlcqAdfDjv.LOXnsqR8fRSdFhaBfr2k0fAqWmmzzAmQK','admin'),(2,'','demo','1234','$2a$10$v1EF9SG81tZcwYx5IIjul.vu9LFDE0dlOZC9oZTh6U1M82Nwfuq6i','demo'),(3,'\0','demo','1234','$2a$10$nvwGfOmiy8iM9W.DK7q9COFDIkXjZ5awXC8um.QY9dKBgpueeYPfa','demo1'),(4,'\0','demo','1234','$2a$10$M0ZKX10OYJmB6IBy.0HHde3z0RvVWualXNnh/K1xZHcf1af3fJiUG','demo2'),(5,'','demo','1234','$2a$10$EAljju5ODjsdHt9f2mPXfOmPcRt3W4dC3oZhjPOU6qJkGzRzijfbS','demo4'),(6,'\0','demo','1234','$2a$10$EZn07NULXqPBL9xEajMbHeB1FVs4ZvoF/D5o8KWbWG/3Arft95JJ2','dhaval'),(7,'\0','demo','1234','$2a$10$2jKsXLYUcj1uJE9xX6xU7.E93EH9zUHdUp1hhvxbv.L/TEAN5v6rO','dhaval2'),(8,'\0','demo','1234','$2a$10$RmkFvKXqyXWo6DJNPZsvoObpeZpthpUEJHCMc0Gh/rKkeHN/C8/4.','dhaval3'),(9,'','amit','1234','$2a$10$vL4MLTLgrpfd/Jw9JRakBuHR3TtT15xxrsEJwlK4GEN4ncobnDWP6','amit'),(10,'','ram@gmail.com','7894565','$2a$10$SwA6CLKJrlszaYhGkT9uIOqitKT0qe9auMqI1fltoVtEdlwrh4RA6','ram'),(11,'','mitali.markande@gmail.com','789456','$2a$10$Z45BZNaix9fNX4cf5WDXxut.aPIFmTomTgztNuD4W4SuTeRiKPoKi','mitali'),(12,'','rrriteshrathi1@gmail.com','789456','$2a$10$qImYsGQxajBxD7hymMEzluBbb7V7qaPf/HVP70LcmBeTWIs6lro1S','Ritesh'),(13,'\0','sawant.14101997@gmail.com','789456','$2a$10$p98/JU4VrUrfmzcsfqucX.2SpeaPL/R7.FbNTYTORP5YIWGlLWj06','Abhichu'),(14,'','vaiiishnaviii@gmail.com','789456','$2a$10$ZMNCA5KxYB/ALCMTl1ErlOLjukfVzZM0oKBprcrTZClz5/kLHg/3K','vaishnavi');
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

-- Dump completed on 2019-12-19 10:43:51
