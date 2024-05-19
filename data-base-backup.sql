-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: full-stack-ecommerce
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `cart_item_id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `cart_id` bigint NOT NULL,
  `vacation_id` bigint NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `cart_id` (`cart_id`),
  KEY `vacation_id` (`vacation_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`vacation_id`) REFERENCES `vacations` (`vacation_id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (35,'2024-05-15 15:31:50.730000','2024-05-15 15:31:50.755000',46,3);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `cart_id` bigint NOT NULL AUTO_INCREMENT,
  `package_price` decimal(19,2) DEFAULT NULL,
  `party_size` int DEFAULT NULL,
  `status` enum('pending','ordered','canceled') DEFAULT NULL,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (46,1900.00,1,'ordered','b72327fc-51d0-494a-ad00-6adc2a30854f','2024-05-15 15:31:50.701000','2024-05-15 15:31:50.701000',18);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `country_id` bigint NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'U.S','2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000'),(2,'UK','2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000'),(3,'Canada','2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `customer_first_name` varchar(255) DEFAULT NULL,
  `customer_last_name` varchar(255) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `division_id` bigint DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `division_id` (`division_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (14,'123 Easy St',NULL,'John','Doe','2024-05-15 15:09:25.302000','777-777-7777','77886',48),(15,'555 Street St.',NULL,'Jane','Miss','2024-05-15 15:09:28.561000','409-333-3333','88888',103),(16,'1121 Fight Ln.','2024-05-15 15:09:19.950000','Josh','Clover','2024-05-15 15:09:19.950000','832-580-9784','77567',11),(17,'765 One St.','2024-05-15 15:10:48.015000','Tori','Messer','2024-05-15 15:10:48.015000','(555)555-5555','77666',65),(18,'123 Show Ln.','2024-05-15 15:11:28.485000','Mary','Hopkins','2024-05-15 15:11:28.486000','111-111-1111','00999',8);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `division` varchar(255) DEFAULT NULL,
  `division_id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `country_id` bigint NOT NULL,
  PRIMARY KEY (`division_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `divisions_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES ('Arizona',2,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Arkansas',3,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('California',4,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Colorado',5,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Connecticut',6,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Delaware',7,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('District of Columbia',8,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Florida',9,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Georgia',10,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Idaho',11,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Illinois',12,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Indiana',13,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Iowa',14,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Kansas',15,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Kentucky',16,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Louisiana',17,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Maine',18,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Maryland',19,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Massachusetts',20,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Michigan',21,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Minnesota',22,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Mississippi',23,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Missouri',24,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Montana',25,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Nebraska',26,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Nevada',27,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('New Hampshire',28,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('New Jersey',29,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('New Mexico',30,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('New York',31,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('North Carolina',32,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('North Dakota',33,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Ohio',34,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Oklahoma',35,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Oregon',36,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Pennsylvania',37,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Rhode Island',38,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('South Carolina',39,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('South Dakota',40,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Tennessee',41,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Texas',42,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Utah',43,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Vermont',44,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Virginia',45,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Washington',46,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('West Virginia',47,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Wisconsin',48,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Wyoming',49,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Hawaii',52,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Alaska',54,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',1),('Northwest Territories',60,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('Alberta',61,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('British Columbia',62,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('Manitoba',63,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('New Brunswick',64,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('Nova Scotia',65,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('Prince Edward Island',66,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('Ontario',67,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('Québec',68,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('Saskatchewan',69,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('Nunavut',70,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('Yukon',71,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('Newfoundland and Labrador',72,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',3),('England',101,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',2),('Wales',102,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',2),('Scotland',103,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',2),('Northern Ireland',104,'2023-04-06 09:17:11.000000','2023-04-06 09:17:11.000000',2);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excursion_cartitem`
--

DROP TABLE IF EXISTS `excursion_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excursion_cartitem` (
  `cart_item_id` bigint NOT NULL,
  `excursion_id` bigint NOT NULL,
  PRIMARY KEY (`cart_item_id`,`excursion_id`),
  KEY `excursion_id` (`excursion_id`),
  CONSTRAINT `excursion_cartitem_ibfk_1` FOREIGN KEY (`cart_item_id`) REFERENCES `cart_items` (`cart_item_id`),
  CONSTRAINT `excursion_cartitem_ibfk_2` FOREIGN KEY (`excursion_id`) REFERENCES `excursions` (`excursion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excursion_cartitem`
--

LOCK TABLES `excursion_cartitem` WRITE;
/*!40000 ALTER TABLE `excursion_cartitem` DISABLE KEYS */;
INSERT INTO `excursion_cartitem` VALUES (35,12),(35,17);
/*!40000 ALTER TABLE `excursion_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excursions`
--

DROP TABLE IF EXISTS `excursions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excursions` (
  `excursion_id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `excursion_price` decimal(19,2) DEFAULT NULL,
  `excursion_title` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `vacation_id` bigint NOT NULL,
  PRIMARY KEY (`excursion_id`),
  KEY `vacation_id` (`vacation_id`),
  CONSTRAINT `excursions_ibfk_1` FOREIGN KEY (`vacation_id`) REFERENCES `vacations` (`vacation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excursions`
--

LOCK TABLES `excursions` WRITE;
/*!40000 ALTER TABLE `excursions` DISABLE KEYS */;
INSERT INTO `excursions` VALUES (2,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,2),(3,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,2),(4,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,2),(5,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,2),(6,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,2),(7,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,2),(8,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,2),(9,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,2),(10,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,3),(11,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,3),(12,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,3),(13,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,3),(14,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,3),(15,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,3),(16,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,3),(17,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,3),(18,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,4),(19,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,4),(20,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,4),(21,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,4),(22,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,4),(23,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,4),(24,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,4),(25,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,4),(26,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,5),(27,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,5),(28,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,5),(29,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,5),(30,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,5),(31,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,5),(32,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,5),(33,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,5),(34,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,6),(35,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,6),(36,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,6),(37,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,6),(38,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,6),(39,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,6),(40,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,6),(41,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,6),(42,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,7),(43,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,7),(44,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,7),(45,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,7),(46,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,7),(47,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,7),(48,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,7),(49,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,7),(50,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,8),(51,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,8),(52,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,8),(53,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,8),(54,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,8),(55,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,8),(56,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,8),(57,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,8),(58,NULL,100.00,'Cheese Tour','https://images.unsplash.com/photo-1631379578550-7038263db699?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80',NULL,9),(59,NULL,75.00,'Bicycle Tour','https://images.unsplash.com/uploads/14122621859313b34d52b/37e28531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,9),(60,NULL,250.00,'Spa Treatment','https://images.unsplash.com/photo-1620733723572-11c53f73a416?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,9),(61,NULL,100.00,'Historic Tour','https://images.unsplash.com/photo-1479142506502-19b3a3b7ff33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,9),(62,NULL,25.00,'Boat Ride','https://images.unsplash.com/photo-1587252337395-d02401a8a814?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80',NULL,9),(63,NULL,500.00,'Horseback Riding Lesson','https://images.unsplash.com/photo-1598810577851-34982c359155?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,9),(64,NULL,120.00,'Zip Lining','https://images.unsplash.com/photo-1625076307714-a5cd1b2beb4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,9),(65,NULL,150.00,'Dinner and a Show','https://plus.unsplash.com/premium_photo-1661774645265-ce387923cb5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,9);
/*!40000 ALTER TABLE `excursions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacations`
--

DROP TABLE IF EXISTS `vacations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacations` (
  `vacation_id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `last_update` datetime(6) DEFAULT NULL,
  `travel_fare_price` decimal(19,2) DEFAULT NULL,
  `vacation_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vacation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacations`
--

LOCK TABLES `vacations` WRITE;
/*!40000 ALTER TABLE `vacations` DISABLE KEYS */;
INSERT INTO `vacations` VALUES (2,NULL,'Visit the beautiful country of Italy','https://images.unsplash.com/photo-1515859005217-8a1f08870f59?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1110&q=80',NULL,1000.00,'Italy'),(3,NULL,'Visit the beautiful country of Greece','https://images.unsplash.com/photo-1533105079780-92b9be482077?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',NULL,1500.00,'Greece'),(4,NULL,'Visit the beautiful country of France','https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80',NULL,1500.00,'France'),(5,NULL,'Visit the beautiful country of Belgium','https://images.unsplash.com/photo-1491557345352-5929e343eb89?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,1500.00,'Belgium'),(6,NULL,'Visit the beautiful country of Brazil','https://images.unsplash.com/photo-1483729558449-99ef09a8c325?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',NULL,1500.00,'Brazil'),(7,NULL,'Visit the beautiful state of South Dakota','https://images.unsplash.com/photo-1605801495512-f47a64d01f4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80',NULL,1500.00,'South Dakota'),(8,NULL,'Visit the beautiful city of Nashville','https://images.unsplash.com/photo-1545419913-775e3e82c7db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1636&q=80',NULL,1500.00,'Nashville'),(9,NULL,'Visit the beautiful state of Wisconsin','https://images.unsplash.com/photo-1566419808810-658178380987?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',NULL,1500.00,'Wisconsin');
/*!40000 ALTER TABLE `vacations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-18  9:54:11
