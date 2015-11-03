/*
Navicat MySQL Data Transfer

Source Server         : fengke
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : meetingsystem

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-10-14 13:54:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dep_id` int(1) NOT NULL AUTO_INCREMENT,
  `dep_name` char(20) NOT NULL,
  `emp_id` int(5) NOT NULL,
  PRIMARY KEY (`dep_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('101', '项目部', '1001');
INSERT INTO `department` VALUES ('102', '技术部', '1003');
INSERT INTO `department` VALUES ('103', '后勤部', '1002');

-- ----------------------------
-- Table structure for `emp`
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `emp_id` int(5) NOT NULL AUTO_INCREMENT,
  `emp_name` char(5) NOT NULL,
  `emp_gender` char(5) NOT NULL,
  `emp_tel` char(14) NOT NULL,
  `emp_address` char(30) NOT NULL,
  `emp_card` char(18) NOT NULL,
  `emp_did` int(1) NOT NULL,
  `emp_salary` int(7) NOT NULL,
  `emp_root` int(1) NOT NULL,
  `emp_status` int(1) NOT NULL,
  `emp_password` char(16) NOT NULL,
  `emp_email` char(15) NOT NULL,
  `emp_ip` char(15) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `emp_did` (`emp_did`),
  KEY `emp_root` (`emp_root`),
  KEY `emp_status` (`emp_status`),
  CONSTRAINT `emp_did` FOREIGN KEY (`emp_did`) REFERENCES `department` (`dep_id`),
  CONSTRAINT `emp_root` FOREIGN KEY (`emp_root`) REFERENCES `emproot` (`emproot_id`),
  CONSTRAINT `emp_status` FOREIGN KEY (`emp_status`) REFERENCES `empstatus` (`empstatus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1001', '张三', '男', '11111111111', '北京', '1011001', '101', '5000', '1', '1', '123123', '1231123@163.com', '123123');
INSERT INTO `emp` VALUES ('1002', '王四', '男', '22222222222', '上海', '12345', '103', '5000', '2', '2', '123456', '123@qq.com', '123123');
INSERT INTO `emp` VALUES ('1003', '王六', '女', '212121212', '太原', '1212121', '101', '5000', '1', '2', '123456', '123123@qq.com', '123123');
INSERT INTO `emp` VALUES ('1004', '李磊', '女', '121212121', '山东', '12121211', '102', '6000', '2', '2', '123', 'aaa', '123123');
INSERT INTO `emp` VALUES ('1007', '小三', '男', '22222222', '山西晋城', '1111112222', '101', '5000', '1', '1', '1234', '12345@qq.com', '');
INSERT INTO `emp` VALUES ('1008', '', '男', '', '', '', '101', '5000', '1', '1', '', '', '');
INSERT INTO `emp` VALUES ('1009', '', '男', '', '', '', '101', '5000', '1', '1', '', '', '');
INSERT INTO `emp` VALUES ('1010', '', '男', '', '', '', '101', '5000', '1', '1', '', '', '');
INSERT INTO `emp` VALUES ('1011', '', '男', '', '', '', '101', '5000', '1', '1', '', '', '');
INSERT INTO `emp` VALUES ('1012', '', '男', '', '', '', '101', '5000', '1', '1', '', '', '');
INSERT INTO `emp` VALUES ('1013', '', '男', '', '', '', '101', '5000', '1', '1', '', '', '');
INSERT INTO `emp` VALUES ('1014', '', '男', '', '', '', '101', '5000', '1', '1', '', '', '');
INSERT INTO `emp` VALUES ('1015', '', '男', '', '', '', '101', '5000', '1', '1', '', '', '');

-- ----------------------------
-- Table structure for `emproot`
-- ----------------------------
DROP TABLE IF EXISTS `emproot`;
CREATE TABLE `emproot` (
  `emproot_id` int(1) NOT NULL AUTO_INCREMENT,
  `emproot_name` char(5) NOT NULL,
  PRIMARY KEY (`emproot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emproot
-- ----------------------------
INSERT INTO `emproot` VALUES ('1', '普通员工');
INSERT INTO `emproot` VALUES ('2', '核心员工');
INSERT INTO `emproot` VALUES ('3', '管理员');

-- ----------------------------
-- Table structure for `empstatus`
-- ----------------------------
DROP TABLE IF EXISTS `empstatus`;
CREATE TABLE `empstatus` (
  `empstatus_id` int(1) NOT NULL AUTO_INCREMENT,
  `empstatus_name` char(5) NOT NULL,
  PRIMARY KEY (`empstatus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of empstatus
-- ----------------------------
INSERT INTO `empstatus` VALUES ('1', '待审批');
INSERT INTO `empstatus` VALUES ('2', '已审批');
INSERT INTO `empstatus` VALUES ('3', '已离职');

-- ----------------------------
-- Table structure for `equipment`
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `equipment _id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment _name` char(10) NOT NULL,
  `equipment_number` int(11) NOT NULL,
  `room_id` int(6) NOT NULL,
  PRIMARY KEY (`equipment _id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_id` FOREIGN KEY (`room_id`) REFERENCES `meetingroom` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('1', '杯子', '2', '1');
INSERT INTO `equipment` VALUES ('2', '字', '22', '2');
INSERT INTO `equipment` VALUES ('3', '电脑', '444', '3');
INSERT INTO `equipment` VALUES ('4', '投影', '22', '1');
INSERT INTO `equipment` VALUES ('5', '阿萨', '12', '2');
INSERT INTO `equipment` VALUES ('6', '十大', '12', '2');
INSERT INTO `equipment` VALUES ('7', '看', '1', '3');
INSERT INTO `equipment` VALUES ('8', '的', '222', '1');
INSERT INTO `equipment` VALUES ('9', '存储', '12', '2');
INSERT INTO `equipment` VALUES ('10', '手机', '11', '1');

-- ----------------------------
-- Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `history_id` int(5) NOT NULL AUTO_INCREMENT,
  `history_empid` int(5) NOT NULL,
  `history_empinformation` char(100) NOT NULL,
  `history_date` datetime NOT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('1', '1004', '1004添加了一条会议记录:  参加人员：1001,1002,1003  开始时间：2015-10-14 00:42:00.0  结束时间：2015-10-15 00:42:00.0', '2015-10-13 00:42:56');
INSERT INTO `history` VALUES ('2', '1004', '1004添加了一条会议记录:  参加人员：1001,1002,1003  开始时间：2015-10-14 00:44:00.0  结束时间：2015-10-15 00:44:00.0', '2015-10-13 00:45:08');
INSERT INTO `history` VALUES ('3', '0', '0查询会议记录:  typeselectall  requests：all', '2015-10-13 00:45:12');
INSERT INTO `history` VALUES ('4', '0', '0查询会议记录:  typeselectall  requests：all', '2015-10-13 00:45:13');
INSERT INTO `history` VALUES ('5', '1004', '1004查询会议记录:  type=selectall  requests=all', '2015-10-13 00:48:55');
INSERT INTO `history` VALUES ('6', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:48:57');
INSERT INTO `history` VALUES ('7', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:48:59');
INSERT INTO `history` VALUES ('8', '0', '0取消了一条会议记录:  参加人员：3  开始时间：2015-10-08 20:37:49.0  结束时间：2015-10-16 20:37:53.0', '2015-10-13 00:49:02');
INSERT INTO `history` VALUES ('9', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:49:02');
INSERT INTO `history` VALUES ('10', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:49:04');
INSERT INTO `history` VALUES ('11', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:49:05');
INSERT INTO `history` VALUES ('12', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:49:25');
INSERT INTO `history` VALUES ('13', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:49:26');
INSERT INTO `history` VALUES ('14', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:50:34');
INSERT INTO `history` VALUES ('15', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:50:37');
INSERT INTO `history` VALUES ('16', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:50:38');
INSERT INTO `history` VALUES ('17', '0', '0取消了一条会议记录:  参加人员：3  开始时间：2015-10-14 00:44:00.0  结束时间：2015-10-15 00:44:00.0', '2015-10-13 00:50:40');
INSERT INTO `history` VALUES ('18', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:50:40');
INSERT INTO `history` VALUES ('19', '1004', '1004查询会议记录:  type=selectall  requests=all', '2015-10-13 00:52:42');
INSERT INTO `history` VALUES ('20', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:52:45');
INSERT INTO `history` VALUES ('21', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:52:47');
INSERT INTO `history` VALUES ('22', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:52:47');
INSERT INTO `history` VALUES ('23', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:52:48');
INSERT INTO `history` VALUES ('24', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:55:22');
INSERT INTO `history` VALUES ('25', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:55:24');
INSERT INTO `history` VALUES ('26', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 00:55:25');
INSERT INTO `history` VALUES ('27', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:00:06');
INSERT INTO `history` VALUES ('28', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:00:07');
INSERT INTO `history` VALUES ('29', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:00:07');
INSERT INTO `history` VALUES ('30', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:00:08');
INSERT INTO `history` VALUES ('31', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:00:08');
INSERT INTO `history` VALUES ('32', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:00:08');
INSERT INTO `history` VALUES ('33', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:02:04');
INSERT INTO `history` VALUES ('34', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:02:41');
INSERT INTO `history` VALUES ('35', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:03:07');
INSERT INTO `history` VALUES ('36', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:03:09');
INSERT INTO `history` VALUES ('37', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:03:10');
INSERT INTO `history` VALUES ('38', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:04:02');
INSERT INTO `history` VALUES ('39', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:04:05');
INSERT INTO `history` VALUES ('40', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:04:06');
INSERT INTO `history` VALUES ('41', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:04:06');
INSERT INTO `history` VALUES ('42', '1004', '1004添加了一条会议记录:  参加人员：1001,1002,1003  开始时间：2015-10-14 01:04:00.0  结束时间：2015-10-15 01:04:00.0', '2015-10-13 01:04:50');
INSERT INTO `history` VALUES ('43', '1004', '1004查询会议记录:  type=selectall  requests=all', '2015-10-13 01:04:53');
INSERT INTO `history` VALUES ('44', '1004', '1004查询会议记录:  type=meeting_id  requests=1', '2015-10-13 01:05:00');
INSERT INTO `history` VALUES ('45', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:05:04');
INSERT INTO `history` VALUES ('46', '1001', '1001更新了会议记录:  会议ID1', '2015-10-13 01:05:25');
INSERT INTO `history` VALUES ('47', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:05:29');
INSERT INTO `history` VALUES ('48', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:05:31');
INSERT INTO `history` VALUES ('49', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:05:31');
INSERT INTO `history` VALUES ('50', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 01:05:32');
INSERT INTO `history` VALUES ('51', '0', '0添加了一条会议室记录:  会议室状态：会议室空闲中  会议室名字：中软  容量：22', '2015-10-13 01:27:27');
INSERT INTO `history` VALUES ('52', '0', '0添加了一条会议室记录:  会议室状态：会议室空闲中  会议室名字：aaa  容量：123', '2015-10-13 01:30:25');
INSERT INTO `history` VALUES ('53', '1004', '1004添加了一条会议室记录:  会议室状态：会议室空闲中  会议室名字：你好  容量：21', '2015-10-13 01:30:37');
INSERT INTO `history` VALUES ('54', '1004', '1004添加了一条会议室记录:  会议室状态：会议室空闲中  会议室名字：梅花教室  容量：123', '2015-10-13 01:32:54');
INSERT INTO `history` VALUES ('55', '0', '0查询了会议室记录:  type=select all  request=请输入', '2015-10-13 01:33:41');
INSERT INTO `history` VALUES ('56', '0', '0查询了会议室记录:  type=select all  request=请输入', '2015-10-13 01:33:42');
INSERT INTO `history` VALUES ('57', '0', '0查询了会议室记录:  type=select all  request=1', '2015-10-13 01:33:43');
INSERT INTO `history` VALUES ('58', '0', '0查询了会议室记录:  type=select all  request=1', '2015-10-13 01:33:44');
INSERT INTO `history` VALUES ('59', '0', '0查询了会议室记录:  type=select all  request=1', '2015-10-13 01:33:44');
INSERT INTO `history` VALUES ('60', '0', '0查询了会议室记录:  type=select all  request=请输入', '2015-10-13 01:35:04');
INSERT INTO `history` VALUES ('61', '0', '0查询了会议室记录:  type=select all  request=请输入', '2015-10-13 01:35:05');
INSERT INTO `history` VALUES ('62', '1004', '1004查询了会议室记录:  type=select all  request=请输入', '2015-10-13 01:35:20');
INSERT INTO `history` VALUES ('63', '1004', '1004查询了会议室记录:  type=select all  request=请输入', '2015-10-13 01:35:21');
INSERT INTO `history` VALUES ('64', '1004', '1004查询了会议室记录:  type=select all  request=请输入', '2015-10-13 01:35:21');
INSERT INTO `history` VALUES ('65', '1004', '1004查询了会议室记录:  type=select all  request=1', '2015-10-13 01:35:27');
INSERT INTO `history` VALUES ('66', '1004', '1004查询了会议室记录:  type=select all  request=1', '2015-10-13 01:35:28');
INSERT INTO `history` VALUES ('67', '1004', '1004查询了会议室记录:  type=select all  request=1', '2015-10-13 01:35:28');
INSERT INTO `history` VALUES ('68', '1004', '1004更新了一条会议室记录:  会议室ID：1  会议室名字：你猜  容量：55', '2015-10-13 01:35:53');
INSERT INTO `history` VALUES ('69', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 01:36:20');
INSERT INTO `history` VALUES ('70', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 01:36:22');
INSERT INTO `history` VALUES ('71', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 01:36:24');
INSERT INTO `history` VALUES ('72', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 01:36:38');
INSERT INTO `history` VALUES ('73', '0', '0删除了一条会议室记录:  会议室ID：5', '2015-10-13 01:36:40');
INSERT INTO `history` VALUES ('74', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 01:37:43');
INSERT INTO `history` VALUES ('75', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 01:37:44');
INSERT INTO `history` VALUES ('76', '1004', '1004删除了一条会议室记录:  会议室ID：6', '2015-10-13 01:37:46');
INSERT INTO `history` VALUES ('77', '1004', '1004登录成功', '2015-10-13 01:55:20');
INSERT INTO `history` VALUES ('78', '0', '查询所有员工信息', '2015-10-13 01:55:44');
INSERT INTO `history` VALUES ('79', '0', '查询所有员工信息', '2015-10-13 01:55:47');
INSERT INTO `history` VALUES ('80', '1004', '1004登录成功', '2015-10-13 01:56:35');
INSERT INTO `history` VALUES ('81', '1004', '查询所有员工信息', '2015-10-13 01:56:38');
INSERT INTO `history` VALUES ('82', '1004', '查询所有员工信息', '2015-10-13 01:56:40');
INSERT INTO `history` VALUES ('83', '1004', '查询所有员工信息', '2015-10-13 01:56:53');
INSERT INTO `history` VALUES ('85', '1004', '查询所有员工信息', '2015-10-13 01:57:11');
INSERT INTO `history` VALUES ('86', '1004', '查询所有员工信息', '2015-10-13 01:57:15');
INSERT INTO `history` VALUES ('87', '1004', '查询所有员工信息', '2015-10-13 01:57:20');
INSERT INTO `history` VALUES ('88', '1004', '查询所有员工信息', '2015-10-13 01:57:21');
INSERT INTO `history` VALUES ('89', '1004', '查询所有员工信息', '2015-10-13 01:57:23');
INSERT INTO `history` VALUES ('90', '1004', '查询所有员工信息', '2015-10-13 01:57:28');
INSERT INTO `history` VALUES ('91', '1004', '查询所有员工信息', '2015-10-13 01:57:31');
INSERT INTO `history` VALUES ('92', '1004', '1004登录成功', '2015-10-13 02:02:00');
INSERT INTO `history` VALUES ('93', '1004', '查询所有员工信息', '2015-10-13 02:02:16');
INSERT INTO `history` VALUES ('95', '1004', '查询所有员工信息', '2015-10-13 02:04:05');
INSERT INTO `history` VALUES ('96', '1003', '0删除了一条员工记录： empId=1003', '2015-10-13 02:04:11');
INSERT INTO `history` VALUES ('97', '1004', '1004登录成功', '2015-10-13 02:06:10');
INSERT INTO `history` VALUES ('98', '1004', '查询所有员工信息', '2015-10-13 02:06:14');
INSERT INTO `history` VALUES ('100', '1004', '1004登录成功', '2015-10-13 02:07:32');
INSERT INTO `history` VALUES ('101', '1004', '查询所有员工信息', '2015-10-13 02:07:34');
INSERT INTO `history` VALUES ('103', '1004', '查询所有员工信息', '2015-10-13 02:08:51');
INSERT INTO `history` VALUES ('104', '1004', '1004登录成功', '2015-10-13 02:12:41');
INSERT INTO `history` VALUES ('105', '1004', '查询所有员工信息', '2015-10-13 02:12:43');
INSERT INTO `history` VALUES ('106', '1004', '查询所有员工信息', '2015-10-13 02:12:45');
INSERT INTO `history` VALUES ('107', '1004', '查询所有员工信息', '2015-10-13 02:13:55');
INSERT INTO `history` VALUES ('108', '1004', '1004登录成功', '2015-10-13 02:17:33');
INSERT INTO `history` VALUES ('109', '1004', '查询所有员工信息', '2015-10-13 02:17:36');
INSERT INTO `history` VALUES ('111', '1004', '1004登录成功', '2015-10-13 02:19:12');
INSERT INTO `history` VALUES ('112', '1004', '查询所有员工信息', '2015-10-13 02:19:14');
INSERT INTO `history` VALUES ('113', '1004', '查询所有员工信息', '2015-10-13 02:19:16');
INSERT INTO `history` VALUES ('114', '1004', '1004登录成功', '2015-10-13 02:21:02');
INSERT INTO `history` VALUES ('115', '1004', '查询所有员工信息', '2015-10-13 02:21:03');
INSERT INTO `history` VALUES ('116', '1004', '查询所有员工信息', '2015-10-13 02:21:05');
INSERT INTO `history` VALUES ('117', '1004', '1004登录成功', '2015-10-13 02:25:07');
INSERT INTO `history` VALUES ('118', '1004', '查询所有员工信息', '2015-10-13 02:25:10');
INSERT INTO `history` VALUES ('119', '1002', '1002修改了一条员工记录： empId=1002', '2015-10-13 02:25:21');
INSERT INTO `history` VALUES ('120', '1004', '查询所有员工信息', '2015-10-13 02:26:11');
INSERT INTO `history` VALUES ('121', '1004', '查询所有员工信息', '2015-10-13 02:26:12');
INSERT INTO `history` VALUES ('122', '1004', '查询所有员工信息', '2015-10-13 02:26:27');
INSERT INTO `history` VALUES ('123', '1001', '1001修改了一条员工记录： empId=1001', '2015-10-13 02:26:35');
INSERT INTO `history` VALUES ('124', '1004', '1004登录成功', '2015-10-13 02:28:27');
INSERT INTO `history` VALUES ('125', '1004', '查询所有员工信息', '2015-10-13 02:28:31');
INSERT INTO `history` VALUES ('126', '1002', '1002修改了一条员工记录： empId=1002', '2015-10-13 02:28:42');
INSERT INTO `history` VALUES ('127', '1004', '查询所有员工信息', '2015-10-13 02:32:05');
INSERT INTO `history` VALUES ('128', '1002', '1002修改了一条员工记录： empId=1002', '2015-10-13 02:32:14');
INSERT INTO `history` VALUES ('129', '1004', '1004登录成功', '2015-10-13 02:34:38');
INSERT INTO `history` VALUES ('130', '1004', '查询所有员工信息', '2015-10-13 02:34:43');
INSERT INTO `history` VALUES ('131', '1004', '1004修改了一条员工记录： empId=1002', '2015-10-13 02:34:57');
INSERT INTO `history` VALUES ('132', '1004', '1004登录成功', '2015-10-13 10:23:09');
INSERT INTO `history` VALUES ('135', '1007', '1007注册', '2015-10-13 13:19:57');
INSERT INTO `history` VALUES ('136', '1004', '1004登录成功', '2015-10-13 13:20:03');
INSERT INTO `history` VALUES ('137', '1004', '查询所有员工信息', '2015-10-13 13:20:05');
INSERT INTO `history` VALUES ('138', '1004', '查询所有员工信息', '2015-10-13 13:20:06');
INSERT INTO `history` VALUES ('139', '1004', '查询所有员工信息', '2015-10-13 13:20:08');
INSERT INTO `history` VALUES ('140', '1004', '查询所有员工信息', '2015-10-13 13:20:10');
INSERT INTO `history` VALUES ('141', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 13:23:29');
INSERT INTO `history` VALUES ('142', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 13:23:29');
INSERT INTO `history` VALUES ('143', '1004', '查询所有员工信息', '2015-10-13 13:23:31');
INSERT INTO `history` VALUES ('144', '1004', '查询所有员工信息', '2015-10-13 13:23:32');
INSERT INTO `history` VALUES ('145', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 13:23:35');
INSERT INTO `history` VALUES ('146', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 13:23:38');
INSERT INTO `history` VALUES ('147', '1004', '查询所有员工信息', '2015-10-13 13:23:41');
INSERT INTO `history` VALUES ('148', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 13:23:43');
INSERT INTO `history` VALUES ('149', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 13:23:45');
INSERT INTO `history` VALUES ('150', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 13:23:50');
INSERT INTO `history` VALUES ('151', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 13:23:51');
INSERT INTO `history` VALUES ('152', '1004', '1004登录成功', '2015-10-13 13:59:07');
INSERT INTO `history` VALUES ('153', '1004', '1004登录成功', '2015-10-13 14:03:34');
INSERT INTO `history` VALUES ('154', '1004', '1004查询会议记录:  type=  requests=all', '2015-10-13 14:03:49');
INSERT INTO `history` VALUES ('155', '1004', '1004添加了一条会议记录:  参加人员：1001,1002,1003  开始时间：2015-10-14 14:03:00.0  结束时间：2015-10-15 14:03:00.0', '2015-10-13 14:03:49');
INSERT INTO `history` VALUES ('156', '1004', '1004查询会议记录:  type=selectall  requests=all', '2015-10-13 14:03:55');
INSERT INTO `history` VALUES ('157', '1004', '1004查询会议记录:  type=selectall  requests=1', '2015-10-13 14:04:19');
INSERT INTO `history` VALUES ('158', '1004', '1004查询会议记录:  type=selectall  requests=1', '2015-10-13 14:04:21');
INSERT INTO `history` VALUES ('159', '1004', '1004查询会议记录:  type=selectall  requests=1', '2015-10-13 14:04:49');
INSERT INTO `history` VALUES ('160', '1004', '1004查询会议记录:  type=  requests=all', '2015-10-13 14:05:38');
INSERT INTO `history` VALUES ('161', '1004', '1004添加了一条会议记录:  参加人员：1001,1002,1003  开始时间：2015-10-14 14:06:00.0  结束时间：2015-10-16 14:04:00.0', '2015-10-13 14:05:38');
INSERT INTO `history` VALUES ('162', '1004', '1004查询会议记录:  type=  requests=all', '2015-10-13 14:05:52');
INSERT INTO `history` VALUES ('163', '1004', '1004添加了一条会议记录:  参加人员：1001,1002,1003  开始时间：2015-10-15 14:05:00.0  结束时间：2015-10-17 14:05:00.0', '2015-10-13 14:05:52');
INSERT INTO `history` VALUES ('164', '1004', '1004查询会议记录:  type=  requests=all', '2015-10-13 14:06:09');
INSERT INTO `history` VALUES ('165', '1004', '1004添加了一条会议记录:  参加人员：1001,1002,1003  开始时间：2015-10-14 14:05:00.0  结束时间：2015-10-16 14:05:00.0', '2015-10-13 14:06:09');
INSERT INTO `history` VALUES ('166', '1004', '1004查询会议记录:  type=selectall  requests=all', '2015-10-13 14:06:44');
INSERT INTO `history` VALUES ('167', '1004', '1004查询会议记录:  type=selectall  requests=1', '2015-10-13 14:06:46');
INSERT INTO `history` VALUES ('168', '1004', '1004登录成功', '2015-10-13 14:08:19');
INSERT INTO `history` VALUES ('169', '1004', '1004查询会议记录:  type=selectall  requests=all', '2015-10-13 14:08:33');
INSERT INTO `history` VALUES ('170', '1004', '1004查询会议记录:  type=selectall  requests=all', '2015-10-13 14:08:46');
INSERT INTO `history` VALUES ('171', '1004', '1004查询会议记录:  type=selectall  requests=1', '2015-10-13 14:08:48');
INSERT INTO `history` VALUES ('172', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:08:50');
INSERT INTO `history` VALUES ('173', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:38');
INSERT INTO `history` VALUES ('174', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:40');
INSERT INTO `history` VALUES ('175', '1004', '1004取消了一条会议记录:  参加人员：3  开始时间：2015-10-14 14:05:00.0  结束时间：2015-10-16 14:05:00.0', '2015-10-13 14:09:41');
INSERT INTO `history` VALUES ('176', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:41');
INSERT INTO `history` VALUES ('177', '0', '0取消了一条会议记录:  参加人员：2  开始时间：2015-10-15 01:05:00.0  结束时间：2015-10-16 01:05:00.0', '2015-10-13 14:09:42');
INSERT INTO `history` VALUES ('178', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:42');
INSERT INTO `history` VALUES ('179', '0', '0取消了一条会议记录:  参加人员：3  开始时间：2015-10-14 00:04:00.0  结束时间：2015-10-15 00:04:00.0', '2015-10-13 14:09:42');
INSERT INTO `history` VALUES ('180', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:42');
INSERT INTO `history` VALUES ('181', '0', '0取消了一条会议记录:  参加人员：3  开始时间：2015-10-14 00:39:00.0  结束时间：2015-10-15 00:39:00.0', '2015-10-13 14:09:43');
INSERT INTO `history` VALUES ('182', '0', '0查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:43');
INSERT INTO `history` VALUES ('183', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:45');
INSERT INTO `history` VALUES ('184', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:52');
INSERT INTO `history` VALUES ('185', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:53');
INSERT INTO `history` VALUES ('186', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:53');
INSERT INTO `history` VALUES ('187', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:09:54');
INSERT INTO `history` VALUES ('188', '1004', '1004登录成功', '2015-10-13 14:22:05');
INSERT INTO `history` VALUES ('189', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:22:08');
INSERT INTO `history` VALUES ('190', '1001', '1001查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:22:12');
INSERT INTO `history` VALUES ('191', '1001', '1001查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:22:17');
INSERT INTO `history` VALUES ('192', '1001', '1001查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:22:56');
INSERT INTO `history` VALUES ('193', '1001', '1001查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:23:16');
INSERT INTO `history` VALUES ('194', '1004', '1004登录成功', '2015-10-13 14:29:17');
INSERT INTO `history` VALUES ('195', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:29:19');
INSERT INTO `history` VALUES ('196', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:29:40');
INSERT INTO `history` VALUES ('197', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:30:40');
INSERT INTO `history` VALUES ('198', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:30:45');
INSERT INTO `history` VALUES ('199', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:30:46');
INSERT INTO `history` VALUES ('200', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:30:47');
INSERT INTO `history` VALUES ('201', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:30:47');
INSERT INTO `history` VALUES ('202', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:33:00');
INSERT INTO `history` VALUES ('203', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:33:02');
INSERT INTO `history` VALUES ('204', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:33:03');
INSERT INTO `history` VALUES ('205', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:33:03');
INSERT INTO `history` VALUES ('206', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:33:03');
INSERT INTO `history` VALUES ('207', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:33:03');
INSERT INTO `history` VALUES ('208', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:33:03');
INSERT INTO `history` VALUES ('209', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:33:04');
INSERT INTO `history` VALUES ('210', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:33:04');
INSERT INTO `history` VALUES ('211', '1004', '1004登录成功', '2015-10-13 14:34:51');
INSERT INTO `history` VALUES ('212', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:34:53');
INSERT INTO `history` VALUES ('213', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:35:06');
INSERT INTO `history` VALUES ('214', '1004', '1004登录成功', '2015-10-13 14:36:53');
INSERT INTO `history` VALUES ('215', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:36:58');
INSERT INTO `history` VALUES ('216', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:37:17');
INSERT INTO `history` VALUES ('217', '1004', '1004登录成功', '2015-10-13 14:39:32');
INSERT INTO `history` VALUES ('218', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:39:33');
INSERT INTO `history` VALUES ('219', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:39:43');
INSERT INTO `history` VALUES ('220', '1004', '1004查询会议记录:  type=selectall  requests=all', '2015-10-13 14:39:43');
INSERT INTO `history` VALUES ('221', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:39:48');
INSERT INTO `history` VALUES ('222', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:39:55');
INSERT INTO `history` VALUES ('223', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:40:08');
INSERT INTO `history` VALUES ('224', '1004', '1004登录成功', '2015-10-13 14:41:03');
INSERT INTO `history` VALUES ('225', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:41:04');
INSERT INTO `history` VALUES ('226', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:41:08');
INSERT INTO `history` VALUES ('227', '1004', '1004登录成功', '2015-10-13 14:45:04');
INSERT INTO `history` VALUES ('228', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:45:08');
INSERT INTO `history` VALUES ('229', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 14:45:09');
INSERT INTO `history` VALUES ('230', '1004', '查询所有员工信息', '2015-10-13 14:45:13');
INSERT INTO `history` VALUES ('231', '1004', '1004查询了会议室记录:  type=select all  request=请输入', '2015-10-13 14:45:21');
INSERT INTO `history` VALUES ('232', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 14:45:27');
INSERT INTO `history` VALUES ('233', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 14:45:32');
INSERT INTO `history` VALUES ('234', '1008', '1008注册', '2015-10-13 14:59:47');
INSERT INTO `history` VALUES ('235', '1009', '1009注册', '2015-10-13 15:06:53');
INSERT INTO `history` VALUES ('236', '1010', '1010注册', '2015-10-13 15:06:58');
INSERT INTO `history` VALUES ('237', '1011', '1011注册', '2015-10-13 15:07:00');
INSERT INTO `history` VALUES ('238', '1012', '1012注册', '2015-10-13 15:07:03');
INSERT INTO `history` VALUES ('239', '1013', '1013注册', '2015-10-13 15:14:02');
INSERT INTO `history` VALUES ('240', '1014', '1014注册', '2015-10-13 15:14:07');
INSERT INTO `history` VALUES ('241', '1015', '1015注册', '2015-10-13 15:16:36');
INSERT INTO `history` VALUES ('242', '1004', '1004登录成功', '2015-10-13 15:24:59');
INSERT INTO `history` VALUES ('243', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:25:11');
INSERT INTO `history` VALUES ('244', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:25:11');
INSERT INTO `history` VALUES ('245', '1004', '查询所有员工信息', '2015-10-13 15:25:15');
INSERT INTO `history` VALUES ('246', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 15:25:21');
INSERT INTO `history` VALUES ('247', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 15:25:25');
INSERT INTO `history` VALUES ('248', '1004', '1004登录成功', '2015-10-13 15:38:05');
INSERT INTO `history` VALUES ('249', '1004', '1004登录成功', '2015-10-13 15:39:59');
INSERT INTO `history` VALUES ('250', '1004', '1004登录成功', '2015-10-13 15:40:25');
INSERT INTO `history` VALUES ('251', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:40:43');
INSERT INTO `history` VALUES ('252', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:40:44');
INSERT INTO `history` VALUES ('253', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 15:40:46');
INSERT INTO `history` VALUES ('254', '0', '0查询器械记录:  type=select all  requests=', '2015-10-13 15:41:16');
INSERT INTO `history` VALUES ('255', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 15:41:21');
INSERT INTO `history` VALUES ('256', '1004', '1004登录成功', '2015-10-13 15:48:26');
INSERT INTO `history` VALUES ('257', '1004', '1004登录成功', '2015-10-13 15:49:12');
INSERT INTO `history` VALUES ('258', '1004', '1004登录成功', '2015-10-13 15:49:47');
INSERT INTO `history` VALUES ('259', '1004', '1004登录成功', '2015-10-13 15:50:21');
INSERT INTO `history` VALUES ('260', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 15:50:23');
INSERT INTO `history` VALUES ('261', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:50:34');
INSERT INTO `history` VALUES ('262', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:50:36');
INSERT INTO `history` VALUES ('263', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:50:36');
INSERT INTO `history` VALUES ('264', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:50:36');
INSERT INTO `history` VALUES ('265', '1004', '1004登录成功', '2015-10-13 15:51:07');
INSERT INTO `history` VALUES ('266', '1004', '1004登录成功', '2015-10-13 15:51:28');
INSERT INTO `history` VALUES ('267', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:51:31');
INSERT INTO `history` VALUES ('268', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:51:36');
INSERT INTO `history` VALUES ('269', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:51:38');
INSERT INTO `history` VALUES ('270', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:51:38');
INSERT INTO `history` VALUES ('271', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:51:52');
INSERT INTO `history` VALUES ('272', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:52:01');
INSERT INTO `history` VALUES ('273', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:52:01');
INSERT INTO `history` VALUES ('274', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:52:04');
INSERT INTO `history` VALUES ('275', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:52:12');
INSERT INTO `history` VALUES ('276', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:52:13');
INSERT INTO `history` VALUES ('277', '1004', '查询所有员工信息', '2015-10-13 15:52:14');
INSERT INTO `history` VALUES ('278', '1004', '查询所有员工信息', '2015-10-13 15:52:15');
INSERT INTO `history` VALUES ('279', '1004', '查询所有员工信息', '2015-10-13 15:52:16');
INSERT INTO `history` VALUES ('280', '1004', '查询所有员工信息', '2015-10-13 15:52:16');
INSERT INTO `history` VALUES ('281', '1004', '查询所有员工信息', '2015-10-13 15:52:16');
INSERT INTO `history` VALUES ('282', '1004', '查询所有员工信息', '2015-10-13 15:52:37');
INSERT INTO `history` VALUES ('283', '1004', '查询所有员工信息', '2015-10-13 15:52:41');
INSERT INTO `history` VALUES ('284', '1004', '查询所有员工信息', '2015-10-13 15:52:43');
INSERT INTO `history` VALUES ('285', '1004', '1004查询了会议室记录:  type=select all  request=请输入', '2015-10-13 15:52:52');
INSERT INTO `history` VALUES ('286', '1004', '1004查询了会议室记录:  type=select all  request=请输入', '2015-10-13 15:53:12');
INSERT INTO `history` VALUES ('287', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 15:53:17');
INSERT INTO `history` VALUES ('288', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 15:53:19');
INSERT INTO `history` VALUES ('289', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 15:53:21');
INSERT INTO `history` VALUES ('290', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 15:53:37');
INSERT INTO `history` VALUES ('291', '1004', '1004登录成功', '2015-10-13 15:54:59');
INSERT INTO `history` VALUES ('292', '1004', '1004登录成功', '2015-10-13 15:55:35');
INSERT INTO `history` VALUES ('293', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:55:39');
INSERT INTO `history` VALUES ('294', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:55:40');
INSERT INTO `history` VALUES ('295', '1004', '查询所有员工信息', '2015-10-13 15:55:41');
INSERT INTO `history` VALUES ('296', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 15:55:43');
INSERT INTO `history` VALUES ('297', '1004', '查询所有员工信息', '2015-10-13 15:56:07');
INSERT INTO `history` VALUES ('298', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:56:09');
INSERT INTO `history` VALUES ('299', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:56:19');
INSERT INTO `history` VALUES ('300', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:56:20');
INSERT INTO `history` VALUES ('301', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 15:56:21');
INSERT INTO `history` VALUES ('302', '1004', '查询所有员工信息', '2015-10-13 15:56:22');
INSERT INTO `history` VALUES ('303', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 15:56:23');
INSERT INTO `history` VALUES ('304', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 15:56:26');
INSERT INTO `history` VALUES ('305', '1004', '1004登录成功', '2015-10-13 16:18:00');
INSERT INTO `history` VALUES ('306', '1004', '1004登录成功', '2015-10-13 16:19:01');
INSERT INTO `history` VALUES ('307', '1004', '1004登录成功', '2015-10-13 16:19:44');
INSERT INTO `history` VALUES ('308', '1004', '1004登录成功', '2015-10-13 16:21:18');
INSERT INTO `history` VALUES ('309', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 16:21:52');
INSERT INTO `history` VALUES ('310', '1004', '1004登录成功', '2015-10-13 16:23:14');
INSERT INTO `history` VALUES ('311', '1004', '1004登录成功', '2015-10-13 16:23:26');
INSERT INTO `history` VALUES ('312', '1004', '1004登录成功', '2015-10-13 16:25:49');
INSERT INTO `history` VALUES ('313', '1004', '1004登录成功', '2015-10-13 16:25:59');
INSERT INTO `history` VALUES ('314', '1004', '1004登录成功', '2015-10-13 16:26:47');
INSERT INTO `history` VALUES ('315', '1004', '1004登录成功', '2015-10-13 16:26:57');
INSERT INTO `history` VALUES ('316', '1004', '查询所有员工信息', '2015-10-13 16:27:44');
INSERT INTO `history` VALUES ('317', '1004', '1004登录成功', '2015-10-13 16:30:06');
INSERT INTO `history` VALUES ('318', '1004', '1004登录成功', '2015-10-13 16:31:30');
INSERT INTO `history` VALUES ('319', '1004', '1004登录成功', '2015-10-13 16:31:59');
INSERT INTO `history` VALUES ('320', '1004', '查询所有员工信息', '2015-10-13 16:34:21');
INSERT INTO `history` VALUES ('321', '1004', '1004登录成功', '2015-10-13 16:35:22');
INSERT INTO `history` VALUES ('322', '1004', '查询所有员工信息', '2015-10-13 16:35:25');
INSERT INTO `history` VALUES ('323', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 16:35:35');
INSERT INTO `history` VALUES ('324', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 16:35:43');
INSERT INTO `history` VALUES ('325', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 16:35:44');
INSERT INTO `history` VALUES ('326', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 16:35:45');
INSERT INTO `history` VALUES ('327', '1004', '查询所有员工信息', '2015-10-13 16:35:47');
INSERT INTO `history` VALUES ('328', '1004', '查询所有员工信息', '2015-10-13 16:35:48');
INSERT INTO `history` VALUES ('329', '1004', '查询所有员工信息', '2015-10-13 16:35:50');
INSERT INTO `history` VALUES ('330', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 16:40:13');
INSERT INTO `history` VALUES ('331', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 16:40:15');
INSERT INTO `history` VALUES ('332', '1004', '1004查询器械记录:  type=select all  requests=', '2015-10-13 16:40:24');
INSERT INTO `history` VALUES ('333', '1004', '1004查询了会议室记录:  type=select all  request=aa', '2015-10-13 16:40:26');
INSERT INTO `history` VALUES ('334', '1004', '1004查询会议记录:  type=meeting_status  requests=1', '2015-10-13 16:40:28');
INSERT INTO `history` VALUES ('335', '1004', '1004登录成功', '2015-10-13 16:41:07');
INSERT INTO `history` VALUES ('336', '1004', '查询所有员工信息', '2015-10-13 16:41:15');
INSERT INTO `history` VALUES ('337', '1004', '查询所有员工信息', '2015-10-13 16:41:17');
INSERT INTO `history` VALUES ('338', '1004', '1004登录成功', '2015-10-13 16:44:06');
INSERT INTO `history` VALUES ('339', '1004', '1004登录成功', '2015-10-13 16:45:00');
INSERT INTO `history` VALUES ('340', '1004', '1004登录成功', '2015-10-13 16:45:14');
INSERT INTO `history` VALUES ('341', '1004', '1004登录成功', '2015-10-13 16:45:38');
INSERT INTO `history` VALUES ('342', '1004', '1004登录成功', '2015-10-13 16:46:16');
INSERT INTO `history` VALUES ('343', '1004', '1004登录成功', '2015-10-13 16:47:09');
INSERT INTO `history` VALUES ('344', '1004', '1004登录成功', '2015-10-13 16:48:09');
INSERT INTO `history` VALUES ('345', '1004', '1004登录成功', '2015-10-13 16:48:26');
INSERT INTO `history` VALUES ('346', '1004', '1004登录成功', '2015-10-13 16:48:45');
INSERT INTO `history` VALUES ('347', '1004', '1004登录成功', '2015-10-13 16:49:05');
INSERT INTO `history` VALUES ('348', '1004', '1004登录成功', '2015-10-13 16:49:34');
INSERT INTO `history` VALUES ('349', '1004', '1004登录成功', '2015-10-13 16:49:49');
INSERT INTO `history` VALUES ('350', '1004', '1004登录成功', '2015-10-13 16:50:05');
INSERT INTO `history` VALUES ('351', '1004', '1004登录成功', '2015-10-13 16:52:06');
INSERT INTO `history` VALUES ('352', '1004', '1004登录成功', '2015-10-13 16:52:58');
INSERT INTO `history` VALUES ('353', '1004', '1004登录成功', '2015-10-13 16:53:21');
INSERT INTO `history` VALUES ('354', '1004', '1004登录成功', '2015-10-13 16:54:06');
INSERT INTO `history` VALUES ('355', '1004', '1004登录成功', '2015-10-13 16:55:49');
INSERT INTO `history` VALUES ('356', '1004', '1004登录成功', '2015-10-13 16:56:22');
INSERT INTO `history` VALUES ('357', '1004', '1004登录成功', '2015-10-13 16:56:34');
INSERT INTO `history` VALUES ('358', '1004', '1004登录成功', '2015-10-13 16:57:14');
INSERT INTO `history` VALUES ('359', '1004', '1004登录成功', '2015-10-13 16:59:45');
INSERT INTO `history` VALUES ('360', '1004', '1004登录成功', '2015-10-13 17:01:11');
INSERT INTO `history` VALUES ('361', '1004', '1004登录成功', '2015-10-13 17:01:46');
INSERT INTO `history` VALUES ('362', '1004', '1004登录成功', '2015-10-13 17:02:08');
INSERT INTO `history` VALUES ('363', '1004', '1004登录成功', '2015-10-13 17:03:42');
INSERT INTO `history` VALUES ('364', '1004', '1004登录成功', '2015-10-13 17:04:13');
INSERT INTO `history` VALUES ('365', '1004', '1004登录成功', '2015-10-13 17:04:45');
INSERT INTO `history` VALUES ('366', '1004', '1004登录成功', '2015-10-13 17:08:07');
INSERT INTO `history` VALUES ('367', '1004', '1004登录成功', '2015-10-13 17:08:33');
INSERT INTO `history` VALUES ('368', '1004', '1004登录成功', '2015-10-13 17:09:58');
INSERT INTO `history` VALUES ('369', '1004', '1004登录成功', '2015-10-13 17:15:25');
INSERT INTO `history` VALUES ('370', '1004', '1004登录成功', '2015-10-13 17:17:28');
INSERT INTO `history` VALUES ('371', '1004', '1004登录成功', '2015-10-13 17:18:39');
INSERT INTO `history` VALUES ('372', '1004', '1004登录成功', '2015-10-13 17:20:14');

-- ----------------------------
-- Table structure for `meeting`
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
  `meet_id` int(6) NOT NULL AUTO_INCREMENT,
  `meet_name` char(15) NOT NULL,
  `meetroom_id` int(3) NOT NULL,
  `meetemp_id` int(1) NOT NULL,
  `meet_participants` int(3) NOT NULL,
  `meet_starttime` datetime NOT NULL,
  `meet_endtime` datetime NOT NULL,
  `meet_status` int(1) NOT NULL,
  PRIMARY KEY (`meet_id`),
  KEY `emp_id` (`meet_id`),
  KEY `meet_status` (`meet_status`),
  KEY `meetroom_id` (`meetroom_id`),
  KEY `meetemp_id` (`meetemp_id`),
  CONSTRAINT `meetemp_id` FOREIGN KEY (`meetemp_id`) REFERENCES `emp` (`emp_id`),
  CONSTRAINT `meetroom_id` FOREIGN KEY (`meetroom_id`) REFERENCES `meetingroom` (`room_id`),
  CONSTRAINT `meet_status` FOREIGN KEY (`meet_status`) REFERENCES `meetingstatus` (`meetingstatus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES ('1', '是是是', '2', '1001', '2', '2015-10-15 01:05:00', '2015-10-16 01:05:00', '4');
INSERT INTO `meeting` VALUES ('2', '啊啊', '2', '1002', '3', '2015-10-08 20:37:49', '2015-10-16 20:37:53', '4');
INSERT INTO `meeting` VALUES ('3', '实验三', '1', '1004', '3', '2015-10-14 00:04:00', '2015-10-15 00:04:00', '4');
INSERT INTO `meeting` VALUES ('4', '今天', '1', '1004', '3', '2015-10-14 00:39:00', '2015-10-15 00:39:00', '4');
INSERT INTO `meeting` VALUES ('5', '阿萨德', '1', '1004', '3', '2015-10-14 00:42:00', '2015-10-15 00:42:00', '1');
INSERT INTO `meeting` VALUES ('6', '你好', '1', '1004', '3', '2015-10-14 00:44:00', '2015-10-15 00:44:00', '4');
INSERT INTO `meeting` VALUES ('7', '实验三', '1', '1004', '3', '2015-10-14 01:04:00', '2015-10-15 01:04:00', '1');
INSERT INTO `meeting` VALUES ('8', '研发111', '1', '1004', '3', '2015-10-14 14:03:00', '2015-10-15 14:03:00', '1');
INSERT INTO `meeting` VALUES ('9', '121212', '1', '1004', '3', '2015-10-14 14:06:00', '2015-10-16 14:04:00', '1');
INSERT INTO `meeting` VALUES ('10', '教学', '1', '1004', '3', '2015-10-15 14:05:00', '2015-10-17 14:05:00', '1');
INSERT INTO `meeting` VALUES ('11', '实验三', '1', '1004', '3', '2015-10-14 14:05:00', '2015-10-16 14:05:00', '4');

-- ----------------------------
-- Table structure for `meetingroom`
-- ----------------------------
DROP TABLE IF EXISTS `meetingroom`;
CREATE TABLE `meetingroom` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` char(10) NOT NULL,
  `room_space` int(11) NOT NULL,
  `roomstatus_id` int(1) NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `roomstatus_id` (`roomstatus_id`),
  CONSTRAINT `roomstatus_id` FOREIGN KEY (`roomstatus_id`) REFERENCES `roomstatus` (`roomstatus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meetingroom
-- ----------------------------
INSERT INTO `meetingroom` VALUES ('1', '你猜', '55', '1');
INSERT INTO `meetingroom` VALUES ('2', '梅花', '21', '1');
INSERT INTO `meetingroom` VALUES ('3', '逸夫楼', '33', '1');
INSERT INTO `meetingroom` VALUES ('4', '中软', '22', '1');
INSERT INTO `meetingroom` VALUES ('7', '梅花教室', '123', '1');

-- ----------------------------
-- Table structure for `meetingstatus`
-- ----------------------------
DROP TABLE IF EXISTS `meetingstatus`;
CREATE TABLE `meetingstatus` (
  `meetingstatus_id` int(1) NOT NULL AUTO_INCREMENT,
  `meetingstatus_name` char(10) NOT NULL,
  PRIMARY KEY (`meetingstatus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meetingstatus
-- ----------------------------
INSERT INTO `meetingstatus` VALUES ('1', '预订中');
INSERT INTO `meetingstatus` VALUES ('2', '正在进行');
INSERT INTO `meetingstatus` VALUES ('3', '会议完成');
INSERT INTO `meetingstatus` VALUES ('4', '取消预订');

-- ----------------------------
-- Table structure for `participants`
-- ----------------------------
DROP TABLE IF EXISTS `participants`;
CREATE TABLE `participants` (
  `participants _id` int(11) NOT NULL AUTO_INCREMENT,
  `meet_id` int(1) NOT NULL,
  `participant_id` int(5) NOT NULL,
  PRIMARY KEY (`participants _id`),
  KEY `meet_id` (`meet_id`),
  KEY `participant_id` (`participant_id`),
  CONSTRAINT `meet_id` FOREIGN KEY (`meet_id`) REFERENCES `meeting` (`meet_id`),
  CONSTRAINT `participant_id` FOREIGN KEY (`participant_id`) REFERENCES `emp` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participants
-- ----------------------------
INSERT INTO `participants` VALUES ('1', '3', '1001');
INSERT INTO `participants` VALUES ('2', '3', '1002');
INSERT INTO `participants` VALUES ('4', '4', '1001');
INSERT INTO `participants` VALUES ('5', '4', '1002');
INSERT INTO `participants` VALUES ('7', '5', '1001');
INSERT INTO `participants` VALUES ('8', '5', '1002');
INSERT INTO `participants` VALUES ('10', '6', '1001');
INSERT INTO `participants` VALUES ('11', '6', '1002');
INSERT INTO `participants` VALUES ('13', '7', '1001');
INSERT INTO `participants` VALUES ('14', '7', '1002');
INSERT INTO `participants` VALUES ('15', '8', '1001');
INSERT INTO `participants` VALUES ('16', '8', '1002');
INSERT INTO `participants` VALUES ('17', '8', '1003');
INSERT INTO `participants` VALUES ('18', '9', '1001');
INSERT INTO `participants` VALUES ('19', '9', '1002');
INSERT INTO `participants` VALUES ('20', '9', '1003');
INSERT INTO `participants` VALUES ('21', '10', '1001');
INSERT INTO `participants` VALUES ('22', '10', '1002');
INSERT INTO `participants` VALUES ('23', '10', '1003');
INSERT INTO `participants` VALUES ('24', '11', '1001');
INSERT INTO `participants` VALUES ('25', '11', '1002');
INSERT INTO `participants` VALUES ('26', '11', '1003');

-- ----------------------------
-- Table structure for `roomstatus`
-- ----------------------------
DROP TABLE IF EXISTS `roomstatus`;
CREATE TABLE `roomstatus` (
  `roomstatus_id` int(1) NOT NULL AUTO_INCREMENT,
  `roomstatus_name` char(6) NOT NULL,
  PRIMARY KEY (`roomstatus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomstatus
-- ----------------------------
INSERT INTO `roomstatus` VALUES ('1', '会议室空闲中');
INSERT INTO `roomstatus` VALUES ('2', '会议室被停用');
