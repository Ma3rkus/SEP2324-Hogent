-- MariaDB dump 10.19  Distrib 10.5.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ncrbmk
-- ------------------------------------------------------
-- Server version	10.5.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oc_accounts`
--

DROP TABLE IF EXISTS `oc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `data` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts`
--

LOCK TABLES `oc_accounts` WRITE;
/*!40000 ALTER TABLE `oc_accounts` DISABLE KEYS */;
INSERT INTO `oc_accounts` VALUES ('rbmk2324','{\"displayname\":{\"value\":\"rbmk2324\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":null,\"scope\":\"v2-federated\",\"verified\":\"0\"},\"avatar\":{\"scope\":\"v2-federated\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"fediverse\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"organisation\":{\"value\":\"\",\"scope\":\"v2-local\"},\"role\":{\"value\":\"\",\"scope\":\"v2-local\"},\"headline\":{\"value\":\"\",\"scope\":\"v2-local\"},\"biography\":{\"value\":\"\",\"scope\":\"v2-local\"},\"profile_enabled\":{\"value\":\"1\"}}'),('xander','{\"displayname\":{\"value\":\"xander\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":null,\"scope\":\"v2-federated\",\"verified\":\"0\"},\"avatar\":{\"scope\":\"v2-federated\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"fediverse\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"organisation\":{\"value\":\"\",\"scope\":\"v2-local\"},\"role\":{\"value\":\"\",\"scope\":\"v2-local\"},\"headline\":{\"value\":\"\",\"scope\":\"v2-local\"},\"biography\":{\"value\":\"\",\"scope\":\"v2-local\"},\"profile_enabled\":{\"value\":\"1\"}}');
/*!40000 ALTER TABLE `oc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_accounts_data`
--

DROP TABLE IF EXISTS `oc_accounts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `accounts_data_uid` (`uid`),
  KEY `accounts_data_name` (`name`),
  KEY `accounts_data_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts_data`
--

LOCK TABLES `oc_accounts_data` WRITE;
/*!40000 ALTER TABLE `oc_accounts_data` DISABLE KEYS */;
INSERT INTO `oc_accounts_data` VALUES (1,'rbmk2324','displayname','rbmk2324'),(2,'rbmk2324','address',''),(3,'rbmk2324','website',''),(4,'rbmk2324','email',''),(5,'rbmk2324','phone',''),(6,'rbmk2324','twitter',''),(7,'rbmk2324','fediverse',''),(8,'rbmk2324','organisation',''),(9,'rbmk2324','role',''),(10,'rbmk2324','headline',''),(11,'rbmk2324','biography',''),(12,'rbmk2324','profile_enabled','1'),(13,'xander','displayname','xander'),(14,'xander','address',''),(15,'xander','website',''),(16,'xander','email',''),(17,'xander','phone',''),(18,'xander','twitter',''),(19,'xander','fediverse',''),(20,'xander','organisation',''),(21,'xander','role',''),(22,'xander','headline',''),(23,'xander','biography',''),(24,'xander','profile_enabled','1');
/*!40000 ALTER TABLE `oc_accounts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `affecteduser` varchar(64) NOT NULL,
  `app` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `subjectparams` longtext NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `messageparams` longtext DEFAULT NULL,
  `file` varchar(4000) DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activity_id`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter` (`affecteduser`,`type`,`app`,`timestamp`),
  KEY `activity_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` VALUES (1,1714040909,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"3\":\"\\/Documents\"}]','','[]','/Documents','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',3),(2,1714040909,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"4\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Documents','files',4),(3,1714040909,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"4\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Documents','files',4),(4,1714040909,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"5\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Documents','files',5),(5,1714040909,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"5\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Documents','files',5),(6,1714040909,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"6\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Documents','files',6),(7,1714040909,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"6\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Documents','files',6),(8,1714040909,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"7\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Documents','files',7),(9,1714040910,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"7\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Documents','files',7),(10,1714040910,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"8\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',8),(11,1714040910,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"8\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',8),(12,1714040910,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"9\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',9),(13,1714040910,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"9\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',9),(14,1714040910,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"10\":\"\\/Templates\"}]','','[]','/Templates','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',10),(15,1714040910,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"11\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',11),(16,1714040910,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"11\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',11),(17,1714040910,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"12\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',12),(18,1714040910,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"12\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',12),(19,1714040910,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"13\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',13),(20,1714040910,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"13\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',13),(21,1714040910,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"14\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',14),(22,1714040911,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"14\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',14),(23,1714040911,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"15\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',15),(24,1714040911,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"15\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',15),(25,1714040911,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"16\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',16),(26,1714040911,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"16\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',16),(27,1714040911,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"17\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',17),(28,1714040911,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"17\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',17),(29,1714040911,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"18\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',18),(30,1714040911,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"18\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',18),(31,1714040911,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"19\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',19),(32,1714040911,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"19\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',19),(33,1714040911,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"20\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',20),(34,1714040911,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"20\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',20),(35,1714040912,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"21\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',21),(36,1714040912,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"21\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',21),(37,1714040912,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"22\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',22),(38,1714040912,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"22\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',22),(39,1714040912,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"23\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',23),(40,1714040912,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"23\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',23),(41,1714040912,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"24\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',24),(42,1714040912,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"24\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',24),(43,1714040912,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"25\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',25),(44,1714040912,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"25\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',25),(45,1714040912,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"26\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',26),(46,1714040912,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"26\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',26),(47,1714040912,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"27\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',27),(48,1714040912,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"27\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',27),(49,1714040913,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"28\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',28),(50,1714040913,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"28\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',28),(51,1714040913,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"29\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',29),(52,1714040913,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"29\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',29),(53,1714040913,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"30\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',30),(54,1714040913,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"30\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',30),(55,1714040913,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"31\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',31),(56,1714040913,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"31\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',31),(57,1714040913,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"32\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',32),(58,1714040913,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"32\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',32),(59,1714040913,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"33\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',33),(60,1714040913,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"33\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',33),(61,1714040913,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"34\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',34),(62,1714040913,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"34\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',34),(63,1714040913,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"35\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',35),(64,1714040914,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"35\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Templates','files',35),(65,1714040914,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"36\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',36),(66,1714040914,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"36\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',36),(67,1714040914,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"37\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',37),(68,1714040914,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"37\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',37),(69,1714040914,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"38\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',38),(70,1714040914,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"38\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',38),(71,1714040914,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"39\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',39),(72,1714040914,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"39\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',39),(73,1714040914,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"40\":\"\\/Photos\"}]','','[]','/Photos','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/','files',40),(74,1714040914,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"41\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',41),(75,1714040914,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"41\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',41),(76,1714040915,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"42\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',42),(77,1714040915,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"42\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',42),(78,1714040915,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"43\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',43),(79,1714040915,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"43\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',43),(80,1714040915,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"44\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',44),(81,1714040915,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"44\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',44),(82,1714040915,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"45\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',45),(83,1714040915,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"45\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',45),(84,1714040915,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"46\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',46),(85,1714040915,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"46\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',46),(86,1714040915,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"47\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',47),(87,1714040916,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"47\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',47),(88,1714040916,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"48\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',48),(89,1714040916,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"48\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',48),(90,1714040916,30,'file_created','rbmk2324','rbmk2324','files','created_self','[{\"49\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',49),(91,1714040916,30,'file_changed','rbmk2324','rbmk2324','files','changed_self','[{\"49\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://nc1.g02-rbmk.internal/index.php/apps/files/?dir=/Photos','files',49),(92,1714060884,30,'calendar','rbmk2324','system','dav','calendar_add','{\"actor\":\"rbmk2324\",\"calendar\":{\"id\":1,\"uri\":\"contact_birthdays\",\"name\":\"Contact birthdays\"}}','','[]','','','calendar',1);
/*!40000 ALTER TABLE `oc_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity_mq` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT 0,
  `amq_latest_send` int(11) NOT NULL DEFAULT 0,
  `amq_type` varchar(255) NOT NULL,
  `amq_affecteduser` varchar(64) NOT NULL,
  `amq_appid` varchar(32) NOT NULL,
  `amq_subject` varchar(255) NOT NULL,
  `amq_subjectparams` longtext DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity_mq`
--

LOCK TABLES `oc_activity_mq` WRITE;
/*!40000 ALTER TABLE `oc_activity_mq` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbookchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `addressbookid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
INSERT INTO `oc_addressbookchanges` VALUES (1,'Database:xander.vcf',1,1,1,1714060884),(2,'Database:xander.vcf',2,1,2,1714060884);
/*!40000 ALTER TABLE `oc_addressbookchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addressbook_index` (`principaluri`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
INSERT INTO `oc_addressbooks` VALUES (1,'principals/system/system','system','system','System addressbook which holds all users of this instance',3);
/*!40000 ALTER TABLE `oc_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT 2,
  `lazy` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `ac_lazy_i` (`lazy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_appconfig`
--

LOCK TABLES `oc_appconfig` WRITE;
/*!40000 ALTER TABLE `oc_appconfig` DISABLE KEYS */;
INSERT INTO `oc_appconfig` VALUES ('activity','enabled','yes',2,0),('activity','installed_version','2.21.1',2,0),('activity','types','filesystem',2,0),('backgroundjob','lastjob','13',2,0),('circles','enabled','yes',2,0),('circles','installed_version','29.0.0-dev',2,0),('circles','loopback_tmp_scheme','https',2,0),('circles','types','filesystem,dav',2,0),('cloud_federation_api','enabled','yes',2,0),('cloud_federation_api','installed_version','1.12.0',2,0),('cloud_federation_api','types','filesystem',2,0),('comments','enabled','yes',2,0),('comments','installed_version','1.19.0',2,0),('comments','types','logging',2,0),('contactsinteraction','enabled','yes',2,0),('contactsinteraction','installed_version','1.10.0',2,0),('contactsinteraction','types','dav',2,0),('core','backgroundjobs_mode','cron',2,0),('core','files_metadata','{\"photos-original_date_time\":{\"value\":null,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-exif\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}',2,0),('core','files_metadata_installed','1',2,0),('core','installedat','1714040896.9804',2,0),('core','lastcron','1714060589',8,0),('core','lastupdatedat','1714060527',8,0),('core','oc.integritycheck.checker','[]',64,1),('core','public_files','files_sharing/public.php',2,0),('core','vendor','nextcloud',2,0),('dashboard','enabled','yes',2,0),('dashboard','installed_version','7.9.0',2,0),('dashboard','types','',2,0),('dav','enabled','yes',2,0),('dav','installed_version','1.30.1',2,0),('dav','types','filesystem',2,0),('federatedfilesharing','enabled','yes',2,0),('federatedfilesharing','installed_version','1.19.0',2,0),('federatedfilesharing','types','',2,0),('federation','enabled','yes',2,0),('federation','installed_version','1.19.0',2,0),('federation','types','authentication',2,0),('files','enabled','yes',2,0),('files','installed_version','2.1.0',2,0),('files','types','filesystem',2,0),('files_downloadlimit','enabled','yes',2,0),('files_downloadlimit','installed_version','2.0.0',2,0),('files_downloadlimit','types','',2,0),('files_pdfviewer','enabled','yes',2,0),('files_pdfviewer','installed_version','2.10.0',2,0),('files_pdfviewer','types','',2,0),('files_reminders','enabled','yes',2,0),('files_reminders','installed_version','1.2.0',2,0),('files_reminders','types','',2,0),('files_sharing','enabled','yes',2,0),('files_sharing','installed_version','1.21.0',2,0),('files_sharing','types','filesystem',2,0),('files_trashbin','enabled','yes',2,0),('files_trashbin','installed_version','1.19.0',2,0),('files_trashbin','types','filesystem,dav',2,0),('files_versions','enabled','yes',2,0),('files_versions','installed_version','1.22.0',2,0),('files_versions','types','filesystem,dav',2,0),('firstrunwizard','enabled','yes',2,0),('firstrunwizard','installed_version','2.18.0',2,0),('firstrunwizard','types','logging',2,0),('logreader','enabled','yes',2,0),('logreader','installed_version','2.14.0',2,0),('logreader','types','logging',2,0),('lookup_server_connector','enabled','yes',2,0),('lookup_server_connector','installed_version','1.17.0',2,0),('lookup_server_connector','types','authentication',2,0),('nextcloud_announcements','enabled','yes',2,0),('nextcloud_announcements','installed_version','1.18.0',2,0),('nextcloud_announcements','types','logging',2,0),('notifications','enabled','yes',2,0),('notifications','installed_version','2.17.0',2,0),('notifications','types','logging',2,0),('oauth2','enabled','yes',2,0),('oauth2','installed_version','1.17.0',2,0),('oauth2','types','authentication',2,0),('password_policy','enabled','yes',2,0),('password_policy','installed_version','1.19.0',2,0),('password_policy','types','authentication',2,0),('photos','enabled','yes',2,0),('photos','installed_version','2.5.0',2,0),('photos','lastPlaceMappedUser','rbmk2324',2,0),('photos','lastPlaceMappingDone','true',2,0),('photos','types','dav,authentication',2,0),('privacy','enabled','yes',2,0),('privacy','installed_version','1.13.0',2,0),('privacy','types','',2,0),('provisioning_api','enabled','yes',2,0),('provisioning_api','installed_version','1.19.0',2,0),('provisioning_api','types','prevent_group_restriction',2,0),('recommendations','enabled','yes',2,0),('recommendations','installed_version','2.1.0',2,0),('recommendations','types','',2,0),('related_resources','enabled','yes',2,0),('related_resources','installed_version','1.4.0',2,0),('related_resources','types','',2,0),('serverinfo','cached_count_filecache','125',2,0),('serverinfo','cached_count_storages','2',2,0),('serverinfo','enabled','yes',2,0),('serverinfo','installed_version','1.19.0',2,0),('serverinfo','types','',2,0),('settings','appstore-fetcher-lastFailure','1714060761',2,0),('settings','enabled','yes',2,0),('settings','installed_version','1.12.0',2,0),('settings','types','',2,0),('sharebymail','enabled','yes',2,0),('sharebymail','installed_version','1.19.0',2,0),('sharebymail','types','filesystem',2,0),('support','enabled','yes',2,0),('support','installed_version','1.12.0',2,0),('support','types','session',2,0),('survey_client','enabled','yes',2,0),('survey_client','installed_version','1.17.0',2,0),('survey_client','types','',2,0),('systemtags','enabled','yes',2,0),('systemtags','installed_version','1.19.0',2,0),('systemtags','types','logging',2,0),('text','enabled','yes',2,0),('text','installed_version','3.10.0',2,0),('text','types','dav',2,0),('theming','enabled','yes',2,0),('theming','installed_version','2.4.0',2,0),('theming','types','logging',2,0),('twofactor_backupcodes','enabled','yes',2,0),('twofactor_backupcodes','installed_version','1.18.0',2,0),('twofactor_backupcodes','types','',2,0),('updatenotification','enabled','yes',2,0),('updatenotification','installed_version','1.19.1',2,0),('updatenotification','types','',2,0),('user_status','enabled','yes',2,0),('user_status','installed_version','1.9.0',2,0),('user_status','types','',2,0),('viewer','enabled','yes',2,0),('viewer','installed_version','2.3.0',2,0),('viewer','types','',2,0),('weather_status','enabled','yes',2,0),('weather_status','installed_version','1.9.0',2,0),('weather_status','types','',2,0),('workflowengine','enabled','yes',2,0),('workflowengine','installed_version','2.11.0',2,0),('workflowengine','types','filesystem',2,0);
/*!40000 ALTER TABLE `oc_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authorized_groups`
--

DROP TABLE IF EXISTS `oc_authorized_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authorized_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admindel_groupid_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authorized_groups`
--

LOCK TABLES `oc_authorized_groups` WRITE;
/*!40000 ALTER TABLE `oc_authorized_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_authorized_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authtoken` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `login_name` varchar(255) NOT NULL DEFAULT '',
  `password` longtext DEFAULT NULL,
  `name` longtext NOT NULL DEFAULT '',
  `token` varchar(200) NOT NULL DEFAULT '',
  `type` smallint(5) unsigned DEFAULT 0,
  `remember` smallint(5) unsigned DEFAULT 0,
  `last_activity` int(10) unsigned DEFAULT 0,
  `last_check` int(10) unsigned DEFAULT 0,
  `scope` longtext DEFAULT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `private_key` longtext DEFAULT NULL,
  `public_key` longtext DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `password_invalid` tinyint(1) DEFAULT 0,
  `password_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authtoken_token_index` (`token`),
  KEY `authtoken_last_activity_idx` (`last_activity`),
  KEY `authtoken_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES (1,'rbmk2324','rbmk2324','MeppEqZfZzCczcn+cPolm4tWgBs50gR26ydDQUZ1I7pBB7tJfYzhV36ET0a0G+57lzOaiufK/El+yWRqPfBKGG+kVjx2kV+MvNSy2PVSa70bK/XVK38kdqvsggfSNTwOAfVEOkDFYU73glklKNEB6Vj1gl/AEeJoPOzAYPko7aCnbNMYq2NpsQs3ltCQyqLsGLV4IbtAd7mBwl+Hwuo5K4Tb0jDHrmrlp2pUXxe+NW1rq2mawqEkmEnveTVdeLhCErohfIkPZUjcahpuxjYrEKDEjv1I52La7xg+Nmph6ChFchwFhbKbplpqzHhm756dNATB28lLYYEm6yhbO+pU5g==','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0','d623c70eb393323af8d2c80d5e76eace492ae4bef8e933941b5022b149f0683a4a3294bec89796837864b388025b11137d2d2967fd044882f6aa562d6aa281de',0,0,1714059800,1714059800,NULL,NULL,'e5618eb16f4c3a92e77d1689fe93b39d210c9b7749762b035d6dcebcd6ee00a078bdc3bacc3d4f4121add9ce78d03b07630d7a8553c878feec5f5cab20f09fd8a2024c3c75263e0892e3b407a13ba51a2b13c9819034e087cd513196eae7a066957664bc84457c74e4bcfb6d218eeb7202c3eac37e66aebd700493294ab5b3cdbc25b33a69b5dca775a8c6166b94ca663996188d41e99f220858b216e9ba8b2f8a8c5696319e900dd86fe8bf01c06cf5315643f3c64374a470301b4a79d23aef0e5b09b63db85d6e04b3040c43df5097efbecd87912d68f14a2b287f0b496bcd65b401b78d1a7c4a33925a675d508280d892d57f9a8c8c78e1de6d56470181997ab0754764a780bb0b1c59fd93867178282ddae53cbfe5a3500345822923dcaf0b4972c8f9956eb661804b2c2d3d87038063ebc88733c4dbfd3351d1299326ae9d9ec8983f6b3c235f0c226ef2de2051b592120645c18a207c84c0a67b3126574919aff550590a1da442e20627e41b193aac00729550a3d9a5292cfab99d83263209d0b384a4e007b78bd40bbde07e95c68afc6513fca6d7a881b06ef1d692acb6cbda058c2ab5db360250a911dc7d5c2dde004a6713c4b1fb65881e48f669bdfe506ed431c42d33e28949afc78253e8f728d76ac7b0910fa1ffd635250011d3c82d005d2362b1479e302b41c943bb1f5bdb1640f8c4d0224ea012be004bd93cced2ca76f4db30ee53f5066e86b7ce0553992941fa5e5db941ad8de4a9fd1b58caca1b0b52735b93b1e3b6e018da978603e54a98aab300859c6b732fbd92bcb63fa806fbb4ce0481a8200a3bc5719fe917318eda8b998392859061e8219d784eda634cc8a357af6990f5ebaf3b3cf89acc2281a8f0259c1a0703f5ae2366cb8f6550168ccbe0d0a2aa5b02772bdc88a754f03a481770b36fec4c04fd073c5f543310667d48223b5e93ba96b48f55bb2441087bc90943812d16b1167dff410acb510580c510eb01d9effc0b7143b16fa890b63cbedd1242c5269cc88de87d7e57abbb582d9c754da40a4ca4ccf875d874ff918dbaa16b6a8be8342629710fe24ad57e33ed3b225c96492ac31f2f8894dcd3cb80f576d9a62aadab8164ccd9d03401329065b9a2d097704acbf92021dfd187e4baff1791d1755b3583ffdf904f12c68fffdea05b7b3231d09b12c9a2119cd7c0652ae06d94c5a92005e4ac0d7f3fb54ed63cae8633cbc64034ca84148ddbf87c1bf8d0677350364948334e540ff572cc8e0a3d5d3115a531c940fb9b1d01da814864f12a425604bed0eb5843ad5a0222fb42d5b05ac38d618ce2df6defd3ab741dd85859d75bc50b50925357d0e9b30e5b790302e31d929c05243293080c93b2fcd89c0ead7897e9f89205729dd77820b957f329bb4023cad452eef1bb4d098cbb3ad162d11b0126dc9573195a94eb4aab672f710d7cd16c3ee6b3419807aec7ceb9ff2936339ad7c1352d478462966dcb6c82ae961ea1a9ca802669bd5934e70de515f641075da37dedb320c6e95eb72f3dd9ccc9bee1f8535259c7a42660748180ff30d2a0da345bffe305336290842782a3962d0c92b0c7ccbfa8e02514ea89086b59622a82ff82fef9b1794a98876838387d90acd3959f8e6a418068b4c2475aeba6aa479bd39dcb23639769cd28d23e2e80c30a45c51915d97cfa156cfd73280a5fc3b6dded223fb183ec9257a90f97d8dda08ac674091d8aab6c261ca33db3baf8c4e663e476a9bbf62103a06ebdf4aa0a6b364dd7f1d90547ff888a5f4b1b5cf5517881e0d77d4753d42b7ea09c270e4d6818855660bf29a0c603599258136b158ada742b4f099bcce39417e0e73bb6f9518d82c2e00ca8d2bc7c1ae694251c11b319e7601961ca7cd409972e81a62ac0d04bcc21119ba764bae66a3625ab15415458b45060e5880edbb0b409bde8d6d810a6b19e4acee150b29ccfdfd25a118d2bc6ddd7f97f68fdadbb1ddd542030b81d7d442fddf1331214bf5992bc3b3ec3ae2ee167b91c108e5a6847eddaa209fdd1fa4e58f05acd005493ecf8f1b8110149680ad6c28aa3c9b9b22277753695876f93a4aba32b8b90aae6abd46a004a47fc6aa5b4fda8326d8a3fdaacf7b030b6777ede5759b598a1ad70954698d91a425376f173da03700c9626270bf04f456c09528aee23c44d042dafc34ec6dfe16bf5396ae34bbbc8ed279c1ce24cdd1a09b5e56412d5f445029ee2314a455d8e0a1d25bd855fc9e3666a10222bfd41b8e6c750eb8066141bbb38ab7aca32fb06d5fd7470cf2f6b72586ebea5d363a6a34221f69c465e82012b38b6803693f558afc26833f64b81f948a40f9f962cd4cf52c3a8b6f36f0db59d963d4db028151be395fec43f7514aae66f4279fc96e847c219d68cc3200d174ff95e|aea63184ce540c9d0ec29255ed4e35d7|8574acc7d2ae8c3f2ed3d3f96d1621164065b9cb94b9d771bb36b4eb73fdd6f0be3176ff31f4b1881895459e47dcfbed662a86dbd2f58b5e0edc35df1719844d|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqRvPJG5D1w8rC0Y2KDxe\nPTX/HdLrrjswtdY0k4FPM14BiBNPLeXoUXDfwezlxuo5zFq/40WWbKOk5gZXaBEp\n8PppN6XSz+fw/2TpvPSskcky/tfHz2jYTAhQOXdgsQsVgOGzHV8u80TMSEcoqoZ2\nOXuIJKBp8KH43V8aDKlA/xaof94JvPxcxttcI8pQoOJT1Zlap1FtpYZzaYDbqsJq\nEi4V70wT4Ibdm96JIUHmMZZVokLnhLCWsIcFqwZKVr4fJMbxr4Hnphc57yRI1cgM\nPQxLv2YjWr/ud1Isf9YjBTo15j+xgI3uy2WHgDEyY+wwmiHyGnouAkeNltfw/c0x\nSQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'1|$2y$10$NJfhCKhQO/lWwPMAXZIh/.AxLMP8w1NlGJznLT2V9MPFjGXevMJmm'),(2,'rbmk2324','rbmk2324','SwNVmjeJnp0PE1rbo5QZnsijkWAKhwWG37qBkJI2elmgj5vixUMavpZXXLNDndHcB6l+mHxnYdmmCY7BfBQNNt89vZFUO/vT6lUbwdyPn3xyhnp80HavJN1MqPciRhM7qzb3edya4G7luI6T8ueiZIJsdc6OTO/USkQ+iIWaDLmNXgdz5fyeMkxjfmN1uMxcBd0yK7ZaWFwfYVj9HkYRWEG/S1WAkfRaIqSRBhNrJbY/OOrFqqFEs5phoERilutUGL0vcbsXZlF7cc4yKmHwrximL55aTQlRvfpib7XVsAFLfMoeTk68RfeUi2Xs3rMbJsa0d+5I20mE+88W+1+ojA==','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0','20fa623bdb6aeab9e26a1c4901695dc15a10d97d16b8887764a37e1e53983761b5acbdf9423e671e204475391314b53b02f6a06ac5e00bb93c6e2d1eb923833d',0,1,1714060962,1714061022,NULL,NULL,'e73c58886708febfd455da2f715183362d5ed33a7337dc809fe77cf15e7e2b571128619abe6118a61041379401ab6fc02313e4840f6a900022801bfb6c67c7f3f0611fd6bc32e57ef831b19d023772aae9e905e31bce021bbb24680ccfcbf356b2fbff62419d68617511737da2a7d57bda8d158e6fae368317c136e674bc2d7cd2c534de525521ec0cb52da03c5eb768d27ad24317c7ef44ee5ba9e59b75c58ceb807b836a81ddd723e0de6117a915f88e196bf4ee48800b57e78e84db5d2f6b514f4baea47e136ef21f115d89a3fe7d1d40ceb2531cb09289e8a61057d4b5a35cbd05e57c267d9d8b5681b3e23cc104579b23b13b4c673fa072217fdfa9d0f224c128f9648c43c5c4948c8329865e9b75285dfc0f479783096859122774bc5420cca5d2a64e741e63aecbc61dc4c9d0090d1f889013ecbdff6cba7704fef44e80ede8e674205970bddc9ca1f6b856d7142f83537495aa8f06951252b2126dbc9a3ad5e28a92718ed5bcb5246403b23a76ebfc04d655572f66cff8a57296e8d40d31d94b0b8fe5801471998437c365cf86171c5cb1ab72d63d3210443b5132f23fccf85a8f3442a9da33bf97950105673544d213e294830b7480038868b5f02f4ec0ee1368ae46335a953cb290b79a1f89fbc9d755f23b02422671d53adf21ee0b783cb5d8875256d026cc6f75e6f925b48b71a9114526db1262df0a78320ddcecc310a29a9349524afe7c57d1da5cf955ac85a4fcb67c91a60360fe61a3a49da48546b907079984ca9dff7264a92e8426bc0a0d5b0a6ba3befed2669873408c0e74ae8cd45840e6b478afe8acdbd465b3a72be18658661c6f8768c4e281096a12df7d1d6a3a223c72b8337663075515873c3237a8a36e7474222de967031cbaf55adae39da53b0ef61cda18e1fc7e66ea2112a0fbbb01e27654774b79c19c668eba3348430b0405cdff9e5f03a7d8b095497210208431dad975339468baade9ff375b0153db0bd0bb8cf648e36ef93c9d27038b990327485a9d9a07e4733a05903012c67a9b1057325eff22296536953a1ae9042e2b914f95dfcefb8162b412f798a7534fd915e1f63861c71c0cd8b7d89d8aeda065ab3654ab14e0b51e7ac2764ad6b30b0540a4dde16fcab0e6f285589f3d203ee223d4afe3bb3c83e229f56019bead12000c10b37ff568122f5ec915091024969696bc533776d730083c2e8e19e7501a07891d47fab55b0c812733f488dc5464b1d3b490a3b4dfca22a7863ac7d59a629817f5955fd2b93d68cb2862f89ff06127a4c85e0f079978b5060cd808cadcd30558b504a7cb35ee75732a1e73fa732dd740ee32470362e23ee8e98977cd5bffcb162efcbc50cb630a6607368ab71e8d200de69112e228b62a9a2fa809adf531ca680f84bdbe577d6bfc7ee04b04519540958ef63b45a7843f80935fa13e9b0d9d57c80253d44b5b1a7963957c89306afd52e82fc472794e95ea038aac7de92a3dce496e2062dcffdf78f62ca96d4689439bb611c7429fe3d59e4fcd1b1837981c30056cf3299faa8f791644361487d162c9feece36772a7f918b362dc3c55678e047691a23d2f14be1828e40f6d50a9c5a618c2d2343c921a9727ea60a86870ad9cf6aa56d1f05f3ef63c9bcd65044732abafac1804975c3ecaa7d2985d92bd41ccc8cb11b68f18a4c3189b21482b21ad0a2ed11cbb531ab5675ef3011b2ab62754fadf19ea6f5a004b3db356a363a8e2ade057e198ae37f764e1508a6510fa180c344926115d081a91bcb0fa53e4f2094cff571849d4dff78b8970181b763055aa9a076b4369cd3c4cd12e0af4cb327f26ccb8f8c93c8468aa455cebc5eec60ca28117fcf02a3ea55542e861393b6f99f985cbcc18c6e83e4d408a70ac475c45c7cc09f0f01d6fa76ced580dfeb38eb7464c30eb6ade2b6de8a339649b25f04c31b0f986570114a9df0161834f800d2cb1ca08af6aa40a3858491a3d8ee67f3c96f700dc6a23392399676b1281f6579f68c86d0e18292d2208203ea0295991e9bebde3e599c9de7cacea785886a88fdb9cef4898fca52880efc5b10a58e882c6de916dab255cb098693651b75ef3816a6b375995808962f7099483dce18a3382dc86f416ec1099a7cbec9cd157a24e11716c481ce2a645aec9bbaf94cd58e5a702262014fa2728b4027b7177db07f15c785dc05b026561b00f697d0df4f29804512d7215e3524a85d8c9c17e0efa7a7fff7b28f00a53244f1915e4e145f4264a59d0e2aaf2c0702ac264529a51d5407fa15e5eec6398167ec46af0722d997cef20187ef89a52e2441ac7d81eef7e1face3d4218403308830123bb25c724953e08aeda2228c5c54ef82af763072c00f11eb47433a962d39b4a7682dae20259ce19ec593f57c7d6a5eb4a8|6af0d814a01e833a26c40ab3b99e1246|dc161183abf89bcfcec73765277391b5bb96fb9f41b4a56c1b87cee34b373ab6c032276da42a16740931155ca71536b7fa061e822daa46b9ad40d974937c8641|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmPTkMm7S1BnqJOADN/wt\ndvpBDxDhydkfn07ZwIQBaCaE059mzMLbHcbg2+GydPeHN9aT1WcfgbZi5F7OAEBY\nVksv6xWBMKgmqoS3bzPbDR3gGEABVVt2USCu/2d4ubOVLpW7o2yThGQM1hKGgiQq\nEeKn/GOmUyeUsLDK/JRDi1I2Gv4QNKyTxG71CACDEvz1+TXhGCpsxKDGFx9wNMtN\nL0ZH7v8nkAb0yGLk8SAuzTKtLWXgvAJJ36arj+VjmwB56QOd0D9S43QKCDndPWi0\nCUzS3zGWssTvJAOEUTssZEVG8DjwOkS602hKSfgtl5aWRzf8+5ve4GZhncce1vwr\nNwIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'1|$2y$10$NJfhCKhQO/lWwPMAXZIh/.AxLMP8w1NlGJznLT2V9MPFjGXevMJmm');
/*!40000 ALTER TABLE `oc_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_bruteforce_attempts`
--

DROP TABLE IF EXISTS `oc_bruteforce_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_bruteforce_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL DEFAULT '',
  `occurred` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `bruteforce_attempts_ip` (`ip`),
  KEY `bruteforce_attempts_subnet` (`subnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_bruteforce_attempts`
--

LOCK TABLES `oc_bruteforce_attempts` WRITE;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_invitations`
--

DROP TABLE IF EXISTS `oc_calendar_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `recurrenceid` varchar(255) DEFAULT NULL,
  `attendee` varchar(255) NOT NULL,
  `organizer` varchar(255) NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT NULL,
  `token` varchar(60) NOT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_invitation_tokens` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_invitations`
--

LOCK TABLES `oc_calendar_invitations` WRITE;
/*!40000 ALTER TABLE `oc_calendar_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_reminders`
--

DROP TABLE IF EXISTS `oc_calendar_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `is_recurring` smallint(6) DEFAULT NULL,
  `uid` varchar(255) NOT NULL,
  `recurrence_id` bigint(20) unsigned DEFAULT NULL,
  `is_recurrence_exception` smallint(6) NOT NULL,
  `event_hash` varchar(255) NOT NULL,
  `alarm_hash` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `is_relative` smallint(6) NOT NULL,
  `notification_date` bigint(20) unsigned NOT NULL,
  `is_repeat_based` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_reminder_objid` (`object_id`),
  KEY `calendar_reminder_uidrec` (`uid`,`recurrence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_reminders`
--

LOCK TABLES `oc_calendar_reminders` WRITE;
/*!40000 ALTER TABLE `oc_calendar_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources`
--

DROP TABLE IF EXISTS `oc_calendar_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_resources_email` (`email`),
  KEY `calendar_resources_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources`
--

LOCK TABLES `oc_calendar_resources` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources_md`
--

DROP TABLE IF EXISTS `oc_calendar_resources_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_md_idk` (`resource_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources_md`
--

LOCK TABLES `oc_calendar_resources_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms`
--

DROP TABLE IF EXISTS `oc_calendar_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_rooms_email` (`email`),
  KEY `calendar_rooms_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms`
--

LOCK TABLES `oc_calendar_rooms` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms_md`
--

DROP TABLE IF EXISTS `oc_calendar_rooms_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_md_idk` (`room_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms_md`
--

LOCK TABLES `oc_calendar_rooms_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `calendarid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calid_type_synctoken` (`calendarid`,`calendartype`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `calendarid` bigint(20) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `classification` int(11) DEFAULT 0,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calobjects_index` (`calendarid`,`calendartype`,`uri`),
  KEY `calobj_clssfction_index` (`classification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects_props`
--

DROP TABLE IF EXISTS `oc_calendarobjects_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects_props` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` bigint(20) NOT NULL DEFAULT 0,
  `objectid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `parameter` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calendarobject_index` (`objectid`,`calendartype`),
  KEY `calendarobject_name_index` (`name`,`calendartype`),
  KEY `calendarobject_value_index` (`value`,`calendartype`),
  KEY `calendarobject_calid_index` (`calendarid`,`calendartype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects_props`
--

LOCK TABLES `oc_calendarobjects_props` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `description` varchar(255) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `timezone` longtext DEFAULT NULL,
  `components` varchar(64) DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendars_index` (`principaluri`,`uri`),
  KEY `cals_princ_del_idx` (`principaluri`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
INSERT INTO `oc_calendars` VALUES (1,'principals/system/system','Contact birthdays','contact_birthdays',1,NULL,0,'#E9D859',NULL,'VEVENT',0,NULL);
/*!40000 ALTER TABLE `oc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarsubscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(100) DEFAULT NULL,
  `refreshrate` varchar(10) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `source` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calsub_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarsubscriptions`
--

LOCK TABLES `oc_calendarsubscriptions` WRITE;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `carddata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_abiduri` (`addressbookid`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
INSERT INTO `oc_cards` VALUES (1,1,'BEGIN:VCARD\r\nVERSION:3.0\r\nPRODID:-//Sabre//Sabre VObject 4.5.4//EN\r\nUID:xander\r\nFN;X-NC-SCOPE=v2-federated:xander\r\nN;X-NC-SCOPE=v2-federated:xander;;;;\r\nPHOTO;ENCODING=b;TYPE=image/png;0=v2-federated:iVBORw0KGgoAAAANSUhEUgAAAgAA\r\n AAIACAYAAAD0eNT6AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAgAElEQVR4nO3da3vV9Z3v8W9WVs\r\n 4QSDgFhCBnQgIhAcLBtlOr7ZZOq22l9QSensG+t2/t69rPYD+DqdpO25lxj9tOp9OZTjvX7M4I\r\n njiDqKAoKiIicpBjwr5ha3UUTCC//1rJ7/W6OeOsz7+9BnxD1vqumjPvn70SAEBWSpV+AACgeA\r\n IAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIA\r\n ADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAAD\r\n IkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIk\r\n AAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAA\r\n AgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAg\r\n QwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQw\r\n IAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIA\r\n ADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAAD\r\n IkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIk\r\n AAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAA\r\n AgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAg\r\n QwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQw\r\n IAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQwIAADIkAAAgQ+VKPwCMtt3/cCB2/fKlQramzGuL\r\n O/7H1wrZ4rMunb8cv/yf/xrnPjyfdKdpUmN85399I+qb6pLuQNEEAONO98ZF8drWN+PDd04n33\r\n rvlffjwO8PxZJb5yff4rO2P7k3zr7/UfKdVff0+Jc/45IfATDulGpLseHR/oiaYva2P7kv+Z9C\r\n +azjh07Egd8fSr7T2T8r5q66KfkOVIIAYFyaOr89um5fUMjWpXOX4rmf7Spki4grQ1fimce2R1\r\n xJu1PfUhcDW3rTjkAFCQDGrZXfXxYTpjUXsnX4ubfird3vFrKVu72/eSVOHjmVfGf1PSuiqbUx\r\n +Q5UigBg3Co3lGPdQ32F7W17YkcMXhosbC9HZ46fjV1Pp3+D58zu6bHgls7kO1BJAoBxbWbX9F\r\n jwlbmFbJ19/6PY+dT+QrZyte2JHTF4MW1klRtqY32B4QiVIgAY91bfuzyaJhfzV7n7/vnV+ODI\r\n h4Vs5ea1bW/G23uOJd/pu7s7WqYU86MjqCQBwLhX31QXAw8U82auK0NXYutj2wvZysnFjy7G8z\r\n /bnXxn2qIpsfS2Yt48CpUmAMhCZ/+s6Fw1q5Ct44c+KOQjajl54W/2xPnTF5JulMql2PCwv/on\r\n HwKAbAxs7o36lmIOurgNMHqOvXw8Xv3D4eQ7vXcujdaOicl3oFoIALLR1NoYa+5bUciW2wCjY2\r\n hwqJDP/LfNmRTdGxenHYEqIwDIyvz1nTGrZ3ohW24D3LjdvzoQp46eSbpRU6qJDY/2R02poNOR\r\n UCUEANlZ91B/lBtqC9lyG+D6nTp6Ovb86uXkO90bF0V75+TkO1BtBADZaWlviv5NPYVsuQ1w/b\r\n Y+viOGLg8l3WjtmBAr7uxKugHVSgCQpSXfmB/TFk0pZMttgJF79Q+H490Dx9OO1ESsf6Q/ast+\r\n GyRP/j+fbG14uC9KBfzm7zbAyJw/fSFe/Ns9yXeW3Do/pi8sJgKhGgkAstXaMTF671xayJbbAM\r\n P3/M93x4UzF5NutExpjv5N3Uk3oNoJALLWvXFxtHdOKmTLbYAv987+Y/Ha1jeT76x7cGWUG8rJ\r\n d6CaCQCyVlOqifWPFPMRMLcBrm3w8lBse3xH8p0Ft3TGrJ4ZyXeg2gkAstfeOTmW3bGokC23Aa\r\n 5u19P74/Sxs0k3GlsbYvW9y5NuwFghACAieu/qitaOCYVsuQ3weSffPhX7/umV5DsDm3ujvrk+\r\n +Q6MBQIAIqK2XIr1j/RHFHAMzm2Az9v64+0xNJj23m9n/6yYu+qmpBswlggA+KPpC6fEklvnF7\r\n LlNsCfHfj9oXjv4ImkG/UtdTGwpZivhIaxQgDAp/Rv6o7m9qbkO24DfOzch+dj+5P7ku+svmdF\r\n NLU2Jt+BsUQAwKeUG8qx/qFivhPebYCIZ3+6My6du5R0Y2b39FhwS2fSDRiLBAD8F7N6ZsT8DX\r\n MK2cr5NsCRXUfjjRfeTrpRbqgtLOhgrBEA8AXW3LciGic2JN/J9TbA5QuXY9sT6T/z33d3d7RM\r\n aU6+A2ORAIAvUN9cHwObi3nTWI63AXY8tT8+OnEu6ca0RVNi6W0Lkm7AWCYA4Crmrr4pOvtnFb\r\n KV022AE2+cjJd+ezDpRqlcig0P+6t/uBYBANcwsLk36prqku/kchvgT59+uDKU9jP/vXcujdaO\r\n iUk3YKwTAHANTZMaY/U9PYVs5XAb4KXfHYz3Xz+ZdKNtzqTo3rg46QaMBwIAvsTCr94cHcumJd\r\n 8Z77cBzp44Fzv+T9rP/NeUamLDo8V8uROMdQIAhmH9Q31RbqhNvjOebwM8+9MdcflC2vc5LLtj\r\n UbR3Tk66AeOFAIBhmDC1JVb+YFkhW+PxNsDhF96KIzuOJt1o7ZgQvXd1Jd2A8UQAwDB13b4wps\r\n 5vS74z3m4DXDp/OZ7768T/eWoi1j/SH7Vlv6XBcPnVAiOw4dFVUapN//Pl8XQb4MW/2xPnTqb9\r\n G40lt86P6QunJN2A8UYAwAhMmjkxln93aSFb4+E2wPFDJ+Llf3st6UbLlObo39SddAPGIwEAI9\r\n Tz7cUxeXZr8p2xfhvgytCVeOax7RFpP/If6x5cGeWGctoRGIcEAIxQqbYUGx5dVchHzcbybYC9\r\n v3klTh45lXRjwS2dMatnRtINGK8EAFyHKXMnR9c309+ZH6u3Ac4cPxu7nn4p6UZja0Osvnd50g\r\n 0YzwQAXKeV318WE6e3JN8Zi7cBtj6+IwYvpn3/wsDm3qhvrk+6AeOZAIDrVFtXG+sf7o8o4Ojc\r\n WLoN8NrWN+OdvceSbnT2z4q5q25KugHjnQCAGzBjydRY9LWbk++MldsAFz+6GM//fHfSjfqWuh\r\n jYUsxXNcN4JgDgBq360fJobmtMvjMWbgM8/4s9cf70haQbq+9ZEU2t6f/7hvFOAMANqmssx9oH\r\n i/nu+Wq+DXDs5eNx8D8OJ92Y2T09FtzSmXQDciEAYBTMXtERN6+dnXynWm8DDA0OJf/Mf7mhNt\r\n Y/VExoQQ4EAIySgft7o2FC+nelV+NtgN2/OhCnjp5JutF3d3e0TGlOugE5EQAwShom1Mea+1ck\r\n 36m22wCnjp6OPb96OenGtAXtsfS29HcXICcCAEbRvLVz4qYVHcl3quk2wNbHd8TQ5aFkr18ql2\r\n LDo/3JXh9yJQBglK17cGXUNaa/TV8NtwFe/cPhePfA8aQbvXcujdaOiUk3IEcCAEZZc1tT9P+w\r\n J/lOpW8DnD99IV74m7Sf+W+bMym6Ny5OugG5EgCQwOKvz4sZS6Ym36nkbYDnf747Lp69lOz1a0\r\n o1seHR/kK+dAlyJAAgkfUP90dtfW3ynUrcBnhn77F4beubSTeW3bEo2jsnJ92AnAkASGTi9Jbo\r\n vasr+U7RtwEGLw3Gtp/sSLrR2jGhkP/uIGcCABJa9q2FMWVeW/KdIm8D7Hz6pTh97Gy6gZqI9Y\r\n /0R23Zb0+Qkl9hkFBNqSbWP9wXpdq0P8cu6jbAB0c+jP2/eSXpxpJb58f0hVOSbgACAJJrmz0p\r\n er69JPlOEbcBtj62PYYG0937bW5viv5N3cleH/gzAQAFWP7dJTFpZvrPsqe8DXDg94fi+KEPkr\r\n z2n6x/qC/KDelvKAACAApRqv3jNbvEn2hLdRvg3IfnY/uT+0b9dT9twS2dMatnRtIN4M8EABRk\r\n 6vz26Lo9/T37FLcBnv3pzrh0Lt1n/htbG2L1vcuTvT7weQIACtR3d3dMmJb+G+1G8zbAkV1H44\r\n 0X3h6V17qagc29Ud+c/psUgT8TAFCg2rraWFfAd9qP1m2Ayxcux7Yn0n7mv7N/VsxddVPSDeDz\r\n BAAUbGbX9FjwlbnJd0bjNsCOp/bHRyfOjdITfV59S10MbOlN9vrA1QkAqIDV9y6PpsmNSTdu9D\r\n bAiTdOxku/PTiKT/R5q360PJpa0/73AHwxAQAVUN9UF2s3r0y+c723Aa4MXYln/urFuDKU7jP/\r\n M7unx8IC/iYE+GICACpkTt/MmLsm/c++r+c2wP7fHowTb6Q7LVxuqI31BbwXArg6AQAVNPBAb9\r\n S31CXdGOltgLMnzsXOp9J+5r/v7u5omZL+0xDA1QkAqKDGiQ2x5r4VyXdGchtg2xM74vKFdF8v\r\n PG1Beyy9Lf09BODaBABU2Pz1nTGrZ3ryneHcBjj8wlvx1q6jyZ6hVP7jRUSg4gQAVIF1D/VHua\r\n E26caX3Qa4eO5SPPfXo39G+NN671warR3pvxMB+HICAKpAS3tT9G/qSb5zrdsA25/cG+dOpvki\r\n oYiItjmTonvj4mSvD4yMAIAqseQb82PaoilJN652G+C9gyfi5X97LdluTakmNjzaHzWlxN+GBA\r\n ybAIAqsuHhviiV0/6y/K+3AYYGh2Lr49sj0n3kP5bdsSjaOyenGwBGTABAFWntmBi9dy5NvvPp\r\n 2wD7/umVOHnkVLKtiTMmRO9dXcleH7g+AgCqTPfGxdHeOSnpxp9uA5w+djZ2/cOBdEM1ERse7Y\r\n /axH+rAYycX5VQZWpKNbH+kfQ/Lz/83Fvxr//7P2PwYrrP/C+5dX5MX5j2fQ3A9REAUIXaOydH\r\n 98ZFyXdOv3sm2Ws3tzdF/6buZK8P3BgBAFVqxZ1d0doxodKPcd3WP9QX5YZypR8DuAoBAFWqtl\r\n yK9Y/0R4zBT87N3zAnZvXMqPRjANcgAKCKTV84JZbcOr/SjzEija3FfL8BcGMEAFS5/k3d0dze\r\n VOnHGLaBzb1R31xf6ccAvoQAgCpXbijH+of6Kv0Yw9LZPyvmrrqp0o8BDIMAgDFgVs+MmL9hTq\r\n Uf45rqW+piYHNvpR8DGCYBAGPEmvtWRGNrQ6Uf46pW/Wh5NE1qrPRjAMMkAGCMqG+uj4EHqvNP\r\n 2DO7p8fCr8yt9GMAIyAAYAyZu/qm6OyfVenH+IxyQ+2YeY8C8GcCAMaYgc29UddUV+nH+ETf3d\r\n 3RMqW50o8BjJAAgDGmaVJjrL53eaUfIyIipi1oj6W3Laj0YwDXQQDAGLTwK3OjY9m0ij5DqVyK\r\n DY/2V/QZgOsnAGCM+vjWfm3F9nvvXBqtHRMrtg/cGAEAY9SEqS2x8gfLKrLdNmdSdG9cXJFtYH\r\n QIABjDum5fGFPntxU7WhOx4dH+qCmNwW8pAj4hAGCMW3p7wW/CuxJx+tjZYjeBUScAYAwbvDwU\r\n u55+qfDdZ3+6My6eu1T4LjB6BACMYbt/+VKcOnqm8N3zpy7EC7/YXfguMHoEAIxRJ98+FXt//X\r\n LF9l/9w+F498Dxiu0DN0YAwBi19cfbY2jwSuUe4ErE1se3x+Dloco9A3DdBACMQQd+dyjeO3ii\r\n 0o8Rp46eid2/LP49CMCNEwAwxnz0wbnY/uTeSj/GJ/b++uU4+fapSj8GMEICAMaYbT/ZEZfOX6\r\n 70Y3xiaPBKPPNXL1b6MYAREgAwhhx+/q04suNopR/jc44f+iAO/O5QpR8DGAEBAGPExXOX4tmf\r\n 7qz0Y1zV9if3xkcfnKv0YwDDJABgjHjhF7vj/KkLlX6Mq7p0/nJs+8mOSj8GMEwCAMaAdw8cj1\r\n f/cLjSj/Gljuw4Goeff6vSjwEMgwCAKjd4eSieeWx7RAU/8j8SzgTD2CAAoMrtenp/nH63+HO/\r\n 18uZYBgbBABUsQ+OfBj7/umVSj/GiDkTDNVPAEAV2/pYhc/9Xi9ngqHqCQCoUi/968E4fuiDSj\r\n /GdXMmGKqbAIAqdPZE+nO/HcumJX39CGeCoZoJAKhC257YEZcvDCZ7/RlLpsbt//2WaJszKdlG\r\n hDPBUM0EAFSZ1589Em/tSnfut1RbE+seXBk1pZpYu2VlRE2yqYhwJhiqlQCAKnLxo4vx3M92Jd\r\n 3o3rg4WjsmRkTEtAXtsfArc5PuRTgTDNVIAEAVef4Xe5Ke+504vSWWf3fpZ/5n/Zt6omFCfbLN\r\n CGeCoRoJAKgSR196Lw4mPve7dvPKqC1/9pd9w4T66N/UnXQ3wplgqDYCAKrA4OWh2PrY9qQbNw\r\n /Mjpnd07/wf7fwqzfHtAXtSfcjnAmGaiIAoArs/L/74/Sxs8lev66pLlbft/ya/8zaLR+/MTCl\r\n 86cuxIt/uyfpBjA8AgAqrIhzv313L4um1sZr/jNtcybF0tvmJ32OiIhX/v31OPayM8FQaQIAKu\r\n jK0JV45sfb48pQunO/U+a1xZJbh/cv9t7vLYumydcOhRt2JeKZx5wJhkoTAFBB+397MN5/Ld25\r\n 35pSTax/qG/Y/3xdYzlW33PtHxWMBmeCofIEAFTI2fc/ip1P7Uu6sfT2BSO+9nfzwGxngiEDAg\r\n AqJPW53+a2xlj5va7r+r9du3lllGrTviHQmWCoLAEAFfDatjfjrd3vJt1Yc39vlBvK1/V/2zpj\r\n QnRvXDzKT/R5zgRD5QgAKNjFjy7G8z/bnXTjphUd0dk/64ZeY/l3lsSEac2j9ERX50wwVIYAgI\r\n I9//Pdcf50unO/tfW1sXZz742/Tl1trLn/xl/nyzgTDJUhAKBA7+w/Fgf/442kG713dUXLlNH5\r\n k/vsFR0xp2/mqLzWtTgTDMUTAFCQwUuDse3xtH/SnTy7NZZ9a+Govuaa+3ujtr52VF/zizgTDM\r\n USAFCQnU+lPfcbNRHrHuwb9XO+Le1NseLOpV/+D94gZ4KhWAIACvDBmx/Gvn9+NenGoq+l+0Kf\r\n Zd9aGJNmTkzy2p/mTDAURwBAYh+f+30x6bnfxokNSb/St1RbirVbViZ7/U84EwyFEQCQ2P5/eT\r\n Xef/1k0o3V9y6P+ub6pBszlkyNeevmJN2IcCYYiiIAIKGz738UO57an3SjY+m0Qv7FHBGx6p6e\r\n qGuqS77jTDCkJwAgoa2Pb4/Bi+nO/ZbKpVi7Jf1n9f+kqbUx+n6wLPmOM8GQngCARF7b+ma8ve\r\n dY0o2ejYujtSP9m/M+bck35seUmycn33EmGNISAJDAhTMX47mf7Uq6MXHGhOj5zpKkG1czsHll\r\n RNrvCooIZ4IhJQEACTz/i11x4czFpBtrt/RGbbkyv4SnzmuLxX8xL/mOM8GQjgCAUfbO3mNx6D\r\n /fTLpx89rZMbNretKNL9N397JonNiQfOfIjqNx+AVngmG0CQAYRYOXBmPrE9uTbtQ11cXqe5cn\r\n 3RiO+ub66P9hTyFbz/7EmWAYbQIARtGOv98XZ977KOlG/6buaGptTLoxXAtu6Yzpi6ck33EmGE\r\n afAIBRcuKNk7H/Xw4m3Zg6vy0Wfz39z95HYu2WlaP+/QNfxJlgGF0CAEbBlaGPP7ee8txvTakm\r\n 1j3Yl+z1r9fkWa3R9c0F6YecCYZRJQBgFOz751fjxBsfJt3o+uaCaJszKenG9eq9qyua29L/WM\r\n KZYBg9AgBu0JnjZ2Pn/0177re5vSl67+pKunEjyg3lWH3fikK2nAmG0SEA4AZtfXxH0nO/ERED\r\n 9/dGuaGcdONGzV11U8zqSf/RRGeCYXQIALgBh555I97Zm/bc75y+mTGnb2bSjdEy8MDKKBVwnM\r\n iZYLhxAgCu0/nTF+L5n+9OulFuqI019xf3ZT83auL0luj5y8WFbDkTDDdGAMB1eu5n6c/99t7V\r\n FS3tTUk3RlvPt5fExOktyXecCYYbIwDgOry95914fduRpBuTZ7dG1zcXJt1IobZcioEHivlbC2\r\n eC4foJABihyxcux9bHE//JsyZi/UN9hRzYSWFWz4zoXDWrkC1nguH6CAAYoR1P7Y+z76c997v4\r\n L+bF1PntSTdSW3Pfiig31CbfcSYYro8AgBF4//DJeOm3ac/9NrY2RN+m7qQbRWhuK+52gTPBMH\r\n ICAIapiHO/ERGr710e9U11STeK0vXNhTF5dmv6IWeCYcQEAAzT3t+8Eh+8mfbcb8eyaTFv7Zyk\r\n G0WqKdXE2i0rIwp4K4MzwTAyAgCG4fSxs7Hr6bT/cimVS7F288qkG5UwfeGUWLChs5AtZ4Jh+A\r\n QADMPWJ7YnP/fb85eLo3XGhKQbldL/w56ob0n/Yw1ngmH4BAB8iYP/8UYc3fde0o2JMyZEz7eX\r\n JN2opMaJDdH3g2Le2OhMMAyPAIBrOH/6Qjz/i13Jd9Y9uDJqC7ihX0mLvz4vps5vK2TLmWD4cu\r\n P7dxy4Qc/99a64eDbtkZl56+ZEx9JpSTeqxdotKws5buRMMHw5AQBX8dbud+P1Z9Oe+61vqYvV\r\n 9y5PulFN2jsnx+Kvzytky5lguDYBAF/g8oXLse2J9H+C7N/UE40TG5LvVJOVP1gWja3F/Gd2Jh\r\n iuTgDAF9jx9/uSn/udtqA9Fn3t5qQb1ai+qS5W31PM33o4EwxXJwDgvzj+2gexP/G535pSTax9\r\n cPx95n+4inzfgzPB8MUEAHzKlaEr8cyPX4xIe+03ln1rYbTNnpR2pMqt3dIbpdoCTgQ6EwxfSA\r\n DAp+z99ctx8kjaS3LN7U2x4s6lSTfGgtaOidH13xYVsuVMMHyeAIA/On3sbOxMfO43ImLt5t4o\r\n N5ST74wFvXcujZYpzYVsORMMnyUA4I+2PrY9hhL/NXFn/6yY3Tsz6cZYUltXG2vuW1HI1tDgld\r\n j64+2FbMFYIAAgIl79f6/H0ZfSnvstN9TGmvuL+ZfdWDKnb2bMXtlRyNZ7B084Ewx/JADI3rlT\r\n 5+OFAj4q1vu9ZdHc1pR8ZywauL83autrC9lyJhg+JgDIXhHnftvmTIqu2xck3RjLWqY0x/K/LO\r\n bLkJwJho8JALJ2ZNfROPxc4nOxNR9/2U8RN/DHsu6Ni6K1o5ivQ3YmGAQAGSvq3O/H34LXnnxn\r\n rCvVlmJgc29he84EkzsBQLa2P7kvPjqR9mfBja0N0Xd3d9KN8WRm1/S4eWB2IVvOBJM7AUCWjh\r\n 86ES/9Lu2534iINfetiPqmuuQ748nqe5dHXWMxdxKcCSZnAoDsDA0OxTOPbU9+7ndmd3F/mh1P\r\n miY1Ru/3u4oZcyaYjAkAsrP3168kP/dbKpdi7eZ8v+znRi39xoJom1PMdyU4E0yuBABZOfXumd\r\n hVwG/2y7+zJCZOb0m+M17VlGpi3YMrIwr64IQzweRIAJCVIs79tnZMiJ5vL066kYOp89tj4Vfm\r\n FrLlTDA5EgBk45V/fz3ePZD+DV/rHuyLUq1fWqNh1Y96omFCfSFbzgSTG79LkYVzp87HC3+T/i\r\n Nf8zfMiRlLpibfyUV9c330byruY5TOBJMTAUAWnv3JzriU+OhLfUtdrPrR8qQbOVr41Ztj2oJi\r\n Dik5E0xOBADj3pGd78QbL7ydfGfVD3uicWJD8p0crS3wlLIzweRCADCuXTpfzLnfaYumxMKv3p\r\n x8J1dtsyfF0tvmF7bnTDA5EACMax//TPd80o1PPrJGUr3fWxZNkxsL2XImmBwIAMat9w6eiAO/\r\n T/+u7mV3LIrJs1qT7+SurrEcq+8p7j0WzgQz3gkAxqWhwaHYWsC535YpzdF759K0I3zi5oHZMb\r\n N7ejFjzgQzzgkAxqU9//hynHwr/WW3gc29UVtXm3yHPxt4oDdK5WJ+6zp19Ezs+YcDhWxB0QQA\r\n 486po6djdwG/aXeumhWzV3Qk3+GzWmdMiO47FhW2t+cfDzgTzLgkABh3ning3G9dYznW3Lci6Q\r\n ZXt/y7S2PCtOZCtpwJZrwSAIwrL//ba3Hs5feT7/R+vyua25qS7/DFasulGHiguE9eOBPMeCQA\r\n GDfOfXg+Xvy7vcl32jsnxdJvLEi+w7XdtHxGzOmbWdieM8GMNwKAcaOIc79RE7H2wb7CrtJxbW\r\n vu741yQzFvwnQmmPFGADAuvLn9nXjjxfTnfpfcOj+mzmtLvsPwtLQ3xfLvFvcxTGeCGU8EAGPe\r\n pfOX49mfpv+TWdPkxlj5g2XJdxiZZd9aGJNmTixsz5lgxgsBwJj34t/tSX7uNyJi9T3Lo76pLv\r\n kOI1OqLcXaLcW9IdCZYMaLmjPvn018Kw0AqDb+BgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBD\r\n AgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAg\r\n AAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAA\r\n MiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMi\r\n QAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQA\r\n ACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAAC\r\n BDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBD\r\n AgAAMiQAACBDAgAAMiQAACBDAnq2PH8AAAFSSURBVAAAMiQAACBDAgAAMiQAACBDAgAAMiQAAC\r\n BDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBD\r\n AgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAg\r\n AAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAA\r\n MiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMi\r\n QAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQA\r\n ACBDAgAAMiQAACBDAgAAMiQAACBDAgAAMiQAACBD/x9Cn5P0zeCHcAAAAABJRU5ErkJggg==\r\nX-SOCIALPROFILE;TYPE=NEXTCLOUD;X-NC-SCOPE=v2-published:https://nextcloud.g0\r\n 2-rbmk.internal/index.php/u/xander\r\nX-MANAGERSNAME;UID=rbmk2324;X-NC-SCOPE=v2-local:rbmk2324\r\nCLOUD:xander@nextcloud.g02-rbmk.internal\r\nEND:VCARD\r\n','Database:xander.vcf',1714060884,'0497d90f9343f9738ad79acb514ddae3',12388,'xander');
/*!40000 ALTER TABLE `oc_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `cardid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `card_contactid_index` (`cardid`),
  KEY `card_name_index` (`name`),
  KEY `card_value_index` (`value`),
  KEY `cards_prop_abid` (`addressbookid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
INSERT INTO `oc_cards_properties` VALUES (6,1,1,'UID','xander',0),(7,1,1,'FN','xander',0),(8,1,1,'N','xander;;;;',0),(9,1,1,'X-SOCIALPROFILE','https://nextcloud.g02-rbmk.internal/index.php/u/xander',0),(10,1,1,'CLOUD','xander@nextcloud.g02-rbmk.internal',0);
/*!40000 ALTER TABLE `oc_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_circle`
--

DROP TABLE IF EXISTS `oc_circles_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(31) NOT NULL,
  `name` varchar(127) NOT NULL,
  `display_name` varchar(255) DEFAULT '',
  `sanitized_name` varchar(127) DEFAULT '',
  `instance` varchar(255) DEFAULT '',
  `config` int(10) unsigned DEFAULT NULL,
  `source` int(10) unsigned DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  `contact_addressbook` int(10) unsigned DEFAULT NULL,
  `contact_groupname` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8195F548E3C68343` (`unique_id`),
  KEY `IDX_8195F548D48A2F7C` (`config`),
  KEY `IDX_8195F5484230B1DE` (`instance`),
  KEY `IDX_8195F5485F8A7F73` (`source`),
  KEY `IDX_8195F548C317B362` (`sanitized_name`),
  KEY `dname` (`display_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES (1,'qml9w9oU6zY3n2M7mmtWWlVDjH9qZMj','user:rbmk2324:qml9w9oU6zY3n2M7mmtWWlVDjH9qZMj','rbmk2324','','',1,1,'[]','','2024-04-25 10:28:28',0,''),(2,'Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm','app:circles:Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm','Circles','','',8193,10001,'[]','','2024-04-25 10:28:28',0,''),(3,'Z3YmcA59uprj4khDvCHX7TpOG7TJguF','user:xander:Z3YmcA59uprj4khDvCHX7TpOG7TJguF','xander','','',1,1,'[]','','2024-04-25 16:01:24',0,'');
/*!40000 ALTER TABLE `oc_circles_circle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_event`
--

DROP TABLE IF EXISTS `oc_circles_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_event` (
  `token` varchar(63) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `event` longtext DEFAULT NULL,
  `result` longtext DEFAULT NULL,
  `interface` int(11) NOT NULL DEFAULT 0,
  `severity` int(11) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `creation` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`token`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_event`
--

LOCK TABLES `oc_circles_event` WRITE;
/*!40000 ALTER TABLE `oc_circles_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_member`
--

DROP TABLE IF EXISTS `oc_circles_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `single_id` varchar(31) DEFAULT NULL,
  `circle_id` varchar(31) NOT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `user_id` varchar(127) NOT NULL,
  `user_type` smallint(6) NOT NULL DEFAULT 1,
  `instance` varchar(255) DEFAULT '',
  `invited_by` varchar(31) DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `cached_name` varchar(255) DEFAULT '',
  `cached_update` datetime DEFAULT NULL,
  `contact_id` varchar(127) DEFAULT NULL,
  `contact_meta` longtext DEFAULT NULL,
  `joined` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_member_cisiuiutil` (`circle_id`,`single_id`,`user_id`,`user_type`,`instance`,`level`),
  KEY `circles_member_cisi` (`circle_id`,`single_id`),
  KEY `IDX_25C66A49E7A1254A` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES (1,'Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm','Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm','Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm','circles',10000,'',NULL,9,'Member','[]','Circles','2024-04-25 10:28:28','',NULL,'2024-04-25 10:28:28'),(2,'qml9w9oU6zY3n2M7mmtWWlVDjH9qZMj','qml9w9oU6zY3n2M7mmtWWlVDjH9qZMj','qml9w9oU6zY3n2M7mmtWWlVDjH9qZMj','rbmk2324',1,'','Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm',9,'Member','[]','rbmk2324','2024-04-25 10:28:28','',NULL,'2024-04-25 10:28:28'),(3,'Z3YmcA59uprj4khDvCHX7TpOG7TJguF','Z3YmcA59uprj4khDvCHX7TpOG7TJguF','Z3YmcA59uprj4khDvCHX7TpOG7TJguF','xander',1,'','Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm',9,'Member','[]','xander','2024-04-25 16:01:24','',NULL,'2024-04-25 16:01:24');
/*!40000 ALTER TABLE `oc_circles_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_membership`
--

DROP TABLE IF EXISTS `oc_circles_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_membership` (
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `inheritance_first` varchar(31) NOT NULL,
  `inheritance_last` varchar(31) NOT NULL,
  `inheritance_depth` int(10) unsigned NOT NULL,
  `inheritance_path` longtext NOT NULL,
  PRIMARY KEY (`single_id`,`circle_id`),
  KEY `IDX_8FC816EAE7C1D92B` (`single_id`),
  KEY `circles_membership_ifilci` (`inheritance_first`,`inheritance_last`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_membership`
--

LOCK TABLES `oc_circles_membership` WRITE;
/*!40000 ALTER TABLE `oc_circles_membership` DISABLE KEYS */;
INSERT INTO `oc_circles_membership` VALUES ('Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm','Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm',9,'Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm','Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm',1,'[\"Nh6Ud11IzhfuKlte2oa347Pp5zI2Qhm\"]'),('Z3YmcA59uprj4khDvCHX7TpOG7TJguF','Z3YmcA59uprj4khDvCHX7TpOG7TJguF',9,'Z3YmcA59uprj4khDvCHX7TpOG7TJguF','Z3YmcA59uprj4khDvCHX7TpOG7TJguF',1,'[\"Z3YmcA59uprj4khDvCHX7TpOG7TJguF\"]'),('qml9w9oU6zY3n2M7mmtWWlVDjH9qZMj','qml9w9oU6zY3n2M7mmtWWlVDjH9qZMj',9,'qml9w9oU6zY3n2M7mmtWWlVDjH9qZMj','qml9w9oU6zY3n2M7mmtWWlVDjH9qZMj',1,'[\"qml9w9oU6zY3n2M7mmtWWlVDjH9qZMj\"]');
/*!40000 ALTER TABLE `oc_circles_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mount`
--

DROP TABLE IF EXISTS `oc_circles_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `token` varchar(63) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mount_cimipt` (`circle_id`,`mount_id`,`parent`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mount`
--

LOCK TABLES `oc_circles_mount` WRITE;
/*!40000 ALTER TABLE `oc_circles_mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mountpoint`
--

DROP TABLE IF EXISTS `oc_circles_mountpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mountpoint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mountpoint_ms` (`mount_id`,`single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mountpoint`
--

LOCK TABLES `oc_circles_mountpoint` WRITE;
/*!40000 ALTER TABLE `oc_circles_mountpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mountpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_remote`
--

DROP TABLE IF EXISTS `oc_circles_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_remote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT 'Unknown',
  `interface` int(11) NOT NULL DEFAULT 0,
  `uid` varchar(20) DEFAULT NULL,
  `instance` varchar(127) DEFAULT NULL,
  `href` varchar(254) DEFAULT NULL,
  `item` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F94EF834230B1DE` (`instance`),
  KEY `IDX_F94EF83539B0606` (`uid`),
  KEY `IDX_F94EF8334F8E741` (`href`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_remote`
--

LOCK TABLES `oc_circles_remote` WRITE;
/*!40000 ALTER TABLE `oc_circles_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_share_lock`
--

DROP TABLE IF EXISTS `oc_circles_share_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_share_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `instance` varchar(127) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_337F52F8126F525E70EE2FF6` (`item_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_share_lock`
--

LOCK TABLES `oc_circles_share_lock` WRITE;
/*!40000 ALTER TABLE `oc_circles_share_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_share_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_token`
--

DROP TABLE IF EXISTS `oc_circles_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) DEFAULT NULL,
  `circle_id` varchar(31) DEFAULT NULL,
  `single_id` varchar(31) DEFAULT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `token` varchar(31) DEFAULT NULL,
  `password` varchar(127) DEFAULT NULL,
  `accepted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sicisimit` (`share_id`,`circle_id`,`single_id`,`member_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_token`
--

LOCK TABLES `oc_circles_token` WRITE;
/*!40000 ALTER TABLE `oc_circles_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_accesscache`
--

DROP TABLE IF EXISTS `oc_collres_accesscache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_accesscache` (
  `user_id` varchar(64) NOT NULL,
  `collection_id` bigint(20) NOT NULL DEFAULT 0,
  `resource_type` varchar(64) NOT NULL DEFAULT '',
  `resource_id` varchar(64) NOT NULL DEFAULT '',
  `access` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`user_id`,`collection_id`,`resource_type`,`resource_id`),
  KEY `collres_user_res` (`user_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_accesscache`
--

LOCK TABLES `oc_collres_accesscache` WRITE;
/*!40000 ALTER TABLE `oc_collres_accesscache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_accesscache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_collections`
--

DROP TABLE IF EXISTS `oc_collres_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_collections`
--

LOCK TABLES `oc_collres_collections` WRITE;
/*!40000 ALTER TABLE `oc_collres_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_resources`
--

DROP TABLE IF EXISTS `oc_collres_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_resources` (
  `collection_id` bigint(20) NOT NULL,
  `resource_type` varchar(64) NOT NULL,
  `resource_id` varchar(64) NOT NULL,
  PRIMARY KEY (`collection_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_resources`
--

LOCK TABLES `oc_collres_resources` WRITE;
/*!40000 ALTER TABLE `oc_collres_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `topmost_parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `children_count` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `message` longtext DEFAULT NULL,
  `verb` varchar(64) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `reference_id` varchar(64) DEFAULT NULL,
  `reactions` varchar(4000) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `meta_data` longtext DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`),
  KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`),
  KEY `comments_actor_index` (`actor_type`,`actor_id`),
  KEY `expire_date` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments`
--

LOCK TABLES `oc_comments` WRITE;
/*!40000 ALTER TABLE `oc_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments_read_markers` (
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`object_type`,`object_id`),
  KEY `comments_marker_object_index` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments_read_markers`
--

LOCK TABLES `oc_comments_read_markers` WRITE;
/*!40000 ALTER TABLE `oc_comments_read_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments_read_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_absence`
--

DROP TABLE IF EXISTS `oc_dav_absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_absence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `first_day` varchar(10) NOT NULL,
  `last_day` varchar(10) NOT NULL,
  `status` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_absence_uid_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_absence`
--

LOCK TABLES `oc_dav_absence` WRITE;
/*!40000 ALTER TABLE `oc_dav_absence` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_cal_proxy`
--

DROP TABLE IF EXISTS `oc_dav_cal_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_cal_proxy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(64) NOT NULL,
  `proxy_id` varchar(64) NOT NULL,
  `permissions` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_cal_proxy_uidx` (`owner_id`,`proxy_id`,`permissions`),
  KEY `dav_cal_proxy_ipid` (`proxy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_cal_proxy`
--

LOCK TABLES `oc_dav_cal_proxy` WRITE;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` bigint(20) unsigned NOT NULL,
  `publicuri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`,`publicuri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_shares`
--

LOCK TABLES `oc_dav_shares` WRITE;
/*!40000 ALTER TABLE `oc_dav_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_direct_edit`
--

DROP TABLE IF EXISTS `oc_direct_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_direct_edit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `editor_id` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `share_id` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `accessed` tinyint(1) DEFAULT 0,
  `file_path` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4D5AFECA5F37A13B` (`token`),
  KEY `direct_edit_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_direct_edit`
--

LOCK TABLES `oc_direct_edit` WRITE;
/*!40000 ALTER TABLE `oc_direct_edit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_direct_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_directlink`
--

DROP TABLE IF EXISTS `oc_directlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_directlink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `token` varchar(60) DEFAULT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directlink_token_idx` (`token`),
  KEY `directlink_expiration_idx` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_directlink`
--

LOCK TABLES `oc_directlink` WRITE;
/*!40000 ALTER TABLE `oc_directlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_directlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_federated_reshares` (
  `share_id` bigint(20) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_federated_reshares`
--

LOCK TABLES `oc_federated_reshares` WRITE;
/*!40000 ALTER TABLE `oc_federated_reshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_federated_reshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_locks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lock` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lock_key_index` (`key`),
  KEY `lock_ttl_index` (`ttl`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES (1,0,'files/00d303f083a0e12e22aeedf18cfea27a',1714044596),(2,0,'files/4a49de377fd7cff58cd9cd987dde649f',1714044555),(4,0,'files/aa94191ffc23418ba5da65e266cf3f14',1714044565),(5,0,'files/d2ad44fc03bd23a064fa8097650b8d5b',1714044565),(7,0,'files/23fdab8079cb3da603f7e5b8d940a9f9',1714044565),(8,0,'files/a8f38aa6407b622bd7430e3183129ed4',1714044565),(9,0,'files/8840f3cc243353a4fdf2e98b41ec7cea',1714044565),(10,0,'files/cafd53de3a0703409272b64406141031',1714044565),(11,0,'files/876c13e408b37e6c12157ebb396c1961',1714044565),(12,0,'files/e333cd6822beb88d11fcac7223b573b7',1714044565),(13,0,'files/137331fb5acd2ebbf1ee562569c2e05a',1714044565),(14,0,'files/7a7149220a4eb5adfeaf63533301a742',1714044565),(15,0,'files/97f5e6d2521c1f355c409a13e7aa8a4c',1714044565),(16,0,'files/3e7c6d996e2ea2f16e9503d3d299b8b8',1714044565),(17,0,'files/cf73a2f742fcc6eebe3188c942b63838',1714044565),(18,0,'files/8ed76e7b9dabd048fcfbf5b6e50abdef',1714044565),(19,0,'files/e393430c11e5f339bd635f388772facd',1714044565),(20,0,'files/1cfbe173f93561d4587ef91c1acb8eb3',1714044565),(21,0,'files/3d1ede320a457f8a69d4c0a0723ff03e',1714044565),(22,0,'files/32fda2f0034f2c81bf190989743eba7b',1714044565),(23,0,'files/23b2e295c9ccc60592e257faee003255',1714044565),(24,0,'files/a61a514b62ee6ef6edc7595a04294eb6',1714044565),(25,0,'files/d2c38e0c500456ed521612ed383afbd2',1714044565),(26,0,'files/4038abb542c742b78fa858b107e63cd6',1714044565),(27,0,'files/725498019d77b4d7359c01ce88aa0961',1714044565),(28,0,'files/3ec81d7f458fa5444156dfcf7c915864',1714044565),(29,0,'files/dfcfc889f2057aaf9f065b9f1cd9e4e7',1714044565),(30,0,'files/0e3bfbf465f880e064bbf99e44f054c2',1714044565),(31,0,'files/48f042fea07417c50b27e1d79f345644',1714044565),(32,0,'files/1800cf73d86ba2d277092ccac58b24da',1714044565),(33,0,'files/0d510efa2714ccae4b16c479b718ed7b',1714044565),(34,0,'files/f7a103a63ed7c236b6b77d47cb078870',1714044565),(35,0,'files/7218352eaea31fcacb5006db8c772813',1714044596),(37,0,'files/3bd372811d162a1bb3fd90446bde3b67',1714044596),(38,0,'files/932115b00cc5ae7a043260365b1e32d2',1714044596),(39,0,'files/44bb5b99055776aa98f3c8d1dd4babdc',1714044597),(40,0,'files/ec7f1417a9df7cf9e4b0111dfea12285',1714044597),(41,0,'files/153bc3d65a2453e2622259db4a3026dc',1714044597),(42,0,'files/cab8dc0c7f833ab831e066368fde575d',1714044597),(43,0,'files/a1f9418f601495299faf4176e9084dbb',1714044597),(44,0,'files/6e250d49fec1b25a40b432fc67db33cd',1714044597),(45,0,'files/95b2e8fccb0d79f38de445c3a807f6dc',1714044597),(46,0,'files/4459cbd65f26a61b7ea8101464619999',1714044597),(47,0,'files/20a3df87a14289e589fb6f0629e1e69b',1714044597),(48,0,'files/7f1c5c0e59b203fd07695a9319b40d25',1714044597),(49,0,'files/32b09e5ff0a7fa94f483cadf4dd0d116',1714044597),(50,0,'files/9ef180c2393b8c904fb28194dd60a1c0',1714044598),(51,0,'files/09ba9dbf0419a0f041225ebbf014793a',1714044598),(52,0,'files/7cfc3e8cb9fdb3baf8bdec9d4f22f29c',1714064118),(53,0,'files/dac07d3b696198fcca317080363b946f',1714064118),(54,0,'files/8b2897113fc13421edbea1b38b9ccef6',1714064118),(55,0,'files/3c45b7bca72bc71323b1e7d96edbf3fa',1714064118),(56,0,'files/ad56bdd878889a3bee223b1b9236e77d',1714064118),(57,0,'files/e02895c85b55edb8ff437f1cbd3c5e72',1714064118),(58,0,'files/1b63acb9582d6f0d8d9705455c01b89b',1714064484),(59,0,'files/245d6d8869d31352d814e947c1a7c197',1714064484);
/*!40000 ALTER TABLE `oc_file_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache` (
  `fileid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage` bigint(20) NOT NULL DEFAULT 0,
  `path` varchar(4000) DEFAULT NULL,
  `path_hash` varchar(32) NOT NULL DEFAULT '',
  `parent` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(250) DEFAULT NULL,
  `mimetype` bigint(20) NOT NULL DEFAULT 0,
  `mimepart` bigint(20) NOT NULL DEFAULT 0,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `mtime` bigint(20) NOT NULL DEFAULT 0,
  `storage_mtime` bigint(20) NOT NULL DEFAULT 0,
  `encrypted` int(11) NOT NULL DEFAULT 0,
  `unencrypted_size` bigint(20) NOT NULL DEFAULT 0,
  `etag` varchar(40) DEFAULT NULL,
  `permissions` int(11) DEFAULT 0,
  `checksum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`),
  KEY `fs_id_storage_size` (`fileid`,`storage`,`size`),
  KEY `fs_parent` (`parent`),
  KEY `fs_mtime` (`mtime`),
  KEY `fs_size` (`size`),
  KEY `fs_storage_path_prefix` (`storage`,`path`(64))
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,38784812,1714042521,1714042521,0,0,'662a3699dc8c1',23,''),(2,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',2,1,38784812,1714040916,1714040914,0,0,'662a305452762',31,''),(3,1,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',2,'Documents',2,1,1108865,1714040910,1714040909,0,0,'662a304e04821',31,''),(4,1,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',3,'Nextcloud flyer.pdf',4,3,1083339,1714040909,1714040909,0,0,'8cd7f0d6ae5750f25f7210c9cc95c03a',27,''),(5,1,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',3,'Example.md',6,5,1095,1714040909,1714040909,0,0,'13c761074c84878e716351adc9f8ea19',27,''),(6,1,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',3,'Welcome to Nextcloud Hub.docx',7,3,24295,1714040909,1714040909,0,0,'ce827c9bb46361005672c29d722cb958',27,''),(7,1,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',3,'Readme.md',6,5,136,1714040910,1714040910,0,0,'ed9900be2f4deef7b9816717ce3d5347',27,''),(8,1,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',2,'Nextcloud Manual.pdf',4,3,16305464,1714040910,1714040910,0,0,'5ddca419bf2b4a483351053332e8b948',27,''),(9,1,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',2,'Nextcloud.png',9,8,50598,1714040910,1714040910,0,0,'064b5e49e0a06c19dbbd7892473a2242',27,''),(10,1,'files/Templates','530b342d0b8164ff3b4754c2273a453e',2,'Templates',2,1,10721152,1714040914,1714040913,0,0,'662a30520d03c',31,''),(11,1,'files/Templates/Org chart.odg','fd846bc062b158abb99a75a5b33b53e7',10,'Org chart.odg',10,3,13878,1714040910,1714040910,0,0,'bf58b9889e9e79212ac4d0e422a5f239',27,''),(12,1,'files/Templates/Party invitation.odt','439f95f734be87868374b1a5a312c550',10,'Party invitation.odt',11,3,868111,1714040910,1714040910,0,0,'b632ecf72dcd7b0cfe004723d2222e80',27,''),(13,1,'files/Templates/Product plan.md','a9fbf58bf31cebb8143f7ad3a5205633',10,'Product plan.md',6,5,573,1714040910,1714040910,0,0,'5f8fc0523cc9a2c1c7361c8be62c53e4',27,''),(14,1,'files/Templates/Mother\'s day.odt','cb66c617dbb4acc9b534ec095c400b53',10,'Mother\'s day.odt',11,3,340061,1714040911,1714040911,0,0,'7dcbe86a082d9ba518c014466432b2e8',27,''),(15,1,'files/Templates/Letter.odt','15545ade0e9863c98f3a5cc0fbf2836a',10,'Letter.odt',11,3,15961,1714040911,1714040911,0,0,'3e6c21c82cebecf83516195033b3f70c',27,''),(16,1,'files/Templates/Timesheet.ods','cb79c81e41d3c3c77cd31576dc7f1a3a',10,'Timesheet.ods',12,3,88394,1714040911,1714040911,0,0,'0414913d8e7894cad507421e4f63e5fb',27,''),(17,1,'files/Templates/Meeting notes.md','c0279758bb570afdcdbc2471b2f16285',10,'Meeting notes.md',6,5,326,1714040911,1714040911,0,0,'65bd62860545e74d8168ec5c142753d1',27,''),(18,1,'files/Templates/Photo book.odt','ea35993988e2799424fef3ff4f420c24',10,'Photo book.odt',11,3,5155877,1714040911,1714040911,0,0,'662c3a9649feb963bb5ca3b504fd6377',27,''),(19,1,'files/Templates/Mindmap.odg','74cff798fc1b9634ee45380599b2a6da',10,'Mindmap.odg',10,3,13653,1714040911,1714040911,0,0,'89b9256e0ff46c83685578a0b73b433d',27,''),(20,1,'files/Templates/Elegant.odp','f3ec70ed694c0ca215f094b98eb046a7',10,'Elegant.odp',13,3,14316,1714040911,1714040911,0,0,'f588a5f1aef48f9ff9986f5d4cfbaf3f',27,''),(21,1,'files/Templates/Resume.odt','ace8f81202eadb2f0c15ba6ecc2539f5',10,'Resume.odt',11,3,39404,1714040912,1714040912,0,0,'4ebab79f0a1c90f4a48986aa30e5ef11',27,''),(22,1,'files/Templates/SWOT analysis.whiteboard','3fd0e44b3e6f0e7144442ef6fc71a663',10,'SWOT analysis.whiteboard',14,3,38605,1714040912,1714040912,0,0,'4ceac56f5e6e1515aa9c24bb7bd97108',27,''),(23,1,'files/Templates/Expense report.ods','d0a4025621279b95d2f94ff4ec09eab3',10,'Expense report.ods',12,3,13441,1714040912,1714040912,0,0,'3deb3cc40cb97c424205720fcf3a38d4',27,''),(24,1,'files/Templates/Modern company.odp','96ad2c06ebb6a79bcdf2f4030421dee3',10,'Modern company.odp',13,3,317015,1714040912,1714040912,0,0,'c0ee685e71173595154b1291f71878f3',27,''),(25,1,'files/Templates/Simple.odp','a2c90ff606d31419d699b0b437969c61',10,'Simple.odp',13,3,14810,1714040912,1714040912,0,0,'0998a6fcbe05a296aa62559226aab657',27,''),(26,1,'files/Templates/Business model canvas.ods','86c10a47dedf156bf4431cb75e0f76ec',10,'Business model canvas.ods',12,3,52843,1714040912,1714040912,0,0,'c493dc7484cd5001eb6b17012421f582',27,''),(27,1,'files/Templates/Invoice.odt','40fdccb51b6c3e3cf20532e06ed5016e',10,'Invoice.odt',11,3,17276,1714040912,1714040912,0,0,'bfd7eb1ba875e2233ecac376e121c3bd',27,''),(28,1,'files/Templates/Flowchart.odg','832942849155883ceddc6f3cede21867',10,'Flowchart.odg',10,3,11836,1714040913,1714040913,0,0,'8d88bd53bedab4aea1670ad2bc3c3ca4',27,''),(29,1,'files/Templates/Syllabus.odt','03b3147e6dae00674c1d50fe22bb8496',10,'Syllabus.odt',11,3,30354,1714040913,1714040913,0,0,'22e141816ed6043dc6f641d9f9c52d53',27,''),(30,1,'files/Templates/Gotong royong.odp','14b958f5aafb7cfd703090226f3cbd1b',10,'Gotong royong.odp',13,3,3509628,1714040913,1714040913,0,0,'a69ddffc1bd330f285e4190eb46ecc37',27,''),(31,1,'files/Templates/Business model canvas.odg','6a8f3e02bdf45c8b0671967969393bcb',10,'Business model canvas.odg',10,3,16988,1714040913,1714040913,0,0,'67c07ff33fb64ff40ceaa677cb936074',27,''),(32,1,'files/Templates/Impact effort matrix.whiteboard','c5e3b589ec8f9dd6afdebe0ac6feeac8',10,'Impact effort matrix.whiteboard',14,3,52674,1714040913,1714040913,0,0,'4c4cc60153a0989be2f44c40419e9710',27,''),(33,1,'files/Templates/Yellow idea.odp','3a57051288d7b81bef3196a2123f4af5',10,'Yellow idea.odp',13,3,81196,1714040913,1714040913,0,0,'6621545cc233e1ca9b6212f52e7d11c4',27,''),(34,1,'files/Templates/Diagram & table.ods','0a89f154655f6d4a0098bc4e6ca87367',10,'Diagram & table.ods',12,3,13378,1714040913,1714040913,0,0,'364560ed4aa6789666e7cee8a4dd70c4',27,''),(35,1,'files/Templates/Readme.md','71fa2e74ab30f39eed525572ccc3bbec',10,'Readme.md',6,5,554,1714040914,1714040914,0,0,'4a5766fd682f1d762e9301cc6da6e873',27,''),(36,1,'files/Templates credits.md','f7c01e3e0b55bb895e09dc08d19375b3',2,'Templates credits.md',6,5,2403,1714040914,1714040914,0,0,'80bbe091ac3b0338dd0e8ed5dbb85983',27,''),(37,1,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',2,'Reasons to use Nextcloud.pdf',4,3,976625,1714040914,1714040914,0,0,'9b8921fbb805f1912a3c94e0c9757c64',27,''),(38,1,'files/Readme.md','49af83716f8dcbfa89aaf835241c0b9f',2,'Readme.md',6,5,206,1714040914,1714040914,0,0,'5de1798e1754c87102d6c3f8d1d1bc2a',27,''),(39,1,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',2,'Nextcloud intro.mp4',16,15,3963036,1714040914,1714040914,0,0,'c1047c03263efa407c43f8a9e09708ba',27,''),(40,1,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',2,'Photos',2,1,5656463,1714040916,1714040916,0,0,'662a305452762',31,''),(41,1,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',40,'Frog.jpg',17,8,457744,1714040914,1714040914,0,0,'d7a3620fa693dbc28960b182a03d1c7b',27,''),(42,1,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',40,'Nextcloud community.jpg',17,8,797325,1714040915,1714040915,0,0,'7a8559376b4b2b2899e866be6f99dcd3',27,''),(43,1,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',40,'Library.jpg',17,8,2170375,1714040915,1714040915,0,0,'a4fbaffe60a55c581e098187fb2f1de1',27,''),(44,1,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',40,'Birdie.jpg',17,8,593508,1714040915,1714040915,0,0,'818cd69d8aed5dbe93784e2303101f74',27,''),(45,1,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',40,'Toucan.jpg',17,8,167989,1714040915,1714040915,0,0,'b8d74f2fb2202de2a53332ac7590a3e7',27,''),(46,1,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',40,'Vineyard.jpg',17,8,427030,1714040915,1714040915,0,0,'add0695312d77827342f76dc28a86259',27,''),(47,1,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',40,'Steps.jpg',17,8,567689,1714040915,1714040915,0,0,'1d6926b00ac9532c9b14f624be4bcd8f',27,''),(48,1,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',40,'Readme.md',6,5,150,1714040916,1714040916,0,0,'59678c8601edb08c994049c1bee20e0d',27,''),(49,1,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',40,'Gorilla.jpg',17,8,474653,1714040916,1714040916,0,0,'49f60dd158d2c0c3fa58cd32792e2075',27,''),(50,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,0,1714040955,1714040955,0,0,'662a307b1be1e',23,''),(51,2,'appdata_oczftcjq3340','73eed58046679f1f1a960361d84676ea',50,'appdata_oczftcjq3340',2,1,0,1714040965,1714040965,0,0,'662a3078d1453',31,''),(52,2,'appdata_oczftcjq3340/js','d603911c13082d03904dad2ecf7cefa4',51,'js',2,1,0,1714040952,1714040952,0,0,'662a3078da229',31,''),(53,2,'appdata_oczftcjq3340/js/core','86bea80ca9bd8d9259cf4eb6f0f59f50',52,'core',2,1,0,1714040953,1714040953,0,0,'662a3078df800',31,''),(54,2,'appdata_oczftcjq3340/js/core/merged-template-prepend.js','c6cd946d78dcaf70d8817a7830e78a44',53,'merged-template-prepend.js',18,3,12288,1714040952,1714040952,0,0,'b6d0b1657cc01929402cbf46eecaf76b',27,''),(55,2,'appdata_oczftcjq3340/js/core/merged-template-prepend.js.deps','fc676348f7301d41ccbcbbf68c026896',53,'merged-template-prepend.js.deps',14,3,266,1714040952,1714040952,0,0,'edc86360215f06ececb95baebff3c88a',27,''),(56,2,'appdata_oczftcjq3340/js/core/merged-template-prepend.js.gzip','71eb86b2fc6f5593dc2e8802fe6f7aa5',53,'merged-template-prepend.js.gzip',19,3,3130,1714040953,1714040953,0,0,'ffd8bb37fa839081f97b9c72e6a31c7b',27,''),(57,2,'appdata_oczftcjq3340/theming','9451df7c0a5d15d48872861551c1a334',51,'theming',2,1,0,1714040953,1714040953,0,0,'662a307914ead',31,''),(58,2,'appdata_oczftcjq3340/theming/global','ffae5e8dcb36c3f13683502fa5e5d205',57,'global',2,1,0,1714040953,1714040953,0,0,'662a30791c625',31,''),(59,2,'appdata_oczftcjq3340/appstore','766c1249122c90910136f7bb194353e3',51,'appstore',2,1,0,1714040955,1714040955,0,0,'662a307b055dd',31,''),(60,2,'appdata_oczftcjq3340/avatar','c33f6f4da131b525ed20dbab58219992',51,'avatar',2,1,0,1714060883,1714060883,0,0,'662a3084e1190',31,''),(61,2,'appdata_oczftcjq3340/avatar/rbmk2324','d3685039c72ceb8cd4328a10f1dafc89',60,'rbmk2324',2,1,0,1714040965,1714040965,0,0,'662a3084e56bb',31,''),(62,2,'appdata_oczftcjq3340/avatar/rbmk2324/avatar.png','a35883439665fef0b9ce2240807f62b0',61,'avatar.png',9,8,13546,1714040965,1714040965,0,0,'85be99be09fcde65c422a5acd3e2fbc0',27,''),(63,2,'appdata_oczftcjq3340/avatar/rbmk2324/generated','b18f57cec5807bdb5353e08d85dcd33d',61,'generated',14,3,0,1714040965,1714040965,0,0,'10ea434c05aab8629ba4d746f1b0f29e',27,''),(64,2,'appdata_oczftcjq3340/preview','c630ba04dbcddf81c002dc217db543f8',51,'preview',2,1,0,1714040965,1714040965,0,0,'662a30855329e',31,''),(65,2,'appdata_oczftcjq3340/avatar/rbmk2324/avatar.64.png','3932af5b94d36d178ccb2d15d9ea8ac2',61,'avatar.64.png',9,8,741,1714040965,1714040965,0,0,'5afed32976e63d8fa92874ca7ee9f6ce',27,''),(66,2,'appdata_oczftcjq3340/preview/6','8a527734eef3f566ff389131f24bc635',64,'6',2,1,-1,1714040965,1714040965,0,0,'662a3085698a7',31,''),(67,2,'appdata_oczftcjq3340/preview/f','8b1a825f7f8f06279a4123b0aa5cf8e0',64,'f',2,1,-1,1714040965,1714040965,0,0,'662a308569fac',31,''),(68,2,'appdata_oczftcjq3340/preview/6/4','f4ca8ef3beaa0d039d21709df76f5f80',66,'4',2,1,-1,1714040965,1714040965,0,0,'662a308567e3f',31,''),(69,2,'appdata_oczftcjq3340/preview/f/4','920ee7e9eabc67626b8074a22b9fd0dc',67,'4',2,1,-1,1714040965,1714040965,0,0,'662a3085679a2',31,''),(70,2,'appdata_oczftcjq3340/preview/6/4/2','7eb9bbe3a6e5b7dcde91422bee4f4ee0',68,'2',2,1,-1,1714040965,1714040965,0,0,'662a3085665f3',31,''),(71,2,'appdata_oczftcjq3340/preview/1','1a67f57aa0080d9a4c80265da5dee5cb',64,'1',2,1,-1,1714040965,1714040965,0,0,'662a30856dcd7',31,''),(72,2,'appdata_oczftcjq3340/preview/6/4/2/e','f7cc0f3abbec35adf7d652919d6f50f3',70,'e',2,1,-1,1714040965,1714040965,0,0,'662a3085652c0',31,''),(73,2,'appdata_oczftcjq3340/preview/f/4/5','3575a26101afc18fb71c5621c1001974',69,'5',2,1,-1,1714040965,1714040965,0,0,'662a308565ef4',31,''),(74,2,'appdata_oczftcjq3340/preview/1/7','ad3b29038d5f2e533db42cdead650b72',71,'7',2,1,-1,1714040965,1714040965,0,0,'662a308568d7d',31,''),(75,2,'appdata_oczftcjq3340/preview/6/4/2/e/9','1ee0cccaacf2a0aabd39cb2ad320535e',72,'9',2,1,-1,1714040965,1714040965,0,0,'662a3085628a2',31,''),(76,2,'appdata_oczftcjq3340/preview/f/4/5/7','0aa229fc31d3eed2f68cae9722c575fa',73,'7',2,1,-1,1714040965,1714040965,0,0,'662a30856369d',31,''),(77,2,'appdata_oczftcjq3340/preview/1/7/e','376bf774baddec38b251d9e3758ad304',74,'e',2,1,-1,1714040965,1714040965,0,0,'662a308566d37',31,''),(78,2,'appdata_oczftcjq3340/preview/6/4/2/e/9/2','38a13f53fb7de8f3e883baf9d5d444e1',75,'2',2,1,-1,1714040965,1714040965,0,0,'662a308560e03',31,''),(79,2,'appdata_oczftcjq3340/preview/f/4/5/7/c','a9a9bb8ac26a0e138819ded01ce591f1',76,'c',2,1,-1,1714040965,1714040965,0,0,'662a30856130a',31,''),(80,2,'appdata_oczftcjq3340/preview/1/7/e/6','db9ad4b74e57f0639005e2658bea6f07',77,'6',2,1,-1,1714040965,1714040965,0,0,'662a308564cd7',31,''),(81,2,'appdata_oczftcjq3340/preview/6/4/2/e/9/2/e','7cbb9c9bfbb7e2893f05ceecd680f68e',78,'e',2,1,-1,1714040965,1714040965,0,0,'662a30855e87a',31,''),(82,2,'appdata_oczftcjq3340/preview/f/4/5/7/c/5','b393cf79f9d25a9de1186aeda578da1a',79,'5',2,1,-1,1714040965,1714040965,0,0,'662a30855f58b',31,''),(83,2,'appdata_oczftcjq3340/preview/a','ef3106b11e3247764217f356c8116fae',64,'a',2,1,-1,1714040965,1714040965,0,0,'662a308579e9c',31,''),(84,2,'appdata_oczftcjq3340/preview/1/7/e/6/2','43ecf0a67f5b4d18beaf805197de21f4',80,'2',2,1,-1,1714040965,1714040965,0,0,'662a308561e90',31,''),(85,2,'appdata_oczftcjq3340/preview/6/4/2/e/9/2/e/48','2b6702b9eb6d87b9d5fe79224d422ede',81,'48',2,1,0,1714040998,1714040998,0,0,'662a30855ca0b',31,''),(86,2,'appdata_oczftcjq3340/preview/1/7/e/6/2/1','591339d81501f43c3521d7b45d3c8e31',84,'1',2,1,-1,1714040965,1714040965,0,0,'662a3085606ad',31,''),(87,2,'appdata_oczftcjq3340/preview/f/4/5/7/c/5/4','dc51ad8fe2186e49c7d55e51dfd821f3',82,'4',2,1,-1,1714040965,1714040965,0,0,'662a30855ccde',31,''),(88,2,'appdata_oczftcjq3340/preview/a/1','d96dda66afbc5f4e76f90aa1a51e4596',83,'1',2,1,-1,1714040965,1714040965,0,0,'662a308576cd0',31,''),(89,2,'appdata_oczftcjq3340/preview/1/7/e/6/2/1/6','25c5d1990dc206f9d0d81eafcd0c7f82',86,'6',2,1,-1,1714040965,1714040965,0,0,'662a30855cb08',31,''),(90,2,'appdata_oczftcjq3340/preview/a/1/d','2dff5166cb8e2a0052f1a09ddbf8579d',88,'d',2,1,-1,1714040965,1714040965,0,0,'662a308573d4a',31,''),(91,2,'appdata_oczftcjq3340/preview/f/4/5/7/c/5/4/49','5d1d5d36903640ca79bf408e9c223359',87,'49',2,1,0,1714040997,1714040997,0,0,'662a30855aca5',31,''),(92,2,'appdata_oczftcjq3340/preview/1/7/e/6/2/1/6/43','ffc15adab3a20eda787ee2b4f40a6a08',89,'43',2,1,0,1714040997,1714040997,0,0,'662a308558e30',31,''),(93,2,'appdata_oczftcjq3340/preview/a/1/d/0','2350b713ae8c44247c8ea28b3507c4e8',90,'0',2,1,-1,1714040965,1714040965,0,0,'662a3085717b5',31,''),(94,2,'appdata_oczftcjq3340/preview/a/1/d/0/c','04444d34f2f6ff737baba0e5af32388d',93,'c',2,1,-1,1714040965,1714040965,0,0,'662a30856f79a',31,''),(95,2,'appdata_oczftcjq3340/preview/a/1/d/0/c/6','d7af3c35990074c4df42867304ac267e',94,'6',2,1,-1,1714040965,1714040965,0,0,'662a30856d310',31,''),(96,2,'appdata_oczftcjq3340/preview/a/1/d/0/c/6/e','4ab39ac9fd84c3f84f7969eca31c59da',95,'e',2,1,-1,1714040965,1714040965,0,0,'662a308569e79',31,''),(97,2,'appdata_oczftcjq3340/preview/a/1/d/0/c/6/e/42','c252540fa5c9a39da8c5aa63de991c80',96,'42',2,1,0,1714040998,1714040998,0,0,'662a30856711d',31,''),(98,2,'appdata_oczftcjq3340/preview/6/c','67aa4fa0ff400a55275d0735b123a1e2',66,'c',2,1,-1,1714040997,1714040997,0,0,'662a30a50bb6b',31,''),(99,2,'appdata_oczftcjq3340/preview/6/c/8','c82c9915fc93e3179d923fcb474bf694',98,'8',2,1,-1,1714040997,1714040997,0,0,'662a30a50aa0f',31,''),(100,2,'appdata_oczftcjq3340/preview/6/c/8/3','aa2be3e4505369353386fe3bd26193cc',99,'3',2,1,-1,1714040997,1714040997,0,0,'662a30a509c72',31,''),(101,2,'appdata_oczftcjq3340/preview/6/c/8/3/4','f318289e7fa128cd3cc2be06d02e18b7',100,'4',2,1,-1,1714040997,1714040997,0,0,'662a30a508be7',31,''),(102,2,'appdata_oczftcjq3340/preview/6/c/8/3/4/9','8628be68b9972d643b9e58bb4105976f',101,'9',2,1,-1,1714040997,1714040997,0,0,'662a30a507c48',31,''),(103,2,'appdata_oczftcjq3340/preview/6/c/8/3/4/9/c','d864637a3a58cab517ae8d74f9c75ed8',102,'c',2,1,-1,1714040997,1714040997,0,0,'662a30a506cda',31,''),(104,2,'appdata_oczftcjq3340/preview/6/c/8/3/4/9/c/45','02bf61bf9c2857c01f2f490ae8371569',103,'45',2,1,0,1714040997,1714040997,0,0,'662a30a506109',31,''),(105,2,'appdata_oczftcjq3340/preview/f/4/5/7/c/5/4/49/1600-1067-max.jpg','3cd199eb9492ae20e550d6d1ffd1be6e',91,'1600-1067-max.jpg',17,8,232378,1714040997,1714040997,0,0,'7b91a805934aae57585048699b756890',27,''),(106,2,'appdata_oczftcjq3340/preview/6/4/2/e/9/2/e/48/4096-4096-max.png','e7a1796407b3fe94e1a9c1f6c68c2263',85,'4096-4096-max.png',9,8,37125,1714040997,1714040997,0,0,'f9ac3c78701957f876781559277021f9',27,''),(107,2,'appdata_oczftcjq3340/preview/6/c/8/3/4/9/c/45/1600-1067-max.jpg','f22b7d5c4ec6c47dd273967f2762ffaf',104,'1600-1067-max.jpg',17,8,137923,1714040997,1714040997,0,0,'f2ed99b9c3339f5c1320e49fc5bd5444',27,''),(108,2,'appdata_oczftcjq3340/preview/1/7/e/6/2/1/6/43/1600-1066-max.jpg','07e7c8fb4245a7b1e07dcffdf488ed78',92,'1600-1066-max.jpg',17,8,351167,1714040997,1714040997,0,0,'51f6ed04f62f0c8c4346cf8beb414548',27,''),(109,2,'appdata_oczftcjq3340/preview/f/4/5/7/c/5/4/49/256-256-crop.jpg','7ef5f689eae02a64e59605381213d0fc',91,'256-256-crop.jpg',17,8,13856,1714040997,1714040997,0,0,'c064be8b96f1806e2efdbd4d1161c764',27,''),(110,2,'appdata_oczftcjq3340/preview/6/c/8/3/4/9/c/45/256-256-crop.jpg','bed1b18be7e27fb6e8929a1581e35ba7',104,'256-256-crop.jpg',17,8,13780,1714040997,1714040997,0,0,'e8257a43f0aad5388ca29b2584388a0e',27,''),(111,2,'appdata_oczftcjq3340/preview/1/7/e/6/2/1/6/43/256-256-crop.jpg','573ba88e527dccd356ee0ff3de274f71',92,'256-256-crop.jpg',17,8,18049,1714040997,1714040997,0,0,'31a76e34604e1b910541ef8de8911f84',27,''),(112,2,'appdata_oczftcjq3340/preview/d','f9b42e00cf7b4277d84d6e2edf5afff1',64,'d',2,1,-1,1714040997,1714040997,0,0,'662a30a6056e2',31,''),(113,2,'appdata_oczftcjq3340/preview/d/9','fec6dff78a561a5d06d10c30d18661ec',112,'9',2,1,-1,1714040997,1714040997,0,0,'662a30a60325a',31,''),(114,2,'appdata_oczftcjq3340/preview/d/9/d','a935a7988aee0384dacfc6ed49a0852b',113,'d',2,1,-1,1714040997,1714040997,0,0,'662a30a5f3be3',31,''),(115,2,'appdata_oczftcjq3340/preview/d/9/d/4','21e4dfeadc1c0060dc09ecfa687d5e93',114,'4',2,1,-1,1714040997,1714040997,0,0,'662a30a5f1572',31,''),(116,2,'appdata_oczftcjq3340/preview/a/1/d/0/c/6/e/42/3000-2000-max.jpg','2d702a1347abcd44fb84d86c12194eaa',97,'3000-2000-max.jpg',17,8,808212,1714040998,1714040998,0,0,'cdf33c1a0c21b2758fc39659479bca2d',27,''),(117,2,'appdata_oczftcjq3340/preview/d/9/d/4/f','ebfc835cbd6c41fb77433ff51c5a61e8',115,'f',2,1,-1,1714040997,1714040997,0,0,'662a30a5ecd7c',31,''),(118,2,'appdata_oczftcjq3340/preview/d/9/d/4/f/4','f526743dc572d5ae564e0f9037e1491b',117,'4',2,1,-1,1714040997,1714040997,0,0,'662a30a5eb38e',31,''),(119,2,'appdata_oczftcjq3340/preview/d/9/d/4/f/4/9','4f7992e74d1c7121783e0e154701414e',118,'9',2,1,-1,1714040997,1714040997,0,0,'662a30a5e999c',31,''),(120,2,'appdata_oczftcjq3340/preview/d/9/d/4/f/4/9/46','238cce3215cb02c6d98c256a3112e5fc',119,'46',2,1,0,1714040998,1714040998,0,0,'662a30a5e7bc3',31,''),(121,2,'appdata_oczftcjq3340/preview/6/4/2/e/9/2/e/48/256-256-crop.png','79f0e15f37b9f63f2d0781449c05c4cf',85,'256-256-crop.png',9,8,6750,1714040998,1714040998,0,0,'1a8634a10a5157e6d632d1058e8e6ff5',27,''),(122,2,'appdata_oczftcjq3340/preview/d/9/d/4/f/4/9/46/1920-1281-max.jpg','92c0607e495c79a0573e99468451633d',120,'1920-1281-max.jpg',17,8,294390,1714040998,1714040998,0,0,'248009bb0810d970321ae4bffc68aac9',27,''),(123,2,'appdata_oczftcjq3340/preview/d/9/d/4/f/4/9/46/256-256-crop.jpg','3703eec07a1fc3ae166041ce2ff63c39',120,'256-256-crop.jpg',17,8,15764,1714040998,1714040998,0,0,'a57cf87d689696703143ece6bbde8cde',27,''),(124,2,'appdata_oczftcjq3340/preview/a/1/d/0/c/6/e/42/256-256-crop.jpg','230c6101736f6acbf956913cd0550b55',97,'256-256-crop.jpg',17,8,21338,1714040998,1714040998,0,0,'92a32506480bda26f5627783ffe44da8',27,''),(125,1,'cache','0fea6a13c52b4d4725368f24b045ca84',1,'cache',2,1,0,1714042521,1714042521,0,0,'662a3699d4bc9',31,''),(126,2,'appdata_oczftcjq3340/preview/f/7','bd90620872b1eda6b9c2f551ddb8f33c',67,'7',2,1,-1,1714060518,1714060518,0,0,'662a7ce61529d',31,''),(127,2,'appdata_oczftcjq3340/preview/f/7/1','4917ac16a225341b3999150f627534a9',126,'1',2,1,-1,1714060518,1714060518,0,0,'662a7ce613fff',31,''),(128,2,'appdata_oczftcjq3340/preview/f/7/1/7','793dea878b17221f7c60f870c64a13a9',127,'7',2,1,-1,1714060518,1714060518,0,0,'662a7ce612aee',31,''),(129,2,'appdata_oczftcjq3340/preview/f/7/1/7/7','74dc2634a04e4fa6ec9ab7cea5683973',128,'7',2,1,-1,1714060518,1714060518,0,0,'662a7ce6118eb',31,''),(130,2,'appdata_oczftcjq3340/preview/f/7/1/7/7/1','d0d41b770430f38b6311dce45485913d',129,'1',2,1,-1,1714060518,1714060518,0,0,'662a7ce60ffec',31,''),(131,2,'appdata_oczftcjq3340/preview/f/7/1/7/7/1/6','286fe60b68783e45273f82290f877a16',130,'6',2,1,-1,1714060518,1714060518,0,0,'662a7ce60d934',31,''),(132,2,'appdata_oczftcjq3340/preview/f/7/1/7/7/1/6/44','3b82257f2023a85c914ecb78846454ff',131,'44',2,1,0,1714060518,1714060518,0,0,'662a7ce60b38a',31,''),(133,2,'appdata_oczftcjq3340/preview/f/7/1/7/7/1/6/44/1600-1067-max.jpg','af427865bd59be4ec370511776cb2fb0',132,'1600-1067-max.jpg',17,8,165982,1714060518,1714060518,0,0,'ed479bf54a54af131a30799812d4020a',27,''),(134,2,'appdata_oczftcjq3340/preview/f/7/1/7/7/1/6/44/256-256-crop.jpg','c0b2b91722bb74037a9e880f7edc4e03',132,'256-256-crop.jpg',17,8,13155,1714060518,1714060518,0,0,'f29afe91c2e899342d03f48d93085ed4',27,''),(135,2,'appdata_oczftcjq3340/avatar/xander','cf220d81b4322722377c9aba7579afc0',60,'xander',2,1,0,1714060884,1714060884,0,0,'662a7e53edbc9',31,''),(136,2,'appdata_oczftcjq3340/avatar/xander/avatar.png','b5d996a6499be9cc6a98e62f51d62e44',135,'avatar.png',9,8,19203,1714060884,1714060884,0,0,'fce26b02150967fd5966e27c86f34649',27,''),(137,2,'appdata_oczftcjq3340/avatar/xander/generated','3905dc296f2d8e158baeae9db6b32946',135,'generated',14,3,0,1714060884,1714060884,0,0,'b4ae657f50e79abc2d00371b98d7b5e4',27,''),(138,2,'appdata_oczftcjq3340/avatar/xander/avatar.512.png','4ff9cab1912da1ecf2182222cd616446',135,'avatar.512.png',9,8,7439,1714060884,1714060884,0,0,'6e322964c4a88def6ba2567c0e58faf1',27,''),(139,3,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,0,1714060884,1714060884,0,0,'662a7e54a7659',23,''),(140,2,'appdata_oczftcjq3340/avatar/xander/avatar.64.png','7149b73d6fdacc285d80fecad804b805',135,'avatar.64.png',9,8,966,1714060884,1714060884,0,0,'bc88c5bedeb8f8e83525496ac0d460d7',27,'');
/*!40000 ALTER TABLE `oc_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache_extended`
--

DROP TABLE IF EXISTS `oc_filecache_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache_extended` (
  `fileid` bigint(20) unsigned NOT NULL,
  `metadata_etag` varchar(40) DEFAULT NULL,
  `creation_time` bigint(20) NOT NULL DEFAULT 0,
  `upload_time` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fileid`),
  KEY `fce_ctime_idx` (`creation_time`),
  KEY `fce_utime_idx` (`upload_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache_extended`
--

LOCK TABLES `oc_filecache_extended` WRITE;
/*!40000 ALTER TABLE `oc_filecache_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filecache_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_metadata`
--

DROP TABLE IF EXISTS `oc_files_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_metadata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `json` longtext NOT NULL,
  `sync_token` varchar(15) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_meta_fileid` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_metadata`
--

LOCK TABLES `oc_files_metadata` WRITE;
/*!40000 ALTER TABLE `oc_files_metadata` DISABLE KEYS */;
INSERT INTO `oc_files_metadata` VALUES (1,9,'{\"photos-original_date_time\":{\"value\":1714040910,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":500,\"height\":500},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','uxe1WNb','2024-04-25 10:28:30'),(2,39,'{\"photos-original_date_time\":{\"value\":1714040914,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0}}','BZUEDzO','2024-04-25 10:28:34'),(3,41,'{\"photos-original_date_time\":{\"value\":1341072915,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/500\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":8000,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 16:15:15\",\"DateTimeDigitized\":\"2012:06:30 16:15:15\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"9\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 16:15:15\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','EM9ZjEQ','2024-04-25 10:28:34'),(4,42,'{\"photos-original_date_time\":{\"value\":1714040915,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":3000,\"height\":2000},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','Z6c9P18','2024-04-25 10:28:35'),(5,43,'{\"photos-original_date_time\":{\"value\":1341258636,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/80\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":400,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:07:02 19:50:36\",\"DateTimeDigitized\":\"2012:07:02 19:50:36\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"51\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"32\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1066,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.8.0\",\"DateTime\":\"2012:07:02 22:06:14\",\"Exif_IFD_Pointer\":198},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1066},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','uZ3O26K','2024-04-25 10:28:35'),(6,44,'{\"photos-original_date_time\":{\"value\":1341059531,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/125\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":3,\"ISOSpeedRatings\":320,\"UndefinedTag__x____\":320,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 12:32:11\",\"DateTimeDigitized\":\"2012:06:30 12:32:11\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"7\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"189284\\/33461\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"83\",\"SubSecTimeOriginal\":\"83\",\"SubSecTimeDigitized\":\"83\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1920000\\/487\",\"FocalPlaneYResolution\":\"320000\\/81\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"0000000000\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"DateTime\":\"2012:06:30 12:32:11\",\"Exif_IFD_Pointer\":174},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','JAqHTSP','2024-04-25 10:28:35'),(7,45,'{\"photos-original_date_time\":{\"value\":1444907264,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/320\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":640,\"UndefinedTag__x____\":640,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2015:10:15 11:07:44\",\"DateTimeDigitized\":\"2015:10:15 11:07:44\",\"ShutterSpeedValue\":\"27970\\/3361\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"1\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"200\\/1\",\"SubSecTimeOriginal\":\"63\",\"SubSecTimeDigitized\":\"63\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1600\\/1\",\"FocalPlaneYResolution\":\"1600\\/1\",\"FocalPlaneResolutionUnit\":3,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000084121f\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"240\\/1\",\"YResolution\":\"240\\/1\",\"ResolutionUnit\":2,\"Software\":\"Adobe Photoshop Lightroom 6.2.1 (Macintosh)\",\"DateTime\":\"2015:10:16 14:40:21\",\"Exif_IFD_Pointer\":230},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','BQPsmfz','2024-04-25 10:28:35'),(8,46,'{\"photos-original_date_time\":{\"value\":1526500980,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"10\\/12500\",\"FNumber\":\"35\\/10\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"DateTimeOriginal\":\"2018:05:16 20:03:00\",\"DateTimeDigitized\":\"2018:05:16 20:03:00\",\"ExposureBiasValue\":\"0\\/6\",\"MaxApertureValue\":\"30\\/10\",\"MeteringMode\":5,\"LightSource\":0,\"Flash\":16,\"FocalLength\":\"700\\/10\",\"MakerNote\":\"Nikon\",\"UserComment\":\"Christoph WurstCC-SA 4.0\",\"SubSecTime\":\"30\",\"SubSecTimeOriginal\":\"30\",\"SubSecTimeDigitized\":\"30\",\"ColorSpace\":1,\"SensingMethod\":2,\"FileSource\":\"\",\"SceneType\":\"\",\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"DigitalZoomRatio\":\"1\\/1\",\"FocalLengthIn__mmFilm\":70,\"SceneCaptureType\":0,\"GainControl\":0,\"Contrast\":1,\"Saturation\":0,\"Sharpness\":1,\"SubjectDistanceRange\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"ImageDescription\":\"Christoph WurstCC-SA 4.0\",\"Make\":\"NIKON CORPORATION\",\"Model\":\"NIKON D610\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.10.14\",\"DateTime\":\"2019:12:10 08:51:16\",\"Artist\":\"Christoph Wurst                     \",\"Copyright\":\"Christoph Wurst                                       \",\"Exif_IFD_Pointer\":402,\"GPS_IFD_Pointer\":13738,\"DateTimeOriginal\":\"2018:05:16 20:03:00\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1920,\"height\":1281},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','hFwfj9V','2024-04-25 10:28:35'),(9,47,'{\"photos-original_date_time\":{\"value\":1372319469,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/160\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2013:06:27 07:51:09\",\"DateTimeDigitized\":\"2013:06:27 07:51:09\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"59\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"2\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"45\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1200,\"ExifImageLength\":1800,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000052602c\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.4.5\",\"DateTime\":\"2013:06:27 07:51:09\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1200,\"height\":1800},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','dBdmMHB','2024-04-25 10:28:36'),(10,49,'{\"photos-original_date_time\":{\"value\":1341064060,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/640\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":12800,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 13:47:40\",\"DateTimeDigitized\":\"2012:06:30 13:47:40\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"75\\/8\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"235\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 13:47:40\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','bkl7htT','2024-04-25 10:28:36');
/*!40000 ALTER TABLE `oc_files_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_metadata_index`
--

DROP TABLE IF EXISTS `oc_files_metadata_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_metadata_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `meta_key` varchar(31) DEFAULT NULL,
  `meta_value_string` varchar(63) DEFAULT NULL,
  `meta_value_int` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `f_meta_index` (`file_id`,`meta_key`,`meta_value_string`),
  KEY `f_meta_index_i` (`file_id`,`meta_key`,`meta_value_int`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_metadata_index`
--

LOCK TABLES `oc_files_metadata_index` WRITE;
/*!40000 ALTER TABLE `oc_files_metadata_index` DISABLE KEYS */;
INSERT INTO `oc_files_metadata_index` VALUES (2,9,'photos-original_date_time',NULL,1714040910),(3,39,'photos-original_date_time',NULL,1714040914),(5,41,'photos-original_date_time',NULL,1341072915),(7,42,'photos-original_date_time',NULL,1714040915),(9,43,'photos-original_date_time',NULL,1341258636),(11,44,'photos-original_date_time',NULL,1341059531),(13,45,'photos-original_date_time',NULL,1444907264),(15,46,'photos-original_date_time',NULL,1526500980),(17,47,'photos-original_date_time',NULL,1372319469),(19,49,'photos-original_date_time',NULL,1341064060);
/*!40000 ALTER TABLE `oc_files_metadata_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_reminders`
--

DROP TABLE IF EXISTS `oc_files_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `due_date` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `notified` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reminders_uniq_idx` (`user_id`,`file_id`,`due_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_reminders`
--

LOCK TABLES `oc_files_reminders` WRITE;
/*!40000 ALTER TABLE `oc_files_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_trash` (
  `auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) NOT NULL DEFAULT '',
  `user` varchar(64) NOT NULL DEFAULT '',
  `timestamp` varchar(12) NOT NULL DEFAULT '',
  `location` varchar(512) NOT NULL DEFAULT '',
  `type` varchar(4) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_versions`
--

DROP TABLE IF EXISTS `oc_files_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_versions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  `mimetype` bigint(20) NOT NULL,
  `metadata` longtext NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`metadata`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_versions_uniq_index` (`file_id`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_versions`
--

LOCK TABLES `oc_files_versions` WRITE;
/*!40000 ALTER TABLE `oc_files_versions` DISABLE KEYS */;
INSERT INTO `oc_files_versions` VALUES (1,4,1714040909,1083339,4,'{\"author\":\"rbmk2324\"}'),(2,5,1714040909,1095,6,'{\"author\":\"rbmk2324\"}'),(3,6,1714040909,24295,7,'{\"author\":\"rbmk2324\"}'),(4,7,1714040910,136,6,'{\"author\":\"rbmk2324\"}'),(5,8,1714040910,16305464,4,'{\"author\":\"rbmk2324\"}'),(6,9,1714040910,50598,9,'{\"author\":\"rbmk2324\"}'),(7,11,1714040910,13878,10,'{\"author\":\"rbmk2324\"}'),(8,12,1714040910,868111,11,'{\"author\":\"rbmk2324\"}'),(9,13,1714040910,573,6,'{\"author\":\"rbmk2324\"}'),(10,14,1714040911,340061,11,'{\"author\":\"rbmk2324\"}'),(11,15,1714040911,15961,11,'{\"author\":\"rbmk2324\"}'),(12,16,1714040911,88394,12,'{\"author\":\"rbmk2324\"}'),(13,17,1714040911,326,6,'{\"author\":\"rbmk2324\"}'),(14,18,1714040911,5155877,11,'{\"author\":\"rbmk2324\"}'),(15,19,1714040911,13653,10,'{\"author\":\"rbmk2324\"}'),(16,20,1714040911,14316,13,'{\"author\":\"rbmk2324\"}'),(17,21,1714040912,39404,11,'{\"author\":\"rbmk2324\"}'),(18,22,1714040912,38605,14,'{\"author\":\"rbmk2324\"}'),(19,23,1714040912,13441,12,'{\"author\":\"rbmk2324\"}'),(20,24,1714040912,317015,13,'{\"author\":\"rbmk2324\"}'),(21,25,1714040912,14810,13,'{\"author\":\"rbmk2324\"}'),(22,26,1714040912,52843,12,'{\"author\":\"rbmk2324\"}'),(23,27,1714040912,17276,11,'{\"author\":\"rbmk2324\"}'),(24,28,1714040913,11836,10,'{\"author\":\"rbmk2324\"}'),(25,29,1714040913,30354,11,'{\"author\":\"rbmk2324\"}'),(26,30,1714040913,3509628,13,'{\"author\":\"rbmk2324\"}'),(27,31,1714040913,16988,10,'{\"author\":\"rbmk2324\"}'),(28,32,1714040913,52674,14,'{\"author\":\"rbmk2324\"}'),(29,33,1714040913,81196,13,'{\"author\":\"rbmk2324\"}'),(30,34,1714040913,13378,12,'{\"author\":\"rbmk2324\"}'),(31,35,1714040914,554,6,'{\"author\":\"rbmk2324\"}'),(32,36,1714040914,2403,6,'{\"author\":\"rbmk2324\"}'),(33,37,1714040914,976625,4,'{\"author\":\"rbmk2324\"}'),(34,38,1714040914,206,6,'{\"author\":\"rbmk2324\"}'),(35,39,1714040914,3963036,16,'{\"author\":\"rbmk2324\"}'),(36,41,1714040914,457744,17,'{\"author\":\"rbmk2324\"}'),(37,42,1714040915,797325,17,'{\"author\":\"rbmk2324\"}'),(38,43,1714040915,2170375,17,'{\"author\":\"rbmk2324\"}'),(39,44,1714040915,593508,17,'{\"author\":\"rbmk2324\"}'),(40,45,1714040915,167989,17,'{\"author\":\"rbmk2324\"}'),(41,46,1714040915,427030,17,'{\"author\":\"rbmk2324\"}'),(42,47,1714040915,567689,17,'{\"author\":\"rbmk2324\"}'),(43,48,1714040916,150,6,'{\"author\":\"rbmk2324\"}'),(44,49,1714040916,474653,17,'{\"author\":\"rbmk2324\"}');
/*!40000 ALTER TABLE `oc_files_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_checks`
--

DROP TABLE IF EXISTS `oc_flow_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `operator` varchar(16) NOT NULL DEFAULT '',
  `value` longtext DEFAULT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_checks`
--

LOCK TABLES `oc_flow_checks` WRITE;
/*!40000 ALTER TABLE `oc_flow_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations`
--

DROP TABLE IF EXISTS `oc_flow_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `name` varchar(256) DEFAULT '',
  `checks` longtext DEFAULT NULL,
  `operation` longtext DEFAULT NULL,
  `entity` varchar(256) NOT NULL DEFAULT 'OCA\\WorkflowEngine\\Entity\\File',
  `events` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations`
--

LOCK TABLES `oc_flow_operations` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations_scope`
--

DROP TABLE IF EXISTS `oc_flow_operations_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations_scope` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_scope` (`operation_id`,`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations_scope`
--

LOCK TABLES `oc_flow_operations_scope` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_admin`
--

LOCK TABLES `oc_group_admin` WRITE;
/*!40000 ALTER TABLE `oc_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `gu_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_user`
--

LOCK TABLES `oc_group_user` WRITE;
/*!40000 ALTER TABLE `oc_group_user` DISABLE KEYS */;
INSERT INTO `oc_group_user` VALUES ('admin','rbmk2324');
/*!40000 ALTER TABLE `oc_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(255) NOT NULL DEFAULT 'name',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_groups`
--

LOCK TABLES `oc_groups` WRITE;
/*!40000 ALTER TABLE `oc_groups` DISABLE KEYS */;
INSERT INTO `oc_groups` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL DEFAULT '',
  `argument` varchar(4000) NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT 0,
  `last_checked` int(11) DEFAULT 0,
  `reserved_at` int(11) DEFAULT 0,
  `execution_duration` int(11) DEFAULT 0,
  `argument_hash` varchar(32) DEFAULT NULL,
  `time_sensitive` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`),
  KEY `job_lastcheck_reserved` (`last_checked`,`reserved_at`),
  KEY `job_argument_hash` (`class`,`argument_hash`),
  KEY `jobs_time_sensitive` (`time_sensitive`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES (1,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',1714040954,1714040954,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(2,'OCA\\Files_Sharing\\ExpireSharesJob','null',1714040962,1714040962,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(3,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',1714042282,1714042282,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(4,'OCA\\Federation\\SyncJob','null',1714042739,1714042739,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(5,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',1714042752,1714042752,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(6,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',1714043268,1714043268,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(7,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',1714043517,1714043517,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(8,'OCA\\Notifications\\BackgroundJob\\GenerateUserSettings','null',1714044092,1714044092,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(9,'OCA\\Notifications\\BackgroundJob\\SendNotificationMails','null',1714044944,1714044944,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(10,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',1714045123,1714045123,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(11,'OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob','null',1714060515,1714060515,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(12,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',1714060529,1714060529,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(13,'OCA\\Files\\BackgroundJob\\ScanFiles','null',1714060589,1714060589,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(14,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',0,1714040900,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(15,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',0,1714040900,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(16,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',0,1714040900,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(17,'OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor','null',0,1714040900,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(18,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',0,1714040900,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(19,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',0,1714040901,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(20,'OCA\\Circles\\Cron\\Maintenance','null',0,1714040901,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(21,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',0,1714040902,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(22,'OCA\\Text\\Cron\\Cleanup','null',0,1714040903,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(23,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',0,1714040904,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(24,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',0,1714040904,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(25,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',0,1714040904,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(26,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',0,1714040904,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(27,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',0,1714040904,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(28,'OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob','null',0,1714040904,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(29,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',0,1714040905,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(30,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',0,1714040905,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(31,'OCA\\Activity\\BackgroundJob\\DigestMail','null',0,1714040905,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(32,'OCA\\Activity\\BackgroundJob\\RemoveFormerActivitySettings','null',0,1714040905,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(33,'OCA\\UpdateNotification\\BackgroundJob\\UpdateAvailableNotifications','null',0,1714040905,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(34,'OCA\\FilesReminders\\BackgroundJob\\CleanUpReminders','null',0,1714040905,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(35,'OCA\\FilesReminders\\BackgroundJob\\ScheduledNotifications','null',0,1714040905,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(36,'OCA\\OAuth2\\BackgroundJob\\CleanupExpiredAuthorizationCode','null',0,1714040906,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(37,'OC\\Authentication\\Token\\TokenCleanupJob','null',0,1714040907,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(38,'OC\\Log\\Rotate','null',0,1714040907,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(39,'OC\\Preview\\BackgroundCleanupJob','null',0,1714040907,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(40,'OC\\TextProcessing\\RemoveOldTasksBackgroundJob','null',0,1714040908,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(41,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",4]',0,1714040909,0,0,'01f0da350aadeb30d08bb6ef4a1fc2f8',1),(42,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",5]',0,1714040909,0,0,'189ad7a432ed80e1c93c757eb48f0e84',1),(43,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",6]',0,1714040909,0,0,'3db8f89edb5d0fc5975590c635b9c347',1),(44,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",7]',0,1714040910,0,0,'08577b0ed416546ad65b5adae48d6859',1),(45,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",8]',0,1714040910,0,0,'43e1234fc1fa99db1bb3311d99f464f4',1),(46,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",9]',0,1714040910,0,0,'f841f4f04b31bc6745c2a892f8ea1987',1),(47,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",11]',0,1714040910,0,0,'ebd331000d0beb068c94e25bcb9a862e',1),(48,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",12]',0,1714040910,0,0,'1b1b572d9b001a3c5bb8e5e165280650',1),(49,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",13]',0,1714040910,0,0,'62acbd685d4dea72ce012c72835a2634',1),(50,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",14]',0,1714040911,0,0,'7b80580a44ef22ee38da555e2f585340',1),(51,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",15]',0,1714040911,0,0,'ae4a70e92651354dabf692bb53674506',1),(52,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",16]',0,1714040911,0,0,'b4ed0e3db9173e79073692726e9666bb',1),(53,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",17]',0,1714040911,0,0,'8ad90d12b886f2cfb46e0dc4475a6fee',1),(54,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",18]',0,1714040911,0,0,'f578ff66e0b57de8cf50e8bde55a60fb',1),(55,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",19]',0,1714040911,0,0,'fbbe702e9136d8a96a8a3e46712af629',1),(56,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",20]',0,1714040911,0,0,'9b3ce0aa9462968763f474d5bb22e31d',1),(57,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",21]',0,1714040912,0,0,'4b4d8eb165e9dbaab411264b95e4c0d2',1),(58,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",22]',0,1714040912,0,0,'abffa1188ce94a45541edfd0f60eef70',1),(59,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",23]',0,1714040912,0,0,'ab1a45b4b205afa45770ebd5fd21811b',1),(60,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",24]',0,1714040912,0,0,'a81e0bcd7d88a6d32ec1a28273b16188',1),(61,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",25]',0,1714040912,0,0,'86a413a9b65523d3f174c43ab1f8e78c',1),(62,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",26]',0,1714040912,0,0,'fa60e6e78b20c1afd4af12768fd1ae67',1),(63,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",27]',0,1714040912,0,0,'3a50ced47c217f3ac1511962cad10d16',1),(64,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",28]',0,1714040913,0,0,'c5bba300c5063c7164b27898a64a6071',1),(65,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",29]',0,1714040913,0,0,'5b0ef26ecc6f6fac6bf42dead9de429b',1),(66,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",30]',0,1714040913,0,0,'bb2517a2811bb23907a466a5e179eafd',1),(67,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",31]',0,1714040913,0,0,'8b5e0bdd295f068aa3f820bde771b5f5',1),(68,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",32]',0,1714040913,0,0,'0e18dd65333301f6d13e06e32331d2e1',1),(69,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",33]',0,1714040913,0,0,'884e0efc762f6b11b1195d8373ec9481',1),(70,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",34]',0,1714040913,0,0,'d87edc629b90827c6b0ce61b8428546a',1),(71,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",35]',0,1714040914,0,0,'7b1bae1513fe77568dccc3676a61793c',1),(72,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",36]',0,1714040914,0,0,'f2b47a3b5084d7e28be7fda1491fc2fd',1),(73,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",37]',0,1714040914,0,0,'78ccace53ecbc7bc221a9a2605ce5c24',1),(74,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",38]',0,1714040914,0,0,'d86f3cbdd3979257cb555d2f119ac80d',1),(75,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",39]',0,1714040914,0,0,'a9d201b9c3b1ded8d5f94ca194a9a711',1),(76,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",41]',0,1714040915,0,0,'ecf87c503acebfa0c6e5a5c10c2b62c0',1),(77,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",42]',0,1714040915,0,0,'d7f2daaa9f444857a17c61cd04b1343f',1),(78,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",43]',0,1714040915,0,0,'9df657234da0eaf272106cc00e5a1065',1),(79,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",44]',0,1714040915,0,0,'a211c196e418d2f1a8e39bec09a571a4',1),(80,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",45]',0,1714040915,0,0,'dbf630867413e86ae71625d10b456688',1),(81,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",46]',0,1714040915,0,0,'18b97bcf8db0d03fb66589030688c2f8',1),(82,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",47]',0,1714040916,0,0,'0bf148abbc47ba26287f3cfce3fc4104',1),(83,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",48]',0,1714040916,0,0,'3202cca6a902801c001751c9012d9f56',1),(84,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"rbmk2324\",49]',0,1714040916,0,0,'59cbe763b21b5383570abb192286f6e1',1),(85,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"rbmk2324\"}',0,1714040959,0,0,'f43e0c7617e82d9bd46bfea7795a981d',1);
/*!40000 ALTER TABLE `oc_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_known_users`
--

DROP TABLE IF EXISTS `oc_known_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_known_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `known_to` varchar(255) NOT NULL,
  `known_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ku_known_to` (`known_to`),
  KEY `ku_known_user` (`known_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_known_users`
--

LOCK TABLES `oc_known_users` WRITE;
/*!40000 ALTER TABLE `oc_known_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_known_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_login_flow_v2`
--

DROP TABLE IF EXISTS `oc_login_flow_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_login_flow_v2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) unsigned NOT NULL,
  `started` smallint(5) unsigned NOT NULL DEFAULT 0,
  `poll_token` varchar(255) NOT NULL,
  `login_token` varchar(255) NOT NULL,
  `public_key` text NOT NULL,
  `private_key` text NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `app_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_token` (`poll_token`),
  UNIQUE KEY `login_token` (`login_token`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_login_flow_v2`
--

LOCK TABLES `oc_login_flow_v2` WRITE;
/*!40000 ALTER TABLE `oc_login_flow_v2` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_login_flow_v2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_migrations` (
  `app` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`app`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_migrations`
--

LOCK TABLES `oc_migrations` WRITE;
/*!40000 ALTER TABLE `oc_migrations` DISABLE KEYS */;
INSERT INTO `oc_migrations` VALUES ('activity','2006Date20170808154933'),('activity','2006Date20170808155040'),('activity','2006Date20170919095939'),('activity','2007Date20181107114613'),('activity','2008Date20181011095117'),('activity','2010Date20190416112817'),('activity','2011Date20201006132544'),('activity','2011Date20201006132545'),('activity','2011Date20201006132546'),('activity','2011Date20201006132547'),('activity','2011Date20201207091915'),('circles','0022Date20220526111723'),('circles','0022Date20220526113601'),('circles','0022Date20220703115023'),('circles','0023Date20211216113101'),('circles','0024Date20220203123901'),('circles','0024Date20220203123902'),('circles','0024Date20220317190331'),('circles','0028Date20230705222601'),('contactsinteraction','010000Date20200304152605'),('core','13000Date20170705121758'),('core','13000Date20170718121200'),('core','13000Date20170814074715'),('core','13000Date20170919121250'),('core','13000Date20170926101637'),('core','14000Date20180129121024'),('core','14000Date20180404140050'),('core','14000Date20180516101403'),('core','14000Date20180518120534'),('core','14000Date20180522074438'),('core','14000Date20180626223656'),('core','14000Date20180710092004'),('core','14000Date20180712153140'),('core','15000Date20180926101451'),('core','15000Date20181015062942'),('core','15000Date20181029084625'),('core','16000Date20190207141427'),('core','16000Date20190212081545'),('core','16000Date20190427105638'),('core','16000Date20190428150708'),('core','17000Date20190514105811'),('core','18000Date20190920085628'),('core','18000Date20191014105105'),('core','18000Date20191204114856'),('core','19000Date20200211083441'),('core','20000Date20201109081915'),('core','20000Date20201109081918'),('core','20000Date20201109081919'),('core','20000Date20201111081915'),('core','21000Date20201120141228'),('core','21000Date20201202095923'),('core','21000Date20210119195004'),('core','21000Date20210309185126'),('core','21000Date20210309185127'),('core','22000Date20210216080825'),('core','23000Date20210721100600'),('core','23000Date20210906132259'),('core','23000Date20210930122352'),('core','23000Date20211203110726'),('core','23000Date20211213203940'),('core','24000Date20211210141942'),('core','24000Date20211213081506'),('core','24000Date20211213081604'),('core','24000Date20211222112246'),('core','24000Date20211230140012'),('core','24000Date20220131153041'),('core','24000Date20220202150027'),('core','24000Date20220404230027'),('core','24000Date20220425072957'),('core','25000Date20220515204012'),('core','25000Date20220602190540'),('core','25000Date20220905140840'),('core','25000Date20221007010957'),('core','27000Date20220613163520'),('core','27000Date20230309104325'),('core','27000Date20230309104802'),('core','28000Date20230616104802'),('core','28000Date20230728104802'),('core','28000Date20230803221055'),('core','28000Date20230906104802'),('core','28000Date20231004103301'),('core','28000Date20231103104802'),('core','28000Date20231126110901'),('core','29000Date20231126110901'),('core','29000Date20231213104850'),('core','29000Date20240124132201'),('core','29000Date20240124132202'),('core','29000Date20240131122720'),('dav','1004Date20170825134824'),('dav','1004Date20170919104507'),('dav','1004Date20170924124212'),('dav','1004Date20170926103422'),('dav','1005Date20180413093149'),('dav','1005Date20180530124431'),('dav','1006Date20180619154313'),('dav','1006Date20180628111625'),('dav','1008Date20181030113700'),('dav','1008Date20181105104826'),('dav','1008Date20181105104833'),('dav','1008Date20181105110300'),('dav','1008Date20181105112049'),('dav','1008Date20181114084440'),('dav','1011Date20190725113607'),('dav','1011Date20190806104428'),('dav','1012Date20190808122342'),('dav','1016Date20201109085907'),('dav','1017Date20210216083742'),('dav','1018Date20210312100735'),('dav','1024Date20211221144219'),('dav','1025Date20240308063933'),('dav','1027Date20230504122946'),('dav','1029Date20221114151721'),('dav','1029Date20231004091403'),('dav','1030Date20240205103243'),('federatedfilesharing','1010Date20200630191755'),('federatedfilesharing','1011Date20201120125158'),('federation','1010Date20200630191302'),('files','11301Date20191205150729'),('files','12101Date20221011153334'),('files_downloadlimit','000000Date20210910094923'),('files_reminders','10000Date20230725162149'),('files_sharing','11300Date20201120141438'),('files_sharing','21000Date20201223143245'),('files_sharing','22000Date20210216084241'),('files_sharing','24000Date20220208195521'),('files_sharing','24000Date20220404142216'),('files_trashbin','1010Date20200630192639'),('files_versions','1020Date20221114144058'),('notifications','2004Date20190107135757'),('notifications','2010Date20210218082811'),('notifications','2010Date20210218082855'),('notifications','2011Date20210930134607'),('notifications','2011Date20220826074907'),('oauth2','010401Date20181207190718'),('oauth2','010402Date20190107124745'),('oauth2','011601Date20230522143227'),('oauth2','011602Date20230613160650'),('oauth2','011603Date20230620111039'),('photos','20000Date20220727125801'),('photos','20001Date20220830131446'),('photos','20003Date20221102170153'),('photos','20003Date20221103094628'),('privacy','100Date20190217131943'),('text','010000Date20190617184535'),('text','030001Date20200402075029'),('text','030201Date20201116110353'),('text','030201Date20201116123153'),('text','030501Date20220202101853'),('text','030701Date20230207131313'),('text','030901Date20231114150437'),('twofactor_backupcodes','1002Date20170607104347'),('twofactor_backupcodes','1002Date20170607113030'),('twofactor_backupcodes','1002Date20170919123342'),('twofactor_backupcodes','1002Date20170926101419'),('twofactor_backupcodes','1002Date20180821043638'),('updatenotification','011901Date20240305120000'),('user_status','0001Date20200602134824'),('user_status','0002Date20200902144824'),('user_status','1000Date20201111130204'),('user_status','1003Date20210809144824'),('user_status','1008Date20230921144701'),('workflowengine','2000Date20190808074233'),('workflowengine','2200Date20210805101925');
/*!40000 ALTER TABLE `oc_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mimetypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES (3,'application'),(19,'application/gzip'),(18,'application/javascript'),(14,'application/octet-stream'),(4,'application/pdf'),(10,'application/vnd.oasis.opendocument.graphics'),(13,'application/vnd.oasis.opendocument.presentation'),(12,'application/vnd.oasis.opendocument.spreadsheet'),(11,'application/vnd.oasis.opendocument.text'),(7,'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(1,'httpd'),(2,'httpd/unix-directory'),(8,'image'),(17,'image/jpeg'),(9,'image/png'),(5,'text'),(6,'text/markdown'),(15,'video'),(16,'video/mp4');
/*!40000 ALTER TABLE `oc_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage_id` bigint(20) NOT NULL,
  `root_id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `mount_point` varchar(4000) NOT NULL,
  `mount_id` bigint(20) DEFAULT NULL,
  `mount_provider_class` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mounts_storage_index` (`storage_id`),
  KEY `mounts_root_index` (`root_id`),
  KEY `mounts_mount_id_index` (`mount_id`),
  KEY `mounts_user_root_path_index` (`user_id`,`root_id`,`mount_point`(128)),
  KEY `mounts_class_index` (`mount_provider_class`),
  KEY `mount_user_storage` (`storage_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` VALUES (1,1,1,'rbmk2324','/rbmk2324/',NULL,'OC\\Files\\Mount\\LocalHomeMountProvider'),(2,3,139,'xander','/xander/',NULL,'OC\\Files\\Mount\\LocalHomeMountProvider');
/*!40000 ALTER TABLE `oc_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(32) NOT NULL,
  `user` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `object_type` varchar(64) NOT NULL,
  `object_id` varchar(64) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `subject_parameters` longtext DEFAULT NULL,
  `message` varchar(64) DEFAULT NULL,
  `message_parameters` longtext DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `icon` varchar(4000) DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `oc_notifications_app` (`app`),
  KEY `oc_notifications_user` (`user`),
  KEY `oc_notifications_timestamp` (`timestamp`),
  KEY `oc_notifications_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
INSERT INTO `oc_notifications` VALUES (1,'firstrunwizard','rbmk2324',1714040959,'app','recognize','apphint-recognize','[]','','[]','','','[]'),(2,'firstrunwizard','rbmk2324',1714040959,'app','groupfolders','apphint-groupfolders','[]','','[]','','','[]'),(3,'firstrunwizard','rbmk2324',1714040959,'app','forms','apphint-forms','[]','','[]','','','[]'),(4,'firstrunwizard','rbmk2324',1714040959,'app','deck','apphint-deck','[]','','[]','','','[]'),(5,'firstrunwizard','rbmk2324',1714040959,'app','tasks','apphint-tasks','[]','','[]','','','[]');
/*!40000 ALTER TABLE `oc_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_pushhash`
--

DROP TABLE IF EXISTS `oc_notifications_pushhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_pushhash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `token` int(11) NOT NULL DEFAULT 0,
  `deviceidentifier` varchar(128) NOT NULL,
  `devicepublickey` varchar(512) NOT NULL,
  `devicepublickeyhash` varchar(128) NOT NULL,
  `pushtokenhash` varchar(128) NOT NULL,
  `proxyserver` varchar(256) NOT NULL,
  `apptype` varchar(32) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oc_npushhash_uid` (`uid`,`token`),
  KEY `oc_npushhash_di` (`deviceidentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_pushhash`
--

LOCK TABLES `oc_notifications_pushhash` WRITE;
/*!40000 ALTER TABLE `oc_notifications_pushhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications_pushhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_settings`
--

DROP TABLE IF EXISTS `oc_notifications_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `batch_time` int(11) NOT NULL DEFAULT 0,
  `last_send_id` bigint(20) NOT NULL DEFAULT 0,
  `next_send_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notset_user` (`user_id`),
  KEY `notset_nextsend` (`next_send_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_settings`
--

LOCK TABLES `oc_notifications_settings` WRITE;
/*!40000 ALTER TABLE `oc_notifications_settings` DISABLE KEYS */;
INSERT INTO `oc_notifications_settings` VALUES (1,'rbmk2324',0,0,0),(2,'xander',0,0,0);
/*!40000 ALTER TABLE `oc_notifications_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oc_oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hashed_code` varchar(128) NOT NULL,
  `encrypted_token` varchar(786) NOT NULL,
  `code_created_at` bigint(20) unsigned NOT NULL DEFAULT 0,
  `token_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_access_hash_idx` (`hashed_code`),
  KEY `oauth2_access_client_id_idx` (`client_id`),
  KEY `oauth2_tk_c_created_idx` (`token_count`,`code_created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_access_tokens`
--

LOCK TABLES `oc_oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_clients`
--

DROP TABLE IF EXISTS `oc_oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `client_identifier` varchar(64) NOT NULL,
  `secret` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_client_id_idx` (`client_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_clients`
--

LOCK TABLES `oc_oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_open_local_editor`
--

DROP TABLE IF EXISTS `oc_open_local_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_open_local_editor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `path_hash` varchar(64) NOT NULL,
  `expiration_time` bigint(20) unsigned NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openlocal_user_path_token` (`user_id`,`path_hash`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_open_local_editor`
--

LOCK TABLES `oc_open_local_editor` WRITE;
/*!40000 ALTER TABLE `oc_open_local_editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_open_local_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums`
--

DROP TABLE IF EXISTS `oc_photos_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums` (
  `album_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `last_added_photo` bigint(20) NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `pa_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums`
--

LOCK TABLES `oc_photos_albums` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_collabs`
--

DROP TABLE IF EXISTS `oc_photos_albums_collabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_collabs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `collaborator_id` varchar(64) NOT NULL,
  `collaborator_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album_collabs_uniq_collab` (`album_id`,`collaborator_id`,`collaborator_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_collabs`
--

LOCK TABLES `oc_photos_albums_collabs` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_files`
--

DROP TABLE IF EXISTS `oc_photos_albums_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_files` (
  `album_file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `added` bigint(20) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`album_file_id`),
  UNIQUE KEY `paf_album_file` (`album_id`,`file_id`),
  KEY `paf_folder` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_files`
--

LOCK TABLES `oc_photos_albums_files` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) NOT NULL DEFAULT '',
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`userid`,`appid`,`configkey`),
  KEY `preferences_app_key` (`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_preferences`
--

LOCK TABLES `oc_preferences` WRITE;
/*!40000 ALTER TABLE `oc_preferences` DISABLE KEYS */;
INSERT INTO `oc_preferences` VALUES ('rbmk2324','activity','configured','yes'),('rbmk2324','avatar','generated','true'),('rbmk2324','core','lang','en'),('rbmk2324','core','templateDirectory','Templates/'),('rbmk2324','core','timezone','Europe/Brussels'),('rbmk2324','dashboard','firstRun','0'),('rbmk2324','files','lastSeenQuotaUsage','0.06'),('rbmk2324','firstrunwizard','apphint','18'),('rbmk2324','firstrunwizard','show','29.0.0'),('rbmk2324','login','lastLogin','1714042521'),('rbmk2324','login_token','Nodci47dASft8xRtQu1EIs95iraqi/ib','1714042522'),('rbmk2324','notifications','sound_notification','no'),('rbmk2324','notifications','sound_talk','no'),('rbmk2324','password_policy','failedLoginAttempts','0'),('xander','avatar','generated','true'),('xander','core','lang','en'),('xander','files','quota','default'),('xander','notifications','sound_notification','no'),('xander','notifications','sound_talk','no'),('xander','settings','manager','[\"rbmk2324\"]');
/*!40000 ALTER TABLE `oc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_privacy_admins`
--

DROP TABLE IF EXISTS `oc_privacy_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_privacy_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_privacy_admins`
--

LOCK TABLES `oc_privacy_admins` WRITE;
/*!40000 ALTER TABLE `oc_privacy_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_privacy_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_profile_config`
--

DROP TABLE IF EXISTS `oc_profile_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_profile_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `config` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_config_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_profile_config`
--

LOCK TABLES `oc_profile_config` WRITE;
/*!40000 ALTER TABLE `oc_profile_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_profile_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) NOT NULL DEFAULT '',
  `propertypath` varchar(255) NOT NULL DEFAULT '',
  `propertyname` varchar(255) NOT NULL DEFAULT '',
  `propertyvalue` longtext NOT NULL,
  `valuetype` smallint(6) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `properties_path_index` (`userid`,`propertypath`),
  KEY `properties_pathonly_index` (`propertypath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ratelimit_entries`
--

DROP TABLE IF EXISTS `oc_ratelimit_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ratelimit_entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hash` varchar(128) NOT NULL,
  `delete_after` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ratelimit_hash` (`hash`),
  KEY `ratelimit_delete_after` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ratelimit_entries`
--

LOCK TABLES `oc_ratelimit_entries` WRITE;
/*!40000 ALTER TABLE `oc_ratelimit_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_ratelimit_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_reactions`
--

DROP TABLE IF EXISTS `oc_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_reactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL,
  `message_id` bigint(20) unsigned NOT NULL,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `reaction` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_reaction_unique` (`parent_id`,`actor_type`,`actor_id`,`reaction`),
  KEY `comment_reaction` (`reaction`),
  KEY `comment_reaction_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_reactions`
--

LOCK TABLES `oc_reactions` WRITE;
/*!40000 ALTER TABLE `oc_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_recent_contact`
--

DROP TABLE IF EXISTS `oc_recent_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_recent_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_uid` varchar(64) NOT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `federated_cloud_id` varchar(255) DEFAULT NULL,
  `card` longblob NOT NULL,
  `last_contact` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recent_contact_actor_uid` (`actor_uid`),
  KEY `recent_contact_id_uid` (`id`,`actor_uid`),
  KEY `recent_contact_uid` (`uid`),
  KEY `recent_contact_email` (`email`),
  KEY `recent_contact_fed_id` (`federated_cloud_id`),
  KEY `recent_contact_last_contact` (`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_recent_contact`
--

LOCK TABLES `oc_recent_contact` WRITE;
/*!40000 ALTER TABLE `oc_recent_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_recent_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_schedulingobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedulobj_principuri_index` (`principaluri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_schedulingobjects`
--

LOCK TABLES `oc_schedulingobjects` WRITE;
/*!40000 ALTER TABLE `oc_schedulingobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_schedulingobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT 0,
  `share_with` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uid_owner` varchar(64) NOT NULL DEFAULT '',
  `uid_initiator` varchar(64) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `item_type` varchar(64) NOT NULL DEFAULT '',
  `item_source` varchar(255) DEFAULT NULL,
  `item_target` varchar(255) DEFAULT NULL,
  `file_source` bigint(20) DEFAULT NULL,
  `file_target` varchar(512) DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT 0,
  `stime` bigint(20) NOT NULL DEFAULT 0,
  `accepted` smallint(6) NOT NULL DEFAULT 0,
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT 0,
  `share_name` varchar(64) DEFAULT NULL,
  `password_by_talk` tinyint(1) DEFAULT 0,
  `note` longtext DEFAULT NULL,
  `hide_download` smallint(6) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `attributes` longtext DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`attributes`)),
  `password_expiration_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`),
  KEY `share_with_index` (`share_with`),
  KEY `parent_index` (`parent`),
  KEY `owner_index` (`uid_owner`),
  KEY `initiator_index` (`uid_initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share`
--

LOCK TABLES `oc_share` WRITE;
/*!40000 ALTER TABLE `oc_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share_external` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) DEFAULT -1,
  `share_type` int(11) DEFAULT NULL,
  `remote` varchar(512) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  `share_token` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `name` varchar(4000) NOT NULL,
  `owner` varchar(64) NOT NULL,
  `user` varchar(64) NOT NULL,
  `mountpoint` varchar(4000) NOT NULL,
  `mountpoint_hash` varchar(32) NOT NULL,
  `accepted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share_external`
--

LOCK TABLES `oc_share_external` WRITE;
/*!40000 ALTER TABLE `oc_share_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_shares_limits`
--

DROP TABLE IF EXISTS `oc_shares_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_shares_limits` (
  `id` varchar(32) NOT NULL,
  `limit` bigint(20) NOT NULL,
  `downloads` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_shares_limits`
--

LOCK TABLES `oc_shares_limits` WRITE;
/*!40000 ALTER TABLE `oc_shares_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_shares_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages` (
  `numeric_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(64) DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES (1,'home::rbmk2324',1,NULL),(2,'local::/var/www/nextcloud/data/',1,NULL),(3,'home::xander',1,NULL);
/*!40000 ALTER TABLE `oc_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages_credentials`
--

DROP TABLE IF EXISTS `oc_storages_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) DEFAULT NULL,
  `identifier` varchar(64) NOT NULL,
  `credentials` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocred_ui` (`user`,`identifier`),
  KEY `stocred_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages_credentials`
--

LOCK TABLES `oc_storages_credentials` WRITE;
/*!40000 ALTER TABLE `oc_storages_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_storages_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT 1,
  `editable` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag`
--

LOCK TABLES `oc_systemtag` WRITE;
/*!40000 ALTER TABLE `oc_systemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_group` (
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `gid` varchar(255) NOT NULL,
  PRIMARY KEY (`gid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_group`
--

LOCK TABLES `oc_systemtag_group` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_object_mapping` (
  `objectid` varchar(64) NOT NULL DEFAULT '',
  `objecttype` varchar(64) NOT NULL DEFAULT '',
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`objecttype`,`objectid`,`systemtagid`),
  KEY `systag_by_tagid` (`systemtagid`,`objecttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_object_mapping`
--

LOCK TABLES `oc_systemtag_object_mapping` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text2image_tasks`
--

DROP TABLE IF EXISTS `oc_text2image_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text2image_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `input` longtext NOT NULL,
  `status` int(11) DEFAULT 0,
  `number_of_images` int(11) NOT NULL DEFAULT 1,
  `user_id` varchar(64) DEFAULT NULL,
  `app_id` varchar(32) NOT NULL DEFAULT '',
  `identifier` varchar(255) DEFAULT '',
  `last_updated` datetime DEFAULT NULL,
  `completion_expected_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t2i_tasks_updated` (`last_updated`),
  KEY `t2i_tasks_status` (`status`),
  KEY `t2i_tasks_uid_appid_ident` (`user_id`,`app_id`,`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text2image_tasks`
--

LOCK TABLES `oc_text2image_tasks` WRITE;
/*!40000 ALTER TABLE `oc_text2image_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text2image_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_documents`
--

DROP TABLE IF EXISTS `oc_text_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_documents` (
  `id` bigint(20) unsigned NOT NULL,
  `current_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version_time` bigint(20) unsigned NOT NULL,
  `last_saved_version_etag` varchar(64) DEFAULT '',
  `base_version_etag` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_documents`
--

LOCK TABLES `oc_text_documents` WRITE;
/*!40000 ALTER TABLE `oc_text_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_sessions`
--

DROP TABLE IF EXISTS `oc_text_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `guest_name` varchar(64) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `last_contact` bigint(20) unsigned NOT NULL,
  `last_awareness_message` longtext DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rd_session_token_idx` (`token`),
  KEY `ts_lastcontact` (`last_contact`),
  KEY `ts_docid_lastcontact` (`document_id`,`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_sessions`
--

LOCK TABLES `oc_text_sessions` WRITE;
/*!40000 ALTER TABLE `oc_text_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_steps`
--

DROP TABLE IF EXISTS `oc_text_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned NOT NULL,
  `session_id` bigint(20) unsigned NOT NULL,
  `data` longtext NOT NULL,
  `version` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rd_steps_did_idx` (`document_id`),
  KEY `rd_steps_version_idx` (`version`),
  KEY `textstep_session` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_steps`
--

LOCK TABLES `oc_text_steps` WRITE;
/*!40000 ALTER TABLE `oc_text_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_textprocessing_tasks`
--

DROP TABLE IF EXISTS `oc_textprocessing_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_textprocessing_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `input` longtext NOT NULL,
  `output` longtext DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `user_id` varchar(64) DEFAULT NULL,
  `app_id` varchar(32) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `last_updated` int(10) unsigned DEFAULT 0,
  `completion_expected_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_tasks_updated` (`last_updated`),
  KEY `tp_tasks_status_type_nonunique` (`status`,`type`),
  KEY `tp_tasks_uid_appid_ident` (`user_id`,`app_id`,`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_textprocessing_tasks`
--

LOCK TABLES `oc_textprocessing_tasks` WRITE;
/*!40000 ALTER TABLE `oc_textprocessing_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_textprocessing_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_trusted_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) NOT NULL,
  `url_hash` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(128) DEFAULT NULL,
  `shared_secret` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `sync_token` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_trusted_servers`
--

LOCK TABLES `oc_trusted_servers` WRITE;
/*!40000 ALTER TABLE `oc_trusted_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_trusted_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_backupcodes`
--

DROP TABLE IF EXISTS `oc_twofactor_backupcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_backupcodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `code` varchar(128) NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `twofactor_backupcodes_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_backupcodes`
--

LOCK TABLES `oc_twofactor_backupcodes` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_providers`
--

DROP TABLE IF EXISTS `oc_twofactor_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_providers` (
  `provider_id` varchar(32) NOT NULL,
  `uid` varchar(64) NOT NULL,
  `enabled` smallint(6) NOT NULL,
  PRIMARY KEY (`provider_id`,`uid`),
  KEY `twofactor_providers_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_providers`
--

LOCK TABLES `oc_twofactor_providers` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_providers` DISABLE KEYS */;
INSERT INTO `oc_twofactor_providers` VALUES ('backup_codes','rbmk2324',0);
/*!40000 ALTER TABLE `oc_twofactor_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_status`
--

DROP TABLE IF EXISTS `oc_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `status_timestamp` int(10) unsigned NOT NULL,
  `is_user_defined` tinyint(1) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `custom_icon` varchar(255) DEFAULT NULL,
  `custom_message` longtext DEFAULT NULL,
  `clear_at` int(10) unsigned DEFAULT NULL,
  `is_backup` tinyint(1) DEFAULT 0,
  `status_message_timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_status_uid_ix` (`user_id`),
  KEY `user_status_clr_ix` (`clear_at`),
  KEY `user_status_tstmp_ix` (`status_timestamp`),
  KEY `user_status_iud_ix` (`is_user_defined`,`status`),
  KEY `user_status_mtstmp_ix` (`status_message_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES (1,'rbmk2324','online',1714060515,0,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `oc_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_transfer_owner`
--

DROP TABLE IF EXISTS `oc_user_transfer_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_transfer_owner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_user` varchar(64) NOT NULL,
  `target_user` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `node_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_transfer_owner`
--

LOCK TABLES `oc_user_transfer_owner` WRITE;
/*!40000 ALTER TABLE `oc_user_transfer_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_transfer_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_users` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `uid_lower` varchar(64) DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `user_uid_lower` (`uid_lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_users`
--

LOCK TABLES `oc_users` WRITE;
/*!40000 ALTER TABLE `oc_users` DISABLE KEYS */;
INSERT INTO `oc_users` VALUES ('rbmk2324',NULL,'1|$2y$10$cTvd0yWn0FxXSj1fTBfsfO/aAZ2cEIOIBl5lJqOU5qx6QzpcK09pW','rbmk2324'),('xander',NULL,'1|$2y$10$j8070RfEGkkkp.9/l18yzeCCbgr1yLOiDAprFwVoZIuQXQMtpJiFq','xander');
/*!40000 ALTER TABLE `oc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory`
--

LOCK TABLES `oc_vcategory` WRITE;
/*!40000 ALTER TABLE `oc_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory_to_object` (
  `objid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `categoryid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory_to_object`
--

LOCK TABLES `oc_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_webauthn`
--

DROP TABLE IF EXISTS `oc_webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `public_key_credential_id` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webauthn_uid` (`uid`),
  KEY `webauthn_publicKeyCredentialId` (`public_key_credential_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_webauthn`
--

LOCK TABLES `oc_webauthn` WRITE;
/*!40000 ALTER TABLE `oc_webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_whats_new`
--

DROP TABLE IF EXISTS `oc_whats_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_whats_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) NOT NULL DEFAULT '11',
  `etag` varchar(64) NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT 0,
  `data` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `version_etag_idx` (`version`,`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_whats_new`
--

LOCK TABLES `oc_whats_new` WRITE;
/*!40000 ALTER TABLE `oc_whats_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_whats_new` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-25 16:04:06
