/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : gms

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 08/03/2021 17:59:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acceptance_teacher
-- ----------------------------
DROP TABLE IF EXISTS `acceptance_teacher`;
CREATE TABLE `acceptance_teacher`  (
  `ID` int(11) NOT NULL,
  `TEACHER_ID` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `TEAM_ID` int(11) NULL DEFAULT NULL,
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
  `TEAM_ID` int(11) NOT NULL,
  `TEAM_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SEC_ID` int(11) NULL DEFAULT NULL,
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
  `ACHIEVEMENT_ID` int(11) NOT NULL,
  `DOC_ID` int(11) NULL DEFAULT NULL,
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
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_GENDER` int(11) NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `ADMIN_ID` int(11) NOT NULL,
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
  `DOC_ID` int(11) NULL DEFAULT NULL,
  `ANN_ID` int(11) NOT NULL,
  `ANN_TITLE` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_BY` int(11) NULL DEFAULT NULL,
  `ANN_DETAIL` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
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
  `APPLY_ID` int(11) NOT NULL,
  `SUB_ID` int(11) NULL DEFAULT NULL,
  `STU_ID` int(11) NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
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
  `CLASS_ID` int(11) NOT NULL,
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
  `CLASSROOM_ID` int(11) NOT NULL,
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
  `COLLEGE_ID` int(11) NOT NULL,
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
  `ID` int(11) NOT NULL,
  `DICT_ID` int(11) NULL DEFAULT NULL,
  `DICT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DICT_KEY` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DICT_VALUE` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dicts
-- ----------------------------

-- ----------------------------
-- Table structure for file_storage
-- ----------------------------
DROP TABLE IF EXISTS `file_storage`;
CREATE TABLE `file_storage`  (
  `DOC_ID` int(11) NULL DEFAULT NULL,
  `HANDIN_ID` int(11) NULL DEFAULT NULL,
  `FILE_ID` int(11) NOT NULL,
  `FILE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SIZE` int(11) NULL DEFAULT NULL,
  `LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEL_FLAG` tinyint(1) NULL DEFAULT NULL,
  `UPLOAD_BY` int(11) NULL DEFAULT NULL,
  `UPLOAD_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_22`(`UPLOAD_BY`) USING BTREE,
  INDEX `DOC_ID`(`DOC_ID`, `HANDIN_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_22` FOREIGN KEY (`UPLOAD_BY`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `file_storage_ibfk_1` FOREIGN KEY (`DOC_ID`, `HANDIN_ID`) REFERENCES `handin` (`HANDIN_ID`, `DOC_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_storage
-- ----------------------------

-- ----------------------------
-- Table structure for given_subject
-- ----------------------------
DROP TABLE IF EXISTS `given_subject`;
CREATE TABLE `given_subject`  (
  `DOC_ID` int(11) NULL DEFAULT NULL,
  `SUB_ID` int(11) NOT NULL,
  `GIVEN_BY` int(11) NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  `IS_PASSED` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`SUB_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_34`(`GIVEN_BY`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_34` FOREIGN KEY (`GIVEN_BY`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of given_subject
-- ----------------------------

-- ----------------------------
-- Table structure for handin
-- ----------------------------
DROP TABLE IF EXISTS `handin`;
CREATE TABLE `handin`  (
  `HANDIN_ID` int(11) NOT NULL,
  `DOC_ID` int(11) NULL DEFAULT NULL,
  `RETRIES` int(11) NULL DEFAULT NULL,
  `TYPE` int(11) NULL DEFAULT NULL,
  `FEEDBACK` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `HANDIN_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`HANDIN_ID`) USING BTREE,
  INDEX `HANDIN_ID`(`HANDIN_ID`, `DOC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of handin
-- ----------------------------

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `MAJOR_ID` int(11) NOT NULL,
  `COLLEGE_ID` int(11) NULL DEFAULT NULL,
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
  `MENU_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) NULL DEFAULT NULL,
  `MENU_NAME` int(11) NULL DEFAULT NULL,
  `PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMPONENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PERMS_ID` int(11) NULL DEFAULT NULL,
  `ORDER_NUM` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_42`(`PERMS_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_42` FOREIGN KEY (`PERMS_ID`) REFERENCES `perms` (`PERMS_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `MESSAGE_ID` int(11) NOT NULL,
  `TEACHER_ID` int(11) NULL DEFAULT NULL,
  `STU_ID` int(11) NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TYPE` int(11) NULL DEFAULT NULL,
  `DETAIL` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`MESSAGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for perms
-- ----------------------------
DROP TABLE IF EXISTS `perms`;
CREATE TABLE `perms`  (
  `PERMS_ID` int(11) NOT NULL,
  `PERMS_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PERMS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of perms
-- ----------------------------

-- ----------------------------
-- Table structure for plea
-- ----------------------------
DROP TABLE IF EXISTS `plea`;
CREATE TABLE `plea`  (
  `ID` int(11) NOT NULL,
  `STAGE` int(11) NULL DEFAULT NULL,
  `ARRANGE_ID` int(11) NULL DEFAULT NULL,
  `STU_GROUP_ID` int(11) NULL DEFAULT NULL,
  `ACCEPTANCE_TEAM_ID` int(11) NULL DEFAULT NULL,
  `SCORE` int(11) NULL DEFAULT NULL,
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
  `ARRANGE_ID` int(11) NOT NULL,
  `CLASSROOM_ID` int(11) NULL DEFAULT NULL,
  `SEC_ID` int(11) NULL DEFAULT NULL,
  `TIME` int(11) NULL DEFAULT NULL,
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
  `REPORT_ID` int(11) NOT NULL,
  `DOC_ID` int(11) NULL DEFAULT NULL,
  `SCORE` int(11) NULL DEFAULT NULL,
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
  `ROLE_ID` int(11) NOT NULL,
  `ROLE_NAME` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for role_stage_perms
-- ----------------------------
DROP TABLE IF EXISTS `role_stage_perms`;
CREATE TABLE `role_stage_perms`  (
  `ROLE_ID` int(11) NULL DEFAULT NULL,
  `STAGE` int(11) NULL DEFAULT NULL,
  `PERMS_ID` int(11) NULL DEFAULT NULL,
  INDEX `FK_RELATIONSHIP_43`(`ROLE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_44`(`PERMS_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_43` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_44` FOREIGN KEY (`PERMS_ID`) REFERENCES `perms` (`PERMS_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置各阶段角色的权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_stage_perms
-- ----------------------------

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `STU_ID` int(11) NULL DEFAULT NULL,
  `START_SCORE` int(11) NULL DEFAULT NULL COMMENT '答辩和成果（包括报告）',
  `MID_SCORE` int(11) NULL DEFAULT NULL,
  `END_SCORE` int(11) NULL DEFAULT NULL,
  `THESIS_SCORE` int(11) NULL DEFAULT NULL,
  `PROCEDURE_SCORE` int(11) NULL DEFAULT NULL,
  `FINAL_SCORE` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score
-- ----------------------------

-- ----------------------------
-- Table structure for score_detail
-- ----------------------------
DROP TABLE IF EXISTS `score_detail`;
CREATE TABLE `score_detail`  (
  `STU_ID` int(11) NULL DEFAULT NULL,
  `SCORE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCORE` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score_detail
-- ----------------------------

-- ----------------------------
-- Table structure for secretary
-- ----------------------------
DROP TABLE IF EXISTS `secretary`;
CREATE TABLE `secretary`  (
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_GENDER` int(11) NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `SEC_ID` int(11) NOT NULL,
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
  `DOC_ID` int(11) NULL DEFAULT NULL,
  `TASK_ID` int(11) NOT NULL,
  `TEACHER_ID` int(11) NULL DEFAULT NULL,
  `STU_ID` int(11) NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DETAIL` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `STAGE` int(11) NULL DEFAULT NULL,
  `SCORE` int(11) NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
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
  `GROUP_ID` int(11) NOT NULL,
  `STU_ID` int(11) NULL DEFAULT NULL,
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
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_GENDER` int(11) NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `STU_ID` int(11) NOT NULL,
  `COLLEGE_ID` int(11) NULL DEFAULT NULL,
  `MAJOR_ID` int(11) NULL DEFAULT NULL,
  `CLASS_ID` int(11) NULL DEFAULT NULL,
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
  `DOC_ID` int(11) NULL DEFAULT NULL,
  `SUB_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `POSE_BY` int(11) NULL DEFAULT NULL,
  `SUB_ID` int(11) NOT NULL,
  `GIV_SUB_ID` int(11) NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  `MAJOR_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`SUB_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_10`(`POSE_BY`) USING BTREE,
  INDEX `FK_RELATIONSHIP_33`(`GIV_SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`POSE_BY`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_28` FOREIGN KEY (`SUB_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_33` FOREIGN KEY (`GIV_SUB_ID`) REFERENCES `given_subject` (`SUB_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subject
-- ----------------------------

-- ----------------------------
-- Table structure for system_stage
-- ----------------------------
DROP TABLE IF EXISTS `system_stage`;
CREATE TABLE `system_stage`  (
  `CURR_STAGE` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统当前状态' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_stage
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_GENDER` int(11) NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TEACHER_ID` int(11) NOT NULL,
  `COLLEGE_ID` int(11) NULL DEFAULT NULL,
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
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_GENDER` int(11) NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `OFFICE_ID` int(11) NOT NULL,
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
  `DOC_ID` int(11) NULL DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `STU_ID` int(11) NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  `SCORE` int(11) NULL DEFAULT NULL,
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
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `USER_ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户登录账号',
  `USER_PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `USER_TEL` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `USER_MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USER_GENDER` int(11) NULL DEFAULT NULL COMMENT '性别(0女1男)',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ROLE_ID` int(11) NULL DEFAULT NULL,
  `USER_ID` int(11) NULL DEFAULT NULL,
  INDEX `FK_RELATIONSHIP_23`(`USER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_24`(`ROLE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_23` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_24` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------

-- ----------------------------
-- Table structure for user_stage
-- ----------------------------
DROP TABLE IF EXISTS `user_stage`;
CREATE TABLE `user_stage`  (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NULL DEFAULT NULL,
  `STAGE` int(11) NULL DEFAULT NULL,
  `IS_ALLOWED` tinyint(1) NULL DEFAULT NULL,
  `START_TIME` datetime NULL DEFAULT NULL,
  `END_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_30`(`USER_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_30` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户当前状态' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_stage
-- ----------------------------

-- ----------------------------
-- Table structure for weight
-- ----------------------------
DROP TABLE IF EXISTS `weight`;
CREATE TABLE `weight`  (
  `ID` int(11) NOT NULL,
  `STAGE` int(11) NULL DEFAULT NULL,
  `WEIGHT` float NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of weight
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
