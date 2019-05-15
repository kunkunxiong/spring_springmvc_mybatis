/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : template

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-09-07 19:56:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '湖南', '2018-07-27', '123@qq.com', '刘', '123', '2', '1');
INSERT INTO `user` VALUES ('4', '湖南', '2018-07-26', '123@qq.com', '吕', '123', '1', '1');
INSERT INTO `user` VALUES ('32', '', '2018-08-16', '', '速递公司', '', '1', '0');
INSERT INTO `user` VALUES ('35', '', '2018-08-16', '', '广东省', '', '1', '0');
INSERT INTO `user` VALUES ('36', 'fdh', '2018-08-16', '', 'sdghdf ', '', '1', '0');
INSERT INTO `user` VALUES ('37', '', '2018-08-16', '', 'dfshg', '', '1', '0');
INSERT INTO `user` VALUES ('38', 'sd ', '2018-08-16', '', 'fh', '', '1', '0');
INSERT INTO `user` VALUES ('39', '', '2018-08-16', '', 'dshg', '', '1', '0');
INSERT INTO `user` VALUES ('40', '', '2018-08-16', '', 'fhas', '', '1', '0');
INSERT INTO `user` VALUES ('41', '', '2018-08-16', '', 'sdghh', '', '1', '0');
INSERT INTO `user` VALUES ('42', '', '2018-08-16', '', 'fjhgfj', '', '1', '0');
INSERT INTO `user` VALUES ('43', '', '2018-08-16', '', 'adf', '', '1', '0');
INSERT INTO `user` VALUES ('44', '', '2018-08-16', '', 'sdgs', '', '1', '0');
INSERT INTO `user` VALUES ('45', '', '2018-08-16', '', 'dshgsdfh', '', '1', '0');
INSERT INTO `user` VALUES ('46', '', '2018-08-16', '', 'jgkgkh', '', '1', '0');
INSERT INTO `user` VALUES ('47', '', '2018-08-16', '', 'gfhkjh', '', '1', '0');
INSERT INTO `user` VALUES ('48', '十多个', '2018-08-16', '', '的观点是公司', '', '1', '0');
INSERT INTO `user` VALUES ('49', '', '2018-08-16', '', 'hfj', '', '1', '0');
INSERT INTO `user` VALUES ('50', '', '2018-08-16', '', 'gfjkhgk', '', '1', '0');
INSERT INTO `user` VALUES ('51', '', '2018-08-16', '', '熊11111', '', '1', '0');
INSERT INTO `user` VALUES ('52', '永州', '2018-08-16', '', 'saghdfj', '', '1', '0');
INSERT INTO `user` VALUES ('53', '', '2018-08-16', '', 'dfhfgjc', '', '2', '0');
INSERT INTO `user` VALUES ('54', '', '2018-08-16', '', 'da11111111', '', '1', '0');
