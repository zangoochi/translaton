-- MySQL dump 10.14  Distrib 5.5.39-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: translation
-- ------------------------------------------------------
-- Server version	5.5.39-MariaDB

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
-- Current Database: `translation`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `translation` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `translation`;

--
-- Table structure for table `Test`
--

DROP TABLE IF EXISTS `Test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Test` (
  `V1` text,
  `V2` text,
  `V3` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test`
--

LOCK TABLES `Test` WRITE;
/*!40000 ALTER TABLE `Test` DISABLE KEYS */;
INSERT INTO `Test` VALUES ('ID','FirstName','LastName\r'),('1','John','Doe\r'),('2','Jane','Doe\r');
/*!40000 ALTER TABLE `Test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analysis_rfunctions`
--

DROP TABLE IF EXISTS `analysis_rfunctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_rfunctions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Body` longtext NOT NULL,
  `ReturnType` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysis_rfunctions`
--

LOCK TABLES `analysis_rfunctions` WRITE;
/*!40000 ALTER TABLE `analysis_rfunctions` DISABLE KEYS */;
INSERT INTO `analysis_rfunctions` VALUES (1,'Test_function','Function Description','Function  body ','TEXT'),(2,'New Function','','','');
/*!40000 ALTER TABLE `analysis_rfunctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analysis_rparamaters`
--

DROP TABLE IF EXISTS `analysis_rparamaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_rparamaters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RFunction_id` int(11) NOT NULL,
  `SequenceNumber` smallint(5) unsigned NOT NULL,
  `parameter` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analysis_rparamaters_9f1b6005` (`RFunction_id`),
  CONSTRAINT `RFunction_id_refs_id_4211cfcc` FOREIGN KEY (`RFunction_id`) REFERENCES `analysis_rfunctions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysis_rparamaters`
--

LOCK TABLES `analysis_rparamaters` WRITE;
/*!40000 ALTER TABLE `analysis_rparamaters` DISABLE KEYS */;
INSERT INTO `analysis_rparamaters` VALUES (8,1,0,'parm1'),(9,1,1,'hih'),(10,2,0,'parm2');
/*!40000 ALTER TABLE `analysis_rparamaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (25,'Administrator'),(13,'Grader');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add language pair',7,'add_languagepair'),(20,'Can change language pair',7,'change_languagepair'),(21,'Can delete language pair',7,'delete_languagepair'),(22,'Can add language',8,'add_language'),(23,'Can change language',8,'change_language'),(24,'Can delete language',8,'delete_language'),(25,'Can add grader',9,'add_grader'),(26,'Can change grader',9,'change_grader'),(27,'Can delete grader',9,'delete_grader'),(28,'Can add error code',10,'add_errorcode'),(29,'Can change error code',10,'change_errorcode'),(30,'Can delete error code',10,'delete_errorcode'),(31,'Can add error',11,'add_error'),(32,'Can change error',11,'change_error'),(33,'Can delete error',11,'delete_error'),(34,'Can add source text',12,'add_sourcetext'),(35,'Can change source text',12,'change_sourcetext'),(36,'Can delete source text',12,'delete_sourcetext'),(40,'Can add source discrepancy queue',14,'add_sourcediscrepancyqueue'),(41,'Can change source discrepancy queue',14,'change_sourcediscrepancyqueue'),(42,'Can delete source discrepancy queue',14,'delete_sourcediscrepancyqueue'),(43,'Can add target text',15,'add_targettext'),(44,'Can change target text',15,'change_targettext'),(45,'Can delete target text',15,'delete_targettext'),(46,'Can add exam',16,'add_exam'),(47,'Can change exam',16,'change_exam'),(48,'Can delete exam',16,'delete_exam'),(49,'Can add grader queue',17,'add_graderqueue'),(50,'Can change grader queue',17,'change_graderqueue'),(51,'Can delete grader queue',17,'delete_graderqueue'),(52,'Can add target review queue',18,'add_targetreviewqueue'),(53,'Can change target review queue',18,'change_targetreviewqueue'),(54,'Can delete target review queue',18,'delete_targetreviewqueue'),(55,'Can add target input queue',19,'add_targetinputqueue'),(56,'Can change target input queue',19,'change_targetinputqueue'),(57,'Can delete target input queue',19,'delete_targetinputqueue'),(58,'Can add discrepancy',20,'add_discrepancy'),(59,'Can change discrepancy',20,'change_discrepancy'),(60,'Can delete discrepancy',20,'delete_discrepancy'),(61,'Can add error json',21,'add_errorjson'),(62,'Can change error json',21,'change_errorjson'),(63,'Can delete error json',21,'delete_errorjson'),(64,'Can add record',22,'add_record'),(65,'Can change record',22,'change_record'),(66,'Can delete record',22,'delete_record'),(67,'Can add perm options',23,'add_permoptions'),(68,'Can change perm options',23,'change_permoptions'),(69,'Can delete perm options',23,'delete_permoptions'),(70,'Can add perm objects',24,'add_permobjects'),(71,'Can change perm objects',24,'change_permobjects'),(72,'Can delete perm objects',24,'delete_permobjects'),(73,'Can add group permissions',25,'add_grouppermissions'),(74,'Can change group permissions',25,'change_grouppermissions'),(75,'Can delete group permissions',25,'delete_grouppermissions'),(76,'Can add perm object parent',26,'add_permobjectparent'),(77,'Can change perm object parent',26,'change_permobjectparent'),(78,'Can delete perm object parent',26,'delete_permobjectparent'),(79,'Can add r functions',27,'add_rfunctions'),(80,'Can change r functions',27,'change_rfunctions'),(81,'Can delete r functions',27,'delete_rfunctions'),(82,'Can add r paramaters',28,'add_rparamaters'),(83,'Can change r paramaters',28,'change_rparamaters'),(84,'Can delete r paramaters',28,'delete_rparamaters'),(88,'Can add source review queue',30,'add_sourcereviewqueue'),(89,'Can change source review queue',30,'change_sourcereviewqueue'),(90,'Can delete source review queue',30,'delete_sourcereviewqueue'),(91,'Can add exam',31,'add_exam'),(92,'Can change exam',31,'change_exam'),(93,'Can delete exam',31,'delete_exam'),(94,'Can add error code',32,'add_errorcode'),(95,'Can change error code',32,'change_errorcode'),(96,'Can delete error code',32,'delete_errorcode'),(97,'Can add error',33,'add_error'),(98,'Can change error',33,'change_error'),(99,'Can delete error',33,'delete_error'),(100,'Can add grader queue',34,'add_graderqueue'),(101,'Can change grader queue',34,'change_graderqueue'),(102,'Can delete grader queue',34,'delete_graderqueue'),(103,'Can add error indexes',35,'add_errorindexes'),(104,'Can change error indexes',35,'change_errorindexes'),(105,'Can delete error indexes',35,'delete_errorindexes');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$5JWp8V0comkD$k90xp6UirFj7cpDroWUbnYHrOicfyu/XA1UwrgozSQg=','2014-11-22 14:24:16',1,'root','root','root','root@yahoo.com',1,1,'2014-05-05 03:39:37'),(3,'pbkdf2_sha256$12000$kQslrPetFQf7$AIPPKrBfXuEdrwTMhuJN+nY89ls8YZd6JvgqutrdlM8=','2014-11-14 07:13:39',1,'ruttan','Arden','Ruttan','dfjaljd@gmail.com',1,1,'2014-05-15 17:19:16'),(4,'pbkdf2_sha256$12000$tDsdjkhnp4mB$3Nd4ImxC/xQ9wySvZePOFt4Alqxh87jUeffPNnUGaQI=','2014-11-07 01:00:56',0,'Geoff','Geoff','Koby','agruttan@gmail.com',0,1,'2014-05-16 14:21:08'),(11,'pbkdf2_sha256$12000$wgFXlPa2vXJE$Natc11NTV9ml81w8vwkpbZskwGze5yzo4tYTnqZhYCw=','2014-10-30 14:58:58',0,'jjeander','Jeremy','Jeandervin','jjeander@kent.edu',0,1,'2014-10-30 14:58:49'),(14,'pbkdf2_sha256$12000$YTMbMcrGysYO$5VF9swRUhY7gBVQGHeJs6a+FyMSud1jwMvgFL0vH2k8=','2014-11-21 15:01:23',0,'zmontgom','Zachary','Montgomery','zmontgom@yahoo.com',0,1,'2014-11-01 19:22:13');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (31,1,25),(34,3,13),(26,4,13),(14,11,13),(39,14,13);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegroups_grouppermissions`
--

DROP TABLE IF EXISTS `cegroups_grouppermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cegroups_grouppermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId_id` int(11) DEFAULT NULL,
  `permObject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cegroups_grouppermissions_e0c5286b` (`groupId_id`),
  KEY `cegroups_grouppermissions_2eb698a1` (`permObject_id`),
  CONSTRAINT `groupId_id_refs_id_cc921a28` FOREIGN KEY (`groupId_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permObject_id_refs_id_76929fe7` FOREIGN KEY (`permObject_id`) REFERENCES `cegroups_permobjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegroups_grouppermissions`
--

LOCK TABLES `cegroups_grouppermissions` WRITE;
/*!40000 ALTER TABLE `cegroups_grouppermissions` DISABLE KEYS */;
INSERT INTO `cegroups_grouppermissions` VALUES (2,13,1),(14,NULL,11),(15,NULL,10),(16,NULL,13),(17,NULL,12),(18,NULL,9),(25,13,12),(26,13,22),(27,13,13),(28,13,21),(29,13,9);
/*!40000 ALTER TABLE `cegroups_grouppermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegroups_permobjectparent`
--

DROP TABLE IF EXISTS `cegroups_permobjectparent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cegroups_permobjectparent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentObject_id` int(11) DEFAULT NULL,
  `childObject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cegroups_permobjectparent_caae8bd0` (`parentObject_id`),
  KEY `cegroups_permobjectparent_d771ca1c` (`childObject_id`),
  CONSTRAINT `childObject_id_refs_id_ed902ed0` FOREIGN KEY (`childObject_id`) REFERENCES `cegroups_permobjects` (`id`),
  CONSTRAINT `parentObject_id_refs_id_ed902ed0` FOREIGN KEY (`parentObject_id`) REFERENCES `cegroups_permobjects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegroups_permobjectparent`
--

LOCK TABLES `cegroups_permobjectparent` WRITE;
/*!40000 ALTER TABLE `cegroups_permobjectparent` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegroups_permobjectparent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegroups_permobjects`
--

DROP TABLE IF EXISTS `cegroups_permobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cegroups_permobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegroups_permobjects`
--

LOCK TABLES `cegroups_permobjects` WRITE;
/*!40000 ALTER TABLE `cegroups_permobjects` DISABLE KEYS */;
INSERT INTO `cegroups_permobjects` VALUES (1,'admin-nav'),(9,'exam-drop-down'),(10,'source-drop-down'),(11,'analysis-drop-down'),(12,'enter-exam'),(13,'enter-source'),(14,'view-source'),(15,'analysis-page'),(16,'view-graded'),(17,'exam-tab'),(18,'discrep-tab'),(19,'grade-tab'),(21,'id_examNumber'),(22,'grader4cb');
/*!40000 ALTER TABLE `cegroups_permobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegroups_permoptions`
--

DROP TABLE IF EXISTS `cegroups_permoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cegroups_permoptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegroups_permoptions`
--

LOCK TABLES `cegroups_permoptions` WRITE;
/*!40000 ALTER TABLE `cegroups_permoptions` DISABLE KEYS */;
INSERT INTO `cegroups_permoptions` VALUES (1,'Hide admin-nav'),(2,'Read-only'),(9,'Full');
/*!40000 ALTER TABLE `cegroups_permoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-05-05 03:44:05',1,4,'2','user1',1,''),(2,'2014-05-05 03:44:11',1,4,'2','user1',2,'No fields changed.'),(3,'2014-05-05 03:44:29',1,9,'1','123 - Smith',1,''),(4,'2014-05-05 03:44:48',1,7,'1','root --- eng',1,''),(5,'2014-05-05 03:44:55',1,7,'2','root --- spa',1,''),(6,'2014-05-05 03:45:03',1,7,'3','user1 --- eng',1,''),(7,'2014-05-05 03:45:10',1,7,'4','user1 --- spa',1,''),(8,'2014-05-05 09:57:41',1,4,'2','user1',2,'Changed password.'),(9,'2014-05-05 12:50:32',1,12,'1','eng_spa_2010_1_B_1',2,'Changed passageLetter and importer2.'),(10,'2014-05-05 15:02:36',1,8,'16','kor',1,''),(11,'2014-05-15 17:19:16',1,4,'3','ruttan',1,''),(12,'2014-05-15 17:23:44',1,4,'3','ruttan',2,'Changed is_staff and is_superuser.'),(13,'2014-05-16 14:21:09',3,4,'4','Geoff',1,''),(14,'2014-05-16 14:21:46',3,4,'5','Arden',1,''),(15,'2014-05-16 14:23:22',3,4,'5','Arden',2,'Changed first_name, last_name and email.'),(16,'2014-05-16 14:24:34',3,4,'4','Geoff',2,'Changed first_name, last_name and email.'),(17,'2014-05-16 14:24:48',3,4,'4','Geoff',2,'No fields changed.'),(18,'2014-05-16 14:31:13',3,12,'3','eng_ger_2010_11235_A_1',1,''),(19,'2014-05-16 14:34:04',3,9,'2','268 - ruttan',1,''),(20,'2014-05-16 14:34:14',3,9,'2','268 - ruttan',2,'No fields changed.'),(21,'2014-05-16 14:35:37',3,9,'3','269 - Koby',1,''),(22,'2014-05-16 15:29:20',3,7,'5','Geoff --- ger',1,''),(23,'2014-05-16 15:30:07',3,7,'6','Arden --- ger',1,''),(24,'2014-05-16 15:30:11',3,7,'6','Arden --- ger',2,'No fields changed.'),(25,'2014-05-16 15:30:38',3,7,'7','Geoff --- eng',1,''),(26,'2014-05-16 15:31:01',3,7,'8','Arden --- eng',1,''),(27,'2014-05-16 15:52:13',3,7,'9','Arden --- spa',1,''),(28,'2014-05-16 15:52:30',3,7,'10','Geoff --- spa',1,''),(29,'2014-05-16 15:52:54',3,7,'11','Geoff --- spa',1,''),(30,'2014-05-17 20:34:11',3,15,'16','TARGET TEXT 16 0',1,''),(31,'2014-05-17 20:43:02',3,16,'2','EXAM # 13331',3,''),(32,'2014-05-17 20:48:12',3,12,'5','eng_ger_2014_1_A_1',1,''),(33,'2014-05-17 20:49:30',3,12,'6','eng_ger_2014_2_B_1',1,''),(34,'2014-05-17 20:51:09',3,15,'17','TARGET TEXT 17 0',1,''),(35,'2014-05-17 20:52:04',3,15,'18','TARGET TEXT 18 0',1,''),(36,'2014-05-17 20:54:30',3,16,'8','EXAM # 16621',1,''),(37,'2014-05-17 20:55:55',3,17,'9','GraderQueue object',1,''),(38,'2014-05-17 20:56:17',3,17,'10','GraderQueue object',1,''),(39,'2014-05-22 20:32:31',1,16,'9','EXAM # 54231',2,'Changed targetText1 and targetText2.'),(40,'2014-09-12 13:39:27',1,12,'8','spa_eng_2005_1_A_1',2,'Changed setNumber, versionNumber and importer2.'),(41,'2014-09-26 15:49:12',1,7,'1','root --- eng',1,''),(42,'2014-09-26 15:49:25',1,7,'2','root --- spa',1,''),(43,'2014-09-26 15:49:41',1,7,'3','user1 --- spa',1,''),(44,'2014-09-26 15:49:51',1,7,'4','user1 --- eng',1,''),(45,'2014-09-26 15:50:08',1,7,'5','Geoff --- ger',1,''),(46,'2014-09-26 15:50:24',1,7,'6','Arden --- ger',1,''),(47,'2014-09-26 15:50:39',1,7,'7','Geoff --- eng',1,''),(48,'2014-09-26 15:50:48',1,7,'8','Arden --- eng',1,''),(49,'2014-09-26 15:51:08',1,7,'9','Arden --- spa',1,''),(50,'2014-09-26 15:51:17',1,7,'10','Geoff --- spa',1,''),(51,'2014-10-05 16:16:59',1,3,'1','Grader',1,''),(52,'2014-10-05 16:22:02',1,4,'5','Arden',2,'Changed groups.'),(53,'2014-10-05 16:22:10',1,4,'4','Geoff',2,'Changed groups.'),(54,'2014-10-05 16:22:24',1,4,'2','user1',2,'Changed groups.'),(55,'2014-10-05 16:22:32',1,4,'6','zmontgom',2,'Changed groups.'),(56,'2014-10-07 15:41:16',1,17,'11','GraderQueue object',1,''),(57,'2014-10-07 15:41:35',1,17,'11','GraderQueue object',2,'No fields changed.'),(58,'2014-10-27 03:44:20',1,24,'1','admin-nav',1,''),(59,'2014-10-27 04:29:58',1,3,'2','Administrator',1,''),(60,'2014-10-27 04:43:24',1,4,'1','root',2,'Changed groups.'),(61,'2014-10-27 04:43:29',1,4,'6','zmontgom',2,'No fields changed.'),(62,'2014-10-27 04:44:08',1,23,'1','permOptions object',1,''),(63,'2014-10-27 04:44:10',1,25,'1','groupPermissions object',1,''),(64,'2014-10-27 14:55:22',1,4,'7','admin',3,''),(65,'2014-10-27 14:57:13',1,4,'9','tbone',3,''),(66,'2014-11-06 04:53:10',1,7,'11','zmontgom --- eng',1,''),(67,'2014-11-06 04:53:19',1,7,'12','zmontgom --- spa',1,''),(68,'2014-11-07 01:21:11',1,7,'13','zmontgom --- ger',1,''),(69,'2014-11-13 02:06:49',1,3,'75','Test',2,'Changed permissions.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'language pair','userprofile','languagepair'),(8,'language','texts','language'),(9,'grader','texts','grader'),(10,'error code','texts','errorcode'),(11,'error','texts','error'),(12,'source text','texts','sourcetext'),(14,'source discrepancy queue','texts','sourcediscrepancyqueue'),(15,'target text','texts','targettext'),(16,'exam','texts','exam'),(17,'grader queue','texts','graderqueue'),(18,'target review queue','texts','targetreviewqueue'),(19,'target input queue','texts','targetinputqueue'),(20,'discrepancy','texts','discrepancy'),(21,'error json','texts','errorjson'),(22,'record','records','record'),(23,'perm options','cegroups','permoptions'),(24,'perm objects','cegroups','permobjects'),(25,'group permissions','cegroups','grouppermissions'),(26,'perm object parent','cegroups','permobjectparent'),(27,'r functions','analysis','rfunctions'),(28,'r paramaters','analysis','rparamaters'),(30,'source review queue','texts','sourcereviewqueue'),(31,'exam','exams','exam'),(32,'error code','grade','errorcode'),(33,'error','grade','error'),(34,'grader queue','grade','graderqueue'),(35,'error indexes','grade','errorindexes');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0ftu5kkiknvdwsz6zfzio718rokhdga7','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-27 12:05:46'),('0lc0yk1rkpy14e6na5vbz8r5llweahvj','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-21 14:15:47'),('0u4skc852dbopzrjj5o0t9kr8ecrvxwj','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-05 15:23:58'),('0w7o36tf8agcc6zmoka5r9v5s14smwx9','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-23 15:41:47'),('0zwnlarkk3dsc5f91uh7ls6ed5287mch','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 18:41:11'),('13u3n16y1oaue8xzgoei8x79yqijdbn8','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-26 13:24:44'),('1414k8sjb8em9wfs24g2foxpg93xxffj','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-11 15:16:17'),('1bj971l7euyojghkzjb2wxly11gf63zo','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-18 16:07:01'),('1c0mermweafifzo923mbysf1pzz2fb95','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-02 16:25:53'),('1hnh07jz1421k7d0urjpylzmrr5qlnep','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-19 13:46:32'),('27jvk7b3v7ce6yvalxy6ppo5657xlf09','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-28 07:15:11'),('2a1aa7v8wifeplrh2dou4oxr8qffqr06','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-05 16:36:25'),('2kvkeispaj5ij07g5jbtf8adyqpnvejn','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-05-31 20:58:19'),('2m3b06inaz3o1ia95n02jhnrsm4rm28v','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-27 04:18:50'),('2odsmkwjszasodxg5zkjbofk65oirr93','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-19 14:16:56'),('2q7lg23fxq944w3oaph7cmt073wkqu5l','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-23 16:17:57'),('2sqjdjb1ikmeh3fxf53n3lqyn9xd6tuu','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-16 13:53:10'),('2v8ahqycy2clfhpaekxs666lg56rrbpf','ODJiNGEyYzI1NTY2OWQxNmJkZGNlOGQ0YjljYzNhYjNlYjE3NWQwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-10-28 17:23:06'),('2yj53bjc34e679vy7eyaln5yyfcik781','ODJiNGEyYzI1NTY2OWQxNmJkZGNlOGQ0YjljYzNhYjNlYjE3NWQwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-05-19 04:06:48'),('2zgu78h1ywsdbmcebhz1qm48f2lmqmlk','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-08-07 18:11:04'),('30amxp6q2z53bom9176xlk5wd1e1t9hh','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-01 07:06:47'),('31lk9kjorwi3wy9ctk9quuyorl7xde1j','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-05 14:38:52'),('39b7y0tqpsy5ibxxycgsomy7fno8edsp','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-26 13:48:06'),('49zb6yzjdnylfavmmi501zgnf404mlde','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-29 11:31:54'),('4f6fy32fm1zdhyow3pivy40w2jcls9p4','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-28 00:45:41'),('59q4nuk236pqda3sdbqs57c1riyi6ple','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:04:47'),('62qup3p8l1bspavj4p4to88b4cf6kbg3','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-11 15:16:15'),('653nrotbckkkaxw00b6tmdh0dem4sgfl','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-10-17 14:39:12'),('6e5k3lth1e4majhpjjqltn47cufr1fuz','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-16 14:52:29'),('8cx6egwralk9ypnv2k0ljjylqzcfa0nr','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-22 21:24:40'),('8rtnv35klf1ihdhdl11c6t3wipskkow7','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:33:14'),('8vxd8053qe1bjoed1a4o2htimsiymz1x','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-26 07:39:49'),('99woojo8dqj99w8vrn0rd4uxxxkf5ejh','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-07 04:20:57'),('9gauepqfunnzh6zghv908vccwelbb4co','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-11-06 21:14:05'),('9kc92tlgsgt4y5esain7hohyrafw7h1l','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-13 15:07:02'),('adox8gqktko5d4dcq50eb7pgxyirm5dw','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-11-05 21:49:58'),('alwhuw8oag9uajfkdhq641p3p91a7q5o','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-10-17 13:12:09'),('ap5uoab7rhwwa0veogw7s6uvibp8btkl','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-03 06:37:08'),('bl8v1dzhjqzafnk28chq4f8dy5fg7tln','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:23:58'),('brttcqyark8ludzld7w7hy7r2abpsp28','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-19 12:11:42'),('bx0fmq7qbyvjp7zbjocmx8gd5v4evicv','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-14 15:30:29'),('bzcwpyei130o2bjsy62hvsxpqlynopfe','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-31 02:48:07'),('chg7khat9ro1b5kgl92pnf63jeeq05qt','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-06 15:15:29'),('cmdow8ynulq5atpsxgi88ei3axfevryr','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-21 22:23:00'),('db2wvpt8qjkweh1fh8n4sgi09u5ymtyu','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-11 14:40:51'),('dqkyjg35mb0cxuhy5ikoaxruj5rek59m','MjAxMzMwMmYzYjliNzg3OTkzZjA2Mzk5MjY1MTMzODVhOGI1NzNkYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=','2014-09-16 13:41:50'),('dw8f8y1beio29h2gytgd7nberwrs17lj','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-05 14:14:28'),('e1zafdzaw6hhv59lh7rf9bzoyp0nucv3','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-16 15:12:15'),('e6ic1sf0usim68toxaa61pnnd0f7gqr9','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-16 15:12:33'),('ehqvncz3saw2qfmqy1szuocgk6obvxlz','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-25 22:24:49'),('esmmw07y2kp8x129svipiv7khghjpck3','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-19 14:17:39'),('eyhx9ltramu6fouthnw9onm22k0sosf2','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-27 16:17:28'),('f888q6wlt1wzevvc59n6m58btli5l5hv','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-03 14:57:22'),('gf251le0p1pmngeybpcai6rltd77uqmr','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-12 13:45:47'),('gfwbqfy7txkrs3gxrj46eegxo85fis1c','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-23 16:16:23'),('ithgfxfo4j2zv2l07m5sfy1h78hmg1y8','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-20 16:17:19'),('j1d78upniv39hn16o083ijwo7y0n1kto','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-31 00:38:32'),('j3hofw63ykhlkww4ql82b9j5n3lvqlpt','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-16 18:04:11'),('j8du8jjoecmykeh3bsbw73y7q4vwx525','ODJiNGEyYzI1NTY2OWQxNmJkZGNlOGQ0YjljYzNhYjNlYjE3NWQwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-11-02 00:54:25'),('je5vqc0hrmp1otw2ok3hkibz4xqqz9o8','ODJiNGEyYzI1NTY2OWQxNmJkZGNlOGQ0YjljYzNhYjNlYjE3NWQwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-10-31 13:36:56'),('jtzvp83fzpcs9pu2bhul2419zxie4wep','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-05 22:04:49'),('jx9pwriati0qevbs8oub7katiebhy008','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-04 15:49:14'),('likwcik7kug1lzezhowf24mo8goun6sh','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-31 13:45:38'),('ll729fjtv2gbyuuif33rlgyiukushqfv','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-15 16:07:24'),('lmrke6fhvxoznm0kbvr6re8feuzx5mz8','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-20 13:25:17'),('lptwarlowrk70aq8ggskau46obh1gpj8','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-06-01 18:49:16'),('lqdh0eh6qdnje2sn49ejcwpzvsbc8otk','MTVkM2IwZjYzOTRkM2FkYWU4YmZiZTZhMDIyZDA4Y2ZlZjcyZjg1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTF9','2014-11-13 14:58:58'),('ltroinbsudawc8uegf3j4x3ghwbnqin3','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:25:53'),('mb872ao5o12qs3jfmqmls1pwvjmk3feg','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-30 06:25:44'),('mc5uwkvri9y7sbg7vqkf4tr4m4xr1r9s','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-06 14:24:04'),('mhcwt6k7kh4wv1z3v6cphaaptmycvedw','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:08:07'),('mohmlp24zig7q06ylcuwfq6fdlnofbmb','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-14 15:12:07'),('mysji8umx390n17of3j5iyfk1z6lsk5b','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-06-13 03:40:02'),('n2h48spk7fqadmcqjnwpa96x8e4rsf5c','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-23 13:14:13'),('nam39t21gpjfu1m5u15hznei9wte84j5','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-10 23:20:35'),('nbx3egapg63br5gee919qz7w9g0x8gsn','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-10 11:51:44'),('noyulmw6dxsd37vu8fxpxgqawcg62blc','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-05-19 03:40:03'),('nx2lgz0aruffwvkmm7fo1u8bszqi1rng','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-23 22:19:31'),('oozc70mj8q2n4u1gb58tarekcauxfs3n','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-26 11:05:02'),('oq5uy18pcvte3wfabm59ak8g1t65cgkg','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-30 15:14:26'),('orvtywg4g6jl15n74qwotc1c2g3p75w9','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-18 16:06:59'),('pcy70lmxii76a6yas6s3ax60s5mxgeow','ODJiNGEyYzI1NTY2OWQxNmJkZGNlOGQ0YjljYzNhYjNlYjE3NWQwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-10-24 13:43:54'),('pfr11deyvez2kvkidu5xtcdk00n64hyt','MjAxMzMwMmYzYjliNzg3OTkzZjA2Mzk5MjY1MTMzODVhOGI1NzNkYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=','2014-06-01 18:48:08'),('pznrcz1s1jw32giuyuzcdadac0i63wbb','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-02 17:07:16'),('q2bd34cf9ubnh9m3dea62ybb08fd4sy4','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-18 16:11:42'),('q7zf28yh5m7av0756hrugu835tal1nm0','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-11-06 16:02:39'),('qbh36blqap79ygeptyom3dsvcszaledo','ZWQzYmNjNjgxOTY4YTNlMmZhMjIzZmRkNGE4OTcxMGQzMDhiZTQxODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9','2014-11-13 00:59:20'),('qnvdt2fyra90yic637cvujpz7drgkrg1','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:56:59'),('qtpn75xzgikg5odremvju9l032qi9oly','ZWQzYmNjNjgxOTY4YTNlMmZhMjIzZmRkNGE4OTcxMGQzMDhiZTQxODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9','2014-11-13 14:55:44'),('r4fvxvb92zz3sqok8dxrh4qwn8qzxnna','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-09 00:43:29'),('r7quk7vb6e0tapmk6aeqoeglrx8sqvw3','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-12 14:00:59'),('ravrnibxww034oyuovrvij0c9n0toakd','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-10-14 15:42:48'),('risi7rw262rm0avps5c3y6plg07v3mx7','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-06 14:24:16'),('rpct5e59w5fwzke4b3jujhrjcu1acfh8','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-09 00:17:53'),('s2f7ed0u9dfv1qsh3dn0sdrpjo7hrs38','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-28 00:45:41'),('s3b4c6jc3iqnm73r9p6p54zopzsmhjzt','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-15 19:11:30'),('se43e2cojqw4ymwkn81znstlemol3gej','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-28 00:04:36'),('sieiayr98m7fiyp3crzwjk2hi04t39s2','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-21 14:33:37'),('sowov8ni439bae5itruu53qhb0woxv0p','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-05-29 17:26:01'),('t6z50is8aixkgiib3kwgafcjofkzxg4x','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-10-30 20:02:15'),('tmrr8lw7icbekwuk2h51ir5a7mb8f6m9','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-23 19:03:30'),('uo56n5esyko3i5xfyte8etcomeg2ivcv','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-13 16:01:58'),('uoi5955fbf86hjpkeo80iws31638f8ia','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-28 22:44:04'),('uq7idanmqkzy95xsnsyrvnq4jajsawd0','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-02 18:38:25'),('ur754428gozphyc189tjgpxddzpuaqm4','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-25 16:25:40'),('uxq2zf11lmhdthzjejzpaps4cks215ks','ODJiNGEyYzI1NTY2OWQxNmJkZGNlOGQ0YjljYzNhYjNlYjE3NWQwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-10-28 15:41:48'),('ve82kfolrd74n7qq77vv8gejj1vd1ged','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-16 15:52:03'),('vt16jpto9bd3chh1xqj09egrm2e6ftg4','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-15 18:08:39'),('wfxn7ksly49mg3gfyuqwriy5smzs5mj7','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:38:27'),('wfy8vmj7nxtib20r6llywopt4wr42sn8','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-11 15:12:08'),('x091c9dbb8d5mj3fmjrm41ykovjbe84l','ODJiNGEyYzI1NTY2OWQxNmJkZGNlOGQ0YjljYzNhYjNlYjE3NWQwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-09-19 13:16:53'),('x5aj42op1mjl8b9h98cfcfzhb1yye100','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-08 22:05:26'),('x9kgvwr0aewbeb58cxyxpm23ufm3edzs','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-12-05 14:36:55'),('xhappea6qz0o1s1p1h42ok3wk64aykjl','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-12 13:40:33'),('xk5jlb1zxohwic17vswfm4jn80xu5swf','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-11 15:22:40'),('xnp32ecta6c2x1z4obxtt4ev7lcvgzr4','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-28 23:15:06'),('xp5sia029s7e683eyf3hx6hh3vlel0bx','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-24 14:22:51'),('xqxsog3yl0ay14dvoj8haxx79tix1dyf','MDRjN2QxOGY0NTdmYjM0NzRmNzQ3ZDFiZmY2OTJlMDBkOGJiMzA0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=','2014-09-19 13:50:29'),('xukxxez3v39az9bf1u3allpysktrkhl6','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-11 21:31:02'),('xx2xu7uxjyicuts6fzvnazxwtff3emza','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-11 15:18:38'),('y0xrwdb7721b096xkivconod85v63uos','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-20 16:34:51'),('y3qkbxqqm14ggqj8058dapc4jfyyupjh','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-08 19:57:52'),('y9m6oz4eopzrne7qa3a4fl4c1pwebv3z','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 12:54:50'),('ycryjb8t959m4wi4ndnf1j3g6vdytdc0','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-21 00:34:46'),('yzjl0jqbc1tzjbxgvk52pv4hkxjajtgl','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-10-28 15:42:44'),('yzrnm7ua1up2tyny6bjgkpt8adysw9h5','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-14 13:25:01'),('yzy2i63ub3zj8qh0rzs74614b5sp59hf','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-19 14:11:55'),('z1grtnkmxk0bt1kpc89ard8kiskse98f','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-10-14 15:30:32'),('z92ebvnr14la4yjeutxmfbirq8umx239','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-19 14:33:52'),('zctp9utdgtul2n9xjxvbe6ntrehckbkg','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-06 14:57:40'),('zfu9gpihb3y6reay8arfaskkgbq24edj','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-11-05 03:48:05'),('zkkdcgd70cw4iv71y8l4egf0rfn4t4c3','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-24 15:04:09'),('ztrg5yndis2b9uiajxmsybs9qjlda91z','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-23 13:22:53');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams_exam`
--

DROP TABLE IF EXISTS `exams_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exams_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examNumber` varchar(5) NOT NULL,
  `grader1_id` int(11) NOT NULL,
  `grader2_id` int(11) NOT NULL,
  `passed` tinyint(1) DEFAULT NULL,
  `sourceText1_id` int(11) NOT NULL,
  `sourceText2_id` int(11) NOT NULL,
  `targetText1_id` int(11) NOT NULL,
  `targetText2_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_exam_34bd6254` (`grader1_id`),
  KEY `exams_exam_552b40e3` (`grader2_id`),
  KEY `exams_exam_709378a4` (`sourceText1_id`),
  KEY `exams_exam_e82bc764` (`sourceText2_id`),
  KEY `exams_exam_c46536f7` (`targetText1_id`),
  KEY `exams_exam_87f8173f` (`targetText2_id`),
  KEY `exams_exam_784efa61` (`language_id`),
  CONSTRAINT `targetText2_id_refs_id_6ee08265` FOREIGN KEY (`targetText2_id`) REFERENCES `texts_targettext` (`id`),
  CONSTRAINT `grader1_id_refs_id_bcdfc1b1` FOREIGN KEY (`grader1_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `grader2_id_refs_id_bcdfc1b1` FOREIGN KEY (`grader2_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `language_id_refs_id_4bac6541` FOREIGN KEY (`language_id`) REFERENCES `texts_language` (`id`),
  CONSTRAINT `sourceText1_id_refs_id_984405d0` FOREIGN KEY (`sourceText1_id`) REFERENCES `texts_sourcetext` (`id`),
  CONSTRAINT `sourceText2_id_refs_id_984405d0` FOREIGN KEY (`sourceText2_id`) REFERENCES `texts_sourcetext` (`id`),
  CONSTRAINT `targetText1_id_refs_id_6ee08265` FOREIGN KEY (`targetText1_id`) REFERENCES `texts_targettext` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams_exam`
--

LOCK TABLES `exams_exam` WRITE;
/*!40000 ALTER TABLE `exams_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `exams_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_error`
--

DROP TABLE IF EXISTS `grade_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `passageLetter` varchar(1) NOT NULL,
  `grader_id` int(11) NOT NULL,
  `errorCode_id` int(11) NOT NULL,
  `gradingSession` smallint(5) unsigned NOT NULL,
  `errorValue` smallint(5) unsigned NOT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grade_error_57ed41d1` (`exam_id`),
  KEY `grade_error_fea04582` (`grader_id`),
  KEY `grade_error_06b3d53d` (`errorCode_id`),
  CONSTRAINT `errorCode_id_refs_id_1845c134` FOREIGN KEY (`errorCode_id`) REFERENCES `grade_errorcode` (`id`),
  CONSTRAINT `exam_id_refs_id_c35843bd` FOREIGN KEY (`exam_id`) REFERENCES `exams_exam` (`id`),
  CONSTRAINT `grader_id_refs_id_1a2c4e3b` FOREIGN KEY (`grader_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_error`
--

LOCK TABLES `grade_error` WRITE;
/*!40000 ALTER TABLE `grade_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_errorcode`
--

DROP TABLE IF EXISTS `grade_errorcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_errorcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errorCode` varchar(3) NOT NULL,
  `displayName` varchar(250) NOT NULL,
  `displayColor` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_errorcode`
--

LOCK TABLES `grade_errorcode` WRITE;
/*!40000 ALTER TABLE `grade_errorcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_errorcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_errorindexes`
--

DROP TABLE IF EXISTS `grade_errorindexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_errorindexes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_id` int(11) NOT NULL,
  `isSourceText` tinyint(1) NOT NULL,
  `beginIndex` int(10) unsigned NOT NULL,
  `endIndex` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grade_errorindexes_cc9b5678` (`error_id`),
  CONSTRAINT `error_id_refs_id_9977ed22` FOREIGN KEY (`error_id`) REFERENCES `grade_error` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_errorindexes`
--

LOCK TABLES `grade_errorindexes` WRITE;
/*!40000 ALTER TABLE `grade_errorindexes` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_errorindexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_graderqueue`
--

DROP TABLE IF EXISTS `grade_graderqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_graderqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `passageLetter` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grade_graderqueue_57ed41d1` (`exam_id`),
  CONSTRAINT `exam_id_refs_id_795f8009` FOREIGN KEY (`exam_id`) REFERENCES `exams_exam` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_graderqueue`
--

LOCK TABLES `grade_graderqueue` WRITE;
/*!40000 ALTER TABLE `grade_graderqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_graderqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_record`
--

DROP TABLE IF EXISTS `records_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` smallint(5) unsigned NOT NULL,
  `source_language` varchar(4) NOT NULL,
  `target_language` varchar(4) NOT NULL,
  `exam_number` smallint(5) unsigned NOT NULL,
  `second_passage` varchar(2) NOT NULL,
  `a_passage_markings` varchar(3) NOT NULL,
  `second_passage_markings` varchar(3) NOT NULL,
  `grader_one` smallint(5) unsigned NOT NULL,
  `grader_two` smallint(5) unsigned NOT NULL,
  `target_text_a` longtext NOT NULL,
  `target_text_b_c` longtext NOT NULL,
  `grader_stop_a` varchar(3) NOT NULL,
  `grader_stop_b_c` varchar(3) NOT NULL,
  `incomplete_a` varchar(3) NOT NULL,
  `incomplete_b_c` varchar(3) NOT NULL,
  `global_quality_pts` smallint(5) unsigned NOT NULL,
  `exam_reviewed_a` varchar(3) NOT NULL,
  `exam_appealed_b_c` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_record`
--

LOCK TABLES `records_record` WRITE;
/*!40000 ALTER TABLE `records_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `records_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_discrepancy`
--

DROP TABLE IF EXISTS `texts_discrepancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_discrepancy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_id` int(11) NOT NULL,
  `modifiedText` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `numTimesVerified` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_discrepancy_377be151` (`text_id`),
  KEY `texts_discrepancy_6340c63c` (`user_id`),
  CONSTRAINT `text_id_refs_id_6fd089da` FOREIGN KEY (`text_id`) REFERENCES `texts_targettext` (`id`),
  CONSTRAINT `user_id_refs_id_dfc29790` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_discrepancy`
--

LOCK TABLES `texts_discrepancy` WRITE;
/*!40000 ALTER TABLE `texts_discrepancy` DISABLE KEYS */;
/*!40000 ALTER TABLE `texts_discrepancy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_error`
--

DROP TABLE IF EXISTS `texts_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `passageLetter` varchar(1) NOT NULL,
  `errorNumber` smallint(5) unsigned NOT NULL,
  `errorCode_id` int(11) NOT NULL,
  `pointsDeducted` smallint(5) unsigned NOT NULL,
  `sourcePhrase` varchar(255) NOT NULL,
  `targetPhrase` varchar(255) NOT NULL,
  `sourceJSON` varchar(512) NOT NULL,
  `targetJSON` varchar(512) NOT NULL,
  `comment` longtext NOT NULL,
  `errorType` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_error_57ed41d1` (`exam_id`),
  KEY `texts_error_06b3d53d` (`errorCode_id`),
  CONSTRAINT `errorCode_id_refs_id_bb6d3ff2` FOREIGN KEY (`errorCode_id`) REFERENCES `texts_errorcode` (`id`),
  CONSTRAINT `exam_id_refs_id_e7ad6884` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_error`
--

LOCK TABLES `texts_error` WRITE;
/*!40000 ALTER TABLE `texts_error` DISABLE KEYS */;
INSERT INTO `texts_error` VALUES (26,28,'A',1,12,3,'text by Zach','palabras un Zach','','','This is not the right text','NORMAL_ERROR');
/*!40000 ALTER TABLE `texts_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_errorcode`
--

DROP TABLE IF EXISTS `texts_errorcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_errorcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errorCode` varchar(3) NOT NULL,
  `displayName` varchar(250) NOT NULL,
  `displayColor` varchar(25) NOT NULL,
  `points` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_errorcode`
--

LOCK TABLES `texts_errorcode` WRITE;
/*!40000 ALTER TABLE `texts_errorcode` DISABLE KEYS */;
INSERT INTO `texts_errorcode` VALUES (1,'UNF','Unfinished','Red','0,1,2,3'),(2,'Ill','Illegible','OrangeRed','0,1,2'),(3,'OTH','Other','Orange','0,1'),(4,'MT','Mistranslation into target language','FireBrick','1'),(5,'MU','Misunderstanding of source text','LightCoral','0,1,2,3,4,16'),(6,'A','Addition','Magenta','0,1,2,3,4,16'),(7,'O','Ommission','Maroon','0,1,2,3,4,16'),(8,'T','Terminology, word choice','MediumVioletRed','0,1,2,3,4,16'),(9,'R','Register','Orchid','0,1,2,3,4,16'),(10,'F','Too freely translated','PaleVioletRed','0,1,2,3,4,16'),(11,'L','Too literal, word-for-word translation','Pink','0,1,2,3,4,16'),(12,'FC','False cognate','Plum','0,1,2,3,4,16'),(13,'IND','Indecision, gave more than one option','Purple','0,1,2,3,4,16'),(14,'I','Inconsistency','Salmon','0,1,2,3,4,16'),(15,'AMB','Ambiguity','Tomato','0,1,2,3,4,16'),(16,'G','Grammar','Blue','0,1,2,3,4,16'),(17,'SY','Syntax(phrase/clause/sentence structure)','LightBlue','0,1,2,3,4,16'),(18,'P','Punctuation','Navy','0,1,2,3,4,16'),(19,'SP','Spelling','Green','0,1,2,3,4,16'),(20,'D','Accents, other diacritical marks','RoyalBlue','0,1,2,3,4,16'),(21,'C','Case(upper/lower)','SpringGreen','0,1,2,3,4,16'),(22,'WF','Word form','YellowGreen','0,1,2,3,4,16'),(23,'U','Usage','Chartreuse','0,1,2,3,4,16'),(24,'ST','Style','Lime','0,1,2,3,4,16'),(25,'BP','Bonus Points','Grey','0,-1,-2,-3');
/*!40000 ALTER TABLE `texts_errorcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_errorjson`
--

DROP TABLE IF EXISTS `texts_errorjson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_errorjson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `passageLetter` varchar(1) NOT NULL,
  `targetJSON` longtext NOT NULL,
  `sourceJSON` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_errorjson_57ed41d1` (`exam_id`),
  CONSTRAINT `exam_id_refs_id_7f9650e9` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_errorjson`
--

LOCK TABLES `texts_errorjson` WRITE;
/*!40000 ALTER TABLE `texts_errorjson` DISABLE KEYS */;
INSERT INTO `texts_errorjson` VALUES (8,21,'A','\n						<!--Display target text on the page-->\n						T<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\">hi</span><span data-node-position=\"left\" style=\"background-color: yellow;\">s is</span><span data-node-position=\"middle\" style=\"background-color: rgb(255, 192, 203);\"> </span><span data-node-position=\"right\" style=\"background-color: undefined;\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" data-errortype=\"NORMAL_ERROR\"></span><span data-node-position=\"right\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\">ex</span>t <span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\">b<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\"></span>y </span>Zach		\n						\n					','\n						<!--Display source text on the page-->\n						Th<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\"></span><span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\">is i</span>s <span class=\"rounded\" data-errorid=\"2\" title=\"Error #: 2   Error Code: A - Addition  Points Deducted: 0,1,2,3 Comments: \" style=\"background-color: Magenta;\" data-errortype=\"NORMAL_ERROR\" data-node-position=\"containing\">o<span data-color=\"yellow\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\" data-node-position=\"left\"></span></span><span data-node-position=\"middle\" style=\"background-color: rgb(255, 192, 203);\">n</span><span data-node-position=\"right\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\">b</span><span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\">y </span><span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\">Z<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\"></span><span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: null  Points Deducted: 1 Comments: \" style=\"background-color: undefined;\" data-errortype=\"NORMAL_ERROR\"></span>ach</span>\n					'),(9,28,'B','\n						<!--Display target text on the page-->\n						Ella e<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: P - Punctuation  Points Deducted: 0 Comments: \" style=\"background-color: Navy;\" data-errortype=\"NORMAL_ERROR\">s a p</span>alabras input\n					','\n						<!--Display source text on the page-->\n						Thi<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: P - Punctuation  Points Deducted: 0 Comments: \" style=\"background-color: Navy;\" data-errortype=\"NORMAL_ERROR\">s is a </span>test input\n					'),(10,31,'A','\n						<!--Display target text on the page-->\n						graded graded grade<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: BP - Bonus Points  Points Deducted: 0 Comments: \" style=\"background-color: Grey;\" data-errortype=\"NORMAL_ERROR\">dgr</span>adedgradedgradedgradedgradedgradedgradedgradedgradedgradedgraded graded gr<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: BP - Bonus Points  Points Deducted: 0 Comments: a\" style=\"background-color: Grey;\" data-errortype=\"NORMAL_ERROR\">aded</span>v graded gradedgraded\n					','\n						<!--Display source text on the page-->\n						This is an english to spanish new source<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: BP - Bonus Points  Points Deducted: 0 Comments: \" style=\"background-color: Grey;\" data-errortype=\"NORMAL_ERROR\"> t</span>est af<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: BP - Bonus Points  Points Deducted: 0 Comments: a\" style=\"background-color: Grey;\" data-errortype=\"NORMAL_ERROR\">ter re</span>moving redis from the project\n					');
/*!40000 ALTER TABLE `texts_errorjson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_errorpoint`
--

DROP TABLE IF EXISTS `texts_errorpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_errorpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errorPoint` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_errorpoint`
--

LOCK TABLES `texts_errorpoint` WRITE;
/*!40000 ALTER TABLE `texts_errorpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `texts_errorpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_exam`
--

DROP TABLE IF EXISTS `texts_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examNumber` varchar(5) NOT NULL,
  `secondPassage` varchar(1) NOT NULL,
  `aPassageMarkings` tinyint(1) NOT NULL,
  `secondPassageMarkings` tinyint(1) NOT NULL,
  `grader1` smallint(5) unsigned NOT NULL,
  `grader2` smallint(5) unsigned NOT NULL,
  `grader3` smallint(5) unsigned NOT NULL,
  `grader4` smallint(5) unsigned NOT NULL,
  `sourceText1_id` int(11) NOT NULL,
  `sourceText2_id` int(11) NOT NULL,
  `targetText1_id` int(11) DEFAULT NULL,
  `targetText2_id` int(11) DEFAULT NULL,
  `sourceLanguage_id` int(11) NOT NULL,
  `targetLanguage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_exam_709378a4` (`sourceText1_id`),
  KEY `texts_exam_e82bc764` (`sourceText2_id`),
  KEY `texts_exam_c46536f7` (`targetText1_id`),
  KEY `texts_exam_87f8173f` (`targetText2_id`),
  KEY `texts_exam_42bfcc0a` (`sourceLanguage_id`),
  KEY `texts_exam_7419cdfb` (`targetLanguage_id`),
  CONSTRAINT `sourceLanguage_id_refs_id_09ca21fa` FOREIGN KEY (`sourceLanguage_id`) REFERENCES `texts_language` (`id`),
  CONSTRAINT `sourceText1_id_refs_id_438d23d9` FOREIGN KEY (`sourceText1_id`) REFERENCES `texts_sourcetext` (`id`),
  CONSTRAINT `sourceText2_id_refs_id_438d23d9` FOREIGN KEY (`sourceText2_id`) REFERENCES `texts_sourcetext` (`id`),
  CONSTRAINT `targetLanguage_id_refs_id_09ca21fa` FOREIGN KEY (`targetLanguage_id`) REFERENCES `texts_language` (`id`),
  CONSTRAINT `targetText1_id_refs_id_fc56f4fe` FOREIGN KEY (`targetText1_id`) REFERENCES `texts_targettext` (`id`),
  CONSTRAINT `targetText2_id_refs_id_fc56f4fe` FOREIGN KEY (`targetText2_id`) REFERENCES `texts_targettext` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_exam`
--

LOCK TABLES `texts_exam` WRITE;
/*!40000 ALTER TABLE `texts_exam` DISABLE KEYS */;
INSERT INTO `texts_exam` VALUES (21,'50012','C',0,0,5,2,5,5,12,14,40,41,15,4),(28,'00001','B',0,0,4,14,4,4,12,14,50,51,15,4),(29,'00002','B',0,0,4,14,4,4,21,21,57,NULL,4,15),(30,'00003','B',0,0,4,14,4,4,69,69,NULL,NULL,4,7),(31,'00004','B',0,0,4,14,4,4,21,21,52,53,4,15),(32,'00099','B',0,0,4,14,4,4,73,73,NULL,NULL,7,4),(33,'10027','B',0,0,14,4,4,4,73,73,NULL,NULL,7,4),(34,'31651','C',0,0,14,4,4,4,73,73,NULL,NULL,7,4),(35,'00006','C',0,0,4,14,4,4,76,75,NULL,NULL,4,15),(36,'00005','C',0,0,14,4,4,4,21,75,NULL,54,4,15),(37,'00011','B',0,0,4,14,4,4,12,12,NULL,55,15,4),(38,'00007','B',0,0,14,4,4,4,21,21,56,NULL,4,15);
/*!40000 ALTER TABLE `texts_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_grader`
--

DROP TABLE IF EXISTS `texts_grader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_grader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `graderID` varchar(3) NOT NULL,
  `firstName` varchar(32) NOT NULL,
  `lastName` varchar(32) NOT NULL,
  `language1_id` int(11) NOT NULL,
  `language2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_grader_d92211fd` (`language1_id`),
  KEY `texts_grader_9ea9a921` (`language2_id`),
  CONSTRAINT `language1_id_refs_id_cc8ce7c9` FOREIGN KEY (`language1_id`) REFERENCES `texts_language` (`id`),
  CONSTRAINT `language2_id_refs_id_cc8ce7c9` FOREIGN KEY (`language2_id`) REFERENCES `texts_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_grader`
--

LOCK TABLES `texts_grader` WRITE;
/*!40000 ALTER TABLE `texts_grader` DISABLE KEYS */;
INSERT INTO `texts_grader` VALUES (1,'123','Joe','Smith',4,15),(2,'268','Arden','ruttan',7,15),(3,'269','Geoff','Koby',7,4);
/*!40000 ALTER TABLE `texts_grader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_graderqueue`
--

DROP TABLE IF EXISTS `texts_graderqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_graderqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `passageLetter` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_graderqueue_57ed41d1` (`exam_id`),
  CONSTRAINT `exam_id_refs_id_55e6431a` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_graderqueue`
--

LOCK TABLES `texts_graderqueue` WRITE;
/*!40000 ALTER TABLE `texts_graderqueue` DISABLE KEYS */;
INSERT INTO `texts_graderqueue` VALUES (12,21,'A'),(13,21,'C'),(22,28,'A'),(23,28,'B'),(24,31,'A'),(25,31,'B');
/*!40000 ALTER TABLE `texts_graderqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_language`
--

DROP TABLE IF EXISTS `texts_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(3) NOT NULL,
  `displayName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_language`
--

LOCK TABLES `texts_language` WRITE;
/*!40000 ALTER TABLE `texts_language` DISABLE KEYS */;
INSERT INTO `texts_language` VALUES (1,'ara','Arabic'),(2,'chi','Chinese'),(3,'dut','Dutch'),(4,'eng','English'),(5,'fin','Finnish'),(6,'fre','French'),(7,'ger','German'),(8,'hrv','Croation'),(9,'hun','Hungarian'),(10,'ita','Italian'),(11,'jpn','Japanese'),(12,'pol','Polish'),(13,'por','Portuguese'),(14,'rus','Russian'),(15,'spa','Spanish'),(16,'kor','Korean');
/*!40000 ALTER TABLE `texts_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_sourcediscrepancyqueue`
--

DROP TABLE IF EXISTS `texts_sourcediscrepancyqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_sourcediscrepancyqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `importer1_id` int(11) NOT NULL,
  `importer2_id` int(11) NOT NULL,
  `needsToReview_id` int(11) DEFAULT NULL,
  `originalSource_id` int(11) NOT NULL,
  `sourceLanguage_id` int(11) NOT NULL,
  `targetLanguage_id` int(11) NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `setNumber` smallint(5) unsigned NOT NULL,
  `passageLetter` varchar(1) NOT NULL,
  `versionNumber` smallint(5) unsigned NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `originalSource_id` (`originalSource_id`),
  KEY `texts_sourcediscrepancyqueue_ee481db5` (`importer1_id`),
  KEY `texts_sourcediscrepancyqueue_9845a96d` (`importer2_id`),
  KEY `texts_sourcediscrepancyqueue_df3423b3` (`needsToReview_id`),
  KEY `texts_sourcediscrepancyqueue_42bfcc0a` (`sourceLanguage_id`),
  KEY `texts_sourcediscrepancyqueue_7419cdfb` (`targetLanguage_id`),
  CONSTRAINT `importer1_id_refs_id_9cc5e3c4` FOREIGN KEY (`importer1_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `importer2_id_refs_id_9cc5e3c4` FOREIGN KEY (`importer2_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `needsToReview_id_refs_id_9cc5e3c4` FOREIGN KEY (`needsToReview_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `originalSource_id_refs_id_692ad46a` FOREIGN KEY (`originalSource_id`) REFERENCES `texts_sourcetext` (`id`),
  CONSTRAINT `sourceLanguage_id_refs_id_79bea7b3` FOREIGN KEY (`sourceLanguage_id`) REFERENCES `texts_language` (`id`),
  CONSTRAINT `targetLanguage_id_refs_id_79bea7b3` FOREIGN KEY (`targetLanguage_id`) REFERENCES `texts_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_sourcediscrepancyqueue`
--

LOCK TABLES `texts_sourcediscrepancyqueue` WRITE;
/*!40000 ALTER TABLE `texts_sourcediscrepancyqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `texts_sourcediscrepancyqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_sourcereviewqueue`
--

DROP TABLE IF EXISTS `texts_sourcereviewqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_sourcereviewqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_id` (`source_id`),
  CONSTRAINT `source_id_refs_id_8566f234` FOREIGN KEY (`source_id`) REFERENCES `texts_sourcetext` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_sourcereviewqueue`
--

LOCK TABLES `texts_sourcereviewqueue` WRITE;
/*!40000 ALTER TABLE `texts_sourcereviewqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `texts_sourcereviewqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_sourcetext`
--

DROP TABLE IF EXISTS `texts_sourcetext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_sourcetext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceLanguage_id` int(11) NOT NULL,
  `targetLanguage_id` int(11) NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `setNumber` smallint(5) unsigned NOT NULL,
  `passageLetter` varchar(1) NOT NULL,
  `versionNumber` smallint(5) unsigned NOT NULL,
  `text` longtext NOT NULL,
  `importer1_id` int(11) NOT NULL,
  `importer2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_sourcetext_42bfcc0a` (`sourceLanguage_id`),
  KEY `texts_sourcetext_7419cdfb` (`targetLanguage_id`),
  KEY `texts_sourcetext_ee481db5` (`importer1_id`),
  KEY `texts_sourcetext_9845a96d` (`importer2_id`),
  CONSTRAINT `importer1_id_refs_id_d5075373` FOREIGN KEY (`importer1_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `importer2_id_refs_id_d5075373` FOREIGN KEY (`importer2_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `sourceLanguage_id_refs_id_65131e74` FOREIGN KEY (`sourceLanguage_id`) REFERENCES `texts_language` (`id`),
  CONSTRAINT `targetLanguage_id_refs_id_65131e74` FOREIGN KEY (`targetLanguage_id`) REFERENCES `texts_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_sourcetext`
--

LOCK TABLES `texts_sourcetext` WRITE;
/*!40000 ALTER TABLE `texts_sourcetext` DISABLE KEYS */;
INSERT INTO `texts_sourcetext` VALUES (3,4,7,2010,11235,'A',1,'Las Palmas de Gran Canaria is a city in the island of Gran Canaria, in Spain. It is the co-capital (jointly with Santa Cruz) and the most populous city in the autonomous community of the Canary Islands, and the ninth largest city in Spain, with a population of 383,308 in 2010. Nearly half (45.9%) of the people of the island and 18.35% of all inhabitants of the Canary Islands live in this city. It is also the fifth most populous urban area in Spain with a population exceeding 700,000 and (depending on sources) ninth or tenth most populous metropolitan area in Spain with a population of between 625,000 and 750,000. Las Palmas is the largest city of the European Union lying outside the European Continent. It is located in the northeast part of the Spanish island of Gran Canaria, about 150 kilometres (93 miles) off the northwestern coast of Africa within the Atlantic Ocean.\r\n\r\n',3,4),(8,15,4,2005,1,'A',1,'Hola, aqui fjadsjflajl',1,1),(9,4,15,2005,1,'A',1,'This is a document in english that needs to be translated to spanish.',1,NULL),(10,13,6,2005,1,'A',1,'fadsfwefqe',1,NULL),(11,15,5,2013,4,'A',1,'fsagagear',1,NULL),(12,15,4,2014,1,'A',1,'This is only a text by Zach',1,NULL),(13,10,6,2014,2,'A',1,'This is a test',1,NULL),(14,15,4,2014,1,'A',1,'This is a test input',1,NULL),(15,1,1,2005,11,'A',3,'vdsafdasfdas',1,NULL),(16,7,1,2013,1,'A',1,'vzndsjfljdsaf fijdasilfjlads',1,NULL),(17,1,1,2005,11,'A',1,'hjhjk',1,NULL),(18,1,1,2005,11,'A',1,'hjhjk',1,NULL),(19,1,1,2005,20,'A',1,'hjhjk',1,NULL),(20,14,4,2014,15,'A',1,'Help, This is a seriously not serious test.',1,NULL),(21,4,15,2014,3,'B',3,'This is an english to spanish new source test after removing redis from the project',1,NULL),(22,1,4,2005,12,'B',12,'asokjs ojs ',1,NULL),(23,15,4,2007,1,'A',1,'This city is ocalteddffalsjfj.......',1,NULL),(24,4,15,2005,1,'C',1,'Source Passage Input',1,NULL),(25,1,1,2005,1,'A',1,'This is new test',1,NULL),(26,4,8,2005,1,'A',1,'jfajg afjadslfj adjfdasjf djflasj',1,NULL),(27,4,15,2005,1,'C',1,'Source Passage Input',1,NULL),(28,1,1,2005,1,'B',1,'Testing',1,NULL),(32,1,1,2005,15,'A',1,'wqedwqqewqwe',1,NULL),(33,1,1,2005,15,'A',1,'sdadasd',1,NULL),(34,1,1,2005,1,'A',1,'1111',1,NULL),(35,1,1,2005,1,'A',1,'sdfsdfsdf',1,NULL),(36,1,1,2005,1,'A',1,'aaaa aaa',1,NULL),(37,1,1,2005,22,'A',22,'dasd',1,NULL),(38,1,1,2005,3242,'A',23,'324324dsf ',1,NULL),(39,1,1,2005,2,'A',2,'weqwqeq',1,NULL),(40,1,1,2005,1,'A',1,'adwadasdsad fd sf',1,NULL),(41,1,1,2005,2,'A',3,'TESTING FORM',1,NULL),(42,1,1,2005,4,'A',4,'frdggfd',1,NULL),(50,7,9,2011,5,'B',6,'ghjhgfjghfjghjghfjgfhjgfhjhgfjhgfj',1,NULL),(51,1,1,2005,1,'A',1,'sadsad',1,NULL),(52,3,10,2012,1,'A',1,'testing',1,NULL),(53,1,1,2005,1,'A',1,'sfsfsdfsdfsf',1,NULL),(54,1,1,2014,1,'A',1,'thbtyntyn',1,NULL),(55,1,1,2014,1,'A',1,'diofjoidjfoij',1,NULL),(56,1,1,2014,1,'A',1,'sduhdsuh',1,NULL),(58,1,1,2014,1,'A',1,'Trying ',1,NULL),(59,1,1,2014,1,'A',1,'TESTING',1,NULL),(60,1,1,2014,1,'A',1,'sdsadasdasdasdasd',1,NULL),(61,1,15,2014,1,'A',1,'Translate me to Spanish please. Please please please!!! ',1,NULL),(62,1,15,2014,1,'B',1,'Translate me to Spanish please. Please please please!!! PASSAGE B?',1,NULL),(63,4,15,2014,1,'A',1,'aaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaa',1,NULL),(64,1,4,2014,2,'A',1,'bbbbbbbbbbbbbbb',1,NULL),(65,1,1,2014,1,'A',1,'TEST',1,NULL),(66,1,1,2014,1,'A',1,'TEST',1,NULL),(67,4,15,2014,1,'A',1,'aaaaaaa',1,NULL),(68,4,15,2014,1,'B',1,'bbbbb',1,NULL),(69,4,7,2014,1,'A',1,'ccccc',1,NULL),(70,4,7,2014,1,'B',1,'ddddddd',1,NULL),(71,4,15,2014,1,'A',2,'aaaaaa',1,NULL),(72,4,15,2014,1,'C',2,'bbbbbb',1,NULL),(73,7,4,2014,1,'A',1,'Here is a new German test made 11/6/14',1,NULL),(74,4,15,2013,1,'A',5,'eeeeee',1,NULL),(75,4,15,2014,1,'C',5,'fffff',1,NULL),(76,4,15,2014,1,'A',5,'gggg',1,NULL),(77,1,5,2013,1,'A',1,'TEST ',1,NULL),(78,4,4,2014,1,'C',3,'Enter New Source Testing ',1,NULL);
/*!40000 ALTER TABLE `texts_sourcetext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_targetinputqueue`
--

DROP TABLE IF EXISTS `texts_targetinputqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_targetinputqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `targetTextNumber` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_targetinputqueue_57ed41d1` (`exam_id`),
  CONSTRAINT `exam_id_refs_id_35780cd1` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_targetinputqueue`
--

LOCK TABLES `texts_targetinputqueue` WRITE;
/*!40000 ALTER TABLE `texts_targetinputqueue` DISABLE KEYS */;
INSERT INTO `texts_targetinputqueue` VALUES (44,29,2),(45,30,1),(46,30,2),(49,32,1),(50,32,2),(51,33,1),(52,33,2),(53,34,1),(54,34,2),(55,35,1),(56,35,2),(57,36,1),(59,37,1),(62,38,2);
/*!40000 ALTER TABLE `texts_targetinputqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_targetreviewqueue`
--

DROP TABLE IF EXISTS `texts_targetreviewqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_targetreviewqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `targetText_id` int(11) NOT NULL,
  `nextReviewer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `targetText_id` (`targetText_id`),
  KEY `texts_targetreviewqueue_57ed41d1` (`exam_id`),
  KEY `texts_targetreviewqueue_1cd4adde` (`nextReviewer_id`),
  CONSTRAINT `exam_id_refs_id_93344dfe` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`),
  CONSTRAINT `nextReviewer_id_refs_id_c1ae0386` FOREIGN KEY (`nextReviewer_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `targetText_id_refs_id_ed290101` FOREIGN KEY (`targetText_id`) REFERENCES `texts_targettext` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_targetreviewqueue`
--

LOCK TABLES `texts_targetreviewqueue` WRITE;
/*!40000 ALTER TABLE `texts_targetreviewqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `texts_targetreviewqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts_targettext`
--

DROP TABLE IF EXISTS `texts_targettext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts_targettext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `language_id` int(11) NOT NULL,
  `g1ErrorScore` smallint(5) unsigned DEFAULT NULL,
  `g2ErrorScore` smallint(5) unsigned DEFAULT NULL,
  `g3ErrorScore` smallint(5) unsigned DEFAULT NULL,
  `g4ErrorScore` smallint(5) unsigned DEFAULT NULL,
  `errorStop` tinyint(1) NOT NULL,
  `notGraded` tinyint(1) NOT NULL,
  `incomplete` tinyint(1) NOT NULL,
  `qualityPoints` smallint(5) unsigned DEFAULT NULL,
  `passageReviewed` tinyint(1) NOT NULL,
  `pdfURI` varchar(255) NOT NULL,
  `doneGrading` tinyint(1) NOT NULL,
  `importer1_id` int(11) NOT NULL,
  `importer2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_targettext_784efa61` (`language_id`),
  KEY `texts_targettext_ee481db5` (`importer1_id`),
  KEY `texts_targettext_9845a96d` (`importer2_id`),
  CONSTRAINT `importer1_id_refs_id_b9f302a4` FOREIGN KEY (`importer1_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `importer2_id_refs_id_b9f302a4` FOREIGN KEY (`importer2_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `language_id_refs_id_88005ad4` FOREIGN KEY (`language_id`) REFERENCES `texts_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_targettext`
--

LOCK TABLES `texts_targettext` WRITE;
/*!40000 ALTER TABLE `texts_targettext` DISABLE KEYS */;
INSERT INTO `texts_targettext` VALUES (7,'		\r\nLas Palmas de Gran Canaria es una ciudad y municipio español situado en el noreste de la isla de Gran Canaria. La ciudad, la más grande y poblada de Canarias con 382 296 habitantes, es la capital de Gran Canaria y de la provincia de Las Palmas. Además, comparte la capitalidad de la Comunidad Autónoma de Canarias con la ciudad de Santa Cruz de Tenerife.\r\n\r\nLa ciudad fue fundada en 1478, siendo considerada la única capital (de facto) del archipiélago canario hasta el siglo XVII. Es sede de la Delegación del Gobierno de España, de la presidencia del Gobierno de Canarias en períodos legislativos alternos con Santa Cruz de Tenerife, de la Presidencia del Tribunal Superior de Justicia de Canarias, de la Diócesis de Canarias, del Consejo Económico y Social de Canarias, así como otras instituciones de diversa importancia como la Casa África. El Carnaval de Las Palmas de Gran Canaria es uno de los eventos más importantes de Canarias, y goza de una importante proyección nacional e internacional.\r\n\r\nLos municipios colindantes a la ciudad forman un área metropolitana de más de 600.000 habitantes, constituyendo el área metropolitana más grande de Canarias y noveno de España. 6 El municipio tiene una extensión de 100,55 km² (ISTAC, 2003). Su altitud es de 8 metros sobre el nivel del mar (en la parte más meridional). El clima es de escasas precipitaciones, con una temperatura media de unos 22 °C.						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(8,'		\r\nLas Palmas de Gran Canaria es una ciudad y municipio español situado en el noreste de la isla de Gran Canaria. La ciudad, la más grande y poblada de Canarias con 382 296 habitantes, es la capital de Gran Canaria y de la provincia de Las Palmas. Además, comparte la capitalidad de la Comunidad Autónoma de Canarias con la ciudad de Santa Cruz de Tenerife.\r\n\r\nLa ciudad fue fundada en 1478, siendo considerada la única capital (de facto) del archipiélago canario hasta el siglo XVII. Es sede de la Delegación del Gobierno de España, de la presidencia del Gobierno de Canarias en períodos legislativos alternos con Santa Cruz de Tenerife, de la Presidencia del Tribunal Superior de Justicia de Canarias, de la Diócesis de Canarias, del Consejo Económico y Social de Canarias, así como otras instituciones de diversa importancia como la Casa África. El Carnaval de Las Palmas de Gran Canaria es uno de los eventos más importantes de Canarias, y goza de una importante proyección nacional e internacional.\r\n\r\nLos municipios colindantes a la ciudad forman un área metropolitana de más de 600.000 habitantes, constituyendo el área metropolitana más grande de Canarias y noveno de España. 6 El municipio tiene una extensión de 100,55 km² (ISTAC, 2003). Su altitud es de 8 metros sobre el nivel del mar (en la parte más meridional). El clima es de escasas precipitaciones, con una temperatura media de unos 22 °C.						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(9,'		\r\nLas Palmas de Gran Canaria es una ciudad y municipio español situado en el noreste de la isla de Gran Canaria. La ciudad, la más grande y poblada de Canarias con 382 296 habitantes, es la capital de Gran Canaria y de la provincia de Las Palmas. Además, comparte la capitalidad de la Comunidad Autónoma de Canarias con la ciudad de Santa Cruz de Tenerife.\r\n\r\nLa ciudad fue fundada en 1478, siendo considerada la única capital (de facto) del archipiélago canario hasta el siglo XVII. Es sede de la Delegación del Gobierno de España, de la presidencia del Gobierno de Canarias en períodos legislativos alternos con Santa Cruz de Tenerife, de la Presidencia del Tribunal Superior de Justicia de Canarias, de la Diócesis de Canarias, del Consejo Económico y Social de Canarias, así como otras instituciones de diversa importancia como la Casa África. El Carnaval de Las Palmas de Gran Canaria es uno de los eventos más importantes de Canarias, y goza de una importante proyección nacional e internacional.\r\n\r\nLos municipios colindantes a la ciudad forman un área metropolitana de más de 600.000 habitantes, constituyendo el área metropolitana más grande de Canarias y noveno de España. 6 El municipio tiene una extensión de 100,55 km² (ISTAC, 2003). Su altitud es de 8 metros sobre el nivel del mar (en la parte más meridional). El clima es de escasas precipitaciones, con una temperatura media de unos 22 °C.								\r\n						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(10,'		\r\nLas Palmas de Gran Canaria es una ciudad y municipio español situado en el noreste de la isla de Gran Canaria. La ciudad, la más grande y poblada de Canarias con 382 296 habitantes, es la capital de Gran Canaria y de la provincia de Las Palmas. Además, comparte la capitalidad de la Comunidad Autónoma de Canarias con la ciudad de Santa Cruz de Tenerife.\r\n\r\nLa ciudad fue fundada en 1478, siendo considerada la única capital (de facto) del archipiélago canario hasta el siglo XVII. Es sede de la Delegación del Gobierno de España, de la presidencia del Gobierno de Canarias en períodos legislativos alternos con Santa Cruz de Tenerife, de la Presidencia del Tribunal Superior de Justicia de Canarias, de la Diócesis de Canarias, del Consejo Económico y Social de Canarias, así como otras instituciones de diversa importancia como la Casa África. El Carnaval de Las Palmas de Gran Canaria es uno de los eventos más importantes de Canarias, y goza de una importante proyección nacional e internacional.\r\n\r\nLos municipios colindantes a la ciudad forman un área metropolitana de más de 600.000 habitantes, constituyendo el área metropolitana más grande de Canarias y noveno de España. 6 El municipio tiene una extensión de 100,55 km² (ISTAC, 2003). Su altitud es de 8 metros sobre el nivel del mar (en la parte más meridional). El clima es de escasas precipitaciones, con una temperatura media de unos 22 °C.						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',1,1,1),(11,'Las Palmas de Gran Canaria is a city in the island of Gran Canaria, in Spain. It is the co-capital (jointly with Santa Cruz) and the most populous city in the autonomous community of the Canary Islands, and the ninth largest city in Spain, with a population of 383,308 in 2010. Nearly half (45.9%) of the people of the island and 18.35% of all inhabitants of the Canary Islands live in this city. It is also the fifth most populous urban area in Spain with a population exceeding 700,000 and (depending on sources) ninth or tenth most populous metropolitan area in Spain with a population of between 625,000 and 750,000. Las Palmas is the largest city of the European Union lying outside the European Continent. It is located in the northeast part of the Spanish island of Gran Canaria, about 150 kilometres (93 miles) off the northwestern coast of Africa[6] within the Atlantic Ocean.		\r\n						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(12,'Las Palmas de Gran Canaria es una ciudad en la isla de Gran Canaria, en España. Es el co-capitales (conjuntamente con Santa Cruz) y la ciudad más populosa de la comunidad autónoma de las Islas Canarias y la novena ciudad más grande de España, con una población de 383.308 en 2010. Casi la mitad (45,9%) de la la gente de la isla y 18,35% de todos los habitantes de las Islas Canarias viven en esta ciudad. También es la quinta área urbana más poblada de España con una población superior a 700 000 y (dependiendo de las fuentes) novena o décima zona metropolitana más poblada de España con una población de entre 625.000 y 750.000. Las Palmas es la ciudad más grande de la Unión Europea que están fuera del continente europeo. Se encuentra ubicado en la parte noreste de la isla española de Gran Canaria, a unos 150 kilómetros (93 millas) de la costa noroeste de África en el Océano Atlántico.		\r\n						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(13,'Las Palmas de Gran Canaria es una ciudad en la isla de Gran Canaria, en España. Es el co-capitales (conjuntamente con Santa Cruz) y la ciudad más populosa de la comunidad autónoma de las Islas Canarias y la novena ciudad más grande de España, con una población de 383.308 en 2010. Casi la mitad (45,9%) de la la gente de la isla y 18,35% de todos los habitantes de las Islas Canarias viven en esta ciudad. También es la quinta área urbana más poblada de España con una población superior a 700 000 y (dependiendo de las fuentes) novena o décima zona metropolitana más poblada de España con una población de entre 625.000 y 750.000. Las Palmas es la ciudad más grande de la Unión Europea que están fuera del continente europeo. Se encuentra ubicado en la parte noreste de la isla española de Gran Canaria, a unos 150 kilómetros (93 millas) de la costa noroeste de África en el Océano Atlántico.						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(20,'		\r\nHola, yo jflasjfads',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(21,'		\r\n						ello fajlfjaljfl hello hello ehllo',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(22,'		\r\n				Hola, hoy es mi cumpleaños. Yo soy veintedos anos. ',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(23,'		\r\n						Aqui es examination a examinen los estudientes para español. ',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(24,'		\r\n						',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(25,'		\r\n						gdafafas',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(26,'		\r\n						This ajkfljdasjfdasl trans',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(27,'		\r\n						Another translation ',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(28,'		\r\n						fhdahfldashfd fjdasklhfdas lhofadhsfj',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(29,'		\r\n						HFdjff fjaisoflj sa fjdlkasjfj',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(30,'		\r\n						fafafasf',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(31,'		\r\n						fasgsaghagsafdfas',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(32,'		\r\n						This is the target text for a test target test.',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,1),(34,'		\r\n	This is a bird		',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(35,'		\r\n		hk;ughjfcgkjlgjklhyoi;				',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(36,'		\r\n						',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(37,'		\r\n					tryrtyrtyrtyryrtytryrtyrty',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(38,'		\r\n			aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa			',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(39,'		\r\nbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb			',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(40,'This is only a text by Zach		\r\n						',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(41,'This is a test input		\r\n						',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(46,'jdlahgjkldjflkdasjlkfjdajda',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',1,1,NULL),(47,'fdsagadgafas',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',1,1,NULL),(48,'fjajlgjaljglaf',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',1,1,NULL),(49,'fjidajsijfgldsajlfjasj',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(50,'Ella es el palabras un Zach',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(51,'Ella es a palabras input',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(52,'graded graded gradedgradedgradedgradedgradedgradedgradedgradedgradedgradedgradedgraded graded gradedv graded gradedgraded',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(53,'graded2 graded2 graded2 graded2 graded2 graded2 graded2 graded2 graded2 graded2 graded2 graded2 graded2 graded2 graded2 ',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(54,'gragfadga',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(55,'This is only a text by Zach',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(56,'adadssadasd',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(57,'This is an english to spanish new source test after removing redis from the project',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL);
/*!40000 ALTER TABLE `texts_targettext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofile_languagepair`
--

DROP TABLE IF EXISTS `userprofile_languagepair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userprofile_languagepair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`language_id`),
  KEY `userprofile_languagepair_6340c63c` (`user_id`),
  KEY `userprofile_languagepair_784efa61` (`language_id`),
  CONSTRAINT `language_id_refs_id_e4b69511` FOREIGN KEY (`language_id`) REFERENCES `texts_language` (`id`),
  CONSTRAINT `user_id_refs_id_fa73c731` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile_languagepair`
--

LOCK TABLES `userprofile_languagepair` WRITE;
/*!40000 ALTER TABLE `userprofile_languagepair` DISABLE KEYS */;
INSERT INTO `userprofile_languagepair` VALUES (1,1,4),(2,1,15),(15,3,4),(7,4,4),(5,4,7),(10,4,15),(11,14,4),(12,14,15);
/*!40000 ALTER TABLE `userprofile_languagepair` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-22 11:49:59
