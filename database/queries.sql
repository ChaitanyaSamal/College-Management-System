show databases;

create database collegeManagement;

use collegeManagement;

-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: medicinedonationsystem
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `contact_num` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pravin','Pr@vin21091998','pravin@gmail.com','sweta apt','84520'),(2,'pravin0606','Pr@vin21091998','pravin06.ps@gmail.com','sweta','8452068278'),(3,'monish07','Monish@123','monish07.ms@gmail.com','sweta Apt','9677779561'),(4,'navin0786','Navin@1234','navin@gmail.com','skypark','9637795682'),(5,'Srikanth0789','Srikanth@123456','srikanth@gmail.com','Golden Park','9324925898'),(6,'Jatin123','Jatin@12345','jatin@gmail.com','Mount Park','6578952386'),(7,'kavery089','kav123@KAV','kavery@gmail.com','sweta apt','9320762923');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-27 11:05:29

show tables;

select * from user;

Insert into user(username,password) values("chay", "1234");

CREATE TABLE `PublicAnnouncements` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `contact_num` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`)
);

CREATE TABLE `PublicAnnouncements`
(
      announcement_id int NOT NULL PRIMARY KEY auto_increment,
      announcement_name varchar(100) NOT NULL,
      date_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      pdf_path varchar(255) NOT NULL
);
DROP TABLE PublicAnnouncements;

Select * from PublicAnnouncements;

INSERT INTO PublicAnnouncements (announcement_name, date_time,pdf) VALUES ("Academic/research activities for PG & PhD students in the even semester", NOW() , LOAD_FILE('C:/Users/chintu/Desktop/Chaitanya_Samal/Miscellaneous/College-Management-System/Announcements/Notification_PG.pdf'));


INSERT INTO PublicAnnouncements (announcement_name, date_time,pdf_path) VALUES ("Academic/research activities for PG & PhD students in the even semester", NOW() , "C:/Users/chintu/Desktop/Chaitanya_Samal/Miscellaneous/College-Management-System/Announcements/Notification_PG.pdf");

select  LOAD_FILE('C:/Users/chintu/Desktop/Chaitanya_Samal/Miscellaneous/College-Management-System/Announcements/Notification_PG.pdf');

UPDATE PublicAnnouncements
SET  pdf_path = "/Announcements/JRF_Advertisement_ECE.pdf" ,date_time=now()
WHERE announcement_id=5;

select * from PublicAnnouncements;
INSERT INTO PublicAnnouncements (announcement_name, date_time,pdf_path) VALUES ("Extension of Last for applying JRF in E&C Dept.(Advt. dt. 6th Dec' 21)", NOW() , "/Announcements/JRF_Advertisement__Last_Date_Extended.pdf");

ALTER TABLE user
ADD admin varchar(2);

UPDATE user
SET admin = "Y"
WHERE userid=8;

delete from PublicAnnouncements 
where announcement_id=10;