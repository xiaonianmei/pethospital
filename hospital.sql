/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : hospital

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2018-05-26 16:03:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hospital`
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `id` bigint(20) NOT NULL auto_increment,
  `chcek` varchar(255) default NULL,
  `illness` varchar(255) default NULL,
  `suggestion` varchar(255) default NULL,
  `pet_type` varchar(255) default NULL,
  `age` int(3) default NULL,
  `predict_id` bigint(20) default NULL,
  `doctor_id` bigint(20) default NULL,
  `medical` varchar(255) default NULL,
  `create_time` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hospital
-- ----------------------------
INSERT INTO `hospital` VALUES ('1', '食物过量不消化导致拉稀', '拉肚子', '吃点清淡', '普通犬', '3', '1', '2', '止泻药', '2018-05-13 22:17:04');
INSERT INTO `hospital` VALUES ('2', '皮肤溃烂', '皮肤过敏', '多喝热水', '大型犬', '1', '17', '2', '达克宁', '2018-05-13 22:38:12');
INSERT INTO `hospital` VALUES ('3', '酌量', '风寒', '多喝热水', '大型犬', '1', '14', '2', '999', '2018-05-15 06:46:01');

-- ----------------------------
-- Table structure for `predict`
-- ----------------------------
DROP TABLE IF EXISTS `predict`;
CREATE TABLE `predict` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) default NULL,
  `doctor_id` bigint(20) default NULL,
  `predict_time` timestamp NULL default NULL,
  `create_time` timestamp NULL default NULL,
  `statu` int(1) default NULL COMMENT '0 未加急  1 加急',
  `deal` int(1) default NULL COMMENT '0 未就诊  1 已就诊',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of predict
-- ----------------------------
INSERT INTO `predict` VALUES ('1', '1', '3', '2018-05-11 17:47:44', '2018-05-11 17:47:47', '0', '0');
INSERT INTO `predict` VALUES ('2', '1', '3', '2018-05-11 17:47:44', '2018-05-11 17:47:47', '0', '0');
INSERT INTO `predict` VALUES ('11', '1', '3', '2018-05-11 17:47:44', '2018-05-11 17:47:47', '0', '1');
INSERT INTO `predict` VALUES ('12', '1', '2', '2018-05-13 09:03:00', '2018-05-13 07:05:03', '0', '1');
INSERT INTO `predict` VALUES ('13', '1', '2', '2018-05-15 14:07:00', '2018-05-13 07:06:54', '0', '0');
INSERT INTO `predict` VALUES ('14', '1', '2', '2018-05-13 13:01:00', '2018-05-13 07:17:51', '0', '1');
INSERT INTO `predict` VALUES ('15', '1', '3', '2018-06-13 09:01:00', '2018-05-13 07:21:07', '0', '1');
INSERT INTO `predict` VALUES ('16', '1', '2', '2018-05-13 00:01:00', '2018-05-13 07:22:36', '1', '1');
INSERT INTO `predict` VALUES ('17', '1', '2', '2018-06-13 09:01:00', '2018-05-13 20:39:56', '1', '1');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `desription` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '牙周炎', '症状:口臭，流涎，齿龈红，肿胀，变软，萎缩，牙根暴露，牙齿松动\r\n\r\n防治方法:在麻醉状态下清除牙斑和结石及食物残渣。注意清除齿缘下齿根表面（即齿周袋内）的牙斑和结石。尽可能磨光所有的齿面，防止斑和结石再聚积和粘合。拔除松动的牙齿。对于久治不愈的顽固性牙周炎，应将有关牙齿拔除。若齿龈肥大可用电烧烙除去过多的组织。术后涂以碘甘油。全身应用抗生素、复合维生素B、烟酸等。要经常进行口腔和齿的检查，用纱布定期清理牙垢。饲喂固体食物。给予大的骨头或大咬胶等，以锻炼牙齿和齿龈。');
INSERT INTO `question` VALUES ('2', '狂犬病', '病症：不听叫唤瘙痒过度兴奋狂叫攻击消瘦行为异常转圈撞墙流涎四肢麻痹倒地\r\n防治：典型病例根据临床症状，结合咬伤病史，可作出初步诊断。病原学检查：对疑似狂犬病的动物，取其脑组织、唾液腺或皮肤等标本，直接检测其中的狂犬病病毒，是确诊狂犬病的重要手段。血清学检查：检测感染犬血清中的狂犬病病毒抗体。目前没有有效药物治疗，动物主人一定要按免疫程序定期给狗狗注射狂犬病疫苗。');

-- ----------------------------
-- Table structure for `quick`
-- ----------------------------
DROP TABLE IF EXISTS `quick`;
CREATE TABLE `quick` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) default NULL,
  `describe` varchar(255) default NULL,
  `doctor_id` bigint(20) default NULL,
  `suggestion` varchar(255) default NULL,
  `create_time` timestamp NULL default NULL,
  `res_time` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  `title` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quick
-- ----------------------------
INSERT INTO `quick` VALUES ('1', '1', '感冒发烧', '3', '喝点好喝的', '2018-05-11 14:03:37', '2018-05-13 08:00:07', '感冒发烧');
INSERT INTO `quick` VALUES ('2', '1', '感冒发烧', null, null, '2018-05-11 14:03:37', '2018-05-13 08:03:37', '感冒发烧');
INSERT INTO `quick` VALUES ('3', '1', '拉稀', '2', '风寒所致', '2018-05-13 09:19:43', '2018-05-14 22:43:04', '拉稀');
INSERT INTO `quick` VALUES ('4', '1', '拉稀和感冒啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2', 'd多喝热水', '2018-05-13 09:21:44', '2018-05-15 06:44:53', '拉稀和感冒');
INSERT INTO `quick` VALUES ('5', '1', '拉宾   一岁半     半夜拉肚子  很稀    ', null, null, '2018-05-13 20:40:48', null, '宠物拉肚子');

-- ----------------------------
-- Table structure for `t_sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log` (
  `id` int(11) NOT NULL auto_increment COMMENT '自增ID',
  `account` varchar(50) default NULL COMMENT '账号',
  `title` varchar(40) default NULL COMMENT '标题',
  `methods` varchar(128) default NULL COMMENT '执行的方法',
  `message` varchar(255) default NULL COMMENT '消息',
  `ip` varchar(15) default NULL COMMENT 'IP',
  `duration` smallint(5) default NULL COMMENT '执行时间',
  `params` longtext COMMENT '请求参数',
  `url` varchar(255) default NULL COMMENT '请求地址',
  `gmt_create` datetime default NULL COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
INSERT INTO `t_sys_log` VALUES ('1', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '4', null, '/sys/log/list', '2018-03-09 09:26:07', '2018-03-09 09:26:07');
INSERT INTO `t_sys_log` VALUES ('2', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '24', null, '/sys/menu/save', '2018-03-09 10:28:40', '2018-03-09 10:28:40');
INSERT INTO `t_sys_log` VALUES ('3', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '7', null, '/sys/log/list', '2018-03-09 10:29:11', '2018-03-09 10:29:11');
INSERT INTO `t_sys_log` VALUES ('4', 'admin', '角色管理', '保存角色', '添加/修改角色信息', '192.168.152.1', '11', null, '/sys/role/save', '2018-03-09 10:29:47', '2018-03-09 10:29:47');
INSERT INTO `t_sys_log` VALUES ('5', 'admin', '用户管理', '保存用户', '添加/修改用户信息', '192.168.152.1', '18', null, '/sys/manager/save', '2018-03-09 10:31:09', '2018-03-09 10:31:09');
INSERT INTO `t_sys_log` VALUES ('6', '123', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '17', null, '/sys/menu/save', '2018-03-09 10:34:39', '2018-03-09 10:34:39');
INSERT INTO `t_sys_log` VALUES ('7', '123', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '15', null, '/sys/menu/save', '2018-03-09 10:34:52', '2018-03-09 10:34:52');
INSERT INTO `t_sys_log` VALUES ('8', '123', '菜单管理', '移除菜单', '删除菜单信息', '192.168.152.1', '8', null, '/sys/menu/remove', '2018-03-09 10:35:27', '2018-03-09 10:35:27');
INSERT INTO `t_sys_log` VALUES ('9', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '11', null, '/sys/menu/save', '2018-03-09 11:17:30', '2018-03-09 11:17:30');
INSERT INTO `t_sys_log` VALUES ('10', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '12', null, '/sys/menu/save', '2018-03-09 11:18:15', '2018-03-09 11:18:15');
INSERT INTO `t_sys_log` VALUES ('11', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '15', null, '/sys/menu/save', '2018-03-09 11:19:57', '2018-03-09 11:19:57');
INSERT INTO `t_sys_log` VALUES ('12', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '15', null, '/sys/menu/save', '2018-03-09 11:21:26', '2018-03-09 11:21:26');
INSERT INTO `t_sys_log` VALUES ('13', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '8', null, '/sys/menu/save', '2018-03-09 11:21:43', '2018-03-09 11:21:43');
INSERT INTO `t_sys_log` VALUES ('14', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '13', null, '/sys/menu/save', '2018-03-09 11:22:16', '2018-03-09 11:22:16');
INSERT INTO `t_sys_log` VALUES ('15', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '12', null, '/sys/menu/save', '2018-03-09 11:28:29', '2018-03-09 11:28:29');
INSERT INTO `t_sys_log` VALUES ('16', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '10', null, '/sys/menu/save', '2018-03-09 11:29:34', '2018-03-09 11:29:34');
INSERT INTO `t_sys_log` VALUES ('17', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '12', null, '/sys/menu/save', '2018-03-09 11:33:21', '2018-03-09 11:33:21');
INSERT INTO `t_sys_log` VALUES ('18', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '0', null, '/sys/log/list', '2018-03-09 11:33:58', '2018-03-09 11:33:58');
INSERT INTO `t_sys_log` VALUES ('19', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '8', null, '/sys/menu/save', '2018-03-09 11:34:49', '2018-03-09 11:34:49');
INSERT INTO `t_sys_log` VALUES ('20', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '12', null, '/sys/menu/save', '2018-03-09 11:35:59', '2018-03-09 11:35:59');
INSERT INTO `t_sys_log` VALUES ('21', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '16', null, '/sys/menu/save', '2018-03-09 11:36:26', '2018-03-09 11:36:26');
INSERT INTO `t_sys_log` VALUES ('22', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '13', null, '/sys/menu/save', '2018-03-09 11:37:25', '2018-03-09 11:37:25');
INSERT INTO `t_sys_log` VALUES ('23', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '9', null, '/sys/menu/save', '2018-03-09 11:37:48', '2018-03-09 11:37:48');
INSERT INTO `t_sys_log` VALUES ('24', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '9', null, '/sys/menu/save', '2018-03-09 11:40:31', '2018-03-09 11:40:31');
INSERT INTO `t_sys_log` VALUES ('25', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '19', null, '/sys/menu/save', '2018-03-09 11:40:40', '2018-03-09 11:40:40');
INSERT INTO `t_sys_log` VALUES ('26', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '12', null, '/sys/operate/save', '2018-03-09 11:49:31', '2018-03-09 11:49:31');
INSERT INTO `t_sys_log` VALUES ('27', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '7', null, '/sys/operate/save', '2018-03-09 11:50:24', '2018-03-09 11:50:24');
INSERT INTO `t_sys_log` VALUES ('28', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '8', null, '/sys/operate/save', '2018-03-09 11:51:25', '2018-03-09 11:51:25');
INSERT INTO `t_sys_log` VALUES ('29', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '11', null, '/sys/operate/save', '2018-03-09 11:52:23', '2018-03-09 11:52:23');
INSERT INTO `t_sys_log` VALUES ('30', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '4', null, '/sys/operate/save', '2018-03-09 11:53:48', '2018-03-09 11:53:48');
INSERT INTO `t_sys_log` VALUES ('31', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '6', null, '/sys/operate/save', '2018-03-09 11:54:22', '2018-03-09 11:54:22');
INSERT INTO `t_sys_log` VALUES ('32', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '6', null, '/sys/operate/save', '2018-03-09 11:54:40', '2018-03-09 11:54:40');
INSERT INTO `t_sys_log` VALUES ('33', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '6', null, '/sys/operate/save', '2018-03-09 11:54:59', '2018-03-09 11:54:59');
INSERT INTO `t_sys_log` VALUES ('34', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '8', null, '/sys/operate/save', '2018-03-09 11:55:05', '2018-03-09 11:55:05');
INSERT INTO `t_sys_log` VALUES ('35', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '8', null, '/sys/operate/save', '2018-03-09 11:55:41', '2018-03-09 11:55:41');
INSERT INTO `t_sys_log` VALUES ('36', 'admin', '操作管理', '移除操作', '删除操作信息', '192.168.152.1', '12', null, '/sys/operate/remove', '2018-03-09 13:32:26', '2018-03-09 13:32:26');
INSERT INTO `t_sys_log` VALUES ('37', 'admin', '操作管理', '移除操作', '删除操作信息', '192.168.152.1', '15', null, '/sys/operate/remove', '2018-03-09 13:32:32', '2018-03-09 13:32:32');
INSERT INTO `t_sys_log` VALUES ('38', 'admin', '菜单管理', '移除菜单', '删除菜单信息', '192.168.152.1', '0', null, '/sys/menu/remove', '2018-03-09 13:32:41', '2018-03-09 13:32:41');
INSERT INTO `t_sys_log` VALUES ('39', 'admin', '菜单管理', '移除菜单', '删除菜单信息', '192.168.152.1', '9', null, '/sys/menu/remove', '2018-03-09 13:32:58', '2018-03-09 13:32:58');
INSERT INTO `t_sys_log` VALUES ('40', 'admin', '菜单管理', '移除菜单', '删除菜单信息', '192.168.152.1', '11', null, '/sys/menu/remove', '2018-03-09 13:33:05', '2018-03-09 13:33:05');
INSERT INTO `t_sys_log` VALUES ('41', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '16', null, '/sys/menu/save', '2018-03-09 13:35:24', '2018-03-09 13:35:24');
INSERT INTO `t_sys_log` VALUES ('42', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '11', null, '/sys/menu/save', '2018-03-09 13:36:08', '2018-03-09 13:36:08');
INSERT INTO `t_sys_log` VALUES ('43', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.152.1', '15', null, '/sys/menu/save', '2018-03-09 13:37:51', '2018-03-09 13:37:51');
INSERT INTO `t_sys_log` VALUES ('44', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '8', null, '/sys/operate/save', '2018-03-09 13:40:04', '2018-03-09 13:40:04');
INSERT INTO `t_sys_log` VALUES ('45', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '11', null, '/sys/operate/save', '2018-03-09 13:40:59', '2018-03-09 13:40:59');
INSERT INTO `t_sys_log` VALUES ('46', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '4', null, '/sys/log/list', '2018-03-09 15:16:08', '2018-03-09 15:16:08');
INSERT INTO `t_sys_log` VALUES ('47', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '0', null, '/sys/log/list', '2018-03-09 15:35:11', '2018-03-09 15:35:11');
INSERT INTO `t_sys_log` VALUES ('48', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '10', null, '/sys/operate/save', '2018-03-09 18:41:02', '2018-03-09 18:41:02');
INSERT INTO `t_sys_log` VALUES ('49', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '7', null, '/sys/operate/save', '2018-03-09 18:41:31', '2018-03-09 18:41:31');
INSERT INTO `t_sys_log` VALUES ('50', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '5', null, '/sys/operate/save', '2018-03-09 18:41:45', '2018-03-09 18:41:45');
INSERT INTO `t_sys_log` VALUES ('51', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '5', null, '/sys/operate/save', '2018-03-09 18:42:04', '2018-03-09 18:42:04');
INSERT INTO `t_sys_log` VALUES ('52', 'admin', '操作管理', '移除操作', '删除操作信息', '192.168.152.1', '10', null, '/sys/operate/remove', '2018-03-09 18:42:22', '2018-03-09 18:42:22');
INSERT INTO `t_sys_log` VALUES ('53', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '8', null, '/sys/operate/save', '2018-03-09 18:42:55', '2018-03-09 18:42:55');
INSERT INTO `t_sys_log` VALUES ('54', 'admin', '平台模块', '平台list', '进入平台查询的页面', '192.168.152.1', '5', null, '/baseInfo/information/list', '2018-03-12 09:51:04', '2018-03-12 09:51:04');
INSERT INTO `t_sys_log` VALUES ('55', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '8', null, '/sys/log/list', '2018-03-12 11:34:47', '2018-03-12 11:34:47');
INSERT INTO `t_sys_log` VALUES ('56', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '11', null, '/sys/operate/save', '2018-03-12 11:45:36', '2018-03-12 11:45:36');
INSERT INTO `t_sys_log` VALUES ('57', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '9', null, '/sys/log/list', '2018-03-12 11:45:53', '2018-03-12 11:45:53');
INSERT INTO `t_sys_log` VALUES ('58', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '11', null, '/sys/operate/save', '2018-03-12 11:46:07', '2018-03-12 11:46:07');
INSERT INTO `t_sys_log` VALUES ('59', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '7', null, '/sys/operate/save', '2018-03-12 11:47:08', '2018-03-12 11:47:08');
INSERT INTO `t_sys_log` VALUES ('60', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '8', null, '/sys/operate/save', '2018-03-12 11:47:27', '2018-03-12 11:47:27');
INSERT INTO `t_sys_log` VALUES ('78', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.220.1', '8', null, '/sys/log/list', null, '2018-03-13 09:53:11');
INSERT INTO `t_sys_log` VALUES ('79', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.220.1', '43', null, '/sys/operate/save', null, '2018-03-13 09:57:56');
INSERT INTO `t_sys_log` VALUES ('80', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.220.1', '42', null, '/sys/operate/save', null, '2018-03-13 09:59:06');
INSERT INTO `t_sys_log` VALUES ('81', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.220.1', '45', null, '/sys/operate/save', null, '2018-03-13 10:00:46');
INSERT INTO `t_sys_log` VALUES ('82', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.220.1', '45', null, '/sys/operate/save', null, '2018-03-13 10:01:21');
INSERT INTO `t_sys_log` VALUES ('83', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.220.1', '63', null, '/sys/menu/save', null, '2018-03-13 10:57:05');
INSERT INTO `t_sys_log` VALUES ('84', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.220.1', '42', null, '/sys/operate/save', null, '2018-03-13 10:58:01');
INSERT INTO `t_sys_log` VALUES ('85', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.220.1', '5', null, '/sys/log/list', null, '2018-03-13 14:47:52');
INSERT INTO `t_sys_log` VALUES ('86', 'admin', '角色管理', '保存角色', '添加/修改角色信息', '192.168.220.1', '35', null, '/sys/role/save', null, '2018-03-13 14:49:20');
INSERT INTO `t_sys_log` VALUES ('87', 'admin', '角色管理', '移除角色', '删除角色信息', '192.168.220.1', '54', null, '/sys/role/remove', null, '2018-03-13 14:49:29');
INSERT INTO `t_sys_log` VALUES ('88', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.220.1', '2', null, '/sys/log/list', null, '2018-03-13 15:52:44');
INSERT INTO `t_sys_log` VALUES ('89', 'admin', '菜单管理', '保存菜单', '添加/修改菜单信息', '192.168.220.1', '66', null, '/sys/menu/save', null, '2018-03-13 16:11:44');
INSERT INTO `t_sys_log` VALUES ('90', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.220.1', '36', null, '/sys/operate/save', null, '2018-03-13 16:12:03');
INSERT INTO `t_sys_log` VALUES ('91', 'admin', '角色管理', '保存角色', '添加/修改角色信息', '192.168.220.1', '54', null, '/sys/role/save', null, '2018-03-13 16:12:14');
INSERT INTO `t_sys_log` VALUES ('92', 'admin', '用户管理', '保存用户', '添加/修改用户信息', '192.168.220.1', '38', null, '/sys/manager/save', null, '2018-03-13 16:12:33');
INSERT INTO `t_sys_log` VALUES ('93', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.220.1', '8', null, '/sys/log/list', null, '2018-03-13 16:12:45');
INSERT INTO `t_sys_log` VALUES ('94', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.220.1', '2', null, '/sys/log/list', null, '2018-03-14 10:19:34');
INSERT INTO `t_sys_log` VALUES ('95', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '4', null, '/sys/log/list', null, '2018-03-14 13:43:13');
INSERT INTO `t_sys_log` VALUES ('96', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '6', null, '/sys/log/list', null, '2018-03-14 13:59:11');
INSERT INTO `t_sys_log` VALUES ('97', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '4', null, '/sys/log/list', null, '2018-03-14 14:20:18');
INSERT INTO `t_sys_log` VALUES ('98', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '7', null, '/sys/log/list', null, '2018-03-14 14:32:10');
INSERT INTO `t_sys_log` VALUES ('99', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '4', null, '/sys/log/list', '2018-03-14 14:34:34', '2018-03-14 14:35:43');
INSERT INTO `t_sys_log` VALUES ('100', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '35', null, '/sys/operate/save', '2018-03-14 14:43:24', '2018-03-14 14:44:33');
INSERT INTO `t_sys_log` VALUES ('101', 'admin', '操作管理', '保存操作', '添加/修改操作信息', '192.168.152.1', '65', null, '/sys/operate/save', '2018-03-14 16:29:26', '2018-03-14 16:30:35');
INSERT INTO `t_sys_log` VALUES ('102', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.152.1', '7', null, '/sys/log/list', '2018-03-14 16:29:53', '2018-03-14 16:31:01');
INSERT INTO `t_sys_log` VALUES ('103', 'admin', '日志模块', '日志list', '进入日志查询的页面', '192.168.220.1', '15', null, '/sys/log/list', null, '2018-03-15 17:14:31');
INSERT INTO `t_sys_log` VALUES ('104', 'don\'t username', '商品展示', '展示商品', '展示商品大概', '192.168.220.1', '0', null, '/mp/goods/goodsList', null, '2018-03-22 13:00:27');

-- ----------------------------
-- Table structure for `t_sys_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_manager`;
CREATE TABLE `t_sys_manager` (
  `id` int(11) NOT NULL auto_increment COMMENT '自增ID',
  `account` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role_id` tinyint(3) default NULL COMMENT '角色',
  `name` varchar(50) default NULL COMMENT '姓名',
  `credential` varchar(100) default NULL COMMENT '验证凭证',
  `locked` bit(1) default '' COMMENT '是否启用 0=禁用 1=启用',
  `email` varchar(64) default NULL COMMENT '邮箱',
  `phone` varchar(64) default NULL COMMENT '电话',
  `sex` varchar(255) default NULL COMMENT '性别',
  `type` varchar(255) default NULL COMMENT '类型',
  `photo` varchar(266) default NULL COMMENT '头像',
  `last_login_ip` varchar(15) default NULL COMMENT '登陆IP',
  `gmt_create` datetime default NULL COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `AK_ACCOUNT` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户管理表';

-- ----------------------------
-- Records of t_sys_manager
-- ----------------------------
INSERT INTO `t_sys_manager` VALUES ('1', 'admins', '123456', '1', '东陵', '9c6c9e22ae8c773c8f07a75b28563152', '', '11@qq.com', '13712344321', '男', null, null, null, '2017-06-16 08:59:01', '2018-05-14 23:06:14');
INSERT INTO `t_sys_manager` VALUES ('2', 'battcn', 'battcn', '2', '李梅', null, '', '11@qq.com', '13712344321', '女', null, null, null, '2017-06-19 09:20:14', '2018-05-14 23:16:11');
INSERT INTO `t_sys_manager` VALUES ('3', '123456', '123421', '2', '司甜红', null, '', '11@qq.com', '13712344321', '女', null, null, null, '2018-03-09 10:31:09', '2018-05-14 23:06:22');

-- ----------------------------
-- Table structure for `t_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
  `id` int(8) NOT NULL auto_increment COMMENT '自增ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `remark` varchar(2000) default NULL COMMENT '备注',
  `icon` varchar(100) default NULL COMMENT '图标',
  `channel` varchar(100) default NULL COMMENT '渠道',
  `param` varchar(200) default NULL,
  `locked` bit(1) default '' COMMENT '是否启用 0=禁用 1=启用',
  `pater_id` int(8) default NULL COMMENT '父级编号',
  `ordno` int(8) default NULL COMMENT '排序编号',
  `n_level` int(8) default NULL COMMENT '级别',
  `scort` varchar(100) default NULL COMMENT 'tree所需',
  `gmt_create` datetime default NULL COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY  (`id`),
  KEY `FK_Reference` (`pater_id`),
  CONSTRAINT `t_sys_menu_ibfk_1` FOREIGN KEY (`pater_id`) REFERENCES `t_sys_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES ('1', '系统管理', '系统管理', 'fa fa fa-home', '/sys', 'sys', '', null, '6', '0', ',1,', '2017-06-16 09:00:09', '2018-05-13 15:21:18');
INSERT INTO `t_sys_menu` VALUES ('2', '菜单管理', '菜单管理', 'fa fa-server', '/sys/menu', 'sys:menu', '', '1', '2', '0', ',1,2,', '2017-06-16 09:00:09', '2018-05-13 15:24:12');
INSERT INTO `t_sys_menu` VALUES ('3', '操作管理', '操作管理', 'fa fa-hand-lizard-o', '/sys/operate', 'sys:operate', '', '1', '3', '0', ',1,3,', '2017-06-16 09:00:09', '2018-05-13 15:24:10');
INSERT INTO `t_sys_menu` VALUES ('4', '角色管理', '角色管理', 'fa fa-sitemap', '/sys/role', 'sys:role', '', '1', '4', '0', ',1,4,', '2017-06-16 09:00:09', '2018-03-09 10:28:40');
INSERT INTO `t_sys_menu` VALUES ('5', '帐号管理', '帐号管理', 'fa fa-sun-o', '/sys/manager', 'sys:manager', '', '1', '1', '0', ',1,5,', '2017-06-16 09:00:09', '2018-03-09 10:28:40');
INSERT INTO `t_sys_menu` VALUES ('6', '日志管理', '日志管理', 'fa fa-comments-o', '/sys/log', 'sys:logs', '', '1', '7', '0', ',1,6,', '2017-06-16 09:00:09', '2018-05-13 15:24:08');
INSERT INTO `t_sys_menu` VALUES ('7', '字典管理', '字典管理', 'fa fa-newspaper-o', '/sys/dict', 'sys:dict', '', '1', '5', '0', ',1,7,', '2017-06-16 09:00:09', '2018-03-09 10:28:40');
INSERT INTO `t_sys_menu` VALUES ('8', '用户管理', '用户管理', 'fa fa fa-users', '/sys/user', 'sys:user', '', '1', '12', '0', ',1,8', '2018-03-13 09:38:26', '2018-05-14 23:22:42');
INSERT INTO `t_sys_menu` VALUES ('13', '医生', '医生', 'fa fa fa-home', '/baseInfo', 'baseInfo', '', null, '8', '0', ',13,', '2018-03-09 13:35:24', '2018-05-14 23:22:06');
INSERT INTO `t_sys_menu` VALUES ('14', '预约挂号', '预约挂号', 'fa fa fa-home', '/baseInfo/predict', 'baseInfo:predict', '', '13', '9', '0', ',13,14', '2018-03-09 13:37:51', '2018-05-14 23:22:08');
INSERT INTO `t_sys_menu` VALUES ('27', '健康记录', '健康记录', 'fa fa fa-users', '/baseInfo/health', 'baseInfo:health', '', '13', '10', '0', ',13,27', '2018-03-13 09:38:26', '2018-05-14 23:22:10');
INSERT INTO `t_sys_menu` VALUES ('28', '快速问诊', '快速问诊', 'fa fa fa-image', '/baseInfo/quick', 'baseInfo:quick', '', '13', '11', '0', ',13,28', '2018-03-13 10:55:08', '2018-05-14 23:22:02');
INSERT INTO `t_sys_menu` VALUES ('29', '问题管理', '问题管理', 'fa fa fa-users', '/sys/question', 'sys:question', '', '1', '11', '0', ',1,29', '2018-05-20 22:48:50', '2018-05-20 22:48:52');

-- ----------------------------
-- Table structure for `t_sys_operate`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_operate`;
CREATE TABLE `t_sys_operate` (
  `id` int(8) NOT NULL auto_increment COMMENT '主键',
  `menu_id` int(8) NOT NULL COMMENT '菜单ID',
  `op` varchar(30) NOT NULL COMMENT '选项',
  `name` varchar(64) NOT NULL COMMENT '名字',
  `icon` varchar(50) default NULL COMMENT '图标',
  `remark` varchar(2000) default NULL COMMENT '备注',
  `ordno` int(11) default NULL COMMENT '排序号',
  `display` int(1) NOT NULL COMMENT '是否显示出来',
  `gmt_create` datetime default NULL COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `menu_op` (`menu_id`,`op`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作表';

-- ----------------------------
-- Records of t_sys_operate
-- ----------------------------
INSERT INTO `t_sys_operate` VALUES ('1', '1', 'list', '查看', 'list', null, '1', '0', '2017-06-20 18:52:32', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('2', '2', 'edit', '编辑', 'edit', null, '3', '1', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('3', '2', 'list', '查看', 'list', null, '1', '0', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('4', '2', 'remove', '删除', 'remove', null, '4', '1', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('5', '2', 'save', '保存', 'save', null, '5', '0', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('6', '2', 'add', '新增', 'plus', '', '2', '1', '2017-06-16 09:01:08', '2018-03-13 16:12:03');
INSERT INTO `t_sys_operate` VALUES ('7', '3', 'edit', '编辑', 'edit', null, '3', '1', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('8', '3', 'list', '查看', 'list', null, '1', '0', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('9', '3', 'remove', '删除', 'remove', null, '4', '1', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('10', '3', 'save', '保存', 'save', null, '5', '0', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('11', '3', 'add', '新增', 'plus', null, '2', '1', '2017-06-16 09:01:08', '2017-06-21 10:15:01');
INSERT INTO `t_sys_operate` VALUES ('12', '4', 'edit', '编辑', 'edit', null, '3', '1', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('13', '4', 'list', '查看', 'list', null, '1', '0', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('14', '4', 'remove', '删除', 'remove', null, '4', '1', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('15', '4', 'save', '保存', 'save', null, '5', '0', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('16', '4', 'add', '新增', 'plus', null, '2', '1', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('17', '5', 'edit', '编辑', 'edit', null, '3', '1', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('18', '5', 'list', '查看', 'list', null, '1', '0', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('19', '5', 'remove', '删除', 'remove', null, '4', '1', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('20', '5', 'save', '保存', 'save', null, '5', '0', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('21', '5', 'add', '新增', 'plus', null, '2', '1', '2017-06-16 09:01:08', '2017-06-20 19:09:41');
INSERT INTO `t_sys_operate` VALUES ('22', '6', 'list', '查看', 'list', null, '1', '0', '2017-06-16 09:01:08', '2017-06-21 09:29:01');
INSERT INTO `t_sys_operate` VALUES ('23', '7', 'edit', '编辑', 'edit', null, '2', '1', '2017-06-16 09:01:08', '2017-06-21 09:29:09');
INSERT INTO `t_sys_operate` VALUES ('24', '7', 'list', '查看', 'list', null, '2', '0', '2017-06-16 09:01:08', '2017-06-21 09:29:10');
INSERT INTO `t_sys_operate` VALUES ('25', '7', 'remove', '删除', 'remove', null, '1', '1', '2017-06-16 09:01:08', '2017-06-21 09:29:12');
INSERT INTO `t_sys_operate` VALUES ('26', '7', 'save', '保存', 'save', null, '3', '0', '2017-06-16 09:01:08', '2017-06-21 09:29:13');
INSERT INTO `t_sys_operate` VALUES ('27', '4', 'permissions', '分配权限', 'permissions', null, '1', '1', '2017-06-20 13:38:21', '2017-06-21 09:29:14');
INSERT INTO `t_sys_operate` VALUES ('28', '8', 'list', '查看', 'list', null, '1', '0', '2017-06-16 09:01:08', '2017-06-21 10:09:23');
INSERT INTO `t_sys_operate` VALUES ('29', '6', 'export', '导出', 'file-excel-o', '导出Excel', '1', '1', '2018-01-17 12:25:43', '2018-01-17 12:36:50');
INSERT INTO `t_sys_operate` VALUES ('35', '13', 'list', '查看', 'list', '查看', '1', '0', '2018-03-09 13:40:04', '2018-03-09 13:40:04');
INSERT INTO `t_sys_operate` VALUES ('36', '14', 'list', '查看', 'list', '查看', '1', '0', '2018-03-09 13:40:59', '2018-03-12 11:49:55');
INSERT INTO `t_sys_operate` VALUES ('38', '14', 'add', '新增', 'plus', '新增', '2', '1', '2018-03-09 18:42:55', '2018-03-12 11:49:10');
INSERT INTO `t_sys_operate` VALUES ('39', '14', 'save', '保存', 'save', '保存', '4', '1', '2018-03-12 11:45:36', '2018-03-12 11:45:36');
INSERT INTO `t_sys_operate` VALUES ('40', '14', 'edit', '编辑', 'edit', '编辑', '3', '1', '2018-03-12 11:47:08', '2018-03-12 11:47:08');
INSERT INTO `t_sys_operate` VALUES ('41', '14', 'remove', '删除', 'remove', '删除', '5', '1', '2018-03-12 11:47:27', '2018-03-12 11:49:13');
INSERT INTO `t_sys_operate` VALUES ('42', '27', 'list', '查看', 'list', '查看', '1', '1', '2018-03-13 09:55:59', '2018-03-13 09:57:56');
INSERT INTO `t_sys_operate` VALUES ('43', '27', 'add', '新增', 'plus', '新增', '2', '1', '2018-03-13 09:57:09', '2018-03-13 09:59:06');
INSERT INTO `t_sys_operate` VALUES ('44', '27', 'remove', '删除', 'remove', '删除', '3', '1', '2018-03-13 09:58:49', '2018-03-13 10:00:46');
INSERT INTO `t_sys_operate` VALUES ('45', '27', 'save', '保存', 'save', '保存', '4', '1', '2018-03-13 09:59:24', '2018-03-13 10:01:21');
INSERT INTO `t_sys_operate` VALUES ('46', '28', 'list', '查看', 'list', '查看', '1', '1', '2018-03-13 10:56:04', '2018-03-13 10:58:01');
INSERT INTO `t_sys_operate` VALUES ('47', '14', 'eximport', '导入', 'file-excel-o', '导入', '7', '1', '2018-03-14 14:43:24', '2018-03-14 16:30:35');
INSERT INTO `t_sys_operate` VALUES ('48', '29', 'list', '查看', 'list', '查看', '1', '1', '2018-05-20 23:00:01', '2018-05-20 23:00:02');

-- ----------------------------
-- Table structure for `t_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` int(8) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '角色名',
  `code` varchar(50) default NULL COMMENT '编号',
  `remark` varchar(200) default NULL COMMENT '备注',
  `gmt_create` datetime default NULL COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', '超级管理员', 'manager', '超级管理员,不听话就封号', '2017-06-16 09:01:23', '2017-06-16 09:01:23');
INSERT INTO `t_sys_role` VALUES ('2', '医生', 'doctor', '医生', '2017-06-16 09:01:23', '2018-05-11 14:54:19');

-- ----------------------------
-- Table structure for `t_sys_role_operate`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_operate`;
CREATE TABLE `t_sys_role_operate` (
  `role_id` int(8) NOT NULL COMMENT '角色ID',
  `operate_id` int(8) NOT NULL COMMENT '操作表ID',
  `gmt_create` datetime default NULL COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY  (`role_id`,`operate_id`),
  KEY `operate_id` (`operate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role_operate
-- ----------------------------
INSERT INTO `t_sys_role_operate` VALUES ('1', '1', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '2', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '3', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '4', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '5', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '6', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '7', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '8', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '9', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '10', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '11', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '12', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '13', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '14', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '15', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '16', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '17', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '18', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '19', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '20', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '21', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '22', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '23', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '24', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '25', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '26', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '27', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '28', null, '2018-05-14 23:41:50');
INSERT INTO `t_sys_role_operate` VALUES ('1', '35', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '36', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '38', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '40', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '41', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '42', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '43', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '44', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '45', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '46', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '47', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('1', '48', null, '2018-05-20 23:00:14');
INSERT INTO `t_sys_role_operate` VALUES ('2', '35', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('2', '36', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('2', '42', null, '2018-03-14 14:44:55');
INSERT INTO `t_sys_role_operate` VALUES ('2', '46', null, '2018-03-14 14:44:55');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL auto_increment,
  `account` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `lock` int(1) default NULL,
  `create_time` timestamp NULL default NULL,
  `nickname` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admins', '111111', '0', '2018-05-01 17:29:04', '萧念梅');
INSERT INTO `user` VALUES ('5', 'qiumei190', '123456', '0', '2018-05-09 10:29:57', '萧然');
INSERT INTO `user` VALUES ('6', 'qiumei180', '123456', '0', '2018-05-13 20:42:26', '小鱼');

-- ----------------------------
-- Procedure structure for `refreshTreeNodes`
-- ----------------------------
DROP PROCEDURE IF EXISTS `refreshTreeNodes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `refreshTreeNodes`()
BEGIN

DECLARE LEVEL INT ;
SET LEVEL = 0 ; UPDATE t_sys_menu a
INNER JOIN (
	SELECT
		id,
		n_level,
		concat(',', ID, ',') scort
	FROM
		t_sys_menu
	WHERE
		pater_id IS NULL
) b ON a.id = b.id
SET a.n_level = b.n_level,
 a.scort = b.scort ;
WHILE FOUND_ROWS() > 0 DO
SET LEVEL = LEVEL + 1 ; UPDATE t_sys_menu a
INNER JOIN (
	SELECT
		ID,
		n_level,
		scort
	FROM
		t_sys_menu
	WHERE
		n_level = LEVEL - 1
) b ON a.pater_id = b.id
SET a.n_level = b.n_level,
 a.scort = concat(b.scort, a.ID, ',') ;
END
WHILE ;
END
;;
DELIMITER ;
