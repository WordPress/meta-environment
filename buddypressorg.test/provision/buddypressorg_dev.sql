-- MySQL dump 10.14  Distrib 5.5.54-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	5.5.54-MariaDB-1ubuntu0.14.04.1

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
-- Table structure for table `wp_15_commentmeta`
--

DROP TABLE IF EXISTS `wp_15_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_15_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_15_commentmeta`
--

LOCK TABLES `wp_15_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_15_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_15_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_15_comments`
--

DROP TABLE IF EXISTS `wp_15_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_15_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_15_comments`
--

LOCK TABLES `wp_15_comments` WRITE;
/*!40000 ALTER TABLE `wp_15_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_15_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_15_links`
--

DROP TABLE IF EXISTS `wp_15_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_15_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_15_links`
--

LOCK TABLES `wp_15_links` WRITE;
/*!40000 ALTER TABLE `wp_15_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_15_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_15_options`
--

DROP TABLE IF EXISTS `wp_15_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_15_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_15_options`
--

LOCK TABLES `wp_15_options` WRITE;
/*!40000 ALTER TABLE `wp_15_options` DISABLE KEYS */;
INSERT INTO `wp_15_options` VALUES (1,'siteurl','http://codex.buddypressorg.test','yes'),(2,'home','http://codex.buddypressorg.test','yes'),(3,'blogname','BuddyPress Codex','yes'),(4,'blogdescription','','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','foo@example.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','1','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','1','yes'),(27,'moderation_notify','','yes'),(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),(29,'gzipcompression','0','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:0:{}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'advanced_edit','0','yes'),(37,'comment_max_links','2','yes'),(38,'gmt_offset','0','yes'),(39,'default_email_category','1','yes'),(40,'recently_edited','','no'),(41,'template','bb-base','yes'),(42,'stylesheet','codex-buddypress-org','yes'),(43,'comment_whitelist','1','yes'),(44,'blacklist_keys','','no'),(45,'comment_registration','1','yes'),(46,'html_type','text/html','yes'),(47,'use_trackback','0','yes'),(48,'default_role','subscriber','yes'),(49,'db_version','31535','yes'),(50,'uploads_use_yearmonth_folders','1','yes'),(51,'upload_path','','yes'),(52,'blog_public','1','yes'),(53,'default_link_category','2','yes'),(54,'show_on_front','page','yes'),(55,'tag_base','','yes'),(56,'show_avatars','1','yes'),(57,'avatar_rating','G','yes'),(58,'upload_url_path','','yes'),(59,'thumbnail_size_w','150','yes'),(60,'thumbnail_size_h','150','yes'),(61,'thumbnail_crop','1','yes'),(62,'medium_size_w','300','yes'),(63,'medium_size_h','300','yes'),(64,'avatar_default','mystery','yes'),(65,'large_size_w','1024','yes'),(66,'large_size_h','1024','yes'),(67,'image_default_link_type','file','yes'),(68,'image_default_size','','yes'),(69,'image_default_align','','yes'),(70,'close_comments_for_old_posts','1','yes'),(71,'close_comments_days_old','14','yes'),(72,'thread_comments','','yes'),(73,'thread_comments_depth','5','yes'),(74,'page_comments','1','yes'),(75,'comments_per_page','50','yes'),(76,'default_comments_page','newest','yes'),(77,'comment_order','asc','yes'),(78,'sticky_posts','a:0:{}','yes'),(79,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_text','a:0:{}','yes'),(81,'widget_rss','a:0:{}','yes'),(82,'uninstall_plugins','a:0:{}','no'),(83,'timezone_string','','yes'),(84,'page_for_posts','0','yes'),(85,'page_on_front','5','yes'),(86,'default_post_format','0','yes'),(87,'link_manager_enabled','0','yes'),(88,'wp_15_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(89,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(90,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(91,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(92,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(93,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(94,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(96,'WPLANG','','yes'),(97,'cron','a:5:{i:1431068580;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1431074419;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1431117313;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1431117352;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(109,'new_admin_email','foo@example.com','yes'),(112,'post_count','0','yes'),(114,'allowedthemes','a:5:{s:7:\"bb-base\";b:1;s:11:\"bbpress-org\";b:1;s:17:\"codex-bbpress-org\";b:1;s:14:\"buddypress-org\";b:1;s:20:\"codex-buddypress-org\";b:1;}','yes'),(115,'theme_mods_twentyfifteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1427315867;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(116,'current_theme','BuddyPress.org Codex 2013','yes'),(117,'theme_mods_codex-buddypress-org','a:1:{i:0;b:0;}','yes'),(118,'theme_switched','','yes'),(121,'recently_activated','a:0:{}','yes'),(129,'syntaxhighlighter_settings','a:15:{s:9:\"shversion\";i:3;s:5:\"theme\";s:7:\"default\";s:6:\"gutter\";i:1;s:9:\"smarttabs\";i:1;s:9:\"wraplines\";i:1;s:9:\"classname\";s:0:\"\";s:9:\"firstline\";s:1:\"1\";s:14:\"padlinenumbers\";s:5:\"false\";s:7:\"tabsize\";s:1:\"4\";s:5:\"title\";s:0:\"\";s:14:\"loadallbrushes\";i:0;s:9:\"autolinks\";i:0;s:8:\"collapse\";i:0;s:5:\"light\";i:0;s:7:\"toolbar\";i:0;}','yes'),(131,'bp-deactivated-components','a:0:{}','yes'),(132,'bb-config-location','/srv/www/wordpress-meta-environment/buddypressorg.test/public_html/wordpress/bb-config.php','yes'),(133,'bp-xprofile-base-group-name','Base','yes'),(134,'bp-xprofile-fullname-field-name','Name','yes'),(135,'bp-disable-blogforum-comments','1','yes'),(136,'_bp_theme_package_id','legacy','yes'),(137,'_bp_enable_akismet','1','yes'),(138,'_bp_enable_heartbeat_refresh','1','yes'),(139,'bp-pages','a:2:{s:8:\"activity\";i:12;s:7:\"members\";i:13;}','yes'),(140,'db_upgraded','','yes'),(141,'_transient_random_seed','8786a14995eecb48b625d9d8345095ad','yes'),(142,'rewrite_rules','a:88:{s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?type=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?type=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?type=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:26:\"index.php?type=$matches[1]\";s:55:\"bp_member_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?bp_member_type=$matches[1]&feed=$matches[2]\";s:50:\"bp_member_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?bp_member_type=$matches[1]&feed=$matches[2]\";s:43:\"bp_member_type/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?bp_member_type=$matches[1]&paged=$matches[2]\";s:25:\"bp_member_type/([^/]+)/?$\";s:36:\"index.php?bp_member_type=$matches[1]\";s:48:\"version/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?version=$matches[1]&feed=$matches[2]\";s:43:\"version/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?version=$matches[1]&feed=$matches[2]\";s:36:\"version/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?version=$matches[1]&paged=$matches[2]\";s:18:\"version/([^/]+)/?$\";s:29:\"index.php?version=$matches[1]\";s:50:\"component/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?component=$matches[1]&feed=$matches[2]\";s:45:\"component/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?component=$matches[1]&feed=$matches[2]\";s:38:\"component/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?component=$matches[1]&paged=$matches[2]\";s:20:\"component/([^/]+)/?$\";s:31:\"index.php?component=$matches[1]\";s:48:\"context/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?context=$matches[1]&feed=$matches[2]\";s:43:\"context/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?context=$matches[1]&feed=$matches[2]\";s:36:\"context/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?context=$matches[1]&paged=$matches[2]\";s:18:\"context/([^/]+)/?$\";s:29:\"index.php?context=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=5&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(143,'bp-active-components','a:5:{s:8:\"activity\";i:1;s:7:\"members\";i:1;s:8:\"settings\";i:1;s:8:\"xprofile\";i:1;s:13:\"notifications\";i:1;}','yes'),(144,'_bp_db_version','9848','yes'),(145,'_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca','1431088699','no'),(146,'_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca','1431088699','no'),(147,'_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca','1431045499','no'),(148,'_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9','1431088700','no'),(149,'_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9','1431088700','no'),(150,'_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9','1431045500','no'),(151,'_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51','1431088700','no'),(152,'_transient_dash_4077549d03da2e451c8b5f002294ff51','<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2015/05/wordpress-4-2-2/\'>WordPress 4.2.2 Security and Maintenance Release</a> <span class=\"rss-date\">May 7, 2015</span><div class=\"rssSummary\">WordPress 4.2.2 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. Version 4.2.2 addresses two security issues: The Genericons icon font package, which is used in a number of popular themes and plugins, contained an HTML file vulnerable to a cross-site [&hellip;]</div></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://poststatus.com/how-to-create-accessible-wordpress-themes/\'>Post Status: How to create better, more accessible WordPress themes</a></li><li><a class=\'rsswidget\' href=\'http://wptavern.com/camppress-a-2-3-day-social-experience-for-geeks-and-creatives\'>WPTavern: CampPress: A 2-3 Day Social Experience for Geeks and Creatives</a></li><li><a class=\'rsswidget\' href=\'http://wptavern.com/tgm-plugin-activation-library-publishes-roadmap-for-version-3-0\'>WPTavern: TGM Plugin Activation Library Publishes Roadmap for Version 3.0</a></li></ul></div>','no');
/*!40000 ALTER TABLE `wp_15_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_15_postmeta`
--

DROP TABLE IF EXISTS `wp_15_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_15_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_15_postmeta`
--

LOCK TABLES `wp_15_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_15_postmeta` DISABLE KEYS */;
INSERT INTO `wp_15_postmeta` VALUES (4,5,'_edit_lock','1427315677:1'),(5,5,'_edit_last','1'),(6,7,'_menu_item_type','custom'),(7,7,'_menu_item_menu_item_parent','0'),(8,7,'_menu_item_object_id','7'),(9,7,'_menu_item_object','custom'),(10,7,'_menu_item_target',''),(11,7,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(12,7,'_menu_item_xfn',''),(13,7,'_menu_item_url','http://codex.buddypressorg.test/'),(14,7,'_menu_item_orphaned','1427315878'),(15,8,'_menu_item_type','post_type'),(16,8,'_menu_item_menu_item_parent','0'),(17,8,'_menu_item_object_id','5'),(18,8,'_menu_item_object','page'),(19,8,'_menu_item_target',''),(20,8,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(21,8,'_menu_item_xfn',''),(22,8,'_menu_item_url',''),(23,8,'_menu_item_orphaned','1427315878'),(27,10,'_edit_lock','1427315868:1'),(28,10,'_edit_last','1'),(29,10,'_wp_page_template','default');
/*!40000 ALTER TABLE `wp_15_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_15_posts`
--

DROP TABLE IF EXISTS `wp_15_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_15_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_15_posts`
--

LOCK TABLES `wp_15_posts` WRITE;
/*!40000 ALTER TABLE `wp_15_posts` DISABLE KEYS */;
INSERT INTO `wp_15_posts` VALUES (5,1,'2015-03-25 20:36:45','2015-03-25 20:36:45','<p style=\"font-size: 16px;margin-bottom: 30px\">Welcome to the BuddyPress Codex: online documentation and guides for BuddyPress. Below are the primary sections of the Codex for Users, Site Administrators, and Developers.</p>\r\n\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;background: #f5f5f5;padding: 10px\">\r\n<h2 style=\"font-size: 24px;vertical-align: middle;margin-bottom: 10px\"><a title=\"BuddyPress Components and Features\" href=\"http://codex.buddypress.org/buddypress-components-and-features/\">BuddyPress Features</a></h2>\r\nNeed to understand what BuddyPress offers? <i>Components and Features</i> is here to provide a detailed breakdown and explanation of all the features you will find in Buddypress in as much detail as possible.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"All you ever needed to know about getting started with BuddyPress\" href=\"http://codex.buddypress.org/getting-started/\">Getting Started</a></h2>\r\nNew to BuddyPress?, Not sure where to begin? <i>Getting Started</i> is here to help! Everything you need to know about setting up your new BuddyPress powered site is here from installing and activating to setting up Extended profile fields.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;background: #f5f5f5;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"Administrator Guide\" href=\"http://codex.buddypress.org/administrator-guide/\">Administrator Guide</a></h2>\r\nAdministrators guides cover all aspects of managing your brand new BuddyPress installation and covers the various tools and functions you have available from the backend of your site.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"Member Guide\" href=\"http://codex.buddypress.org/member-guide/\">Member Guide</a></h2>\r\nNeed to learn a little about using BuddyPress as a general site member, this section provides handy guides to understanding all the available BuddyPress functions for the user.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;background: #f5f5f5;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"BuddyPress Theme Development\" href=\"http://codex.buddypress.org/themes/\">BP Theme Development</a></h2>\r\nWant to customize your site? Thinking about building a new BP theme? The guides in Themeing will help you understand what\'s possible and how to achieve it.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"BuddyPress Plugin Development\" href=\"http://codex.buddypress.org/plugindev/\">BP Plugin Development</a></h2>\r\nBuilding BuddyPress plugins? You\'ll find helpful guides and instructions on how to go about building BP plugins the right way.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 60px;background: #f5f5f5;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"BuddyPress Developer Resources\" href=\"http://codex.buddypress.org/developer/\">Developer Resources</a></h2>\r\nDeveloper resources provides detailed guides on BuddyPress classes, functions, actions, and loops.\r\n\r\n</div>\r\n\r\n<hr />\r\n\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;margin-top: 20px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px;background: #f5f5f5;padding: 3px 2px 3px 10px\"><a title=\"Participate and Contribute\" href=\"http://codex.buddypress.org/participate-and-contribute/\">Participate &amp; Contribute</a></h2>\r\nBuddyPress is a community driven open source project, learn how you can get involved and contribute.\r\n</div>\r\n\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;margin-top: 20px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px;background: #f5f5f5;padding: 3px 2px 3px 10px\"><a title=\"BuddyPress version releases &amp; changelogs in detail with trac references.\" href=\"https://codex.buddypress.org/releases/\">Version Releases &amp; Changelogs</a></h2>\r\nA central reference for BuddyPress version release details, listing changes, updates, new additions and their relevant trac tickets.\r\n</div>\r\n\r\n\r\n<div class=\"section-block\" style=\"margin-bottom: 30px\">\r\n<p style=\"font-size: 24px;margin-bottom: 10px;background: #f5f5f5;padding: 3px 2px 3px 10px\"><b>References</b></p>\r\n\r\n<ul>\r\n	<li><a title=\"BP Codex Standards and Guidelines\" href=\"http://codex.buddypress.org/participate-and-contribute/codex-standards-guidelines/\">BP Codex Standards and Guidelines</a> - Basic and simple instructions for contributing to the Codex</li>\r\n	<li><a title=\"BP Codex Table of Contents\" href=\"https://docs.google.com/spreadsheet/ccc?key=0AlDyI51JorH3dE9UM1Exb0ZQaVRDLWMxTURwMVp0Unc&amp;usp=sharing\">BP Codex Table of Contents</a> - Updated regularly</li>\r\n\r\n</ul>\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px\">\r\n<p style=\"font-size: 24px;background: #f5f5f5;padding: 3px 2px 3px 10px\"><b>BuddyPress Media</b></p>\r\n<a title=\"Official media to use on your site\" href=\"http://codex.buddypress.org/official-fonts-and-logos/\"> BuddyPress graphics and fonts</a>\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 10px\">\r\n<p style=\"font-size: 24px;background: #f5f5f5;padding: 3px 2px 3px 10px\"><b>Sections</b></p>\r\nThe codex is also organized into various sections, which you can check out below:\r\n\r\n</div>','BuddyPress Codex','','publish','open','open','','buddypress-codex','','','2015-03-25 20:36:45','2015-03-25 20:36:45','',0,'http://codex.buddypressorg.test/?page_id=5',0,'page','',0),(6,1,'2015-03-25 20:36:45','2015-03-25 20:36:45','<p style=\"font-size: 16px;margin-bottom: 30px\">Welcome to the BuddyPress Codex: online documentation and guides for BuddyPress. Below are the primary sections of the Codex for Users, Site Administrators, and Developers.</p>\r\n\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;background: #f5f5f5;padding: 10px\">\r\n<h2 style=\"font-size: 24px;vertical-align: middle;margin-bottom: 10px\"><a title=\"BuddyPress Components and Features\" href=\"http://codex.buddypress.org/buddypress-components-and-features/\">BuddyPress Features</a></h2>\r\nNeed to understand what BuddyPress offers? <i>Components and Features</i> is here to provide a detailed breakdown and explanation of all the features you will find in Buddypress in as much detail as possible.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"All you ever needed to know about getting started with BuddyPress\" href=\"http://codex.buddypress.org/getting-started/\">Getting Started</a></h2>\r\nNew to BuddyPress?, Not sure where to begin? <i>Getting Started</i> is here to help! Everything you need to know about setting up your new BuddyPress powered site is here from installing and activating to setting up Extended profile fields.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;background: #f5f5f5;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"Administrator Guide\" href=\"http://codex.buddypress.org/administrator-guide/\">Administrator Guide</a></h2>\r\nAdministrators guides cover all aspects of managing your brand new BuddyPress installation and covers the various tools and functions you have available from the backend of your site.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"Member Guide\" href=\"http://codex.buddypress.org/member-guide/\">Member Guide</a></h2>\r\nNeed to learn a little about using BuddyPress as a general site member, this section provides handy guides to understanding all the available BuddyPress functions for the user.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;background: #f5f5f5;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"BuddyPress Theme Development\" href=\"http://codex.buddypress.org/themes/\">BP Theme Development</a></h2>\r\nWant to customize your site? Thinking about building a new BP theme? The guides in Themeing will help you understand what\'s possible and how to achieve it.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"BuddyPress Plugin Development\" href=\"http://codex.buddypress.org/plugindev/\">BP Plugin Development</a></h2>\r\nBuilding BuddyPress plugins? You\'ll find helpful guides and instructions on how to go about building BP plugins the right way.\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 60px;background: #f5f5f5;padding: 10px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px\"><a title=\"BuddyPress Developer Resources\" href=\"http://codex.buddypress.org/developer/\">Developer Resources</a></h2>\r\nDeveloper resources provides detailed guides on BuddyPress classes, functions, actions, and loops.\r\n\r\n</div>\r\n\r\n<hr />\r\n\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;margin-top: 20px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px;background: #f5f5f5;padding: 3px 2px 3px 10px\"><a title=\"Participate and Contribute\" href=\"http://codex.buddypress.org/participate-and-contribute/\">Participate &amp; Contribute</a></h2>\r\nBuddyPress is a community driven open source project, learn how you can get involved and contribute.\r\n</div>\r\n\r\n<div class=\"section-block\" style=\"margin-bottom: 30px;margin-top: 20px\">\r\n<h2 style=\"font-size: 24px;margin-bottom: 10px;background: #f5f5f5;padding: 3px 2px 3px 10px\"><a title=\"BuddyPress version releases &amp; changelogs in detail with trac references.\" href=\"https://codex.buddypress.org/releases/\">Version Releases &amp; Changelogs</a></h2>\r\nA central reference for BuddyPress version release details, listing changes, updates, new additions and their relevant trac tickets.\r\n</div>\r\n\r\n\r\n<div class=\"section-block\" style=\"margin-bottom: 30px\">\r\n<p style=\"font-size: 24px;margin-bottom: 10px;background: #f5f5f5;padding: 3px 2px 3px 10px\"><b>References</b></p>\r\n\r\n<ul>\r\n	<li><a title=\"BP Codex Standards and Guidelines\" href=\"http://codex.buddypress.org/participate-and-contribute/codex-standards-guidelines/\">BP Codex Standards and Guidelines</a> - Basic and simple instructions for contributing to the Codex</li>\r\n	<li><a title=\"BP Codex Table of Contents\" href=\"https://docs.google.com/spreadsheet/ccc?key=0AlDyI51JorH3dE9UM1Exb0ZQaVRDLWMxTURwMVp0Unc&amp;usp=sharing\">BP Codex Table of Contents</a> - Updated regularly</li>\r\n\r\n</ul>\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 30px\">\r\n<p style=\"font-size: 24px;background: #f5f5f5;padding: 3px 2px 3px 10px\"><b>BuddyPress Media</b></p>\r\n<a title=\"Official media to use on your site\" href=\"http://codex.buddypress.org/official-fonts-and-logos/\"> BuddyPress graphics and fonts</a>\r\n\r\n</div>\r\n<div class=\"section-block\" style=\"margin-bottom: 10px\">\r\n<p style=\"font-size: 24px;background: #f5f5f5;padding: 3px 2px 3px 10px\"><b>Sections</b></p>\r\nThe codex is also organized into various sections, which you can check out below:\r\n\r\n</div>','BuddyPress Codex','','inherit','open','open','','5-revision-v1','','','2015-03-25 20:36:45','2015-03-25 20:36:45','',5,'http://codex.buddypressorg.test/2015/03/25/5-revision-v1/',0,'revision','',0),(7,1,'2015-03-25 20:37:58','0000-00-00 00:00:00','','Home','','draft','open','open','','','','','2015-03-25 20:37:58','0000-00-00 00:00:00','',0,'http://codex.buddypressorg.test/?p=7',1,'nav_menu_item','',0),(8,1,'2015-03-25 20:37:58','0000-00-00 00:00:00',' ','','','draft','open','open','','','','','2015-03-25 20:37:58','0000-00-00 00:00:00','',0,'http://codex.buddypressorg.test/?p=8',1,'nav_menu_item','',0),(10,1,'2015-03-25 20:40:09','2015-03-25 20:40:09','Releasing BuddyPress to the world is a big deal, and takes quite a few manual steps to ensure safe and comfortable updates and upgrades are had by all. Below are the steps the core team goes through with each and every new release. (There are plans to automate a great deal of this with Grunt in 2014, but until then, enjoy this extremely long list of responsibilities.)\r\n<ol>\r\n	<li>Write release version page on codex (i.e. http://codex.buddypress.org/releases/version-1-5-5/)</li>\r\n	<li>Add new version page to codex Releases page (http://codex.buddypress.org/releases/)</li>\r\n	<li>Bump version in bp-loader.php (plugin header)</li>\r\n	<li>Bump version in src/bp-loader.php (plugin header + $this-&gt;version (setup_globals()))</li>\r\n	<li>Bump the database version in src/bp-loader.php ($this-&gt;version (setup_globals()))</li>\r\n	<li>Bump version in dev trunk readme.txt</li>\r\n	<li>Bump stable-tag in dev trunk readme.txt</li>\r\n	<li>Add new Upgrade Notice for this version in readme.txt</li>\r\n	<li>Commit bumps to dev svn repository</li>\r\n	<li>If this is a major x.y release, create dev branch from trunk</li>\r\n	<li>Export dev branch to deploy branch</li>\r\n	<li>Delete .travis.yml and /tests/ and /bp-forums/bbpress/ (These are not committed to the deploy repository)</li>\r\n	<li>Make sure /bp-forums/bbpress/ externals are set on newly created branch (the correct syntax is svn propset svn:externals \'bbpress http://bbpress.svn.wordpress.org/tags/1.2/\' tags/1.5.3/bp-forums/ or whatever your path to bp-forums is)</li>\r\n	<li>Create deploy tag from dev branch</li>\r\n	<li>Update readme.txt in wp.org trunk, including stable tag. The release is now live.</li>\r\n</ol>\r\nNow that you\'ve tagged a new BuddyPress release, it\'s time to tell the world about it!\r\n<ol>\r\n	<li>Write a blog post on buddypress.org</li>\r\n	<li>Update version number in the Downloads page on the buddypress.org.</li>\r\n	<li>Write a blog post on bpdevel.wordpress.com</li>\r\n	<li>Forum announcement in buddypress.org/support</li>\r\n</ol>\r\nAlmost done!\r\n<ol>\r\n	<li>Bump dev trunk to alpha in bp-loader.php (2.1-alpha)</li>\r\n	<li>Bump newly created dev branch in bp-loader.php (2.0.1-alpha)</li>\r\n	<li>Sync deploy trunk and dev trunk</li>\r\n</ol>\r\n\r\nGlotPress Translation Strings\r\n<ul>\r\n	<li>BuddyPress\' translations are handled by GlotPress</li>\r\n	<li>Development strings are here http://translate.wordpress.org/projects/buddypress/dev</li>\r\n	<li>The source of the <code>buddypress.pot</code> is https://plugins.svn.wordpress.org/buddypress/trunk/buddypress.pot</li>\r\n	<li>Regular updates by running <code>grunt release</code> and pushing to https://plugins.svn.wordpress.org/browser/buddypress/trunk/ will make #Polyglots translators happy</li>\r\n	<li>This also allows for relatively easy \"string freezes\" as new releases near</li>\r\n\r\n</ul>','Prelaunch Checklist','','publish','open','open','','prelaunch-checklist','','','2015-03-25 20:40:09','2015-03-25 20:40:09','',0,'http://codex.buddypressorg.test/?page_id=10',0,'page','',0),(11,1,'2015-03-25 20:40:09','2015-03-25 20:40:09','Releasing BuddyPress to the world is a big deal, and takes quite a few manual steps to ensure safe and comfortable updates and upgrades are had by all. Below are the steps the core team goes through with each and every new release. (There are plans to automate a great deal of this with Grunt in 2014, but until then, enjoy this extremely long list of responsibilities.)\r\n<ol>\r\n	<li>Write release version page on codex (i.e. http://codex.buddypress.org/releases/version-1-5-5/)</li>\r\n	<li>Add new version page to codex Releases page (http://codex.buddypress.org/releases/)</li>\r\n	<li>Bump version in bp-loader.php (plugin header)</li>\r\n	<li>Bump version in src/bp-loader.php (plugin header + $this-&gt;version (setup_globals()))</li>\r\n	<li>Bump the database version in src/bp-loader.php ($this-&gt;version (setup_globals()))</li>\r\n	<li>Bump version in dev trunk readme.txt</li>\r\n	<li>Bump stable-tag in dev trunk readme.txt</li>\r\n	<li>Add new Upgrade Notice for this version in readme.txt</li>\r\n	<li>Commit bumps to dev svn repository</li>\r\n	<li>If this is a major x.y release, create dev branch from trunk</li>\r\n	<li>Export dev branch to deploy branch</li>\r\n	<li>Delete .travis.yml and /tests/ and /bp-forums/bbpress/ (These are not committed to the deploy repository)</li>\r\n	<li>Make sure /bp-forums/bbpress/ externals are set on newly created branch (the correct syntax is svn propset svn:externals \'bbpress http://bbpress.svn.wordpress.org/tags/1.2/\' tags/1.5.3/bp-forums/ or whatever your path to bp-forums is)</li>\r\n	<li>Create deploy tag from dev branch</li>\r\n	<li>Update readme.txt in wp.org trunk, including stable tag. The release is now live.</li>\r\n</ol>\r\nNow that you\'ve tagged a new BuddyPress release, it\'s time to tell the world about it!\r\n<ol>\r\n	<li>Write a blog post on buddypress.org</li>\r\n	<li>Update version number in the Downloads page on the buddypress.org.</li>\r\n	<li>Write a blog post on bpdevel.wordpress.com</li>\r\n	<li>Forum announcement in buddypress.org/support</li>\r\n</ol>\r\nAlmost done!\r\n<ol>\r\n	<li>Bump dev trunk to alpha in bp-loader.php (2.1-alpha)</li>\r\n	<li>Bump newly created dev branch in bp-loader.php (2.0.1-alpha)</li>\r\n	<li>Sync deploy trunk and dev trunk</li>\r\n</ol>\r\n\r\nGlotPress Translation Strings\r\n<ul>\r\n	<li>BuddyPress\' translations are handled by GlotPress</li>\r\n	<li>Development strings are here http://translate.wordpress.org/projects/buddypress/dev</li>\r\n	<li>The source of the <code>buddypress.pot</code> is https://plugins.svn.wordpress.org/buddypress/trunk/buddypress.pot</li>\r\n	<li>Regular updates by running <code>grunt release</code> and pushing to https://plugins.svn.wordpress.org/browser/buddypress/trunk/ will make #Polyglots translators happy</li>\r\n	<li>This also allows for relatively easy \"string freezes\" as new releases near</li>\r\n\r\n</ul>','Prelaunch Checklist','','inherit','open','open','','10-revision-v1','','','2015-03-25 20:40:09','2015-03-25 20:40:09','',10,'http://codex.buddypressorg.test/2015/03/25/10-revision-v1/',0,'revision','',0),(12,1,'2015-05-08 00:38:17','2015-05-08 00:38:17','','Activity','','publish','closed','closed','','activity','','','2015-05-08 00:38:17','2015-05-08 00:38:17','',0,'http://codex.buddypressorg.test/activity/',0,'page','',0),(13,1,'2015-05-08 00:38:17','2015-05-08 00:38:17','','Members','','publish','closed','closed','','members','','','2015-05-08 00:38:17','2015-05-08 00:38:17','',0,'http://codex.buddypressorg.test/members/',0,'page','',0),(14,1,'2015-05-08 00:38:18','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2015-05-08 00:38:18','0000-00-00 00:00:00','',0,'http://codex.buddypressorg.test/?p=14',0,'post','',0);
/*!40000 ALTER TABLE `wp_15_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_15_term_relationships`
--

DROP TABLE IF EXISTS `wp_15_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_15_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_15_term_relationships`
--

LOCK TABLES `wp_15_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_15_term_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_15_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_15_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_15_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_15_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_15_term_taxonomy`
--

LOCK TABLES `wp_15_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_15_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_15_term_taxonomy` VALUES (1,1,'category','',0,0);
/*!40000 ALTER TABLE `wp_15_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_15_terms`
--

DROP TABLE IF EXISTS `wp_15_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_15_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_15_terms`
--

LOCK TABLES `wp_15_terms` WRITE;
/*!40000 ALTER TABLE `wp_15_terms` DISABLE KEYS */;
INSERT INTO `wp_15_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_15_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_21_commentmeta`
--

DROP TABLE IF EXISTS `wp_21_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_21_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_21_commentmeta`
--

LOCK TABLES `wp_21_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_21_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_21_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_21_comments`
--

DROP TABLE IF EXISTS `wp_21_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_21_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_21_comments`
--

LOCK TABLES `wp_21_comments` WRITE;
/*!40000 ALTER TABLE `wp_21_comments` DISABLE KEYS */;
INSERT INTO `wp_21_comments` VALUES (1,1,'','','','','2015-03-25 20:40:55','2015-03-25 20:40:55','',0,'1','','',0,0);
/*!40000 ALTER TABLE `wp_21_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_21_links`
--

DROP TABLE IF EXISTS `wp_21_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_21_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_21_links`
--

LOCK TABLES `wp_21_links` WRITE;
/*!40000 ALTER TABLE `wp_21_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_21_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_21_options`
--

DROP TABLE IF EXISTS `wp_21_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_21_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_21_options`
--

LOCK TABLES `wp_21_options` WRITE;
/*!40000 ALTER TABLE `wp_21_options` DISABLE KEYS */;
INSERT INTO `wp_21_options` VALUES (1,'siteurl','http://es.buddypressorg.test','yes'),(2,'home','http://es.buddypressorg.test','yes'),(3,'blogname','','yes'),(4,'blogdescription','','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','foo@example.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','1','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','d/m/Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),(29,'gzipcompression','0','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:1:{i:0;s:19:\"bbpress/bbpress.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'advanced_edit','0','yes'),(37,'comment_max_links','2','yes'),(38,'gmt_offset','','yes'),(39,'default_email_category','1','yes'),(40,'recently_edited','','no'),(41,'template','bb-base','yes'),(42,'stylesheet','buddypress-org','yes'),(43,'comment_whitelist','1','yes'),(44,'blacklist_keys','','no'),(45,'comment_registration','','yes'),(46,'html_type','text/html','yes'),(47,'use_trackback','0','yes'),(48,'default_role','subscriber','yes'),(49,'db_version','31535','yes'),(50,'uploads_use_yearmonth_folders','1','yes'),(51,'upload_path','','yes'),(52,'blog_public','1','yes'),(53,'default_link_category','2','yes'),(54,'show_on_front','page','yes'),(55,'tag_base','','yes'),(56,'show_avatars','1','yes'),(57,'avatar_rating','G','yes'),(58,'upload_url_path','','yes'),(59,'thumbnail_size_w','150','yes'),(60,'thumbnail_size_h','150','yes'),(61,'thumbnail_crop','1','yes'),(62,'medium_size_w','300','yes'),(63,'medium_size_h','300','yes'),(64,'avatar_default','mystery','yes'),(65,'large_size_w','1024','yes'),(66,'large_size_h','1024','yes'),(67,'image_default_link_type','file','yes'),(68,'image_default_size','','yes'),(69,'image_default_align','','yes'),(70,'close_comments_for_old_posts','','yes'),(71,'close_comments_days_old','14','yes'),(72,'thread_comments','1','yes'),(73,'thread_comments_depth','5','yes'),(74,'page_comments','1','yes'),(75,'comments_per_page','50','yes'),(76,'default_comments_page','newest','yes'),(77,'comment_order','asc','yes'),(78,'sticky_posts','a:0:{}','yes'),(79,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_text','a:0:{}','yes'),(81,'widget_rss','a:0:{}','yes'),(82,'uninstall_plugins','a:0:{}','no'),(83,'timezone_string','Europe/Madrid','yes'),(84,'page_for_posts','4','yes'),(85,'page_on_front','0','yes'),(86,'default_post_format','0','yes'),(87,'link_manager_enabled','0','yes'),(88,'wp_21_user_roles','a:8:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:13:\"bbp_keymaster\";a:2:{s:4:\"name\";s:9:\"Keymaster\";s:12:\"capabilities\";a:0:{}}s:13:\"bbp_spectator\";a:2:{s:4:\"name\";s:9:\"Spectator\";s:12:\"capabilities\";a:0:{}}s:11:\"bbp_blocked\";a:2:{s:4:\"name\";s:7:\"Blocked\";s:12:\"capabilities\";a:0:{}}}','yes'),(89,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(90,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(91,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(92,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(93,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(94,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(96,'WPLANG','es_ES','yes'),(97,'allowedthemes','a:5:{s:7:\"bb-base\";b:1;s:11:\"bbpress-org\";b:1;s:17:\"codex-bbpress-org\";b:1;s:14:\"buddypress-org\";b:1;s:20:\"codex-buddypress-org\";b:1;}','yes'),(98,'cron','a:3:{i:1431117672;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1431117786;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(110,'theme_mods_twentyfifteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1427316085;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(111,'current_theme','BuddyPress.org 2013','yes'),(112,'theme_mods_buddypress-org','a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:15:\"header-nav-menu\";i:2;}}','yes'),(113,'theme_switched','','yes'),(116,'recently_activated','a:0:{}','yes'),(119,'_bbp_private_forums','a:0:{}','yes'),(120,'_bbp_hidden_forums','a:0:{}','yes'),(121,'_bbp_db_version','250','yes'),(122,'new_admin_email','foo@example.com','yes'),(127,'post_count','1','yes'),(133,'rewrite_rules','a:149:{s:9:\"forums/?$\";s:25:\"index.php?post_type=forum\";s:39:\"forums/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=forum&feed=$matches[1]\";s:34:\"forums/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=forum&feed=$matches[1]\";s:26:\"forums/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=forum&paged=$matches[1]\";s:9:\"topics/?$\";s:25:\"index.php?post_type=topic\";s:39:\"topics/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=topic&feed=$matches[1]\";s:34:\"topics/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=topic&feed=$matches[1]\";s:26:\"topics/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=topic&paged=$matches[1]\";s:28:\"forums/forum/([^/]+)/edit/?$\";s:34:\"index.php?forum=$matches[1]&edit=1\";s:28:\"forums/topic/([^/]+)/edit/?$\";s:34:\"index.php?topic=$matches[1]&edit=1\";s:28:\"forums/reply/([^/]+)/edit/?$\";s:34:\"index.php?reply=$matches[1]&edit=1\";s:32:\"forums/topic-tag/([^/]+)/edit/?$\";s:38:\"index.php?topic-tag=$matches[1]&edit=1\";s:47:\"forums/user/([^/]+)/topics/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_tops=1&paged=$matches[2]\";s:48:\"forums/user/([^/]+)/replies/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_reps=1&paged=$matches[2]\";s:50:\"forums/user/([^/]+)/favorites/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_favs=1&paged=$matches[2]\";s:54:\"forums/user/([^/]+)/subscriptions/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_subs=1&paged=$matches[2]\";s:29:\"forums/user/([^/]+)/topics/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_tops=1\";s:30:\"forums/user/([^/]+)/replies/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_reps=1\";s:32:\"forums/user/([^/]+)/favorites/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_favs=1\";s:36:\"forums/user/([^/]+)/subscriptions/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_subs=1\";s:27:\"forums/user/([^/]+)/edit/?$\";s:37:\"index.php?bbp_user=$matches[1]&edit=1\";s:22:\"forums/user/([^/]+)/?$\";s:30:\"index.php?bbp_user=$matches[1]\";s:40:\"forums/view/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?bbp_view=$matches[1]&paged=$matches[2]\";s:27:\"forums/view/([^/]+)/feed/?$\";s:47:\"index.php?bbp_view=$matches[1]&feed=$matches[2]\";s:22:\"forums/view/([^/]+)/?$\";s:30:\"index.php?bbp_view=$matches[1]\";s:34:\"forums/search/page/?([0-9]{1,})/?$\";s:27:\"index.php?paged=$matches[1]\";s:16:\"forums/search/?$\";s:20:\"index.php?bbp_search\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:38:\"forums/forum/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:48:\"forums/forum/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:68:\"forums/forum/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"forums/forum/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"forums/forum/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"forums/forum/(.+?)/trackback/?$\";s:32:\"index.php?forum=$matches[1]&tb=1\";s:51:\"forums/forum/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?forum=$matches[1]&feed=$matches[2]\";s:46:\"forums/forum/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?forum=$matches[1]&feed=$matches[2]\";s:39:\"forums/forum/(.+?)/page/?([0-9]{1,})/?$\";s:45:\"index.php?forum=$matches[1]&paged=$matches[2]\";s:46:\"forums/forum/(.+?)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?forum=$matches[1]&cpage=$matches[2]\";s:31:\"forums/forum/(.+?)(/[0-9]+)?/?$\";s:44:\"index.php?forum=$matches[1]&page=$matches[2]\";s:40:\"forums/topic/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"forums/topic/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"forums/topic/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"forums/topic/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"forums/topic/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"forums/topic/([^/]+)/trackback/?$\";s:32:\"index.php?topic=$matches[1]&tb=1\";s:53:\"forums/topic/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?topic=$matches[1]&feed=$matches[2]\";s:48:\"forums/topic/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?topic=$matches[1]&feed=$matches[2]\";s:41:\"forums/topic/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?topic=$matches[1]&paged=$matches[2]\";s:48:\"forums/topic/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?topic=$matches[1]&cpage=$matches[2]\";s:33:\"forums/topic/([^/]+)(/[0-9]+)?/?$\";s:44:\"index.php?topic=$matches[1]&page=$matches[2]\";s:29:\"forums/topic/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"forums/topic/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"forums/topic/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"forums/topic/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"forums/topic/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"forums/reply/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"forums/reply/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"forums/reply/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"forums/reply/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"forums/reply/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"forums/reply/([^/]+)/trackback/?$\";s:32:\"index.php?reply=$matches[1]&tb=1\";s:41:\"forums/reply/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?reply=$matches[1]&paged=$matches[2]\";s:48:\"forums/reply/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?reply=$matches[1]&cpage=$matches[2]\";s:33:\"forums/reply/([^/]+)(/[0-9]+)?/?$\";s:44:\"index.php?reply=$matches[1]&page=$matches[2]\";s:29:\"forums/reply/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"forums/reply/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"forums/reply/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"forums/reply/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"forums/reply/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:57:\"forums/topic-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?topic-tag=$matches[1]&feed=$matches[2]\";s:52:\"forums/topic-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?topic-tag=$matches[1]&feed=$matches[2]\";s:45:\"forums/topic-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?topic-tag=$matches[1]&paged=$matches[2]\";s:27:\"forums/topic-tag/([^/]+)/?$\";s:31:\"index.php?topic-tag=$matches[1]\";s:42:\"forums/search/([^/]+)/page/?([0-9]{1,})/?$\";s:50:\"index.php?bbp_search=$matches[1]&paged=$matches[2]\";s:24:\"forums/search/([^/]+)/?$\";s:32:\"index.php?bbp_search=$matches[1]\";s:55:\"bp_member_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?bp_member_type=$matches[1]&feed=$matches[2]\";s:50:\"bp_member_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?bp_member_type=$matches[1]&feed=$matches[2]\";s:43:\"bp_member_type/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?bp_member_type=$matches[1]&paged=$matches[2]\";s:25:\"bp_member_type/([^/]+)/?$\";s:36:\"index.php?bp_member_type=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(134,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes'),(136,'bp-deactivated-components','a:0:{}','yes'),(137,'bb-config-location','/srv/www/wordpress-meta-environment/buddypressorg.test/public_html/wordpress/bb-config.php','yes'),(138,'bp-xprofile-base-group-name','Base','yes'),(139,'bp-xprofile-fullname-field-name','Name','yes'),(140,'bp-disable-blogforum-comments','1','yes'),(141,'_bp_theme_package_id','legacy','yes'),(142,'_bp_enable_akismet','1','yes'),(143,'_bp_enable_heartbeat_refresh','1','yes'),(144,'bp-pages','','yes'),(145,'db_upgraded','1','yes');
/*!40000 ALTER TABLE `wp_21_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_21_postmeta`
--

DROP TABLE IF EXISTS `wp_21_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_21_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_21_postmeta`
--

LOCK TABLES `wp_21_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_21_postmeta` DISABLE KEYS */;
INSERT INTO `wp_21_postmeta` VALUES (2,4,'_edit_last','1'),(3,4,'_wp_page_template','default'),(4,4,'_edit_lock','1427316081:1'),(5,6,'_edit_lock','1427316103:1'),(6,6,'_edit_last','1'),(7,6,'_wp_page_template','default'),(17,9,'_menu_item_type','post_type'),(18,9,'_menu_item_menu_item_parent','0'),(19,9,'_menu_item_object_id','6'),(20,9,'_menu_item_object','page'),(21,9,'_menu_item_target',''),(22,9,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(23,9,'_menu_item_xfn',''),(24,9,'_menu_item_url',''),(26,10,'_menu_item_type','post_type'),(27,10,'_menu_item_menu_item_parent','0'),(28,10,'_menu_item_object_id','4'),(29,10,'_menu_item_object','page'),(30,10,'_menu_item_target',''),(31,10,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(32,10,'_menu_item_xfn',''),(33,10,'_menu_item_url','');
/*!40000 ALTER TABLE `wp_21_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_21_posts`
--

DROP TABLE IF EXISTS `wp_21_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_21_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_21_posts`
--

LOCK TABLES `wp_21_posts` WRITE;
/*!40000 ALTER TABLE `wp_21_posts` DISABLE KEYS */;
INSERT INTO `wp_21_posts` VALUES (1,1,'2015-03-25 20:40:55','2015-03-25 20:40:55','Welcome to <a href=\"http://buddypressorg.test/\">BuddyPress.org</a>. This is your first post. Edit or delete it, then start blogging!','Hello world!','','publish','open','open','','hello-world','','','2015-03-25 20:40:55','2015-03-25 20:40:55','',0,'http://es.buddypressorg.test/?p=1',0,'post','',1),(4,1,'2015-03-25 21:43:17','2015-03-25 20:43:17','','Blog','','publish','open','open','','blog','','','2015-03-25 21:43:26','2015-03-25 20:43:26','',0,'http://es.buddypressorg.test/?page_id=4',0,'page','',0),(5,1,'2015-03-25 21:43:17','2015-03-25 20:43:17','','Blog','','inherit','open','open','','4-revision-v1','','','2015-03-25 21:43:17','2015-03-25 20:43:17','',4,'http://es.buddypressorg.test/2015/03/25/4-revision-v1/',0,'revision','',0),(6,1,'2015-03-25 21:44:00','2015-03-25 20:44:00','<a title=\"BuddyPress Plugin\" href=\"https://wordpress.org/plugins/buddypress/\" target=\"_blank\">BuddyPress</a> es un potente plugin que convierte tu sitio web de WordPress en un sitio web con características de red social como: perfiles de usuario, muros de actividad, grupos de usuario, y mucho más. Algunos fantásticos usos pueden ser:\r\n<ul>\r\n	<li>Un campus digital con red social para tu universidad, colegio o instituto.</li>\r\n	<li>Una herramienta de comunicación interna para tu empresa.</li>\r\n	<li>Una red social especializada para tu tema de interés.</li>\r\n	<li>Una red social enfocada a tu nuevo producto.</li>\r\n</ul>\r\nSi usas BuddyPress de una forma original o única, no dudes en darla a conocer a la gente en los <a title=\"Foro BuddyPress\" href=\"https://es.forums.wordpress.org/forum/buddypress\" target=\"_blank\">foros</a>; ¡siempre estamos interesados!\r\n<h3>BuddyPress no es \"todo o nada\"</h3>\r\nBuddyPress tiene diferentes componentes que se integran directmante en tu sitio web, entre ellos, e incluso con otros plugins (echa un vistazo al plugin bbPress para crear por ejemplo foros de soporte). Si sólo quieres usar algunas funcionalidades, BuddyPress se adaptará automáticamente, mostrando sólo los elementos de menú, páginas y botones de las funcionalidades que has activado.\r\n<h3>BuddyPress.org</h3>\r\nEste sitio está desarrollado con WordPress and BuddyPress (¡creemos en el software que construimos!). Anímate a registrarte y convertirte en parte de la comunidad de BuddyPress. Haciendo esto, podrás contribuir con la documentación, hacer preguntas en el foro, además de tener tu perfil de BuddyPress para que otros desarrolladores de BuddyPress y colaboradores puedan estar en contacto contigo.','Acerca de','','publish','open','open','','acerca-de','','','2015-03-25 21:44:00','2015-03-25 20:44:00','',0,'http://es.buddypressorg.test/?page_id=6',0,'page','',0),(7,1,'2015-03-25 21:44:00','2015-03-25 20:44:00','<a title=\"BuddyPress Plugin\" href=\"https://wordpress.org/plugins/buddypress/\" target=\"_blank\">BuddyPress</a> es un potente plugin que convierte tu sitio web de WordPress en un sitio web con características de red social como: perfiles de usuario, muros de actividad, grupos de usuario, y mucho más. Algunos fantásticos usos pueden ser:\r\n<ul>\r\n	<li>Un campus digital con red social para tu universidad, colegio o instituto.</li>\r\n	<li>Una herramienta de comunicación interna para tu empresa.</li>\r\n	<li>Una red social especializada para tu tema de interés.</li>\r\n	<li>Una red social enfocada a tu nuevo producto.</li>\r\n</ul>\r\nSi usas BuddyPress de una forma original o única, no dudes en darla a conocer a la gente en los <a title=\"Foro BuddyPress\" href=\"https://es.forums.wordpress.org/forum/buddypress\" target=\"_blank\">foros</a>; ¡siempre estamos interesados!\r\n<h3>BuddyPress no es \"todo o nada\"</h3>\r\nBuddyPress tiene diferentes componentes que se integran directmante en tu sitio web, entre ellos, e incluso con otros plugins (echa un vistazo al plugin bbPress para crear por ejemplo foros de soporte). Si sólo quieres usar algunas funcionalidades, BuddyPress se adaptará automáticamente, mostrando sólo los elementos de menú, páginas y botones de las funcionalidades que has activado.\r\n<h3>BuddyPress.org</h3>\r\nEste sitio está desarrollado con WordPress and BuddyPress (¡creemos en el software que construimos!). Anímate a registrarte y convertirte en parte de la comunidad de BuddyPress. Haciendo esto, podrás contribuir con la documentación, hacer preguntas en el foro, además de tener tu perfil de BuddyPress para que otros desarrolladores de BuddyPress y colaboradores puedan estar en contacto contigo.','Acerca de','','inherit','open','open','','6-revision-v1','','','2015-03-25 21:44:00','2015-03-25 20:44:00','',6,'http://es.buddypressorg.test/2015/03/25/6-revision-v1/',0,'revision','',0),(9,1,'2015-03-26 00:53:44','2015-03-25 23:53:44',' ','','','publish','open','open','','9','','','2015-03-26 00:54:38','2015-03-25 23:54:38','',0,'http://es.buddypressorg.test/?p=9',1,'nav_menu_item','',0),(10,1,'2015-03-26 00:53:44','2015-03-25 23:53:44',' ','','','publish','open','open','','10','','','2015-03-26 00:54:38','2015-03-25 23:54:38','',0,'http://es.buddypressorg.test/?p=10',2,'nav_menu_item','',0);
/*!40000 ALTER TABLE `wp_21_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_21_term_relationships`
--

DROP TABLE IF EXISTS `wp_21_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_21_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_21_term_relationships`
--

LOCK TABLES `wp_21_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_21_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_21_term_relationships` VALUES (1,1,0),(9,2,0),(10,2,0);
/*!40000 ALTER TABLE `wp_21_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_21_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_21_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_21_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_21_term_taxonomy`
--

LOCK TABLES `wp_21_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_21_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_21_term_taxonomy` VALUES (1,1,'category','',0,1),(2,2,'nav_menu','',0,2);
/*!40000 ALTER TABLE `wp_21_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_21_terms`
--

DROP TABLE IF EXISTS `wp_21_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_21_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_21_terms`
--

LOCK TABLES `wp_21_terms` WRITE;
/*!40000 ALTER TABLE `wp_21_terms` DISABLE KEYS */;
INSERT INTO `wp_21_terms` VALUES (1,'Uncategorized','uncategorized',0),(2,'Menú 1','menu-1',0);
/*!40000 ALTER TABLE `wp_21_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_53_commentmeta`
--

DROP TABLE IF EXISTS `wp_53_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_53_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_53_commentmeta`
--

LOCK TABLES `wp_53_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_53_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_53_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_53_comments`
--

DROP TABLE IF EXISTS `wp_53_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_53_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_53_comments`
--

LOCK TABLES `wp_53_comments` WRITE;
/*!40000 ALTER TABLE `wp_53_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_53_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_53_links`
--

DROP TABLE IF EXISTS `wp_53_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_53_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_53_links`
--

LOCK TABLES `wp_53_links` WRITE;
/*!40000 ALTER TABLE `wp_53_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_53_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_53_options`
--

DROP TABLE IF EXISTS `wp_53_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_53_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_53_options`
--

LOCK TABLES `wp_53_options` WRITE;
/*!40000 ALTER TABLE `wp_53_options` DISABLE KEYS */;
INSERT INTO `wp_53_options` VALUES (1,'siteurl','http://codex.bbpressorg.test/','yes'),(2,'home','http://codex.bbpressorg.test/','yes'),(3,'blogname','bbPress Codex','yes'),(4,'blogdescription','','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','foo@example.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','closed','yes'),(20,'default_ping_status','closed','yes'),(21,'default_pingback_flag','','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','1','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/%year%/%monthnum%/%day%/%postname%/','yes'),(29,'gzipcompression','0','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:0:{}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'advanced_edit','0','yes'),(37,'comment_max_links','2','yes'),(38,'gmt_offset','0','yes'),(39,'default_email_category','1','yes'),(40,'recently_edited','','no'),(41,'template','bb-base','yes'),(42,'stylesheet','codex-bbpress-org','yes'),(43,'comment_whitelist','1','yes'),(44,'blacklist_keys','','no'),(45,'comment_registration','1','yes'),(46,'html_type','text/html','yes'),(47,'use_trackback','0','yes'),(48,'default_role','subscriber','yes'),(49,'db_version','31535','yes'),(50,'uploads_use_yearmonth_folders','1','yes'),(51,'upload_path','','yes'),(52,'blog_public','1','yes'),(53,'default_link_category','2','yes'),(54,'show_on_front','page','yes'),(55,'tag_base','','yes'),(56,'show_avatars','1','yes'),(57,'avatar_rating','G','yes'),(58,'upload_url_path','','yes'),(59,'thumbnail_size_w','150','yes'),(60,'thumbnail_size_h','150','yes'),(61,'thumbnail_crop','1','yes'),(62,'medium_size_w','300','yes'),(63,'medium_size_h','300','yes'),(64,'avatar_default','mystery','yes'),(65,'large_size_w','1024','yes'),(66,'large_size_h','1024','yes'),(67,'image_default_link_type','file','yes'),(68,'image_default_size','','yes'),(69,'image_default_align','','yes'),(70,'close_comments_for_old_posts','','yes'),(71,'close_comments_days_old','14','yes'),(72,'thread_comments','1','yes'),(73,'thread_comments_depth','5','yes'),(74,'page_comments','','yes'),(75,'comments_per_page','50','yes'),(76,'default_comments_page','newest','yes'),(77,'comment_order','asc','yes'),(78,'sticky_posts','a:0:{}','yes'),(79,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_text','a:0:{}','yes'),(81,'widget_rss','a:0:{}','yes'),(82,'uninstall_plugins','a:0:{}','no'),(83,'timezone_string','','yes'),(84,'page_for_posts','0','yes'),(85,'page_on_front','5','yes'),(86,'default_post_format','0','yes'),(87,'link_manager_enabled','0','yes'),(88,'wp_53_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(89,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(90,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(91,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(92,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(93,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(94,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(96,'WPLANG','','yes'),(99,'allowedthemes','a:5:{s:7:\"bb-base\";b:1;s:11:\"bbpress-org\";b:1;s:17:\"codex-bbpress-org\";b:1;s:14:\"buddypress-org\";b:1;s:20:\"codex-buddypress-org\";b:1;}','yes'),(100,'_transient_random_seed','5f2a292ce1a6fbdac9814628f23404cc','yes'),(101,'cron','a:3:{i:1431119549;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1431120490;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(113,'theme_mods_twentyfifteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1427318580;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(114,'current_theme','bbPress.org Codex 2013','yes'),(115,'theme_mods_codex-bbpress-org','a:1:{i:0;b:0;}','yes'),(116,'theme_switched','','yes'),(117,'new_admin_email','foo@example.com','yes'),(120,'post_count','0','yes'),(129,'syntaxhighlighter_settings','a:15:{s:9:\"shversion\";i:3;s:5:\"theme\";s:6:\"django\";s:6:\"gutter\";i:1;s:9:\"smarttabs\";i:1;s:9:\"classname\";s:0:\"\";s:9:\"firstline\";s:1:\"1\";s:14:\"padlinenumbers\";s:5:\"false\";s:7:\"tabsize\";s:1:\"4\";s:5:\"title\";s:0:\"\";s:14:\"loadallbrushes\";i:0;s:9:\"autolinks\";i:0;s:8:\"collapse\";i:0;s:5:\"light\";i:0;s:7:\"toolbar\";i:0;s:9:\"wraplines\";i:0;}','yes'),(135,'rewrite_rules','a:152:{s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?type=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?type=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?type=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:26:\"index.php?type=$matches[1]\";s:55:\"bp_member_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?bp_member_type=$matches[1]&feed=$matches[2]\";s:50:\"bp_member_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?bp_member_type=$matches[1]&feed=$matches[2]\";s:43:\"bp_member_type/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?bp_member_type=$matches[1]&paged=$matches[2]\";s:25:\"bp_member_type/([^/]+)/?$\";s:36:\"index.php?bp_member_type=$matches[1]\";s:48:\"version/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?version=$matches[1]&feed=$matches[2]\";s:43:\"version/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?version=$matches[1]&feed=$matches[2]\";s:36:\"version/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?version=$matches[1]&paged=$matches[2]\";s:18:\"version/([^/]+)/?$\";s:29:\"index.php?version=$matches[1]\";s:50:\"component/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?component=$matches[1]&feed=$matches[2]\";s:45:\"component/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?component=$matches[1]&feed=$matches[2]\";s:38:\"component/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?component=$matches[1]&paged=$matches[2]\";s:20:\"component/([^/]+)/?$\";s:31:\"index.php?component=$matches[1]\";s:48:\"context/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?context=$matches[1]&feed=$matches[2]\";s:43:\"context/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?context=$matches[1]&feed=$matches[2]\";s:36:\"context/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?context=$matches[1]&paged=$matches[2]\";s:18:\"context/([^/]+)/?$\";s:29:\"index.php?context=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=5&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:95:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:105:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:125:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:120:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:120:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:102:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:156:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&name=$matches[8]&tb=1\";s:122:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:168:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&name=$matches[8]&feed=$matches[9]\";s:117:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:168:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&name=$matches[8]&feed=$matches[9]\";s:110:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:169:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&name=$matches[8]&paged=$matches[9]\";s:117:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:169:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&name=$matches[8]&cpage=$matches[9]\";s:102:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:168:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&name=$matches[8]&page=$matches[9]\";s:84:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:94:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:114:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:109:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:109:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:89:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:99:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:119:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:114:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:114:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:94:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/trackback/?$\";s:139:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&tb=1\";s:114:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:151:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&feed=$matches[8]\";s:109:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:151:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&feed=$matches[8]\";s:102:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:152:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&paged=$matches[8]\";s:109:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:152:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&cpage=$matches[8]\";s:94:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})(/[0-9]+)?/?$\";s:151:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&day=$matches[7]&page=$matches[8]\";s:78:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:108:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:103:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:103:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:78:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:108:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:103:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:103:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:81:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/trackback/?$\";s:123:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&tb=1\";s:101:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:135:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&feed=$matches[7]\";s:96:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:135:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&feed=$matches[7]\";s:89:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:136:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&paged=$matches[7]\";s:96:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:136:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&cpage=$matches[7]\";s:81:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/([0-9]{1,2})(/[0-9]+)?/?$\";s:135:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&monthnum=$matches[6]&page=$matches[7]\";s:67:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:97:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:92:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:92:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/[0-9]{1,2}/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:67:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:97:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:92:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:92:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:68:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/trackback/?$\";s:102:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&tb=1\";s:88:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:114:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&feed=$matches[6]\";s:83:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:114:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&feed=$matches[6]\";s:76:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/page/?([0-9]{1,})/?$\";s:115:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&paged=$matches[6]\";s:83:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:115:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&cpage=$matches[6]\";s:68:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/([0-9]{4})(/[0-9]+)?/?$\";s:114:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&year=$matches[5]&page=$matches[6]\";s:56:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:66:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:86:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:81:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:81:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/[0-9]{4}/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(137,'bp-deactivated-components','a:0:{}','yes'),(138,'bb-config-location','/srv/www/wordpress-meta-environment/buddypressorg.test/public_html/wordpress/bb-config.php','yes'),(139,'bp-xprofile-base-group-name','Base','yes'),(140,'bp-xprofile-fullname-field-name','Name','yes'),(141,'bp-disable-blogforum-comments','1','yes'),(142,'_bp_theme_package_id','legacy','yes'),(143,'_bp_enable_akismet','1','yes'),(144,'_bp_enable_heartbeat_refresh','1','yes'),(145,'bp-pages','','yes'),(146,'db_upgraded','1','yes');
/*!40000 ALTER TABLE `wp_53_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_53_postmeta`
--

DROP TABLE IF EXISTS `wp_53_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_53_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_53_postmeta`
--

LOCK TABLES `wp_53_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_53_postmeta` DISABLE KEYS */;
INSERT INTO `wp_53_postmeta` VALUES (4,5,'_edit_last','1'),(5,5,'_wp_page_template','default'),(6,5,'_edit_lock','1427318853:1');
/*!40000 ALTER TABLE `wp_53_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_53_posts`
--

DROP TABLE IF EXISTS `wp_53_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_53_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_53_posts`
--

LOCK TABLES `wp_53_posts` WRITE;
/*!40000 ALTER TABLE `wp_53_posts` DISABLE KEYS */;
INSERT INTO `wp_53_posts` VALUES (5,1,'2015-03-25 21:28:18','2015-03-25 21:28:18','Welcome to the bbPress Codex, the online manual for bbPress and a living repository for bbPress information and documentation. If you have a bbPress.org, WordPress.org, or BuddyPress.org account, you are welcome and invited to modify any of the pages you see here.\r\n\r\nThis codex is powered by the community of users and professionals that are passionate about bbPress. The information you’ll find here is only as up-to-date as the last person that revised it, so help us out if you find something that’s out of date or missing.\r\n<h2 style=\"font-size: 20px;\"><a title=\"All you ever needed to know about getting started with bbPress\" href=\"https://codex.bbpress.org/getting-started-with-bbpress/\">Getting Started</a></h2>\r\nNew to bbPress?, Not sure where to begin? <i>Getting Started</i> is here to help! Everything you need to know about setting up bbPress is here from installing and activating to getting your first forum up and running.\r\n<h2 style=\"font-size: 20px;\"><a title=\"bbPress Theme Development\" href=\"http://codex.bbpress.org/themes/\">Theme Development</a></h2>\r\nWant to customize your site? Build a bbPress theme? Tweak some CSS styles? These sweeter than honey guides will help you achieve your goal.\r\n<h2 style=\"font-size: 20px;\"><a title=\"bbPress Plugin Development\" href=\"http://codex.bbpress.org/plugins/\">Plugin Development</a></h2>\r\nThere are a swarm of plugins available for bbPress, here you\'ll find helpful guides and instructions on building your own bbPress plugin.\r\n<h2 style=\"font-size: 20px;\"><a title=\"Participate and Contribute\" href=\"http://codex.bbpress.org/participate-and-contribute/\">Participate &amp; Contribute</a></h2>\r\nCome and bee a part of the bbPress community and learn how you can get involved and contribute.\r\n<h2 style=\"font-size: 20px;\"><a title=\"bbPress Developer Resources\" href=\"http://codex.bbpress.org/developer/\">Developer Resources</a></h2>\r\nDeveloper resources provides detailed guides on bbPress\' classes, functions and hooks.\r\n\r\n<hr />\r\n\r\n<a title=\"Step by step guide to setting up a bbPress forum - Part 1\" href=\"http://codex.bbpress.org/step-by-step-guide-to-setting-up-a-bbpress-forum/\">Step by step guide to setting up a bbPress forum - Part 1 - Getting it working</a>\r\n<a title=\"Step by step guide to setting up a bbPress forum - Part 2 \" href=\"http://codex.bbpress.org/step-by-step-guide-to-setting-up-a-bbpress-forum-part-2/\">Step by step guide to setting up a bbPress forum - Part 2 - Styling bbPress</a>\r\n<a title=\"Step by step guide to setting up a bbPress forum - Part 3\" href=\"http://codex.bbpress.org/step-by-step-guide-to-setting-up-a-bbpress-forum-part-3/\">Step by step guide to setting up a bbPress forum - Part 3 - Changing layout &amp; functionality </a>\r\n<a title=\"Step by step guide to setting up a bbPress forum - Part 4\" href=\"http://codex.bbpress.org/step-by-step-guide-to-setting-up-a-bbpress-forum-part-4/\">Step by step guide to setting up a bbPress forum - Part 4 - Adding Actions</a>\r\n<a title=\"Step by step guide to setting up a bbPress forum - Part 5\" href=\"http://codex.bbpress.org/step-by-step-guide-to-setting-up-a-bbpress-forum-part-5/\">Step by step guide to setting up a bbPress forum - Part 5 - Using filters</a>\r\n\r\n<a href=\"http://bbpressfrancais.over-blog.com/\" target=\"_blank\"> lien vers des instructions en français</a>\r\n\r\n<a title=\"bbPress Styling Crib\" href=\"http://codex.bbpress.org/bbpress-styling-crib/\">bbPress Styling Crib</a>\r\n\r\n<a title=\"Layout and functionality - examples you can use\" href=\"http://codex.bbpress.org/layout-and-functionality-examples-you-can-use/\">Layout and functionality - examples you can use</a>\r\n\r\n<a title=\"List of bbPress plugins - add extra functionality\" href=\"http://bbpress.org/plugins/\">List of bbPress plugins - add extra functionality</a>\r\n\r\n<a title=\"Creating a test site\" href=\"http://codex.bbpress.org/creating-a-test-site/\">Creating a test site</a>\r\n\r\n<a title=\"Functions files and child themes - explained !\" href=\"http://codex.bbpress.org/functions-files-and-child-themes-explained/\"> Functions files and child themes - explained! </a>\r\n\r\n<a title=\"making bbpress look like other forums\" href=\"http://codex.bbpress.org/making-bbpress-look-like-other-forums/\"> Making bbpress look like other forums </a>\r\n\r\n<a title=\"bbPress Roles and capabilities\" href=\"https://codex.bbpress.org/bbpress-user-roles-and-capabilities/\"> bbPress Roles and capabilities</a>\r\n\r\n<a title=\"Custom capabilities\" href=\"http://codex.bbpress.org/custom-capabilities/\"> Custom capabilities</a>\r\n\r\n<a title=\"Getting Started with bbPress - part 1\" href=\"http://codex.bbpress.org/getting-started-with-bbpress/\">Getting Started with bbPress</a>\r\n<a title=\"Forum Settings\" href=\"http://codex.bbpress.org/forum-settings/\">Forum Settings</a>\r\n<a title=\"Shortcodes\" href=\"http://codex.bbpress.org/shortcodes/\">Shortcodes</a>\r\n<a title=\"Widgets\" href=\"http://codex.bbpress.org/widgets/\">Widgets</a>\r\n<a title=\"Theme Compatibility\" href=\"http://codex.bbpress.org/theme-compatibility/\">Theme Compatibility</a>\r\n<a title=\"Frequently Asked Questions\" href=\"http://codex.bbpress.org/faq/\">Frequently Asked Questions</a>\r\n<a title=\"Using bbPress Forums with BuddyPress Group Forums\" href=\"http://codex.bbpress.org/using-bbpress-forums-with-buddypress-group-forums/\">Using bbPress Forums with BuddyPress Group Forums</a>\r\n<a title=\"bbPress in Your Language\" href=\"http://codex.bbpress.org/bbpress-in-your-language/\">bbPress in Your Language</a>\r\n<a title=\"Importing existing forums into bbPress\" href=\"http://codex.bbpress.org/import-forums/\">Importing existing forums into bbPress</a>','Codex','','publish','open','open','','codex','','','2015-03-25 21:29:53','2015-03-25 21:29:53','',0,'http://codex.bbpressorg.test/?page_id=5',0,'page','',0),(6,1,'2015-03-25 21:28:18','2015-03-25 21:28:18','','Codex','','inherit','open','open','','5-revision-v1','','','2015-03-25 21:28:18','2015-03-25 21:28:18','',5,'http://codex.bbpressorg.test/2015/03/25/5-revision-v1/',0,'revision','',0),(8,1,'2015-03-25 21:29:53','2015-03-25 21:29:53','Welcome to the bbPress Codex, the online manual for bbPress and a living repository for bbPress information and documentation. If you have a bbPress.org, WordPress.org, or BuddyPress.org account, you are welcome and invited to modify any of the pages you see here.\r\n\r\nThis codex is powered by the community of users and professionals that are passionate about bbPress. The information you’ll find here is only as up-to-date as the last person that revised it, so help us out if you find something that’s out of date or missing.\r\n<h2 style=\"font-size: 20px;\"><a title=\"All you ever needed to know about getting started with bbPress\" href=\"https://codex.bbpress.org/getting-started-with-bbpress/\">Getting Started</a></h2>\r\nNew to bbPress?, Not sure where to begin? <i>Getting Started</i> is here to help! Everything you need to know about setting up bbPress is here from installing and activating to getting your first forum up and running.\r\n<h2 style=\"font-size: 20px;\"><a title=\"bbPress Theme Development\" href=\"http://codex.bbpress.org/themes/\">Theme Development</a></h2>\r\nWant to customize your site? Build a bbPress theme? Tweak some CSS styles? These sweeter than honey guides will help you achieve your goal.\r\n<h2 style=\"font-size: 20px;\"><a title=\"bbPress Plugin Development\" href=\"http://codex.bbpress.org/plugins/\">Plugin Development</a></h2>\r\nThere are a swarm of plugins available for bbPress, here you\'ll find helpful guides and instructions on building your own bbPress plugin.\r\n<h2 style=\"font-size: 20px;\"><a title=\"Participate and Contribute\" href=\"http://codex.bbpress.org/participate-and-contribute/\">Participate &amp; Contribute</a></h2>\r\nCome and bee a part of the bbPress community and learn how you can get involved and contribute.\r\n<h2 style=\"font-size: 20px;\"><a title=\"bbPress Developer Resources\" href=\"http://codex.bbpress.org/developer/\">Developer Resources</a></h2>\r\nDeveloper resources provides detailed guides on bbPress\' classes, functions and hooks.\r\n\r\n<hr />\r\n\r\n<a title=\"Step by step guide to setting up a bbPress forum - Part 1\" href=\"http://codex.bbpress.org/step-by-step-guide-to-setting-up-a-bbpress-forum/\">Step by step guide to setting up a bbPress forum - Part 1 - Getting it working</a>\r\n<a title=\"Step by step guide to setting up a bbPress forum - Part 2 \" href=\"http://codex.bbpress.org/step-by-step-guide-to-setting-up-a-bbpress-forum-part-2/\">Step by step guide to setting up a bbPress forum - Part 2 - Styling bbPress</a>\r\n<a title=\"Step by step guide to setting up a bbPress forum - Part 3\" href=\"http://codex.bbpress.org/step-by-step-guide-to-setting-up-a-bbpress-forum-part-3/\">Step by step guide to setting up a bbPress forum - Part 3 - Changing layout &amp; functionality </a>\r\n<a title=\"Step by step guide to setting up a bbPress forum - Part 4\" href=\"http://codex.bbpress.org/step-by-step-guide-to-setting-up-a-bbpress-forum-part-4/\">Step by step guide to setting up a bbPress forum - Part 4 - Adding Actions</a>\r\n<a title=\"Step by step guide to setting up a bbPress forum - Part 5\" href=\"http://codex.bbpress.org/step-by-step-guide-to-setting-up-a-bbpress-forum-part-5/\">Step by step guide to setting up a bbPress forum - Part 5 - Using filters</a>\r\n\r\n<a href=\"http://bbpressfrancais.over-blog.com/\" target=\"_blank\"> lien vers des instructions en français</a>\r\n\r\n<a title=\"bbPress Styling Crib\" href=\"http://codex.bbpress.org/bbpress-styling-crib/\">bbPress Styling Crib</a>\r\n\r\n<a title=\"Layout and functionality - examples you can use\" href=\"http://codex.bbpress.org/layout-and-functionality-examples-you-can-use/\">Layout and functionality - examples you can use</a>\r\n\r\n<a title=\"List of bbPress plugins - add extra functionality\" href=\"http://bbpress.org/plugins/\">List of bbPress plugins - add extra functionality</a>\r\n\r\n<a title=\"Creating a test site\" href=\"http://codex.bbpress.org/creating-a-test-site/\">Creating a test site</a>\r\n\r\n<a title=\"Functions files and child themes - explained !\" href=\"http://codex.bbpress.org/functions-files-and-child-themes-explained/\"> Functions files and child themes - explained! </a>\r\n\r\n<a title=\"making bbpress look like other forums\" href=\"http://codex.bbpress.org/making-bbpress-look-like-other-forums/\"> Making bbpress look like other forums </a>\r\n\r\n<a title=\"bbPress Roles and capabilities\" href=\"https://codex.bbpress.org/bbpress-user-roles-and-capabilities/\"> bbPress Roles and capabilities</a>\r\n\r\n<a title=\"Custom capabilities\" href=\"http://codex.bbpress.org/custom-capabilities/\"> Custom capabilities</a>\r\n\r\n<a title=\"Getting Started with bbPress - part 1\" href=\"http://codex.bbpress.org/getting-started-with-bbpress/\">Getting Started with bbPress</a>\r\n<a title=\"Forum Settings\" href=\"http://codex.bbpress.org/forum-settings/\">Forum Settings</a>\r\n<a title=\"Shortcodes\" href=\"http://codex.bbpress.org/shortcodes/\">Shortcodes</a>\r\n<a title=\"Widgets\" href=\"http://codex.bbpress.org/widgets/\">Widgets</a>\r\n<a title=\"Theme Compatibility\" href=\"http://codex.bbpress.org/theme-compatibility/\">Theme Compatibility</a>\r\n<a title=\"Frequently Asked Questions\" href=\"http://codex.bbpress.org/faq/\">Frequently Asked Questions</a>\r\n<a title=\"Using bbPress Forums with BuddyPress Group Forums\" href=\"http://codex.bbpress.org/using-bbpress-forums-with-buddypress-group-forums/\">Using bbPress Forums with BuddyPress Group Forums</a>\r\n<a title=\"bbPress in Your Language\" href=\"http://codex.bbpress.org/bbpress-in-your-language/\">bbPress in Your Language</a>\r\n<a title=\"Importing existing forums into bbPress\" href=\"http://codex.bbpress.org/import-forums/\">Importing existing forums into bbPress</a>','Codex','','inherit','closed','closed','','5-revision-v1','','','2015-03-25 21:29:53','2015-03-25 21:29:53','',5,'http://codex.bbpressorg.test/2015/03/25/5-revision-v1/',0,'revision','',0);
/*!40000 ALTER TABLE `wp_53_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_53_term_relationships`
--

DROP TABLE IF EXISTS `wp_53_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_53_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_53_term_relationships`
--

LOCK TABLES `wp_53_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_53_term_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_53_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_53_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_53_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_53_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_53_term_taxonomy`
--

LOCK TABLES `wp_53_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_53_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_53_term_taxonomy` VALUES (1,1,'category','',0,0);
/*!40000 ALTER TABLE `wp_53_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_53_terms`
--

DROP TABLE IF EXISTS `wp_53_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_53_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_53_terms`
--

LOCK TABLES `wp_53_terms` WRITE;
/*!40000 ALTER TABLE `wp_53_terms` DISABLE KEYS */;
INSERT INTO `wp_53_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_53_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_blog_versions`
--

DROP TABLE IF EXISTS `wp_blog_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_blog_versions` (
  `blog_id` bigint(20) NOT NULL DEFAULT '0',
  `db_version` varchar(20) NOT NULL DEFAULT '',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`blog_id`),
  KEY `db_version` (`db_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_blog_versions`
--

LOCK TABLES `wp_blog_versions` WRITE;
/*!40000 ALTER TABLE `wp_blog_versions` DISABLE KEYS */;
INSERT INTO `wp_blog_versions` VALUES (1,'31535','2015-05-08 00:33:25'),(15,'31535','2015-05-08 00:36:33'),(21,'31535','2015-05-08 00:36:33'),(53,'31535','2015-05-08 00:36:33');
/*!40000 ALTER TABLE `wp_blog_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_blogs`
--

DROP TABLE IF EXISTS `wp_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_blogs` (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) NOT NULL DEFAULT '0',
  `domain` varchar(200) NOT NULL DEFAULT '',
  `path` varchar(100) NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `public` tinyint(2) NOT NULL DEFAULT '1',
  `archived` tinyint(2) NOT NULL DEFAULT '0',
  `mature` tinyint(2) NOT NULL DEFAULT '0',
  `spam` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` tinyint(2) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`blog_id`),
  KEY `domain` (`domain`(50),`path`(5)),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_blogs`
--

LOCK TABLES `wp_blogs` WRITE;
/*!40000 ALTER TABLE `wp_blogs` DISABLE KEYS */;
INSERT INTO `wp_blogs` VALUES (1,1,'buddypressorg.test','/','2015-03-25 20:05:44','2015-03-26 23:06:44',1,0,0,0,0,0),(15,1,'codex.buddypressorg.test','/','2015-03-25 20:35:07','2015-05-08 00:38:17',1,0,0,0,0,0),(21,1,'es.buddypressorg.test','/','2015-03-25 20:40:55','2015-03-25 23:54:24',1,0,0,0,0,0),(53,1,'codex.bbpressorg.test','/','2015-03-25 20:47:24','2015-03-25 21:29:53',1,0,0,0,0,0);
/*!40000 ALTER TABLE `wp_blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bp_activity`
--

DROP TABLE IF EXISTS `wp_bp_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bp_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `action` text NOT NULL,
  `content` longtext NOT NULL,
  `primary_link` text NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_recorded` (`date_recorded`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `component` (`component`),
  KEY `type` (`type`),
  KEY `mptt_left` (`mptt_left`),
  KEY `mptt_right` (`mptt_right`),
  KEY `hide_sitewide` (`hide_sitewide`),
  KEY `is_spam` (`is_spam`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bp_activity`
--

LOCK TABLES `wp_bp_activity` WRITE;
/*!40000 ALTER TABLE `wp_bp_activity` DISABLE KEYS */;
INSERT INTO `wp_bp_activity` VALUES (1,1,'members','last_activity','','','',0,NULL,'2015-05-08 00:46:50',0,0,0,0);
/*!40000 ALTER TABLE `wp_bp_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bp_activity_meta`
--

DROP TABLE IF EXISTS `wp_bp_activity_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bp_activity_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bp_activity_meta`
--

LOCK TABLES `wp_bp_activity_meta` WRITE;
/*!40000 ALTER TABLE `wp_bp_activity_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bp_activity_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bp_notifications`
--

DROP TABLE IF EXISTS `wp_bp_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bp_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) NOT NULL,
  `component_action` varchar(75) NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `user_id` (`user_id`),
  KEY `is_new` (`is_new`),
  KEY `component_name` (`component_name`),
  KEY `component_action` (`component_action`),
  KEY `useritem` (`user_id`,`is_new`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bp_notifications`
--

LOCK TABLES `wp_bp_notifications` WRITE;
/*!40000 ALTER TABLE `wp_bp_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bp_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bp_notifications_meta`
--

DROP TABLE IF EXISTS `wp_bp_notifications_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bp_notifications_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `notification_id` (`notification_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bp_notifications_meta`
--

LOCK TABLES `wp_bp_notifications_meta` WRITE;
/*!40000 ALTER TABLE `wp_bp_notifications_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bp_notifications_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bp_user_blogs`
--

DROP TABLE IF EXISTS `wp_bp_user_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bp_user_blogs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `blog_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bp_user_blogs`
--

LOCK TABLES `wp_bp_user_blogs` WRITE;
/*!40000 ALTER TABLE `wp_bp_user_blogs` DISABLE KEYS */;
INSERT INTO `wp_bp_user_blogs` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4);
/*!40000 ALTER TABLE `wp_bp_user_blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bp_user_blogs_blogmeta`
--

DROP TABLE IF EXISTS `wp_bp_user_blogs_blogmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bp_user_blogs_blogmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bp_user_blogs_blogmeta`
--

LOCK TABLES `wp_bp_user_blogs_blogmeta` WRITE;
/*!40000 ALTER TABLE `wp_bp_user_blogs_blogmeta` DISABLE KEYS */;
INSERT INTO `wp_bp_user_blogs_blogmeta` VALUES (1,1,'url','http://buddypressorg.dev'),(2,1,'name','BuddyPress.org'),(3,1,'description','Run your own social network'),(4,1,'last_activity','2015-03-25 20:20:51'),(5,1,'close_comments_for_old_posts','1'),(6,1,'close_comments_days_old','14'),(7,1,'thread_comments_depth','5'),(8,2,'name','BuddyPress Codex'),(9,2,'url','http://codex.buddypressorg.dev'),(10,2,'description',''),(11,2,'last_activity','2015-03-25 20:40:09'),(12,2,'close_comments_for_old_posts','1'),(13,2,'close_comments_days_old','14'),(14,2,'thread_comments_depth','1'),(15,3,'name',''),(16,3,'url','http://es.buddypressorg.dev'),(17,3,'description',''),(18,3,'last_activity','2015-03-25 20:40:55'),(19,3,'close_comments_for_old_posts',''),(20,3,'close_comments_days_old','14'),(21,3,'thread_comments_depth','5'),(22,4,'name','bbPress Codex'),(23,4,'url','http://whatever.buddypressorg.dev'),(24,4,'description',''),(25,4,'last_activity','2015-03-25 20:47:25'),(26,4,'close_comments_for_old_posts',''),(27,4,'close_comments_days_old','14'),(28,4,'thread_comments_depth','5');
/*!40000 ALTER TABLE `wp_bp_user_blogs_blogmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bp_xprofile_data`
--

DROP TABLE IF EXISTS `wp_bp_xprofile_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bp_xprofile_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bp_xprofile_data`
--

LOCK TABLES `wp_bp_xprofile_data` WRITE;
/*!40000 ALTER TABLE `wp_bp_xprofile_data` DISABLE KEYS */;
INSERT INTO `wp_bp_xprofile_data` VALUES (1,1,1,'admin','2015-03-25 20:16:40');
/*!40000 ALTER TABLE `wp_bp_xprofile_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bp_xprofile_fields`
--

DROP TABLE IF EXISTS `wp_bp_xprofile_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bp_xprofile_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) NOT NULL DEFAULT '',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `parent_id` (`parent_id`),
  KEY `field_order` (`field_order`),
  KEY `can_delete` (`can_delete`),
  KEY `is_required` (`is_required`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bp_xprofile_fields`
--

LOCK TABLES `wp_bp_xprofile_fields` WRITE;
/*!40000 ALTER TABLE `wp_bp_xprofile_fields` DISABLE KEYS */;
INSERT INTO `wp_bp_xprofile_fields` VALUES (1,1,0,'textbox','Name','',1,0,0,0,'',0);
/*!40000 ALTER TABLE `wp_bp_xprofile_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bp_xprofile_groups`
--

DROP TABLE IF EXISTS `wp_bp_xprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bp_xprofile_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` mediumtext NOT NULL,
  `group_order` bigint(20) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `can_delete` (`can_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bp_xprofile_groups`
--

LOCK TABLES `wp_bp_xprofile_groups` WRITE;
/*!40000 ALTER TABLE `wp_bp_xprofile_groups` DISABLE KEYS */;
INSERT INTO `wp_bp_xprofile_groups` VALUES (1,'Base','',0,0);
/*!40000 ALTER TABLE `wp_bp_xprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bp_xprofile_meta`
--

DROP TABLE IF EXISTS `wp_bp_xprofile_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bp_xprofile_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bp_xprofile_meta`
--

LOCK TABLES `wp_bp_xprofile_meta` WRITE;
/*!40000 ALTER TABLE `wp_bp_xprofile_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bp_xprofile_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'Mr WordPress','','https://wordpress.org/','','2015-03-25 20:03:58','2015-03-25 20:03:58','Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.',0,'1','','',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://buddypressorg.test','yes'),(2,'home','http://buddypressorg.test','yes'),(3,'blogname','BuddyPress.org','yes'),(4,'blogdescription','Run your own social network','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','foo@example.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','1','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','','yes'),(27,'moderation_notify','','yes'),(28,'permalink_structure','/%year%/%monthnum%/%postname%/','yes'),(29,'gzipcompression','0','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:1:{i:0;s:19:\"bbpress/bbpress.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'advanced_edit','0','yes'),(37,'comment_max_links','4','yes'),(38,'gmt_offset','','yes'),(39,'default_email_category','1','yes'),(40,'recently_edited','','no'),(41,'template','bb-base','yes'),(42,'stylesheet','buddypress-org','yes'),(43,'comment_whitelist','1','yes'),(44,'blacklist_keys','','no'),(45,'comment_registration','','yes'),(46,'html_type','text/html','yes'),(47,'use_trackback','0','yes'),(48,'default_role','subscriber','yes'),(49,'db_version','31535','yes'),(50,'uploads_use_yearmonth_folders','1','yes'),(51,'upload_path','','yes'),(52,'blog_public','1','yes'),(53,'default_link_category','2','yes'),(54,'show_on_front','page','yes'),(55,'tag_base','','yes'),(56,'show_avatars','1','yes'),(57,'avatar_rating','G','yes'),(58,'upload_url_path','','yes'),(59,'thumbnail_size_w','150','yes'),(60,'thumbnail_size_h','150','yes'),(61,'thumbnail_crop','1','yes'),(62,'medium_size_w','300','yes'),(63,'medium_size_h','300','yes'),(64,'avatar_default','mystery','yes'),(65,'large_size_w','1024','yes'),(66,'large_size_h','1024','yes'),(67,'image_default_link_type','file','yes'),(68,'image_default_size','','yes'),(69,'image_default_align','','yes'),(70,'close_comments_for_old_posts','1','yes'),(71,'close_comments_days_old','14','yes'),(72,'thread_comments','1','yes'),(73,'thread_comments_depth','5','yes'),(74,'page_comments','1','yes'),(75,'comments_per_page','50','yes'),(76,'default_comments_page','newest','yes'),(77,'comment_order','asc','yes'),(78,'sticky_posts','a:0:{}','yes'),(79,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_text','a:0:{}','yes'),(81,'widget_rss','a:0:{}','yes'),(82,'uninstall_plugins','a:0:{}','no'),(83,'timezone_string','Africa/Abidjan','yes'),(84,'page_for_posts','10','yes'),(85,'page_on_front','8','yes'),(86,'default_post_format','0','yes'),(87,'link_manager_enabled','0','yes'),(88,'initial_db_version','31532','yes'),(89,'wp_user_roles','a:8:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:13:\"bbp_keymaster\";a:2:{s:4:\"name\";s:9:\"Keymaster\";s:12:\"capabilities\";a:0:{}}s:13:\"bbp_spectator\";a:2:{s:4:\"name\";s:9:\"Spectator\";s:12:\"capabilities\";a:0:{}}s:11:\"bbp_blocked\";a:2:{s:4:\"name\";s:7:\"Blocked\";s:12:\"capabilities\";a:0:{}}}','yes'),(90,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(91,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(92,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(93,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(94,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(95,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(97,'cron','a:6:{i:1431070980;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1431072239;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1431072580;a:1:{s:21:\"update_network_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1431115476;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1431116467;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(99,'_transient_random_seed','a569a98981349de748a1e80355f49747','yes'),(100,'nonce_key','.LR$OsNT!USH08B=9vw,|Nw=CP-}8|DUl)6L_~5)Z!*9S}Dl($aDB1r4Ba^](0}5','yes'),(101,'nonce_salt','4qg,V2yQQ6s,#@{mJjnn78iA6)YS$IR$glAh[D8%7vlxBz<Bo&VB=>1K{dZNU1s>','yes'),(104,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:11:\"development\";s:8:\"download\";s:57:\"https://wordpress.org/nightly-builds/wordpress-latest.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://wordpress.org/nightly-builds/wordpress-latest.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:15:\"4.2-beta2-31874\";s:7:\"version\";s:15:\"4.2-beta2-31874\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.1\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:57:\"https://wordpress.org/nightly-builds/wordpress-latest.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://wordpress.org/nightly-builds/wordpress-latest.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:15:\"4.2-beta2-31874\";s:7:\"version\";s:15:\"4.2-beta2-31874\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.1\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1427313842;s:15:\"version_checked\";s:15:\"4.2-beta2-31888\";s:12:\"translations\";a:0:{}}','yes'),(109,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1427313847;s:7:\"checked\";a:6:{s:12:\"twentyeleven\";s:3:\"2.0\";s:13:\"twentyfifteen\";s:3:\"1.0\";s:14:\"twentyfourteen\";s:3:\"1.3\";s:9:\"twentyten\";s:3:\"1.8\";s:14:\"twentythirteen\";s:3:\"1.4\";s:12:\"twentytwelve\";s:3:\"1.6\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','yes'),(110,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1427313845;s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:2:\"15\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"3.1.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.3.1.1.zip\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:4:\"3564\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";}}}','yes'),(111,'auth_key','Jw(bt0#2QE?)jak~Vp)f[TG{hjI.,f)[/k>#4Rxp<ptDs6$33XcOpegVFnE3z(SV','yes'),(112,'auth_salt','>Y]eY0nS@%::_{+sHnoC}q~wP[!r1rVd]8B2Tu9!7a(kBUD:2_6Z9)jxDg/?~RM{','yes'),(113,'logged_in_key','CR<E%htTgqREE.:E,2kn<)+nyt6n<.1Mnl/7&6FXG^>0@p9yg-oXGO,!b<9j Ol(','yes'),(114,'logged_in_salt','vpTIE<,bU?-6Q9:^pH&j8[2F/kI8iDWG:/*/OhOrtWmap%cH0@Wp7p^pfI.s4eue','yes'),(137,'recently_activated','a:0:{}','yes'),(138,'bp-deactivated-components','a:0:{}','yes'),(139,'bb-config-location','/Users/paulgibbs/Sites/mamp/bb-config.php','yes'),(140,'bp-xprofile-base-group-name','Base','yes'),(141,'bp-xprofile-fullname-field-name','Name','yes'),(142,'bp-blogs-first-install','','yes'),(143,'bp-disable-profile-sync','0','yes'),(144,'hide-loggedout-adminbar','0','yes'),(145,'bp-disable-avatar-uploads','1','yes'),(146,'bp-disable-account-deletion','1','yes'),(147,'bp-disable-blogforum-comments','1','yes'),(148,'_bp_theme_package_id','legacy','yes'),(149,'bp_restrict_group_creation','1','yes'),(150,'_bp_enable_akismet','1','yes'),(151,'_bp_enable_heartbeat_refresh','1','yes'),(152,'_bp_force_buddybar','','yes'),(153,'_bp_retain_bp_default','','yes'),(154,'widget_bp_core_login_widget','','yes'),(155,'widget_bp_core_members_widget','','yes'),(156,'widget_bp_core_whos_online_widget','','yes'),(157,'widget_bp_core_recently_active_widget','','yes'),(158,'widget_bp_groups_widget','','yes'),(159,'widget_bp_messages_sitewide_notices_widget','','yes'),(164,'bp-active-components','a:6:{s:8:\"xprofile\";s:1:\"1\";s:8:\"settings\";s:1:\"1\";s:8:\"activity\";s:1:\"1\";s:13:\"notifications\";s:1:\"1\";s:5:\"blogs\";s:1:\"1\";s:7:\"members\";s:1:\"1\";}','yes'),(165,'post_count','1','yes'),(166,'bp-pages','a:3:{s:7:\"members\";i:5;s:8:\"activity\";i:15;s:5:\"blogs\";i:6;}','yes'),(167,'_bp_db_version','9848','yes'),(170,'bp_disable_blogforum_comments','1','yes'),(171,'WPLANG','','yes'),(172,'new_admin_email','foo@example.com','yes'),(175,'allowedthemes','a:5:{s:7:\"bb-base\";b:1;s:11:\"bbpress-org\";b:1;s:17:\"codex-bbpress-org\";b:1;s:14:\"buddypress-org\";b:1;s:20:\"codex-buddypress-org\";b:1;}','yes'),(176,'theme_mods_twentyfifteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1427315270;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(177,'current_theme','BuddyPress.org 2013','yes'),(178,'theme_mods_buddypress-org','a:1:{i:0;b:0;}','yes'),(179,'theme_switched','','yes'),(187,'syntaxhighlighter_settings','a:15:{s:9:\"shversion\";i:3;s:5:\"theme\";s:7:\"default\";s:6:\"gutter\";i:1;s:7:\"toolbar\";i:1;s:9:\"smarttabs\";i:1;s:9:\"wraplines\";i:1;s:9:\"classname\";s:0:\"\";s:9:\"firstline\";s:1:\"1\";s:14:\"padlinenumbers\";s:5:\"false\";s:7:\"tabsize\";s:1:\"4\";s:5:\"title\";s:0:\"\";s:14:\"loadallbrushes\";i:0;s:9:\"autolinks\";i:0;s:8:\"collapse\";i:0;s:5:\"light\";i:0;}','yes'),(192,'_bbp_private_forums','a:0:{}','yes'),(193,'_bbp_hidden_forums','a:0:{}','yes'),(194,'_bbp_db_version','250','yes'),(202,'_bbp_edit_lock','5','yes'),(203,'_bbp_throttle_time','10','yes'),(204,'_bbp_allow_anonymous','0','yes'),(205,'_bbp_allow_global_access','1','yes'),(206,'_bbp_default_role','bbp_participant','yes'),(207,'_bbp_allow_revisions','1','yes'),(208,'_bbp_enable_favorites','1','yes'),(209,'_bbp_enable_subscriptions','1','yes'),(210,'_bbp_allow_topic_tags','1','yes'),(211,'_bbp_allow_search','1','yes'),(212,'_bbp_use_wp_editor','1','yes'),(213,'_bbp_use_autoembed','1','yes'),(214,'_bbp_thread_replies_depth','2','yes'),(215,'_bbp_allow_threaded_replies','0','yes'),(216,'_bbp_topics_per_page','15','yes'),(217,'_bbp_replies_per_page','15','yes'),(218,'_bbp_topics_per_rss_page','25','yes'),(219,'_bbp_replies_per_rss_page','25','yes'),(220,'_bbp_root_slug','support','yes'),(221,'_bbp_include_root','1','yes'),(222,'_bbp_show_on_root','forums','yes'),(223,'_bbp_forum_slug','forum','yes'),(224,'_bbp_topic_slug','topic','yes'),(225,'_bbp_topic_tag_slug','topic-tag','yes'),(226,'_bbp_view_slug','view','yes'),(227,'_bbp_reply_slug','reply','yes'),(228,'_bbp_search_slug','search','yes'),(229,'_bbp_user_slug','users','yes'),(230,'_bbp_topic_archive_slug','topics','yes'),(231,'_bbp_reply_archive_slug','replies','yes'),(232,'_bbp_user_favs_slug','favorites','yes'),(233,'_bbp_user_subs_slug','subscriptions','yes'),(234,'_bbp_enable_group_forums','1','yes'),(235,'_bbp_group_forums_root_id','0','yes'),(236,'_bbp_enable_akismet','1','yes'),(267,'_transient_timeout_bb_base_homepage_topics','1431048766','no'),(268,'_transient_bb_base_homepage_topics','\n<ul id=\"bbp-forum-0\" class=\"bbp-topics\">\n	<li class=\"bbp-header\">\n		<ul class=\"forum-titles\">\n			<li class=\"bbp-topic-title\">Topic</li>\n			<li class=\"bbp-topic-voice-count\">Voices</li>\n			<li class=\"bbp-topic-reply-count\">Replies</li>\n			<li class=\"bbp-topic-freshness\">Freshness</li>\n		</ul>\n	</li>\n\n	<li class=\"bbp-body\">\n\n		\n			<ul id=\"bbp-topic-20\" class=\"odd bbp-parent-forum-13 user-id-1 post-20 topic type-topic status-publish hentry\">\n\n	<li class=\"bbp-topic-title\">\n\n		\n		\n		<a class=\"bbp-topic-permalink\" href=\"http://buddypressorg.test/support/topic/hello-world/\" title=\"Hello World\">Hello World</a>\n\n		\n		\n		\n		<p class=\"bbp-topic-meta\">\n\n			\n			<span class=\"bbp-topic-started-by\">Started by: <a href=\"http://buddypressorg.test/members/admin/\" title=\"View admin&#039;s profile\" class=\"bbp-author-avatar\" rel=\"nofollow\"><img src=\"//www.gravatar.com/avatar/b48def645758b95537d4424c84d1a9ff?d=mm&amp;s=14&amp;r=G\" class=\"avatar user-1-avatar avatar-14 photo\" width=\"14\" height=\"14\" alt=\"Profile photo of admin\" /></a>&nbsp;<a href=\"http://buddypressorg.test/members/admin/\" title=\"View admin&#039;s profile\" class=\"bbp-author-name\" rel=\"nofollow\">admin</a></span>\n\n			\n			\n				\n				<span class=\"bbp-topic-started-in\">in: <a href=\"http://buddypressorg.test/support/forum/installing-buddypress/\">Installing BuddyPress</a></span>\n\n				\n			\n		</p>\n\n		\n		\n	</li>\n\n	<li class=\"bbp-topic-voice-count\">1</li>\n\n	<li class=\"bbp-topic-reply-count\">0</li>\n\n	<li class=\"bbp-topic-freshness\">\n\n		\n		<a href=\"http://buddypressorg.test/support/topic/hello-world/\" title=\"Hello World\">1 month, 1 week ago</a>\n		\n		<p class=\"bbp-topic-meta\">\n\n			\n			<span class=\"bbp-topic-freshness-author\"><a href=\"http://buddypressorg.test/members/admin/\" title=\"View admin&#039;s profile\" class=\"bbp-author-avatar\" rel=\"nofollow\"><img src=\"//www.gravatar.com/avatar/b48def645758b95537d4424c84d1a9ff?d=mm&amp;s=14&amp;r=G\" class=\"avatar user-1-avatar avatar-14 photo\" width=\"14\" height=\"14\" alt=\"Profile photo of admin\" /></a>&nbsp;<a href=\"http://buddypressorg.test/members/admin/\" title=\"View admin&#039;s profile\" class=\"bbp-author-name\" rel=\"nofollow\">admin</a></span>\n\n			\n		</p>\n	</li>\n\n</ul><!-- #bbp-topic-20 -->\n\n		\n	</li>\n\n	<li class=\"bbp-footer\">\n		<div class=\"tr\">\n			<p>\n				<span class=\"td colspan4\">&nbsp;</span>\n			</p>\n		</div><!-- .tr -->\n	</li>\n</ul><!-- #bbp-forum-0 -->\n\n','no'),(269,'_transient_timeout_bb_base_support_topics','1431048800','no'),(270,'_transient_bb_base_support_topics','\n	<div class=\"bbp-search-form\">\n\n		\n<form role=\"search\" method=\"get\" id=\"bbp-search-form\" action=\"http://buddypressorg.test/support/search/\">\n	<div>\n		<label class=\"screen-reader-text hidden\" for=\"bbp_search\">Search for:</label>\n		<input type=\"hidden\" name=\"action\" value=\"bbp-search-request\" />\n		<input type=\"text\" value=\"\" name=\"bbp_search\" id=\"bbp_search\" />\n		<input class=\"button\" type=\"submit\" id=\"bbp_search_submit\" value=\"Search\" />\n	</div>\n</form>\n\n	</div>\n\n\n<div id=\"bbpress-forums\">\n\n	\n	\n	\n		\n<ul id=\"bbp-forum-0\" class=\"bbp-topics\">\n	<li class=\"bbp-header\">\n		<ul class=\"forum-titles\">\n			<li class=\"bbp-topic-title\">Topic</li>\n			<li class=\"bbp-topic-voice-count\">Voices</li>\n			<li class=\"bbp-topic-reply-count\">Replies</li>\n			<li class=\"bbp-topic-freshness\">Freshness</li>\n		</ul>\n	</li>\n\n	<li class=\"bbp-body\">\n\n		\n			<ul id=\"bbp-topic-20\" class=\"odd bbp-parent-forum-13 user-id-1 post-20 topic type-topic status-publish hentry\">\n\n	<li class=\"bbp-topic-title\">\n\n		\n		\n		<a class=\"bbp-topic-permalink\" href=\"http://buddypressorg.test/support/topic/hello-world/\" title=\"Hello World\">Hello World</a>\n\n		\n		\n		\n		<p class=\"bbp-topic-meta\">\n\n			\n			<span class=\"bbp-topic-started-by\">Started by: <a href=\"http://buddypressorg.test/members/admin/\" title=\"View admin&#039;s profile\" class=\"bbp-author-avatar\" rel=\"nofollow\"><img src=\"//www.gravatar.com/avatar/b48def645758b95537d4424c84d1a9ff?d=mm&amp;s=14&amp;r=G\" class=\"avatar user-1-avatar avatar-14 photo\" width=\"14\" height=\"14\" alt=\"Profile photo of admin\" /></a>&nbsp;<a href=\"http://buddypressorg.test/members/admin/\" title=\"View admin&#039;s profile\" class=\"bbp-author-name\" rel=\"nofollow\">admin</a></span>\n\n			\n			\n				\n				<span class=\"bbp-topic-started-in\">in: <a href=\"http://buddypressorg.test/support/forum/installing-buddypress/\">Installing BuddyPress</a></span>\n\n				\n			\n		</p>\n\n		\n		\n	</li>\n\n	<li class=\"bbp-topic-voice-count\">1</li>\n\n	<li class=\"bbp-topic-reply-count\">0</li>\n\n	<li class=\"bbp-topic-freshness\">\n\n		\n		<a href=\"http://buddypressorg.test/support/topic/hello-world/\" title=\"Hello World\">1 month, 1 week ago</a>\n		\n		<p class=\"bbp-topic-meta\">\n\n			\n			<span class=\"bbp-topic-freshness-author\"><a href=\"http://buddypressorg.test/members/admin/\" title=\"View admin&#039;s profile\" class=\"bbp-author-avatar\" rel=\"nofollow\"><img src=\"//www.gravatar.com/avatar/b48def645758b95537d4424c84d1a9ff?d=mm&amp;s=14&amp;r=G\" class=\"avatar user-1-avatar avatar-14 photo\" width=\"14\" height=\"14\" alt=\"Profile photo of admin\" /></a>&nbsp;<a href=\"http://buddypressorg.test/members/admin/\" title=\"View admin&#039;s profile\" class=\"bbp-author-name\" rel=\"nofollow\">admin</a></span>\n\n			\n		</p>\n	</li>\n\n</ul><!-- #bbp-topic-20 -->\n\n		\n	</li>\n\n	<li class=\"bbp-footer\">\n		<div class=\"tr\">\n			<p>\n				<span class=\"td colspan4\">&nbsp;</span>\n			</p>\n		</div><!-- .tr -->\n	</li>\n</ul><!-- #bbp-forum-0 -->\n\n\n		\n<div class=\"bbp-pagination\">\n	<div class=\"bbp-pagination-count\">Viewing topic 1 (of 1 total)</div>\n	<div class=\"bbp-pagination-links\"></div>\n</div>\n\n\n	\n	\n</div>\n','no'),(271,'db_upgraded','','yes'),(272,'rewrite_rules','a:151:{s:10:\"support/?$\";s:25:\"index.php?post_type=forum\";s:40:\"support/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=forum&feed=$matches[1]\";s:35:\"support/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=forum&feed=$matches[1]\";s:27:\"support/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=forum&paged=$matches[1]\";s:9:\"topics/?$\";s:25:\"index.php?post_type=topic\";s:39:\"topics/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=topic&feed=$matches[1]\";s:34:\"topics/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=topic&feed=$matches[1]\";s:26:\"topics/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=topic&paged=$matches[1]\";s:29:\"support/forum/([^/]+)/edit/?$\";s:34:\"index.php?forum=$matches[1]&edit=1\";s:29:\"support/topic/([^/]+)/edit/?$\";s:34:\"index.php?topic=$matches[1]&edit=1\";s:29:\"support/reply/([^/]+)/edit/?$\";s:34:\"index.php?reply=$matches[1]&edit=1\";s:33:\"support/topic-tag/([^/]+)/edit/?$\";s:38:\"index.php?topic-tag=$matches[1]&edit=1\";s:49:\"support/users/([^/]+)/topics/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_tops=1&paged=$matches[2]\";s:50:\"support/users/([^/]+)/replies/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_reps=1&paged=$matches[2]\";s:52:\"support/users/([^/]+)/favorites/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_favs=1&paged=$matches[2]\";s:56:\"support/users/([^/]+)/subscriptions/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_subs=1&paged=$matches[2]\";s:31:\"support/users/([^/]+)/topics/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_tops=1\";s:32:\"support/users/([^/]+)/replies/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_reps=1\";s:34:\"support/users/([^/]+)/favorites/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_favs=1\";s:38:\"support/users/([^/]+)/subscriptions/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_subs=1\";s:29:\"support/users/([^/]+)/edit/?$\";s:37:\"index.php?bbp_user=$matches[1]&edit=1\";s:24:\"support/users/([^/]+)/?$\";s:30:\"index.php?bbp_user=$matches[1]\";s:41:\"support/view/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?bbp_view=$matches[1]&paged=$matches[2]\";s:28:\"support/view/([^/]+)/feed/?$\";s:47:\"index.php?bbp_view=$matches[1]&feed=$matches[2]\";s:23:\"support/view/([^/]+)/?$\";s:30:\"index.php?bbp_view=$matches[1]\";s:35:\"support/search/page/?([0-9]{1,})/?$\";s:27:\"index.php?paged=$matches[1]\";s:17:\"support/search/?$\";s:20:\"index.php?bbp_search\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:39:\"support/forum/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:49:\"support/forum/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:69:\"support/forum/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"support/forum/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"support/forum/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:32:\"support/forum/(.+?)/trackback/?$\";s:32:\"index.php?forum=$matches[1]&tb=1\";s:52:\"support/forum/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?forum=$matches[1]&feed=$matches[2]\";s:47:\"support/forum/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?forum=$matches[1]&feed=$matches[2]\";s:40:\"support/forum/(.+?)/page/?([0-9]{1,})/?$\";s:45:\"index.php?forum=$matches[1]&paged=$matches[2]\";s:47:\"support/forum/(.+?)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?forum=$matches[1]&cpage=$matches[2]\";s:32:\"support/forum/(.+?)(/[0-9]+)?/?$\";s:44:\"index.php?forum=$matches[1]&page=$matches[2]\";s:41:\"support/topic/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:51:\"support/topic/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:71:\"support/topic/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:66:\"support/topic/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:66:\"support/topic/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:34:\"support/topic/([^/]+)/trackback/?$\";s:32:\"index.php?topic=$matches[1]&tb=1\";s:54:\"support/topic/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?topic=$matches[1]&feed=$matches[2]\";s:49:\"support/topic/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?topic=$matches[1]&feed=$matches[2]\";s:42:\"support/topic/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?topic=$matches[1]&paged=$matches[2]\";s:49:\"support/topic/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?topic=$matches[1]&cpage=$matches[2]\";s:34:\"support/topic/([^/]+)(/[0-9]+)?/?$\";s:44:\"index.php?topic=$matches[1]&page=$matches[2]\";s:30:\"support/topic/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:40:\"support/topic/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:60:\"support/topic/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"support/topic/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"support/topic/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"support/reply/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:51:\"support/reply/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:71:\"support/reply/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:66:\"support/reply/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:66:\"support/reply/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:34:\"support/reply/([^/]+)/trackback/?$\";s:32:\"index.php?reply=$matches[1]&tb=1\";s:42:\"support/reply/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?reply=$matches[1]&paged=$matches[2]\";s:49:\"support/reply/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?reply=$matches[1]&cpage=$matches[2]\";s:34:\"support/reply/([^/]+)(/[0-9]+)?/?$\";s:44:\"index.php?reply=$matches[1]&page=$matches[2]\";s:30:\"support/reply/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:40:\"support/reply/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:60:\"support/reply/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"support/reply/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"support/reply/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:58:\"support/topic-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?topic-tag=$matches[1]&feed=$matches[2]\";s:53:\"support/topic-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?topic-tag=$matches[1]&feed=$matches[2]\";s:46:\"support/topic-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?topic-tag=$matches[1]&paged=$matches[2]\";s:28:\"support/topic-tag/([^/]+)/?$\";s:31:\"index.php?topic-tag=$matches[1]\";s:43:\"support/search/([^/]+)/page/?([0-9]{1,})/?$\";s:50:\"index.php?bbp_search=$matches[1]&paged=$matches[2]\";s:25:\"support/search/([^/]+)/?$\";s:32:\"index.php?bbp_search=$matches[1]\";s:55:\"bp_member_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?bp_member_type=$matches[1]&feed=$matches[2]\";s:50:\"bp_member_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?bp_member_type=$matches[1]&feed=$matches[2]\";s:43:\"bp_member_type/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?bp_member_type=$matches[1]&paged=$matches[2]\";s:25:\"bp_member_type/([^/]+)/?$\";s:36:\"index.php?bp_member_type=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:16:\".*wp-signup.php$\";s:21:\"index.php?signup=true\";s:18:\".*wp-activate.php$\";s:23:\"index.php?activate=true\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=8&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:44:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:69:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&tb=1\";s:64:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&feed=$matches[4]\";s:59:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&feed=$matches[4]\";s:52:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&paged=$matches[4]\";s:59:\"([0-9]{4})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&cpage=$matches[4]\";s:44:\"([0-9]{4})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&name=$matches[3]&page=$matches[4]\";s:36:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"[0-9]{4}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(273,'_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca','1431088413','no'),(274,'_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca','1431088413','no'),(275,'_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca','1431045213','no'),(276,'_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9','1431088413','no'),(277,'_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9','1431088413','no'),(278,'_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9','1431045213','no'),(279,'_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51','1431088414','no'),(280,'_transient_dash_4077549d03da2e451c8b5f002294ff51','<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2015/05/wordpress-4-2-2/\'>WordPress 4.2.2 Security and Maintenance Release</a> <span class=\"rss-date\">May 7, 2015</span><div class=\"rssSummary\">WordPress 4.2.2 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. Version 4.2.2 addresses two security issues: The Genericons icon font package, which is used in a number of popular themes and plugins, contained an HTML file vulnerable to a cross-site [&hellip;]</div></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://poststatus.com/how-to-create-accessible-wordpress-themes/\'>Post Status: How to create better, more accessible WordPress themes</a></li><li><a class=\'rsswidget\' href=\'http://wptavern.com/camppress-a-2-3-day-social-experience-for-geeks-and-creatives\'>WPTavern: CampPress: A 2-3 Day Social Experience for Geeks and Creatives</a></li><li><a class=\'rsswidget\' href=\'http://wptavern.com/tgm-plugin-activation-library-publishes-roadmap-for-version-3-0\'>WPTavern: TGM Plugin Activation Library Publishes Roadmap for Version 3.0</a></li></ul></div>','no'),(281,'_transient_timeout_plugin_slugs','1431131731','no'),(282,'_transient_plugin_slugs','a:8:{i:0;s:19:\"bbpress/bbpress.php\";i:1;s:33:\"bbpress-no-admin/bbp-no-admin.php\";i:2;s:31:\"bbpress-org/bbpress-dot-org.php\";i:3;s:24:\"buddypress/bp-loader.php\";i:4;s:37:\"buddypress-org/buddypress-dot-org.php\";i:5;s:19:\"camptix/camptix.php\";i:6;s:41:\"email-post-changes/email-post-changes.php\";i:7;s:39:\"syntaxhighlighter/syntaxhighlighter.php\";}','no'),(283,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(284,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(285,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(286,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(287,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(288,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(289,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(290,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(291,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(292,'widget_bbp_login_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(293,'widget_bbp_views_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(294,'widget_bbp_search_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(295,'widget_bbp_forums_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(296,'widget_bbp_topics_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(297,'widget_bbp_replies_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(298,'widget_bbp_stats_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(299,'widget_bp_blogs_recent_posts_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(300,'_transient_doing_cron','1513299298.8809189796447753906250','yes');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (2,6,'_edit_lock','1427314730:1'),(3,6,'_edit_last','1'),(4,8,'_edit_lock','1427315145:1'),(5,8,'_edit_last','1'),(6,10,'_edit_lock','1427315170:1'),(7,10,'_edit_last','1'),(10,8,'_wp_page_template','page-homepage.php'),(11,10,'_wp_page_template','default'),(12,13,'_edit_lock','1427315370:1'),(13,13,'_edit_last','1'),(14,13,'_bbp_last_active_time','2015-03-26 23:06:44'),(15,13,'_bbp_forum_subforum_count','0'),(16,13,'_bbp_reply_count','0'),(17,13,'_bbp_total_reply_count','0'),(18,13,'_bbp_topic_count','1'),(19,13,'_bbp_total_topic_count','1'),(20,13,'_bbp_topic_count_hidden','0'),(21,15,'_edit_last','1'),(22,15,'_wp_page_template','default'),(23,15,'_edit_lock','1427315436:1'),(26,18,'_edit_lock','1427315528:1'),(27,18,'_edit_last','1'),(28,18,'_wp_page_template','default'),(29,20,'_bbp_akismet_error','1427411204'),(30,20,'_bbp_akismet_history','a:4:{s:4:\"time\";d:1427411204.4985110759735107421875;s:7:\"message\";s:100:\"Akismet was unable to check this post (response: No response), will automatically retry again later.\";s:5:\"event\";s:11:\"check-error\";s:4:\"user\";s:5:\"admin\";}'),(31,20,'_bbp_akismet_as_submitted','a:62:{s:14:\"comment_author\";s:5:\"admin\";s:20:\"comment_author_email\";s:15:\"foo@example.com\";s:18:\"comment_author_url\";s:0:\"\";s:15:\"comment_content\";s:11:\"Testing 123\";s:15:\"comment_post_ID\";i:13;s:12:\"comment_type\";s:5:\"topic\";s:9:\"permalink\";s:62:\"http://buddypressorg.test/support/forum/installing-buddypress/\";s:8:\"referrer\";s:62:\"http://buddypressorg.test/support/forum/installing-buddypress/\";s:10:\"user_agent\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.104 Safari/537.36\";s:7:\"user_ID\";i:1;s:7:\"user_ip\";s:9:\"127.0.0.1\";s:9:\"user_role\";s:39:\"administrator,bbp_keymaster,super_admin\";s:4:\"blog\";s:25:\"http://buddypressorg.test\";s:12:\"blog_charset\";s:5:\"UTF-8\";s:9:\"blog_lang\";s:5:\"en_US\";s:20:\"POST_bbp_topic_title\";s:11:\"Hello World\";s:22:\"POST_bbp_topic_content\";s:11:\"Testing 123\";s:19:\"POST_bbp_topic_tags\";s:0:\"\";s:20:\"POST_bbp_stick_topic\";s:7:\"unstick\";s:21:\"POST_bbp_topic_submit\";s:0:\"\";s:17:\"POST_bbp_forum_id\";s:2:\"13\";s:11:\"POST_action\";s:13:\"bbp-new-topic\";s:31:\"POST__bbp_unfiltered_html_topic\";s:10:\"06088eb2ee\";s:13:\"POST__wpnonce\";s:10:\"ccbb3c85e8\";s:21:\"POST__wp_http_referer\";s:37:\"/support/forum/installing-buddypress/\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"REQUEST_URI\";s:37:\"/support/forum/installing-buddypress/\";s:15:\"REDIRECT_STATUS\";s:3:\"200\";s:9:\"HTTP_HOST\";s:18:\"buddypressorg.test\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:14:\"CONTENT_LENGTH\";s:3:\"273\";s:18:\"HTTP_CACHE_CONTROL\";s:9:\"max-age=0\";s:11:\"HTTP_ACCEPT\";s:74:\"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\";s:11:\"HTTP_ORIGIN\";s:25:\"http://buddypressorg.test\";s:15:\"HTTP_USER_AGENT\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.104 Safari/537.36\";s:12:\"CONTENT_TYPE\";s:33:\"application/x-www-form-urlencoded\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:62:\"http://buddypressorg.test/support/forum/installing-buddypress/\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:23:\"en-US,en;q=0.8,es;q=0.6\";s:11:\"HTTP_COOKIE\";s:0:\"\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:11:\"SERVER_NAME\";s:18:\"buddypressorg.test\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:27:\"/Users/paulgibbs/Sites/mamp\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:37:\"/Users/paulgibbs/Sites/mamp/index.php\";s:11:\"REMOTE_PORT\";s:5:\"64724\";s:12:\"REDIRECT_URL\";s:37:\"/support/forum/installing-buddypress/\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:4:\"POST\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:8:\"PHP_SELF\";s:10:\"/index.php\";s:18:\"REQUEST_TIME_FLOAT\";s:13:\"1427411203.69\";s:12:\"REQUEST_TIME\";s:10:\"1427411203\";s:4:\"argv\";s:0:\"\";s:4:\"argc\";s:1:\"0\";}'),(32,20,'_bbp_forum_id','13'),(33,20,'_bbp_topic_id','20'),(34,20,'_bbp_author_ip','127.0.0.1'),(35,20,'_bbp_last_reply_id','0'),(36,20,'_bbp_last_active_id','20'),(37,20,'_bbp_last_active_time','2015-03-26 23:06:44'),(38,20,'_bbp_reply_count','0'),(39,20,'_bbp_reply_count_hidden','0'),(40,20,'_bbp_voice_count','1'),(41,13,'_bbp_last_topic_id','20'),(42,13,'_bbp_last_reply_id','20'),(43,13,'_bbp_last_active_id','20');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2015-03-25 20:03:58','2015-03-25 20:03:58','Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!','Hello world!','','publish','open','open','','hello-world','','','2015-03-25 20:03:58','2015-03-25 20:03:58','',0,'http://buddypressorg.test/?p=1',0,'post','',1),(5,1,'2015-03-25 20:16:39','2015-03-25 20:16:39','','Members','','publish','closed','closed','','members','','','2015-03-25 20:16:39','2015-03-25 20:16:39','',0,'http://buddypressorg.test/members/',0,'page','',0),(6,1,'2015-03-25 20:21:13','2015-03-25 20:21:13','','Sites','','publish','open','open','','sites','','','2015-03-25 20:21:13','2015-03-25 20:21:13','',0,'http://buddypressorg.test/?page_id=6',0,'page','',0),(7,1,'2015-03-25 20:21:13','2015-03-25 20:21:13','','Sites','','inherit','open','open','','6-revision-v1','','','2015-03-25 20:21:13','2015-03-25 20:21:13','',6,'http://buddypressorg.test/2015/03/25/6-revision-v1/',0,'revision','',0),(8,1,'2015-03-25 20:26:41','2015-03-25 20:26:41','','BuddyPress','','publish','open','open','','buddypress','','','2015-03-25 20:28:06','2015-03-25 20:28:06','',0,'http://buddypressorg.test/?page_id=8',0,'page','',0),(9,1,'2015-03-25 20:26:41','2015-03-25 20:26:41','','BuddyPress','','inherit','open','open','','8-revision-v1','','','2015-03-25 20:26:41','2015-03-25 20:26:41','',8,'http://buddypressorg.test/2015/03/25/8-revision-v1/',0,'revision','',0),(10,1,'2015-03-25 20:27:03','2015-03-25 20:27:03','','Blog','','publish','open','open','','blog','','','2015-03-25 20:28:30','2015-03-25 20:28:30','',0,'http://buddypressorg.test/?page_id=10',0,'page','',0),(11,1,'2015-03-25 20:27:03','2015-03-25 20:27:03','','Blog','','inherit','open','open','','10-revision-v1','','','2015-03-25 20:27:03','2015-03-25 20:27:03','',10,'http://buddypressorg.test/2015/03/25/10-revision-v1/',0,'revision','',0),(13,1,'2015-03-25 20:31:50','2015-03-25 20:31:50','Problems with getting it running.','Installing BuddyPress','','publish','closed','open','','installing-buddypress','','','2015-03-25 20:31:50','2015-03-25 20:31:50','',0,'http://buddypressorg.test/?post_type=forum&#038;p=13',0,'forum','',0),(14,1,'2015-03-25 20:31:50','2015-03-25 20:31:50','Problems with getting it running.','Installing BuddyPress','','inherit','open','open','','13-revision-v1','','','2015-03-25 20:31:50','2015-03-25 20:31:50','',13,'http://buddypressorg.test/2015/03/13-revision-v1/',0,'revision','',0),(15,1,'2015-03-25 20:32:46','2015-03-25 20:32:46','','Updates','','publish','open','open','','updates','','','2015-03-25 20:32:46','2015-03-25 20:32:46','',0,'http://buddypressorg.test/?page_id=15',0,'page','',0),(16,1,'2015-03-25 20:32:46','2015-03-25 20:32:46','','Updates','','inherit','open','open','','15-revision-v1','','','2015-03-25 20:32:46','2015-03-25 20:32:46','',15,'http://buddypressorg.test/2015/03/15-revision-v1/',0,'revision','',0),(18,1,'2015-03-25 20:34:00','2015-03-25 20:34:00','If you would like to get in contact with the developers of BuddyPress, you have a number of options.\r\n<div style=\"margin: 0;padding: 0;width: 680px\">\r\n<div style=\"float: left;margin: 0 30px 0 0;padding: 0;width: 315px\">\r\n<h3>Support</h3>\r\n<strong>We can\'t do email support</strong>, because it’s not a good way to help out a lot of people. If you are having any trouble with BuddyPress, the best place to go is the <a title=\"BuddyPress support forums\" href=\"/support/\">support forums</a>, where a number of people might be able to help you with your problem and others can learn from your troubles, or the <a title=\"BuddyPress documentation\" href=\"http://codex.buddypress.org/\">Documentation Codex</a>.\r\n<h3>Helping Out</h3>\r\nJust want to help out? Great! There are many ways to <a title=\"Get involved with BuddyPress\" href=\"/about/get-involved/\">get involved</a>.\r\n\r\n</div>\r\n<div style=\"float: left;margin: 0;padding: 0;width: 315px\">\r\n<h3>Security</h3>\r\nIf you think you\'ve found a security problem in WordPress or BuddyPress, please see the <a href=\"http://codex.wordpress.org/Security_FAQ\">WordPress Security FAQ</a> for information on reporting the problem. (Note: Any non-security messages are ignored and deleted. This includes requests to take down sites or delete posts for legal reasons. WordPress does not have the power to take down or in anyway alter the sites that choose to use it. Please contact the site’s hosting provider.)\r\n\r\n</div>\r\n</div>\r\n\r\n<div style=\"clear: both\"></div>','Contact','','publish','open','open','','contact','','','2015-03-25 20:34:00','2015-03-25 20:34:00','',0,'http://buddypressorg.test/?page_id=18',0,'page','',0),(19,1,'2015-03-25 20:34:00','2015-03-25 20:34:00','If you would like to get in contact with the developers of BuddyPress, you have a number of options.\r\n<div style=\"margin: 0;padding: 0;width: 680px\">\r\n<div style=\"float: left;margin: 0 30px 0 0;padding: 0;width: 315px\">\r\n<h3>Support</h3>\r\n<strong>We can\'t do email support</strong>, because it’s not a good way to help out a lot of people. If you are having any trouble with BuddyPress, the best place to go is the <a title=\"BuddyPress support forums\" href=\"/support/\">support forums</a>, where a number of people might be able to help you with your problem and others can learn from your troubles, or the <a title=\"BuddyPress documentation\" href=\"http://codex.buddypress.org/\">Documentation Codex</a>.\r\n<h3>Helping Out</h3>\r\nJust want to help out? Great! There are many ways to <a title=\"Get involved with BuddyPress\" href=\"/about/get-involved/\">get involved</a>.\r\n\r\n</div>\r\n<div style=\"float: left;margin: 0;padding: 0;width: 315px\">\r\n<h3>Security</h3>\r\nIf you think you\'ve found a security problem in WordPress or BuddyPress, please see the <a href=\"http://codex.wordpress.org/Security_FAQ\">WordPress Security FAQ</a> for information on reporting the problem. (Note: Any non-security messages are ignored and deleted. This includes requests to take down sites or delete posts for legal reasons. WordPress does not have the power to take down or in anyway alter the sites that choose to use it. Please contact the site’s hosting provider.)\r\n\r\n</div>\r\n</div>\r\n\r\n<div style=\"clear: both\"></div>','Contact','','inherit','open','open','','18-revision-v1','','','2015-03-25 20:34:00','2015-03-25 20:34:00','',18,'http://buddypressorg.test/2015/03/18-revision-v1/',0,'revision','',0),(20,1,'2015-03-26 23:06:44','2015-03-26 23:06:44','Testing 123','Hello World','','publish','closed','open','','hello-world','','','2015-03-26 23:06:44','2015-03-26 23:06:44','',13,'http://buddypressorg.test/support/topic/hello-world/',0,'topic','',0),(21,1,'2015-05-08 00:33:30','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2015-05-08 00:33:30','0000-00-00 00:00:00','',0,'http://buddypressorg.test/?p=21',0,'post','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_registration_log`
--

DROP TABLE IF EXISTS `wp_registration_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_registration_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `IP` varchar(30) NOT NULL DEFAULT '',
  `blog_id` bigint(20) NOT NULL DEFAULT '0',
  `date_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IP` (`IP`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_registration_log`
--

LOCK TABLES `wp_registration_log` WRITE;
/*!40000 ALTER TABLE `wp_registration_log` DISABLE KEYS */;
INSERT INTO `wp_registration_log` VALUES (1,'foo@example.com','127.0.0.1',2,'2015-03-25 20:35:07'),(2,'foo@example.com','127.0.0.1',3,'2015-03-25 20:40:55'),(3,'foo@example.com','127.0.0.1',4,'2015-03-25 20:47:25');
/*!40000 ALTER TABLE `wp_registration_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_signups`
--

DROP TABLE IF EXISTS `wp_signups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_signups` (
  `signup_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) NOT NULL DEFAULT '',
  `path` varchar(100) NOT NULL DEFAULT '',
  `title` longtext NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) NOT NULL DEFAULT '',
  `meta` longtext,
  PRIMARY KEY (`signup_id`),
  KEY `activation_key` (`activation_key`),
  KEY `user_email` (`user_email`),
  KEY `user_login_email` (`user_login`,`user_email`),
  KEY `domain_path` (`domain`(140),`path`(51))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_signups`
--

LOCK TABLES `wp_signups` WRITE;
/*!40000 ALTER TABLE `wp_signups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_signups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_site`
--

DROP TABLE IF EXISTS `wp_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) NOT NULL DEFAULT '',
  `path` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `domain` (`domain`(140),`path`(51))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_site`
--

LOCK TABLES `wp_site` WRITE;
/*!40000 ALTER TABLE `wp_site` DISABLE KEYS */;
INSERT INTO `wp_site` VALUES (1,'buddypressorg.test','/');
/*!40000 ALTER TABLE `wp_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_sitemeta`
--

DROP TABLE IF EXISTS `wp_sitemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_sitemeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `meta_key` (`meta_key`(191)),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_sitemeta`
--

LOCK TABLES `wp_sitemeta` WRITE;
/*!40000 ALTER TABLE `wp_sitemeta` DISABLE KEYS */;
INSERT INTO `wp_sitemeta` VALUES (1,1,'site_name','BuddyPress.org'),(2,1,'admin_email','foo@example.com'),(3,1,'admin_user_id','1'),(4,1,'registration','none'),(5,1,'upload_filetypes','jpg jpeg png gif mov avi mpg 3gp 3g2 midi mid pdf doc ppt odt pptx docx pps ppsx xls xlsx key mp3 ogg wma m4a wav mp4 m4v webm ogv wmv flv'),(6,1,'blog_upload_space','100'),(7,1,'fileupload_maxk','1500'),(8,1,'site_admins','a:1:{i:0;s:5:\"admin\";}'),(9,1,'allowedthemes','a:1:{s:13:\"twentyfifteen\";b:1;}'),(10,1,'illegal_names','a:20:{i:0;s:3:\"www\";i:1;s:3:\"web\";i:2;s:4:\"root\";i:3;s:5:\"admin\";i:4;s:4:\"main\";i:5;s:6:\"invite\";i:6;s:13:\"administrator\";i:7;s:6:\"groups\";i:8;s:7:\"members\";i:9;s:6:\"forums\";i:10;s:5:\"blogs\";i:11;s:8:\"activity\";i:12;s:7:\"profile\";i:13;s:7:\"friends\";i:14;s:6:\"search\";i:15;s:8:\"settings\";i:16;s:13:\"notifications\";i:17;s:8:\"register\";i:18;s:8:\"activate\";i:19;s:5:\"files\";}'),(11,1,'wpmu_upgrade_site','31535'),(12,1,'welcome_email','Howdy USERNAME,\r\n\r\nYour new SITE_NAME site has been successfully set up at:\r\nBLOG_URL\r\n\r\nYou can log in to the administrator account with the following information:\r\n\r\nUsername: USERNAME\r\nPassword: PASSWORD\r\nLog in here: BLOG_URLwp-login.php\r\n\r\nWe hope you enjoy your new site. Thanks!\r\n\r\n--The Team @ SITE_NAME'),(13,1,'first_post','Welcome to <a href=\"SITE_URL\">SITE_NAME</a>. This is your first post. Edit or delete it, then start blogging!'),(14,1,'siteurl','http://buddypressorg.test/'),(15,1,'add_new_users','0'),(16,1,'upload_space_check_disabled','1'),(17,1,'subdomain_install','1'),(18,1,'global_terms_enabled','0'),(19,1,'ms_files_rewriting','0'),(20,1,'initial_db_version','31532'),(21,1,'active_sitewide_plugins','a:3:{s:24:\"buddypress/bp-loader.php\";i:1427314598;s:39:\"syntaxhighlighter/syntaxhighlighter.php\";i:1427314614;s:37:\"buddypress-org/buddypress-dot-org.php\";i:1427315076;}'),(22,1,'WPLANG',''),(23,1,'auth_key','|<[_M$Rh:r$d<j/PxTgaxHW@D7Sous&VbR51$VGSP,9Xt~C`!4*+g3sMEE<sft!/'),(24,1,'auth_salt','AH:&o{^uCz@3iq,a=$m)-i_<^a+<q|mQ0dZZ7yjgdA1q>b(Np@,}~2iIchmihr4#'),(25,1,'logged_in_key','AmBBgzWvTgqQAgaM]@GDKo,Yg*{,,H>VKK&+;E%bR!hI|^337;@/!evThouW)8sq'),(26,1,'logged_in_salt','XksL<w@p5+rh;%y6{os.YKC$zH(*?M@R*O*_g2Gb>lj|}J|Gpam<sX!5{lCJh+j0'),(27,1,'nonce_key','UTn@6`|#%05y$tDWx,; JTYC1nL?7mfpVG<f:mqxHzift@~vO`NU7m6lJ^>{:PI5'),(28,1,'nonce_salt','jjNh)J2;3qP9lz.`XrX46vNpK_7= _Vj1d>FU!SxsXT+TYj#Ho;!FA1{Et#XXyL;'),(33,1,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1431045167;s:7:\"checked\";a:8:{s:7:\"bb-base\";s:3:\"2.1\";s:11:\"bbpress-org\";s:3:\"2.1\";s:14:\"buddypress-org\";s:3:\"1.0\";s:17:\"codex-bbpress-org\";s:3:\"2.1\";s:20:\"codex-buddypress-org\";s:3:\"2.1\";s:13:\"twentyfifteen\";s:3:\"1.2\";s:14:\"twentyfourteen\";s:3:\"1.4\";s:14:\"twentythirteen\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}'),(36,1,'user_count','1'),(37,1,'blog_count','4'),(38,1,'can_compress_scripts','1'),(49,1,'registrationnotification','no'),(50,1,'welcome_user_email','Howdy USERNAME,\r\n\r\nYour new account is set up.\r\n\r\nYou can log in with the following information:\r\nUsername: USERNAME\r\nPassword: PASSWORD\r\nLOGINLINK\r\n\r\nThanks!\r\n\r\n--The Team @ SITE_NAME'),(51,1,'menu_items','a:0:{}'),(52,1,'first_page',''),(53,1,'first_comment',''),(54,1,'first_comment_url',''),(55,1,'first_comment_author',''),(56,1,'limited_email_domains',''),(57,1,'banned_email_domains',''),(65,1,'auto_core_update_notified','a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:15:\"foo@example.com\";s:7:\"version\";s:15:\"4.2-beta3-31908\";s:9:\"timestamp\";i:1427411106;}'),(71,1,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1431045331;s:7:\"checked\";a:8:{s:19:\"bbpress/bbpress.php\";s:9:\"2.6-alpha\";s:33:\"bbpress-no-admin/bbp-no-admin.php\";s:3:\"1.1\";s:31:\"bbpress-org/bbpress-dot-org.php\";s:5:\"1.0.5\";s:24:\"buddypress/bp-loader.php\";s:8:\"2.3-beta\";s:37:\"buddypress-org/buddypress-dot-org.php\";s:5:\"1.0.5\";s:19:\"camptix/camptix.php\";s:5:\"1.4.2\";s:41:\"email-post-changes/email-post-changes.php\";s:5:\"1.7.1\";s:39:\"syntaxhighlighter/syntaxhighlighter.php\";s:6:\"3.1.11\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:6:{s:19:\"bbpress/bbpress.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"11780\";s:4:\"slug\";s:7:\"bbpress\";s:6:\"plugin\";s:19:\"bbpress/bbpress.php\";s:11:\"new_version\";s:5:\"2.5.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/bbpress/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/bbpress.2.5.7.zip\";}s:33:\"bbpress-no-admin/bbp-no-admin.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"27230\";s:4:\"slug\";s:16:\"bbpress-no-admin\";s:6:\"plugin\";s:33:\"bbpress-no-admin/bbp-no-admin.php\";s:11:\"new_version\";s:3:\"1.1\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/bbpress-no-admin/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/bbpress-no-admin.zip\";}s:24:\"buddypress/bp-loader.php\";O:8:\"stdClass\":7:{s:2:\"id\";s:4:\"7756\";s:4:\"slug\";s:10:\"buddypress\";s:6:\"plugin\";s:24:\"buddypress/bp-loader.php\";s:11:\"new_version\";s:7:\"2.2.3.1\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/buddypress/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/buddypress.2.2.3.1.zip\";s:14:\"upgrade_notice\";s:59:\"See: https://codex.buddypress.org/releases/version-2-2-3-1/\";}s:19:\"camptix/camptix.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"33269\";s:4:\"slug\";s:7:\"camptix\";s:6:\"plugin\";s:19:\"camptix/camptix.php\";s:11:\"new_version\";s:5:\"1.4.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/camptix/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/camptix.1.4.2.zip\";}s:41:\"email-post-changes/email-post-changes.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"11832\";s:4:\"slug\";s:18:\"email-post-changes\";s:6:\"plugin\";s:41:\"email-post-changes/email-post-changes.php\";s:11:\"new_version\";s:5:\"1.7.1\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/email-post-changes/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/email-post-changes.1.7.1.zip\";}s:39:\"syntaxhighlighter/syntaxhighlighter.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:3:\"933\";s:4:\"slug\";s:17:\"syntaxhighlighter\";s:6:\"plugin\";s:39:\"syntaxhighlighter/syntaxhighlighter.php\";s:11:\"new_version\";s:6:\"3.1.11\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/syntaxhighlighter/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/syntaxhighlighter.zip\";}}}'),(73,1,'_site_transient_timeout_browser_b47de53522f728d7fedea8f0228c4276','1431650010'),(74,1,'_site_transient_browser_b47de53522f728d7fedea8f0228c4276','a:9:{s:8:\"platform\";s:9:\"Macintosh\";s:4:\"name\";s:7:\"Firefox\";s:7:\"version\";s:4:\"39.0\";s:10:\"update_url\";s:23:\"http://www.firefox.com/\";s:7:\"img_src\";s:50:\"http://s.wordpress.org/images/browsers/firefox.png\";s:11:\"img_src_ssl\";s:49:\"https://wordpress.org/images/browsers/firefox.png\";s:15:\"current_version\";s:2:\"16\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}'),(75,1,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.2.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.2.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.2.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.2.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.2.2\";s:7:\"version\";s:5:\"4.2.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.1\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1431045394;s:15:\"version_checked\";s:5:\"4.2.2\";s:12:\"translations\";a:0:{}}'),(76,1,'_site_transient_timeout_available_translations','1431056204'),(77,1,'_site_transient_available_translations','a:56:{s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 23:59:50\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-02 03:57:09\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:22:\"Продължение\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-25 18:55:51\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-07 03:35:18\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:09\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Forts&#230;t\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Fortfahren\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-02 22:25:58\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Fortfahren\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-02 07:47:28\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:09\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:09\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:09\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-24 16:03:38\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/es_MX.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-25 13:39:01\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/es_PE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-28 16:15:15\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/es_ES.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"es\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:3:\"4.0\";s:7:\"updated\";s:19:\"2014-09-04 19:47:01\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:09\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-24 12:47:01\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:09\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-29 17:08:38\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:3:\"4.0\";s:7:\"updated\";s:19:\"2014-09-05 17:37:43\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/translation/core/4.0/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:5:\"4.1.5\";s:7:\"updated\";s:19:\"2015-03-26 15:20:27\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.1.5/haz.zip\";s:3:\"iso\";a:1:{i:2;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-05 19:38:26\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"להמשיך\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-26 14:13:46\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-07 06:15:06\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Tovább\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-07 12:02:18\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-04 05:26:59\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-30 06:14:18\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"続ける\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 22:23:52\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:5:\"4.1.5\";s:7:\"updated\";s:19:\"2015-03-26 15:57:42\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.1.5/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ေဆာင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-04 08:01:04\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-06 07:49:08\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:09\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-07 14:58:13\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.2.2/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-07 10:58:41\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:5:\"4.1.5\";s:7:\"updated\";s:19:\"2015-03-29 22:19:48\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.1.5/ps.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ps\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"دوام\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-27 09:25:14\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-27 14:23:25\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-07 07:47:41\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"4.1.5\";s:7:\"updated\";s:19:\"2015-03-26 16:25:46\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.1.5/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Nadaljujte\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-05-05 22:47:02\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 16:55:54\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:09\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-29 07:03:07\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"4.1.5\";s:7:\"updated\";s:19:\"2015-03-26 16:45:38\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:9:\"Uyƣurqə\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.1.5/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-28 16:44:31\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.2.2/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-29 06:37:03\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"4.2.2\";s:7:\"updated\";s:19:\"2015-04-23 15:23:08\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.2.2/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}}'),(78,1,'_site_transient_timeout_theme_roots','1513301098'),(79,1,'_site_transient_theme_roots','a:8:{s:7:\"bb-base\";s:7:\"/themes\";s:11:\"bbpress-org\";s:7:\"/themes\";s:14:\"buddypress-org\";s:7:\"/themes\";s:17:\"codex-bbpress-org\";s:7:\"/themes\";s:20:\"codex-buddypress-org\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:94:\"/srv/www/wordpress-meta-environment/buddypressorg.test/public_html/wordpress/wp-content/themes\";s:15:\"twentyseventeen\";s:94:\"/srv/www/wordpress-meta-environment/buddypressorg.test/public_html/wordpress/wp-content/themes\";s:13:\"twentysixteen\";s:94:\"/srv/www/wordpress-meta-environment/buddypressorg.test/public_html/wordpress/wp-content/themes\";}');
/*!40000 ALTER TABLE `wp_sitemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','admin'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'wp_capabilities','a:2:{s:13:\"administrator\";b:1;s:13:\"bbp_keymaster\";b:1;}'),(11,1,'wp_user_level','10'),(12,1,'dismissed_wp_pointers','wp360_locks,wp390_widgets,wp410_dfw'),(13,1,'show_welcome_panel','0'),(14,1,'session_tokens','a:2:{s:64:\"bee04801946af5cd59094233c19818e9c7e8648ed32b0c2b1b63df0478106c4b\";a:4:{s:10:\"expiration\";i:1431218010;s:2:\"ip\";s:12:\"192.168.50.1\";s:2:\"ua\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0\";s:5:\"login\";i:1431045210;}s:64:\"dd44be6c8cba958d7e81175bd24970331566655be4c12deed8b60f7e117918be\";a:4:{s:10:\"expiration\";i:1431218297;s:2:\"ip\";s:12:\"192.168.50.1\";s:2:\"ua\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0\";s:5:\"login\";i:1431045497;}}'),(15,1,'wp_dashboard_quick_press_last_post_id','21'),(16,1,'source_domain','buddypressorg.test'),(17,1,'primary_blog','1'),(18,1,'wp_user-settings','editor=html'),(19,1,'wp_user-settings-time','1427315506'),(20,1,'last_activity','2015-05-08 00:46:50'),(21,1,'wp_15_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(22,1,'wp_15_user_level','10'),(23,1,'wp_15_dashboard_quick_press_last_post_id','14'),(24,1,'wp_15_user-settings','editor=html'),(25,1,'wp_15_user-settings-time','1427315801'),(26,1,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}'),(27,1,'metaboxhidden_nav-menus','a:6:{i:0;s:8:\"add-post\";i:1;s:12:\"add-post_tag\";i:2;s:11:\"add-version\";i:3;s:13:\"add-component\";i:4;s:8:\"add-type\";i:5;s:11:\"add-context\";}'),(28,1,'wp_21_capabilities','a:2:{s:13:\"administrator\";b:1;s:13:\"bbp_keymaster\";b:1;}'),(29,1,'wp_21_user_level','10'),(30,1,'wp_21_dashboard_quick_press_last_post_id','3'),(31,1,'wp_21_user-settings','editor=html'),(32,1,'wp_21_user-settings-time','1427316194'),(33,1,'wp_53_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(34,1,'wp_53_user_level','10'),(35,1,'wp_53_dashboard_quick_press_last_post_id','3'),(36,1,'wp_53_user-settings','editor=html'),(37,1,'wp_53_user-settings-time','1427318989'),(38,1,'nav_menu_recently_edited','2');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  `spam` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'admin','$P$ByaI6yAFliext5OTjUWG1/3YPZDcl8.','admin','foo@example.com','','2015-03-25 20:03:58','',0,'admin',0,0);
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-15  0:58:12
