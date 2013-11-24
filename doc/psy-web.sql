# Host: localhost  (Version: 5.6.14-log)
# Date: 2013-11-24 20:29:21
# Generator: MySQL-Front 5.3  (Build 4.69)

/*!40101 SET NAMES utf8 */;
CREATE DATABASE `psy-web` /*!40100 DEFAULT CHARACTER SET utf8 */;

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'John',NULL,NULL,NULL,NULL,NULL),(2,'Jack',NULL,NULL,NULL,NULL,NULL),(3,'Peter',NULL,'peter@peter.com',NULL,NULL,NULL),(5,'Peter',NULL,'peter@peter.com',NULL,NULL,NULL),(6,'Punny',NULL,'peter@peter.com',NULL,'2013-11-24 18:10:46','2013-11-24 18:11:37');

#
# Structure for table "post"
#

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `comment_count` int(11) DEFAULT '0',
  `status` int(2) DEFAULT '1',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "post"
#

INSERT INTO `post` VALUES (1,1,'2','资源应该有特殊标记如：<source:>source id</source>',0,1,'2013-11-24 19:41:53','2013-11-24 19:46:22');

#
# Structure for table "category"
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `order` int(3) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "category"
#


#
# Structure for table "post_category"
#

DROP TABLE IF EXISTS `post_category`;
CREATE TABLE `post_category` (
  `post_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "post_category"
#

#
# Structure for table "postmeta"
#

DROP TABLE IF EXISTS `postmeta`;
CREATE TABLE `postmeta` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `meta_post` (`post_id`),
  CONSTRAINT `meta_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "postmeta"
#


#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_IP` varchar(255) DEFAULT NULL,
  `content` text,
  `parent` int(11) DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `user` (`user_id`),
  KEY `post` (`post_id`),
  CONSTRAINT `post` FOREIGN KEY (`post_id`) REFERENCES `post` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "comment"
#

