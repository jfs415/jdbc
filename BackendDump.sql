CREATE DATABASE  IF NOT EXISTS `iste330project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `iste330project`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: iste330project
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `DeptID` int(11) NOT NULL AUTO_INCREMENT,
  `Department` varchar(50) NOT NULL DEFAULT 'John Doe',
  `Num_of_employees` varchar(6) NOT NULL DEFAULT '10',
  PRIMARY KEY (`DeptID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computing and IT','1000'),(2,'Political Science','300'),(3,'Enviormental Science','800'),(4,'Computer Security','1000'),(5,'Math','50');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faculty` (
  `FacultyID` int(11) NOT NULL AUTO_INCREMENT,
  `Faculty` varchar(50) NOT NULL DEFAULT 'John Doe',
  `DeptID` int(11) NOT NULL DEFAULT '1',
  `Fac_Email` varchar(50) NOT NULL DEFAULT '',
  `InterestID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`FacultyID`,`InterestID`),
  KEY `Faculty_ibfk_1` (`DeptID`),
  KEY `Faculty_ibfk_2` (`InterestID`),
  CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `departments` (`deptid`),
  CONSTRAINT `Faculty_ibfk_2` FOREIGN KEY (`InterestID`) REFERENCES `interests` (`interestid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Ed Smith',5,'ESmith@mail.edu',10),(2,'Jim Hash',5,'JHash@mail.edu',9),(3,'Jay Butler ',4,'JButler@mail.edu',8),(4,'Jake Nealson',4,'JNealson@mail.edu',7),(5,'Tyler Burns',3,'TBurns@mail.edu',6),(6,'Megan Kelly',3,'MKelly@mail.edu',5),(7,'Josh Corners',2,'JCorners@mail.edu',4),(8,'Bunson Burner',2,'BBurner@mail.edu',3),(9,'Corey Roberts',1,'CRoberts@mail.edu',2),(10,'Jill Thorn',1,'JThorn@mail.edu',1);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultyphones`
--

DROP TABLE IF EXISTS `facultyphones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `facultyphones` (
  `FacultyID` int(11) NOT NULL DEFAULT '1',
  `PhoneNum` varchar(12) NOT NULL DEFAULT '',
  `Type` char(1) NOT NULL DEFAULT 'H',
  PRIMARY KEY (`FacultyID`),
  CONSTRAINT `FacultyPhones_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`facultyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultyphones`
--

LOCK TABLES `facultyphones` WRITE;
/*!40000 ALTER TABLE `facultyphones` DISABLE KEYS */;
INSERT INTO `facultyphones` VALUES (1,'122-122-1222','O'),(2,'222-222-2211','O'),(3,'344-344-3444','O'),(4,'455-455-4555','O'),(5,'566-566-5666','O'),(6,'677-677-6777','O'),(7,'788-788-7888','O'),(8,'899-899-8999','O'),(9,'900-900-9000','O'),(10,'123-456-7890','O'),(11,'222-000-0202','O');
/*!40000 ALTER TABLE `facultyphones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `interests` (
  `InterestID` int(11) NOT NULL AUTO_INCREMENT,
  `Keyword` varchar(100) NOT NULL DEFAULT 'IT',
  PRIMARY KEY (`InterestID`),
  CONSTRAINT `Interests_ibfk_1` FOREIGN KEY (`InterestID`) REFERENCES `students` (`interestid`),
  CONSTRAINT `Interests_ibfk_2` FOREIGN KEY (`InterestID`) REFERENCES `faculty` (`interestid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
INSERT INTO `interests` VALUES (1,'IT'),(2,'Cars'),(3,'Video Games'),(4,'Photography'),(5,'WWE Wrestling'),(6,'Documentary'),(7,'Dogs'),(8,'Engineering'),(9,'Java'),(10,'MySQL');
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majors`
--

DROP TABLE IF EXISTS `majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `majors` (
  `MajorID` int(11) NOT NULL AUTO_INCREMENT,
  `Maj_Name` varchar(50) NOT NULL DEFAULT 'CIT',
  PRIMARY KEY (`MajorID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors`
--

LOCK TABLES `majors` WRITE;
/*!40000 ALTER TABLE `majors` DISABLE KEYS */;
INSERT INTO `majors` VALUES (1,'CIT'),(2,'Political Science'),(3,'Game Design'),(4,'Public Speaking'),(5,'Web Design'),(6,'Nursing'),(7,'English'),(8,'Beers of the World'),(9,'Wines of the World'),(10,'Enviormental Science'),(11,'IT');
/*!40000 ALTER TABLE `majors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediacompanies`
--

DROP TABLE IF EXISTS `mediacompanies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mediacompanies` (
  `CompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `Company` varchar(50) NOT NULL DEFAULT 'SomeCompany',
  `Address` varchar(50) NOT NULL DEFAULT '',
  `Type` varchar(50) NOT NULL DEFAULT 'Online Media',
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediacompanies`
--

LOCK TABLES `mediacompanies` WRITE;
/*!40000 ALTER TABLE `mediacompanies` DISABLE KEYS */;
INSERT INTO `mediacompanies` VALUES (1,'Company1','123 Main St','Marketing'),(2,'Company2','23 Broad Ave','Multimedia'),(3,'Company3','658 News St','Newspaper'),(4,'Company4','321 State St','Magazine'),(5,'Company5','122 Market Square','Broadcasting');
/*!40000 ALTER TABLE `mediacompanies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporterphones`
--

DROP TABLE IF EXISTS `reporterphones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reporterphones` (
  `ReporterID` int(11) NOT NULL DEFAULT '1',
  `PhoneNum` varchar(12) NOT NULL DEFAULT '',
  `Type` char(1) NOT NULL DEFAULT 'H',
  PRIMARY KEY (`ReporterID`),
  CONSTRAINT `ReporterPhones_ibfk_1` FOREIGN KEY (`ReporterID`) REFERENCES `reporters` (`reporterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporterphones`
--

LOCK TABLES `reporterphones` WRITE;
/*!40000 ALTER TABLE `reporterphones` DISABLE KEYS */;
INSERT INTO `reporterphones` VALUES (1,'121-121-1221','O'),(2,'212-212-2122','C'),(3,'343-343-3443','O'),(4,'454-454-4554','O'),(5,'565-565-5665','C'),(6,'676-676-6776','O'),(7,'787-787-7887','H'),(8,'898-898-8998','O'),(9,'909-909-9009','H'),(10,'121-454-7897','O'),(11,'000-111-2211','C');
/*!40000 ALTER TABLE `reporterphones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporters`
--

DROP TABLE IF EXISTS `reporters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reporters` (
  `ReporterID` int(11) NOT NULL AUTO_INCREMENT,
  `Reporter` varchar(50) NOT NULL DEFAULT 'John Doe',
  `Reporter_Email` varchar(50) NOT NULL DEFAULT '',
  `CompanyID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ReporterID`),
  KEY `Reporters_ibfk_1` (`CompanyID`),
  CONSTRAINT `Reporters_ibfk_1` FOREIGN KEY (`CompanyID`) REFERENCES `mediacompanies` (`companyid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporters`
--

LOCK TABLES `reporters` WRITE;
/*!40000 ALTER TABLE `reporters` DISABLE KEYS */;
INSERT INTO `reporters` VALUES (1,'John Kerry','JKerry@company.com',1),(2,'Tim Bolt','JBolt@Company2.com',2),(3,'Ted Kelly','TKelly@Company2.com',2),(4,'Jane Smith','JSmith@Company3.com',3),(5,'Janet Cross','JCross@Company3.com',3),(6,'Krane Osborne','KOsborn@Company4.com',4),(7,'Jill Hill','JHill@Company.com',1),(8,'Chris Cross','CCross@Company5.com',5),(9,'Jim Jones','JJones@Company4.com',4),(10,'Evet Raincort','ERaincort@Company5.com',5),(11,'Jim Dunlop','JDunlop@Company3.com',3);
/*!40000 ALTER TABLE `reporters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentphones`
--

DROP TABLE IF EXISTS `studentphones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentphones` (
  `StudentID` int(11) NOT NULL DEFAULT '1',
  `PhoneNum` varchar(12) NOT NULL DEFAULT '',
  `Type` char(1) NOT NULL DEFAULT 'H',
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `StudentPhones_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentphones`
--

LOCK TABLES `studentphones` WRITE;
/*!40000 ALTER TABLE `studentphones` DISABLE KEYS */;
INSERT INTO `studentphones` VALUES (1,'111-111-1111','C'),(2,'222-222-2222','C'),(3,'333-333-3333','H'),(4,'444-444-4444','C'),(5,'555-555-5555','O'),(6,'666-666-6666','C'),(7,'777-777-7777','C'),(8,'888-888-8888','C'),(9,'999-999-9999','C'),(10,'101-101-1010','C'),(11,'221-221-1222','C');
/*!40000 ALTER TABLE `studentphones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `Student` varchar(50) NOT NULL DEFAULT 'John Doe',
  `MajorID` int(11) NOT NULL DEFAULT '1',
  `Student_Email` varchar(50) NOT NULL DEFAULT '',
  `Gpa` varchar(4) NOT NULL DEFAULT '3.0',
  `InterestID` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`StudentID`,`InterestID`),
  KEY `Students_ibfk_1` (`MajorID`),
  KEY `Students_ibfk_2` (`InterestID`),
  CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`MajorID`) REFERENCES `majors` (`majorid`),
  CONSTRAINT `Students_ibfk_2` FOREIGN KEY (`InterestID`) REFERENCES `interests` (`interestid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Joe Snow',1,'JSNow@mail.edu','3.4',1),(2,'Jane Doe',2,'JDoe@mail.edu','3.7',2),(3,'Rick Ricky',3,'RRicky@mail.edu','3.2',3),(4,'Jim Crane',4,'JCrane@mail.edu','2.8',4),(5,'Kim Kelly',5,'KKelly@mail.edu','3.5',5),(6,'Shane Sanchez',6,'SSanchez@mail.edu','3.1',6),(7,'Ed Snowden',7,'ESnowden@mail.edu','3.7',7),(8,'Janet Crosby',8,'JCrosby@mail.edu','3.4',8),(9,'Samantha Richardson',9,'SRichardson@mail.edu','3.2',9),(10,'Corey Nash',10,'CNash@mail.edu','3.0',10),(11,'meg slime',1,'MSlime@mail.edu','2.1',1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'iste330project'
--
/*!50003 DROP PROCEDURE IF EXISTS `addFaculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addFaculty`(IN fId int(11),
														 IN fname varchar(50),
														 IN deptname varchar(50),
														 IN email varchar(50),
                                                         IN finterest varchar(100),
														 IN phone varchar(12),
														 IN ptype char(1))
BEGIN
	START TRANSACTION;
	
    -- Set default id values
	SET @intID = (SELECT COUNT(InterestID) FROM Interests) + 1; 
    SET @deptID = (SELECT COUNT(DeptID) FROM Departments) + 1; 
    
    IF finterest NOT IN(SELECT Interests.Keyword FROM Interests) THEN
		SET FOREIGN_KEY_CHECKS=0;
        INSERT INTO Interests(InterestID, Keyword) VALUES(@intID, finterest);
        SET FOREIGN_KEY_CHECKS=1;
	ELSE 
		SET @intID = (SELECT InterestID FROM Interests WHERE Interests.Keyword = finterest);
	END IF;
    
    -- Add entry to db
	IF deptname NOT IN(SELECT Departments.Department FROM Departments) THEN
		SET FOREIGN_KEY_CHECKS=0;
        INSERT INTO Departments(DeptID, Department) VALUES(@deptID, deptname);
        SET FOREIGN_KEY_CHECKS=1;
	ELSE 
		SET @deptID = (SELECT DeptID FROM Departments WHERE Departments.Department = deptname);
	END IF;
    
    -- Add entries to db
	SET FOREIGN_KEY_CHECKS=0;
	INSERT INTO Faculty(FacultyID, Faculty, DeptID, Fac_Email, InterestID) VALUES(fId, fname, @deptID, email, @intID);
	INSERT INTO FacultyPhones(FacultyID, PhoneNum, Type) VALUES(fId, phone, ptype);
	SET FOREIGN_KEY_CHECKS=1;
    
    -- Commit changes
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addReporter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addReporter`(IN rId int(11),
														 IN rname varchar(50),
														 IN compname varchar(50),
														 IN email varchar(50),
														 IN phone varchar(12),
														 IN ptype char(1))
BEGIN
	START TRANSACTION;
    -- Set company id to next id availible, might be changed later
	SET @compID = (SELECT COUNT(CompanyID) FROM MediaCompanies) + 1; 
    
    -- If company is not in db will create new company record, else it finds coresponding company id and sets var to that
	IF compname NOT IN(SELECT MediaCompanies.Company FROM MediaCompanies) THEN
		SET FOREIGN_KEY_CHECKS=0;
        INSERT INTO MediaCompanies(CompanyID, Company, address, type) VALUES(@compID, compname, compaddress, comptype);
        SET FOREIGN_KEY_CHECKS=1;
	ELSE 
		SET @compID = (SELECT CompanyID FROM MediaCompanies WHERE MediaCompanies.Company = compname);
	END IF;
    
	-- Add records to db
	SET FOREIGN_KEY_CHECKS=0;
	INSERT INTO Reporters(ReporterID, Reporter, Reporter_Email, CompanyID) VALUES(rId, rname, email, @compID);
	INSERT INTO ReporterPhones(ReporterID, PhoneNum, Type) VALUES(rId, phone, ptype);
	SET FOREIGN_KEY_CHECKS=1;
	
    -- Commit changes
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addStudent`(IN sId int(11),
														 IN sname varchar(50),
														 IN majname varchar(50),
														 IN email varchar(50),
														 IN gpa varchar(4),
                                                         IN sinterest varchar(100),
														 IN phone varchar(12),
														 IN ptype char(1))
BEGIN
	START TRANSACTION;
	SET @intID = (SELECT COUNT(InterestID) FROM Interests) + 1; 
    SET @majID = (SELECT COUNT(MajorID) FROM Majors) + 1; 
    
    IF sinterest NOT IN(SELECT Interests.Keyword FROM Interests) THEN
		SET FOREIGN_KEY_CHECKS=0;
        INSERT INTO Interests(InterestID, Keyword) VALUES(@intID, sinterest);
        SET FOREIGN_KEY_CHECKS=1;
	ELSE 
		SET @intID = (SELECT InterestID FROM Interests WHERE Interests.Keyword = sinterest);
	END IF;
    
	IF majname NOT IN(SELECT Majors.Maj_name FROM Majors) THEN
		SET FOREIGN_KEY_CHECKS=0;
        INSERT INTO Majors(MajorID, Maj_Name) VALUES(@majID, majname);
        SET FOREIGN_KEY_CHECKS=1;
	ELSE 
		SET @majID = (SELECT MajorID FROM Majors WHERE Majors.Maj_name = majname);
	END IF;
    
    
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO Students(StudentID, Student, MajorID, Student_Email, Gpa, InterestID) VALUES(sId, sname, @majID, email, gpa, @intID);
    INSERT INTO StudentPhones(StudentID, PhoneNum, Type) VALUES(sId, phone, ptype);
    SET FOREIGN_KEY_CHECKS=1;
    
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCommonInterests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCommonInterests`(IN Interest varchar(100))
BEGIN
	
	SELECT Students.StudentID, Students.Student, Students.Student_Email, Faculty.FacultyID, Faculty.Faculty, Faculty.Fac_Email,
    Interest AS 'Common_Interest'
    FROM Interests 
    INNER JOIN Students USING(InterestID)
    INNER JOIN Faculty USING(InterestID)
    WHERE Interests.Keyword = Interest;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCompanyInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCompanyInfo`()
BEGIN
	
	SELECT MediaCompanies.CompanyID, MediaCompanies.Company,  
    GROUP_CONCAT(Reporters.Reporter SEPARATOR ' | ') AS 'Reporters'
    FROM MediaCompanies 
    INNER JOIN Reporters USING(CompanyID)
    GROUP BY CompanyID
    ORDER BY CompanyID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDepartmentInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDepartmentInfo`()
BEGIN
	SELECT Departments.DeptID, Departments.Department, Departments.Num_of_employees, 
    GROUP_CONCAT(Faculty.Faculty SEPARATOR ' | ') AS 'Faculty'
    FROM Departments 
    INNER JOIN Faculty USING(DeptID)
    GROUP BY DeptID
    ORDER BY DeptID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFacultyContactInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFacultyContactInfo`(IN Faculty varchar(50))
BEGIN
	SELECT Faculty.FacultyID, Faculty.Faculty, Faculty.Fac_Email, FacultyPhones.PhoneNum, FacultyPhones.Type
    FROM Faculty
    INNER JOIN FacultyPhones USING(FacultyID)
    WHERE Faculty.Faculty = Faculty
    GROUP BY FacultyID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFacultyInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFacultyInfo`()
BEGIN
	SELECT Faculty.FacultyId, Faculty.Faculty, Departments.Department, Faculty.Fac_Email, 
    Interests.Keyword AS 'Interest'
    FROM Faculty 
    INNER JOIN Departments USING(DeptID)
    INNER JOIN Interests USING(InterestId)
    ORDER BY FacultyID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetReporterContactInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetReporterContactInfo`(IN Reporter varchar(50))
BEGIN
	SELECT Reporters.ReporterID, Reporters.Reporter, Reporters.Reporter_Email, ReporterPhones.PhoneNum, ReporterPhones.Type AS 'Phone_Type'
    FROM Reporters
    INNER JOIN ReporterPhones USING(ReporterID)
    WHERE Reporters.Reporter = Reporter
    GROUP BY ReporterID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getReporterInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getReporterInfo`()
BEGIN
	SELECT Reporters.ReporterId, Reporters.Reporter, Reporters.Reporter_Email, MediaCompanies.Company AS 'Employed_By',  
    MediaCompanies.Type
    FROM Reporters 
    INNER JOIN MediaCompanies USING(CompanyID)
    ORDER BY ReporterID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStudentContactInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStudentContactInfo`(IN Student varchar(50))
BEGIN
	SELECT Students.StudentID, Students.Student, Students.Student_Email, StudentPhones.PhoneNum, StudentPhones.Type AS 'Phone_Type'
    FROM Students
    INNER JOIN StudentPhones USING(StudentID)
    WHERE Students.Student = Student
    GROUP BY StudentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStudentInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStudentInfo`()
BEGIN
	SELECT Students.StudentId, Students.Student, Majors.Maj_Name AS 'Major', Students.Student_Email, Students.Gpa, 
    Interests.Keyword AS 'Interest'
    FROM Students 
    INNER JOIN Majors USING(MajorID)
    INNER JOIN Interests USING(InterestID)
    ORDER BY StudentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 23:32:34
