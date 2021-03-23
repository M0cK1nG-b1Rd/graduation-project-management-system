/*
 Navicat Premium Data Transfer

 Source Server         : new2
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 106.14.150.115:6000
 Source Schema         : gms

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 23/03/2021 20:10:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acceptance_teacher
-- ----------------------------
DROP TABLE IF EXISTS `acceptance_teacher`;
CREATE TABLE `acceptance_teacher`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TEACHER_ID` int NULL DEFAULT NULL COMMENT '老师ID',
  `TEAM_ID` int NULL DEFAULT NULL,
  `IS_LEADER` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_5`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_6`(`TEAM_ID`) USING BTREE,
  CONSTRAINT `acceptance_teacher_ibfk_1` FOREIGN KEY (`TEAM_ID`) REFERENCES `acceptance_team` (`TEAM_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收老师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acceptance_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for acceptance_team
-- ----------------------------
DROP TABLE IF EXISTS `acceptance_team`;
CREATE TABLE `acceptance_team`  (
  `TEAM_ID` int NOT NULL AUTO_INCREMENT,
  `SEC_ID` int NULL DEFAULT NULL,
  `STAGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TEAM_ID`) USING BTREE,
  INDEX `SEC_ID`(`SEC_ID`) USING BTREE,
  CONSTRAINT `acceptance_team_ibfk_1` FOREIGN KEY (`SEC_ID`) REFERENCES `secretary` (`SEC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收小组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acceptance_team
-- ----------------------------

-- ----------------------------
-- Table structure for achievement
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement`  (
  `ACHIEVEMENT_ID` int NOT NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ACHIEVEMENT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '成果物' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of achievement
-- ----------------------------

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `ADMIN_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `ADMIN_ID`(`ADMIN_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_3` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANN_ID` int NOT NULL AUTO_INCREMENT,
  `ANN_TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_BY` int NULL DEFAULT NULL,
  `ANN_DETAIL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TYPE` int NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SIGNATURE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ANN_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_20`(`CREATE_BY`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_20` FOREIGN KEY (`CREATE_BY`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('da9e4529498d42e18087ca50d451ddf3', 38, '2021年秋季日本千叶大学顶尖设计专业课程学分项目选拔通知', 401, '<h1 class=\"ql-align-center\">2021年秋季日本千叶大学顶尖设计专业课程学分项目选拔通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-23<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;262</span></h3><p class=\"ql-align-center\"><br></p><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年秋季日本千叶大学顶尖设计专业课程学分项目选拔通知</strong></p><p>	依据我校发展国际化教育的方针和校际合作协议，为实施我校的教育国际化战略，培养具有国际视野和国际竞争力的高素质人才，鼓励我校学生出国（境）深造获得第二校园的学习经历，2021年秋季，我校将选拔优秀在校本科生前往日本千叶大学，参加为期一学期的交流学习。</p><p>	<strong>项目报名截止时间：2021年3月31日</strong></p><p>	<strong>地点：日本千叶大学</strong></p><p>	<strong>项目时间：</strong>2021年10月-2022年1月</p><p>	<strong>一、项目介绍</strong></p><p>	<strong>1、学校简介</strong></p><p>	千叶大学是日本著名的国立大学，也是最早设立工业设计专业的大学。一直以来其专业排名处于日本领先地位。现在知名的工业设计专家几乎都出身于千叶大学工学部。如索尼Walkman设计总监黒木靖夫、丰田汽车设计总监平井和平等。在各大学纷纷设立工业设计专业的今天，大多数学校的学科带头人也出身于千叶大学。</p><p>	<strong>2、项目介绍</strong></p><p>	为进一步加强和推动世界主要国家间的高等教育交流，培养国际化高端人才，千叶大学工学部特此开设了Top-Design专业学期课程。参加该项目的学生将以千叶大学工学部【特别听讲生】身份赴日学习。</p><p>	在零距离触感世界顶尖设计理念的引导下，深化领略和学习艺术与科技融合的巧妙构思。所有课程均采用英文授课，以【演习形式】的授课模式分成全新的设计小组。学生根据老师设置的课题通过进行头脑风暴、实际设计、动手操作，最终完成作品。在学习期间，中国学生也将有同千叶大学在校本籍学生共同学习，互动交流的机会。最终通过考核后，千叶大学会给予中国学生20学分作为该阶段学习的认可,并颁发官方成绩单和结业证书。</p><p>	<strong>3、课程内容</strong></p><p>	<strong>授课方式：</strong></p><p>	Top-Design Program will be conducted in the studio work. Professors who worked in the company as an in-house designer, will be teaching all programs.（以工作室形式教学，本项目由从事企业工作的资深教授全程授课。）</p><p>	<strong>授课语言：</strong>英文</p><p>	<strong>课程主题（大类）</strong>：</p><p>	*下表为往年学期内容参考，具体以学校实际课程为准：（见附件）</p><p>	项目费用：811,038日元/人（日元对人民币汇率仅供参考,以当日银行官方价格为准）</p><p>	项目费包含报名费、学费及项目参加服务费；</p><p>	其中，项目参加服务费包括：出发前的指导申请材料及入学材料、国际邮寄、在留换签指导、协助在日住宿申请、行前指导；日本现地服务的接机服务、住宿安置、协助在当地事务所办理外国人登录手续、协助办理银行开户手续、协助办理开通手机手续、国民健康保险费等。</p><p>	<strong>二、报名要求</strong></p><p>	1、大一、大二在校本科生，工业设计（设计相关）专业；</p><p>	2、大学英语4级480分以上或相应英文水平；</p><p>	3、在校期间未受处分、无不及格成绩、成绩优异、品行端正；</p><p>	<strong>三、项目申请报名流程及所需材料</strong></p><p>	1、2021年3月28日前有意向且符合条件学生在西安交通大学外事服务平台<a href=\"http://org.xjtu.edu.cn/openplatform/login.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(30, 80, 162);\">http://org.xjtu.edu.cn/openplatform/login.html</a>完成报名；</p><p>	2、2021年3月28日前书院通过外事服务系统对报名人选进行审核；</p><p>	3、2021年3月29日前学院通过外事服务系统按要求完成初选审核；</p><p>	4、2021年3月30日前教务处通过外事服务系统对初选名单进行审核；</p><p>	5、2021年3月31日前国际处终审确定最终校级推荐人选；</p><p>	<strong>四、项目管理</strong></p><p>	报名咨询：学院教务员</p><p>	学分转换政策咨询：学院、校教务处魏老师联系电话：82665477</p><p>	项目咨询管理：国际处徐老师办公地点：科学馆111室</p><p>	联系电话:029-82668236 E-mail: yanting@xjtu.edu.cn</p><p>	咨询时间：周一至周五工作日，下午工作时间：14:00-18:00（冬令时）、14:30-18:30（夏令时），双休、法定节假日除外，非工作时间请邮件咨询。</p><p>	<strong>注：所有同学完成在线报名后，需扫描报名系统内提供二维码加入项目管理微信群，后续项目相关通知将通过微信群即时通报，所有项目候选人务必及时进群。</strong></p><p>	<strong>五、离校手续</strong></p><p>	1、入选学生离校前填写《西安交通大学学生境外学习承诺书》；</p><p>	2、根据西安交通大学要求办理出访审批手续，出访审批手续办理请登录国际处主页“因公出境-校内审批”栏查看；</p><p>	3、参照《本科生赴国境外学习管理办法》（教务处主页“规章制度”栏查看）办理修读计划（与学院协商制定）、保留学籍、离校等手续。</p><p>	<strong>注：日本千叶大学3月24日召开线上项目官方说明会，有意向参会的学生请查看宣讲会详细信息（见附件）。</strong></p><p>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p class=\"ql-align-right\">2021年3月23日</p><p><br></p>', 1, 'YFB', '教务处', '2021-03-23 20:00:00');

-- ----------------------------
-- Table structure for applied_subject
-- ----------------------------
DROP TABLE IF EXISTS `applied_subject`;
CREATE TABLE `applied_subject`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SUB_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `APPLY_TIME` datetime NULL DEFAULT NULL,
  `APPLY_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `FEEDBACK` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `AUDIT_BY` int NULL DEFAULT NULL,
  `AUDIT_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_11`(`STU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_12`(`SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of applied_subject
-- ----------------------------

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `CLASS_ID` int NOT NULL,
  `CLASS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CLASS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (101, '1班');
INSERT INTO `class` VALUES (102, '2班');
INSERT INTO `class` VALUES (103, '3班');
INSERT INTO `class` VALUES (104, '4班');
INSERT INTO `class` VALUES (105, '5班');
INSERT INTO `class` VALUES (106, '6班');
INSERT INTO `class` VALUES (107, '7班');
INSERT INTO `class` VALUES (108, '8班');
INSERT INTO `class` VALUES (109, '9班');
INSERT INTO `class` VALUES (110, '10班');
INSERT INTO `class` VALUES (111, '11班');
INSERT INTO `class` VALUES (112, '12班');
INSERT INTO `class` VALUES (113, '13班');
INSERT INTO `class` VALUES (114, '14班');
INSERT INTO `class` VALUES (115, '15班');

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`  (
  `CLASSROOM_ID` int NOT NULL,
  `CLASSROOM_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CLASSROOM_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES (1, 'A101');
INSERT INTO `classroom` VALUES (2, 'A102');
INSERT INTO `classroom` VALUES (3, 'A103');
INSERT INTO `classroom` VALUES (4, 'A104');
INSERT INTO `classroom` VALUES (5, 'A105');
INSERT INTO `classroom` VALUES (6, 'A201');
INSERT INTO `classroom` VALUES (7, 'A202');
INSERT INTO `classroom` VALUES (8, 'A203');
INSERT INTO `classroom` VALUES (9, 'A204');
INSERT INTO `classroom` VALUES (10, 'A205');
INSERT INTO `classroom` VALUES (11, 'A301');
INSERT INTO `classroom` VALUES (12, 'A302');
INSERT INTO `classroom` VALUES (13, 'A303');
INSERT INTO `classroom` VALUES (14, 'A304');
INSERT INTO `classroom` VALUES (15, 'A305');
INSERT INTO `classroom` VALUES (16, 'B101');
INSERT INTO `classroom` VALUES (17, 'B102');
INSERT INTO `classroom` VALUES (18, 'B103');
INSERT INTO `classroom` VALUES (19, 'B104');
INSERT INTO `classroom` VALUES (20, 'B105');
INSERT INTO `classroom` VALUES (21, 'B201');
INSERT INTO `classroom` VALUES (22, 'B202');
INSERT INTO `classroom` VALUES (23, 'B203');
INSERT INTO `classroom` VALUES (24, 'B204');
INSERT INTO `classroom` VALUES (25, 'B205');
INSERT INTO `classroom` VALUES (26, 'B301');
INSERT INTO `classroom` VALUES (27, 'B302');
INSERT INTO `classroom` VALUES (28, 'B303');
INSERT INTO `classroom` VALUES (29, 'B304');
INSERT INTO `classroom` VALUES (30, 'B305');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `COLLEGE_ID` int NOT NULL,
  `COLLEGE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`COLLEGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学院' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (101, '数学学院');
INSERT INTO `college` VALUES (102, '物理学院');
INSERT INTO `college` VALUES (103, '化学学院');
INSERT INTO `college` VALUES (104, '机械学院');
INSERT INTO `college` VALUES (105, '电气学院');
INSERT INTO `college` VALUES (106, '软件学院');
INSERT INTO `college` VALUES (107, '能动学院');
INSERT INTO `college` VALUES (108, '材料学院');
INSERT INTO `college` VALUES (109, '人居学院');
INSERT INTO `college` VALUES (110, '生命学院');
INSERT INTO `college` VALUES (111, '航天学院');
INSERT INTO `college` VALUES (112, '化工学院');
INSERT INTO `college` VALUES (113, '医学部');
INSERT INTO `college` VALUES (114, '经金学院');
INSERT INTO `college` VALUES (115, '金禾经济中心');
INSERT INTO `college` VALUES (116, '管理学院');
INSERT INTO `college` VALUES (117, '公管学院');
INSERT INTO `college` VALUES (118, '人文学院');
INSERT INTO `college` VALUES (119, '新媒体学院');
INSERT INTO `college` VALUES (120, '马克思主义学院');
INSERT INTO `college` VALUES (121, '法学院');
INSERT INTO `college` VALUES (122, '外国语学院');
INSERT INTO `college` VALUES (123, '电信学院');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `DICT_ID` int NULL DEFAULT NULL,
  `DICT_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DICT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DICT_VALUE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (2, 'GENDER', 'M', '1', '男');
INSERT INTO `dict` VALUES (2, 'GENDER', 'F', '2', '女');
INSERT INTO `dict` VALUES (3, 'ANN_STATUS', 'WFB', '1', '未发布');
INSERT INTO `dict` VALUES (3, 'ANN_STATUS', 'YFB', '2', '已发布');
INSERT INTO `dict` VALUES (4, 'ANN_TYPE', 'XYTZ', '1', '学业通知');
INSERT INTO `dict` VALUES (4, 'ANN_TYPE', 'DBAP', '2', '答辩安排');
INSERT INTO `dict` VALUES (4, 'ANN_TYPE', 'GZAP', '3', '工作安排');
INSERT INTO `dict` VALUES (3, 'ANN_STATUS', 'YSC', '3', '已删除');
INSERT INTO `dict` VALUES (5, 'APPLY_STATUS', 'WSH', '1', '未审核');
INSERT INTO `dict` VALUES (5, 'APPLY_STATUS', 'WTG', '2', '未通过');
INSERT INTO `dict` VALUES (5, 'APPLY_STATUS', 'YTG', '3', '已通过');
INSERT INTO `dict` VALUES (6, 'ZONE', 'KXTS', '1', '科学探索与技术创新');
INSERT INTO `dict` VALUES (6, 'ZONE', 'SMGH', '2', '生命关怀与社会认知');
INSERT INTO `dict` VALUES (6, 'ZONE', 'ZXZH', '3', '哲学智慧与创新思维');
INSERT INTO `dict` VALUES (1, 'STAGE', 'CT', '1', '出题');
INSERT INTO `dict` VALUES (1, 'STAGE', 'XT', '2', '选题');
INSERT INTO `dict` VALUES (1, 'STAGE', 'KT', '3', '开题');
INSERT INTO `dict` VALUES (1, 'STAGE', 'ZQ', '4', '中期');
INSERT INTO `dict` VALUES (1, 'STAGE', 'JT', '5', '结题');
INSERT INTO `dict` VALUES (7, 'MESSAGE_TYPE', 'YCK', '2', '已查看');
INSERT INTO `dict` VALUES (7, 'MESSAGE_TYPE', 'WCK', '1', '未查看');
INSERT INTO `dict` VALUES (8, 'TASK_STATUS', 'WTJ', '1', '未提交');
INSERT INTO `dict` VALUES (8, 'TASK_STATUS', 'DSH', '2', '待审核');
INSERT INTO `dict` VALUES (8, 'TASK_STATUS', 'YTG', '3', '已通过');
INSERT INTO `dict` VALUES (8, 'TASK_STATUS', 'WTG', '4', '未通过');
INSERT INTO `dict` VALUES (9, 'THESIS_STATUS', 'DFZ', '1', '待分组');
INSERT INTO `dict` VALUES (9, 'THESIS_STATUS', 'YFZ', '2', '已分组');
INSERT INTO `dict` VALUES (9, 'THESIS_STATUS', 'YCF', '3', '已出分');

-- ----------------------------
-- Table structure for file_storage
-- ----------------------------
DROP TABLE IF EXISTS `file_storage`;
CREATE TABLE `file_storage`  (
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILE_ID` int NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SIZE` bigint NULL DEFAULT NULL,
  `LOCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEL_FLAG` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  `UPLOAD_BY` int NULL DEFAULT NULL,
  `UPLOAD_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_22`(`UPLOAD_BY`) USING BTREE,
  INDEX `DOC_ID`(`DOC_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_22` FOREIGN KEY (`UPLOAD_BY`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_storage
-- ----------------------------
INSERT INTO `file_storage` VALUES ('da9e4529498d42e18087ca50d451ddf3', 118, 'AC.pdf', NULL, 817283, 'D:\\fileuploadtest', 0, 401, '2021-03-23 20:01:15');
INSERT INTO `file_storage` VALUES ('516dc486a5884017a6f4c60ccea2dd22', 119, 'IRL (v2).pdf', NULL, 865009, 'D:\\fileuploadtest', 0, 201, '2021-03-23 20:07:00');

-- ----------------------------
-- Table structure for handin
-- ----------------------------
DROP TABLE IF EXISTS `handin`;
CREATE TABLE `handin`  (
  `ID` int NOT NULL,
  `HANDIN_ID` int NULL DEFAULT 0 COMMENT '如果是0（默认），即是不需要handin这个过程的doc',
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RETRIES` int NULL DEFAULT NULL,
  `TYPE` int NULL DEFAULT NULL,
  `FEEDBACK` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `HANDIN_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `HANDIN_ID`(`HANDIN_ID`, `DOC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 20:08:45', NULL, '127.0.0.1');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `MAJOR_ID` int NOT NULL,
  `COLLEGE_ID` int NULL DEFAULT NULL,
  `MAJOR_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`MAJOR_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_32`(`COLLEGE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_32` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '专业' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (200, 101, '信息与计算科学');
INSERT INTO `major` VALUES (201, 101, '数学与应用数学');
INSERT INTO `major` VALUES (202, 101, '统计学及数学与应用数学拔尖学生培养试验班');
INSERT INTO `major` VALUES (203, 101, '强基计划数学类');
INSERT INTO `major` VALUES (204, 102, '应用物理');
INSERT INTO `major` VALUES (205, 102, '光电信息科学与工程');
INSERT INTO `major` VALUES (206, 102, '材料物理');
INSERT INTO `major` VALUES (207, 103, '化学');
INSERT INTO `major` VALUES (208, 103, '应用化学');
INSERT INTO `major` VALUES (209, 104, '机械制造及其自动化');
INSERT INTO `major` VALUES (210, 104, '机械电子工程');
INSERT INTO `major` VALUES (211, 104, '机械设计及理论');
INSERT INTO `major` VALUES (212, 104, '车辆工程');
INSERT INTO `major` VALUES (213, 104, '精密仪器及机械');
INSERT INTO `major` VALUES (214, 104, '测试计量技术及仪器');
INSERT INTO `major` VALUES (215, 104, '设计学');
INSERT INTO `major` VALUES (216, 105, '电气工程及其自动化');
INSERT INTO `major` VALUES (217, 105, '测控技术与仪器');
INSERT INTO `major` VALUES (218, 106, '软件工程');
INSERT INTO `major` VALUES (219, 107, '环境工程');
INSERT INTO `major` VALUES (220, 107, '新能源科学与工程');
INSERT INTO `major` VALUES (221, 107, '能源与动力工程');
INSERT INTO `major` VALUES (222, 107, '能源动力类');
INSERT INTO `major` VALUES (223, 123, '计算机科学与技术');
INSERT INTO `major` VALUES (224, 123, '信息与通信工程');
INSERT INTO `major` VALUES (225, 123, '电子科学与工程');
INSERT INTO `major` VALUES (226, 123, '自动化科学与工程');
INSERT INTO `major` VALUES (227, 123, '人工智能');
INSERT INTO `major` VALUES (228, 123, '微电子');
INSERT INTO `major` VALUES (229, 108, '材料学');
INSERT INTO `major` VALUES (230, 108, '材料加工工程');
INSERT INTO `major` VALUES (231, 108, '材料物理与化学');
INSERT INTO `major` VALUES (232, 109, '建筑学');
INSERT INTO `major` VALUES (233, 109, '土木工程');
INSERT INTO `major` VALUES (234, 109, '建筑环境与能源应用工程');
INSERT INTO `major` VALUES (235, 109, '环境科学');
INSERT INTO `major` VALUES (236, 109, '人居环境科学与技术');
INSERT INTO `major` VALUES (237, 110, '生物医学');
INSERT INTO `major` VALUES (238, 110, '生物技术');
INSERT INTO `major` VALUES (239, 110, '化学生物学实验班');
INSERT INTO `major` VALUES (240, 111, '工程力学');
INSERT INTO `major` VALUES (241, 111, '飞行器设计与工程');
INSERT INTO `major` VALUES (242, 111, '飞行器动力工程');
INSERT INTO `major` VALUES (243, 112, '化学工程与工艺');
INSERT INTO `major` VALUES (244, 112, '过程装备与控制工程');
INSERT INTO `major` VALUES (245, 113, '临床医学');
INSERT INTO `major` VALUES (246, 113, '口腔医学');
INSERT INTO `major` VALUES (247, 113, '预防医学');
INSERT INTO `major` VALUES (248, 113, '法医学');
INSERT INTO `major` VALUES (249, 113, '基础医学');
INSERT INTO `major` VALUES (250, 113, '护理学');
INSERT INTO `major` VALUES (251, 113, '药学');
INSERT INTO `major` VALUES (252, 113, '制药工程');
INSERT INTO `major` VALUES (253, 113, '临床药学');
INSERT INTO `major` VALUES (254, 114, '经济学类');
INSERT INTO `major` VALUES (255, 114, '财政学类');
INSERT INTO `major` VALUES (256, 114, '金融学类');
INSERT INTO `major` VALUES (257, 114, '经济与贸易类');
INSERT INTO `major` VALUES (258, 114, '电子商务类');
INSERT INTO `major` VALUES (259, 115, '金禾经济研究中心');
INSERT INTO `major` VALUES (260, 116, '工业工程');
INSERT INTO `major` VALUES (261, 116, '管理科学');
INSERT INTO `major` VALUES (262, 116, '信息管理与电子商务');
INSERT INTO `major` VALUES (263, 116, '组织管理');
INSERT INTO `major` VALUES (264, 116, '市场营销');
INSERT INTO `major` VALUES (265, 116, '创新创业与战略');
INSERT INTO `major` VALUES (266, 116, '会计与财务');
INSERT INTO `major` VALUES (267, 117, '公共管理');
INSERT INTO `major` VALUES (268, 118, '哲学');
INSERT INTO `major` VALUES (269, 118, '社会学');
INSERT INTO `major` VALUES (270, 118, '汉语言文学');
INSERT INTO `major` VALUES (271, 118, '环境设计');
INSERT INTO `major` VALUES (272, 118, '书法学');
INSERT INTO `major` VALUES (273, 119, '网络与新媒体');
INSERT INTO `major` VALUES (274, 121, '国际经济法与比较法');
INSERT INTO `major` VALUES (275, 122, '英语');
INSERT INTO `major` VALUES (276, 122, '日语');
INSERT INTO `major` VALUES (277, 122, '法语');
INSERT INTO `major` VALUES (278, 122, '德语');
INSERT INTO `major` VALUES (279, 122, '俄语');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `MENU_ID` int NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int NULL DEFAULT NULL,
  `MENU_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPONENT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ICON` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` tinyint(1) NULL DEFAULT NULL,
  `PERMS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_NUM` int NULL DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_42`(`PERMS`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '系统管理', '/sys', NULL, 'el-icon-setting', 0, 'sys', 1);
INSERT INTO `menu` VALUES (3, 1, '用户管理', '/sys/user', NULL, 'el-icon-loading', 0, 'user:manage', 1);
INSERT INTO `menu` VALUES (4, 1, '角色管理', '/sys/role', NULL, 'el-icon-user', 0, 'role:manage', 2);
INSERT INTO `menu` VALUES (5, 1, '权限管理', '/sys/perm', NULL, 'el-icon-key', 0, 'perms:manage', 3);
INSERT INTO `menu` VALUES (6, 1, '菜单管理', '/sys/menu', NULL, 'el-icon-set-up', 0, 'menu:manage', 4);
INSERT INTO `menu` VALUES (8, 1, '阶段控制', '/sys/stage', NULL, 'el-icon-data-line', 0, 'sys:stage', 1);
INSERT INTO `menu` VALUES (10, 0, '公告管理', '/notice', NULL, 'el-icon-chat-line-square', 0, 'notice', 2);
INSERT INTO `menu` VALUES (11, 10, '管理公告', '/notice/manage', NULL, 'el-icon-s-check', 1, 'notice:manage', NULL);
INSERT INTO `menu` VALUES (12, 10, '查看公告', '/notice/view', NULL, 'el-icon-view', 1, 'notice:view', NULL);
INSERT INTO `menu` VALUES (13, 0, '过程监督', '/process', NULL, 'el-icon-data-line', 1, 'process', NULL);
INSERT INTO `menu` VALUES (14, 13, '任务管理', '/process/teacher/manage', NULL, 'el-icon-edit-outline', 1, 'process:manage', NULL);
INSERT INTO `menu` VALUES (15, 13, '我的任务', '/process/student/my', NULL, 'el-icon-postcard', 1, 'process:my', NULL);
INSERT INTO `menu` VALUES (16, 13, '提交记录', '/process/student/records', NULL, 'el-icon-postcard', 1, 'process:record', NULL);
INSERT INTO `menu` VALUES (17, 13, '任务审核', '/process/teacher/judge', NULL, 'el-icon-folder-checked', 1, 'process:judge', NULL);
INSERT INTO `menu` VALUES (18, 13, '统计报表', '/process/statistics', NULL, 'el-icon-s-data', 1, 'process:statistics', NULL);
INSERT INTO `menu` VALUES (19, 0, '出题管理', '/subject/apply', NULL, 'el-icon-s-management', 1, 'apply', NULL);
INSERT INTO `menu` VALUES (20, 19, '教师出题', '/subject/apply/teacher', NULL, 'el-icon-s-custom', 1, 'apply:teacher', NULL);
INSERT INTO `menu` VALUES (23, 19, '教研室审题', '/subject/judge/final', NULL, 'el-icon-circle-check', 1, 'apply:office', NULL);
INSERT INTO `menu` VALUES (24, 19, '审核状态', '/subject/apply/result', NULL, 'el-icon-wallet', 1, 'apply:result', NULL);
INSERT INTO `menu` VALUES (25, 0, '选题管理', '/subject/select', NULL, 'el-icon-thumb', 0, 'select', 4);
INSERT INTO `menu` VALUES (26, 25, '查看所有课题', '/subject/all', NULL, 'el-icon-menu', 0, 'select:view', 1);
INSERT INTO `menu` VALUES (28, 25, '教师审核', '/subject/select/judge/teacher', NULL, 'el-icon-check', 0, 'select:teacher', 5);
INSERT INTO `menu` VALUES (29, 25, '教研室审核', '/subject/select/judge/final', NULL, 'el-icon-check', 1, 'select:final', NULL);
INSERT INTO `menu` VALUES (30, 25, '查看互选信息', '/subject/select/result', NULL, 'el-icon-view', 1, 'select:result', NULL);
INSERT INTO `menu` VALUES (31, 0, '开题管理', '/initial', NULL, 'el-icon-video-play', 1, 'init', NULL);
INSERT INTO `menu` VALUES (32, 0, '中期管理', '/middle', NULL, 'el-icon-time', 0, 'mid', 3);
INSERT INTO `menu` VALUES (33, 0, '结题管理', '/finish', NULL, 'el-icon-timer', 0, 'fin', 1);
INSERT INTO `menu` VALUES (35, 31, '开题报告', '/initial/myReport', NULL, 'el-icon-edit-outline', NULL, 'init:report', NULL);
INSERT INTO `menu` VALUES (36, 31, '我的记录', '/initial/myList', NULL, 'el-icon-notebook-2', NULL, 'init:list', NULL);
INSERT INTO `menu` VALUES (37, 31, '开题审核', '/initial/startCheck', NULL, 'el-icon-s-check', NULL, 'init:check', NULL);
INSERT INTO `menu` VALUES (38, 31, '安排答辩', '/initial/arrange', NULL, 'el-icon-set-up', NULL, 'init:arrange', NULL);
INSERT INTO `menu` VALUES (39, 31, '我的答辩安排', '/initial/arrange/my', NULL, 'el-icon-set-up', NULL, 'init:myarrange', NULL);
INSERT INTO `menu` VALUES (40, 31, '答辩评分', '/initial/score', NULL, 'el-icon-finished', NULL, 'init:score', NULL);
INSERT INTO `menu` VALUES (41, 32, '中期报告', '/middle/myReport', NULL, 'el-icon-edit-outline', NULL, 'mid:report', NULL);
INSERT INTO `menu` VALUES (42, 32, '我的记录', '/middle/myList', NULL, 'el-icon-notebook-2', NULL, 'mid:list', NULL);
INSERT INTO `menu` VALUES (43, 32, '中期审核', '/middle/midCheck', NULL, 'el-icon-s-check', NULL, 'mid:check', NULL);
INSERT INTO `menu` VALUES (44, 32, '安排答辩', '/middle/arrange', NULL, 'el-icon-set-up', NULL, 'mid:arrange', NULL);
INSERT INTO `menu` VALUES (45, 32, '我的答辩安排', '/middle/arrange/my', NULL, 'el-icon-set-up', NULL, 'mid:myarrange', NULL);
INSERT INTO `menu` VALUES (46, 32, '答辩评分', '/middle/score', NULL, 'el-icon-finished', NULL, 'mid:score', NULL);
INSERT INTO `menu` VALUES (47, 33, '结题申请', '/finish/apply', NULL, 'el-icon-s-claim', NULL, 'fin:apply', NULL);
INSERT INTO `menu` VALUES (48, 33, '申请记录', '/finish/myApplyList', NULL, 'el-icon-notebook-2', NULL, 'fin:list', NULL);
INSERT INTO `menu` VALUES (49, 33, '结题审核', '/finish/finishCheck', NULL, 'el-icon-s-check', NULL, 'fin:check', NULL);
INSERT INTO `menu` VALUES (50, 33, '安排答辩', '/finish/arrange', NULL, 'el-icon-set-up', NULL, 'fin:arrange', NULL);
INSERT INTO `menu` VALUES (51, 33, '我的答辩安排', '/finish/arrange/my', NULL, 'el-icon-set-up', NULL, 'fin:myarrange', NULL);
INSERT INTO `menu` VALUES (52, 33, '答辩评分', '/finish/score', NULL, 'el-icon-finished', NULL, 'fin:score', NULL);
INSERT INTO `menu` VALUES (53, 33, '评审安排', '/finish/crossJudgeArrange', NULL, 'el-icon-files', NULL, 'fin:cross', NULL);
INSERT INTO `menu` VALUES (54, 33, '交叉评审', '/finish/crossJudge', NULL, 'el-icon-document-checked', NULL, 'fin:judge', NULL);
INSERT INTO `menu` VALUES (55, 0, '组件测试界面', '/test', NULL, 'el-icon-data-line', 0, 'test', 2);
INSERT INTO `menu` VALUES (56, 0, '成绩管理', '/scoreManage', NULL, 'el-icon-s-platform', NULL, 'score', NULL);
INSERT INTO `menu` VALUES (57, 56, '权重配置', '/score/weight', NULL, 'el-icon-brush', NULL, 'score:weight', NULL);
INSERT INTO `menu` VALUES (58, 56, '我的成绩', '/scoreManage/myScoreList', NULL, 'el-icon-collection', NULL, 'score:my', NULL);
INSERT INTO `menu` VALUES (59, 56, '成绩列表', '/scoreManage/totalList', NULL, 'el-icon-document-copy', NULL, 'score:list', NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `MESSAGE_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FROM_ID` int NULL DEFAULT NULL,
  `TO_ID` int NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREAT_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`) USING BTREE,
  INDEX `FROM_ID`(`FROM_ID`) USING BTREE,
  INDEX `TO_ID`(`TO_ID`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`FROM_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`TO_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('0677324c49dd45b6a37a61394bf4e626', 401, 208, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('10c287aab7fe4f4aa3770b4e70e3b677', 401, 210, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('2317aaaf815e48beb7475d6eb71776b6', 401, 303, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('24e73ec98e4c4919af623f52937a0c8e', 401, 205, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('26554d5b6cde486fa12406a16b1fe01d', 401, 304, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('31a3c08ea83e4d97a88a0999a59f3604', 401, 116, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('38ba9cc9a9d74137a38a6e3a09f18a84', 401, 306, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('40953dd547ba4e069468139ce8863ef6', 401, 108, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('49eb85376aa44d808dc6972c42b052c2', 401, 113, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('4b0ccfcc020543b0a42ba2dfdebdd991', 401, 203, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('4cdd34743b6d4c3192b8a45c7ea1b16c', 401, 110, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('4ddd785d546d4fdabb8da863c597b859', 401, 115, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('4dfedeba2bf547bebfb1f3286e76890e', 401, 112, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('57b73da8227040f1974e23f2839f7a2e', 401, 207, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('58bbed4e150e470bbdb24c1219af621d', 401, 107, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('5b0d627147ba4825a0d293e3201ce78f', 401, 119, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('60a64c74147840c19d9530f48195ba85', 401, 103, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('73d52c7812d64ec18cc495cf2d097f27', 401, 206, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('841c624314a6457da9c46ede864e364a', 401, 302, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('87ef5b013b3c455fb2936203ca8eccd4', 401, 109, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('885b5ea668a244a4a7383ff31a9d0a15', 401, 305, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('8bcb940792744f9182ccd97bb0652d37', 401, 111, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('9522f18f0ead4d329b6e705f08d629f5', 401, 114, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('9b72f04a4e4a4b3f8e3e588b7be3fe28', 401, 402, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('a8d4bea057cb4ddeb43f599d71f76990', 401, 105, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('aa3b64796f604981afa8f40854bf9daf', 401, 106, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('b146871eb0db4695b899d46f33af8fce', 401, 301, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('c2cb7f6d13aa4b998425e8aa69198f89', 401, 204, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('c6e3e6d7f0f646168612f89202709757', 401, 104, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('d1c3e6eb2cea46f3acd95e40916457e0', 401, 209, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('d68cbdc5a67e429e85c5dd9354ccba51', 401, 102, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('d710d271129c4f299632bc9853a9ffc3', 401, 117, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('dd5e2256174f4a728b2308879bb65958', 401, 202, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('dfd701ec8acd40189480c570d4860d77', 401, 120, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');
INSERT INTO `message` VALUES ('f2fa5da5fedd4e80bb08fe795eb7196e', 401, 118, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p></p><p>		目前系统的时期已经变更，现在的时期和相关说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 20:02:27');

-- ----------------------------
-- Table structure for plea
-- ----------------------------
DROP TABLE IF EXISTS `plea`;
CREATE TABLE `plea`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_GROUP_ID` int NULL DEFAULT NULL,
  `ACCEPTANCE_TEAM_ID` int NULL DEFAULT NULL,
  `CLASSROOM_ID` int NULL DEFAULT NULL,
  `START_TIME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `END_TIME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_RELEASE` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_39`(`STU_GROUP_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_9`(`ACCEPTANCE_TEAM_ID`) USING BTREE,
  INDEX `plea_ibfk_1`(`CLASSROOM_ID`) USING BTREE,
  CONSTRAINT `plea_ibfk_1` FOREIGN KEY (`CLASSROOM_ID`) REFERENCES `classroom` (`CLASSROOM_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `plea_ibfk_2` FOREIGN KEY (`ACCEPTANCE_TEAM_ID`) REFERENCES `acceptance_team` (`TEAM_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plea
-- ----------------------------

-- ----------------------------
-- Table structure for plea_result
-- ----------------------------
DROP TABLE IF EXISTS `plea_result`;
CREATE TABLE `plea_result`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `STU_ID` int NOT NULL,
  `PLEA_ID` int NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT 0,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_PASSED` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `STAGE`(`STAGE`) USING BTREE,
  INDEX `PLEA_ID`(`PLEA_ID`) USING BTREE,
  CONSTRAINT `plea_result_ibfk_1` FOREIGN KEY (`PLEA_ID`) REFERENCES `plea` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plea_result
-- ----------------------------

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SUB_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RETRIES` int NULL DEFAULT 0,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阶段（开题或中期）',
  `MEANING` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `RESULT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `PLAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `PROGRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于中期',
  `POST_PLAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于中期',
  `APPLY_REASON` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于结题',
  `POSE_BY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSE_TIME` datetime NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `AUDIT_BY` int NULL DEFAULT NULL,
  `AUDIT_TIME` datetime NULL DEFAULT NULL,
  `COMMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SCORE` int NULL DEFAULT NULL,
  `IS_RELEASED` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `ROLE_ID` int NOT NULL,
  `ROLE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员');
INSERT INTO `role` VALUES (2, '学生');
INSERT INTO `role` VALUES (3, '老师');
INSERT INTO `role` VALUES (4, '系办');
INSERT INTO `role` VALUES (5, '答辩秘书');

-- ----------------------------
-- Table structure for role_stage_perms
-- ----------------------------
DROP TABLE IF EXISTS `role_stage_perms`;
CREATE TABLE `role_stage_perms`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int NULL DEFAULT NULL,
  `STAGE_ID` int NULL DEFAULT NULL,
  `PERMS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_43`(`ROLE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_44`(`PERMS`) USING BTREE,
  INDEX `STAGE_ID`(`STAGE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_43` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_stage_perms_ibfk_1` FOREIGN KEY (`PERMS`) REFERENCES `menu` (`PERMS`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 695 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置各阶段角色的权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_stage_perms
-- ----------------------------
INSERT INTO `role_stage_perms` VALUES (8, 1, 0, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (9, 1, 0, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (10, 1, 0, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (11, 1, 0, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (12, 1, 0, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (13, 1, 0, 'notice');
INSERT INTO `role_stage_perms` VALUES (14, 1, 0, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (15, 1, 0, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (16, 1, 0, 'process');
INSERT INTO `role_stage_perms` VALUES (17, 1, 0, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (18, 1, 0, 'process:my');
INSERT INTO `role_stage_perms` VALUES (19, 1, 0, 'process:record');
INSERT INTO `role_stage_perms` VALUES (20, 1, 0, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (21, 1, 0, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (22, 1, 0, 'apply');
INSERT INTO `role_stage_perms` VALUES (23, 1, 0, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (24, 1, 0, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (25, 1, 0, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (26, 1, 0, 'select');
INSERT INTO `role_stage_perms` VALUES (27, 1, 0, 'select:view');
INSERT INTO `role_stage_perms` VALUES (28, 1, 0, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (29, 1, 0, 'select:final');
INSERT INTO `role_stage_perms` VALUES (30, 1, 0, 'select:result');
INSERT INTO `role_stage_perms` VALUES (31, 1, 0, 'init');
INSERT INTO `role_stage_perms` VALUES (32, 1, 0, 'mid');
INSERT INTO `role_stage_perms` VALUES (33, 1, 0, 'fin');
INSERT INTO `role_stage_perms` VALUES (34, 1, 0, 'init:report');
INSERT INTO `role_stage_perms` VALUES (35, 1, 0, 'init:list');
INSERT INTO `role_stage_perms` VALUES (36, 1, 0, 'init:check');
INSERT INTO `role_stage_perms` VALUES (37, 1, 0, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (38, 1, 0, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (39, 1, 0, 'init:score');
INSERT INTO `role_stage_perms` VALUES (40, 1, 0, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (41, 1, 0, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (42, 1, 0, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (43, 1, 0, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (44, 1, 0, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (45, 1, 0, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (46, 1, 0, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (47, 1, 0, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (48, 1, 0, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (49, 1, 0, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (50, 1, 0, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (51, 1, 0, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (52, 1, 0, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (53, 1, 0, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (54, 1, 0, 'test');
INSERT INTO `role_stage_perms` VALUES (55, 1, 0, 'score');
INSERT INTO `role_stage_perms` VALUES (56, 1, 0, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (57, 1, 0, 'score:my');
INSERT INTO `role_stage_perms` VALUES (58, 1, 0, 'score:list');
INSERT INTO `role_stage_perms` VALUES (59, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (60, 1, 1, 'sys');
INSERT INTO `role_stage_perms` VALUES (61, 1, 1, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (62, 1, 1, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (63, 1, 1, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (64, 1, 1, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (65, 1, 1, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (66, 1, 1, 'notice');
INSERT INTO `role_stage_perms` VALUES (67, 1, 1, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (68, 1, 1, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (69, 1, 1, 'process');
INSERT INTO `role_stage_perms` VALUES (70, 1, 1, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (71, 1, 1, 'process:my');
INSERT INTO `role_stage_perms` VALUES (72, 1, 1, 'process:record');
INSERT INTO `role_stage_perms` VALUES (73, 1, 1, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (74, 1, 1, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (75, 1, 1, 'apply');
INSERT INTO `role_stage_perms` VALUES (76, 1, 1, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (77, 1, 1, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (78, 1, 1, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (79, 1, 1, 'select');
INSERT INTO `role_stage_perms` VALUES (80, 1, 1, 'select:view');
INSERT INTO `role_stage_perms` VALUES (81, 1, 1, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (82, 1, 1, 'select:final');
INSERT INTO `role_stage_perms` VALUES (83, 1, 1, 'select:result');
INSERT INTO `role_stage_perms` VALUES (84, 1, 1, 'init');
INSERT INTO `role_stage_perms` VALUES (85, 1, 1, 'mid');
INSERT INTO `role_stage_perms` VALUES (86, 1, 1, 'fin');
INSERT INTO `role_stage_perms` VALUES (87, 1, 1, 'init:report');
INSERT INTO `role_stage_perms` VALUES (88, 1, 1, 'init:list');
INSERT INTO `role_stage_perms` VALUES (89, 1, 1, 'init:check');
INSERT INTO `role_stage_perms` VALUES (90, 1, 1, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (91, 1, 1, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (92, 1, 1, 'init:score');
INSERT INTO `role_stage_perms` VALUES (93, 1, 1, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (94, 1, 1, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (95, 1, 1, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (96, 1, 1, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (97, 1, 1, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (98, 1, 1, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (99, 1, 1, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (100, 1, 1, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (101, 1, 1, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (102, 1, 1, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (103, 1, 1, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (104, 1, 1, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (105, 1, 1, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (106, 1, 1, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (107, 1, 1, 'test');
INSERT INTO `role_stage_perms` VALUES (108, 1, 1, 'score');
INSERT INTO `role_stage_perms` VALUES (109, 1, 1, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (110, 1, 1, 'score:my');
INSERT INTO `role_stage_perms` VALUES (111, 1, 1, 'score:list');
INSERT INTO `role_stage_perms` VALUES (112, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (113, 1, 2, 'sys');
INSERT INTO `role_stage_perms` VALUES (114, 1, 2, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (115, 1, 2, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (116, 1, 2, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (117, 1, 2, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (118, 1, 2, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (119, 1, 2, 'notice');
INSERT INTO `role_stage_perms` VALUES (120, 1, 2, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (121, 1, 2, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (122, 1, 2, 'process');
INSERT INTO `role_stage_perms` VALUES (123, 1, 2, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (124, 1, 2, 'process:my');
INSERT INTO `role_stage_perms` VALUES (125, 1, 2, 'process:record');
INSERT INTO `role_stage_perms` VALUES (126, 1, 2, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (127, 1, 2, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (128, 1, 2, 'apply');
INSERT INTO `role_stage_perms` VALUES (129, 1, 2, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (130, 1, 2, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (131, 1, 2, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (132, 1, 2, 'select');
INSERT INTO `role_stage_perms` VALUES (133, 1, 2, 'select:view');
INSERT INTO `role_stage_perms` VALUES (134, 1, 2, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (135, 1, 2, 'select:final');
INSERT INTO `role_stage_perms` VALUES (136, 1, 2, 'select:result');
INSERT INTO `role_stage_perms` VALUES (137, 1, 2, 'init');
INSERT INTO `role_stage_perms` VALUES (138, 1, 2, 'mid');
INSERT INTO `role_stage_perms` VALUES (139, 1, 2, 'fin');
INSERT INTO `role_stage_perms` VALUES (140, 1, 2, 'init:report');
INSERT INTO `role_stage_perms` VALUES (141, 1, 2, 'init:list');
INSERT INTO `role_stage_perms` VALUES (142, 1, 2, 'init:check');
INSERT INTO `role_stage_perms` VALUES (143, 1, 2, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (144, 1, 2, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (145, 1, 2, 'init:score');
INSERT INTO `role_stage_perms` VALUES (146, 1, 2, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (147, 1, 2, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (148, 1, 2, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (149, 1, 2, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (150, 1, 2, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (151, 1, 2, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (152, 1, 2, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (153, 1, 2, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (154, 1, 2, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (155, 1, 2, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (156, 1, 2, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (157, 1, 2, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (158, 1, 2, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (159, 1, 2, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (160, 1, 2, 'test');
INSERT INTO `role_stage_perms` VALUES (161, 1, 2, 'score');
INSERT INTO `role_stage_perms` VALUES (162, 1, 2, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (163, 1, 2, 'score:my');
INSERT INTO `role_stage_perms` VALUES (164, 1, 2, 'score:list');
INSERT INTO `role_stage_perms` VALUES (165, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (166, 1, 3, 'sys');
INSERT INTO `role_stage_perms` VALUES (167, 1, 3, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (168, 1, 3, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (169, 1, 3, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (170, 1, 3, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (171, 1, 3, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (172, 1, 3, 'notice');
INSERT INTO `role_stage_perms` VALUES (173, 1, 3, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (174, 1, 3, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (175, 1, 3, 'process');
INSERT INTO `role_stage_perms` VALUES (176, 1, 3, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (177, 1, 3, 'process:my');
INSERT INTO `role_stage_perms` VALUES (178, 1, 3, 'process:record');
INSERT INTO `role_stage_perms` VALUES (179, 1, 3, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (180, 1, 3, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (181, 1, 3, 'apply');
INSERT INTO `role_stage_perms` VALUES (182, 1, 3, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (183, 1, 3, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (184, 1, 3, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (185, 1, 3, 'select');
INSERT INTO `role_stage_perms` VALUES (186, 1, 3, 'select:view');
INSERT INTO `role_stage_perms` VALUES (187, 1, 3, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (188, 1, 3, 'select:final');
INSERT INTO `role_stage_perms` VALUES (189, 1, 3, 'select:result');
INSERT INTO `role_stage_perms` VALUES (190, 1, 3, 'init');
INSERT INTO `role_stage_perms` VALUES (191, 1, 3, 'mid');
INSERT INTO `role_stage_perms` VALUES (192, 1, 3, 'fin');
INSERT INTO `role_stage_perms` VALUES (193, 1, 3, 'init:report');
INSERT INTO `role_stage_perms` VALUES (194, 1, 3, 'init:list');
INSERT INTO `role_stage_perms` VALUES (195, 1, 3, 'init:check');
INSERT INTO `role_stage_perms` VALUES (196, 1, 3, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (197, 1, 3, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (198, 1, 3, 'init:score');
INSERT INTO `role_stage_perms` VALUES (199, 1, 3, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (200, 1, 3, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (201, 1, 3, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (202, 1, 3, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (203, 1, 3, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (204, 1, 3, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (205, 1, 3, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (206, 1, 3, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (207, 1, 3, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (208, 1, 3, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (209, 1, 3, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (210, 1, 3, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (211, 1, 3, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (212, 1, 3, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (213, 1, 3, 'test');
INSERT INTO `role_stage_perms` VALUES (214, 1, 3, 'score');
INSERT INTO `role_stage_perms` VALUES (215, 1, 3, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (216, 1, 3, 'score:my');
INSERT INTO `role_stage_perms` VALUES (217, 1, 3, 'score:list');
INSERT INTO `role_stage_perms` VALUES (218, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (219, 1, 4, 'sys');
INSERT INTO `role_stage_perms` VALUES (220, 1, 4, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (221, 1, 4, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (222, 1, 4, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (223, 1, 4, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (224, 1, 4, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (225, 1, 4, 'notice');
INSERT INTO `role_stage_perms` VALUES (226, 1, 4, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (227, 1, 4, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (228, 1, 4, 'process');
INSERT INTO `role_stage_perms` VALUES (229, 1, 4, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (230, 1, 4, 'process:my');
INSERT INTO `role_stage_perms` VALUES (231, 1, 4, 'process:record');
INSERT INTO `role_stage_perms` VALUES (232, 1, 4, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (233, 1, 4, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (234, 1, 4, 'apply');
INSERT INTO `role_stage_perms` VALUES (235, 1, 4, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (236, 1, 4, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (237, 1, 4, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (238, 1, 4, 'select');
INSERT INTO `role_stage_perms` VALUES (239, 1, 4, 'select:view');
INSERT INTO `role_stage_perms` VALUES (240, 1, 4, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (241, 1, 4, 'select:final');
INSERT INTO `role_stage_perms` VALUES (242, 1, 4, 'select:result');
INSERT INTO `role_stage_perms` VALUES (243, 1, 4, 'init');
INSERT INTO `role_stage_perms` VALUES (244, 1, 4, 'mid');
INSERT INTO `role_stage_perms` VALUES (245, 1, 4, 'fin');
INSERT INTO `role_stage_perms` VALUES (246, 1, 4, 'init:report');
INSERT INTO `role_stage_perms` VALUES (247, 1, 4, 'init:list');
INSERT INTO `role_stage_perms` VALUES (248, 1, 4, 'init:check');
INSERT INTO `role_stage_perms` VALUES (249, 1, 4, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (250, 1, 4, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (251, 1, 4, 'init:score');
INSERT INTO `role_stage_perms` VALUES (252, 1, 4, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (253, 1, 4, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (254, 1, 4, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (255, 1, 4, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (256, 1, 4, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (257, 1, 4, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (258, 1, 4, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (259, 1, 4, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (260, 1, 4, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (261, 1, 4, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (262, 1, 4, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (263, 1, 4, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (264, 1, 4, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (265, 1, 4, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (266, 1, 4, 'test');
INSERT INTO `role_stage_perms` VALUES (267, 1, 4, 'score');
INSERT INTO `role_stage_perms` VALUES (268, 1, 4, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (269, 1, 4, 'score:my');
INSERT INTO `role_stage_perms` VALUES (270, 1, 4, 'score:list');
INSERT INTO `role_stage_perms` VALUES (271, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (272, 1, 5, 'sys');
INSERT INTO `role_stage_perms` VALUES (273, 1, 5, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (274, 1, 5, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (275, 1, 5, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (276, 1, 5, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (277, 1, 5, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (278, 1, 5, 'notice');
INSERT INTO `role_stage_perms` VALUES (279, 1, 5, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (280, 1, 5, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (281, 1, 5, 'process');
INSERT INTO `role_stage_perms` VALUES (282, 1, 5, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (283, 1, 5, 'process:my');
INSERT INTO `role_stage_perms` VALUES (284, 1, 5, 'process:record');
INSERT INTO `role_stage_perms` VALUES (285, 1, 5, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (286, 1, 5, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (287, 1, 5, 'apply');
INSERT INTO `role_stage_perms` VALUES (288, 1, 5, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (289, 1, 5, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (290, 1, 5, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (291, 1, 5, 'select');
INSERT INTO `role_stage_perms` VALUES (292, 1, 5, 'select:view');
INSERT INTO `role_stage_perms` VALUES (293, 1, 5, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (294, 1, 5, 'select:final');
INSERT INTO `role_stage_perms` VALUES (295, 1, 5, 'select:result');
INSERT INTO `role_stage_perms` VALUES (296, 1, 5, 'init');
INSERT INTO `role_stage_perms` VALUES (297, 1, 5, 'mid');
INSERT INTO `role_stage_perms` VALUES (298, 1, 5, 'fin');
INSERT INTO `role_stage_perms` VALUES (299, 1, 5, 'init:report');
INSERT INTO `role_stage_perms` VALUES (300, 1, 5, 'init:list');
INSERT INTO `role_stage_perms` VALUES (301, 1, 5, 'init:check');
INSERT INTO `role_stage_perms` VALUES (302, 1, 5, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (303, 1, 5, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (304, 1, 5, 'init:score');
INSERT INTO `role_stage_perms` VALUES (305, 1, 5, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (306, 1, 5, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (307, 1, 5, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (308, 1, 5, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (309, 1, 5, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (310, 1, 5, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (311, 1, 5, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (312, 1, 5, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (313, 1, 5, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (314, 1, 5, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (315, 1, 5, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (316, 1, 5, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (317, 1, 5, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (318, 1, 5, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (319, 1, 5, 'test');
INSERT INTO `role_stage_perms` VALUES (320, 1, 5, 'score');
INSERT INTO `role_stage_perms` VALUES (321, 1, 5, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (322, 1, 5, 'score:my');
INSERT INTO `role_stage_perms` VALUES (323, 1, 5, 'score:list');
INSERT INTO `role_stage_perms` VALUES (324, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (325, 1, 6, 'sys');
INSERT INTO `role_stage_perms` VALUES (326, 1, 6, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (327, 1, 6, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (328, 1, 6, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (329, 1, 6, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (330, 1, 6, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (331, 1, 6, 'notice');
INSERT INTO `role_stage_perms` VALUES (332, 1, 6, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (333, 1, 6, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (334, 1, 6, 'process');
INSERT INTO `role_stage_perms` VALUES (335, 1, 6, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (336, 1, 6, 'process:my');
INSERT INTO `role_stage_perms` VALUES (337, 1, 6, 'process:record');
INSERT INTO `role_stage_perms` VALUES (338, 1, 6, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (339, 1, 6, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (340, 1, 6, 'apply');
INSERT INTO `role_stage_perms` VALUES (341, 1, 6, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (342, 1, 6, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (343, 1, 6, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (344, 1, 6, 'select');
INSERT INTO `role_stage_perms` VALUES (345, 1, 6, 'select:view');
INSERT INTO `role_stage_perms` VALUES (346, 1, 6, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (347, 1, 6, 'select:final');
INSERT INTO `role_stage_perms` VALUES (348, 1, 6, 'select:result');
INSERT INTO `role_stage_perms` VALUES (349, 1, 6, 'init');
INSERT INTO `role_stage_perms` VALUES (350, 1, 6, 'mid');
INSERT INTO `role_stage_perms` VALUES (351, 1, 6, 'fin');
INSERT INTO `role_stage_perms` VALUES (352, 1, 6, 'init:report');
INSERT INTO `role_stage_perms` VALUES (353, 1, 6, 'init:list');
INSERT INTO `role_stage_perms` VALUES (354, 1, 6, 'init:check');
INSERT INTO `role_stage_perms` VALUES (355, 1, 6, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (356, 1, 6, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (357, 1, 6, 'init:score');
INSERT INTO `role_stage_perms` VALUES (358, 1, 6, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (359, 1, 6, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (360, 1, 6, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (361, 1, 6, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (362, 1, 6, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (363, 1, 6, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (364, 1, 6, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (365, 1, 6, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (366, 1, 6, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (367, 1, 6, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (368, 1, 6, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (369, 1, 6, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (370, 1, 6, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (371, 1, 6, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (372, 1, 6, 'test');
INSERT INTO `role_stage_perms` VALUES (373, 1, 6, 'score');
INSERT INTO `role_stage_perms` VALUES (374, 1, 6, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (375, 1, 6, 'score:my');
INSERT INTO `role_stage_perms` VALUES (376, 1, 6, 'score:list');
INSERT INTO `role_stage_perms` VALUES (377, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (378, 1, 7, 'sys');
INSERT INTO `role_stage_perms` VALUES (379, 1, 7, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (380, 1, 7, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (381, 1, 7, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (382, 1, 7, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (383, 1, 7, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (384, 1, 7, 'notice');
INSERT INTO `role_stage_perms` VALUES (385, 1, 7, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (386, 1, 7, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (387, 1, 7, 'process');
INSERT INTO `role_stage_perms` VALUES (388, 1, 7, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (389, 1, 7, 'process:my');
INSERT INTO `role_stage_perms` VALUES (390, 1, 7, 'process:record');
INSERT INTO `role_stage_perms` VALUES (391, 1, 7, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (392, 1, 7, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (393, 1, 7, 'apply');
INSERT INTO `role_stage_perms` VALUES (394, 1, 7, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (395, 1, 7, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (396, 1, 7, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (397, 1, 7, 'select');
INSERT INTO `role_stage_perms` VALUES (398, 1, 7, 'select:view');
INSERT INTO `role_stage_perms` VALUES (399, 1, 7, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (400, 1, 7, 'select:final');
INSERT INTO `role_stage_perms` VALUES (401, 1, 7, 'select:result');
INSERT INTO `role_stage_perms` VALUES (402, 1, 7, 'init');
INSERT INTO `role_stage_perms` VALUES (403, 1, 7, 'mid');
INSERT INTO `role_stage_perms` VALUES (404, 1, 7, 'fin');
INSERT INTO `role_stage_perms` VALUES (405, 1, 7, 'init:report');
INSERT INTO `role_stage_perms` VALUES (406, 1, 7, 'init:list');
INSERT INTO `role_stage_perms` VALUES (407, 1, 7, 'init:check');
INSERT INTO `role_stage_perms` VALUES (408, 1, 7, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (409, 1, 7, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (410, 1, 7, 'init:score');
INSERT INTO `role_stage_perms` VALUES (411, 1, 7, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (412, 1, 7, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (413, 1, 7, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (414, 1, 7, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (415, 1, 7, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (416, 1, 7, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (417, 1, 7, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (418, 1, 7, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (419, 1, 7, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (420, 1, 7, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (421, 1, 7, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (422, 1, 7, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (423, 1, 7, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (424, 1, 7, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (425, 1, 7, 'test');
INSERT INTO `role_stage_perms` VALUES (426, 1, 7, 'score');
INSERT INTO `role_stage_perms` VALUES (427, 1, 7, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (428, 1, 7, 'score:my');
INSERT INTO `role_stage_perms` VALUES (429, 1, 7, 'score:list');
INSERT INTO `role_stage_perms` VALUES (430, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (431, 1, 8, 'sys');
INSERT INTO `role_stage_perms` VALUES (432, 1, 8, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (433, 1, 8, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (434, 1, 8, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (435, 1, 8, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (436, 1, 8, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (437, 1, 8, 'notice');
INSERT INTO `role_stage_perms` VALUES (438, 1, 8, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (439, 1, 8, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (440, 1, 8, 'process');
INSERT INTO `role_stage_perms` VALUES (441, 1, 8, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (442, 1, 8, 'process:my');
INSERT INTO `role_stage_perms` VALUES (443, 1, 8, 'process:record');
INSERT INTO `role_stage_perms` VALUES (444, 1, 8, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (445, 1, 8, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (446, 1, 8, 'apply');
INSERT INTO `role_stage_perms` VALUES (447, 1, 8, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (448, 1, 8, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (449, 1, 8, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (450, 1, 8, 'select');
INSERT INTO `role_stage_perms` VALUES (451, 1, 8, 'select:view');
INSERT INTO `role_stage_perms` VALUES (452, 1, 8, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (453, 1, 8, 'select:final');
INSERT INTO `role_stage_perms` VALUES (454, 1, 8, 'select:result');
INSERT INTO `role_stage_perms` VALUES (455, 1, 8, 'init');
INSERT INTO `role_stage_perms` VALUES (456, 1, 8, 'mid');
INSERT INTO `role_stage_perms` VALUES (457, 1, 8, 'fin');
INSERT INTO `role_stage_perms` VALUES (458, 1, 8, 'init:report');
INSERT INTO `role_stage_perms` VALUES (459, 1, 8, 'init:list');
INSERT INTO `role_stage_perms` VALUES (460, 1, 8, 'init:check');
INSERT INTO `role_stage_perms` VALUES (461, 1, 8, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (462, 1, 8, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (463, 1, 8, 'init:score');
INSERT INTO `role_stage_perms` VALUES (464, 1, 8, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (465, 1, 8, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (466, 1, 8, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (467, 1, 8, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (468, 1, 8, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (469, 1, 8, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (470, 1, 8, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (471, 1, 8, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (472, 1, 8, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (473, 1, 8, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (474, 1, 8, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (475, 1, 8, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (476, 1, 8, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (477, 1, 8, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (478, 1, 8, 'test');
INSERT INTO `role_stage_perms` VALUES (479, 1, 8, 'score');
INSERT INTO `role_stage_perms` VALUES (480, 1, 8, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (481, 1, 8, 'score:my');
INSERT INTO `role_stage_perms` VALUES (482, 1, 8, 'score:list');
INSERT INTO `role_stage_perms` VALUES (483, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (484, 1, 9, 'sys');
INSERT INTO `role_stage_perms` VALUES (485, 1, 9, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (486, 1, 9, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (487, 1, 9, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (488, 1, 9, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (489, 1, 9, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (490, 1, 9, 'notice');
INSERT INTO `role_stage_perms` VALUES (491, 1, 9, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (492, 1, 9, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (493, 1, 9, 'process');
INSERT INTO `role_stage_perms` VALUES (494, 1, 9, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (495, 1, 9, 'process:my');
INSERT INTO `role_stage_perms` VALUES (496, 1, 9, 'process:record');
INSERT INTO `role_stage_perms` VALUES (497, 1, 9, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (498, 1, 9, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (499, 1, 9, 'apply');
INSERT INTO `role_stage_perms` VALUES (500, 1, 9, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (501, 1, 9, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (502, 1, 9, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (503, 1, 9, 'select');
INSERT INTO `role_stage_perms` VALUES (504, 1, 9, 'select:view');
INSERT INTO `role_stage_perms` VALUES (505, 1, 9, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (506, 1, 9, 'select:final');
INSERT INTO `role_stage_perms` VALUES (507, 1, 9, 'select:result');
INSERT INTO `role_stage_perms` VALUES (508, 1, 9, 'init');
INSERT INTO `role_stage_perms` VALUES (509, 1, 9, 'mid');
INSERT INTO `role_stage_perms` VALUES (510, 1, 9, 'fin');
INSERT INTO `role_stage_perms` VALUES (511, 1, 9, 'init:report');
INSERT INTO `role_stage_perms` VALUES (512, 1, 9, 'init:list');
INSERT INTO `role_stage_perms` VALUES (513, 1, 9, 'init:check');
INSERT INTO `role_stage_perms` VALUES (514, 1, 9, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (515, 1, 9, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (516, 1, 9, 'init:score');
INSERT INTO `role_stage_perms` VALUES (517, 1, 9, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (518, 1, 9, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (519, 1, 9, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (520, 1, 9, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (521, 1, 9, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (522, 1, 9, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (523, 1, 9, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (524, 1, 9, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (525, 1, 9, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (526, 1, 9, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (527, 1, 9, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (528, 1, 9, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (529, 1, 9, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (530, 1, 9, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (531, 1, 9, 'test');
INSERT INTO `role_stage_perms` VALUES (532, 1, 9, 'score');
INSERT INTO `role_stage_perms` VALUES (533, 1, 9, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (534, 1, 9, 'score:my');
INSERT INTO `role_stage_perms` VALUES (535, 1, 9, 'score:list');
INSERT INTO `role_stage_perms` VALUES (536, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (537, 1, 10, 'sys');
INSERT INTO `role_stage_perms` VALUES (538, 1, 10, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (539, 1, 10, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (540, 1, 10, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (541, 1, 10, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (542, 1, 10, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (543, 1, 10, 'notice');
INSERT INTO `role_stage_perms` VALUES (544, 1, 10, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (545, 1, 10, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (546, 1, 10, 'process');
INSERT INTO `role_stage_perms` VALUES (547, 1, 10, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (548, 1, 10, 'process:my');
INSERT INTO `role_stage_perms` VALUES (549, 1, 10, 'process:record');
INSERT INTO `role_stage_perms` VALUES (550, 1, 10, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (551, 1, 10, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (552, 1, 10, 'apply');
INSERT INTO `role_stage_perms` VALUES (553, 1, 10, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (554, 1, 10, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (555, 1, 10, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (556, 1, 10, 'select');
INSERT INTO `role_stage_perms` VALUES (557, 1, 10, 'select:view');
INSERT INTO `role_stage_perms` VALUES (558, 1, 10, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (559, 1, 10, 'select:final');
INSERT INTO `role_stage_perms` VALUES (560, 1, 10, 'select:result');
INSERT INTO `role_stage_perms` VALUES (561, 1, 10, 'init');
INSERT INTO `role_stage_perms` VALUES (562, 1, 10, 'mid');
INSERT INTO `role_stage_perms` VALUES (563, 1, 10, 'fin');
INSERT INTO `role_stage_perms` VALUES (564, 1, 10, 'init:report');
INSERT INTO `role_stage_perms` VALUES (565, 1, 10, 'init:list');
INSERT INTO `role_stage_perms` VALUES (566, 1, 10, 'init:check');
INSERT INTO `role_stage_perms` VALUES (567, 1, 10, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (568, 1, 10, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (569, 1, 10, 'init:score');
INSERT INTO `role_stage_perms` VALUES (570, 1, 10, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (571, 1, 10, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (572, 1, 10, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (573, 1, 10, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (574, 1, 10, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (575, 1, 10, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (576, 1, 10, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (577, 1, 10, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (578, 1, 10, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (579, 1, 10, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (580, 1, 10, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (581, 1, 10, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (582, 1, 10, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (583, 1, 10, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (584, 1, 10, 'test');
INSERT INTO `role_stage_perms` VALUES (585, 1, 10, 'score');
INSERT INTO `role_stage_perms` VALUES (586, 1, 10, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (587, 1, 10, 'score:my');
INSERT INTO `role_stage_perms` VALUES (588, 1, 10, 'score:list');
INSERT INTO `role_stage_perms` VALUES (589, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (590, 1, 11, 'sys');
INSERT INTO `role_stage_perms` VALUES (591, 1, 11, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (592, 1, 11, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (593, 1, 11, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (594, 1, 11, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (595, 1, 11, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (596, 1, 11, 'notice');
INSERT INTO `role_stage_perms` VALUES (597, 1, 11, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (598, 1, 11, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (599, 1, 11, 'process');
INSERT INTO `role_stage_perms` VALUES (600, 1, 11, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (601, 1, 11, 'process:my');
INSERT INTO `role_stage_perms` VALUES (602, 1, 11, 'process:record');
INSERT INTO `role_stage_perms` VALUES (603, 1, 11, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (604, 1, 11, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (605, 1, 11, 'apply');
INSERT INTO `role_stage_perms` VALUES (606, 1, 11, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (607, 1, 11, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (608, 1, 11, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (609, 1, 11, 'select');
INSERT INTO `role_stage_perms` VALUES (610, 1, 11, 'select:view');
INSERT INTO `role_stage_perms` VALUES (611, 1, 11, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (612, 1, 11, 'select:final');
INSERT INTO `role_stage_perms` VALUES (613, 1, 11, 'select:result');
INSERT INTO `role_stage_perms` VALUES (614, 1, 11, 'init');
INSERT INTO `role_stage_perms` VALUES (615, 1, 11, 'mid');
INSERT INTO `role_stage_perms` VALUES (616, 1, 11, 'fin');
INSERT INTO `role_stage_perms` VALUES (617, 1, 11, 'init:report');
INSERT INTO `role_stage_perms` VALUES (618, 1, 11, 'init:list');
INSERT INTO `role_stage_perms` VALUES (619, 1, 11, 'init:check');
INSERT INTO `role_stage_perms` VALUES (620, 1, 11, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (621, 1, 11, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (622, 1, 11, 'init:score');
INSERT INTO `role_stage_perms` VALUES (623, 1, 11, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (624, 1, 11, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (625, 1, 11, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (626, 1, 11, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (627, 1, 11, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (628, 1, 11, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (629, 1, 11, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (630, 1, 11, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (631, 1, 11, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (632, 1, 11, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (633, 1, 11, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (634, 1, 11, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (635, 1, 11, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (636, 1, 11, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (637, 1, 11, 'test');
INSERT INTO `role_stage_perms` VALUES (638, 1, 11, 'score');
INSERT INTO `role_stage_perms` VALUES (639, 1, 11, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (640, 1, 11, 'score:my');
INSERT INTO `role_stage_perms` VALUES (641, 1, 11, 'score:list');
INSERT INTO `role_stage_perms` VALUES (642, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (643, 1, 12, 'sys');
INSERT INTO `role_stage_perms` VALUES (644, 1, 12, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (645, 1, 12, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (646, 1, 12, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (647, 1, 12, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (648, 1, 12, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (649, 1, 12, 'notice');
INSERT INTO `role_stage_perms` VALUES (650, 1, 12, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (651, 1, 12, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (652, 1, 12, 'process');
INSERT INTO `role_stage_perms` VALUES (653, 1, 12, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (654, 1, 12, 'process:my');
INSERT INTO `role_stage_perms` VALUES (655, 1, 12, 'process:record');
INSERT INTO `role_stage_perms` VALUES (656, 1, 12, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (657, 1, 12, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (658, 1, 12, 'apply');
INSERT INTO `role_stage_perms` VALUES (659, 1, 12, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (660, 1, 12, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (661, 1, 12, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (662, 1, 12, 'select');
INSERT INTO `role_stage_perms` VALUES (663, 1, 12, 'select:view');
INSERT INTO `role_stage_perms` VALUES (664, 1, 12, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (665, 1, 12, 'select:final');
INSERT INTO `role_stage_perms` VALUES (666, 1, 12, 'select:result');
INSERT INTO `role_stage_perms` VALUES (667, 1, 12, 'init');
INSERT INTO `role_stage_perms` VALUES (668, 1, 12, 'mid');
INSERT INTO `role_stage_perms` VALUES (669, 1, 12, 'fin');
INSERT INTO `role_stage_perms` VALUES (670, 1, 12, 'init:report');
INSERT INTO `role_stage_perms` VALUES (671, 1, 12, 'init:list');
INSERT INTO `role_stage_perms` VALUES (672, 1, 12, 'init:check');
INSERT INTO `role_stage_perms` VALUES (673, 1, 12, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (674, 1, 12, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (675, 1, 12, 'init:score');
INSERT INTO `role_stage_perms` VALUES (676, 1, 12, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (677, 1, 12, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (678, 1, 12, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (679, 1, 12, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (680, 1, 12, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (681, 1, 12, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (682, 1, 12, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (683, 1, 12, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (684, 1, 12, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (685, 1, 12, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (686, 1, 12, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (687, 1, 12, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (688, 1, 12, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (689, 1, 12, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (690, 1, 12, 'test');
INSERT INTO `role_stage_perms` VALUES (691, 1, 12, 'score');
INSERT INTO `role_stage_perms` VALUES (692, 1, 12, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (693, 1, 12, 'score:my');
INSERT INTO `role_stage_perms` VALUES (694, 1, 12, 'score:list');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `STU_ID` int NULL DEFAULT NULL,
  `START_DEFENSE_SCORE` int NULL DEFAULT NULL,
  `START_REPORT_SCORE` int NULL DEFAULT NULL COMMENT '答辩和成果（包括报告）',
  `MID_DEFENSE_SCORE` int NULL DEFAULT NULL,
  `MID_REPORT_SCORE` int NULL DEFAULT NULL,
  `END_DEFENSE_SCORE` int NULL DEFAULT NULL,
  `END_REPORT_SCORE` int NULL DEFAULT NULL COMMENT '即论文分',
  `PROCEDURE_SCORE` int NULL DEFAULT NULL,
  `FINAL_SCORE` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score
-- ----------------------------

-- ----------------------------
-- Table structure for secretary
-- ----------------------------
DROP TABLE IF EXISTS `secretary`;
CREATE TABLE `secretary`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `SEC_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `SEC_ID`(`SEC_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_5` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩秘书' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of secretary
-- ----------------------------
INSERT INTO `secretary` VALUES (301, 101);
INSERT INTO `secretary` VALUES (302, 102);
INSERT INTO `secretary` VALUES (303, 103);
INSERT INTO `secretary` VALUES (304, 104);
INSERT INTO `secretary` VALUES (305, 105);
INSERT INTO `secretary` VALUES (306, 106);

-- ----------------------------
-- Table structure for stage_task
-- ----------------------------
DROP TABLE IF EXISTS `stage_task`;
CREATE TABLE `stage_task`  (
  `TASK_ID` int NOT NULL AUTO_INCREMENT,
  `SUB_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASK_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEACHER_ID` int NULL DEFAULT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WTJ',
  `START_TIME` datetime NULL DEFAULT NULL,
  `END_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`TASK_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_16`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_17`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_16` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_17` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阶段任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stage_task
-- ----------------------------

-- ----------------------------
-- Table structure for stage_task_result
-- ----------------------------
DROP TABLE IF EXISTS `stage_task_result`;
CREATE TABLE `stage_task_result`  (
  `TASK_ID` int NULL DEFAULT NULL,
  `RETRIES` int NULL DEFAULT 1,
  `SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'DSH',
  `AUDIT_TIME` datetime NULL DEFAULT NULL,
  `SCORE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stage_task_result
-- ----------------------------

-- ----------------------------
-- Table structure for stu_group
-- ----------------------------
DROP TABLE IF EXISTS `stu_group`;
CREATE TABLE `stu_group`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int NOT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `STAGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_38`(`STU_ID`) USING BTREE,
  INDEX `GROUP_ID`(`GROUP_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_38` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生小组，分批进行答辩' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_group
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `STU_ID` int NOT NULL,
  `COLLEGE_ID` int NULL DEFAULT NULL,
  `MAJOR_ID` int NULL DEFAULT NULL,
  `CLASS_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `STU_ID`(`STU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_29`(`MAJOR_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_31`(`CLASS_ID`) USING BTREE,
  INDEX `student_ibfk_1`(`COLLEGE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_29` FOREIGN KEY (`MAJOR_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_31` FOREIGN KEY (`CLASS_ID`) REFERENCES `class` (`CLASS_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (101, 51, 101, 200, 103);
INSERT INTO `student` VALUES (102, 52, 102, 204, 102);
INSERT INTO `student` VALUES (103, 53, 103, 207, 103);
INSERT INTO `student` VALUES (104, 54, 104, 210, 101);
INSERT INTO `student` VALUES (105, 55, 105, 216, 104);
INSERT INTO `student` VALUES (106, 56, 106, 218, 108);
INSERT INTO `student` VALUES (107, 57, 107, 221, 105);
INSERT INTO `student` VALUES (108, 58, 108, 231, 101);
INSERT INTO `student` VALUES (109, 59, 123, 225, 101);
INSERT INTO `student` VALUES (110, 60, 101, 200, 104);
INSERT INTO `student` VALUES (111, 61, 102, 204, 105);
INSERT INTO `student` VALUES (112, 62, 103, 208, 103);
INSERT INTO `student` VALUES (113, 63, 104, 210, 106);
INSERT INTO `student` VALUES (114, 64, 105, 217, 102);
INSERT INTO `student` VALUES (115, 65, 106, 218, 107);
INSERT INTO `student` VALUES (116, 66, 107, 221, 102);
INSERT INTO `student` VALUES (117, 67, 108, 231, 101);
INSERT INTO `student` VALUES (118, 68, 123, 225, 102);
INSERT INTO `student` VALUES (119, 69, 104, 215, 105);
INSERT INTO `student` VALUES (120, 70, 105, 217, 103);

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUB_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SUB_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REQUIREMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CHOSEN` int NULL DEFAULT 0,
  `CAPACITY` int NULL DEFAULT 3,
  `ZONE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSE_BY` int NULL DEFAULT NULL,
  `POSE_TIME` datetime NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `MAJOR_ID` int NULL DEFAULT NULL,
  `AUDIT_BY` int NULL DEFAULT NULL,
  `AUDIT_TIME` datetime NULL DEFAULT NULL,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_10`(`POSE_BY`) USING BTREE,
  INDEX `FK_RELATIONSHIP_28`(`MAJOR_ID`) USING BTREE,
  INDEX `SUB_ID`(`SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`POSE_BY`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_28` FOREIGN KEY (`MAJOR_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (39, '516dc486a5884017a6f4c60ccea2dd22', '6c777bd6a19247d49910df731ca40d18', '高品质微波介质陶瓷在5G毫米波天线中的应用研究', '从这个角度来看， 可是，即使是这样，高品质微波介质陶瓷在5G毫米波天线中的应用研究的出现仍然代表了一定的意义。 培根曾经说过，阅读使人充实，会谈使人敏捷，写作使人精确。这句话语虽然很短，但令我浮想联翩。 对我个人而言，高品质微波介质陶瓷在5G毫米波天线中的应用研究不仅仅是一个重大的事件，还可能会改变我的人生。 布尔沃在不经意间这样说过，要掌握书，莫被书掌握；要为生而读，莫为读而生。这句话语虽然很短，但令我浮想联翩。 高品质微波介质陶瓷在5G毫米波天线中的应用研究，发生了会如何，不发生又会如何。 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 现在，解决高品质微波介质陶瓷在5G毫米波天线中的应用研究的问题，是非常非常重要的。 所以， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 既然如此， 经过上述讨论， 高品质微波介质陶瓷在5G毫米波天线中的应用研究因何而发生？ 总结的来说， 现在，解决高品质微波介质陶瓷在5G毫米波天线中的应用研究的问题，是非常非常重要的。 所以， 吉姆·罗恩曾经提到过，要么你主宰生活，要么你被生活主宰。这启发了我， 在这种困难的抉择下，本人思来想去，寝食难安。 一般来讲，我们都必须务必慎重的考虑考虑。 这样看来， 可是，即使是这样，高品质微波介质陶瓷在5G毫米波天线中的应用研究的出现仍然代表了一定的意义。 就我个人来说，高品质微波介质陶瓷在5G毫米波天线中的应用研究对我的意义，不能不说非常重大。 生活中，若高品质微波介质陶瓷在5G毫米波天线中的应用研究出现了，我们就不得不考虑它出现了的事实。 我们都知道，只要有意义，那么就必须慎重考虑。 每个人都不得不面对这些问题。 在面对这种问题时， 笛卡儿在不经意间这样说过，阅读一切好书如同和过去最杰出的人谈话。我希望诸位也能好好地体会这句话。 就我个人来说，高品质微波介质陶瓷在5G毫米波天线中的应用研究对我的意义，不能不说非常重大。 拉罗什福科曾经说过，我们唯一不会改正的缺点是软弱。这不禁令我深思。 我们都知道，只要有意义，那么就必须慎重考虑。 我认为， 我认为， 对我个人而言，高品质微波介质陶瓷在5G毫米波天线中的应用研究不仅仅是一个重大的事件，还可能会改变我的人生。 了解清楚高品质微波介质陶瓷在5G毫米波天线中的应用研究到底是一种怎么样的存在，是解决一切问题的关键。 生活中，若高品质微波介质陶瓷在5G毫米波天线中的应用研究出现了，我们就不得不考虑它出现了的事实。 亚伯拉罕·林肯在不经意间这样说过，你活了多少岁不算什么，重要的是你是如何度过这些岁月的。带着这句话，我们还要更加慎重的审视这个问题： 既然如此， 高品质微波介质陶瓷在5G毫米波天线中的应用研究因何而发生？ 我认为， 生活中，若高品质微波介质陶瓷在5G毫米波天线中的应用研究出现了，我们就不得不考虑它出现了的事实。 那么， 每个人都不得不面对这些问题。 在面对这种问题时， 别林斯基在不经意间这样说过，好的书籍是最贵重的珍宝。我希望诸位也能好好地体会这句话。', '高品质微波介质陶瓷在5G毫米波天线中的应用研究，到底应该如何实现。 叔本华曾经说过，意志是一个强壮的盲人，倚靠在明眼的跛子肩上。我希望诸位也能好好地体会这句话。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 高品质微波介质陶瓷在5G毫米波天线中的应用研究因何而发生？ 维龙曾经提到过，要成功不需要什么特别的才能，只要把你能做的小事做得好就行了。这句话语虽然很短，但令我浮想联翩。 我们都知道，只要有意义，那么就必须慎重考虑。', 0, 3, 'KXTS', 30, '2021-03-23 00:00:00', 'YTG', NULL, 51, '2021-03-23 20:09:48', '符合双一流建设需求，通过审核');

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
  `STAGE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `START_TIME` datetime NULL DEFAULT NULL,
  `END_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`STAGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统当前状态' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_stage
-- ----------------------------
INSERT INTO `system_stage` VALUES (1, 0, '课题申报', '在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 1, '课题申报审核', '在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。', '2021-03-11 00:00:00', '2021-03-11 00:00:00');
INSERT INTO `system_stage` VALUES (0, 2, '被驳回课题整改', '在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 3, '学生提交选题申请', '在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 4, '教师审核学生申请', '在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 5, '开题报告及材料提交', '在该阶段，学生可以在系统提交开题报告及与开题相关的材料。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 6, '开题答辩', '在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 7, '开题阶段收尾', '在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 8, '中期检查材料提交', '在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 9, '中期答辩', '在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 10, '中期阶段收尾', '在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 11, '结题材料提交', '在该阶段，学生提交毕业论文、最终成果物及结题报告。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 12, '结题收尾工作', '在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `TEACHER_ID` int NOT NULL,
  `COLLEGE_ID` int NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HOME_PAGE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TEACHER_ID`) USING BTREE,
  INDEX `TEACHER_ID`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_7`(`COLLEGE_ID`) USING BTREE,
  INDEX `USER_ID`(`USER_ID`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (201, 30, 101, '教授', 'http://gr.xjtu.edu.cn/web/sgxnsx');
INSERT INTO `teacher` VALUES (202, 31, 102, '副教授', 'http://gr.xjtu.edu.cn/web/huspfq');
INSERT INTO `teacher` VALUES (203, 32, 103, '教授', 'http://gr.xjtu.edu.cn/web/pgfawh');
INSERT INTO `teacher` VALUES (204, 33, 104, '讲师', 'http://gr.xjtu.edu.cn/web/oangcx');
INSERT INTO `teacher` VALUES (205, 34, 105, '讲师', 'http://gr.xjtu.edu.cn/web/aluoah');
INSERT INTO `teacher` VALUES (206, 35, 106, '讲师', 'http://gr.xjtu.edu.cn/web/xcryit');
INSERT INTO `teacher` VALUES (207, 36, 107, '副教授', 'http://gr.xjtu.edu.cn/web/rantwy');
INSERT INTO `teacher` VALUES (208, 37, 108, '讲师', 'http://gr.xjtu.edu.cn/web/ohauja');
INSERT INTO `teacher` VALUES (209, 38, 123, '讲师', 'http://gr.xjtu.edu.cn/web/jzujml');
INSERT INTO `teacher` VALUES (210, 39, 106, '教授', 'http://gr.xjtu.edu.cn/web/zxswyc');

-- ----------------------------
-- Table structure for teaching_office
-- ----------------------------
DROP TABLE IF EXISTS `teaching_office`;
CREATE TABLE `teaching_office`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `OFFICE_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `OFFICE_ID`(`OFFICE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_4` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教研室' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teaching_office
-- ----------------------------
INSERT INTO `teaching_office` VALUES (401, 51);
INSERT INTO `teaching_office` VALUES (402, 52);

-- ----------------------------
-- Table structure for thesis
-- ----------------------------
DROP TABLE IF EXISTS `thesis`;
CREATE TABLE `thesis`  (
  `THESIS_ID` int NOT NULL AUTO_INCREMENT,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `POSE_TIME` datetime NULL DEFAULT NULL,
  `STATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `SCORE` int NULL DEFAULT NULL,
  PRIMARY KEY (`THESIS_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_21`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_21` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '论文' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of thesis
-- ----------------------------

-- ----------------------------
-- Table structure for thesis_teacher
-- ----------------------------
DROP TABLE IF EXISTS `thesis_teacher`;
CREATE TABLE `thesis_teacher`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TEACHER_ID` int NULL DEFAULT NULL,
  `THESIS_ID` int NULL DEFAULT NULL,
  `IS_RELEASE` tinyint(1) NULL DEFAULT 0,
  `SCORE` int NULL DEFAULT -1,
  `TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `TEACHER_ID`(`TEACHER_ID`) USING BTREE,
  INDEX `THESIS_ID`(`THESIS_ID`) USING BTREE,
  CONSTRAINT `thesis_teacher_ibfk_1` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `thesis_teacher_ibfk_2` FOREIGN KEY (`THESIS_ID`) REFERENCES `thesis` (`THESIS_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thesis_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `USER_ID` int NOT NULL AUTO_INCREMENT COMMENT '主键,用户id',
  `REAL_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户真实姓名',
  `USERNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户登录账号',
  `PASSWORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `TEL` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `MAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别(F女M男)',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 403 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (20, '管理员', 'admin', '3ee4a28b103216fa2d140d1979297910', '12387516512', 'we@jiaban.com', 'F');
INSERT INTO `user` VALUES (101, '学生1', 'student1', '039980483dcb6489166e1a6ba2da0b34', '17697576027', 'vhgj53@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (102, '学生2', 'student2', 'f07e767add41a8502acdc480fe884aa8', '15033432630', 'pabibruo@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (103, '学生3', 'student3', '0f1db4b53835ffd6120845ab738c5f4e', '13177867883', 'erjnbcdlciatj14@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (104, '学生4', 'student4', '46c47ab8544b14eec5396bbe1119f44d', '17576053067', 'avktjklkowojkqw@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (105, '学生5', 'student5', '94fa038b07f3f797f669d15ee88a547f', '15816366018', 'e483212120575@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (106, '学生6', 'student6', '7ebbf99e1cda3afc03f36472766b8434', '18463015511', 'bdtpkjshucjdmc@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (107, '学生7', 'student7', '524939ef821ac58264033d01afd7ce2b', '17670401263', 'bbjaacfrseq@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (108, '学生8', 'student8', '45668546bcb1567130cad10c047c2fcf', '16566451829', 'upa0@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (109, '学生9', 'student9', 'f4478ca1df1f88dafb5f34ecc97d1e85', '13365169634', 'gtghoidwft06@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (110, '学生10', 'student10', '9818e270fc3a4d9d592cc13bcce269c1', '14709831780', 'imr@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (111, '学生11', 'student11', '2c3aa0c5eb0f7bbf0e2c24c10941ec9a', '17805252431', 'twvcu@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (112, '学生12', 'student12', '821b33484f99d17271775f8a4a5169d1', '19933625998', 'quakjb@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (113, '学生13', 'student13', 'f62078076ac2ebb379aac1bd28547dd2', '13277747354', 'jssrrotcavslp@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (114, '学生14', 'student14', '4b544c1294ec9513d584168b86bd7ab6', '17157967503', 'i87283363@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (115, '学生15', 'student15', '4b8bf2149ec3e192b6265f1c982e5e89', '19913259996', 'pgw@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (116, '学生16', 'student16', 'e75a00b64c58c020061f22e73d207bf6', '18608609762', 'vvgemrwkfatv1@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (117, '学生17', 'student17', 'e1bd4893af5bae35f3219931d0351983', '15944441733', 'aet@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (118, '学生18', 'student18', '115cad676c1b9ad5d487488d3c185a14', '18741177283', 'nstiaaiqtwn@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (119, '学生19', 'student19', '57ea017f08469f4fdac0dd0e268a9612', '17118282672', 'k743@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (120, '学生20', 'student20', 'ecf2fc877bf3ead11ce815521d26ed9b', '13638911701', 'oviau4@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (201, '老师1', 'teacher1', 'b842b4673732526f68d9a06f1c8412b7', '15129298540', 'w54174@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (202, '老师2', 'teacher2', 'f11ae84809ee8b7585752eecbf2daa2b', '17394628455', 'jcn@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (203, '老师3', 'teacher3', '7b80722199dc27b8fab6a7192dffb0d3', '18862307793', 'dclnjiviwphqh@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (204, '老师4', 'teacher4', 'f6d33dcddda27dd85c002623cc07c50a', '13840561114', 'stcdle8241@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (205, '老师5', 'teacher5', '7ca0f96f147149e1d5713495d9c2d77e', '15009078565', 'a8064557@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (206, '老师6', 'teacher6', '3a2beb65cc1c8ef8bc9c69e96b459112', '18564971416', 'h403@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (207, '老师7', 'teacher7', '7cd6cb9a2ed237fde80778ac5a5818de', '15003194745', 'wdjlvttnwjhm@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (208, '老师8', 'teacher8', '496fbea9195de8cfeccfba418f6c8590', '17887756291', 'aiwhu@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (209, '老师9', 'teacher9', '6bf9ceaf73d997143ac015610acdb9b6', '13173933675', 'vudqrbll@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (210, '老师10', 'teacher10', '47b7878be1cbe4f92beef527e667e76d', '13203891843', 'dlaghsv1104@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (301, '秘书1', 'sec1', 'b01d0554881ddc66568236f9c7bd1af8', '19859673008', 'dahbgftmgfal@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (302, '秘书2', 'sec2', 'f10fcb9f2c251003406dc30ee1ec2b43', '15057791412', 'fjwl@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (303, '秘书3', 'sec3', 'e2f503cc34f366ca5b8b6a666db65f80', '18895271680', 'c1500@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (304, '秘书4', 'sec4', '34fdab656c967bef22b11565b52cb140', '15287897878', 'v58@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (305, '秘书5', 'sec5', '5f9ffc0d9efacb6a1a8b4cbc25d5fad5', '18285106178', 'mlhcolkmramrgvu@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (306, '秘书6', 'sec6', '87436df686c28f923ccc3d5b81ae1bef', '13270715610', 'fmbnmtajhwgrv83@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (401, '系办1', 'office1', '3285f6f3a77b9823fb4c6e0bab8b0390', '13173933675', 'nrrn@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (402, '系办2', 'office2', '9882d0ed29a2cff7e11f60c3cba1ad38', '13203891843', 'agjbrmplmr@mail.xjtu.edu.cn', 'F');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ROLE_ID` int NULL DEFAULT NULL,
  `USER_ID` int NULL DEFAULT NULL,
  INDEX `FK_RELATIONSHIP_23`(`USER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_24`(`ROLE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_23` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_24` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (2, 101);
INSERT INTO `user_role` VALUES (2, 102);
INSERT INTO `user_role` VALUES (2, 103);
INSERT INTO `user_role` VALUES (2, 104);
INSERT INTO `user_role` VALUES (2, 105);
INSERT INTO `user_role` VALUES (2, 106);
INSERT INTO `user_role` VALUES (2, 107);
INSERT INTO `user_role` VALUES (2, 108);
INSERT INTO `user_role` VALUES (2, 109);
INSERT INTO `user_role` VALUES (2, 110);
INSERT INTO `user_role` VALUES (2, 111);
INSERT INTO `user_role` VALUES (2, 112);
INSERT INTO `user_role` VALUES (2, 113);
INSERT INTO `user_role` VALUES (2, 114);
INSERT INTO `user_role` VALUES (2, 115);
INSERT INTO `user_role` VALUES (2, 116);
INSERT INTO `user_role` VALUES (2, 117);
INSERT INTO `user_role` VALUES (2, 118);
INSERT INTO `user_role` VALUES (2, 119);
INSERT INTO `user_role` VALUES (2, 120);
INSERT INTO `user_role` VALUES (3, 201);
INSERT INTO `user_role` VALUES (3, 202);
INSERT INTO `user_role` VALUES (3, 203);
INSERT INTO `user_role` VALUES (3, 204);
INSERT INTO `user_role` VALUES (3, 205);
INSERT INTO `user_role` VALUES (3, 206);
INSERT INTO `user_role` VALUES (3, 207);
INSERT INTO `user_role` VALUES (3, 208);
INSERT INTO `user_role` VALUES (3, 209);
INSERT INTO `user_role` VALUES (3, 210);
INSERT INTO `user_role` VALUES (5, 301);
INSERT INTO `user_role` VALUES (5, 302);
INSERT INTO `user_role` VALUES (5, 303);
INSERT INTO `user_role` VALUES (5, 304);
INSERT INTO `user_role` VALUES (5, 305);
INSERT INTO `user_role` VALUES (5, 306);
INSERT INTO `user_role` VALUES (4, 401);
INSERT INTO `user_role` VALUES (4, 402);

-- ----------------------------
-- Table structure for user_stage
-- ----------------------------
DROP TABLE IF EXISTS `user_stage`;
CREATE TABLE `user_stage`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NULL DEFAULT NULL,
  `STAGE_ID` int NULL DEFAULT NULL,
  `START_TIME` datetime NULL DEFAULT NULL,
  `END_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_30`(`USER_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_30` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户当前状态' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_stage
-- ----------------------------

-- ----------------------------
-- Table structure for validate
-- ----------------------------
DROP TABLE IF EXISTS `validate`;
CREATE TABLE `validate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reset_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime NULL DEFAULT NULL,
  `gmt_modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of validate
-- ----------------------------

-- ----------------------------
-- Table structure for weight
-- ----------------------------
DROP TABLE IF EXISTS `weight`;
CREATE TABLE `weight`  (
  `START_STAGE` double NULL DEFAULT NULL,
  `MIDDLE_STAGE` double NULL DEFAULT NULL,
  `END_STAGE` double NULL DEFAULT NULL,
  `STAGE_TASK` double NULL DEFAULT NULL,
  `START_MATERIAL` double NULL DEFAULT NULL,
  `START_PLEA` double NULL DEFAULT NULL,
  `MIDDLE_MATERIAL` double NULL DEFAULT NULL,
  `MIDDLE_PLEA` double NULL DEFAULT NULL,
  `END_MATERIAL` double NULL DEFAULT NULL,
  `END_PLEA` double NULL DEFAULT NULL COMMENT '即论文'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of weight
-- ----------------------------
INSERT INTO `weight` VALUES (10, 10, 60, 20, 20, 80, 30, 70, 50, 50);

SET FOREIGN_KEY_CHECKS = 1;
