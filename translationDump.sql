-- MySQL dump 10.14  Distrib 5.5.36-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: translation
-- ------------------------------------------------------
-- Server version	5.5.36-MariaDB

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add language pair',7,'add_languagepair'),(20,'Can change language pair',7,'change_languagepair'),(21,'Can delete language pair',7,'delete_languagepair'),(22,'Can add language',8,'add_language'),(23,'Can change language',8,'change_language'),(24,'Can delete language',8,'delete_language'),(25,'Can add grader',9,'add_grader'),(26,'Can change grader',9,'change_grader'),(27,'Can delete grader',9,'delete_grader'),(28,'Can add error code',10,'add_errorcode'),(29,'Can change error code',10,'change_errorcode'),(30,'Can delete error code',10,'delete_errorcode'),(31,'Can add error',11,'add_error'),(32,'Can change error',11,'change_error'),(33,'Can delete error',11,'delete_error'),(34,'Can add source text',12,'add_sourcetext'),(35,'Can change source text',12,'change_sourcetext'),(36,'Can delete source text',12,'delete_sourcetext'),(37,'Can add source review queue',13,'add_sourcereviewqueue'),(38,'Can change source review queue',13,'change_sourcereviewqueue'),(39,'Can delete source review queue',13,'delete_sourcereviewqueue'),(40,'Can add source discrepancy queue',14,'add_sourcediscrepancyqueue'),(41,'Can change source discrepancy queue',14,'change_sourcediscrepancyqueue'),(42,'Can delete source discrepancy queue',14,'delete_sourcediscrepancyqueue'),(43,'Can add target text',15,'add_targettext'),(44,'Can change target text',15,'change_targettext'),(45,'Can delete target text',15,'delete_targettext'),(46,'Can add exam',16,'add_exam'),(47,'Can change exam',16,'change_exam'),(48,'Can delete exam',16,'delete_exam'),(49,'Can add grader queue',17,'add_graderqueue'),(50,'Can change grader queue',17,'change_graderqueue'),(51,'Can delete grader queue',17,'delete_graderqueue'),(52,'Can add target review queue',18,'add_targetreviewqueue'),(53,'Can change target review queue',18,'change_targetreviewqueue'),(54,'Can delete target review queue',18,'delete_targetreviewqueue'),(55,'Can add target input queue',19,'add_targetinputqueue'),(56,'Can change target input queue',19,'change_targetinputqueue'),(57,'Can delete target input queue',19,'delete_targetinputqueue'),(58,'Can add discrepancy',20,'add_discrepancy'),(59,'Can change discrepancy',20,'change_discrepancy'),(60,'Can delete discrepancy',20,'delete_discrepancy'),(61,'Can add error json',21,'add_errorjson'),(62,'Can change error json',21,'change_errorjson'),(63,'Can delete error json',21,'delete_errorjson'),(64,'Can add record',22,'add_record'),(65,'Can change record',22,'change_record'),(66,'Can delete record',22,'delete_record');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$XH7Pan8Sww5J$jO4a71awUP43eLyAYS1d0hT0b25rczfaKrBioFyTLsg=','2014-09-09 16:17:57',1,'root','','','',1,1,'2014-05-05 03:39:37'),(2,'pbkdf2_sha256$12000$M0opLuA7K2Zr$PpqSQmwUmTvIvIZnH7IHUQsO8fA5SgN4BjLepPwCz1k=','2014-09-05 13:16:53',0,'user1','','','',0,1,'2014-05-05 03:44:05'),(3,'pbkdf2_sha256$12000$kQslrPetFQf7$AIPPKrBfXuEdrwTMhuJN+nY89ls8YZd6JvgqutrdlM8=','2014-09-05 13:50:29',1,'ruttan','','','',1,1,'2014-05-15 17:19:16'),(4,'sha1$default$819c5a17aae6a19bd326dc944d7fffcd20271084','2014-09-02 13:41:50',0,'Geoff','Geoff','Koby','agruttan@gmail.com',0,1,'2014-05-16 14:21:08'),(5,'pbkdf2_sha256$12000$3rCPG7PF6M3I$cEKXeaO+r+0Xjvc3Mf4StP/0Fo+eyoQ5hR+DsghETk4=','2014-09-09 15:53:20',0,'Arden','Arden','Ruttan','aruttan@kent.edu',0,1,'2014-05-16 14:21:46');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-05-05 03:44:05',1,4,'2','user1',1,''),(2,'2014-05-05 03:44:11',1,4,'2','user1',2,'No fields changed.'),(3,'2014-05-05 03:44:29',1,9,'1','123 - Smith',1,''),(4,'2014-05-05 03:44:48',1,7,'1','root --- eng',1,''),(5,'2014-05-05 03:44:55',1,7,'2','root --- spa',1,''),(6,'2014-05-05 03:45:03',1,7,'3','user1 --- eng',1,''),(7,'2014-05-05 03:45:10',1,7,'4','user1 --- spa',1,''),(8,'2014-05-05 09:57:41',1,4,'2','user1',2,'Changed password.'),(9,'2014-05-05 12:50:32',1,12,'1','eng_spa_2010_1_B_1',2,'Changed passageLetter and importer2.'),(10,'2014-05-05 15:02:36',1,8,'16','kor',1,''),(11,'2014-05-15 17:19:16',1,4,'3','ruttan',1,''),(12,'2014-05-15 17:23:44',1,4,'3','ruttan',2,'Changed is_staff and is_superuser.'),(13,'2014-05-16 14:21:09',3,4,'4','Geoff',1,''),(14,'2014-05-16 14:21:46',3,4,'5','Arden',1,''),(15,'2014-05-16 14:23:22',3,4,'5','Arden',2,'Changed first_name, last_name and email.'),(16,'2014-05-16 14:24:34',3,4,'4','Geoff',2,'Changed first_name, last_name and email.'),(17,'2014-05-16 14:24:48',3,4,'4','Geoff',2,'No fields changed.'),(18,'2014-05-16 14:31:13',3,12,'3','eng_ger_2010_11235_A_1',1,''),(19,'2014-05-16 14:34:04',3,9,'2','268 - ruttan',1,''),(20,'2014-05-16 14:34:14',3,9,'2','268 - ruttan',2,'No fields changed.'),(21,'2014-05-16 14:35:37',3,9,'3','269 - Koby',1,''),(22,'2014-05-16 15:29:20',3,7,'5','Geoff --- ger',1,''),(23,'2014-05-16 15:30:07',3,7,'6','Arden --- ger',1,''),(24,'2014-05-16 15:30:11',3,7,'6','Arden --- ger',2,'No fields changed.'),(25,'2014-05-16 15:30:38',3,7,'7','Geoff --- eng',1,''),(26,'2014-05-16 15:31:01',3,7,'8','Arden --- eng',1,''),(27,'2014-05-16 15:52:13',3,7,'9','Arden --- spa',1,''),(28,'2014-05-16 15:52:30',3,7,'10','Geoff --- spa',1,''),(29,'2014-05-16 15:52:54',3,7,'11','Geoff --- spa',1,''),(30,'2014-05-17 20:34:11',3,15,'16','TARGET TEXT 16 0',1,''),(31,'2014-05-17 20:43:02',3,16,'2','EXAM # 13331',3,''),(32,'2014-05-17 20:48:12',3,12,'5','eng_ger_2014_1_A_1',1,''),(33,'2014-05-17 20:49:30',3,12,'6','eng_ger_2014_2_B_1',1,''),(34,'2014-05-17 20:51:09',3,15,'17','TARGET TEXT 17 0',1,''),(35,'2014-05-17 20:52:04',3,15,'18','TARGET TEXT 18 0',1,''),(36,'2014-05-17 20:54:30',3,16,'8','EXAM # 16621',1,''),(37,'2014-05-17 20:55:55',3,17,'9','GraderQueue object',1,''),(38,'2014-05-17 20:56:17',3,17,'10','GraderQueue object',1,''),(39,'2014-05-22 20:32:31',1,16,'9','EXAM # 54231',2,'Changed targetText1 and targetText2.');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'language pair','userprofile','languagepair'),(8,'language','texts','language'),(9,'grader','texts','grader'),(10,'error code','texts','errorcode'),(11,'error','texts','error'),(12,'source text','texts','sourcetext'),(13,'source review queue','texts','sourcereviewqueue'),(14,'source discrepancy queue','texts','sourcediscrepancyqueue'),(15,'target text','texts','targettext'),(16,'exam','texts','exam'),(17,'grader queue','texts','graderqueue'),(18,'target review queue','texts','targetreviewqueue'),(19,'target input queue','texts','targetinputqueue'),(20,'discrepancy','texts','discrepancy'),(21,'error json','texts','errorjson'),(22,'record','records','record');
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
INSERT INTO `django_session` VALUES ('0u4skc852dbopzrjj5o0t9kr8ecrvxwj','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-05 15:23:58'),('0zwnlarkk3dsc5f91uh7ls6ed5287mch','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-12 18:41:11'),('1414k8sjb8em9wfs24g2foxpg93xxffj','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-11 15:16:17'),('1bj971l7euyojghkzjb2wxly11gf63zo','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-18 16:07:01'),('1hnh07jz1421k7d0urjpylzmrr5qlnep','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-19 13:46:32'),('2kvkeispaj5ij07g5jbtf8adyqpnvejn','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-05-31 20:58:19'),('2odsmkwjszasodxg5zkjbofk65oirr93','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-19 14:16:56'),('2q7lg23fxq944w3oaph7cmt073wkqu5l','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-23 16:17:57'),('2yj53bjc34e679vy7eyaln5yyfcik781','ODJiNGEyYzI1NTY2OWQxNmJkZGNlOGQ0YjljYzNhYjNlYjE3NWQwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-05-19 04:06:48'),('2zgu78h1ywsdbmcebhz1qm48f2lmqmlk','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-08-07 18:11:04'),('4f6fy32fm1zdhyow3pivy40w2jcls9p4','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-28 00:45:41'),('59q4nuk236pqda3sdbqs57c1riyi6ple','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:04:47'),('62qup3p8l1bspavj4p4to88b4cf6kbg3','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-11 15:16:15'),('6e5k3lth1e4majhpjjqltn47cufr1fuz','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-16 14:52:29'),('8cx6egwralk9ypnv2k0ljjylqzcfa0nr','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-22 21:24:40'),('8rtnv35klf1ihdhdl11c6t3wipskkow7','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:33:14'),('ap5uoab7rhwwa0veogw7s6uvibp8btkl','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-03 06:37:08'),('bl8v1dzhjqzafnk28chq4f8dy5fg7tln','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:23:58'),('brttcqyark8ludzld7w7hy7r2abpsp28','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-19 12:11:42'),('db2wvpt8qjkweh1fh8n4sgi09u5ymtyu','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-11 14:40:51'),('dqkyjg35mb0cxuhy5ikoaxruj5rek59m','MjAxMzMwMmYzYjliNzg3OTkzZjA2Mzk5MjY1MTMzODVhOGI1NzNkYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=','2014-09-16 13:41:50'),('esmmw07y2kp8x129svipiv7khghjpck3','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-19 14:17:39'),('gf251le0p1pmngeybpcai6rltd77uqmr','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-12 13:45:47'),('gfwbqfy7txkrs3gxrj46eegxo85fis1c','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-23 16:16:23'),('j3hofw63ykhlkww4ql82b9j5n3lvqlpt','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-16 18:04:11'),('lmrke6fhvxoznm0kbvr6re8feuzx5mz8','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-20 13:25:17'),('lptwarlowrk70aq8ggskau46obh1gpj8','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-06-01 18:49:16'),('ltroinbsudawc8uegf3j4x3ghwbnqin3','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:25:53'),('mhcwt6k7kh4wv1z3v6cphaaptmycvedw','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:08:07'),('mysji8umx390n17of3j5iyfk1z6lsk5b','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-06-13 03:40:02'),('n2h48spk7fqadmcqjnwpa96x8e4rsf5c','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-23 13:14:13'),('noyulmw6dxsd37vu8fxpxgqawcg62blc','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-05-19 03:40:03'),('orvtywg4g6jl15n74qwotc1c2g3p75w9','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-18 16:06:59'),('pfr11deyvez2kvkidu5xtcdk00n64hyt','MjAxMzMwMmYzYjliNzg3OTkzZjA2Mzk5MjY1MTMzODVhOGI1NzNkYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=','2014-06-01 18:48:08'),('q2bd34cf9ubnh9m3dea62ybb08fd4sy4','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-18 16:11:42'),('qnvdt2fyra90yic637cvujpz7drgkrg1','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:56:59'),('r4fvxvb92zz3sqok8dxrh4qwn8qzxnna','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-09 00:43:29'),('r7quk7vb6e0tapmk6aeqoeglrx8sqvw3','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-12 14:00:59'),('rpct5e59w5fwzke4b3jujhrjcu1acfh8','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-09 00:17:53'),('s2f7ed0u9dfv1qsh3dn0sdrpjo7hrs38','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-28 00:45:41'),('sowov8ni439bae5itruu53qhb0woxv0p','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-05-29 17:26:01'),('uq7idanmqkzy95xsnsyrvnq4jajsawd0','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-07-02 18:38:25'),('ve82kfolrd74n7qq77vv8gejj1vd1ged','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-16 15:52:03'),('wfxn7ksly49mg3gfyuqwriy5smzs5mj7','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 13:38:27'),('x091c9dbb8d5mj3fmjrm41ykovjbe84l','ODJiNGEyYzI1NTY2OWQxNmJkZGNlOGQ0YjljYzNhYjNlYjE3NWQwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=','2014-09-19 13:16:53'),('x5aj42op1mjl8b9h98cfcfzhb1yye100','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-08 22:05:26'),('xhappea6qz0o1s1p1h42ok3wk64aykjl','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-12 13:40:33'),('xk5jlb1zxohwic17vswfm4jn80xu5swf','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-11 15:22:40'),('xqxsog3yl0ay14dvoj8haxx79tix1dyf','MDRjN2QxOGY0NTdmYjM0NzRmNzQ3ZDFiZmY2OTJlMDBkOGJiMzA0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=','2014-09-19 13:50:29'),('xx2xu7uxjyicuts6fzvnazxwtff3emza','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-11 15:18:38'),('y3qkbxqqm14ggqj8058dapc4jfyyupjh','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-08 19:57:52'),('y9m6oz4eopzrne7qa3a4fl4c1pwebv3z','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-12 12:54:50'),('yzy2i63ub3zj8qh0rzs74614b5sp59hf','YWNjYmQ1OTU2ZTkzOGJmZjM3ODdjMzY4M2FjYWY4YWRkM2Y4MzMxMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=','2014-09-19 14:11:55'),('z92ebvnr14la4yjeutxmfbirq8umx239','NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==','2014-09-19 14:33:52'),('ztrg5yndis2b9uiajxmsybs9qjlda91z','Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-09-23 13:22:53');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_error`
--

LOCK TABLES `texts_error` WRITE;
/*!40000 ALTER TABLE `texts_error` DISABLE KEYS */;
INSERT INTO `texts_error` VALUES (1,1,'A',1,6,1,'in the gre','other anim','','','1st error','NORMAL_ERROR'),(2,4,'A',1,6,8,'Long ago, in the great ocean','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','','','Comments','NORMAL_ERROR'),(3,4,'A',2,15,16,'nd there multiplied->They lived only rivers','essentially unchanged->It has survived not','','','Fail','DISJUNCT_ERROR'),(4,8,'A',1,8,8,'score','Kerbe','','','Machine translation!','NORMAL_ERROR'),(5,8,'A',2,18,1,'.',' .','','','','NORMAL_ERROR'),(6,8,'A',3,15,8,' great civil war->','ob diese->Jetzt ','','','','DISJUNCT_ERROR'),(7,3,'B',1,8,8,'ncreased, overflowing ',' la Presidencia d','','','They messed up','NORMAL_ERROR'),(8,3,'B',2,13,4,'fruitful banana plantations.\nThis prince was called Coniyara , and being a right that he liked to do good ','Canaria es uno de los eventos más importantes de Canarias,','','','error spelling','NORMAL_ERROR'),(9,3,'B',3,9,8,' and graceful .->undefined','undefined->undefined','','','','DISJUNCT_ERROR'),(10,3,'B',4,19,4,'irrigating','Tribunal','','','','NORMAL_ERROR');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_errorcode`
--

LOCK TABLES `texts_errorcode` WRITE;
/*!40000 ALTER TABLE `texts_errorcode` DISABLE KEYS */;
INSERT INTO `texts_errorcode` VALUES (1,'UNF','Unfinished','Red'),(2,'Ill','Illegible','OrangeRed'),(3,'OTH','Other','Orange'),(4,'MT','Mistranslation into target language','FireBrick'),(5,'MU','Misunderstanding of source text','LightCoral'),(6,'A','Addition','Magenta'),(7,'O','Ommission','Maroon'),(8,'T','Terminology, word choice','MediumVioletRed'),(9,'R','Register','Orchid'),(10,'F','Too freely translated','PaleVioletRed'),(11,'L','Too literal, word-for-word translation','Pink'),(12,'FC','False cognate','Plum'),(13,'IND','Indecision, gave more than one option','Purple'),(14,'I','Inconsistency','Salmon'),(15,'AMB','Ambiguity','Tomato'),(16,'G','Grammar','Blue'),(17,'SY','Syntax(phrase/clause/sentence structure)','LightBlue'),(18,'P','Punctuation','Navy'),(19,'SP','Spelling','Green'),(20,'D','Accents, other diacritical marks','RoyalBlue'),(21,'C','Case(upper/lower)','SpringGreen'),(22,'WF','Word form','YellowGreen'),(23,'U','Usage','Chartreuse'),(24,'ST','Style','Lime');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_errorjson`
--

LOCK TABLES `texts_errorjson` WRITE;
/*!40000 ALTER TABLE `texts_errorjson` DISABLE KEYS */;
INSERT INTO `texts_errorjson` VALUES (1,1,'A','\n							Long ago, in the great ocean that washes the shores of Peru no fish . There corals,\nsponges , jellyfish , snails and <span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: A  Points Deducted: 1 Comments: 1st error\" style=\"background-color: Magenta;\" data-errortype=\"NORMAL_ERROR\">other anim</span>als, but no fish you swam in the blue\nwaters of the ocean. They lived only rivers, lakes and streams of Peru , but they\nwere so few that not fished.\nOne day these fish migrated to the ocean, and there multiplied. Here\'s how it\n￼happened :\n￼I was living in Peru a young prince , beautiful and graceful . It was very powerful and\nhe knew magic arts . Reached a gesture to his hills and mountains aplanasen and\ntransform themselves into green and fertile plains meadows , dipping a reed in a\nriver, and at the same instant the waters increased, overflowing and irrigating the\nfields ; pronounced magical formulas, and when were dried muddy swamps and\nlagoons , the basins were transformed into fruitful banana plantations.\nThis prince was called Coniyara , and being a right that he liked to do good , often\ndisguised as a beggar to mingle with the poor people and learn about their needs\nand desires man. Often accompanied the llama herders who roamed the rugged\ntrails of the Andes. Entered the miserable huts and saw how hard- milled corn\nachieved with dedication on the rocky slopes .\nNobody recognized the prince, disguised as a beggar .\nDwelt in the land that time a princess named Cavillaca , who obstinately refused all\nsuitors presented to him . One day the beautiful princess entered the woods , sat in\nthe shade of a tree and began to weave a multicolored mat . At that moment he\nlanded on one of the branches of the tree a little bird blue plumage. Coniyara was\nPrince , who had taken that aspect easier to explore their domains and neighboring\nlands. Seeing the princess fell in love with her, but he remembered that it was able\nto reject it , as she had many suitors. Then resorted to cunning . He began to warble\nso sweetly with his throat singing bird , the girl pushed aside the fabric to listen ,\nfascinated by the music of that bird.\n						','\n							Long ago, <span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: A  Points Deducted: 1 Comments: 1st error\" style=\"background-color: Magenta;\" data-errortype=\"NORMAL_ERROR\">in the gre</span>at ocean that washes the shores of Peru no fish . There corals,\nsponges , jellyfish , snails and other animals, but no fish you swam in the blue\nwaters of the ocean. They lived only rivers, lakes and streams of Peru , but they\nwere so few that not fished.\nOne day these fish migrated to the ocean, and there multiplied. Here\'s how it\n￼happened :\n￼I was living in Peru a young prince , beautiful and graceful . It was very powerful and\nhe knew magic arts . Reached a gesture to his hills and mountains aplanasen and\ntransform themselves into green and fertile plains meadows , dipping a reed in a\nriver, and at the same instant the waters increased, overflowing and irrigating the\nfields ; pronounced magical formulas, and when were dried muddy swamps and\nlagoons , the basins were transformed into fruitful banana plantations.\nThis prince was called Coniyara , and being a right that he liked to do good , often\ndisguised as a beggar to mingle with the poor people and learn about their needs\nand desires man. Often accompanied the llama herders who roamed the rugged\ntrails of the Andes. Entered the miserable huts and saw how hard- milled corn\nachieved with dedication on the rocky slopes .\nNobody recognized the prince, disguised as a beggar .\nDwelt in the land that time a princess named Cavillaca , who obstinately refused all\nsuitors presented to him . One day the beautiful princess entered the woods , sat in\nthe shade of a tree and began to weave a multicolored mat . At that moment he\nlanded on one of the branches of the tree a little bird blue plumage. Coniyara was\nPrince , who had taken that aspect easier to explore their domains and neighboring\nlands. Seeing the princess fell in love with her, but he remembered that it was able\nto reject it , as she had many suitors. Then resorted to cunning . He began to warble\nso sweetly with his throat singing bird , the girl pushed aside the fabric to listen ,\nfascinated by the music of that bird.\n						'),(2,4,'A','\n									<span data-errortype=\"NORMAL_ERROR\" title=\"Error #: 1   Error Code: A  Points Deducted: 8 Comments: Comments\" style=\"background-color: Magenta;\" data-errorid=\"1\" class=\"rounded\">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</span> Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. <span data-errortype=\"DISJUNCT_ERROR\" title=\"Error #: 2   Error Code: AMB  Points Deducted: 16 Comments: Fail\" style=\"background-color: Tomato;\" data-errorid=\"2\" class=\"rounded\">It has survived not</span> only five centuries, but also the leap into electronic typesetting, remaining <span data-errortype=\"DISJUNCT_ERROR\" title=\"Error #: 2   Error Code: AMB  Points Deducted: 16 Comments: Fail\" style=\"background-color: Tomato;\" data-errorid=\"2\" class=\"rounded\">essentially unchanged</span>. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n \n\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sectio\n						','\n							<span data-errortype=\"NORMAL_ERROR\" title=\"Error #: 1   Error Code: A  Points Deducted: 8 Comments: Comments\" style=\"background-color: Magenta;\" data-errorid=\"1\" class=\"rounded\">Long ago, in the great ocean</span> that washes the shores of Peru no fish . There corals,\nsponges , jellyfish , snails and other animals, but no fish you swam in the blue\nwaters of the ocean. <span data-errortype=\"DISJUNCT_ERROR\" title=\"Error #: 2   Error Code: AMB  Points Deducted: 16 Comments: Fail\" style=\"background-color: Tomato;\" data-errorid=\"2\" class=\"rounded\">They lived only rivers</span>, lakes and streams of Peru , but they\nwere so few that not fished.\nOne day these fish migrated to the ocean, a<span data-errortype=\"DISJUNCT_ERROR\" title=\"Error #: 2   Error Code: AMB  Points Deducted: 16 Comments: Fail\" style=\"background-color: Tomato;\" data-errorid=\"2\" class=\"rounded\">nd there multiplied</span>. Here\'s how it\n￼happened :\n￼I was living in Peru a young prince , beautiful and graceful . It was very powerful and\nhe knew magic arts . Reached a gesture to his hills and mountains aplanasen and\ntransform themselves into green and fertile plains meadows , dipping a reed in a\nriver, and at the same instant the waters increased, overflowing and irrigating the\nfields ; pronounced magical formulas, and when were dried muddy swamps and\nlagoons , the basins were transformed into fruitful banana plantations.\nThis prince was called Coniyara , and being a right that he liked to do good , often\ndisguised as a beggar to mingle with the poor people and learn about their needs\nand desires man. Often accompanied the llama herders who roamed the rugged\ntrails of the Andes. Entered the miserable huts and saw how hard- milled corn\nachieved with dedication on the rocky slopes .\nNobody recognized the prince, disguised as a beggar .\nDwelt in the land that time a princess named Cavillaca , who obstinately refused all\nsuitors presented to him . One day the beautiful princess entered the woods , sat in\nthe shade of a tree and began to weave a multicolored mat . At that moment he\nlanded on one of the branches of the tree a little bird blue plumage. Coniyara was\nPrince , who had taken that aspect easier to explore their domains and neighboring\nlands. Seeing the princess fell in love with her, but he remembered that it was able\nto reject it , as she had many suitors. Then resorted to cunning . He began to warble\nso sweetly with his throat singing bird , the girl pushed aside the fabric to listen ,\nfascinated by the music of that bird.\n						'),(3,8,'B','\n							Aber in einem weiteren Sinne , können wir nicht widmen - wir können nicht weihen - können wir nicht heiligen - diesen Boden . Die tapferen Männer , lebende und tote , die hier kämpften , haben sie geweiht , weit über unsere schlechte Leistung zu addieren oder zu beeinträchtigen. Die Welt wird kleiner Hinweis noch lange daran erinnern, was wir hier sagen, aber es kann nie vergessen, was sie hier taten. Es ist für uns das Leben, und nicht , um hier um die unvollendete Arbeit, die sie , die hier kämpften bisher so edel voran haben gewidmet sein. Es ist eher für uns, hier auf die noch vor uns liegt große Aufgabe gewidmet sein - , dass von diesen Toten geehrt wir erhöhte Hingabe an diese Sache , für die sie das letzte volle Maß der Hingabe gab - , dass wir hier sehr zu beheben , dass diese Toten nicht umsonst gestorben sind - dass diese Nation , unter Gott , müssen eine neue Geburt der Freiheit - und das die Regierung des Volkes , durch das Volk , für das Volk, nicht von der Erde .\n						','\n							But, in a larger sense, we can not dedicate -- we can not consecrate -- we can not hallow -- this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from t<span class=\"rounded\" data-errorid=\"1\" title=\"Error #: 1   Error Code: SP  Points Deducted: 1 Comments: test\" style=\"background-color: Green;\" data-errortype=\"NORMAL_ERROR\">hese honored dead we tak</span>e increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.\n						'),(4,3,'B','\n									\nLas Palmas de Gran Canaria es una ciudad y municipio español situado en el noreste de la isla de Gran Canaria. La ciudad, la más grande y poblada de Canarias con 382 296 habitantes, es la capital de Gran Canaria y de la provincia de Las Palmas. Además, comparte la capitalidad de la Comunidad Autónoma de Canarias con la ciudad de Santa Cruz de Tenerife.\n\nLa ciudad fue fundada en 1478, siendo considerada la única capital (de facto) del archipiélago canario hasta el siglo XVII. Es sede de la Delegación del Gobierno de España, de la presidencia del Gobierno de Canarias en períodos legislativos alternos con Santa Cruz de Tenerife, de<span data-errortype=\"NORMAL_ERROR\" title=\"Error #: 1   Error Code: T  Points Deducted: 8 Comments: They messed up\" style=\"background-color: MediumVioletRed;\" data-errorid=\"1\" class=\"rounded\"> la Presidencia d</span>el <span class=\"rounded\" data-errorid=\"4\" title=\"Error #: 4   Error Code: SP  Points Deducted: 4 Comments: \" style=\"background-color: Green;\" data-errortype=\"NORMAL_ERROR\">Tribunal</span> Superior de Justicia de Canarias, de la Diócesis de Canarias, del Consejo Económico y Social de Canarias, así como otras instituciones de diversa importancia como la Casa África. El Carnaval de Las Palmas de Gran <span data-errortype=\"NORMAL_ERROR\" title=\"Error #: 2   Error Code: IND  Points Deducted: 4 Comments: error spelling\" style=\"background-color: Purple;\" data-errorid=\"2\" class=\"rounded\">Canaria es uno de los eventos más importantes de Canarias,</span> y goza de una importante proyección nacional e internacional.\n\nLos municipios colindantes a la ciudad forman un área metropolitana de más de 600.000 habitantes, constituyendo el área metropolitana más grande de Canarias y noveno de España. 6 El municipio tiene una extensión de 100,55 km² (ISTAC, 2003). Su altitud es de 8 metros sobre el nivel del mar (en la parte más meridional). El clima es de escasas precipitaciones, con una temperatura media de unos 22 °C.						\n						','\n							Long ago, in the great ocean that washes the shores of Peru no fish . There corals,\nsponges , jellyfish , snails and other animals, but no fish you swam in the blue\nwaters of the ocean. They lived only rivers, lakes and streams of Peru , but they\nwere so few that not fished.\nOne day these fish migrated to the ocean, and there multiplied. Here\'s how it\n￼happened :\n￼I was living in Peru a young prince , beautiful<span class=\"rounded\" data-errorid=\"3\" title=\"Error #: 3   Error Code: R  Points Deducted: 8 Comments: \" style=\"background-color: Orchid;\" data-errortype=\"DISJUNCT_ERROR\"> and graceful .</span> It was very powerful and\nhe knew magic arts . Reached a gesture to his hills and mountains aplanasen and\ntransform themselves into green and fertile plains meadows , dipping a reed in a\nriver, and at the same instant the waters i<span data-errortype=\"NORMAL_ERROR\" title=\"Error #: 1   Error Code: T  Points Deducted: 8 Comments: They messed up\" style=\"background-color: MediumVioletRed;\" data-errorid=\"1\" class=\"rounded\">ncreased, overflowing </span>and <span class=\"rounded\" data-errorid=\"4\" title=\"Error #: 4   Error Code: SP  Points Deducted: 4 Comments: \" style=\"background-color: Green;\" data-errortype=\"NORMAL_ERROR\">irrigating</span> the\nfields ; pronounced magical formulas, and when were dried muddy swamps and\nlagoons , the basins were transformed into <span data-errortype=\"NORMAL_ERROR\" title=\"Error #: 2   Error Code: IND  Points Deducted: 4 Comments: error spelling\" style=\"background-color: Purple;\" data-errorid=\"2\" class=\"rounded\">fruitful banana plantations.\nThis prince was called Coniyara , and being a right that he liked to do good </span>, often\ndisguised as a beggar to mingle with the poor people and learn about their needs\nand desires man. Often accompanied the llama herders who roamed the rugged\ntrails of the Andes. Entered the miserable huts and saw how hard- milled corn\nachieved with dedication on the rocky slopes .\nNobody recognized the prince, disguised as a beggar .\nDwelt in the land that time a princess named Cavillaca , who obstinately refused all\nsuitors presented to him . One day the beautiful princess entered the woods , sat in\nthe shade of a tree and began to weave a multicolored mat . At that moment he\nlanded on one of the branches of the tree a little bird blue plumage. Coniyara was\nPrince , who had taken that aspect easier to explore their domains and neighboring\nlands. Seeing the princess fell in love with her, but he remembered that it was able\nto reject it , as she had many suitors. Then resorted to cunning . He began to warble\nso sweetly with his throat singing bird , the girl pushed aside the fabric to listen ,\nfascinated by the music of that bird.\n						');
/*!40000 ALTER TABLE `texts_errorjson` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_exam`
--

LOCK TABLES `texts_exam` WRITE;
/*!40000 ALTER TABLE `texts_exam` DISABLE KEYS */;
INSERT INTO `texts_exam` VALUES (1,'11111','B',0,0,123,123,123,123,1,1,1,2,4,15),(3,'12346','B',0,0,123,123,123,123,1,1,9,10,4,15),(4,'12347','B',0,0,123,123,123,123,1,1,5,6,4,15),(5,'12348','B',0,0,123,123,123,123,1,1,13,11,4,15),(6,'11234','B',0,0,123,123,123,123,2,2,12,19,4,15),(7,'1','B',0,0,123,123,123,123,4,4,15,14,15,4),(8,'16621','B',0,0,269,268,269,269,5,6,17,18,4,7),(9,'54231','B',0,0,123,123,123,123,1,1,1,1,1,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_graderqueue`
--

LOCK TABLES `texts_graderqueue` WRITE;
/*!40000 ALTER TABLE `texts_graderqueue` DISABLE KEYS */;
INSERT INTO `texts_graderqueue` VALUES (1,1,'A'),(2,1,'B'),(7,7,'A'),(8,7,'B'),(9,8,'A'),(10,8,'B'),(11,3,'B');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_sourcereviewqueue`
--

LOCK TABLES `texts_sourcereviewqueue` WRITE;
/*!40000 ALTER TABLE `texts_sourcereviewqueue` DISABLE KEYS */;
INSERT INTO `texts_sourcereviewqueue` VALUES (1,1),(3,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_sourcetext`
--

LOCK TABLES `texts_sourcetext` WRITE;
/*!40000 ALTER TABLE `texts_sourcetext` DISABLE KEYS */;
INSERT INTO `texts_sourcetext` VALUES (1,4,15,2010,1,'B',1,'Long ago, in the great ocean that washes the shores of Peru no fish . There corals,\r\nsponges , jellyfish , snails and other animals, but no fish you swam in the blue\r\nwaters of the ocean. They lived only rivers, lakes and streams of Peru , but they\r\nwere so few that not fished.\r\nOne day these fish migrated to the ocean, and there multiplied. Here\'s how it\r\n￼happened :\r\n￼I was living in Peru a young prince , beautiful and graceful . It was very powerful and\r\nhe knew magic arts . Reached a gesture to his hills and mountains aplanasen and\r\ntransform themselves into green and fertile plains meadows , dipping a reed in a\r\nriver, and at the same instant the waters increased, overflowing and irrigating the\r\nfields ; pronounced magical formulas, and when were dried muddy swamps and\r\nlagoons , the basins were transformed into fruitful banana plantations.\r\nThis prince was called Coniyara , and being a right that he liked to do good , often\r\ndisguised as a beggar to mingle with the poor people and learn about their needs\r\nand desires man. Often accompanied the llama herders who roamed the rugged\r\ntrails of the Andes. Entered the miserable huts and saw how hard- milled corn\r\nachieved with dedication on the rocky slopes .\r\nNobody recognized the prince, disguised as a beggar .\r\nDwelt in the land that time a princess named Cavillaca , who obstinately refused all\r\nsuitors presented to him . One day the beautiful princess entered the woods , sat in\r\nthe shade of a tree and began to weave a multicolored mat . At that moment he\r\nlanded on one of the branches of the tree a little bird blue plumage. Coniyara was\r\nPrince , who had taken that aspect easier to explore their domains and neighboring\r\nlands. Seeing the princess fell in love with her, but he remembered that it was able\r\nto reject it , as she had many suitors. Then resorted to cunning . He began to warble\r\nso sweetly with his throat singing bird , the girl pushed aside the fabric to listen ,\r\nfascinated by the music of that bird.',1,2),(2,4,15,2005,1,'A',1,'Las Palmas de Gran Canaria is a city in the island of Gran Canaria, in Spain. It is the co-capital (jointly with Santa Cruz) and the most populous city in the autonomous community of the Canary Islands, and the ninth largest city in Spain, with a population of 383,308 in 2010. Nearly half (45.9%) of the people of the island and 18.35% of all inhabitants of the Canary Islands live in this city. It is also the fifth most populous urban area in Spain with a population exceeding 700,000 and (depending on sources) ninth or tenth most populous metropolitan area in Spain with a population of between 625,000 and 750,000. Las Palmas is the largest city of the European Union lying outside the European Continent. It is located in the northeast part of the Spanish island of Gran Canaria, about 150 kilometres (93 miles) off the northwestern coast of Africa[6] within the Atlantic Ocean.',1,5),(3,4,7,2010,11235,'A',1,'Las Palmas de Gran Canaria is a city in the island of Gran Canaria, in Spain. It is the co-capital (jointly with Santa Cruz) and the most populous city in the autonomous community of the Canary Islands, and the ninth largest city in Spain, with a population of 383,308 in 2010. Nearly half (45.9%) of the people of the island and 18.35% of all inhabitants of the Canary Islands live in this city. It is also the fifth most populous urban area in Spain with a population exceeding 700,000 and (depending on sources) ninth or tenth most populous metropolitan area in Spain with a population of between 625,000 and 750,000. Las Palmas is the largest city of the European Union lying outside the European Continent. It is located in the northeast part of the Spanish island of Gran Canaria, about 150 kilometres (93 miles) off the northwestern coast of Africa within the Atlantic Ocean.',3,4),(4,15,4,2014,1,'A',1,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,2),(5,4,7,2014,1,'A',1,' Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.\r\n\r\nNow we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.',5,4),(6,4,7,2014,2,'B',1,'But, in a larger sense, we can not dedicate -- we can not consecrate -- we can not hallow -- this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.',5,4),(7,4,15,2005,9989,'A',1,'sample text added through Enter New Source page of website',2,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_targetinputqueue`
--

LOCK TABLES `texts_targetinputqueue` WRITE;
/*!40000 ALTER TABLE `texts_targetinputqueue` DISABLE KEYS */;
INSERT INTO `texts_targetinputqueue` VALUES (15,9,1),(16,9,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_targetreviewqueue`
--

LOCK TABLES `texts_targetreviewqueue` WRITE;
/*!40000 ALTER TABLE `texts_targetreviewqueue` DISABLE KEYS */;
INSERT INTO `texts_targetreviewqueue` VALUES (7,3,7,NULL),(8,3,8,NULL),(9,3,9,NULL),(11,5,11,NULL),(12,6,12,NULL),(13,5,13,NULL),(14,6,19,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts_targettext`
--

LOCK TABLES `texts_targettext` WRITE;
/*!40000 ALTER TABLE `texts_targettext` DISABLE KEYS */;
INSERT INTO `texts_targettext` VALUES (1,'Long ago, in the great ocean that washes the shores of Peru no fish . There corals,\r\nsponges , jellyfish , snails and other animals, but no fish you swam in the blue\r\nwaters of the ocean. They lived only rivers, lakes and streams of Peru , but they\r\nwere so few that not fished.\r\nOne day these fish migrated to the ocean, and there multiplied. Here\'s how it\r\n￼happened :\r\n￼I was living in Peru a young prince , beautiful and graceful . It was very powerful and\r\nhe knew magic arts . Reached a gesture to his hills and mountains aplanasen and\r\ntransform themselves into green and fertile plains meadows , dipping a reed in a\r\nriver, and at the same instant the waters increased, overflowing and irrigating the\r\nfields ; pronounced magical formulas, and when were dried muddy swamps and\r\nlagoons , the basins were transformed into fruitful banana plantations.\r\nThis prince was called Coniyara , and being a right that he liked to do good , often\r\ndisguised as a beggar to mingle with the poor people and learn about their needs\r\nand desires man. Often accompanied the llama herders who roamed the rugged\r\ntrails of the Andes. Entered the miserable huts and saw how hard- milled corn\r\nachieved with dedication on the rocky slopes .\r\nNobody recognized the prince, disguised as a beggar .\r\nDwelt in the land that time a princess named Cavillaca , who obstinately refused all\r\nsuitors presented to him . One day the beautiful princess entered the woods , sat in\r\nthe shade of a tree and began to weave a multicolored mat . At that moment he\r\nlanded on one of the branches of the tree a little bird blue plumage. Coniyara was\r\nPrince , who had taken that aspect easier to explore their domains and neighboring\r\nlands. Seeing the princess fell in love with her, but he remembered that it was able\r\nto reject it , as she had many suitors. Then resorted to cunning . He began to warble\r\nso sweetly with his throat singing bird , the girl pushed aside the fabric to listen ,\r\nfascinated by the music of that bird.',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',1,1,2),(2,'Long ago, in the great ocean that washes the shores of Peru no fish . There corals,\r\nsponges , jellyfish , snails and other animals, but no fish you swam in the blue\r\nwaters of the ocean. They lived only rivers, lakes and streams of Peru , but they\r\nwere so few that not fished.\r\nOne day these fish migrated to the ocean, and there multiplied. Here\'s how it\r\n￼happened :\r\n￼I was living in Peru a young prince , beautiful and graceful . It was very powerful and\r\nhe knew magic arts . Reached a gesture to his hills and mountains aplanasen and\r\ntransform themselves into green and fertile plains meadows , dipping a reed in a\r\nriver, and at the same instant the waters increased, overflowing and irrigating the\r\nfields ; pronounced magical formulas, and when were dried muddy swamps and\r\nlagoons , the basins were transformed into fruitful banana plantations.\r\nThis prince was called Coniyara , and being a right that he liked to do good , often\r\ndisguised as a beggar to mingle with the poor people and learn about their needs\r\nand desires man. Often accompanied the llama herders who roamed the rugged\r\ntrails of the Andes. Entered the miserable huts and saw how hard- milled corn\r\nachieved with dedication on the rocky slopes .\r\nNobody recognized the prince, disguised as a beggar .\r\nDwelt in the land that time a princess named Cavillaca , who obstinately refused all\r\nsuitors presented to him . One day the beautiful princess entered the woods , sat in\r\nthe shade of a tree and began to weave a multicolored mat . At that moment he\r\nlanded on one of the branches of the tree a little bird blue plumage. Coniyara was\r\nPrince , who had taken that aspect easier to explore their domains and neighboring\r\nlands. Seeing the princess fell in love with her, but he remembered that it was able\r\nto reject it , as she had many suitors. Then resorted to cunning . He began to warble\r\nso sweetly with his throat singing bird , the girl pushed aside the fabric to listen ,\r\nfascinated by the music of that bird.',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',1,1,2),(3,'Long ago, in the great ocean that washes the shores of Peru no fish . There corals,\r\nsponges , jellyfish , snails and other animals, but no fish you swam in the blue\r\nwaters of the ocean. They lived only rivers, lakes and streams of Peru , but they\r\nwere so few that not fished.\r\nOne day these fish migrated to the ocean, and there multiplied. Here\'s how it\r\n￼happened :\r\n￼I was living in Peru a young prince , beautiful and graceful . It was very powerful and\r\nhe knew magic arts . Reached a gesture to his hills and mountains aplanasen and\r\ntransform themselves into green and fertile plains meadows , dipping a reed in a\r\nriver, and at the same instant the waters increased, overflowing and irrigating the\r\nfields ; pronounced magical formulas, and when were dried muddy swamps and\r\nlagoons , the basins were transformed into fruitful banana plantations.\r\nThis prince was called Coniyara , and being a right that he liked to do good , often\r\ndisguised as a beggar to mingle with the poor people and learn about their needs\r\nand desires man. Often accompanied the llama herders who roamed the rugged\r\ntrails of the Andes. Entered the miserable huts and saw how hard- milled corn\r\nachieved with dedication on the rocky slopes .\r\nNobody recognized the prince, disguised as a beggar .\r\nDwelt in the land that time a princess named Cavillaca , who obstinately refused all\r\nsuitors presented to him . One day the beautiful princess entered the woods , sat in\r\nthe shade of a tree and began to weave a multicolored mat . At that moment he\r\nlanded on one of the branches of the tree a little bird blue plumage. Coniyara was\r\nPrince , who had taken that aspect easier to explore their domains and neighboring\r\nlands. Seeing the princess fell in love with her, but he remembered that it was able\r\nto reject it , as she had many suitors. Then resorted to cunning . He began to warble\r\nso sweetly with his throat singing bird , the girl pushed aside the fabric to listen ,\r\nfascinated by the music of that bird.',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',1,1,2),(4,'		\r\n	Long ago, in the great ocean that washes the shores of Peru no fish . There corals,\r\nsponges , jellyfish , snails and other animals, but no fish you swam in the blue\r\nwaters of the ocean. They lived only rivers, lakes and streams of Peru , but they\r\nwere so few that not fished.\r\nOne day these fish migrated to the ocean, and there multiplied. Here\'s how it\r\n￼happened :\r\n￼I was living in Peru a young prince , beautiful and graceful . It was very powerful and\r\nhe knew magic arts . Reached a gesture to his hills and mountains aplanasen and\r\ntransform themselves into green and fertile plains meadows , dipping a reed in a\r\nriver, and at the same instant the waters increased, overflowing and irrigating the\r\nfields ; pronounced magical formulas, and when were dried muddy swamps and\r\nlagoons , the basins were transformed into fruitful banana plantations.\r\nThis prince was called Coniyara , and being a right that he liked to do good , often\r\ndisguised as a beggar to mingle with the poor people and learn about their needs\r\nand desires man. Often accompanied the llama herders who roamed the rugged\r\ntrails of the Andes. Entered the miserable huts and saw how hard- milled corn\r\nachieved with dedication on the rocky slopes .\r\nNobody recognized the prince, disguised as a beggar .\r\nDwelt in the land that time a princess named Cavillaca , who obstinately refused all\r\nsuitors presented to him . One day the beautiful princess entered the woods , sat in\r\nthe shade of a tree and began to weave a multicolored mat . At that moment he\r\nlanded on one of the branches of the tree a little bird blue plumage. Coniyara was\r\nPrince , who had taken that aspect easier to explore their domains and neighboring\r\nlands. Seeing the princess fell in love with her, but he remembered that it was able\r\nto reject it , as she had many suitors. Then resorted to cunning . He began to warble\r\nso sweetly with his throat singing bird , the girl pushed aside the fabric to listen ,\r\nfascinated by the music of that bird.					',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',1,1,2),(5,'		Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n \r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sectio',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',1,1,2),(6,'		\r\n						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n \r\n\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sectio',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',1,1,2),(7,'		\r\nLas Palmas de Gran Canaria es una ciudad y municipio español situado en el noreste de la isla de Gran Canaria. La ciudad, la más grande y poblada de Canarias con 382 296 habitantes, es la capital de Gran Canaria y de la provincia de Las Palmas. Además, comparte la capitalidad de la Comunidad Autónoma de Canarias con la ciudad de Santa Cruz de Tenerife.\r\n\r\nLa ciudad fue fundada en 1478, siendo considerada la única capital (de facto) del archipiélago canario hasta el siglo XVII. Es sede de la Delegación del Gobierno de España, de la presidencia del Gobierno de Canarias en períodos legislativos alternos con Santa Cruz de Tenerife, de la Presidencia del Tribunal Superior de Justicia de Canarias, de la Diócesis de Canarias, del Consejo Económico y Social de Canarias, así como otras instituciones de diversa importancia como la Casa África. El Carnaval de Las Palmas de Gran Canaria es uno de los eventos más importantes de Canarias, y goza de una importante proyección nacional e internacional.\r\n\r\nLos municipios colindantes a la ciudad forman un área metropolitana de más de 600.000 habitantes, constituyendo el área metropolitana más grande de Canarias y noveno de España. 6 El municipio tiene una extensión de 100,55 km² (ISTAC, 2003). Su altitud es de 8 metros sobre el nivel del mar (en la parte más meridional). El clima es de escasas precipitaciones, con una temperatura media de unos 22 °C.						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(8,'		\r\nLas Palmas de Gran Canaria es una ciudad y municipio español situado en el noreste de la isla de Gran Canaria. La ciudad, la más grande y poblada de Canarias con 382 296 habitantes, es la capital de Gran Canaria y de la provincia de Las Palmas. Además, comparte la capitalidad de la Comunidad Autónoma de Canarias con la ciudad de Santa Cruz de Tenerife.\r\n\r\nLa ciudad fue fundada en 1478, siendo considerada la única capital (de facto) del archipiélago canario hasta el siglo XVII. Es sede de la Delegación del Gobierno de España, de la presidencia del Gobierno de Canarias en períodos legislativos alternos con Santa Cruz de Tenerife, de la Presidencia del Tribunal Superior de Justicia de Canarias, de la Diócesis de Canarias, del Consejo Económico y Social de Canarias, así como otras instituciones de diversa importancia como la Casa África. El Carnaval de Las Palmas de Gran Canaria es uno de los eventos más importantes de Canarias, y goza de una importante proyección nacional e internacional.\r\n\r\nLos municipios colindantes a la ciudad forman un área metropolitana de más de 600.000 habitantes, constituyendo el área metropolitana más grande de Canarias y noveno de España. 6 El municipio tiene una extensión de 100,55 km² (ISTAC, 2003). Su altitud es de 8 metros sobre el nivel del mar (en la parte más meridional). El clima es de escasas precipitaciones, con una temperatura media de unos 22 °C.						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(9,'		\r\nLas Palmas de Gran Canaria es una ciudad y municipio español situado en el noreste de la isla de Gran Canaria. La ciudad, la más grande y poblada de Canarias con 382 296 habitantes, es la capital de Gran Canaria y de la provincia de Las Palmas. Además, comparte la capitalidad de la Comunidad Autónoma de Canarias con la ciudad de Santa Cruz de Tenerife.\r\n\r\nLa ciudad fue fundada en 1478, siendo considerada la única capital (de facto) del archipiélago canario hasta el siglo XVII. Es sede de la Delegación del Gobierno de España, de la presidencia del Gobierno de Canarias en períodos legislativos alternos con Santa Cruz de Tenerife, de la Presidencia del Tribunal Superior de Justicia de Canarias, de la Diócesis de Canarias, del Consejo Económico y Social de Canarias, así como otras instituciones de diversa importancia como la Casa África. El Carnaval de Las Palmas de Gran Canaria es uno de los eventos más importantes de Canarias, y goza de una importante proyección nacional e internacional.\r\n\r\nLos municipios colindantes a la ciudad forman un área metropolitana de más de 600.000 habitantes, constituyendo el área metropolitana más grande de Canarias y noveno de España. 6 El municipio tiene una extensión de 100,55 km² (ISTAC, 2003). Su altitud es de 8 metros sobre el nivel del mar (en la parte más meridional). El clima es de escasas precipitaciones, con una temperatura media de unos 22 °C.								\r\n						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(10,'		\r\nLas Palmas de Gran Canaria es una ciudad y municipio español situado en el noreste de la isla de Gran Canaria. La ciudad, la más grande y poblada de Canarias con 382 296 habitantes, es la capital de Gran Canaria y de la provincia de Las Palmas. Además, comparte la capitalidad de la Comunidad Autónoma de Canarias con la ciudad de Santa Cruz de Tenerife.\r\n\r\nLa ciudad fue fundada en 1478, siendo considerada la única capital (de facto) del archipiélago canario hasta el siglo XVII. Es sede de la Delegación del Gobierno de España, de la presidencia del Gobierno de Canarias en períodos legislativos alternos con Santa Cruz de Tenerife, de la Presidencia del Tribunal Superior de Justicia de Canarias, de la Diócesis de Canarias, del Consejo Económico y Social de Canarias, así como otras instituciones de diversa importancia como la Casa África. El Carnaval de Las Palmas de Gran Canaria es uno de los eventos más importantes de Canarias, y goza de una importante proyección nacional e internacional.\r\n\r\nLos municipios colindantes a la ciudad forman un área metropolitana de más de 600.000 habitantes, constituyendo el área metropolitana más grande de Canarias y noveno de España. 6 El municipio tiene una extensión de 100,55 km² (ISTAC, 2003). Su altitud es de 8 metros sobre el nivel del mar (en la parte más meridional). El clima es de escasas precipitaciones, con una temperatura media de unos 22 °C.						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,5),(11,'Las Palmas de Gran Canaria is a city in the island of Gran Canaria, in Spain. It is the co-capital (jointly with Santa Cruz) and the most populous city in the autonomous community of the Canary Islands, and the ninth largest city in Spain, with a population of 383,308 in 2010. Nearly half (45.9%) of the people of the island and 18.35% of all inhabitants of the Canary Islands live in this city. It is also the fifth most populous urban area in Spain with a population exceeding 700,000 and (depending on sources) ninth or tenth most populous metropolitan area in Spain with a population of between 625,000 and 750,000. Las Palmas is the largest city of the European Union lying outside the European Continent. It is located in the northeast part of the Spanish island of Gran Canaria, about 150 kilometres (93 miles) off the northwestern coast of Africa[6] within the Atlantic Ocean.		\r\n						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(12,'Las Palmas de Gran Canaria es una ciudad en la isla de Gran Canaria, en España. Es el co-capitales (conjuntamente con Santa Cruz) y la ciudad más populosa de la comunidad autónoma de las Islas Canarias y la novena ciudad más grande de España, con una población de 383.308 en 2010. Casi la mitad (45,9%) de la la gente de la isla y 18,35% de todos los habitantes de las Islas Canarias viven en esta ciudad. También es la quinta área urbana más poblada de España con una población superior a 700 000 y (dependiendo de las fuentes) novena o décima zona metropolitana más poblada de España con una población de entre 625.000 y 750.000. Las Palmas es la ciudad más grande de la Unión Europea que están fuera del continente europeo. Se encuentra ubicado en la parte noreste de la isla española de Gran Canaria, a unos 150 kilómetros (93 millas) de la costa noroeste de África en el Océano Atlántico.		\r\n						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(13,'Las Palmas de Gran Canaria es una ciudad en la isla de Gran Canaria, en España. Es el co-capitales (conjuntamente con Santa Cruz) y la ciudad más populosa de la comunidad autónoma de las Islas Canarias y la novena ciudad más grande de España, con una población de 383.308 en 2010. Casi la mitad (45,9%) de la la gente de la isla y 18,35% de todos los habitantes de las Islas Canarias viven en esta ciudad. También es la quinta área urbana más poblada de España con una población superior a 700 000 y (dependiendo de las fuentes) novena o décima zona metropolitana más poblada de España con una población de entre 625.000 y 750.000. Las Palmas es la ciudad más grande de la Unión Europea que están fuera del continente europeo. Se encuentra ubicado en la parte noreste de la isla española de Gran Canaria, a unos 150 kilómetros (93 millas) de la costa noroeste de África en el Océano Atlántico.						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,NULL),(14,'		\r\n						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,2),(15,'		\r\n						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',4,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,1,2),(16,'Las Palmas de Gran Canaria es una ciudad en la isla de Gran Canaria, en España. Es el co-capitales (conjuntamente con Santa Cruz) y la ciudad más populosa de la comunidad autónoma de las Islas Canarias y la novena ciudad más grande de España, con una población de 383.308 en 2010. Casi la mitad (45,9%) de la la gente de la isla y 18,35% de todos los habitantes de las Islas Canarias viven en esta ciudad. También es la quinta área urbana más poblada de España con una población superior a 700 000 y (dependiendo de las fuentes) novena o décima zona metropolitana más poblada de España con una población de entre 625.000 y 750.000. Las Palmas es la ciudad más grande de la Unión Europea que están fuera del continente europeo. Se encuentra ubicado en la parte noreste de la isla española de Gran Canaria, a unos 150 kilómetros (93 millas) de la costa noroeste de África dentro del Océano Atlántico.\r\n\r\n \r\n\r\nThanks,',4,0,0,0,0,0,1,0,0,0,'0',0,5,4),(17,'Vier Kerbe und sieben Jahren unser Väter auf diesem Kontinent eine neue Nation , in Freiheit empfangen , und widmet sich der These, dass alle Menschen gleich geschaffen brachte .\r\n\r\nJetzt sind wir in einem großen Bürgerkrieg , erproben, ob diese Nation oder irgendeine Nation so konzipiert und so engagiert , kann lange durchzuhalten. Wir sind auf einem großen Schlachtfeld dieses Krieges versammelt . Wir sind gekommen , um einen Teil des Feldes zu widmen , als letzte Ruhestätte für diejenigen, die hier ihr Leben gaben , damit diese Nation leben möge . Es ist nur recht und billig , dass wir dies tun .\r\n',7,0,0,0,0,0,1,0,0,0,'0',0,5,4),(18,'Aber in einem weiteren Sinne , können wir nicht widmen - wir können nicht weihen - können wir nicht heiligen - diesen Boden . Die tapferen Männer , lebende und tote , die hier kämpften , haben sie geweiht , weit über unsere schlechte Leistung zu addieren oder zu beeinträchtigen. Die Welt wird kleiner Hinweis noch lange daran erinnern, was wir hier sagen, aber es kann nie vergessen, was sie hier taten. Es ist für uns das Leben, und nicht , um hier um die unvollendete Arbeit, die sie , die hier kämpften bisher so edel voran haben gewidmet sein. Es ist eher für uns, hier auf die noch vor uns liegt große Aufgabe gewidmet sein - , dass von diesen Toten geehrt wir erhöhte Hingabe an diese Sache , für die sie das letzte volle Maß der Hingabe gab - , dass wir hier sehr zu beheben , dass diese Toten nicht umsonst gestorben sind - dass diese Nation , unter Gott , müssen eine neue Geburt der Freiheit - und das die Regierung des Volkes , durch das Volk , für das Volk, nicht von der Erde .',7,0,0,0,0,0,1,0,0,0,'0',0,5,4),(19,'		\r\n						',15,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'',0,5,NULL);
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
  KEY `userprofile_languagepair_6340c63c` (`user_id`),
  KEY `userprofile_languagepair_784efa61` (`language_id`),
  CONSTRAINT `language_id_refs_id_e4b69511` FOREIGN KEY (`language_id`) REFERENCES `texts_language` (`id`),
  CONSTRAINT `user_id_refs_id_fa73c731` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile_languagepair`
--

LOCK TABLES `userprofile_languagepair` WRITE;
/*!40000 ALTER TABLE `userprofile_languagepair` DISABLE KEYS */;
INSERT INTO `userprofile_languagepair` VALUES (1,1,4),(2,1,15),(3,2,4),(4,2,15),(5,4,7),(6,5,7),(7,4,4),(8,5,4),(9,5,15),(10,4,15),(11,4,15);
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

-- Dump completed on 2014-09-09 17:42:03
