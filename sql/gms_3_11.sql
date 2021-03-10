/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : gms

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 11/03/2021 10:33:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acceptance_teacher
-- ----------------------------
DROP TABLE IF EXISTS `acceptance_teacher`;
CREATE TABLE `acceptance_teacher`  (
  `ID` int NOT NULL,
  `TEACHER_ID` int NULL DEFAULT NULL COMMENT '老师ID',
  `TEAM_ID` int NULL DEFAULT NULL,
  `IS_LEADER` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_5`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_6`(`TEAM_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`TEAM_ID`) REFERENCES `acceptance_team` (`TEAM_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '验收老师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acceptance_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for acceptance_team
-- ----------------------------
DROP TABLE IF EXISTS `acceptance_team`;
CREATE TABLE `acceptance_team`  (
  `TEAM_ID` int NOT NULL,
  `TEAM_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SEC_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`TEAM_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_35`(`SEC_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_35` FOREIGN KEY (`SEC_ID`) REFERENCES `secretary` (`SEC_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '验收小组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acceptance_team
-- ----------------------------

-- ----------------------------
-- Table structure for achievement
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement`  (
  `ACHIEVEMENT_ID` int NOT NULL,
  `DOC_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`ACHIEVEMENT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成果物' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of achievement
-- ----------------------------

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_GENDER` int NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `ADMIN_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `ADMIN_ID`(`ADMIN_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_3` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for annoucement
-- ----------------------------
DROP TABLE IF EXISTS `annoucement`;
CREATE TABLE `annoucement`  (
  `DOC_ID` int NULL DEFAULT NULL,
  `ANN_ID` int NOT NULL,
  `ANN_TITLE` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_BY` int NULL DEFAULT NULL,
  `ANN_DETAIL` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `STATUS` int NULL DEFAULT NULL,
  `CREATE_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ANN_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_20`(`CREATE_BY`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_20` FOREIGN KEY (`CREATE_BY`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of annoucement
-- ----------------------------

-- ----------------------------
-- Table structure for applied_subject
-- ----------------------------
DROP TABLE IF EXISTS `applied_subject`;
CREATE TABLE `applied_subject`  (
  `APPLY_ID` int NOT NULL,
  `SUB_ID` int NULL DEFAULT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `STATUS` int NULL DEFAULT NULL,
  `IS_PASSED` tinyint(1) NULL DEFAULT NULL,
  `FEEDBACK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`APPLY_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_11`(`STU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_12`(`SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`SUB_ID`) REFERENCES `subject` (`SUB_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '选题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of applied_subject
-- ----------------------------

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `CLASS_ID` int NOT NULL,
  `CLASS_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CLASS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of class
-- ----------------------------

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`  (
  `CLASSROOM_ID` int NOT NULL,
  `CLASSROOM_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CLASSROOM_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of classroom
-- ----------------------------

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `COLLEGE_ID` int NOT NULL,
  `COLLEGE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`COLLEGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学院' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of college
-- ----------------------------

-- ----------------------------
-- Table structure for dicts
-- ----------------------------
DROP TABLE IF EXISTS `dicts`;
CREATE TABLE `dicts`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DICT_ID` int NULL DEFAULT NULL,
  `DICT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DICT_KEY` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DICT_VALUE` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dicts
-- ----------------------------
INSERT INTO `dicts` VALUES (1, 1, '阶段', '1', '出题');
INSERT INTO `dicts` VALUES (2, 1, '阶段', '2', '选题');
INSERT INTO `dicts` VALUES (3, 1, '阶段', '3', '开题');
INSERT INTO `dicts` VALUES (4, 1, '阶段', '4', '中期');
INSERT INTO `dicts` VALUES (5, 1, '阶段', '5', '结题');
INSERT INTO `dicts` VALUES (6, 2, '性别', '1', '男');
INSERT INTO `dicts` VALUES (7, 2, '性别', '2', '女');

-- ----------------------------
-- Table structure for file_storage
-- ----------------------------
DROP TABLE IF EXISTS `file_storage`;
CREATE TABLE `file_storage`  (
  `DOC_ID` int NULL DEFAULT NULL,
  `HANDIN_ID` int NULL DEFAULT NULL,
  `FILE_ID` int NOT NULL,
  `FILE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SIZE` int NULL DEFAULT NULL,
  `LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEL_FLAG` tinyint(1) NULL DEFAULT NULL,
  `UPLOAD_BY` int NULL DEFAULT NULL,
  `UPLOAD_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_22`(`UPLOAD_BY`) USING BTREE,
  INDEX `DOC_ID`(`DOC_ID`, `HANDIN_ID`) USING BTREE,
  CONSTRAINT `file_storage_ibfk_1` FOREIGN KEY (`DOC_ID`, `HANDIN_ID`) REFERENCES `handin` (`HANDIN_ID`, `DOC_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_22` FOREIGN KEY (`UPLOAD_BY`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_storage
-- ----------------------------

-- ----------------------------
-- Table structure for given_subject
-- ----------------------------
DROP TABLE IF EXISTS `given_subject`;
CREATE TABLE `given_subject`  (
  `DOC_ID` int NULL DEFAULT NULL,
  `SUB_ID` int NOT NULL,
  `GIVEN_BY` int NULL DEFAULT NULL,
  `STATUS` int NULL DEFAULT NULL,
  `AUDIT_BY` int NULL DEFAULT NULL,
  `FEEDBACK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `IS_PASSED` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`SUB_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_34`(`GIVEN_BY`) USING BTREE,
  INDEX `AUDIT_BY`(`AUDIT_BY`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_34` FOREIGN KEY (`GIVEN_BY`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `given_subject_ibfk_1` FOREIGN KEY (`AUDIT_BY`) REFERENCES `teaching_office` (`OFFICE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of given_subject
-- ----------------------------

-- ----------------------------
-- Table structure for handin
-- ----------------------------
DROP TABLE IF EXISTS `handin`;
CREATE TABLE `handin`  (
  `HANDIN_ID` int NOT NULL,
  `DOC_ID` int NULL DEFAULT NULL,
  `RETRIES` int NULL DEFAULT NULL,
  `TYPE` int NULL DEFAULT NULL,
  `FEEDBACK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `HANDIN_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`HANDIN_ID`) USING BTREE,
  INDEX `HANDIN_ID`(`HANDIN_ID`, `DOC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of handin
-- ----------------------------

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `USERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `LOGIN_TIME` datetime NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 14:02:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 14:26:47', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 14:30:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 14:32:07', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 14:34:12', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 15:03:31', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 15:52:49', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 16:37:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 21:31:06', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 21:44:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 21:45:26', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 22:16:11', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-10 22:18:07', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-11 09:03:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-11 09:12:34', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-11 09:13:59', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-11 09:14:37', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-11 09:18:41', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-11 09:21:21', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-11 10:01:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-11 10:11:18', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-11 10:30:47', NULL, '127.0.0.1');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `MAJOR_ID` int NOT NULL,
  `COLLEGE_ID` int NULL DEFAULT NULL,
  `MAJOR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`MAJOR_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_32`(`COLLEGE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_32` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专业' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of major
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `MENU_ID` int NOT NULL,
  `PARENT_ID` int NULL DEFAULT NULL,
  `MENU_NAME` int NULL DEFAULT NULL,
  `PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMPONENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYPE` tinyint(1) NULL DEFAULT NULL,
  `PERMS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ORDER_NUM` int NULL DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_42`(`PERMS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, 0, '/system', 'PageView', 0, NULL, 1);
INSERT INTO `menu` VALUES (2, 0, 0, '/monitor', 'PageView', 0, NULL, 2);
INSERT INTO `menu` VALUES (3, 1, 0, '/system/user', 'system/user/User', 0, 'user:view', 1);
INSERT INTO `menu` VALUES (4, 1, 0, '/system/role', 'system/role/Role', 0, 'role:view', 2);
INSERT INTO `menu` VALUES (5, 1, 0, '/system/menu', 'system/menu/Menu', 0, 'menu:view', 3);
INSERT INTO `menu` VALUES (6, 1, 0, '/system/dept', 'system/dept/Dept', 0, 'dept:view', 4);
INSERT INTO `menu` VALUES (8, 2, 0, '/monitor/online', 'monitor/Online', 0, 'user:online', 1);
INSERT INTO `menu` VALUES (10, 2, 0, '/monitor/systemlog', 'monitor/SystemLog', 0, 'log:view', 2);
INSERT INTO `menu` VALUES (11, 3, 0, NULL, NULL, 1, 'user:add', NULL);
INSERT INTO `menu` VALUES (12, 3, 0, NULL, NULL, 1, 'user:update', NULL);
INSERT INTO `menu` VALUES (13, 3, 0, NULL, NULL, 1, 'user:delete', NULL);
INSERT INTO `menu` VALUES (14, 4, 0, NULL, NULL, 1, 'role:add', NULL);
INSERT INTO `menu` VALUES (15, 4, 0, NULL, NULL, 1, 'role:update', NULL);
INSERT INTO `menu` VALUES (16, 4, 0, NULL, NULL, 1, 'role:delete', NULL);
INSERT INTO `menu` VALUES (17, 5, 0, NULL, NULL, 1, 'menu:add', NULL);
INSERT INTO `menu` VALUES (18, 5, 0, NULL, NULL, 1, 'menu:update', NULL);
INSERT INTO `menu` VALUES (19, 5, 0, NULL, NULL, 1, 'menu:delete', NULL);
INSERT INTO `menu` VALUES (20, 6, 0, NULL, NULL, 1, 'dept:add', NULL);
INSERT INTO `menu` VALUES (21, 6, 0, NULL, NULL, 1, 'dept:update', NULL);
INSERT INTO `menu` VALUES (22, 6, 0, NULL, NULL, 1, 'dept:delete', NULL);
INSERT INTO `menu` VALUES (23, 8, 0, NULL, NULL, 1, 'user:kickout', NULL);
INSERT INTO `menu` VALUES (24, 10, 0, NULL, NULL, 1, 'log:delete', NULL);
INSERT INTO `menu` VALUES (58, 0, 0, '/web', 'PageView', 0, NULL, 4);
INSERT INTO `menu` VALUES (59, 58, 0, '/web/weather', 'web/Weather', 0, 'weather:view', 1);
INSERT INTO `menu` VALUES (61, 58, 0, '/web/dailyArticle', 'web/DailyArticle', 0, 'article:view', 2);
INSERT INTO `menu` VALUES (64, 1, 0, '/system/dict', 'system/dict/Dict', 0, 'dict:view', 5);
INSERT INTO `menu` VALUES (65, 64, 0, NULL, NULL, 1, 'dict:add', NULL);
INSERT INTO `menu` VALUES (66, 64, 0, NULL, NULL, 1, 'dict:update', NULL);
INSERT INTO `menu` VALUES (67, 64, 0, NULL, NULL, 1, 'dict:delete', NULL);
INSERT INTO `menu` VALUES (81, 58, 0, '/web/movie', 'EmptyPageView', 0, NULL, 3);
INSERT INTO `menu` VALUES (82, 81, 0, '/web/movie/hot', 'web/MovieHot', 0, 'movie:hot', 1);
INSERT INTO `menu` VALUES (83, 81, 0, '/web/movie/coming', 'web/MovieComing', 0, 'movie:coming', 2);
INSERT INTO `menu` VALUES (101, 0, 0, '/job', 'PageView', 0, NULL, 3);
INSERT INTO `menu` VALUES (102, 101, 0, '/job/job', 'quartz/job/Job', 0, 'job:view', 1);
INSERT INTO `menu` VALUES (103, 102, 0, NULL, NULL, 1, 'job:add', NULL);
INSERT INTO `menu` VALUES (104, 102, 0, NULL, NULL, 1, 'job:update', NULL);
INSERT INTO `menu` VALUES (105, 102, 0, NULL, NULL, 1, 'job:delete', NULL);
INSERT INTO `menu` VALUES (106, 102, 0, NULL, NULL, 1, 'job:pause', NULL);
INSERT INTO `menu` VALUES (107, 102, 0, NULL, NULL, 1, 'job:resume', NULL);
INSERT INTO `menu` VALUES (108, 102, 0, NULL, NULL, 1, 'job:run', NULL);
INSERT INTO `menu` VALUES (109, 101, 0, '/job/log', 'quartz/log/JobLog', 0, 'jobLog:view', 2);
INSERT INTO `menu` VALUES (110, 109, 0, NULL, NULL, 1, 'jobLog:delete', NULL);
INSERT INTO `menu` VALUES (113, 2, 0, '/monitor/redis/info', 'monitor/RedisInfo', 0, 'redis:view', 3);
INSERT INTO `menu` VALUES (121, 2, 0, '/monitor/httptrace', 'monitor/Httptrace', 0, NULL, 4);
INSERT INTO `menu` VALUES (122, 2, 0, '/monitor/system', 'EmptyPageView', 0, NULL, 5);
INSERT INTO `menu` VALUES (123, 122, 0, '/monitor/system/tomcat/info', 'monitor/TomcatInfo', 0, NULL, 2);
INSERT INTO `menu` VALUES (124, 122, 0, '/monitor/system/jvm/info', 'monitor/JvmInfo', 0, NULL, 1);
INSERT INTO `menu` VALUES (127, 122, 0, '/monitor/system/system/info', 'monitor/SystemInfo', 0, NULL, 3);
INSERT INTO `menu` VALUES (128, 0, 0, '/others', 'PageView', 0, NULL, 5);
INSERT INTO `menu` VALUES (129, 128, 0, '/others/excel', 'others/Excel', 0, NULL, 1);
INSERT INTO `menu` VALUES (130, 3, 0, NULL, NULL, 1, 'user:export', NULL);
INSERT INTO `menu` VALUES (131, 4, 0, NULL, NULL, 1, 'role:export', NULL);
INSERT INTO `menu` VALUES (132, 5, 0, NULL, NULL, 1, 'menu:export', NULL);
INSERT INTO `menu` VALUES (133, 6, 0, NULL, NULL, 1, 'dept:export', NULL);
INSERT INTO `menu` VALUES (134, 64, 0, NULL, NULL, 1, 'dict:export', NULL);
INSERT INTO `menu` VALUES (135, 3, 0, NULL, NULL, 1, 'user:reset', NULL);
INSERT INTO `menu` VALUES (136, 10, 0, NULL, NULL, 1, 'log:export', NULL);
INSERT INTO `menu` VALUES (137, 102, 0, NULL, NULL, 1, 'job:export', NULL);
INSERT INTO `menu` VALUES (138, 109, 0, NULL, NULL, 1, 'jobLog:export', NULL);
INSERT INTO `menu` VALUES (200, 2, 0, '/monitor/requestlog', 'monitor/RequestLog', 0, 'log:view', 6);
INSERT INTO `menu` VALUES (201, 200, 0, NULL, NULL, 1, 'log:delete', NULL);
INSERT INTO `menu` VALUES (202, 200, 0, NULL, NULL, 1, 'log:export', NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `MESSAGE_ID` int NOT NULL,
  `TEACHER_ID` int NULL DEFAULT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYPE` int NULL DEFAULT NULL,
  `DETAIL` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`MESSAGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for plea
-- ----------------------------
DROP TABLE IF EXISTS `plea`;
CREATE TABLE `plea`  (
  `ID` int NOT NULL,
  `STAGE` int NULL DEFAULT NULL,
  `ARRANGE_ID` int NULL DEFAULT NULL,
  `STU_GROUP_ID` int NULL DEFAULT NULL,
  `ACCEPTANCE_TEAM_ID` int NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT NULL,
  `FEEDBACK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `IS_PASS` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_36`(`ARRANGE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_39`(`STU_GROUP_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_9`(`ACCEPTANCE_TEAM_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_36` FOREIGN KEY (`ARRANGE_ID`) REFERENCES `plea_arrange` (`ARRANGE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_39` FOREIGN KEY (`STU_GROUP_ID`) REFERENCES `stu_group` (`GROUP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`ACCEPTANCE_TEAM_ID`) REFERENCES `acceptance_team` (`TEAM_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '答辩' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plea
-- ----------------------------

-- ----------------------------
-- Table structure for plea_arrange
-- ----------------------------
DROP TABLE IF EXISTS `plea_arrange`;
CREATE TABLE `plea_arrange`  (
  `ARRANGE_ID` int NOT NULL,
  `CLASSROOM_ID` int NULL DEFAULT NULL,
  `SEC_ID` int NULL DEFAULT NULL,
  `TIME` int NULL DEFAULT NULL,
  PRIMARY KEY (`ARRANGE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_37`(`CLASSROOM_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_40`(`SEC_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_37` FOREIGN KEY (`CLASSROOM_ID`) REFERENCES `classroom` (`CLASSROOM_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_40` FOREIGN KEY (`SEC_ID`) REFERENCES `secretary` (`SEC_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '答辩前的一些安排' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plea_arrange
-- ----------------------------

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `REPORT_ID` int NOT NULL,
  `DOC_ID` int NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT NULL,
  PRIMARY KEY (`REPORT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `ROLE_ID` int NOT NULL,
  `ROLE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员');
INSERT INTO `role` VALUES (2, '注册用户');
INSERT INTO `role` VALUES (3, '普通用户');
INSERT INTO `role` VALUES (4, '自定义');
INSERT INTO `role` VALUES (5, 'test');

-- ----------------------------
-- Table structure for role_stage_perms
-- ----------------------------
DROP TABLE IF EXISTS `role_stage_perms`;
CREATE TABLE `role_stage_perms`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int NULL DEFAULT NULL,
  `STAGE` int NULL DEFAULT NULL,
  `PERMS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_43`(`ROLE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_44`(`PERMS`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_43` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_stage_perms_ibfk_1` FOREIGN KEY (`PERMS`) REFERENCES `menu` (`PERMS`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置各阶段角色的权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_stage_perms
-- ----------------------------
INSERT INTO `role_stage_perms` VALUES (2, 1, 1, 'user:add');
INSERT INTO `role_stage_perms` VALUES (3, 1, 2, 'user:view');
INSERT INTO `role_stage_perms` VALUES (4, 2, 3, 'user:update');
INSERT INTO `role_stage_perms` VALUES (5, 2, 4, 'user:delete');
INSERT INTO `role_stage_perms` VALUES (6, 3, 5, 'role:add');
INSERT INTO `role_stage_perms` VALUES (7, 1, 4, 'role:delete');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `STU_ID` int NULL DEFAULT NULL,
  `START_SCORE` int NULL DEFAULT NULL COMMENT '答辩和成果（包括报告）',
  `MID_SCORE` int NULL DEFAULT NULL,
  `END_SCORE` int NULL DEFAULT NULL,
  `THESIS_SCORE` int NULL DEFAULT NULL,
  `PROCEDURE_SCORE` int NULL DEFAULT NULL,
  `FINAL_SCORE` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score
-- ----------------------------

-- ----------------------------
-- Table structure for score_detail
-- ----------------------------
DROP TABLE IF EXISTS `score_detail`;
CREATE TABLE `score_detail`  (
  `STU_ID` int NULL DEFAULT NULL,
  `SCORE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score_detail
-- ----------------------------

-- ----------------------------
-- Table structure for secretary
-- ----------------------------
DROP TABLE IF EXISTS `secretary`;
CREATE TABLE `secretary`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_GENDER` int NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `SEC_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `SEC_ID`(`SEC_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_5` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '答辩秘书' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of secretary
-- ----------------------------

-- ----------------------------
-- Table structure for stage_task
-- ----------------------------
DROP TABLE IF EXISTS `stage_task`;
CREATE TABLE `stage_task`  (
  `DOC_ID` int NULL DEFAULT NULL,
  `TASK_ID` int NOT NULL,
  `TEACHER_ID` int NULL DEFAULT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DETAIL` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `STAGE` int NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT NULL,
  `STATUS` int NULL DEFAULT NULL,
  `START_TIME` datetime NULL DEFAULT NULL,
  `END_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`TASK_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_16`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_17`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_16` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_17` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '阶段任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stage_task
-- ----------------------------

-- ----------------------------
-- Table structure for stu_group
-- ----------------------------
DROP TABLE IF EXISTS `stu_group`;
CREATE TABLE `stu_group`  (
  `GROUP_ID` int NOT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_38`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_38` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生小组，分批进行答辩' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_group
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_GENDER` int NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `STU_ID` int NOT NULL,
  `COLLEGE_ID` int NULL DEFAULT NULL,
  `MAJOR_ID` int NULL DEFAULT NULL,
  `CLASS_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `STU_ID`(`STU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_29`(`MAJOR_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_31`(`CLASS_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_29` FOREIGN KEY (`MAJOR_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_31` FOREIGN KEY (`CLASS_ID`) REFERENCES `class` (`CLASS_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `DOC_ID` int NULL DEFAULT NULL,
  `SUB_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `POSE_BY` int NULL DEFAULT NULL,
  `SUB_ID` int NOT NULL,
  `GIV_SUB_ID` int NULL DEFAULT NULL,
  `STATUS` int NULL DEFAULT NULL,
  `MAJOR_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`SUB_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_10`(`POSE_BY`) USING BTREE,
  INDEX `FK_RELATIONSHIP_33`(`GIV_SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`POSE_BY`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_28` FOREIGN KEY (`SUB_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subject
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作内容',
  `TIME` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `METHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作方法',
  `PARAMS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '方法参数',
  `IP` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  `RESPONSE_CODE` int NULL DEFAULT NULL COMMENT '应答码',
  `RESPONSE_TEXT` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应答内容',
  `TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '0系统内部操作日志, 1系统外部请求日志',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_stage
-- ----------------------------
DROP TABLE IF EXISTS `system_stage`;
CREATE TABLE `system_stage`  (
  `IS_CURRENT` tinyint(1) NOT NULL,
  `STAGE_ID` int NOT NULL,
  `STAGE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `START_TIME` datetime NULL DEFAULT NULL,
  `END_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`STAGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统当前状态' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_stage
-- ----------------------------
INSERT INTO `system_stage` VALUES (0, 0, '课题申报', '在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (1, 1, '课题申报审核', '在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。', '2021-03-11 00:00:00', '2021-03-11 00:00:00');
INSERT INTO `system_stage` VALUES (1, 2, '被驳回课题整改', '在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 3, '学生提交选题申请', '在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 4, '教师审核学生申请', '在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 5, '开题报告及材料提交', '在该阶段，学生可以在系统提交开题报告及与开题相关的材料。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 6, '开题答辩', '在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 7, '开题阶段收尾', '在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 8, '中期检查材料提交', '在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 9, '中期答辩', '在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 10, '中期阶段收尾', '在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 11, '结题材料提交', '在该阶段，学生提交毕业论文、最终成果物及结题报告', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 12, '结题收尾工作', '在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果', '1900-01-20 00:00:00', '1900-01-20 23:59:59');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_GENDER` int NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TEACHER_ID` int NOT NULL,
  `COLLEGE_ID` int NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HOME_PAGE` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `TEACHER_ID`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_7`(`COLLEGE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for teaching_office
-- ----------------------------
DROP TABLE IF EXISTS `teaching_office`;
CREATE TABLE `teaching_office`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_GENDER` int NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `OFFICE_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `OFFICE_ID`(`OFFICE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_4` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教研室' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teaching_office
-- ----------------------------

-- ----------------------------
-- Table structure for thesis
-- ----------------------------
DROP TABLE IF EXISTS `thesis`;
CREATE TABLE `thesis`  (
  `DOC_ID` int NULL DEFAULT NULL,
  `ID` int NOT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `STATUS` int NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_21`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_21` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '论文' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of thesis
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `REAL_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户真实姓名',
  `USERNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户登录账号',
  `PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GENDER` int NULL DEFAULT NULL COMMENT '性别(0女1男)',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张狗蛋', 'mrbird', '94f860c4bbfeb2f49c84e321fdda4b07', '13455533233', 'mrbird12111111123@hotmail.com', 1);
INSERT INTO `user` VALUES (2, '张静月', 'scott', '7b44a5363e3fd52435beb472e1d2b91f', '15134627380', 'scott@qq.com', 1);
INSERT INTO `user` VALUES (3, '朱一丹', 'jack', '552649f10640385d0728a80a4242893e', NULL, 'jack@hotmail.com', 1);
INSERT INTO `user` VALUES (4, '朱二丹', 'xiaoduan', 'dd3de68a6c00fed6168f8371233a6f7a', NULL, 'test@163.com', 2);
INSERT INTO `user` VALUES (5, '朱三丹', 'test', '1c9a231a07da290d3286500bdd5fe8a9', '18811445654', 'sdfsdf@qq.com', 2);
INSERT INTO `user` VALUES (6, '朱四丹', 'ddmtest14', '54b9e629dc5e6c8f13c076d397f0723c', '18856345234', '45116365@qq.com', 2);
INSERT INTO `user` VALUES (7, '朱五丹', 'test1', 'ec69baa6c7505fd94d0f5061804d00ca', '18811487981', 'test1@qq.com', 2);
INSERT INTO `user` VALUES (8, '朱六丹', 'admin', '3ee4a28b103216fa2d140d1979297910', '18246544545', 'admin@admin.com', 2);
INSERT INTO `user` VALUES (9, '朱七丹', 'test33333', '78b8011fa4d77888f331646926bf5a12', '18658273808', 'sdasdas@adas.com', 2);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ROLE_ID` int NULL DEFAULT NULL,
  `USER_ID` int NULL DEFAULT NULL,
  INDEX `FK_RELATIONSHIP_23`(`USER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_24`(`ROLE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_23` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_24` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (1, 8);

-- ----------------------------
-- Table structure for user_stage
-- ----------------------------
DROP TABLE IF EXISTS `user_stage`;
CREATE TABLE `user_stage`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NULL DEFAULT NULL,
  `STAGE` int NULL DEFAULT NULL,
  `START_TIME` datetime NULL DEFAULT NULL,
  `END_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_30`(`USER_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_30` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户当前状态' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_stage
-- ----------------------------
INSERT INTO `user_stage` VALUES (1, 1, 1, '2021-03-09 13:14:55', '2021-03-11 13:15:00');
INSERT INTO `user_stage` VALUES (2, 1, 2, '2021-03-02 13:16:12', NULL);

-- ----------------------------
-- Table structure for weight
-- ----------------------------
DROP TABLE IF EXISTS `weight`;
CREATE TABLE `weight`  (
  `ID` int NOT NULL,
  `STAGE` int NULL DEFAULT NULL,
  `WEIGHT` float NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of weight
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
