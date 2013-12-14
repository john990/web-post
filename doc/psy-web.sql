/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : psy-web

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2013-12-14 16:20:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `order` int(3) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `content` text,
  `parent` int(11) DEFAULT '0',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `user` (`user_id`),
  KEY `post` (`post_id`),
  CONSTRAINT `post` FOREIGN KEY (`post_id`) REFERENCES `post` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for meta
-- ----------------------------
DROP TABLE IF EXISTS `meta`;
CREATE TABLE `meta` (
  `key` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `meta_key` (`key`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meta
-- ----------------------------
INSERT INTO `meta` VALUES ('1', '');
INSERT INTO `meta` VALUES ('2', 'http://personal-demo.u.qiniudn.com/');
INSERT INTO `meta` VALUES ('3', 'http://personal-demo.u.qiniudn.com/FqfsMLeewqw_7EIk6t1r2app3Gvx');
INSERT INTO `meta` VALUES ('4', 'http://personal-demo.u.qiniudn.com/Fvo0dUF8kAWNUAjm8Xjv3FWgudj3');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cover` int(11) DEFAULT NULL COMMENT '文章封面/预览',
  `intro` varchar(255) DEFAULT NULL COMMENT '简单的介绍，一般是content的钱40个字符',
  `reference` varchar(255) DEFAULT NULL COMMENT '出处、转载地址',
  `content` longtext,
  `comment_count` int(11) DEFAULT '0',
  `status` int(2) DEFAULT '1' COMMENT '0:未审核\r\n1:正常\r\n9:已删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', '1', '2', null, null, null, '资源应该有特殊标记如：<source:>source id</source>', '0', '1', '2013-11-24 19:41:53', '2013-11-24 19:46:22');
INSERT INTO `post` VALUES ('2', '20', '123123', '1', null, null, '<p>123123</p>', '0', '0', '2013-12-13 14:16:09', null);
INSERT INTO `post` VALUES ('3', '20', '123123', '0', null, null, '<p>123123123123123</p>', '0', '0', '2013-12-13 15:30:45', null);
INSERT INTO `post` VALUES ('4', '20', 'Project Babel - 开放百科- 灰狐', '3', null, null, '<ol id=\"rso\" style=\"margin: 0px; padding: 0px; border: 0px; color: #222222; font-family: arial, sans-serif; font-size: medium; line-height: 19px;\">\r\n<li class=\"g\" style=\"margin: 0px 0px 23px; padding: 0px; border: 0px; line-height: 1.2; list-style: none; font-size: small;\">\r\n<div class=\"rc\" style=\"position: relative;\" data-hveid=\"40\">\r\n<h3 class=\"r\" style=\"font-size: medium; font-weight: normal; margin: 0px; padding: 0px; line-height: 1; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\"><a style=\"color: #660099; cursor: pointer;\" href=\"http://www.ecosia.org/url?url=http%3A%2F%2Fwiki.huihoo.com%2Fwiki%2FProject_Babel&amp;v=2&amp;i=0&amp;q=project%20babel&amp;p=0&amp;tr=0&amp;at=0&amp;ar=0&amp;ab=0&amp;mr=0&amp;ir=0&amp;kgr=0&amp;nr=0&amp;iar=0&amp;sr=0\" target=\"_blank\" data-eco=\"true\"><span style=\"color: #dd4b39;\">Project Babel</span>&nbsp;- 开放百科- 灰狐</a></h3>\r\n<div class=\"s\" style=\"max-width: 42em; color: #444444; line-height: 1.54;\">\r\n<div class=\"f kv\" style=\"color: #666666; margin-bottom: 1px; white-space: nowrap;\"><cite class=\"vurls\" style=\"color: #006621; font-style: normal; font-size: 14px;\">wiki.huihoo.com/wiki/<strong>Project</strong>_<strong>Babel</strong></cite>&lrm;\r\n<div class=\"action-menu ab_ctl\" style=\"display: inline; position: relative; margin: 0px 3px; vertical-align: middle; -webkit-user-select: none;\">&nbsp;</div>\r\n</div>\r\n<div class=\"f slp\" style=\"color: #666666; margin-bottom: 1px;\">&nbsp;</div>\r\n<span class=\"st\" style=\"line-height: 1.24;\"><span class=\"f\" style=\"color: #666666;\">2010年9月27日 -&nbsp;</span>a Sophisticated BBS software.&nbsp;<span style=\"color: #dd4b39;\">Project Babel</span>&nbsp;是一套在众多方面进行创新的开放源代码网络社区软件，发布于GPL 协议下。&nbsp;<span style=\"color: #dd4b39;\">Project Babel</span>&nbsp;的界面&nbsp;<strong>...</strong></span></div>\r\n</div>\r\n</li>\r\n</ol>', '0', '0', '2013-12-13 17:40:18', null);
INSERT INTO `post` VALUES ('5', '20', '   题目：   题目：   题目：   题目：', '4', '<h2 id=\"tables-contextual-classes\" style', null, '<h2 id=\"tables-contextual-classes\" style=\"box-sizing: border-box; font-family: ff-tisa-web-pro-1, ff-tisa-web-pro-2, \'Lucida Grande\', \'Helvetica Neue\', Helvetica, Arial, \'Hiragino Sans GB\', \'Hiragino Sans GB W3\', \'Microsoft YaHei UI\', \'Microsoft YaHei\', \'WenQuanYi Micro Hei\', sans-serif; font-weight: 500; line-height: 1.1; color: #333333; margin-top: 20px; margin-bottom: 10px; font-size: 30px;\">状态class</h2>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; color: #333333; font-family: ff-tisa-web-pro-1, ff-tisa-web-pro-2, \'Lucida Grande\', \'Helvetica Neue\', Helvetica, Arial, \'Hiragino Sans GB\', \'Hiragino Sans GB W3\', \'WenQuanYi Micro Hei\', sans-serif; font-size: 14px; line-height: 20px;\">通过这些状态class可以为行货单元格设置颜色。</p>\r\n<div class=\"table-responsive\" style=\"box-sizing: border-box; color: #333333; font-family: ff-tisa-web-pro-1, ff-tisa-web-pro-2, \'Lucida Grande\', \'Helvetica Neue\', Helvetica, Arial, \'Hiragino Sans GB\', \'Hiragino Sans GB W3\', \'WenQuanYi Micro Hei\', sans-serif; font-size: 14px; line-height: 20px;\">\r\n<table class=\"table table-bordered table-striped\" style=\"box-sizing: border-box; border-collapse: collapse; border-spacing: 0px; max-width: 100%; background-color: transparent; width: 847px; margin-bottom: 20px; border: 1px solid #dddddd;\"><colgroup style=\"box-sizing: border-box;\"><col class=\"col-xs-1\" style=\"box-sizing: border-box; position: static; min-height: 1px; padding-right: 15px; padding-left: 15px; float: none; width: 0px;\" /><col class=\"col-xs-7\" style=\"box-sizing: border-box; position: static; min-height: 1px; padding-right: 15px; padding-left: 15px; float: none; width: 0px;\" /></colgroup>\r\n<thead style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\"><th style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: bottom; border-width: 0px 1px 2px; border-bottom-style: solid; border-bottom-color: #dddddd; border-right-style: solid; border-left-style: solid; border-right-color: #dddddd; border-left-color: #dddddd;\">Class</th><th style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: bottom; border-width: 0px 1px 2px; border-bottom-style: solid; border-bottom-color: #dddddd; border-right-style: solid; border-left-style: solid; border-right-color: #dddddd; border-left-color: #dddddd;\">描述</th></tr>\r\n</thead>\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border: 1px solid #dddddd; background-color: #f9f9f9;\"><code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; font-size: 13px; padding: 2px 4px; color: #c7254e; white-space: nowrap; background-color: #f9f2f4; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px;\">.active</code></td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border: 1px solid #dddddd; background-color: #f9f9f9;\">鼠标悬停在行或单元格上时所设置的颜色</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border: 1px solid #dddddd;\"><code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; font-size: 13px; padding: 2px 4px; color: #c7254e; white-space: nowrap; background-color: #f9f2f4; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px;\">.success</code></td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border: 1px solid #dddddd;\">标识成功或积极的动作</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border: 1px solid #dddddd; background-color: #f9f9f9;\"><code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; font-size: 13px; padding: 2px 4px; color: #c7254e; white-space: nowrap; background-color: #f9f2f4; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px;\">.warning</code></td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border: 1px solid #dddddd; background-color: #f9f9f9;\">标识警告或需要用户注意</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border: 1px solid #dddddd;\"><code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; font-size: 13px; padding: 2px 4px; color: #c7254e; white-space: nowrap; background-color: #f9f2f4; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px;\">.danger</code></td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border: 1px solid #dddddd;\">标识危险或潜在的带来负面影响的动作</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border: 1px solid #dddddd; background-color: #f9f9f9;\"><code style=\"box-sizing: border-box; font-family: Menlo, Monaco, Consolas, \'Courier New\', monospace; font-size: 13px; padding: 2px 4px; color: #c7254e; white-space: nowrap; background-color: #f9f2f4; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px;\">.info</code></td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border: 1px solid #dddddd; background-color: #f9f9f9;\">Indicates a neutral informative change or action</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<div class=\"bs-example\" style=\"box-sizing: border-box; position: relative; padding: 45px 15px 15px; margin: 0px 0px 15px; box-shadow: none; border: 1px solid #dddddd; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; color: #333333; font-family: ff-tisa-web-pro-1, ff-tisa-web-pro-2, \'Lucida Grande\', \'Helvetica Neue\', Helvetica, Arial, \'Hiragino Sans GB\', \'Hiragino Sans GB W3\', \'WenQuanYi Micro Hei\', sans-serif; font-size: 14px; line-height: 20px;\">\r\n<table class=\"table\" style=\"box-sizing: border-box; border-collapse: collapse; border-spacing: 0px; max-width: 100%; background-color: transparent; width: 815px; margin-bottom: 0px;\">\r\n<thead style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\"><th style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: bottom; border-top-width: 0px; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #dddddd;\">#</th><th style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: bottom; border-top-width: 0px; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #dddddd;\">Column heading</th><th style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: bottom; border-top-width: 0px; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #dddddd;\">Column heading</th><th style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: bottom; border-top-width: 0px; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #dddddd;\">Column heading</th></tr>\r\n</thead>\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr class=\"active\" style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #f5f5f5;\">1</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #f5f5f5;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #f5f5f5;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #f5f5f5;\">Column content</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">2</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n</tr>\r\n<tr class=\"success\" style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #dff0d8;\">3</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #dff0d8;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #dff0d8;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #dff0d8;\">Column content</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">4</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n</tr>\r\n<tr class=\"warning\" style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #fcf8e3;\">5</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #fcf8e3;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #fcf8e3;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #fcf8e3;\">Column content</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">6</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n</tr>\r\n<tr class=\"danger\" style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #f2dede;\">7</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #f2dede;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #f2dede;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #f2dede;\">Column content</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">8</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd;\">Column content</td>\r\n</tr>\r\n<tr class=\"info\" style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #d9edf7;\">9</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #d9edf7;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #d9edf7;\">Column content</td>\r\n<td style=\"box-sizing: border-box; padding: 8px; line-height: 1.428571429; vertical-align: top; border-top-width: 1px; border-top-style: solid; border-top-color: #dddddd; background-color: #d9edf7;\">Column content</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', '0', '0', '2013-12-14 11:26:13', null);

-- ----------------------------
-- Table structure for post_category
-- ----------------------------
DROP TABLE IF EXISTS `post_category`;
CREATE TABLE `post_category` (
  `post_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  KEY `category_post_category` (`category_id`),
  KEY `post_category` (`post_id`),
  CONSTRAINT `category_post_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_category` FOREIGN KEY (`post_id`) REFERENCES `post` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_category
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `avatar` int(11) DEFAULT NULL,
  `type` int(2) DEFAULT NULL COMMENT '1:正常用户',
  `status` int(2) DEFAULT '1' COMMENT '用户状态：\r\n1：正常\r\n2：已删除\r\n3：已禁用',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aa', null, null, null, null, '1', null, '2013-12-04 08:53:12');
INSERT INTO `user` VALUES ('14', 'john', 'NE+8GMd0FvhHntdJOV3YtQ==', 'w163kai@163.com', null, '1', '1', '2013-12-04 08:53:27', null);
INSERT INTO `user` VALUES ('15', 'qwe', 'vp44fTtEYy2zlWqTsFRf+g==', 'qwe@qq.com', null, '1', '1', '2013-12-04 12:36:52', null);
INSERT INTO `user` VALUES ('16', 'www', '7XZamz6cldi2o1KARV/SMg==', '123123@11.com', null, '1', '1', '2013-12-04 12:40:05', null);
INSERT INTO `user` VALUES ('17', 'www2', '7XZamz6cldi2o1KARV/SMg==', '1231232@11.com', null, '1', '1', '2013-12-04 12:40:35', null);
INSERT INTO `user` VALUES ('18', null, '7XZamz6cldi2o1KARV/SMg==', '11@11.com', null, '1', '1', '2013-12-09 10:38:57', null);
INSERT INTO `user` VALUES ('19', '123123', '7XZamz6cldi2o1KARV/SMg==', '123@11.com', null, '1', '1', '2013-12-09 10:48:04', null);
INSERT INTO `user` VALUES ('20', '12123', '7XZamz6cldi2o1KARV/SMg==', '12@12.com', null, '1', '1', '2013-12-09 10:49:19', null);
INSERT INTO `user` VALUES ('21', '12123', '7XZamz6cldi2o1KARV/SMg==', '12@112.com', null, '1', '1', '2013-12-09 10:50:33', null);
INSERT INTO `user` VALUES ('22', '12123', '7XZamz6cldi2o1KARV/SMg==', '12@1222.com', null, '1', '1', '2013-12-09 10:52:31', null);
INSERT INTO `user` VALUES ('23', '123123123', '7XZamz6cldi2o1KARV/SMg==', '22@12123.com', null, '1', '1', '2013-12-09 11:03:36', null);
INSERT INTO `user` VALUES ('24', '123123', '7XZamz6cldi2o1KARV/SMg==', '33@1231', null, '1', '1', '2013-12-09 11:07:36', null);
