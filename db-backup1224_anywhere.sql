-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: setohima.mysql.pythonanywhere-services.com    Database: setohima$Guidance
-- ------------------------------------------------------
-- Server version	5.6.40-log

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


CREATE DATABASE IF NOT EXISTS setohima$Guidance DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

--
-- Table structure for table `Guidance_area`
--

DROP TABLE IF EXISTS `Guidance_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Guidance_area` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `level` int(11) NOT NULL,
  `kind` int(11) NOT NULL,
  UNIQUE KEY `id_pkey` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guidance_area`
--

LOCK TABLES `Guidance_area` WRITE;
/*!40000 ALTER TABLE `Guidance_area` DISABLE KEYS */;
INSERT INTO `Guidance_area` VALUES (1,'森林',1,1),(2,'森林',2,1),(3,'森林',3,1),(4,'森林',4,1),(5,'森林',5,1),(6,'森林',6,1),(7,'森林',7,1),(8,'荒地',1,2),(9,'荒地',2,2),(10,'荒地',3,2),(11,'荒地',4,2),(12,'荒地',5,2),(13,'荒地',6,2),(14,'荒地',7,2),(15,'陸珊瑚',1,3),(16,'陸珊瑚',2,3),(17,'陸珊瑚',3,3),(18,'陸珊瑚',4,3),(19,'陸珊瑚',5,3),(20,'陸珊瑚',6,3),(21,'陸珊瑚',7,3),(22,'瘴気',1,4),(23,'瘴気',2,4),(24,'瘴気',3,4),(25,'瘴気',4,4),(26,'瘴気',5,4),(27,'瘴気',6,4),(28,'瘴気',7,4),(29,'溶岩',1,5),(30,'溶岩',2,5),(31,'溶岩',3,5),(32,'溶岩',4,5),(33,'溶岩',5,5),(34,'溶岩',6,5),(35,'溶岩',7,5),(36,'氷雪',1,6),(37,'氷雪',2,6),(38,'氷雪',3,6),(39,'氷雪',4,6),(40,'氷雪',5,6),(41,'氷雪',6,6),(42,'氷雪',7,6);
/*!40000 ALTER TABLE `Guidance_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add guidance area',7,'add_guidancearea'),(26,'Can change guidance area',7,'change_guidancearea'),(27,'Can delete guidance area',7,'delete_guidancearea'),(28,'Can view guidance area',7,'view_guidancearea'),(29,'Can add monsters',8,'add_monsters'),(30,'Can change monsters',8,'change_monsters'),(31,'Can delete monsters',8,'delete_monsters'),(32,'Can view monsters',8,'view_monsters'),(33,'Can add reference custom rare monsters',9,'add_referencecustomraremonsters'),(34,'Can change reference custom rare monsters',9,'change_referencecustomraremonsters'),(35,'Can delete reference custom rare monsters',9,'delete_referencecustomraremonsters'),(36,'Can view reference custom rare monsters',9,'view_referencecustomraremonsters'),(37,'Can add reference monsters area',10,'add_referencemonstersarea'),(38,'Can change reference monsters area',10,'change_referencemonstersarea'),(39,'Can delete reference monsters area',10,'delete_referencemonstersarea'),(40,'Can view reference monsters area',10,'view_referencemonstersarea'),(41,'Can add reference parts wepname monsters',11,'add_referencepartswepnamemonsters'),(42,'Can change reference parts wepname monsters',11,'change_referencepartswepnamemonsters'),(43,'Can delete reference parts wepname monsters',11,'delete_referencepartswepnamemonsters'),(44,'Can view reference parts wepname monsters',11,'view_referencepartswepnamemonsters'),(45,'Can add reference upgrade materials',12,'add_referenceupgradematerials'),(46,'Can change reference upgrade materials',12,'change_referenceupgradematerials'),(47,'Can delete reference upgrade materials',12,'delete_referenceupgradematerials'),(48,'Can view reference upgrade materials',12,'view_referenceupgradematerials'),(49,'Can add reference weapons frame',13,'add_referenceweaponsframe'),(50,'Can change reference weapons frame',13,'change_referenceweaponsframe'),(51,'Can delete reference weapons frame',13,'delete_referenceweaponsframe'),(52,'Can view reference weapons frame',13,'view_referenceweaponsframe'),(53,'Can add weapons custom',14,'add_weaponscustom'),(54,'Can change weapons custom',14,'change_weaponscustom'),(55,'Can delete weapons custom',14,'delete_weaponscustom'),(56,'Can view weapons custom',14,'view_weaponscustom'),(57,'Can add weapons name',15,'add_weaponsname'),(58,'Can change weapons name',15,'change_weaponsname'),(59,'Can delete weapons name',15,'delete_weaponsname'),(60,'Can view weapons name',15,'view_weaponsname'),(61,'Can add weapons parts effect',16,'add_weaponspartseffect'),(62,'Can change weapons parts effect',16,'change_weaponspartseffect'),(63,'Can delete weapons parts effect',16,'delete_weaponspartseffect'),(64,'Can view weapons parts effect',16,'view_weaponspartseffect'),(65,'Can add weapons rare',17,'add_weaponsrare'),(66,'Can change weapons rare',17,'change_weaponsrare'),(67,'Can delete weapons rare',17,'delete_weaponsrare'),(68,'Can view weapons rare',17,'view_weaponsrare'),(69,'Can add weapons upgrade',18,'add_weaponsupgrade'),(70,'Can change weapons upgrade',18,'change_weaponsupgrade'),(71,'Can delete weapons upgrade',18,'delete_weaponsupgrade'),(72,'Can view weapons upgrade',18,'view_weaponsupgrade');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'guidance_emu','guidancearea'),(8,'guidance_emu','monsters'),(9,'guidance_emu','referencecustomraremonsters'),(10,'guidance_emu','referencemonstersarea'),(11,'guidance_emu','referencepartswepnamemonsters'),(12,'guidance_emu','referenceupgradematerials'),(13,'guidance_emu','referenceweaponsframe'),(14,'guidance_emu','weaponscustom'),(15,'guidance_emu','weaponsname'),(16,'guidance_emu','weaponspartseffect'),(17,'guidance_emu','weaponsrare'),(18,'guidance_emu','weaponsupgrade'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-22 08:11:36.642140'),(2,'auth','0001_initial','2019-12-22 08:13:08.525538'),(3,'admin','0001_initial','2019-12-22 08:13:38.958820'),(4,'admin','0002_logentry_remove_auto_add','2019-12-22 08:13:39.132829'),(5,'admin','0003_logentry_add_action_flag_choices','2019-12-22 08:13:39.143724'),(6,'contenttypes','0002_remove_content_type_name','2019-12-22 08:13:39.247514'),(7,'auth','0002_alter_permission_name_max_length','2019-12-22 08:13:39.291408'),(8,'auth','0003_alter_user_email_max_length','2019-12-22 08:13:39.341805'),(9,'auth','0004_alter_user_username_opts','2019-12-22 08:13:39.357648'),(10,'auth','0005_alter_user_last_login_null','2019-12-22 08:13:39.433179'),(11,'auth','0006_require_contenttypes_0002','2019-12-22 08:13:39.438879'),(12,'auth','0007_alter_validators_add_error_messages','2019-12-22 08:13:39.450896'),(13,'auth','0008_alter_user_username_max_length','2019-12-22 08:13:39.525525'),(14,'auth','0009_alter_user_last_name_max_length','2019-12-22 08:13:39.596841'),(15,'auth','0010_alter_group_name_max_length','2019-12-22 08:13:39.647426'),(16,'auth','0011_update_proxy_permissions','2019-12-22 08:13:39.662434'),(17,'guidance_emu','0001_initial','2019-12-22 08:13:39.681696'),(18,'sessions','0001_initial','2019-12-22 08:13:50.420574');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monsters`
--

DROP TABLE IF EXISTS `monsters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monsters` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `isVeteran` tinyint(1) NOT NULL,
  `material_name` varchar(30) NOT NULL,
  `isAlchemize` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monsters`
--

LOCK TABLES `monsters` WRITE;
/*!40000 ALTER TABLE `monsters` DISABLE KEYS */;
INSERT INTO `monsters` VALUES (0,'該当なし',0,'該当なし',0),(1,'アンジャナフ',0,'ゆらめく炎の毛皮',1),(2,'歴戦アンジャナフ',1,'歴戦の炎毛皮',1),(3,'アンジャナフ亜種',0,'ざわめく雷の毛皮',1),(4,'歴戦アンジャナフ亜種',1,'歴戦の雷毛皮',1),(5,'イヴェルカーナ',0,'極光の冠角',1),(6,'歴戦イヴェルカーナ',1,'歴戦の冠角',0),(7,'怒り食らうイビルジョー',0,'血に染まる漆黒皮',1),(8,'歴戦怒り食らうイビルジョー',1,'歴戦の漆黒皮',0),(9,'凍て刺すレイギエナ',0,'凍てつく氷結皮',1),(10,'歴戦凍て刺すレイギエナ',1,'歴戦の氷結皮',1),(11,'イャンガルルガ',0,'禍々しい銀狼毛',1),(12,'傷ついたイャンガルルガ',1,'歴戦の銀狼毛',1),(13,'ヴォルガノス',0,'灼熱の溶岩ヒレ',1),(14,'歴戦ヴォルガノス',1,'歴戦の溶岩ヒレ',1),(15,'ウラガンキン',0,'金属質な耐熱殻',1),(16,'歴戦ウラガンキン',1,'歴戦の耐熱殻',1),(17,'オドガロン',0,'命断ち切る惨爪',1),(18,'歴戦オドガロン',1,'歴戦の惨爪',1),(19,'オドガロン亜種',0,'魂切り裂く兇骨',1),(20,'歴戦オドガロン亜種',1,'歴戦の兇爪',1),(21,'キリン',0,'荘厳なる蒼角',1),(22,'歴戦キリン',1,'歴戦の蒼角',0),(23,'クシャルダオラ',0,'嵐を呼ぶ鋼翼',1),(24,'歴戦クシャルダオラ',1,'歴戦の鋼翼',0),(25,'クルルヤック',0,'鮮やかな飾り羽',1),(26,'紅蓮滾るバゼルギウス',0,'紅蓮の爆鱗',1),(27,'歴戦紅蓮滾るバゼルギウス',1,'歴戦の爆鱗',0),(28,'悉くを殲ぼすネルギガンテ',0,'生者必滅の大剛角',1),(29,'歴戦悉くを殲ぼすネルギガンテ',1,'歴戦の殲滅角',0),(30,'死を纏うヴァルハザク',0,'宵闇より昏き牙',1),(31,'歴戦死を纏うヴァルハザク',1,'歴戦の昏き牙',0),(32,'ジンオウガ',0,'みなぎる雷電殻',1),(33,'歴戦ジンオウガ',1,'歴戦の雷電殻',1),(34,'ジンオウガ亜種',0,'ほとばしる滅龍殻',1),(35,'歴戦ジンオウガ亜種',1,'歴戦の滅龍殻',0),(36,'ツィツィヤック',0,'ギラつく閃光膜',1),(37,'ディアブロス',0,'勇壮なねじれた角',1),(38,'歴戦ディアブロス',1,'歴戦のねじれた角',1),(39,'ディアブロス亜種',0,'暴君の黒巻き角',1),(40,'歴戦ディアブロス亜種',1,'歴戦の黒巻き角',1),(41,'ティガレックス',0,'強者のアギト',1),(42,'歴戦ティガレックス',1,'歴戦のアギト',1),(43,'ティガレックス亜種',0,'戦慄の黒アギト',1),(44,'歴戦ティガレックス亜種',1,'歴戦の黒アギト',0),(45,'ディノバルド',0,'灼炎の断剣尾',1),(46,'歴戦ディノバルド',1,'歴戦の断剣尾',1),(47,'ディノバルド亜種',0,'研ぎ澄まされた斬鉄尾',1),(48,'歴戦ディノバルド亜種',1,'歴戦の斬鉄尾',1),(49,'テオ・テスカトル',0,'獄炎のたてがみ',1),(50,'歴戦テオ・テスカトル',1,'歴戦の紅きたてがみ',0),(51,'ドスギルオス',0,'闇夜の頭巾殻',1),(52,'ドスジャグラス',0,'雄々しきたてがみ',1),(53,'ドドガマル',0,'重量級の大顎',1),(54,'トビカガチ',0,'まばゆい雷光針',1),(55,'歴戦トビカガチ',1,'歴戦の雷光針',1),(56,'トビカガチ亜種',0,'妖艶な猛毒針',1),(57,'歴戦トビカガチ亜種',1,'歴戦の猛毒針',1),(58,'ナナ・テスカトリ',0,'蒼炎のたてがみ',1),(59,'歴戦ナナ・テスカトリ',1,'歴戦の蒼きたてがみ',0),(60,'ナルガクルガ',0,'暗殺者の刃翼',1),(61,'歴戦ナルガクルガ',1,'歴戦の刃翼',1),(62,'ネロミェール',0,'幻惑する特上皮',1),(63,'歴戦ネロミェール',1,'歴戦の幻惑皮',0),(64,'パオウルムー',0,'超弾力ゴム殻',1),(65,'歴戦パオウルムー',1,'歴戦のゴム質殻',1),(66,'パオウルムー亜種',0,'漆黒の高級毛皮',1),(67,'歴戦パオウルムー亜種',1,'歴戦の黒毛皮',1),(68,'バフバロ',0,'古強者の巨大な角',1),(69,'歴戦バフバロ',1,'歴戦の巨大な角',1),(70,'プケプケ',0,'甘く香り立つ毒喉袋',1),(71,'歴戦プケプケ',1,'歴戦の猛毒喉袋',1),(72,'プケプケ亜種',0,'潤いに満ちた喉袋',1),(73,'歴戦プケプケ亜種',1,'歴戦の大水喉袋',1),(74,'ブラキディオス',0,'つややかな黒曜甲',1),(75,'歴戦ブラキディオス',1,'歴戦の黒曜甲',1),(76,'ベリオロス',0,'冷血の氷牙',1),(77,'歴戦ベリオロス',1,'歴戦の氷牙',1),(78,'ボルボロス',0,'泥の王冠角',1),(79,'歴戦ボルボロス',1,'歴戦の王冠角',1),(80,'ラージャン',0,'闘気あふれる煌毛',1),(81,'歴戦ラージャン',1,'歴戦の煌毛',0),(82,'ラドバルキン',0,'墨染めの重油殻',1),(83,'歴戦ラドバルキン',1,'歴戦の重油殻',1),(84,'リオレイア',0,'女王の竜鱗',1),(85,'歴戦レオレイア',1,'歴戦の竜鱗【緑】',1),(86,'リオレイア亜種',0,'桜花の龍鱗',1),(87,'歴戦リオレイア亜種',1,'歴戦の龍鱗【桜】',1),(88,'リオレイア希少種',0,'月光の龍鱗',1),(89,'歴戦リオレイア希少種',1,'歴戦の龍鱗【金】',0),(90,'リオレウス',0,'王者の龍鱗',1),(91,'歴戦リオレウス',1,'歴戦の龍鱗【赤】',1),(92,'リオレウス亜種',0,'蒼天の龍鱗',1),(93,'歴戦リオレウス亜種',1,'歴戦の龍鱗【蒼】',1),(94,'リオレウス希少種',0,'烈日の龍鱗',1),(95,'歴戦リオレウス希少種',1,'歴戦の龍鱗【銀】',0),(96,'レイギエナ',0,'滑らかな氷皮',1),(97,'歴戦レイギエナ',1,'歴戦の氷皮',1);
/*!40000 ALTER TABLE `monsters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_custom_rare_monsters`
--

DROP TABLE IF EXISTS `reference_custom_rare_monsters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_custom_rare_monsters` (
  `rare_id` int(11) NOT NULL,
  `custom_id` int(11) NOT NULL,
  `monster_id` int(11) NOT NULL,
  `mate_num` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `rare_custom_pkey` (`rare_id`,`custom_id`,`monster_id`) USING BTREE,
  KEY `reference_custom_rare_monsters_custom_id_fkey` (`custom_id`),
  KEY `reference_custom_rare_monsters_monster_id_fkey` (`monster_id`),
  CONSTRAINT `reference_custom_rare_monsters_custom_id_fkey` FOREIGN KEY (`custom_id`) REFERENCES `weapons_custom` (`id`),
  CONSTRAINT `reference_custom_rare_monsters_monster_id_fkey` FOREIGN KEY (`monster_id`) REFERENCES `monsters` (`id`),
  CONSTRAINT `reference_custom_rare_monsters_rare_id_fkey` FOREIGN KEY (`rare_id`) REFERENCES `weapons_rare` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_custom_rare_monsters`
--

LOCK TABLES `reference_custom_rare_monsters` WRITE;
/*!40000 ALTER TABLE `reference_custom_rare_monsters` DISABLE KEYS */;
INSERT INTO `reference_custom_rare_monsters` VALUES (1,1,1,9),(1,2,3,5),(1,2,38,7),(1,3,42,7),(1,3,91,5),(1,4,53,5),(1,4,81,7),(1,5,25,9),(1,6,23,9),(1,6,60,5),(1,7,55,5),(1,7,61,7),(1,8,13,5),(1,8,27,7),(1,9,52,9),(1,10,70,9),(1,11,66,9),(1,12,68,5),(1,12,90,7),(1,13,3,5),(1,13,39,9),(1,14,32,5),(1,14,88,9),(1,15,59,7),(1,15,67,3),(1,16,15,5),(1,16,89,7),(1,17,18,7),(1,17,82,5),(1,18,41,5),(1,18,48,7),(1,19,20,3),(1,19,31,7),(1,20,26,5),(1,20,95,7),(1,21,36,9),(1,22,65,5),(1,22,96,9),(1,23,47,5),(1,23,62,9),(1,24,22,7),(1,24,87,3),(2,1,17,9),(2,1,68,5),(2,2,21,5),(2,2,94,9),(2,3,10,5),(2,3,28,7),(2,5,3,5),(2,5,11,9),(2,6,4,3),(2,6,93,7),(2,7,14,3),(2,7,27,7),(2,8,33,7),(2,8,76,5),(2,9,78,9),(2,10,84,9),(2,11,37,9),(2,12,79,7),(2,13,2,3),(2,13,49,9),(2,14,16,3),(2,14,75,7),(2,15,56,5),(2,15,59,7),(2,16,57,3),(2,16,89,7),(2,17,12,7),(2,17,71,3),(2,18,8,7),(2,18,85,3),(2,19,9,5),(2,19,29,7),(2,21,51,9),(2,22,41,9),(2,22,82,5),(2,23,19,5),(2,23,30,9),(2,24,29,7),(2,24,35,5),(3,1,7,5),(3,1,24,7),(3,2,80,5),(3,2,95,7),(3,5,45,9),(3,6,50,7),(3,6,58,5),(3,7,29,7),(3,7,77,5),(3,9,64,9),(3,10,72,9),(3,11,97,7),(3,12,53,5),(3,12,75,7),(3,13,5,5),(3,13,40,7),(3,14,34,5),(3,14,89,7),(3,17,32,5),(3,17,63,7),(3,18,27,3),(3,18,95,7),(3,21,17,5),(3,21,83,7),(3,22,30,5),(3,22,43,9),(3,23,74,5),(3,23,89,7);
/*!40000 ALTER TABLE `reference_custom_rare_monsters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_monsters_area`
--

DROP TABLE IF EXISTS `reference_monsters_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_monsters_area` (
  `monsters_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  UNIQUE KEY `ref_mob_area` (`monsters_id`,`area_id`) USING BTREE,
  KEY `area_id` (`area_id`),
  CONSTRAINT `reference_monsters_area_ibfk_1` FOREIGN KEY (`monsters_id`) REFERENCES `monsters` (`id`),
  CONSTRAINT `reference_monsters_area_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `Guidance_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_monsters_area`
--

LOCK TABLES `reference_monsters_area` WRITE;
/*!40000 ALTER TABLE `reference_monsters_area` DISABLE KEYS */;
INSERT INTO `reference_monsters_area` VALUES (1,1),(1,2),(1,3),(1,4),(1,9),(1,10),(1,11),(2,5),(2,6),(2,7),(2,12),(2,13),(2,14),(3,2),(3,3),(3,4),(3,9),(3,10),(3,11),(3,16),(3,17),(3,18),(3,23),(3,24),(3,25),(3,30),(3,31),(3,32),(3,37),(3,38),(3,39),(4,5),(4,6),(4,7),(4,12),(4,13),(4,14),(4,19),(4,20),(4,21),(4,26),(4,27),(4,28),(4,33),(4,34),(4,35),(4,40),(4,41),(4,42),(5,5),(5,6),(5,12),(5,13),(5,19),(5,20),(5,26),(5,27),(5,40),(5,41),(6,7),(6,14),(6,21),(6,28),(6,42),(7,5),(7,6),(7,12),(7,13),(7,19),(7,20),(7,26),(7,27),(7,33),(7,34),(7,40),(7,41),(8,7),(8,14),(8,21),(8,28),(8,35),(8,42),(9,38),(9,39),(9,40),(10,41),(10,42),(11,3),(11,4),(11,5),(12,6),(12,7),(13,29),(13,30),(13,31),(14,32),(14,33),(14,34),(14,35),(15,30),(15,31),(15,32),(16,33),(16,34),(16,35),(17,18),(17,19),(17,23),(17,24),(17,25),(18,20),(18,21),(18,26),(18,27),(19,3),(19,4),(19,5),(19,10),(19,11),(19,12),(19,17),(19,18),(19,19),(19,24),(19,25),(19,26),(19,31),(19,32),(19,33),(19,38),(19,39),(19,40),(20,6),(20,7),(20,13),(20,14),(20,20),(20,21),(20,27),(20,28),(20,34),(20,35),(20,41),(20,42),(21,19),(21,20),(22,21),(23,5),(23,6),(23,33),(23,34),(24,7),(24,35),(25,8),(25,9),(25,10),(25,11),(25,12),(25,13),(25,14),(26,32),(26,33),(26,34),(27,35),(28,5),(28,6),(28,12),(28,13),(28,19),(28,20),(28,26),(28,27),(28,33),(28,34),(28,40),(28,41),(29,7),(29,14),(29,21),(29,28),(29,35),(29,42),(30,26),(30,27),(31,28),(32,2),(32,3),(32,4),(32,5),(32,17),(32,18),(32,19),(33,6),(33,7),(33,20),(33,21),(34,38),(34,39),(34,40),(34,41),(35,42),(36,15),(36,16),(36,17),(36,18),(36,19),(36,20),(36,21),(37,9),(37,10),(37,11),(38,12),(38,13),(38,14),(39,10),(39,11),(39,12),(40,13),(40,14),(41,3),(41,4),(41,5),(41,10),(41,11),(41,12),(41,23),(41,24),(41,25),(41,26),(41,31),(41,32),(41,33),(41,38),(41,39),(41,40),(42,6),(42,7),(42,13),(42,14),(42,27),(42,28),(42,34),(42,35),(42,41),(42,42),(43,27),(44,28),(45,3),(45,4),(45,5),(45,9),(45,10),(45,11),(45,12),(45,31),(45,32),(45,33),(46,6),(46,7),(46,13),(46,14),(46,34),(46,35),(47,24),(47,25),(47,26),(48,27),(48,28),(49,12),(49,13),(49,33),(49,34),(50,14),(50,35),(51,22),(51,23),(51,24),(51,25),(51,26),(51,27),(51,28),(52,1),(52,2),(52,3),(52,4),(52,5),(52,6),(52,7),(53,29),(53,30),(53,31),(53,32),(53,33),(53,34),(53,35),(54,1),(54,2),(54,3),(55,4),(55,5),(55,6),(55,7),(56,36),(56,37),(56,38),(56,39),(57,40),(57,41),(57,42),(58,12),(58,13),(58,33),(58,34),(59,14),(59,35),(60,2),(60,3),(60,4),(60,5),(60,17),(60,18),(60,19),(61,6),(61,7),(61,20),(61,21),(62,19),(62,20),(63,21),(64,15),(64,16),(64,17),(65,18),(65,19),(65,20),(65,21),(66,2),(66,3),(66,4),(66,8),(66,9),(66,10),(66,11),(67,5),(67,6),(67,7),(67,12),(67,13),(67,14),(68,2),(68,3),(68,9),(68,10),(68,15),(68,16),(68,17),(68,22),(68,23),(68,24),(68,29),(68,30),(68,31),(68,36),(68,37),(68,38),(69,4),(69,5),(69,6),(69,7),(69,11),(69,12),(69,13),(69,14),(69,18),(69,19),(69,20),(69,21),(69,25),(69,26),(69,27),(69,28),(69,32),(69,33),(69,34),(69,35),(69,39),(69,40),(69,41),(69,42),(70,1),(70,2),(70,3),(70,8),(70,9),(70,10),(71,4),(71,5),(71,6),(71,7),(71,11),(71,12),(71,13),(71,14),(72,15),(72,16),(72,17),(72,18),(73,19),(73,20),(73,21),(74,30),(74,31),(74,32),(75,33),(75,34),(75,35),(76,37),(76,38),(76,39),(76,40),(77,41),(77,42),(78,8),(78,9),(78,10),(79,11),(79,12),(79,13),(79,14),(80,4),(80,5),(80,6),(80,7),(80,11),(80,12),(80,13),(80,14),(80,18),(80,19),(80,20),(80,21),(80,25),(80,26),(80,27),(80,28),(80,31),(80,32),(80,33),(80,34),(80,39),(80,40),(80,41),(80,42),(81,35),(82,22),(82,23),(82,24),(83,25),(83,26),(83,27),(83,28),(84,2),(84,3),(84,4),(84,8),(84,9),(84,10),(84,11),(85,5),(85,6),(85,7),(85,12),(85,13),(85,14),(86,9),(86,10),(86,11),(86,16),(86,17),(86,18),(87,12),(87,13),(87,14),(87,19),(87,20),(87,21),(88,13),(88,34),(88,35),(89,14),(90,2),(90,3),(90,4),(90,31),(90,32),(91,5),(91,6),(91,7),(91,33),(91,34),(91,35),(92,3),(92,4),(92,5),(92,32),(92,33),(93,6),(93,7),(93,34),(93,35),(94,20),(94,34),(94,35),(95,21),(96,16),(96,17),(96,18),(96,37),(96,38),(96,39),(97,19),(97,20),(97,21),(97,40),(97,41),(97,42);
/*!40000 ALTER TABLE `reference_monsters_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_parts_wepname_monsters`
--

DROP TABLE IF EXISTS `reference_parts_wepname_monsters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_parts_wepname_monsters` (
  `wepname_id` int(11) DEFAULT NULL,
  `partseffect_id` int(11) DEFAULT NULL,
  `monster_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `mate_num` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `ref_wepname_parts_pnkey` (`wepname_id`,`partseffect_id`) USING BTREE,
  KEY `reference_parts_wepname_monsters_monster_id_fkey` (`monster_id`),
  KEY `reference_parts_wepname_monsters_parts_id_fkey` (`partseffect_id`),
  CONSTRAINT `reference_parts_wepname_monsters_monster_id_fkey` FOREIGN KEY (`monster_id`) REFERENCES `monsters` (`id`),
  CONSTRAINT `reference_parts_wepname_monsters_parts_id_fkey` FOREIGN KEY (`partseffect_id`) REFERENCES `weapons_parts_effect` (`id`),
  CONSTRAINT `reference_parts_wepname_monsters_wepname_id_fkey` FOREIGN KEY (`wepname_id`) REFERENCES `weapons_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_parts_wepname_monsters`
--

LOCK TABLES `reference_parts_wepname_monsters` WRITE;
/*!40000 ALTER TABLE `reference_parts_wepname_monsters` DISABLE KEYS */;
INSERT INTO `reference_parts_wepname_monsters` VALUES (1,29,0,'冥灯龍パーツ',0),(2,15,0,'カンタロスパーツ',0),(2,16,0,'凍魚竜パーツ',0),(2,19,0,'熔山龍パーツ',0),(2,22,0,'泥魚竜パーツ',0),(2,26,0,'熔山龍パーツ',0),(2,28,0,'冥灯龍パーツ',0),(3,6,0,'熔山龍パーツ',0),(3,16,0,'凍魚竜パーツ',0),(3,24,0,'溶岩竜パーツ',0),(3,29,0,'冥灯龍パーツ',0),(4,9,0,'カンタロスパーツ',0),(4,22,0,'泥魚竜パーツ',0),(4,26,0,'熔山龍パーツ',0),(4,29,0,'冥灯龍パーツ',0),(5,29,0,'冥灯龍パーツ',0),(6,4,0,'爆鱗竜パーツ',0),(6,23,0,'ランゴスタパーツ',0),(6,29,0,'冥灯龍パーツ',0),(7,12,62,'溟龍パーツ',5),(7,11,19,'兇爪竜パーツ',5),(7,10,60,'迅竜パーツ',5),(7,9,66,'浮眠竜パーツ',5),(7,8,25,'掻鳥パーツ',5),(7,7,29,'滅尽龍パーツ改',5),(7,6,75,'砕竜パーツ',5),(7,5,28,'滅尽龍パーツ',5),(7,4,90,'火竜パーツ',5),(7,3,17,'惨爪竜パーツ',5),(7,1,78,'土砂竜パーツ',5),(6,26,21,'幻獣パーツ',5),(6,25,96,'風漂竜パーツ',5),(6,24,72,'水妖鳥パーツ',5),(6,22,70,'毒妖鳥パーツ',5),(6,14,77,'氷牙竜パーツ',5),(6,12,62,'溟龍パーツ',5),(6,11,3,'雷顎竜パーツ',5),(6,10,66,'浮眠竜パーツ',5),(6,9,64,'浮空竜パーツ',5),(6,8,25,'掻鳥パーツ',5),(6,7,29,'滅尽龍パーツ改',5),(6,6,75,'砕竜パーツ',5),(6,5,28,'滅尽龍パーツ',5),(6,3,1,'蛮顎竜パーツ',5),(6,2,82,'骨鎚竜パーツ',5),(5,26,30,'屍套龍パーツ',5),(5,25,3,'雷顎竜パーツ',5),(5,24,1,'蛮顎竜パーツ',5),(5,23,82,'骨鎚竜パーツ',5),(5,22,70,'毒妖鳥パーツ',5),(7,16,0,'カンタロスパーツ',0),(7,29,0,'冥灯龍パーツ',0),(8,22,0,'泥魚竜パーツ',0),(8,26,0,'爆鱗竜パーツ',0),(8,29,0,'冥灯龍パーツ',0),(9,26,0,'爆鱗竜パーツ',0),(9,29,0,'冥灯龍パーツ',0),(10,2,0,'凍魚竜パーツ',0),(10,15,0,'岩賊竜パーツ',0),(7,2,0,'岩賊竜パーツ',0),(6,1,0,'岩賊竜パーツ',0),(10,22,0,'泥魚竜パーツ',0),(10,29,0,'冥灯龍パーツ',0),(11,1,0,'岩賊竜パーツ',0),(11,16,0,'凍魚竜パーツ',0),(11,29,0,'冥灯龍パーツ',0),(12,28,0,'冥灯龍パーツ',0),(13,28,0,'冥灯龍パーツ',0),(14,6,0,'熔山龍パーツ',0),(14,16,0,'岩賊竜パーツ',0),(14,28,0,'冥灯龍パーツ',0),(1,1,52,'賊竜パーツ',5),(1,2,1,'蛮顎竜パーツ',5),(1,3,82,'骨鎚竜パーツ',5),(1,4,45,'斬竜パーツ',5),(1,5,28,'滅尽龍パーツ',5),(1,6,63,'溟龍パーツ',5),(1,7,29,'滅尽龍パーツ改',5),(1,8,51,'痺賊竜パーツ',5),(1,9,64,'浮空竜パーツ',5),(1,10,66,'浮眠竜パーツ',5),(1,11,90,'火竜パーツ',5),(1,12,47,'硫斬竜パーツ',5),(1,14,77,'氷牙竜パーツ',5),(1,22,78,'土砂竜パーツ',5),(1,23,70,'毒妖鳥パーツ',5),(1,24,72,'水妖鳥パーツ',5),(1,25,96,'風漂竜パーツ',5),(1,26,21,'幻獣パーツ',5),(2,1,36,'眩鳥パーツ',5),(2,2,68,'猛牛竜パーツ',5),(2,3,37,'角竜パーツ',5),(2,4,41,'轟竜パーツ',5),(2,5,28,'滅尽龍パーツ',5),(2,6,75,'砕竜パーツ',5),(2,7,29,'滅尽龍パーツ改',5),(2,8,25,'掻鳥パーツ',5),(2,9,54,'飛雷竜パーツ',5),(2,10,17,'惨爪竜パーツ',5),(2,11,60,'迅竜パーツ',5),(2,12,43,'黒轟竜パーツ',5),(2,14,35,'獄狼竜パーツ',5),(2,17,0,'溶岩竜パーツ',0),(2,18,39,'黒角竜パーツ',5),(2,23,1,'蛮顎竜パーツ',5),(2,24,56,'飛毒竜パーツ',5),(2,25,3,'雷顎竜パーツ',5),(3,1,52,'賊竜パーツ',5),(3,2,68,'猛牛竜パーツ',5),(3,3,82,'骨鎚竜パーツ',5),(3,4,47,'硫斬竜パーツ',5),(3,5,28,'滅尽龍パーツ',5),(3,7,29,'滅尽龍パーツ改',5),(3,8,51,'痺賊竜パーツ',5),(3,9,66,'浮眠竜パーツ',5),(3,10,60,'迅竜パーツ',5),(3,11,90,'火竜パーツ',5),(3,12,30,'屍套龍パーツ',5),(3,14,35,'獄狼竜パーツ',5),(3,15,78,'土砂竜パーツ',5),(3,22,70,'毒妖鳥パーツ',5),(3,23,72,'水妖鳥パーツ',5),(3,25,45,'斬竜パーツ',5),(3,26,32,'雷狼竜パーツ',5),(4,1,36,'眩鳥パーツ',5),(4,2,68,'猛牛竜パーツ',5),(4,3,1,'蛮顎竜パーツ',5),(4,4,47,'硫斬竜パーツ',5),(4,5,28,'滅尽龍パーツ',5),(4,6,75,'砕竜パーツ',5),(4,7,29,'滅尽龍パーツ改',5),(4,8,25,'掻鳥パーツ',5),(4,10,56,'飛毒竜パーツ',5),(4,11,3,'雷顎竜パーツ',5),(4,12,30,'屍套龍パーツ',5),(4,13,31,'屍套龍パーツ改',5),(4,14,77,'氷牙竜パーツ',5),(4,23,54,'飛雷竜パーツ',5),(4,24,96,'風漂竜パーツ',5),(4,25,45,'斬竜パーツ',5),(4,27,16,'爆鎚竜パーツ',5),(5,1,51,'痺賊竜パーツ',5),(5,2,78,'土砂竜パーツ',5),(5,3,37,'角竜パーツ',5),(5,4,41,'轟竜パーツ',5),(5,5,28,'滅尽龍パーツ',5),(5,6,16,'爆鎚竜パーツ',5),(5,7,29,'滅尽龍パーツ改',5),(5,8,25,'掻鳥パーツ',5),(5,9,68,'猛牛竜パーツ',5),(5,10,66,'浮眠竜パーツ',5),(5,11,11,'黒狼鳥パーツ',5),(5,12,43,'黒轟竜パーツ',5),(5,14,77,'氷牙竜パーツ',5),(5,18,39,'黒角竜パーツ',5),(14,14,77,'氷牙竜パーツ',5),(14,15,70,'毒妖鳥パーツ',5),(14,17,72,'水妖鳥パーツ',5),(14,12,62,'溟龍パーツ',5),(14,11,1,'蛮顎竜パーツ',5),(14,10,56,'飛毒竜パーツ',5),(14,9,54,'飛雷竜パーツ',5),(14,8,36,'眩鳥パーツ',5),(14,7,29,'滅尽龍パーツ改',5),(14,4,37,'角竜パーツ',5),(14,5,28,'滅尽龍パーツ',5),(14,3,66,'浮眠竜パーツ',5),(14,2,82,'骨鎚竜パーツ',5),(14,1,52,'賊竜パーツ',5),(13,15,78,'土砂竜パーツ',5),(13,16,72,'水妖鳥パーツ',5),(13,17,11,'黒狼鳥パーツ',5),(13,18,41,'轟竜パーツ',5),(13,19,43,'黒轟竜パーツ',5),(13,27,27,'爆鱗竜パーツ改',5),(13,14,35,'獄狼竜パーツ',5),(13,11,92,'蒼火竜パーツ',5),(13,13,95,'銀火竜パーツ',5),(13,12,30,'屍套龍パーツ',5),(12,13,95,'銀火竜パーツ',5),(13,1,52,'賊竜パーツ',5),(13,2,68,'猛牛竜パーツ',5),(13,3,60,'迅竜パーツ',5),(13,4,45,'斬竜パーツ',5),(13,5,28,'滅尽龍パーツ',5),(13,6,75,'砕竜パーツ',5),(13,7,29,'滅尽龍パーツ改',5),(13,8,64,'浮空竜パーツ',5),(13,9,66,'浮眠竜パーツ',5),(13,10,17,'惨爪竜パーツ',5),(12,25,3,'雷顎竜パーツ',5),(12,26,30,'屍套龍パーツ',5),(12,27,89,'金火竜パーツ',5),(12,10,90,'火竜パーツ',5),(12,11,92,'蒼火竜パーツ',5),(12,12,43,'黒轟竜パーツ',5),(12,14,77,'氷牙竜パーツ',5),(12,15,70,'毒妖鳥パーツ',5),(12,17,37,'角竜パーツ',5),(12,16,72,'水妖鳥パーツ',5),(12,18,47,'硫斬竜パーツ',5),(12,22,54,'飛雷竜パーツ',5),(12,23,86,'桜火竜パーツ',5),(12,24,96,'風漂竜パーツ',5),(12,9,66,'浮眠竜パーツ',5),(12,8,25,'掻鳥パーツ',5),(12,7,29,'滅尽龍パーツ改',5),(12,6,31,'屍套龍パーツ改',5),(12,5,28,'滅尽龍パーツ',5),(12,4,41,'轟竜パーツ',5),(12,3,45,'斬竜パーツ',5),(12,2,1,'蛮顎竜パーツ',5),(12,1,68,'猛牛竜パーツ',5),(11,26,30,'屍套龍パーツ',5),(11,25,39,'黒角竜パーツ',5),(11,24,90,'火竜パーツ',5),(11,23,72,'水妖鳥パーツ',5),(11,22,70,'毒妖鳥パーツ',5),(11,19,43,'黒轟竜パーツ',5),(11,17,56,'飛毒竜パーツ',5),(11,15,36,'眩鳥パーツ',5),(11,14,35,'獄狼竜パーツ',5),(11,12,62,'溟龍パーツ',5),(11,11,60,'迅竜パーツ',5),(11,10,17,'惨爪竜パーツ',5),(11,9,54,'飛雷竜パーツ',5),(11,8,25,'掻鳥パーツ',5),(11,7,29,'滅尽龍パーツ改',5),(11,6,31,'屍套龍パーツ改',5),(11,5,28,'滅尽龍パーツ',5),(11,4,41,'轟竜パーツ',5),(11,3,37,'角竜パーツ',5),(11,2,66,'浮眠竜パーツ',5),(10,26,30,'屍套龍パーツ',5),(10,25,39,'黒角竜パーツ',5),(10,24,90,'火竜パーツ',5),(10,23,54,'飛雷竜パーツ',5),(10,19,43,'黒轟竜パーツ',5),(10,14,35,'獄狼竜パーツ',5),(10,12,62,'溟龍パーツ',5),(10,11,60,'迅竜パーツ',5),(10,10,17,'惨爪竜パーツ',5),(10,9,56,'飛毒竜パーツ',5),(10,8,51,'痺賊竜パーツ',5),(10,7,29,'滅尽龍パーツ改',5),(10,6,31,'屍套龍パーツ改',5),(10,5,28,'滅尽龍パーツ',5),(10,4,41,'轟竜パーツ',5),(10,3,37,'角竜パーツ',5),(10,1,52,'賊竜パーツ',5),(9,27,27,'爆鱗竜パーツ改',5),(9,23,72,'水妖鳥パーツ',5),(9,18,47,'硫斬竜パーツ',5),(9,19,43,'黒轟竜パーツ',5),(9,20,16,'爆鎚竜パーツ',5),(9,22,70,'毒妖鳥パーツ',5),(9,24,96,'風漂竜パーツ',5),(9,25,32,'雷狼竜パーツ',5),(9,17,45,'斬竜パーツ',5),(9,16,68,'猛牛竜パーツ',5),(9,15,78,'土砂竜パーツ',5),(9,9,66,'浮眠竜パーツ',5),(9,10,90,'火竜パーツ',5),(9,11,11,'黒狼鳥パーツ',5),(9,12,30,'屍套龍パーツ',5),(9,13,31,'屍套龍パーツ改',5),(9,14,35,'獄狼竜パーツ',5),(9,8,64,'浮空竜パーツ',5),(9,7,29,'滅尽龍パーツ改',5),(9,6,75,'砕竜パーツ',5),(9,5,28,'滅尽龍パーツ',5),(9,4,92,'蒼火竜パーツ',5),(9,3,41,'轟竜パーツ',5),(9,2,37,'角竜パーツ',5),(9,1,52,'賊竜パーツ',5),(8,27,27,'爆鱗竜パーツ改',5),(8,25,3,'雷顎竜パーツ',5),(8,24,96,'風漂竜パーツ',5),(8,23,1,'蛮顎竜パーツ',5),(8,18,45,'斬竜パーツ',5),(8,15,78,'土砂竜パーツ',5),(8,14,10,'風漂竜パーツ改',5),(8,13,31,'屍套龍パーツ改',5),(8,5,28,'滅尽龍パーツ',5),(8,6,75,'砕竜パーツ',5),(8,7,29,'滅尽龍パーツ改',5),(8,8,51,'痺賊竜パーツ',5),(8,9,54,'飛雷竜パーツ',5),(8,10,60,'迅竜パーツ',5),(8,11,11,'黒狼鳥パーツ',5),(8,12,30,'屍套龍パーツ',5),(8,4,47,'硫斬竜パーツ',5),(8,3,90,'火竜パーツ',5),(8,2,68,'猛牛竜パーツ',5),(8,1,52,'賊竜パーツ',5),(7,28,35,'獄狼竜パーツ',5),(7,25,32,'雷狼竜パーツ',5),(7,26,30,'屍套龍パーツ',5),(7,24,96,'風漂竜パーツ',5),(7,23,72,'水妖鳥パーツ',5),(7,22,70,'毒妖鳥パーツ',5),(7,21,10,'風漂竜パーツ改',5),(7,14,77,'氷牙竜パーツ',5);
/*!40000 ALTER TABLE `reference_parts_wepname_monsters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_upgrade_materials`
--

DROP TABLE IF EXISTS `reference_upgrade_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_upgrade_materials` (
  `id_upgrade` int(11) DEFAULT NULL,
  `id_monsters` int(11) DEFAULT NULL,
  `id_rare` int(11) DEFAULT NULL,
  `mate_num` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `ref_upg_mat_pkey` (`id_upgrade`,`id_monsters`,`id_rare`) USING BTREE,
  KEY `reference_upgrade_materials_id_monsters_fkey` (`id_monsters`),
  KEY `reference_upgrade_materials_id_rare_fkey` (`id_rare`),
  CONSTRAINT `reference_upgrade_materials_id_monsters_fkey` FOREIGN KEY (`id_monsters`) REFERENCES `monsters` (`id`),
  CONSTRAINT `reference_upgrade_materials_id_rare_fkey` FOREIGN KEY (`id_rare`) REFERENCES `weapons_rare` (`id`),
  CONSTRAINT `reference_upgrade_materials_id_upgrade_fkey` FOREIGN KEY (`id_upgrade`) REFERENCES `weapons_upgrade` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_upgrade_materials`
--

LOCK TABLES `reference_upgrade_materials` WRITE;
/*!40000 ALTER TABLE `reference_upgrade_materials` DISABLE KEYS */;
INSERT INTO `reference_upgrade_materials` VALUES (1,0,3,0),(1,0,2,0),(1,0,1,0),(4,29,3,5),(4,35,3,5),(3,81,3,5),(2,28,3,5),(4,10,2,4),(4,29,2,4),(3,81,2,4),(2,6,2,3),(4,77,1,3),(4,29,1,3),(3,81,1,3),(2,69,1,3);
/*!40000 ALTER TABLE `reference_upgrade_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_weapons_frame`
--

DROP TABLE IF EXISTS `reference_weapons_frame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_weapons_frame` (
  `id_rare` int(11) NOT NULL,
  `id_upgrade` int(11) NOT NULL,
  `frame_nums` int(11) NOT NULL,
  UNIQUE KEY `ref_wep_frame_pkey` (`id_rare`,`id_upgrade`) USING BTREE,
  KEY `reference_weapons_frame_id_upgrade_fkey` (`id_upgrade`),
  CONSTRAINT `reference_weapons_frame_id_rare_fkey` FOREIGN KEY (`id_rare`) REFERENCES `weapons_rare` (`id`),
  CONSTRAINT `reference_weapons_frame_id_upgrade_fkey` FOREIGN KEY (`id_upgrade`) REFERENCES `weapons_upgrade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_weapons_frame`
--

LOCK TABLES `reference_weapons_frame` WRITE;
/*!40000 ALTER TABLE `reference_weapons_frame` DISABLE KEYS */;
INSERT INTO `reference_weapons_frame` VALUES (1,1,5),(1,2,7),(1,3,9),(1,4,10),(2,1,4),(2,2,5),(2,3,6),(2,4,8),(3,1,3),(3,2,4),(3,3,5),(3,4,6);
/*!40000 ALTER TABLE `reference_weapons_frame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons_custom`
--

DROP TABLE IF EXISTS `weapons_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons_custom` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `grade` int(11) NOT NULL,
  `effect` varchar(30) NOT NULL,
  `frame_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons_custom`
--

LOCK TABLES `weapons_custom` WRITE;
/*!40000 ALTER TABLE `weapons_custom` DISABLE KEYS */;
INSERT INTO `weapons_custom` VALUES (1,'攻撃力強化',1,'基礎攻撃力+5',3),(2,'攻撃力強化',2,'基礎攻撃力+10',5),(3,'攻撃力強化',3,'基礎攻撃力+15',7),(4,'攻撃力強化',4,'基礎攻撃力+25',9),(5,'会心率強化',1,'会心率+10%',2),(6,'会心率強化',2,'会心率+15%',4),(7,'会心率強化',3,'会心率+20%',6),(8,'会心率強化',4,'会心率+25%',8),(9,'防御力強化',1,'防御力+15',1),(10,'防御力強化',2,'防御力+25',2),(11,'防御力強化',3,'防御力+35',3),(12,'防御力強化',4,'防御力+50',5),(13,'スロット強化',1,'Lv1スロット追加',3),(14,'スロット強化',2,'Lv2スロット追加',6),(15,'スロット強化',3,'Lv3スロット追加',7),(16,'スロット強化',4,'Lv4スロット追加',8),(17,'回復能力付与',1,'体力回復微',3),(18,'回復能力付与',2,'体力回復小',5),(19,'回復能力付与',3,'体力回復中',7),(20,'回復能力付与',4,'体力回復大',9),(21,'属性・状態異常強化',1,'属性値+30',1),(22,'属性・状態異常強化',2,'属性値+60',3),(23,'属性・状態異常強化',3,'属性値+90',5),(24,'属性・状態異常強化',4,'属性値+120',7);
/*!40000 ALTER TABLE `weapons_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons_name`
--

DROP TABLE IF EXISTS `weapons_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons_name` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons_name`
--

LOCK TABLES `weapons_name` WRITE;
/*!40000 ALTER TABLE `weapons_name` DISABLE KEYS */;
INSERT INTO `weapons_name` VALUES (1,'片手剣'),(2,'双剣'),(3,'大剣'),(4,'太刀'),(5,'ハンマー'),(6,'狩猟笛'),(7,'ランス'),(8,'ガンランス'),(9,'スラッシュアックス'),(10,'チャージアックス'),(11,'操虫棍'),(12,'弓'),(13,'ライトボウガン'),(14,'ヘビィボウガン');
/*!40000 ALTER TABLE `weapons_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons_parts_effect`
--

DROP TABLE IF EXISTS `weapons_parts_effect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons_parts_effect` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `effect` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons_parts_effect`
--

LOCK TABLES `weapons_parts_effect` WRITE;
/*!40000 ALTER TABLE `weapons_parts_effect` DISABLE KEYS */;
INSERT INTO `weapons_parts_effect` VALUES (1,1,'攻撃力増加'),(2,2,'攻撃力増加'),(3,3,'攻撃力増加'),(4,4,'攻撃力増加'),(5,5,'攻撃力増加'),(6,6,'攻撃力増加'),(7,7,'攻撃力増加'),(8,1,'会心率増加'),(9,2,'会心率増加'),(10,3,'会心率増加'),(11,4,'会心率増加'),(12,5,'会心率増加'),(13,6,'会心率増加'),(14,7,'会心率増加'),(15,1,'防御力増加'),(16,2,'防御力増加'),(17,3,'防御力増加'),(18,4,'防御力増加'),(19,5,'防御力増加'),(20,6,'防御力増加'),(21,7,'防御力増加'),(22,1,'属性値増加'),(23,2,'属性値増加'),(24,3,'属性値増加'),(25,4,'属性値増加'),(26,5,'属性値増加'),(27,6,'属性値増加'),(28,7,'属性値増加'),(29,7,'切れ味増加');
/*!40000 ALTER TABLE `weapons_parts_effect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons_rare`
--

DROP TABLE IF EXISTS `weapons_rare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons_rare` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons_rare`
--

LOCK TABLES `weapons_rare` WRITE;
/*!40000 ALTER TABLE `weapons_rare` DISABLE KEYS */;
INSERT INTO `weapons_rare` VALUES (1,'RARE10'),(2,'RARE11'),(3,'RARE12');
/*!40000 ALTER TABLE `weapons_rare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons_upgrade`
--

DROP TABLE IF EXISTS `weapons_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons_upgrade` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons_upgrade`
--

LOCK TABLES `weapons_upgrade` WRITE;
/*!40000 ALTER TABLE `weapons_upgrade` DISABLE KEYS */;
INSERT INTO `weapons_upgrade` VALUES (1,'デフォルト'),(2,'1段階強化'),(3,'2段階強化'),(4,'3段階強化');
/*!40000 ALTER TABLE `weapons_upgrade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-24 10:37:23
