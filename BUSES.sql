-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: bus_system
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus` (
  `Bus_ID` int(11) NOT NULL,
  `Type` char(10) DEFAULT NULL,
  `Total_Seats` int(11) DEFAULT NULL,
  `Employee_ID` int(11) NOT NULL,
  PRIMARY KEY (`Bus_ID`,`Employee_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1234,'AC',40,10000),(2234,'Non-AC',40,10001),(2734,'Non-AC',40,10007),(3734,'Non-AC',40,10010),(4734,'AC',40,10003),(7734,'AC',40,12100),(8734,'AC',40,16700),(5704,'AC',40,14501);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `Counter_ID` int(11) NOT NULL,
  `Location` char(25) DEFAULT NULL,
  `Phone` char(25) DEFAULT NULL,
  `Employee_ID` int(11) NOT NULL,
  PRIMARY KEY (`Counter_ID`,`Employee_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (4123,'Dhaka','236745',20007),(4124,'Dinajpur','236745',20018),(4100,'Dinajpur','236745',20018),(4100,'Dinajpur','236745',20019);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `Name` char(25) DEFAULT NULL,
  `Phone` char(25) DEFAULT NULL,
  `Address` char(25) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (10000,'Rahim','123456','Dhaka'),(10001,'Rifat','223456','Dhaka'),(10003,'Sabbir','323456','Chittagong'),(10010,'Anik','433456','Khulna'),(10007,'Hridoy','443456','Khulna'),(20007,'Abir','543456','Barisal'),(20018,'Abir','743456','Barisal'),(21019,'Mahir','943456','Dinajpur'),(20045,'Hasan','743256','Faridpur'),(12100,'Nazir','678123','Rajshahi'),(16700,'Zakir','278123','Rangpur'),(14501,'Iqbal','478103','Syllhet');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_category`
--

DROP TABLE IF EXISTS `employee_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_category` (
  `Employee_ID` int(11) NOT NULL,
  `Employee_Type` char(15) NOT NULL,
  PRIMARY KEY (`Employee_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_category`
--

LOCK TABLES `employee_category` WRITE;
/*!40000 ALTER TABLE `employee_category` DISABLE KEYS */;
INSERT INTO `employee_category` VALUES (10000,'Driver'),(10001,'Driver'),(10003,'Driver'),(10010,'Driver'),(10007,'Driver'),(20007,'Manager'),(20018,'Manager'),(21019,'Manager'),(20045,'Manager'),(12100,'Driver'),(16700,'Driver'),(14501,'Driver');
/*!40000 ALTER TABLE `employee_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `Passenger_ID` int(11) NOT NULL,
  `Name` char(25) DEFAULT NULL,
  `Phone` char(25) DEFAULT NULL,
  PRIMARY KEY (`Passenger_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (612345,'Rakib','154321'),(612245,'Azhar','150321'),(612205,'Rakin','190321'),(612210,'Tonmoy','120321');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `Counter_ID` int(11) NOT NULL,
  `Ticket_ID` int(11) NOT NULL,
  `Passenger_ID` int(11) NOT NULL,
  `No_of_Tickets` int(11) NOT NULL,
  `Total_Cost` int(11) NOT NULL,
  PRIMARY KEY (`Counter_ID`,`Ticket_ID`),
  KEY `fk_paymentpassenger` (`Passenger_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (4123,51234,612345,2,1400),(4124,51224,612245,1,1200),(4100,51224,612205,1,650),(4100,51024,612210,1,500);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `Bus_ID` int(11) NOT NULL,
  `Starting_Point` char(25) NOT NULL,
  `Destination` char(25) NOT NULL,
  PRIMARY KEY (`Bus_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1234,'Dhaka','Dinajpur'),(2234,'Dhaka','Dinajpur'),(2734,'Dinajpur','Dhaka'),(3734,'Faridpur','Dhaka'),(4734,'Dhaka','Chittagong'),(7734,'Dhaka','Rajshahi'),(8734,'Dhaka','Rangpur'),(5704,'Rangpur','Dhaka');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `Ticket_ID` int(11) NOT NULL,
  `Bus_ID` int(11) NOT NULL,
  `Seat_No` int(11) NOT NULL,
  `Counter_ID` int(11) NOT NULL,
  `Passenger_ID` int(11) NOT NULL,
  `Fare` int(11) NOT NULL,
  `Bus_Type` char(25) NOT NULL,
  PRIMARY KEY (`Ticket_ID`,`Bus_ID`,`Seat_No`),
  KEY `fk_ticketpassenger` (`Passenger_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (51234,5704,1,4123,612345,700,'AC'),(51224,1234,6,4123,612245,1200,'AC'),(51224,2234,13,4100,612205,650,'Non-AC'),(51024,3734,20,4100,612205,500,'Non-AC');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_slot` (
  `Bus_ID` int(11) NOT NULL,
  `Journey_Date` date NOT NULL,
  `Departure_Time` time NOT NULL,
  `Arrival_Time` time NOT NULL,
  PRIMARY KEY (`Bus_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES (1234,'2017-08-01','08:30:00','17:00:00'),(2234,'2017-08-01','08:30:00','17:00:00'),(2734,'2017-07-02','08:30:00','17:00:00'),(3734,'2017-07-02','09:00:00','14:00:00'),(4734,'2017-07-05','10:00:00','13:00:00'),(7734,'2016-09-19','10:00:00','17:00:00'),(8734,'2016-10-19','09:30:00','18:00:00'),(5704,'2015-02-13','14:30:00','22:00:00');
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-09  0:22:21
