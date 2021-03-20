/*
 Navicat Premium Data Transfer

 Source Server         : ali
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 106.14.150.115:6000
 Source Schema         : gms

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 19/03/2021 21:35:05
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
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收老师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acceptance_teacher
-- ----------------------------
INSERT INTO `acceptance_teacher` VALUES (1, 3, 1, 1);
INSERT INTO `acceptance_teacher` VALUES (2, 5, 1, 0);
INSERT INTO `acceptance_teacher` VALUES (111, 4, 49, 1);
INSERT INTO `acceptance_teacher` VALUES (112, 1, 50, 1);
INSERT INTO `acceptance_teacher` VALUES (113, 5, 49, 0);
INSERT INTO `acceptance_teacher` VALUES (114, 3, 50, 0);
INSERT INTO `acceptance_teacher` VALUES (115, 2, 49, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收小组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acceptance_team
-- ----------------------------
INSERT INTO `acceptance_team` VALUES (1, 1, 'XT');
INSERT INTO `acceptance_team` VALUES (49, 1, 'JT');
INSERT INTO `acceptance_team` VALUES (50, 2, 'JT');

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
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('01afdfb03215496dbb9b0c101109ad55', 29, '关于第七届全国大学生工程训练综合能力竞赛校内第一轮评审的通知', 8, '<h1 class=\"ql-align-center\">关于第七届全国大学生工程训练综合能力竞赛校内第一轮评审的通知</h1><h6 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-10<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;2064</span></h6><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><br></p><p>各学院（部）、中心及有关单位：</p><p><br></p><p>	根据教育部印发《教育部评审评比评估和竞赛管理暂行办法》《教育部评审评估和竞赛清单》的通知精神，全国大学生工程训练综合能力大赛是纳入教育部评审评估和竞赛清单的三大赛事之一，对于推动人才培养和开展学科评估具有重要的作用，本届大赛由教育部高等教育司主办，教育部高等学校工程训练教学指导委员会举办。</p><p>	为深入推进工程教育改革，全面提升大学生工程创新综合能力水平，第七届全国大学生工程训练综合能力竞赛陕西省省赛初步定于4月底举行。根据近期对各项目团队的情况摸底与各项组织筹备工作的安排，学校拟定于4月中旬举办校赛，并将于近期开展2-3轮校内评审工作，力求保证参赛项目质量与进度，同时评审结果也将作为遴选推荐省赛的重要依据。现将校内第一轮评审有关事项通知如下：</p><p>	</p><p>	一、评审答辩要求</p><p>	本轮评审主要结合各项目团队的《项目设计报告》（模板见附件1）和项目进展PPT汇报进行评分，各团队需认真完成《项目设计报告》的填写，于3月16日之前连同项目进展PPT以指定方式提交。</p><p>	（一）项目设计报告要求</p><p>	《项目设计报告》需按照“第X组-XXX赛道-XXX赛项-项目设计报告-XXX（组长姓名）”的规则命名，各项填报内容不得留空。</p><p>	（二）答辩PPT要求</p><p>	项目进展PPT需要包括但不仅限于以下内容：</p><p>	1、项目方案</p><p>	明确列出项目设计的构想与出发点，实物组需包含机械结构与控制部分的设计思路与方案。</p><p>	2、目前工作进展</p><p>	清晰说明已实现和尚未实现的内容，以及预计完成项目的时间点。</p><p>	3、创新点与优势</p><p>	项目设计与实施中的创新思路与做法，以及作品体现出的技术、模式上的创新性、先进性及竞争优势。</p><p>	4、存在的问题</p><p>	项目目前存在的问题与分析，以及改进思路与措施。</p><p>	5、下一步工作计划</p><p>	后续备赛阶段拟定开展改进或者优化项目的举措，需列明时间安排。</p><p>	6、经费预算</p><p>	列明前期已产生的设备、耗材等相关费用，以及后续工作计划中的经费预算。</p><p>	（三）其他要求</p><p>	答辩时，如有实物允许带入答辩教室现场进行演示，如无实物或实物不便携带的应以视频的形式进行展示。</p><p>	</p><p>	二、评审答辩时间安排</p><p>	本次评审答辩定于3月17日（星期三）下午14:00-18:00进行，每组PPT汇报（含视频或者实物展示）7分钟，现场提问1分钟。</p><p>	</p><p>	材料提交方式、答辩分组及具体答辩时间表另行通知。</p><p class=\"ql-align-right\"><br></p><p class=\"ql-align-right\">实践教学中心</p><p class=\"ql-align-right\">机械工程学院</p><p class=\"ql-align-right\">2021年3月10日</p><p><br></p>', 2, 'YFB', '实践教学中心', '2021-03-17 00:00:00');
INSERT INTO `announcement` VALUES ('e7214455e39b4e869b3f31fb3dad5fea', 30, '2021年秋季日本爱媛大学交换生项目选拔通知', 8, '<h3 class=\"ql-align-center\"><span class=\"ql-size-large\">2021年秋季日本爱媛大学交换生项目选拔通知</span></h3><h4 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-16<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;411</span></h4><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年秋季日本爱媛大学交换生项目选拔通知</strong></p><p>	据我校与日本爱媛大学签订的校际学生交换协议，现将2021年秋季赴日参加爱媛大学交换生项目选拔事项通知如下，请各相关部门、学院按通知要求严肃认真做好选拔工作。</p><p>	<strong>校内报名截止时间：</strong>2021年3月21日</p><p>	<strong>项目时间：</strong>1学期或1年，2021秋季学期入学。</p><p>	<strong>项目介绍：</strong></p><p>	爱媛大学（Ehime University），位于爱媛县的日本国立大学。通称“爱大”或者媛大。〔因为有人将爱知大学称为“爱大”〕城北校区（法文学部、教育学部、工学部、理学部）紧靠松山大学。1949年 旧制松山高等学校、爱媛师范学校、爱媛青年师范学校、新居浜工业专门学校合并成爱媛大学，设立文理学部、教育学部、工学部。1954年 爱媛县立松山农科大学移交国有，设立农学部。1968年改组文理学部，设立法文学部、理学部。1973年设立医学部。2004年设立法科大学院。根据国立大学法人法，改为国立大学法人。</p><p>	交换生在日本爱媛大学对应学部参加交换学习，期间所获学分原则上返校后予以转换。</p><p>	<strong>选拔名额：</strong>2名</p><p>	<strong>选拔要求：</strong></p><p>	1、品学兼优，有赴日交换意向的我校外国语学院日语系研究生，非毕业班本科生。</p><p>	优先录取顺序为：研究生、大二、大一本科生。</p><p>	2、日语能力优秀。通过日本语能力测试（JLPT）N2并获得证书，或具有等同水平。</p><p>	注：满足以上所列所有要求者方可报名。有挂科、违纪受过处分者不予报名。</p><p>	<strong>选拔流程及时间节点：</strong></p><p>	1、2021年3月21日有意向的学生在西安交通大学外事工作服务系统-学生海外留学项目申报处（http://ims.xjtu.edu.cn/default.aspx）报名。</p><p>	2、2021年3月22日书院通过外事服务系统对报名人选进行审核。</p><p>	3、2021年3月22日学院通过外事服务系统按要求完成初选推荐。</p><p>	4、2021年3月23日教务处通过外事服务系统对初选推荐名单进行审核。</p><p>	5、2021年3月23日国际处终审确定最终校级推荐人选。</p><p>	<strong>费用情况：</strong></p><p>	对方免学费、注册费，我校学费正常缴纳。住宿费、生活费、往返旅费、保险费等个人承担。</p><p>	<strong>项目咨询：</strong></p><p>	本科生项目报名、学籍、学分转化认定：学院教务、教务处魏老师</p><p>	办公地点：主E1303室联系电话：029-82665477</p><p>	E-mail:xawei@xjtu.edu.cn</p><p>	研究生目报名、学籍、学分转化认定：学院教务、研究生院贺老师</p><p>	办公地点：主E1310室联系电话：029-82668580</p><p>	E-mail:tianyuanhe@xjtu.edu.cn</p><p>	项目内容：国际处徐阳老师</p><p>	办公地点：科学馆111室 联系电话：029-82668236</p><p>	E-mail:xuyang520@xjtu.edu.cn</p><p>	<strong>离校手续：</strong></p><p>	1、离校前填写《西安交通大学学生境外学习承诺书》。</p><p>	2、根据西安交通大学要求办理出访审批手续，出访审批手续办理请登录外事工作服务系统-学生因公出国（境）事务。</p><p>	3、参照《本科生赴境内外学习管理办法》（教务处主页“规章制度”栏查看）办理修读计划（与学院协商制定）、保留学籍、离校等手续。</p><p>	<strong>温馨提示：</strong></p><p>	项目申请流程较为紧凑，请有意申请者尽快备好以下材料以确保顺利参加项目：1）有效护照、2）语言能力证书或相关官方证明、3）中英文成绩单、在读证明等。以上材料请务必提前备好。其余材料国际处将组织申请指导（入选者将得到电话通知）特别说明。</p><p>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p class=\"ql-align-right\">2021年3月16日</p><p><br></p>', 1, 'YFB', ' 教务处', '2021-03-17 12:22:47');
INSERT INTO `announcement` VALUES ('bc1b25d792d24794bb23d69ea84d92bf', 31, '关于转发《教育部办公厅关于推荐新文科研究与改革实践项目的通知》《陕西省教育厅办公室关于做好新文科研究与改革实践项目申报工作的通知》的通知', 8, '<h3 class=\"ql-align-center\"><span class=\"ql-size-large\">关于转发《教育部办公厅关于推荐新文科研究与改革实践项目的通知》《陕西省教育厅办公室关于做好新文科研究与改革实践项目申报工作的通知》的通知</span></h3><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-12<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;728</span></h3><p><br></p><p>各学院（部、中心）及有关单位：</p><p>	现将《教育部办公厅关于推荐新文科研究与改革实践项目的通知》（教高厅函〔2021〕10号）（附件1）《陕西省教育厅办公室关于做好新文科研究与改革实践项目申报工作的通知》文件（附件2）转发给你们。</p><p>	一、申报要求</p><p class=\"ql-align-justify\">	本次遴选的项目为<strong>教育部</strong>及<strong>陕西省</strong>教育厅立项的新文科研究与改革实践项目。</p><p class=\"ql-align-justify\">	根据文件要求，请各单位认真研究《新文科研究与改革实践项目指南》（附件3），坚持问题导向、打通学科界别、突出自身特色、创新改革思路，结合已有工作基础和具体情况，按照选题要求确定申报项目内容。</p><p>	二、申报途径</p><p class=\"ql-align-justify\">	1.请各学院认真组织动员教师积极申报。我校向教育部及陕西省推荐限额各5项，学校每个教学单位限报2项。</p><p class=\"ql-align-justify\">	2.教育部《通知》指出“各教学指导委员会、中国高等教育学会应发挥统筹协调作用，各教学指导委员会可择优推荐不超过2项，中国高等教育学会可推荐不超过10项”。</p><p class=\"ql-align-justify\">	</p><p class=\"ql-align-justify\">	陕西省《通知》指出“陕西省高等学校教学指导委员会，陕西高等教育学会应发挥统筹协调作用，可分别择优遴选推荐不超过5项”。</p><p class=\"ql-align-justify\">	请各教学单位，特别是担任教指委主任和副主任单位的学院，充分利用教育部、陕西省教指委和协（学）会推荐资格积极申报。</p><p class=\"ql-align-justify\">	3.已向教务处提交的<strong>教育部</strong>新文科研究与改革实践项目，若未获得推荐机会，将自动进入本次省级新文科研究与改革实践项目候选队列，参与遴选。</p><p>	三、材料报送</p><p class=\"ql-align-justify\">	请申报单位认真填写《新文科研究与改革实践项目推荐表》（附件4），经教学院长审核签字盖章后于3月23日前统一上报至教务处通识科（主楼E座1303），电子版发送至bhzhang19@xjtu.edu.cn。</p><p>	联系人：张博华&nbsp;&nbsp;联系电话：82668311</p><p>	</p><p>	附件：1.《教育部办公厅关于推荐新文科研究与改革实践项目的通知》</p><p>	&nbsp;&nbsp;&nbsp;2.《陕西省教育厅办公室关于推荐新文科研究与改革实践项目的通知》</p><p>		&nbsp;&nbsp;&nbsp;3.	《	新文科研究与改革实践项目指南	》</p><p>		&nbsp;&nbsp;&nbsp;4.	《	新文科研究与实践项推荐表	》</p><p>	</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年3月16日</p>', 3, 'YFB', ' 教务处', '2021-03-17 12:25:55');

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
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of applied_subject
-- ----------------------------
INSERT INTO `applied_subject` VALUES (1, '1', 1, '2021-03-10 09:21:00', '略', '546546546', 'YTG', '你选个🔨', NULL, NULL);
INSERT INTO `applied_subject` VALUES (7, '1', 3, '2021-03-16 12:45:07', '<p>爱<span class=\"ql-size-huge\">哭鬼吧</span></p>', 'fa3619710878464fa866542e416b19ad', 'YTG', '你选个象拔蚌', NULL, NULL);
INSERT INTO `applied_subject` VALUES (8, '1', 1, '2021-03-17 01:13:03', '<p>请输入申请<span class=\"ql-size-huge\">原因测试</span></p>', '0e8d688091214738bc09564c2e3a6fc9', 'WTG', '老板说你今天左脚进门', NULL, NULL);
INSERT INTO `applied_subject` VALUES (9, '1', 7, '2021-03-17 12:27:57', '<p>请输入申请原因</p><p>2222</p>', '9a9f8ab2211a46eeb79201aaf16ce5d6', 'WSH', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (10, '2', 6, '2021-03-18 11:23:57', '👴申请不需要理由', NULL, 'WSH', NULL, NULL, NULL);

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
INSERT INTO `class` VALUES (1, '软件1班');
INSERT INTO `class` VALUES (2, '软件2班');
INSERT INTO `class` VALUES (3, '软件3班');
INSERT INTO `class` VALUES (4, '软件4班');
INSERT INTO `class` VALUES (5, '计算机1班');
INSERT INTO `class` VALUES (6, '计算机2班');
INSERT INTO `class` VALUES (7, '计算机3班');
INSERT INTO `class` VALUES (8, '计算机4班');
INSERT INTO `class` VALUES (9, '计算机5班');
INSERT INTO `class` VALUES (10, '医电1班');
INSERT INTO `class` VALUES (11, '医电2班');
INSERT INTO `class` VALUES (12, '医电3班');
INSERT INTO `class` VALUES (13, '自动化1班');
INSERT INTO `class` VALUES (14, '自动化2班');
INSERT INTO `class` VALUES (15, '自动化3班');
INSERT INTO `class` VALUES (16, '自动化4班');
INSERT INTO `class` VALUES (17, '自动化5班');
INSERT INTO `class` VALUES (18, '自动化6班');
INSERT INTO `class` VALUES (19, '自动化7班');
INSERT INTO `class` VALUES (20, '自动化8班');

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
INSERT INTO `college` VALUES (1, '软件学院');
INSERT INTO `college` VALUES (2, '生命学院');
INSERT INTO `college` VALUES (3, '电信学院');
INSERT INTO `college` VALUES (4, '马克思学院');
INSERT INTO `college` VALUES (5, '人文学院');
INSERT INTO `college` VALUES (6, '电气学院');
INSERT INTO `college` VALUES (7, '能动学院');
INSERT INTO `college` VALUES (8, '机械学院');

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
INSERT INTO `dict` VALUES (7, 'MESSAGE_TYPE', 'YSC', '3', '已删除');
INSERT INTO `dict` VALUES (7, 'MESSAGE_TYPE', 'YCK', '2', '已查看');
INSERT INTO `dict` VALUES (7, 'MESSAGE_TYPE', 'WCK', '1', '未查看');
INSERT INTO `dict` VALUES (8, 'TASK_STATUS', 'WTJ', '1', '未提交');
INSERT INTO `dict` VALUES (8, 'TASK_STATUS', 'DSH', '2', '待审核');
INSERT INTO `dict` VALUES (8, 'TASK_STATUS', 'YTG', '3', '已通过');
INSERT INTO `dict` VALUES (8, 'TASK_STATUS', 'WTG', '4', '未通过');

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
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_storage
-- ----------------------------
INSERT INTO `file_storage` VALUES ('456544465', 8, 'abaaba', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `file_storage` VALUES ('456544465', 9, 'abaabaaba', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `file_storage` VALUES ('456544465', 10, 'test', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `file_storage` VALUES ('546546546', 11, 'test2', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `file_storage` VALUES ('546546546', 12, 'test3', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `file_storage` VALUES ('fa3619710878464fa866542e416b19ad', 13, 'test4', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `file_storage` VALUES ('89894554', 28, '微信图片_20180907174304.jpg', NULL, 319475, 'D:\\fileuploadtest', 0, 8, '2021-03-17 10:01:15');
INSERT INTO `file_storage` VALUES ('89894554', 29, 'e313bb75-2738-48fc-b1c1-346c582c9013.jpg', NULL, 156156, 'D:\\fileuploadtest', 0, 8, '2021-03-17 10:01:47');
INSERT INTO `file_storage` VALUES ('test', 34, 'wallhaven-zxv71g_3840x2160.png', NULL, NULL, 'D:\\fileuploadtest', 0, NULL, NULL);
INSERT INTO `file_storage` VALUES ('879789879', 35, '狗肉火锅这样做，老人小孩都说香！', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `file_storage` VALUES ('879789879', 36, '动保协会快速入会指南', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `file_storage` VALUES ('undefined', 37, 'E1A54A6A653257DA1819F9B07EE9B4D6.png', NULL, 48013, 'D:\\fileuploadtest', 0, 12, '2021-03-19 15:47:29');
INSERT INTO `file_storage` VALUES ('undefined', 38, '2.PNG', NULL, 239814, 'D:\\fileuploadtest', 0, 12, '2021-03-19 15:47:29');
INSERT INTO `file_storage` VALUES ('undefined', 39, '1.PNG', NULL, 160794, 'D:\\fileuploadtest', 0, 12, '2021-03-19 15:47:29');
INSERT INTO `file_storage` VALUES ('undefined', 40, 'open_mailbox_with_raised_flag_128px_1215142_easyicon.net.ico', NULL, 54846, 'D:\\fileuploadtest', 0, 12, '2021-03-19 15:47:29');
INSERT INTO `file_storage` VALUES ('undefined', 41, '89CEC72BED07F602C6B499DB44DB0874.png', NULL, 58671, 'D:\\fileuploadtest', 0, 12, '2021-03-19 15:47:29');
INSERT INTO `file_storage` VALUES ('8ff6d8205afa40abbe3c08e736cf8c61', 42, '微25939.jpg', NULL, 250176, 'D:\\fileuploadtest', 0, 12, '2021-03-19 17:18:30');
INSERT INTO `file_storage` VALUES ('1111', 43, '捕获.PNG', NULL, 16764, 'D:\\fileuploadtest', 0, 12, '2021-03-19 17:27:56');
INSERT INTO `file_storage` VALUES ('1', 44, 'open_mailbox_with_raised_flag_128px_1215142_easyicon.net.ico', NULL, 54846, 'D:\\fileuploadtest', 0, 12, '2021-03-19 17:37:06');
INSERT INTO `file_storage` VALUES ('1', 45, '微25939.jpg', NULL, 250176, 'D:\\fileuploadtest', 0, 12, '2021-03-19 17:38:09');

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
INSERT INTO `handin` VALUES (1, 0, '0e1948d5699d433491f1aec1fb12bb69', 0, 0, '反馈测试', '2021-03-12 12:05:06');

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
INSERT INTO `login_log` VALUES ('admin', '2021-03-18 15:13:32', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-18 16:00:38', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-18 22:21:27', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-19 09:17:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-19 09:17:44', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-19 09:17:44', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-19 09:17:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 09:35:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 09:41:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-19 10:31:29', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-19 11:04:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 11:12:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 11:12:53', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-19 11:13:26', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 11:24:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 14:07:48', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-19 14:26:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 14:28:17', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 15:18:34', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-19 15:19:29', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 15:25:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 15:42:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 15:53:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 16:01:07', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 16:20:59', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 16:29:58', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 16:47:48', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 16:58:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-19 17:02:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaoduan', '2021-03-19 17:04:41', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-19 17:15:07', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 17:21:18', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 17:26:27', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 17:48:59', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 17:52:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-19 18:12:12', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-19 18:12:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-19 18:12:52', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-19 19:45:11', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 20:09:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-19 20:42:56', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-19 20:56:00', NULL, '127.0.0.1');

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
INSERT INTO `major` VALUES (1, 1, '软件工程');
INSERT INTO `major` VALUES (2, 3, '自动化');
INSERT INTO `major` VALUES (3, 2, '医电');
INSERT INTO `major` VALUES (4, 3, '计算机');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `MENU_ID` int NOT NULL,
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '系统管理', '/sys', NULL, 'el-icon-setting', 0, NULL, 1);
INSERT INTO `menu` VALUES (3, 1, '用户管理', '/sys/user', NULL, 'el-icon-loading', 0, 'user:view', 1);
INSERT INTO `menu` VALUES (4, 1, '角色管理', '/sys/role', NULL, 'el-icon-user', 0, 'role:view', 2);
INSERT INTO `menu` VALUES (5, 1, '权限管理', '/sys/perm', NULL, 'el-icon-user-solid', 0, 'menu:view', 3);
INSERT INTO `menu` VALUES (6, 1, '菜单管理', '/sys/menu', NULL, 'el-icon-key', 0, 'dept:view', 4);
INSERT INTO `menu` VALUES (8, 1, '阶段控制', '/sys/stage', NULL, 'el-icon-set-up', 0, 'user:online', 1);
INSERT INTO `menu` VALUES (10, 0, '公告管理', '/notice', NULL, 'el-icon-data-line', 0, 'log:view', 2);
INSERT INTO `menu` VALUES (11, 10, '管理公告', '/notice/manage', NULL, 'el-icon-chat-line-square', 1, 'user:add', NULL);
INSERT INTO `menu` VALUES (12, 10, '查看公告', '/notice/view', NULL, 'el-icon-s-check', 1, 'user:update', NULL);
INSERT INTO `menu` VALUES (13, 0, '校外毕设', '/offschool', NULL, 'el-icon-view', 1, 'user:delete', NULL);
INSERT INTO `menu` VALUES (14, 13, '提交申请', '/offschool/request', NULL, 'el-icon-school', 1, 'role:add', NULL);
INSERT INTO `menu` VALUES (15, 13, '教师初审核', '/offschool/judge/teacher', NULL, 'el-icon-document', 1, 'role:update', NULL);
INSERT INTO `menu` VALUES (16, 13, '教研室终审', '/offschool/judge/final', NULL, 'el-icon-check', 1, 'role:delete', NULL);
INSERT INTO `menu` VALUES (17, 13, '审核结果', '/offschool/result', NULL, 'el-icon-circle-check', 1, 'menu:add', NULL);
INSERT INTO `menu` VALUES (18, 0, '过程监督', '/process', NULL, 'el-icon-postcard', 1, 'menu:update', NULL);
INSERT INTO `menu` VALUES (19, 0, '出题管理', '/subject/apply', NULL, 'el-icon-data-line', 1, 'menu:delete', NULL);
INSERT INTO `menu` VALUES (20, 19, '教师出题', '/subject/apply/teacher', NULL, 'el-icon-s-management', 1, 'dept:add', NULL);
INSERT INTO `menu` VALUES (21, 19, '自拟课题', '/subject/apply/stu', NULL, 'el-icon-s-custom', 1, 'dept:update', NULL);
INSERT INTO `menu` VALUES (22, 19, '教师审题', '/subject/judge/teacher', NULL, 'el-icon-user', 1, 'dept:delete', NULL);
INSERT INTO `menu` VALUES (23, 19, '教研室审题', '/subject/judge/final', NULL, 'el-icon-check', 1, 'user:kickout', NULL);
INSERT INTO `menu` VALUES (24, 19, '审核状态', '/subject/apply/result', NULL, 'el-icon-circle-check', 1, 'log:delete', NULL);
INSERT INTO `menu` VALUES (25, 0, '选题管理', '/subject/select', NULL, 'el-icon-wallet', 0, NULL, 4);
INSERT INTO `menu` VALUES (26, 25, '查看所有课题', '/subject/all', NULL, 'el-icon-thumb', 0, 'weather:view', 1);
INSERT INTO `menu` VALUES (27, 25, '学生选题申请', '/subject/select/apply', NULL, 'el-icon-menu', 0, 'article:view', 2);
INSERT INTO `menu` VALUES (28, 25, '教师审核', '/subject/select/judge/teacher', NULL, 'el-icon-edit-outline', 0, 'dict:view', 5);
INSERT INTO `menu` VALUES (29, 25, '教研室审核', '/subject/select/judge/final', NULL, 'el-icon-check', 1, 'dict:add', NULL);
INSERT INTO `menu` VALUES (30, 25, '查看互选信息', '/subject/select/result', NULL, 'el-icon-circle-check', 1, 'dict:update', NULL);
INSERT INTO `menu` VALUES (31, 0, '开题管理', '/initial', NULL, 'el-icon-view', 1, 'dict:delete', NULL);
INSERT INTO `menu` VALUES (32, 0, '中期管理', '/middle', NULL, 'el-icon-video-play', 0, NULL, 3);
INSERT INTO `menu` VALUES (33, 0, '结题管理', '/conclusion', NULL, 'el-icon-time', 0, 'movie:hot', 1);
INSERT INTO `menu` VALUES (34, 0, '统计报表', '/statistics', NULL, 'el-icon-timer', 0, 'movie:coming', 2);
INSERT INTO `menu` VALUES (2222, 1, '组件测试界面', '/test', NULL, 'el-icon-data-line', 0, NULL, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 3, 8, '测试公告', 'WCK', '这是一个测试通知，没有实际意义', '2021-03-11 10:33:52');
INSERT INTO `message` VALUES ('10', 19, 14, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-19 20:34:13');
INSERT INTO `message` VALUES ('11', 19, 14, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-19 20:34:13');
INSERT INTO `message` VALUES ('12', 19, 14, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-19 20:34:13');
INSERT INTO `message` VALUES ('2', 5, 8, '实验公告', 'YCK', '这是一个实验通知，没有实际意义', '2021-03-15 10:44:21');
INSERT INTO `message` VALUES ('8', 19, 14, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-19 20:34:13');
INSERT INTO `message` VALUES ('9', 19, 14, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-19 20:34:13');

-- ----------------------------
-- Table structure for passed_subject
-- ----------------------------
DROP TABLE IF EXISTS `passed_subject`;
CREATE TABLE `passed_subject`  (
  `SUB_ID` int NOT NULL,
  `CHOSEN` int NULL DEFAULT 0,
  `CAPACITY` int NULL DEFAULT 3,
  PRIMARY KEY (`SUB_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of passed_subject
-- ----------------------------
INSERT INTO `passed_subject` VALUES (1, 0, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plea
-- ----------------------------
INSERT INTO `plea` VALUES (1, 'XT', 1, 1, 3, '2020-07-30 13:20:18', '2020-07-31 13:20:18', 1);
INSERT INTO `plea` VALUES (15, 'JT', 0, 49, 1, '2021-03-02 00:00:00', '2021-03-02 00:00:00', 1);
INSERT INTO `plea` VALUES (16, 'JT', 1, 50, 1, '2021-03-23 00:00:00', '2021-03-23 00:00:00', 1);

-- ----------------------------
-- Table structure for plea_application
-- ----------------------------
DROP TABLE IF EXISTS `plea_application`;
CREATE TABLE `plea_application`  (
  `ID` int NOT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `APPLY_TIME` datetime NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表明学生申请的答辩所处的阶段',
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUDIT_BY` int NULL DEFAULT NULL,
  `AUDIT_TIME` datetime NULL DEFAULT NULL,
  `FEEDBACK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `STU_ID`(`STU_ID`) USING BTREE,
  INDEX `AUDIT_BY`(`AUDIT_BY`) USING BTREE,
  INDEX `STAGE`(`STAGE`) USING BTREE,
  CONSTRAINT `plea_application_ibfk_1` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plea_application_ibfk_2` FOREIGN KEY (`AUDIT_BY`) REFERENCES `teaching_office` (`OFFICE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plea_application
-- ----------------------------
INSERT INTO `plea_application` VALUES (1, 1, '2021-03-04 11:37:20', 'JT', 'YTG', 1, '2021-03-05 11:38:14', NULL);
INSERT INTO `plea_application` VALUES (2, 2, '2021-03-05 11:37:20', 'JT', 'YTG', 1, '2021-03-05 11:38:14', NULL);
INSERT INTO `plea_application` VALUES (3, 3, '2021-03-05 11:46:51', 'JT', 'YTG', 1, '2021-03-06 11:46:44', NULL);
INSERT INTO `plea_application` VALUES (4, 4, '2021-03-06 11:49:43', 'JT', 'YTG', 1, '2021-03-07 11:49:46', NULL);
INSERT INTO `plea_application` VALUES (5, 5, '2021-03-07 11:49:52', 'JT', 'YTG', 1, '2021-03-08 11:49:55', NULL);
INSERT INTO `plea_application` VALUES (6, 6, '2021-03-08 11:49:59', 'JT', 'YTG', 1, '2021-03-09 11:50:02', NULL);
INSERT INTO `plea_application` VALUES (7, 7, '2021-03-09 11:50:05', 'JT', 'WTG', 1, '2021-03-10 11:50:10', '垃圾');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plea_result
-- ----------------------------
INSERT INTO `plea_result` VALUES (1, 3, NULL, 'KT', 80, '你去吃粑粑吧', 1);

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SUB_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_ID` int NULL DEFAULT NULL,
  `RETRIES` int NULL DEFAULT 0,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阶段（开题或中期）',
  `MEANING` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `RESULT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `PLAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `PROGRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于中期',
  `POST_PLAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于中期',
  `POSE_BY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSE_TIME` datetime NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `AUDIT_BY` int NULL DEFAULT NULL,
  `AUDIT_TIME` datetime NULL DEFAULT NULL,
  `COMMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SCORE` int NULL DEFAULT NULL,
  `IS_RELEASED` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES (1, '1', 1, 0, '456456', 'KT', '没啥意义', '没啥结果', '没啥计划', '没啥进度', '没啥后续计划', '3', '2021-03-17 10:54:56', 'YTG', 3, '2021-03-18 11:39:59', '<p>12312313</p>', 90, 0);
INSERT INTO `report` VALUES (4, NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7', '2021-03-17 17:49:28', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (5, '1', NULL, 0, NULL, 'KT', '<p>研究上课摸鱼很有意义哦</p>', '<p>调研了很久发现很多晋姓同学喜欢上课摸鱼</p>', '<p>我计划上课观察晋同学</p>', NULL, NULL, '1', '2021-03-19 19:53:41', 'WSH', NULL, NULL, '5191911', NULL, 0);
INSERT INTO `report` VALUES (6, '1', NULL, 0, NULL, 'KT', '<p>研究上课摸鱼很有意义哦</p>', '<p>没啥结果，研究晋同学就行了</p>', '<p>繁殖一万个晋同学进行上课研究</p>', NULL, NULL, '1', '2021-03-19 20:05:06', 'WSH', NULL, NULL, '5991119', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置各阶段角色的权限' ROW_FORMAT = DYNAMIC;

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
  CONSTRAINT `FK_INHERITANCE_5` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩秘书' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of secretary
-- ----------------------------
INSERT INTO `secretary` VALUES (14, 1);
INSERT INTO `secretary` VALUES (15, 2);
INSERT INTO `secretary` VALUES (16, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阶段任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stage_task
-- ----------------------------
INSERT INTO `stage_task` VALUES (1, '1', '帮老师遛狗', '不给你就退学吧', '879789879', 1, 1, 'KT', 'WTJ', '2021-02-23 15:36:36', '2021-03-19 15:36:40');
INSERT INTO `stage_task` VALUES (2, 'ef3d55a7f0184c0688fe4d3cc13621e3', '123', '123', NULL, NULL, 3, 'KT', 'WTJ', '2021-03-17 00:00:00', '2021-04-22 00:00:00');
INSERT INTO `stage_task` VALUES (3, '2', '准备学习材料', '你好', NULL, NULL, 3, 'KT', 'WTJ', '2021-03-04 00:00:00', '2021-03-04 00:00:00');
INSERT INTO `stage_task` VALUES (4, '2', '', '', NULL, NULL, 3, '', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (5, '2', '', '', NULL, NULL, 3, '', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (6, '2', '测试', '踩踩踩', '131df8ab8f2a4585ace190a7c6ff45e3', NULL, 3, 'KT', 'WTJ', '2021-03-03 00:00:00', '2021-03-03 00:00:00');
INSERT INTO `stage_task` VALUES (7, '2', '事实上', '事实上', 'd8d50354a5b24feab03d2902785c1784', NULL, 3, 'KT', 'WTJ', '2021-03-05 00:00:00', '2021-03-05 00:00:00');
INSERT INTO `stage_task` VALUES (8, '2', '任务2', '122121', '9b9be60af39c4613a2d5cbfade953831', NULL, 3, 'KT', 'WTJ', '2021-03-03 00:00:00', '2021-03-03 00:00:00');
INSERT INTO `stage_task` VALUES (9, '2', '任务3', '权威地位', '841f8b4f9c934e42870615b216163236', NULL, 3, 'KT', 'WTJ', '2021-03-02 00:00:00', '2021-03-03 00:00:00');
INSERT INTO `stage_task` VALUES (10, '1', '当校长', '没错👴是神', '879789880', 1, 1, 'KT', 'WTJ', '2021-03-20 21:18:28', '2021-03-20 21:18:31');
INSERT INTO `stage_task` VALUES (14, '1', '把自己打一顿', '恰鸡腿', '64564564', 1, 1, 'KT', 'WTJ', '2021-03-10 21:18:14', '2021-03-20 21:18:17');
INSERT INTO `stage_task` VALUES (15, '1', '去菁蓉夜市', '卖冰纷', NULL, NULL, NULL, NULL, 'WTJ', '2021-03-20 21:18:20', '2021-03-27 21:18:24');

-- ----------------------------
-- Table structure for stage_task_result
-- ----------------------------
DROP TABLE IF EXISTS `stage_task_result`;
CREATE TABLE `stage_task_result`  (
  `TASK_ID` int NULL DEFAULT NULL,
  `RETRIES` int NULL DEFAULT NULL,
  `SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `AUDIT_TIME` datetime NULL DEFAULT NULL,
  `SCORE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stage_task_result
-- ----------------------------
INSERT INTO `stage_task_result` VALUES (1, 1, 'tset', NULL, 'set', 'WSH', '2021-03-19 14:34:12', '90');
INSERT INTO `stage_task_result` VALUES (1, 2, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `stage_task_result` VALUES (2, 1, 'tset', NULL, NULL, NULL, NULL, '90');
INSERT INTO `stage_task_result` VALUES (2, 2, 'test', NULL, NULL, NULL, NULL, '90');
INSERT INTO `stage_task_result` VALUES (2, 3, 'test', NULL, NULL, NULL, NULL, '69');
INSERT INTO `stage_task_result` VALUES (10, 1, '👴不干了', NULL, NULL, 'WSH', NULL, '85');
INSERT INTO `stage_task_result` VALUES (14, 1, '👴要退学', NULL, NULL, 'WSH', NULL, NULL);
INSERT INTO `stage_task_result` VALUES (15, 1, '阿巴阿巴阿爸', NULL, NULL, 'WSH', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生小组，分批进行答辩' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_group
-- ----------------------------
INSERT INTO `stu_group` VALUES (1, 1, 3, 'XT');
INSERT INTO `stu_group` VALUES (2, 1, 2, 'XT');
INSERT INTO `stu_group` VALUES (135, 0, 4, 'JT');
INSERT INTO `stu_group` VALUES (136, 1, 6, 'JT');
INSERT INTO `stu_group` VALUES (137, 0, 2, 'JT');
INSERT INTO `stu_group` VALUES (138, 1, 3, 'JT');
INSERT INTO `stu_group` VALUES (139, 0, 5, 'JT');
INSERT INTO `stu_group` VALUES (140, 1, 1, 'JT');

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
  INDEX `COLLEGE_ID`(`COLLEGE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_29` FOREIGN KEY (`MAJOR_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_31` FOREIGN KEY (`CLASS_ID`) REFERENCES `class` (`CLASS_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (2, 1, 1, 1, 1);
INSERT INTO `student` VALUES (3, 2, 1, 1, 4);
INSERT INTO `student` VALUES (4, 3, 2, 3, 11);
INSERT INTO `student` VALUES (5, 4, 3, 2, 14);
INSERT INTO `student` VALUES (6, 5, 3, 4, 9);
INSERT INTO `student` VALUES (7, 6, 1, 1, 3);
INSERT INTO `student` VALUES (8, 7, 3, 4, 5);

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
  `ZONE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSE_BY` int NULL DEFAULT NULL,
  `POSE_TIME` datetime NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `MAJOR_ID` int NULL DEFAULT NULL,
  `AUDIT_BY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUDIT_TIME` datetime NULL DEFAULT NULL,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_10`(`POSE_BY`) USING BTREE,
  INDEX `FK_RELATIONSHIP_28`(`MAJOR_ID`) USING BTREE,
  INDEX `SUB_ID`(`SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`POSE_BY`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_28` FOREIGN KEY (`MAJOR_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '456544465', '1', '上班摸鱼', '一般来说， 我认为， 歌德曾经说过，读一本好书，就如同和一个高尚的人在交谈。这句话把我们带到了一个新的维度去思考这个问题: 那么， 在这种困难的抉择下，本人思来想去，寝食难安。 经过上述讨论， 现在，解决上班摸鱼的问题，是非常非常重要的。 所以， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 而这些并不是完全重要，更加重要的问题是， 一般来讲，我们都必须务必慎重的考虑考虑。 上班摸鱼的发生，到底需要如何做到，不上班摸鱼的发生，又会如何产生。 王阳明曾经说过，故立志者，为学之心也；为学者，立志之事也。这句话语虽然很短, 但令我浮想联翩。', '有手就行', 'KXTS', 3, '2021-03-04 13:38:24', 'YTG', 1, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (2, '124214234', '2', '上课开船', '一般来说， 我认为， 歌德曾经说过，读一本好书，就如同和一个高尚的人在交谈。这句话把我们带到了一个新的维度去思考这个问题: 那么， 在这种困难的抉择下，本人思来想去，寝食难安。 经过上述讨论， 现在，解决上班摸鱼的问题，是非常非常重要的。 所以， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 而这些并不是完全重要，更加重要的问题是， 一般来讲，我们都必须务必慎重的考虑考虑。 上班摸鱼的发生，到底需要如何做到，不上班摸鱼的发生，又会如何产生。 王阳明曾经说过，故立志者，为学之心也；为学者，立志之事也。这句话语虽然很短, 但令我浮想联翩。', '戴眼罩', 'KXTS', 2, NULL, 'YTG', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (14, NULL, 'ef3d55a7f0184c0688fe4d3cc13621e3', '我是啥币', '研究我自己', '名字笔画39画', 'KXTS', 2, '2021-03-15 20:27:39', '0', NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `system_stage` VALUES (0, 0, '课题申报', '在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 1, '课题申报审核', '在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。dwqvqw', '2021-03-11 00:00:00', '2021-03-11 00:00:00');
INSERT INTO `system_stage` VALUES (0, 2, '被驳回课题整改', '在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 3, '学生提交选题申请', '在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 4, '教师审核学生申请', '在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 5, '开题报告及材料提交', '在该阶段，学生可以在系统提交开题报告及与开题相关的材料。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (1, 6, '开题答辩', '在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
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
INSERT INTO `teacher` VALUES (10, 1, 1, '校长/ICU访问学者', 'https://baike.baidu.com/item/%E5%AE%8B%E6%B0%B8%E7%BA%A2/29205?fr=aladdin');
INSERT INTO `teacher` VALUES (12, 2, 3, '院长', 'http://gr.xjtu.edu.cn/web/xzdu');
INSERT INTO `teacher` VALUES (11, 3, 3, 'ICU访问学者', 'http://gr.xjtu.edu.cn/web/raoyuan');
INSERT INTO `teacher` VALUES (17, 4, 7, '教授', NULL);
INSERT INTO `teacher` VALUES (18, 5, 4, '副教授', NULL);

-- ----------------------------
-- Table structure for teaching_office
-- ----------------------------
DROP TABLE IF EXISTS `teaching_office`;
CREATE TABLE `teaching_office`  (
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `OFFICE_ID` int NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `OFFICE_ID`(`OFFICE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_4` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教研室' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teaching_office
-- ----------------------------
INSERT INTO `teaching_office` VALUES (13, 1);

-- ----------------------------
-- Table structure for thesis
-- ----------------------------
DROP TABLE IF EXISTS `thesis`;
CREATE TABLE `thesis`  (
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID` int NOT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `STATUS` int NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_21`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_21` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '论文' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of thesis
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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张狗蛋', 'mrbird', '94f860c4bbfeb2f49c84e321fdda4b07', '13455533233', 'mrbird12111111123@hotmail.com', 'M');
INSERT INTO `user` VALUES (2, '张静月', 'stu1', '98391446a5bd852b5773b061e27f69c4', '15134627380', 'scott@qq.com', 'M');
INSERT INTO `user` VALUES (3, '朱一丹', 'jack', '552649f10640385d0728a80a4242893e', NULL, 'jack@hotmail.com', 'M');
INSERT INTO `user` VALUES (4, '朱二丹', 'xiaoduan', 'dd3de68a6c00fed6168f8371233a6f7a', NULL, 'test@163.com', 'F');
INSERT INTO `user` VALUES (5, '朱三丹', 'test', '1c9a231a07da290d3286500bdd5fe8a9', '18811445654', 'sdfsdf@qq.com', 'F');
INSERT INTO `user` VALUES (6, '朱四丹', 'ddmtest14', '54b9e629dc5e6c8f13c076d397f0723c', '18856345234', '45116365@qq.com', 'F');
INSERT INTO `user` VALUES (7, '朱五丹', 'test1', 'ec69baa6c7505fd94d0f5061804d00ca', '18811487981', 'test1@qq.com', 'F');
INSERT INTO `user` VALUES (8, '朱六丹', 'stu2', 'e7176eec59b1d0e411f101af2b71dac1', '18246544545', 'admin@admin.com', 'F');
INSERT INTO `user` VALUES (9, '朱七丹', 'test33333', '78b8011fa4d77888f331646926bf5a12', '18658273808', 'sdasdas@adas.com', 'F');
INSERT INTO `user` VALUES (10, '饶元', 'xiaozhang', '5c25bd899750dc00ba63a561c66a11a2', NULL, 'raoyuan@tea.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (11, '贾老师', 'jialaoshi', '4138d11bbf61ebc5d85b9cfb163ded5a', '18097275161', 'jialaoshi@qq.com', 'M');
INSERT INTO `user` VALUES (12, '老师', 'laoshi', '1d81aa6354f5e87dee512cbc7a0668d4', '13389974516', 'laoshi@qq.com', 'F');
INSERT INTO `user` VALUES (13, '系办', 'dogshit', '7640b31ef844c6dda2f3f7877c54e46e', '13389974516', NULL, 'M');
INSERT INTO `user` VALUES (14, '答辩秘书', 'dabian', 'e4b28a3c4dbdb107b16bd44051130ec3', '13952764917', NULL, 'F');
INSERT INTO `user` VALUES (15, '答辩秘书1', 'dabian1', 'e4b28a3c4dbdb107b16bd44051130ec3', '13968738492', NULL, 'F');
INSERT INTO `user` VALUES (16, '答辩秘书2', 'dabian2', 'e4b28a3c4dbdb107b16bd44051130ec3', '13368738492', NULL, 'M');
INSERT INTO `user` VALUES (17, '房峰辉', 'fangfenghui', '3a564cceb0eaddf81188b01ff8b1e86c', '15945746235', NULL, 'M');
INSERT INTO `user` VALUES (18, '中幅田', 'zhongfutian', 'fa0b132f5b41d29f7f3b51190c18bb0b', '17025331905', NULL, 'F');
INSERT INTO `user` VALUES (19, '管理员', 'admin', '3ee4a28b103216fa2d140d1979297910', NULL, NULL, NULL);

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
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (1, 19);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (3, 12);
INSERT INTO `user_role` VALUES (3, 11);
INSERT INTO `user_role` VALUES (3, 10);
INSERT INTO `user_role` VALUES (3, 8);
INSERT INTO `user_role` VALUES (2, 9);
INSERT INTO `user_role` VALUES (2, 7);
INSERT INTO `user_role` VALUES (2, 6);
INSERT INTO `user_role` VALUES (2, 5);
INSERT INTO `user_role` VALUES (2, 4);
INSERT INTO `user_role` VALUES (2, 3);
INSERT INTO `user_role` VALUES (4, 13);
INSERT INTO `user_role` VALUES (5, 14);
INSERT INTO `user_role` VALUES (5, 15);
INSERT INTO `user_role` VALUES (5, 16);
INSERT INTO `user_role` VALUES (3, 17);
INSERT INTO `user_role` VALUES (3, 18);

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
  CONSTRAINT `FK_RELATIONSHIP_30` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户当前状态' ROW_FORMAT = DYNAMIC;

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
