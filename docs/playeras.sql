CREATE DATABASE  IF NOT EXISTS `playeras` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `playeras`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: playeras
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `IdAddress` int NOT NULL,
  `IdState` int NOT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `Neighborhood` varchar(45) DEFAULT NULL,
  `ExtNum` varchar(45) DEFAULT NULL,
  `IntNum` varchar(45) DEFAULT NULL,
  `ZipCode` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdAddress`,`IdState`),
  KEY `fk_Address_State1_idx` (`IdState`),
  CONSTRAINT `fk_Address_State1` FOREIGN KEY (`IdState`) REFERENCES `state` (`IdState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'Calle 1','Colonia 1','101','A','20000','Aguascalientes'),(2,2,'Calle 2','Colonia 2','102','B','21000','Mexicali'),(3,3,'Calle 3','Colonia 3','103','C','23000','La Paz'),(4,4,'Calle 4','Colonia 4','104','D','24000','Campeche'),(5,5,'Calle 5','Colonia 5','105','E','29000','Tuxtla Gutiérrez');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankcard`
--

DROP TABLE IF EXISTS `bankcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankcard` (
  `CardNumber` varchar(16) NOT NULL,
  `IdBrandCard` int NOT NULL,
  `IdCustomer` int NOT NULL,
  `CVV` varchar(4) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `IsCreditCard` tinyint DEFAULT NULL,
  PRIMARY KEY (`CardNumber`,`IdBrandCard`),
  KEY `fk_BankCard_BrandCard1_idx` (`IdBrandCard`),
  KEY `fk_BankCard_customer1_idx` (`IdCustomer`),
  CONSTRAINT `fk_BankCard_BrandCard1` FOREIGN KEY (`IdBrandCard`) REFERENCES `brandcard` (`IdBrandCard`),
  CONSTRAINT `fk_BankCard_customer1` FOREIGN KEY (`IdCustomer`) REFERENCES `customer` (`IdCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankcard`
--

LOCK TABLES `bankcard` WRITE;
/*!40000 ALTER TABLE `bankcard` DISABLE KEYS */;
INSERT INTO `bankcard` VALUES ('378282246310005',3,5,'1234','2028-08-01',0),('4000056655665556',1,2,'123','2028-08-01',0),('4242424242424242',1,1,'321','2028-08-01',1),('5200828282828210',2,4,'454','2028-08-01',0),('5555555555554444',2,3,'454','2028-08-01',1);
/*!40000 ALTER TABLE `bankcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brandcard`
--

DROP TABLE IF EXISTS `brandcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brandcard` (
  `IdBrandCard` int NOT NULL,
  `Bank` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdBrandCard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brandcard`
--

LOCK TABLES `brandcard` WRITE;
/*!40000 ALTER TABLE `brandcard` DISABLE KEYS */;
INSERT INTO `brandcard` VALUES (1,'VISA'),(2,'AmericanExpress'),(3,'MasterCard');
/*!40000 ALTER TABLE `brandcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `IdCategory` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Category 1','Description 1','image1.png'),(2,'Category 2','Description 2','image2.png'),(3,'Category 3','Description 3','image3.png'),(4,'Category 4','Description 4','image4.png'),(5,'Category 5','Description 5','image5.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `IdColor` int NOT NULL,
  `Hexa` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`IdColor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'#FF5733'),(2,'#33FF57'),(3,'#3357FF'),(4,'#FF33A8'),(5,'#A833FF');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom`
--

DROP TABLE IF EXISTS `custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom` (
  `IdCustom` int NOT NULL AUTO_INCREMENT,
  `IdSize` int NOT NULL,
  `IdColor` int NOT NULL,
  `Front` int DEFAULT NULL,
  `Back` int DEFAULT NULL,
  PRIMARY KEY (`IdCustom`),
  UNIQUE KEY `IdCustom_UNIQUE` (`IdCustom`),
  KEY `fk_Custom_Size1_idx` (`IdSize`),
  KEY `fk_Custom_Color1_idx` (`IdColor`),
  KEY `fk_Custom_Desing_Front_idx` (`Front`),
  KEY `fk_Custom_Desing_Back_idx` (`Back`),
  CONSTRAINT `fk_Custom_Color1` FOREIGN KEY (`IdColor`) REFERENCES `color` (`IdColor`),
  CONSTRAINT `fk_Custom_Desing_Back` FOREIGN KEY (`Back`) REFERENCES `desing` (`IdDesing`),
  CONSTRAINT `fk_Custom_Desing_Front` FOREIGN KEY (`Front`) REFERENCES `desing` (`IdDesing`),
  CONSTRAINT `fk_Custom_Size1` FOREIGN KEY (`IdSize`) REFERENCES `size` (`IdSize`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom`
--

LOCK TABLES `custom` WRITE;
/*!40000 ALTER TABLE `custom` DISABLE KEYS */;
INSERT INTO `custom` VALUES (1,1,1,1,1),(2,2,2,2,2),(3,3,3,3,3),(4,4,4,4,4),(5,5,5,5,5);
/*!40000 ALTER TABLE `custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `IdCustomer` int NOT NULL,
  `IdMembership` int DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Cellphone` varchar(10) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `StartDateMembership` date DEFAULT NULL,
  `EndDateMembership` date DEFAULT NULL,
  `Img` blob,
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdCustomer`),
  KEY `fk_Customer_Membership1_idx` (`IdMembership`),
  CONSTRAINT `fk_Customer_Membership1` FOREIGN KEY (`IdMembership`) REFERENCES `membership` (`IdMembership`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,'Customer1','LastName1','customer1@example.com','1234567890','1990-01-01','2023-01-01','2024-01-01',NULL,'password'),(2,2,'Customer2','LastName2','customer2@example.com','1234567891','1991-01-01','2023-01-01','2024-01-01',NULL,'password'),(3,3,'Customer3','LastName3','customer3@example.com','1234567892','1992-01-01','2023-01-01','2024-01-01',NULL,'password'),(4,4,'Customer4','LastName4','customer4@example.com','1234567893','1993-01-01','2023-01-01','2024-01-01',NULL,'password'),(5,5,'Customer5','LastName5','customer5@example.com','1234567894','1994-01-01','2023-01-01','2024-01-01',NULL,'password');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desing`
--

DROP TABLE IF EXISTS `desing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desing` (
  `IdDesing` int NOT NULL AUTO_INCREMENT,
  `Image` blob,
  `X` decimal(4,2) DEFAULT NULL,
  `Y` decimal(4,2) DEFAULT NULL,
  `RawImage` blob,
  PRIMARY KEY (`IdDesing`),
  UNIQUE KEY `idDesing_UNIQUE` (`IdDesing`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desing`
--

LOCK TABLES `desing` WRITE;
/*!40000 ALTER TABLE `desing` DISABLE KEYS */;
INSERT INTO `desing` VALUES (1,NULL,1.00,1.00,NULL),(2,NULL,2.00,2.00,NULL),(3,NULL,3.00,3.00,NULL),(4,NULL,4.00,4.00,NULL),(5,NULL,5.00,5.00,NULL);
/*!40000 ALTER TABLE `desing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `IdEmployee` int NOT NULL,
  `IdJob` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `FirstLastName` varchar(45) DEFAULT NULL,
  `SecondLastName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `WorkingTime` varchar(45) DEFAULT NULL,
  `CheckIn` tinyint DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdEmployee`,`IdJob`),
  KEY `fk_Employee_Job1_idx` (`IdJob`),
  CONSTRAINT `fk_Employee_Job1` FOREIGN KEY (`IdJob`) REFERENCES `job` (`IdJob`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'Employee1','LastName1','LastName2','employee1@example.com','Male','1980-01-01','Full-time',1,'password'),(2,2,'Employee2','LastName1','LastName2','employee2@example.com','Female','1981-01-01','Full-time',1,'password'),(3,3,'Employee3','LastName1','LastName2','employee3@example.com','Male','1982-01-01','Full-time',1,'password'),(4,4,'Employee4','LastName1','LastName2','employee4@example.com','Female','1983-01-01','Full-time',1,'password'),(5,5,'Employee5','LastName1','LastName2','employee5@example.com','Male','1984-01-01','Full-time',1,'password');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `IdItem` int NOT NULL,
  `IdProduct` int NOT NULL,
  `IdCategory` int NOT NULL,
  `IdColor` int DEFAULT NULL,
  `IdSize` int DEFAULT NULL,
  `Price` decimal(6,2) DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `Status` tinyint DEFAULT NULL,
  PRIMARY KEY (`IdItem`,`IdProduct`,`IdCategory`),
  KEY `fk_Product_Color1_idx` (`IdColor`),
  KEY `fk_Product_Size1_idx` (`IdSize`),
  KEY `fk_Item_Product1_idx` (`IdProduct`,`IdCategory`),
  CONSTRAINT `fk_Item_Product1` FOREIGN KEY (`IdProduct`, `IdCategory`) REFERENCES `product` (`IdProduct`, `IdCategory`),
  CONSTRAINT `fk_Product_Color1` FOREIGN KEY (`IdColor`) REFERENCES `color` (`IdColor`),
  CONSTRAINT `fk_Product_Size1` FOREIGN KEY (`IdSize`) REFERENCES `size` (`IdSize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,1,1,1,100.00,10,1),(2,2,2,2,2,200.00,20,1),(3,3,3,3,3,300.00,30,1),(4,4,4,4,4,400.00,40,1),(5,5,5,5,5,500.00,50,1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `IdJob` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  PRIMARY KEY (`IdJob`),
  UNIQUE KEY `idJob_UNIQUE` (`IdJob`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Job1',1000),(2,'Job2',2000),(3,'Job3',3000),(4,'Job4',4000),(5,'Job5',5000);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `IdCustomer` int NOT NULL,
  `IdAddress` int NOT NULL,
  PRIMARY KEY (`IdCustomer`,`IdAddress`),
  KEY `fk_Customer_has_Address_Address1_idx` (`IdAddress`),
  KEY `fk_Customer_has_Address_Customer1_idx` (`IdCustomer`),
  CONSTRAINT `fk_Customer_has_Address_Address1` FOREIGN KEY (`IdAddress`) REFERENCES `address` (`IdAddress`),
  CONSTRAINT `fk_Customer_has_Address_Customer1` FOREIGN KEY (`IdCustomer`) REFERENCES `customer` (`IdCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `IdMembership` int NOT NULL AUTO_INCREMENT,
  `Description` longtext,
  `Price` decimal(6,2) DEFAULT NULL,
  `Discount` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`IdMembership`),
  UNIQUE KEY `IdMembership_UNIQUE` (`IdMembership`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES (1,'Membership 1',100.00,10.00),(2,'Membership 2',200.00,20.00),(3,'Membership 3',300.00,30.00),(4,'Membership 4',400.00,40.00),(5,'Membership 5',500.00,50.00);
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `IdOrder` int NOT NULL,
  `IdCustomer` int NOT NULL,
  `OrderDate` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Channel` varchar(45) DEFAULT NULL,
  `Discount` tinyint DEFAULT NULL,
  PRIMARY KEY (`IdOrder`),
  KEY `fk_Order_Customer1_idx` (`IdCustomer`),
  CONSTRAINT `fk_Order_Customer1` FOREIGN KEY (`IdCustomer`) REFERENCES `customer` (`IdCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'2024-01-01','Pending','Online',0),(2,2,'2024-01-01','Pending','Online',0),(3,3,'2024-01-01','Pending','Online',0),(4,4,'2024-01-01','Pending','Online',0),(5,5,'2024-01-01','Pending','Online',0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderproduct` (
  `IdProduct` int NOT NULL,
  `IdOrder` int NOT NULL,
  `IsCustom` tinyint NOT NULL DEFAULT '0',
  `Amount` int DEFAULT NULL,
  `Price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`IdProduct`,`IdOrder`,`IsCustom`),
  KEY `fk_OrdersDetails_Products1_idx` (`IdProduct`),
  KEY `fk_OrdersDetails_Orders1_idx` (`IdOrder`),
  CONSTRAINT `fk_OrdersDetails_Custom` FOREIGN KEY (`IdProduct`) REFERENCES `custom` (`IdCustom`),
  CONSTRAINT `fk_OrdersDetails_Orders1` FOREIGN KEY (`IdOrder`) REFERENCES `order` (`IdOrder`),
  CONSTRAINT `fk_OrdersDetails_Products1` FOREIGN KEY (`IdProduct`) REFERENCES `item` (`IdItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
INSERT INTO `orderproduct` VALUES (1,1,0,1,100.00),(2,2,0,2,200.00),(3,3,0,3,300.00),(4,4,0,4,400.00),(5,5,0,5,500.00);
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `IdPayment` int NOT NULL AUTO_INCREMENT,
  `IdOrder` int NOT NULL,
  `PaymentDate` date DEFAULT NULL,
  `Import` decimal(6,2) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `CardNumber` varchar(16) DEFAULT NULL,
  `IdPaymentMethod` int NOT NULL,
  PRIMARY KEY (`IdPayment`,`IdOrder`),
  UNIQUE KEY `IdPayment_UNIQUE` (`IdPayment`),
  KEY `fk_Payments_Orders1_idx` (`IdOrder`),
  KEY `fk_Card_idx` (`CardNumber`),
  KEY `fk_payment_PaymentMethod1_idx` (`IdPaymentMethod`),
  CONSTRAINT `fk_Card` FOREIGN KEY (`CardNumber`) REFERENCES `bankcard` (`CardNumber`),
  CONSTRAINT `fk_payment_PaymentMethod1` FOREIGN KEY (`IdPaymentMethod`) REFERENCES `paymentmethod` (`IdPaymentMethod`),
  CONSTRAINT `fk_Payments_Orders1` FOREIGN KEY (`IdOrder`) REFERENCES `order` (`IdOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'2024-01-01',100.00,'Paid','378282246310005',1),(2,2,'2024-01-01',100.00,'Paid','4000056655665556',1),(3,3,'2024-01-01',100.00,'Paid','4242424242424242',1),(4,4,'2024-01-01',100.00,'Paid','5200828282828210',1),(5,5,'2024-01-01',100.00,'Paid','5555555555554444',1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `IdPaymentMethod` int NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdPaymentMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'Credit Card'),(2,'Debit Card'),(3,'PayPal'),(4,'Bank Transfer'),(5,'Cash');
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `IdProduct` int NOT NULL AUTO_INCREMENT,
  `IdCategory` int NOT NULL,
  PRIMARY KEY (`IdProduct`,`IdCategory`),
  UNIQUE KEY `IdProduct_UNIQUE` (`IdProduct`),
  KEY `fk_Product_Category1_idx` (`IdCategory`),
  CONSTRAINT `fk_Product_Category1` FOREIGN KEY (`IdCategory`) REFERENCES `category` (`IdCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `IdProvider` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Contact` varchar(45) DEFAULT NULL,
  `Address` int DEFAULT NULL,
  `DeliveryTime` datetime DEFAULT NULL,
  `MayorPrice` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`IdProvider`),
  KEY `FK_Provider_Address` (`Address`),
  CONSTRAINT `FK_Provider_Address` FOREIGN KEY (`Address`) REFERENCES `address` (`IdAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'Provider1','provider1@example.com',1,'2024-07-22 14:30:00',999.00),(2,'Provider2','provider2@example.com',2,'2024-07-22 14:30:00',999.00),(3,'Provider3','provider3@example.com',3,'2024-07-22 14:30:00',999.00),(4,'Provider4','provider4@example.com',4,'2024-07-22 14:30:00',999.00),(5,'Provider5','provider5@example.com',5,'2024-07-22 14:30:00',999.00);
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawmaterials`
--

DROP TABLE IF EXISTS `rawmaterials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rawmaterials` (
  `IdRawMaterials` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdRawMaterials`),
  UNIQUE KEY `idRawMaterials_UNIQUE` (`IdRawMaterials`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterials`
--

LOCK TABLES `rawmaterials` WRITE;
/*!40000 ALTER TABLE `rawmaterials` DISABLE KEYS */;
INSERT INTO `rawmaterials` VALUES (1,'Material1',NULL),(2,'Material2',NULL),(3,'Material3',NULL),(4,'Material4',NULL),(5,'Material5',NULL);
/*!40000 ALTER TABLE `rawmaterials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `IdCustomer` int NOT NULL,
  `IdProduct` int NOT NULL,
  `IdCategory` int NOT NULL,
  `Value` varchar(7) DEFAULT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`IdCustomer`,`IdProduct`,`IdCategory`),
  KEY `fk_Customer_has_Product_Customer3_idx` (`IdCustomer`),
  KEY `fk_Review_Product1_idx` (`IdProduct`,`IdCategory`),
  CONSTRAINT `fk_Customer_has_Product_Customer3` FOREIGN KEY (`IdCustomer`) REFERENCES `customer` (`IdCustomer`),
  CONSTRAINT `fk_Review_Product1` FOREIGN KEY (`IdProduct`, `IdCategory`) REFERENCES `product` (`IdProduct`, `IdCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,'5','Good Quality product!!','2024-01-01'),(2,2,2,'5','Good Quality product!!','2024-01-01'),(3,3,3,'4','Good Quality product!!','2024-01-01'),(4,4,4,'3','Good Quality product!!','2024-01-01'),(5,5,5,'5','Good Quality product!!','2024-01-01');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingcart` (
  `IdCustomer` int NOT NULL,
  `IdProduct` int NOT NULL,
  `IsCustom` tinyint NOT NULL,
  PRIMARY KEY (`IdCustomer`,`IdProduct`,`IsCustom`),
  KEY `fk_Customer_has_Product_Product2_idx` (`IdProduct`),
  KEY `fk_Customer_has_Product_Customer2_idx` (`IdCustomer`),
  CONSTRAINT `fk_Customer_has_Product_Customer2` FOREIGN KEY (`IdCustomer`) REFERENCES `customer` (`IdCustomer`),
  CONSTRAINT `fk_Customer_has_Product_Product2` FOREIGN KEY (`IdProduct`) REFERENCES `item` (`IdItem`),
  CONSTRAINT `fk_Shopping_Cart_Custom` FOREIGN KEY (`IdProduct`) REFERENCES `custom` (`IdCustom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES (1,1,0),(2,2,0),(3,3,0),(4,4,0),(5,5,0);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `IdSize` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Oversize` tinyint DEFAULT NULL,
  PRIMARY KEY (`IdSize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'S',0),(2,'M',0),(3,'L',0),(4,'XL',0),(5,'XXL',1);
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `IdState` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Aguascalientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'Chiapas');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplierpurchase`
--

DROP TABLE IF EXISTS `supplierpurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplierpurchase` (
  `IdProvider` int NOT NULL,
  `IdRawMaterials` int NOT NULL,
  `SaleDate` date DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdProvider`,`IdRawMaterials`),
  KEY `fk_RawMaterials_has_Provider_RawMaterials1_idx` (`IdRawMaterials`),
  KEY `fk_SupplierPurchase_Provider1_idx` (`IdProvider`),
  CONSTRAINT `fk_RawMaterials_has_Provider_RawMaterials1` FOREIGN KEY (`IdRawMaterials`) REFERENCES `rawmaterials` (`IdRawMaterials`),
  CONSTRAINT `fk_SupplierPurchase_Provider1` FOREIGN KEY (`IdProvider`) REFERENCES `provider` (`IdProvider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierpurchase`
--

LOCK TABLES `supplierpurchase` WRITE;
/*!40000 ALTER TABLE `supplierpurchase` DISABLE KEYS */;
INSERT INTO `supplierpurchase` VALUES (1,1,'2024-01-01',10,'Received'),(2,2,'2024-01-01',20,'Received'),(3,3,'2024-01-01',30,'Received'),(4,4,'2024-01-01',40,'Received'),(5,5,'2024-01-01',50,'Received');
/*!40000 ALTER TABLE `supplierpurchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `IdCustomer` int NOT NULL,
  `IdProduct` int NOT NULL,
  PRIMARY KEY (`IdCustomer`,`IdProduct`),
  KEY `fk_Customer_has_Product_Product1_idx` (`IdProduct`),
  KEY `fk_Customer_has_Product_Customer1_idx` (`IdCustomer`),
  CONSTRAINT `fk_Customer_has_Product_Customer1` FOREIGN KEY (`IdCustomer`) REFERENCES `customer` (`IdCustomer`),
  CONSTRAINT `fk_Customer_has_Product_Product1` FOREIGN KEY (`IdProduct`) REFERENCES `item` (`IdItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-22 19:23:28
