/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : net_cms

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2015-05-04 01:15:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `articleId` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `keyword` varchar(255) collate utf8_unicode_ci default NULL,
  `status` int(3) default NULL,
  `content` text collate utf8_unicode_ci,
  `summary` text collate utf8_unicode_ci,
  `createDate` varchar(255) collate utf8_unicode_ci default NULL,
  `publishDate` varchar(255) collate utf8_unicode_ci default NULL,
  `channel` varchar(255) collate utf8_unicode_ci default NULL,
  `author` varchar(255) collate utf8_unicode_ci default NULL,
  `thumb` varchar(255) collate utf8_unicode_ci default NULL,
  `asn` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', 'rrrrrrr', 'rrb', '0', 'test', null, null, null, 'history', null, '', null);
INSERT INTO `articles` VALUES ('2', 'rrrrrrr', 'rrb', '0', 'test<img sn=\"1429431870679\" src=\"http://localhost:8080/Net_CMS/resources/upload/thumbs/1429431870679.jpg\" alt=\"\" /> ', null, null, null, 'history', null, '', null);
INSERT INTO `articles` VALUES ('3', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('4', '', '', '0', '<img sn=\"1429432045319\" src=\"http://localhost:8080/Net_CMS/resources/upload/thumbs/1429432045319.jpg\" alt=\"\" /> <img sn=\"1429432044995\" src=\"http://localhost:8080/Net_CMS/resources/upload/thumbs/1429432044995.jpg\" alt=\"\" /> ', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('5', 'test', '', '0', '', null, null, null, 'history', null, '', null);
INSERT INTO `articles` VALUES ('6', 'test', 'test', '0', '', null, null, null, 'history', null, '', null);
INSERT INTO `articles` VALUES ('7', 'test', 'test', '0', '<img sn=\"1429432364296\" src=\"http://localhost:8080/Net_CMS/resources/upload/thumbs/1429432364296.jpg\" alt=\"\" /> ', null, null, null, 'history', null, '', null);
INSERT INTO `articles` VALUES ('8', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('9', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('10', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('11', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('12', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('13', '', '', '0', '<img sn=\"1429699775452\" src=\"http://localhost:8080/Net_CMS/resources/upload/thumbs/1429699775452.jpg\" alt=\"\" /> ', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('14', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('15', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('16', 'xdrodger', '', '0', '<div style=\"box-sizing: border-box; color: rgb(62, 62, 62); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; height: 60px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">刚刚过去的是清明节，三天的假期，同学们都在朋友圈里各种晒出门旅行的照片，http://www.wojilu.com/Forum1/Topic/4287	所以也就呆在宿舍里面整整宅了三天。不过也没闲着，因为实在太无聊， 所以在网上下载了各种技术教学视频，蹲在宿舍里面……</div><div class=\"visible-lg\" style=\"box-sizing: border-box; color: rgb(62, 62, 62); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; margin-top: 8px;\">2015年04月07日 3 条评论 107 PHP / ThinkPHP</div>', null, null, null, 'cc', null, '', null);
INSERT INTO `articles` VALUES ('17', 'xdrodger', '', '0', '<div style=\"box-sizing: border-box; color: rgb(62, 62, 62); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; height: 60px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">刚刚过去的是清明节，三天的假期，同学们都在朋友圈里各种晒出门旅行的照片，http://www.wojilu.com/Forum1/Topic/4287	所以也就呆在宿舍里面整整宅了三天。不过也没闲着，因为实在太无聊， 所以在网上下载了各种技术教学视频，蹲在宿舍里面……</div><div class=\"visible-lg\" style=\"box-sizing: border-box; color: rgb(62, 62, 62); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; margin-top: 8px;\">2015年04月07日 3 条评论 107 PHP / ThinkPHP</div>', null, null, null, 'cc', null, '', null);
INSERT INTO `articles` VALUES ('18', 'rrr', '', '0', '', null, null, null, 'shujujiegou', null, '', null);
INSERT INTO `articles` VALUES ('19', 'rrr', 'eee', '0', '', null, null, null, 'shujujiegou', null, '', null);
INSERT INTO `articles` VALUES ('20', 'rrr', 'eee', '0', '', null, null, null, 'shujujiegou', null, '', null);
INSERT INTO `articles` VALUES ('21', 'rrr', 'eee|e', '0', '', null, null, null, 'shujujiegou', null, '', null);
INSERT INTO `articles` VALUES ('22', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('23', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('24', '', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('25', 'test', '', '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('26', 'test', null, '0', '', null, null, null, 'shuxue', null, '', null);
INSERT INTO `articles` VALUES ('27', '测试', null, '0', '', null, null, null, 'shuxue', null, '', null);
INSERT INTO `articles` VALUES ('28', '测试', null, '0', 'test', null, null, null, 'shuxue', null, '', null);
INSERT INTO `articles` VALUES ('29', '测试', null, '0', 'test', null, null, null, 'shuxue', null, '', null);
INSERT INTO `articles` VALUES ('30', '测试', null, '0', 'test', null, null, null, 'shuxue', null, '', null);
INSERT INTO `articles` VALUES ('31', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('32', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('33', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('34', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('35', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('36', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('37', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('38', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('39', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('40', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('41', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('42', '', null, '0', '', null, null, null, '0', null, '', null);
INSERT INTO `articles` VALUES ('43', '', null, '0', '', null, null, null, '0', null, '', '1430672292440');
INSERT INTO `articles` VALUES ('44', '', null, '0', '', null, null, null, '0', null, '', '1430672294275');
INSERT INTO `articles` VALUES ('45', '', null, '0', '', null, null, null, '0', null, '', '1430672373963');
INSERT INTO `articles` VALUES ('46', '', null, '0', '', null, null, null, '0', null, '', '1430672383350');
INSERT INTO `articles` VALUES ('47', '', null, '0', '', null, null, null, '0', null, '', '1430672720794');
INSERT INTO `articles` VALUES ('48', '', null, '0', '', null, null, null, '0', null, '', '1430672730327');
INSERT INTO `articles` VALUES ('49', '', null, '0', '', null, null, null, '0', null, '', '1430672906649');
INSERT INTO `articles` VALUES ('50', '', null, '0', '', null, null, null, '0', null, '', '1430672944849');
INSERT INTO `articles` VALUES ('51', '', null, '0', '', null, null, null, '0', null, '', '1430673056762');
INSERT INTO `articles` VALUES ('52', '', null, '0', '', null, null, null, '0', null, '', '1430673072307');
INSERT INTO `articles` VALUES ('53', '', null, '0', '', null, null, null, '0', null, '', '1430673077958');
INSERT INTO `articles` VALUES ('54', '', null, '0', '', null, null, null, '0', null, '', '1430673284585');
INSERT INTO `articles` VALUES ('55', '', null, '0', '', null, null, null, '0', null, '', '1430673287214');

-- ----------------------------
-- Table structure for attachs
-- ----------------------------
DROP TABLE IF EXISTS `attachs`;
CREATE TABLE `attachs` (
  `asn` varchar(50) default NULL,
  `newName` varchar(255) default NULL,
  `oldName` varchar(255) default NULL,
  `sn` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `isImg` tinyint(1) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachs
-- ----------------------------
INSERT INTO `attachs` VALUES (null, '1430672721061.zip', 'secondarytile.zip', '1430672721061', '文档类型', '0');
INSERT INTO `attachs` VALUES (null, '1430672906743.zip', 'secondarytile.zip', '1430672906743', '文档类型', '0');
INSERT INTO `attachs` VALUES (null, '1430673056789.zip', 'secondarytile.zip', '1430673056789', '文档类型', '0');
INSERT INTO `attachs` VALUES ('1430673287214', '1430673284690.zip', 'secondarytile.zip', '1430673284690', '文档类型', '0');

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `channelId` int(5) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci default NULL,
  `url` varchar(60) collate utf8_unicode_ci default NULL,
  `sort` int(5) default NULL,
  `status` int(11) default NULL,
  `pchannelId` int(5) default NULL,
  `sn` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`channelId`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of channels
-- ----------------------------
INSERT INTO `channels` VALUES ('56', '李科', null, '0', '1', '0', 'like');
INSERT INTO `channels` VALUES ('57', '数学', null, '0', '1', '56', 'shuxue');

-- ----------------------------
-- Table structure for keywords
-- ----------------------------
DROP TABLE IF EXISTS `keywords`;
CREATE TABLE `keywords` (
  `keyWordId` int(11) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `sn` varchar(255) collate utf8_unicode_ci default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of keywords
-- ----------------------------

-- ----------------------------
-- Table structure for rights
-- ----------------------------
DROP TABLE IF EXISTS `rights`;
CREATE TABLE `rights` (
  `rightId` int(5) NOT NULL auto_increment,
  `rightName` varchar(255) collate utf8_unicode_ci default NULL,
  `rightUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `rightPos` int(5) default NULL,
  `rightCode` bigint(8) default NULL,
  `category` varchar(60) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`rightId`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rights
-- ----------------------------
INSERT INTO `rights` VALUES ('110', '文章管理', 'ArticleController', '0', '1', 'category');
INSERT INTO `rights` VALUES ('111', '添加文章', 'article_add', '0', '2', 'action');
INSERT INTO `rights` VALUES ('112', '发布文章', 'article_publish', '0', '4', 'action');
INSERT INTO `rights` VALUES ('113', '文章列表', 'article_list', '0', '8', 'action');
INSERT INTO `rights` VALUES ('114', '栏目管理', 'ChannelController', '0', '16', 'category');
INSERT INTO `rights` VALUES ('115', '编辑栏目', 'channel_edit', '0', '32', 'action');
INSERT INTO `rights` VALUES ('116', '添加子栏目', 'channel_addChild', '0', '64', 'action');
INSERT INTO `rights` VALUES ('117', '栏目列表', 'channel_listAllChannels', '0', '128', 'action');
INSERT INTO `rights` VALUES ('118', '添加父栏目', 'channel_addParentChannel', '0', '256', 'action');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `roleId` int(5) NOT NULL auto_increment,
  `roleName` varchar(255) collate utf8_unicode_ci default NULL,
  `roleValue` varchar(255) collate utf8_unicode_ci default NULL,
  `roleDesc` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for role_right
-- ----------------------------
DROP TABLE IF EXISTS `role_right`;
CREATE TABLE `role_right` (
  `roleId` int(11) default NULL,
  `rightId` int(11) default NULL,
  KEY `roleId` (`roleId`),
  KEY `rightId` (`rightId`),
  CONSTRAINT `role_right_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`),
  CONSTRAINT `role_right_ibfk_2` FOREIGN KEY (`rightId`) REFERENCES `rights` (`rightId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_right
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL auto_increment,
  `name` varchar(20) collate utf8_unicode_ci NOT NULL,
  `pass` varchar(50) collate utf8_unicode_ci default NULL,
  `email` varchar(60) collate utf8_unicode_ci default NULL,
  `nickname` varchar(60) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('28', 'test', 'test', 'test@qq.com', 'test');
INSERT INTO `users` VALUES ('29', 'admin', 'admin', 'admin@qq.com', 'admin');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userId` int(11) default NULL,
  `roleId` int(11) default NULL,
  KEY `userId` (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
