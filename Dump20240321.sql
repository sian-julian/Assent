-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: final_assent
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `alert` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add comment',7,'add_comment'),(26,'Can change comment',7,'change_comment'),(27,'Can delete comment',7,'delete_comment'),(28,'Can view comment',7,'view_comment'),(29,'Can add complaints',8,'add_complaints'),(30,'Can change complaints',8,'change_complaints'),(31,'Can delete complaints',8,'delete_complaints'),(32,'Can view complaints',8,'view_complaints'),(33,'Can add feedback',9,'add_feedback'),(34,'Can change feedback',9,'change_feedback'),(35,'Can delete feedback',9,'delete_feedback'),(36,'Can view feedback',9,'view_feedback'),(37,'Can add friend request',10,'add_friendrequest'),(38,'Can change friend request',10,'change_friendrequest'),(39,'Can delete friend request',10,'delete_friendrequest'),(40,'Can view friend request',10,'view_friendrequest'),(41,'Can add friend request1',11,'add_friendrequest1'),(42,'Can change friend request1',11,'change_friendrequest1'),(43,'Can delete friend request1',11,'delete_friendrequest1'),(44,'Can view friend request1',11,'view_friendrequest1'),(45,'Can add like',12,'add_like'),(46,'Can change like',12,'change_like'),(47,'Can delete like',12,'delete_like'),(48,'Can view like',12,'view_like'),(49,'Can add login',13,'add_login'),(50,'Can change login',13,'change_login'),(51,'Can delete login',13,'delete_login'),(52,'Can view login',13,'view_login'),(53,'Can add photo upload',14,'add_photoupload'),(54,'Can change photo upload',14,'change_photoupload'),(55,'Can delete photo upload',14,'delete_photoupload'),(56,'Can view photo upload',14,'view_photoupload'),(57,'Can add user',15,'add_user'),(58,'Can change user',15,'change_user'),(59,'Can delete user',15,'delete_user'),(60,'Can view user',15,'view_user'),(61,'Can add alert',16,'add_alert'),(62,'Can change alert',16,'change_alert'),(63,'Can delete alert',16,'delete_alert'),(64,'Can view alert',16,'view_alert');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(450) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `rec_id` int(11) NOT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(100) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cyber`
--

DROP TABLE IF EXISTS `cyber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cyber` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cyber`
--

LOCK TABLES `cyber` WRITE;
/*!40000 ALTER TABLE `cyber` DISABLE KEYS */;
INSERT INTO `cyber` VALUES (1,'','2024-03-01','17:49:20'),(2,'bloodyfool','2024-03-02','09:20:41'),(3,'bloodyfool','2024-03-02','09:28:35'),(4,'bloodyfool','2024-03-02','09:34:01'),(5,'bloodyfool','2024-03-02','09:35:55'),(6,'bloodyfool','2024-03-05','20:51:53'),(7,'exacerbate','2024-03-11','14:22:56'),(8,'bloodyfool','2024-03-17','13:31:11'),(9,'bloodyfool','2024-03-18','16:06:59');
/*!40000 ALTER TABLE `cyber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(16,'alert','alert'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'comment','comment'),(8,'complaint','complaints'),(5,'contenttypes','contenttype'),(9,'feedback','feedback'),(10,'friend_request','friendrequest'),(11,'friend_request','friendrequest1'),(12,'like','like'),(13,'login','login'),(14,'photo_upload','photoupload'),(6,'sessions','session'),(15,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-28 05:56:18.377606'),(2,'auth','0001_initial','2023-12-28 05:56:18.980939'),(3,'admin','0001_initial','2023-12-28 05:56:19.113703'),(4,'admin','0002_logentry_remove_auto_add','2023-12-28 05:56:19.119271'),(5,'admin','0003_logentry_add_action_flag_choices','2023-12-28 05:56:19.152630'),(6,'alert','0001_initial','2023-12-28 05:56:19.161122'),(7,'contenttypes','0002_remove_content_type_name','2023-12-28 05:56:19.264646'),(8,'auth','0002_alter_permission_name_max_length','2023-12-28 05:56:19.294670'),(9,'auth','0003_alter_user_email_max_length','2023-12-28 05:56:19.328269'),(10,'auth','0004_alter_user_username_opts','2023-12-28 05:56:19.336491'),(11,'auth','0005_alter_user_last_login_null','2023-12-28 05:56:19.403388'),(12,'auth','0006_require_contenttypes_0002','2023-12-28 05:56:19.411662'),(13,'auth','0007_alter_validators_add_error_messages','2023-12-28 05:56:19.428516'),(14,'auth','0008_alter_user_username_max_length','2023-12-28 05:56:19.461580'),(15,'auth','0009_alter_user_last_name_max_length','2023-12-28 05:56:19.495221'),(16,'auth','0010_alter_group_name_max_length','2023-12-28 05:56:19.528189'),(17,'auth','0011_update_proxy_permissions','2023-12-28 05:56:19.549749'),(18,'auth','0012_alter_user_first_name_max_length','2023-12-28 05:56:19.578513'),(19,'comment','0001_initial','2023-12-28 05:56:19.586351'),(20,'complaint','0001_initial','2023-12-28 05:56:19.595031'),(21,'feedback','0001_initial','2023-12-28 05:56:19.602996'),(22,'friend_request','0001_initial','2023-12-28 05:56:19.612146'),(23,'like','0001_initial','2023-12-28 05:56:19.628798'),(24,'login','0001_initial','2023-12-28 05:56:19.633255'),(25,'photo_upload','0001_initial','2023-12-28 05:56:19.645391'),(26,'sessions','0001_initial','2023-12-28 05:56:19.704380'),(27,'user','0001_initial','2023-12-28 05:56:19.711409');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('30s0h4xlnaz6yqw8iyljpmoncjcd11f1','eyJ1aWQiOjZ9:1riEyK:VTt9Dq_NQfIf0zDqONvL_IuWb2VLHcJaBo81Bl1txtE','2024-03-21 14:43:48.373180'),('3gd28rrtd9du0y3w2iubfidtujlomabt','eyJ1aWQiOjV9:1rhWIR:fo3f07XlVXAvV1TBu3TXZUZCJ3MmHiA9WE2xWutVW8Y','2024-03-19 15:01:35.131581'),('3yieqtsdthlmgvnyp28lz1zjbdii82t4','eyJ1aWQiOjEwfQ:1rjYK5:kNDzTL7YZ13VzyZSq5uOK-se6G9YfoJ27CcdPp1Gabs','2024-03-25 05:35:41.036590'),('7zziw5a3b0tns9kvn7a5y8h3y68zb4v3','eyJ1aWQiOjR9:1rg4b0:R3RYj_tXcfo6WmD3Di0-YDBCoRWXrrqtlqwrM-ctl3s','2024-03-15 15:14:46.812624'),('8vycj3tshfgl71jxv1plk8qqbpny16e4','eyJ1aWQiOjV9:1rhLoz:5TkbI2SRF7LvF01C7oVc7xdlpRFs5P80tKWWRu8JIXs','2024-03-19 03:50:29.597721'),('a2gpwf2uajymgl1vjlptngsl3d0nbwmo','eyJ1aWQiOjF9:1ra8RG:ncHQgXCLRjbLOfQux835rOciAJ6T18avm1-RgkZRycQ','2024-02-28 06:08:10.855994'),('gw0hce31vk6asuthu045nrebiz46dye3','eyJ1aWQiOjR9:1rgBWU:L4YIPykHK_s3Inm-rD3NIPpZ_TnpsVnNSKQn6Pr1OJA','2024-03-15 22:38:34.345249'),('ixwgzcmq23kyi0ywvksy7xz90cwazrm2','eyJ1aWQiOjF9:1rNWhJ:4FE0kHcc3n1HzuQcv9g2hplzsKZe3Vif0t7pH002VCE','2024-01-24 11:24:37.733815'),('ji05vne5fq867ynhxwjlwu9sb3fnd3d4','eyJ1aWQiOjZ9:1rhn72:cU5Ib_amIdm0c3YEiluV5sYMGZ0F_u-3TPSeTb3PPD8','2024-03-20 08:58:56.696503'),('m8raj3rejnvzkc6t0wwiv20lr6j8pkaa','eyJ1aWQiOjR9:1rgBeR:cOvBDdsr549TlROcJtRgHrqPZQ5e7mkxRj7MqUQFsLo','2024-03-15 22:46:47.117791'),('mkkwc5gevq83iu9wqcyj0nht6dqq5p21','eyJ1aWQiOjR9:1rgBgf:uKPYq5TNwQm-lZZqxZJoKSq1lMijX23ji_o0E7kyXKg','2024-03-15 22:49:05.729593'),('pg54w3ibocin034p5pewmlx8oazjmefz','eyJ1aWQiOjR9:1rg4BM:ZefozFaTjowoBdR7GUNtUn2YuEIA16XFDGeRcDmdR0A','2024-03-15 14:48:16.878267'),('t9j5xc6pa7i7pbfal6tj10w78h6p6o02','eyJ1aWQiOjV9:1rnAmi:LwZWbfRAafVJO0L7g1nGnDHz20jIdkCEEJQhtMlur3Y','2024-04-04 05:16:12.892474'),('vl7l8ky1ah8ju8n9phk2psmbho13lg4u','eyJ1aWQiOjJ9:1rlInE:3ZnYjZjS2ExUAFCvGGFAGtaOMVTkJFWrdP91mKTYnpE','2024-03-30 01:25:00.544440'),('xvjipm2d315vqktgbulvgm54d1kt6rim','eyJ1aWQiOjF9:1rSrJZ:98UUGTKH5aj60gemMroHyIQJTCayT_7wD1n9Q1QlHtU','2024-02-08 04:26:09.781212'),('y2u72fiva3f4zxlkxppxqecbvp1jrfkh','eyJ1aWQiOjR9:1rgGKo:GZ1HhgFBDMW_758C52B3tIEiyRhEae4Nh2WDLHP65x0','2024-03-16 03:46:50.147529'),('y8i4ll43dgbf8ib8l5a9rxevd04m5s5x','eyJ1aWQiOjR9:1rg4oz:u8J4I5c6CYuBqaRDCMr6Xpub0rsGFc5ZOO2waLs1VkM','2024-03-15 15:29:13.613730'),('za50kd35bm8j23fumuku9mxue843ppmb','eyJ1aWQiOjZ9:1riFt4:b6u29n3oM4AYjf49ZV3rTPUpxUmHY9xeFTzqtGgnmyg','2024-03-21 15:42:26.107492');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `request` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request`
--

LOCK TABLES `friend_request` WRITE;
/*!40000 ALTER TABLE `friend_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_request1`
--

DROP TABLE IF EXISTS `friend_request1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_request1` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `request` varchar(45) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request1`
--

LOCK TABLES `friend_request1` WRITE;
/*!40000 ALTER TABLE `friend_request1` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_request1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `user_id` int(11) NOT NULL,
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (1,1,0),(1,2,0);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'tfgautham','gautham18',1,'user'),(2,'mehulmadhav','mehulmadhav18',3,'user'),(3,'adwaid','adwaid18',4,'user'),(4,'sianjulian','sianjulian18',5,'user'),(5,'aswanthk','ashwanthk18',6,'user'),(6,'tfgautham','gautham18',7,'user');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  `upuser_id` int(11) NOT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,1,'approved',6),(2,1,6,'approved',6),(3,2,1,'approved',3),(4,2,3,'approved',3),(5,2,4,'approved',3),(6,2,3,'approved',3),(7,2,6,'approved',3),(8,2,3,'approved',3),(9,2,5,'approved',3),(10,2,3,'approved',3),(11,3,1,'approved',5),(12,3,5,'approved',5),(13,3,4,'approved',5),(14,3,5,'approved',5),(15,3,6,'approved',5),(16,3,5,'approved',5),(17,3,3,'approved',5),(18,3,5,'approved',5),(19,4,1,'approved',3),(20,4,3,'approved',3),(21,4,4,'pending',3),(22,4,3,'approved',3),(23,4,6,'pending',3),(24,4,3,'approved',3),(25,4,5,'approved',3),(26,4,3,'approved',3),(27,5,4,'pending',1),(28,5,1,'approved',1),(29,5,6,'pending',1),(30,5,1,'approved',1),(31,5,3,'pending',1),(32,5,1,'approved',1),(33,5,5,'approved',1),(34,5,1,'approved',1);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_upload`
--

DROP TABLE IF EXISTS `photo_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_upload` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `caption` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(100) NOT NULL,
  `like` varchar(30) DEFAULT NULL,
  `blur` varchar(200) DEFAULT NULL,
  `show` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_upload`
--

LOCK TABLES `photo_upload` WRITE;
/*!40000 ALTER TABLE `photo_upload` DISABLE KEYS */;
INSERT INTO `photo_upload` VALUES (1,'IMG_20230122_190604_099.jpg','',6,'2024-03-19','20:28:04','show','2','1blur.jpg','0'),(2,'gg.JPG','',3,'2024-03-19','20:32:21','show','7','2blur.jpg','0'),(3,'gg.JPG','',5,'2024-03-20','13:33:17','show','1','3blur.jpg','0'),(4,'gg.JPG','',3,'2024-03-21','09:17:41','hide','1','4blur.jpg','0'),(5,'gg.JPG','',1,'2024-03-21','10:45:33','hide','1','5blur.jpg','0');
/*!40000 ALTER TABLE `photo_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `age` varchar(11) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Gautham Bejoy','tfgautham','gauthambejoy@gmail.com','8714313476','2003-10-19','male','ddd.JPG','gautham18'),(2,'Mehul Madhav','mehulmadhav','mehulmadhav@gmail.com','9567450017','2002-11-23','on','','mehulmadhav18'),(3,'Mehul Madhav','mehulmadhav','mehulmadhav@gmail.com','9567450017','2002-11-23','male','WhatsApp Image 2024-03-17 at 21.41.06_0428cddc.jpg','mehulmadhav18'),(4,'Adwaid P','adwaid','adwaidp@gmail.com','9567512670','2003-02-15','male','adwaid.jpg','adwaid18'),(5,'Sian Julian','sianjulian','sianjulian@gmail.com','9446010657','2003-09-23','male','WhatsApp Image 2024-03-17 at 20.03.30_3f8134b3.jpg','sianjulian18'),(6,'Aswanth K','aswanthk','aswanthk@gmail.com','7293792607','2003-12-05','male','IMG.jpg','ashwanthk18'),(7,'Gautham Bejoy','tfgautham','gauthambejoy@gmail.com','8714313476','2003-10-19','on','7.jpg','gautham18');
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

-- Dump completed on 2024-03-21 10:48:47
