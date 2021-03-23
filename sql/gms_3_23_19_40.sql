/*
 Navicat Premium Data Transfer

 Source Server         : shixun
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 106.14.150.115:6000
 Source Schema         : gms

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 23/03/2021 19:40:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acceptance_teacher
-- ----------------------------
DROP TABLE IF EXISTS `acceptance_teacher`;
CREATE TABLE `acceptance_teacher`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `TEACHER_ID` int(0) NULL DEFAULT NULL COMMENT '老师ID',
  `TEAM_ID` int(0) NULL DEFAULT NULL,
  `IS_LEADER` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_5`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_6`(`TEAM_ID`) USING BTREE,
  CONSTRAINT `acceptance_teacher_ibfk_1` FOREIGN KEY (`TEAM_ID`) REFERENCES `acceptance_team` (`TEAM_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收老师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acceptance_teacher
-- ----------------------------
INSERT INTO `acceptance_teacher` VALUES (1, 3, 1, 1);
INSERT INTO `acceptance_teacher` VALUES (2, 5, 1, 0);
INSERT INTO `acceptance_teacher` VALUES (126, 3, 56, 1);
INSERT INTO `acceptance_teacher` VALUES (127, 5, 57, 1);
INSERT INTO `acceptance_teacher` VALUES (128, 2, 56, 0);
INSERT INTO `acceptance_teacher` VALUES (129, 4, 57, 0);
INSERT INTO `acceptance_teacher` VALUES (130, 1, 56, 0);
INSERT INTO `acceptance_teacher` VALUES (136, 3, 61, 1);
INSERT INTO `acceptance_teacher` VALUES (137, 5, 62, 1);
INSERT INTO `acceptance_teacher` VALUES (138, 4, 63, 1);
INSERT INTO `acceptance_teacher` VALUES (139, 1, 61, 0);
INSERT INTO `acceptance_teacher` VALUES (140, 2, 62, 0);
INSERT INTO `acceptance_teacher` VALUES (146, 36, 67, 1);
INSERT INTO `acceptance_teacher` VALUES (147, 5, 68, 1);
INSERT INTO `acceptance_teacher` VALUES (148, 31, 69, 1);
INSERT INTO `acceptance_teacher` VALUES (149, 4, 67, 0);
INSERT INTO `acceptance_teacher` VALUES (150, 34, 68, 0);
INSERT INTO `acceptance_teacher` VALUES (151, 38, 69, 0);
INSERT INTO `acceptance_teacher` VALUES (152, 35, 67, 0);
INSERT INTO `acceptance_teacher` VALUES (153, 32, 68, 0);
INSERT INTO `acceptance_teacher` VALUES (154, 33, 69, 0);
INSERT INTO `acceptance_teacher` VALUES (155, 37, 67, 0);
INSERT INTO `acceptance_teacher` VALUES (156, 1, 68, 0);
INSERT INTO `acceptance_teacher` VALUES (157, 39, 69, 0);
INSERT INTO `acceptance_teacher` VALUES (158, 30, 67, 0);
INSERT INTO `acceptance_teacher` VALUES (159, 2, 68, 0);
INSERT INTO `acceptance_teacher` VALUES (160, 3, 69, 0);

-- ----------------------------
-- Table structure for acceptance_team
-- ----------------------------
DROP TABLE IF EXISTS `acceptance_team`;
CREATE TABLE `acceptance_team`  (
  `TEAM_ID` int(0) NOT NULL AUTO_INCREMENT,
  `SEC_ID` int(0) NULL DEFAULT NULL,
  `STAGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TEAM_ID`) USING BTREE,
  INDEX `SEC_ID`(`SEC_ID`) USING BTREE,
  CONSTRAINT `acceptance_team_ibfk_1` FOREIGN KEY (`SEC_ID`) REFERENCES `secretary` (`SEC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收小组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acceptance_team
-- ----------------------------
INSERT INTO `acceptance_team` VALUES (1, 1, 'XT');
INSERT INTO `acceptance_team` VALUES (56, 1, 'JT');
INSERT INTO `acceptance_team` VALUES (57, 3, 'JT');
INSERT INTO `acceptance_team` VALUES (61, 2, 'ZQ');
INSERT INTO `acceptance_team` VALUES (62, 1, 'ZQ');
INSERT INTO `acceptance_team` VALUES (63, 3, 'ZQ');
INSERT INTO `acceptance_team` VALUES (67, 101, 'KT');
INSERT INTO `acceptance_team` VALUES (68, 104, 'KT');
INSERT INTO `acceptance_team` VALUES (69, 1, 'KT');

-- ----------------------------
-- Table structure for achievement
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement`  (
  `ACHIEVEMENT_ID` int(0) NOT NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ACHIEVEMENT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '成果物' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `USER_ID` int(0) NOT NULL COMMENT '主键,用户id',
  `ADMIN_ID` int(0) NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `ADMIN_ID`(`ADMIN_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_3` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANN_ID` int(0) NOT NULL AUTO_INCREMENT,
  `ANN_TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_BY` int(0) NULL DEFAULT NULL,
  `ANN_DETAIL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TYPE` int(0) NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SIGNATURE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ANN_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_20`(`CREATE_BY`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_20` FOREIGN KEY (`CREATE_BY`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('01afdfb03215496dbb9b0c101109ad55', 29, '关于第七届全国大学生工程训练综合能力竞赛校内第一轮评审的通知', 8, '<h1 class=\"ql-align-center\">关于第七届全国大学生工程训练综合能力竞赛校内第一轮评审的通知</h1><h6 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-10<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;2064</span></h6><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><br></p><p>各学院（部）、中心及有关单位：</p><p><br></p><p>	根据教育部印发《教育部评审评比评估和竞赛管理暂行办法》《教育部评审评估和竞赛清单》的通知精神，全国大学生工程训练综合能力大赛是纳入教育部评审评估和竞赛清单的三大赛事之一，对于推动人才培养和开展学科评估具有重要的作用，本届大赛由教育部高等教育司主办，教育部高等学校工程训练教学指导委员会举办。</p><p>	为深入推进工程教育改革，全面提升大学生工程创新综合能力水平，第七届全国大学生工程训练综合能力竞赛陕西省省赛初步定于4月底举行。根据近期对各项目团队的情况摸底与各项组织筹备工作的安排，学校拟定于4月中旬举办校赛，并将于近期开展2-3轮校内评审工作，力求保证参赛项目质量与进度，同时评审结果也将作为遴选推荐省赛的重要依据。现将校内第一轮评审有关事项通知如下：</p><p>	</p><p>	一、评审答辩要求</p><p>	本轮评审主要结合各项目团队的《项目设计报告》（模板见附件1）和项目进展PPT汇报进行评分，各团队需认真完成《项目设计报告》的填写，于3月16日之前连同项目进展PPT以指定方式提交。</p><p>	（一）项目设计报告要求</p><p>	《项目设计报告》需按照“第X组-XXX赛道-XXX赛项-项目设计报告-XXX（组长姓名）”的规则命名，各项填报内容不得留空。</p><p>	（二）答辩PPT要求</p><p>	项目进展PPT需要包括但不仅限于以下内容：</p><p>	1、项目方案</p><p>	明确列出项目设计的构想与出发点，实物组需包含机械结构与控制部分的设计思路与方案。</p><p>	2、目前工作进展</p><p>	清晰说明已实现和尚未实现的内容，以及预计完成项目的时间点。</p><p>	3、创新点与优势</p><p>	项目设计与实施中的创新思路与做法，以及作品体现出的技术、模式上的创新性、先进性及竞争优势。</p><p>	4、存在的问题</p><p>	项目目前存在的问题与分析，以及改进思路与措施。</p><p>	5、下一步工作计划</p><p>	后续备赛阶段拟定开展改进或者优化项目的举措，需列明时间安排。</p><p>	6、经费预算</p><p>	列明前期已产生的设备、耗材等相关费用，以及后续工作计划中的经费预算。</p><p>	（三）其他要求</p><p>	答辩时，如有实物允许带入答辩教室现场进行演示，如无实物或实物不便携带的应以视频的形式进行展示。</p><p>	</p><p>	二、评审答辩时间安排</p><p>	本次评审答辩定于3月17日（星期三）下午14:00-18:00进行，每组PPT汇报（含视频或者实物展示）7分钟，现场提问1分钟。</p><p>	</p><p>	材料提交方式、答辩分组及具体答辩时间表另行通知。</p><p class=\"ql-align-right\"><br></p><p class=\"ql-align-right\">实践教学中心</p><p class=\"ql-align-right\">机械工程学院</p><p class=\"ql-align-right\">2021年3月10日</p><p><br></p>', 2, 'YFB', '实践教学中心', '2021-03-17 00:00:00');
INSERT INTO `announcement` VALUES ('e7214455e39b4e869b3f31fb3dad5fea', 30, '2021年秋季日本爱媛大学交换生项目选拔通知', 8, '<h3 class=\"ql-align-center\"><span class=\"ql-size-large\">2021年秋季日本爱媛大学交换生项目选拔通知</span></h3><h4 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-16<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;411</span></h4><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年秋季日本爱媛大学交换生项目选拔通知</strong></p><p>	据我校与日本爱媛大学签订的校际学生交换协议，现将2021年秋季赴日参加爱媛大学交换生项目选拔事项通知如下，请各相关部门、学院按通知要求严肃认真做好选拔工作。</p><p>	<strong>校内报名截止时间：</strong>2021年3月21日</p><p>	<strong>项目时间：</strong>1学期或1年，2021秋季学期入学。</p><p>	<strong>项目介绍：</strong></p><p>	爱媛大学（Ehime University），位于爱媛县的日本国立大学。通称“爱大”或者媛大。〔因为有人将爱知大学称为“爱大”〕城北校区（法文学部、教育学部、工学部、理学部）紧靠松山大学。1949年 旧制松山高等学校、爱媛师范学校、爱媛青年师范学校、新居浜工业专门学校合并成爱媛大学，设立文理学部、教育学部、工学部。1954年 爱媛县立松山农科大学移交国有，设立农学部。1968年改组文理学部，设立法文学部、理学部。1973年设立医学部。2004年设立法科大学院。根据国立大学法人法，改为国立大学法人。</p><p>	交换生在日本爱媛大学对应学部参加交换学习，期间所获学分原则上返校后予以转换。</p><p>	<strong>选拔名额：</strong>2名</p><p>	<strong>选拔要求：</strong></p><p>	1、品学兼优，有赴日交换意向的我校外国语学院日语系研究生，非毕业班本科生。</p><p>	优先录取顺序为：研究生、大二、大一本科生。</p><p>	2、日语能力优秀。通过日本语能力测试（JLPT）N2并获得证书，或具有等同水平。</p><p>	注：满足以上所列所有要求者方可报名。有挂科、违纪受过处分者不予报名。</p><p>	<strong>选拔流程及时间节点：</strong></p><p>	1、2021年3月21日有意向的学生在西安交通大学外事工作服务系统-学生海外留学项目申报处（http://ims.xjtu.edu.cn/default.aspx）报名。</p><p>	2、2021年3月22日书院通过外事服务系统对报名人选进行审核。</p><p>	3、2021年3月22日学院通过外事服务系统按要求完成初选推荐。</p><p>	4、2021年3月23日教务处通过外事服务系统对初选推荐名单进行审核。</p><p>	5、2021年3月23日国际处终审确定最终校级推荐人选。</p><p>	<strong>费用情况：</strong></p><p>	对方免学费、注册费，我校学费正常缴纳。住宿费、生活费、往返旅费、保险费等个人承担。</p><p>	<strong>项目咨询：</strong></p><p>	本科生项目报名、学籍、学分转化认定：学院教务、教务处魏老师</p><p>	办公地点：主E1303室联系电话：029-82665477</p><p>	E-mail:xawei@xjtu.edu.cn</p><p>	研究生目报名、学籍、学分转化认定：学院教务、研究生院贺老师</p><p>	办公地点：主E1310室联系电话：029-82668580</p><p>	E-mail:tianyuanhe@xjtu.edu.cn</p><p>	项目内容：国际处徐阳老师</p><p>	办公地点：科学馆111室 联系电话：029-82668236</p><p>	E-mail:xuyang520@xjtu.edu.cn</p><p>	<strong>离校手续：</strong></p><p>	1、离校前填写《西安交通大学学生境外学习承诺书》。</p><p>	2、根据西安交通大学要求办理出访审批手续，出访审批手续办理请登录外事工作服务系统-学生因公出国（境）事务。</p><p>	3、参照《本科生赴境内外学习管理办法》（教务处主页“规章制度”栏查看）办理修读计划（与学院协商制定）、保留学籍、离校等手续。</p><p>	<strong>温馨提示：</strong></p><p>	项目申请流程较为紧凑，请有意申请者尽快备好以下材料以确保顺利参加项目：1）有效护照、2）语言能力证书或相关官方证明、3）中英文成绩单、在读证明等。以上材料请务必提前备好。其余材料国际处将组织申请指导（入选者将得到电话通知）特别说明。</p><p>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p class=\"ql-align-right\">2021年3月16日</p><p><br></p>', 1, 'YFB', ' 教务处', '2021-03-17 12:22:47');
INSERT INTO `announcement` VALUES ('bc1b25d792d24794bb23d69ea84d92bf', 31, '关于转发《教育部办公厅关于推荐新文科研究与改革实践项目的通知》《陕西省教育厅办公室关于做好新文科研究与改革实践项目申报工作的通知》的通知', 8, '<h3 class=\"ql-align-center\"><span class=\"ql-size-large\">关于转发《教育部办公厅关于推荐新文科研究与改革实践项目的通知》《陕西省教育厅办公室关于做好新文科研究与改革实践项目申报工作的通知》的通知</span></h3><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-12<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;728</span></h3><p><br></p><p>各学院（部、中心）及有关单位：</p><p>	现将《教育部办公厅关于推荐新文科研究与改革实践项目的通知》（教高厅函〔2021〕10号）（附件1）《陕西省教育厅办公室关于做好新文科研究与改革实践项目申报工作的通知》文件（附件2）转发给你们。</p><p>	一、申报要求</p><p class=\"ql-align-justify\">	本次遴选的项目为<strong>教育部</strong>及<strong>陕西省</strong>教育厅立项的新文科研究与改革实践项目。</p><p class=\"ql-align-justify\">	根据文件要求，请各单位认真研究《新文科研究与改革实践项目指南》（附件3），坚持问题导向、打通学科界别、突出自身特色、创新改革思路，结合已有工作基础和具体情况，按照选题要求确定申报项目内容。</p><p>	二、申报途径</p><p class=\"ql-align-justify\">	1.请各学院认真组织动员教师积极申报。我校向教育部及陕西省推荐限额各5项，学校每个教学单位限报2项。</p><p class=\"ql-align-justify\">	2.教育部《通知》指出“各教学指导委员会、中国高等教育学会应发挥统筹协调作用，各教学指导委员会可择优推荐不超过2项，中国高等教育学会可推荐不超过10项”。</p><p class=\"ql-align-justify\">	</p><p class=\"ql-align-justify\">	陕西省《通知》指出“陕西省高等学校教学指导委员会，陕西高等教育学会应发挥统筹协调作用，可分别择优遴选推荐不超过5项”。</p><p class=\"ql-align-justify\">	请各教学单位，特别是担任教指委主任和副主任单位的学院，充分利用教育部、陕西省教指委和协（学）会推荐资格积极申报。</p><p class=\"ql-align-justify\">	3.已向教务处提交的<strong>教育部</strong>新文科研究与改革实践项目，若未获得推荐机会，将自动进入本次省级新文科研究与改革实践项目候选队列，参与遴选。</p><p>	三、材料报送</p><p class=\"ql-align-justify\">	请申报单位认真填写《新文科研究与改革实践项目推荐表》（附件4），经教学院长审核签字盖章后于3月23日前统一上报至教务处通识科（主楼E座1303），电子版发送至bhzhang19@xjtu.edu.cn。</p><p>	联系人：张博华&nbsp;&nbsp;联系电话：82668311</p><p>	</p><p>	附件：1.《教育部办公厅关于推荐新文科研究与改革实践项目的通知》</p><p>	&nbsp;&nbsp;&nbsp;2.《陕西省教育厅办公室关于推荐新文科研究与改革实践项目的通知》</p><p>		&nbsp;&nbsp;&nbsp;3.	《	新文科研究与改革实践项目指南	》</p><p>		&nbsp;&nbsp;&nbsp;4.	《	新文科研究与实践项推荐表	》</p><p>	</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年3月16日</p>', 3, 'YSC', ' 教务处', '2021-03-17 12:25:00');
INSERT INTO `announcement` VALUES ('e4346180007a46bf8e3522bf0cc140b8', 32, '关于开展2021西安交通大学美国大学生数学建模竞赛（MCM/ICM）相关工作的通知', 10, '<h1 class=\"ql-align-center\">关于开展2021西安交通大学美国大学生数学建模竞赛（MCM/ICM）相关工作的通知</h1><h2 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2020-12-16<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;5578</span></h2><p><span style=\"color: black;\">各学院（部）、中心及有关单位：</span></p><p><span style=\"color: black;\">&nbsp;&nbsp;美国大学生数学建模竞赛(MCM/ICM)由美国数学及其应用联合会主办，是唯一的国际性数学建模竞赛，也是世界范围内最具影响力的数学建模竞赛，对于推动人才培养和提高学生实践创新能力具有重要意义。现决定组织开展2021西安交通大学美国大学生数学建模竞赛（MCM/ICM）相关工作。</span></p><p>	<span style=\"color: black;\">本届大赛由实践教学中心统筹组织安排，数学与统计学院具体负责组织实施，设立美赛建模竞赛工作小组和教练组，负责活动的报名、培训等相关工作。</span></p><p>	<span style=\"color: black;\">现将参赛有关事项通知如下：</span></p><p><strong style=\"color: black;\">一、报名：</strong></p><p>	<span style=\"color: black;\">1.&nbsp;每3人一队（指明队长），</span>参赛队员应有数学建模培训或参赛经历,&nbsp;并具备完成英文科技论文的写作能力;</p><p>	<span style=\"color: black;\">2.&nbsp;报名时间：12月16日至12月23日</span></p><p>	<span style=\"color: black;\">3.&nbsp;报名办法：https://www.wjx.top/jq/99771759.aspx 或手机扫描下方报名。</span></p><p class=\"ql-align-center\"><img src=\"http://dean.xjtu.edu.cn/__local/6/38/29/D2B83439520976A4453CA9B7025_8EA6D239_345B.jpg\" width=\"173\"></p><p><strong style=\"color: black;\">二、活动咨询：</strong></p><p><span style=\"color: black;\">&nbsp;&nbsp;报名完成后，请队长加入2021美赛QQ群：849428917。教练组将对大家的具体问题进行解答。同时，有关数学建模竞赛活动的所有通知包括赛题都将在QQ群发布。</span></p><p><strong style=\"color: black;\">三、缴费</strong></p><p>	本届大赛报名费为每队100美金，参赛队需先自行支付。获M奖及以上奖项队伍可凭获奖证书至教练组负责人处登记、报销。</p><p><strong style=\"color: black;\">四、其他</strong></p><p>	其他未尽事宜由<span style=\"color: black;\">竞赛工作组负责解释。</span></p><p><br></p><p><br></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-right\">数学与统计学院</p><p class=\"ql-align-right\">实践教学中心</p><p class=\"ql-align-right\">2020年12月16日</p><p><br></p>', 1, 'WFB', '数学与统计学院', '2021-03-21 18:56:18');
INSERT INTO `announcement` VALUES ('b43bd7d2478447caa2c077c0b5f76d39', 33, '关于征集西安交通大学优秀通识课程论文及教学成果展示作品的通知', 19, '<h1 class=\"ql-align-center\">关于征集西安交通大学优秀通识课程论文及教学成果展示作品的通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-08<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;2494</span></h3><p>	为促进我校通识教育教学改革与发展，激发同学的学习热情，积累通识课程教学经验，丰富通识教育教学成果，教务处将组织优秀通识课程论文及教学成果展示作品征集活动。</p><p class=\"ql-align-justify\"><strong>一、&nbsp;征集范围</strong></p><p>	1、通识课程的课程论文，或者是基于通识课程的作业、读书笔记、调查报告、实践报告等修改而成的论文。</p><p>	2、通识课程的教学成果（实验实践成果、艺术创作成果、表演视频等）。</p><p>	3、以“通识教育与大学生成长”为主题，自定形式和标题，展现对通识教育的认识，或者通识教育对自己的影响。</p><p class=\"ql-align-justify\"><strong>二、&nbsp;征集要求</strong></p><p>	1、论文要求：篇幅2000-3000字，符合学术规范，具有原创性。包括论文题目、个人信息（学院 班级 学生姓名 指导教师:姓名）、正文、参考文献四个部分。A4页面；字体：宋体；字号：小四；字符间距：标准；行距：20磅。</p><p>	2、教学成果要求：实物作品、照片、视频等。实物作品1-3件；清晰照片不少于3张（像素不低于300dpi）；视频资料不超过15分钟的样片（mpeg等压缩视频格式），同时附作品简要介绍。</p><p>	3、内容应体现我校通识课程的人才培养目标要求，展现科学精神、人文素养、全球视野、创新思维和家国情怀与使命担等。</p><p><strong>三、&nbsp;提交方式</strong></p><p>	1、本次征集接受学生个人申请和任课教师推荐两种方式。除论文外，其他作品可以团队名义参加，团队人数不超过3人。</p><p>	2、请于2021年7月16日前，将作品电子版及参赛表格（见附件）发送至bhzhang19@xjtu.edu.cn，作品文件命名格式：论文/教学成果（2选1）+学院+班级+姓名+标题+指导教师：姓名。</p><p><strong>四、&nbsp;评选流程</strong></p><p>	教务处将组织专家对征集作品进行综合评选，评选通过后，作者根据专家意见进一步修改并提交最终版本，届时将另行通知。</p><p><strong>五、&nbsp;展示及奖励颁发</strong></p><p>	经评审遴选出的优秀作品将：</p><p>	1	、颁发证书及纪念品，优秀论文将汇编成文集出版。</p><p>	2	、在四大发明广场实地、新闻主页、微信公众号等以多种形式展览。</p><p>	3	、从中择优评选一、二、三等奖及优秀指导教师奖若干（一等奖奖金1000，二等奖奖金500，三等奖奖	金200元）</p><p><strong>六、&nbsp;联系方式及其他</strong></p><p>	联系人：张博华，联系电话：82668311</p><p>	主办方享有对所有参赛作品进行媒体宣传、出版发行、展览展示的权利。</p><p>	</p><p>	附件：西安交通大学通识课程优秀论文及教学成果展示作品参赛表格</p><p>	</p><p>	</p><p>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年3月4日</p>', 1, 'YFB', ' 教务处', '2021-03-22 09:17:42');
INSERT INTO `announcement` VALUES ('67bc21ba428140e3807a8254f27176e4', 34, '2021年秋季比利时布鲁塞尔管理大学交换生项目选拔通知', 19, '<h1 class=\"ql-align-center\">2021年秋季比利时布鲁塞尔管理大学交换生项目选拔通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-15<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;892</span></h3><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年秋季比利时布鲁塞尔管理大学交换生项目选拔通知</strong></p><p>	我校与比利时布鲁塞尔管理大学是校际友好学校，现据两校签订的学生交换协议将2021年秋季布鲁塞尔管理大学交换生项目选拔事项通知如下，请各相关部门、学院按通知要求支持配合，做好相关选拔工作。</p><p>	<strong>项目校内报名申请截止时间：</strong>2021年5月24日</p><p>	<strong>项目时间：</strong>秋季学期：2021年9月至1月</p><p>	春季学期：2022年2月至6月</p><p>	<strong>一、学校简介</strong></p><p>	布鲁塞尔管理学院（ICHEC），法语名称：Institut Catholique des Hautes Etudes Commerciales，是一所规模传统商业方向的公立大学，前身是比利时鲁汶大学管理学院，后独立成为比利时首屈一指的商学院，拥有52年的经验。布鲁塞尔管理学院位于比利时首都布鲁塞尔，布鲁塞尔是欧洲最美的城市，是欧洲的心脏，欧盟委员会和欧盟部长理事会位于布鲁塞尔，另一个重要机构欧洲议会在布鲁塞尔也有分处，所以它有欧洲首都的美誉。北大西洋公约组织的总部也在该市。ICHEC布鲁塞尔管理学校是一所私立天主教学院。主要提供商业和金融科学的培训和课程。在校教职员超过2500多人，大学开设有三年制的本科与一年到两年的硕士课程 集中在商业工程学和商业管理学上。ICHEC于2018年获得AACSB认证。</p><p>	学校总体英文授课情况请参考：</p><p>	https://www.ichec.be/sites/default/files/uploads/International/List%20courses%202020-2021_.pdf</p><p>	我校与布鲁塞尔管理大学大学举办互派交换生项目，期间所获学分返校后由所在学院进行认证。</p><p>	<strong>二、选拔名额</strong></p><p>	管理学院在读本科生3-6名，一学年交换生3名或一学期交换生6名。</p><p>	<strong>三、选拔要求及所需申请材料</strong></p><p>	1、品学兼优，有赴比利时交换意向的我校管理学院大一、大二本科生。</p><p>	2、学习成绩优秀，能够适应英文或法语授课环境。</p><p>	注：满足以上所列所有要求者方可报名。有不及格成绩、违纪受过处分者不予报名。</p><p>	<strong>四、选拔流程及时间节点</strong></p><p>	1、2021年5月24日前有意向且符合条件学生在西安交通大学外事服务平台<a href=\"http://org.xjtu.edu.cn/openplatform/login.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(30, 80, 162);\">http://org.xjtu.edu.cn/openplatform/login.html</a>完成报名；</p><p>	2、2021年5月26日前书院通过外事服务系统对报名人选进行审核；</p><p>	3、2021年5月27日前学院通过外事服务系统按要求完成初选审核；</p><p>	4、2021年5月28日前教务处通过外事服务系统按要求完成初选名单审核；</p><p>	5、2021年5月31日前国际处终审确定最终校级推荐人选，并召开项目说明会；</p><ol><li>	<strong>费用情况</strong></li><li>	对方免学费、我校学费正常缴纳。住宿费、生活费、往返旅费、保险等费用个人承担。</li><li>	<strong>六、项目咨询</strong></li><li>	报名咨询：学院教务员</li><li>	学分政策咨询：学院、校教务处联系电话：82665477</li><li>	项目咨询管理：国际处闫老师 办公地点：科学馆111室</li><li>	联系电话:029-82668236 E-mail:<a href=\"mailto:yanting@xjtu.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(30, 80, 162);\">yanting@xjtu.edu.cn</a></li><li>	咨询时间：周一至周五工作日，下午办公时间:14:00-18:00（冬令时）、14:30-18:30（夏令时），双休、法定节假日除外。非工作时间请邮件咨询。</li><li>	<strong>注：所有同学完成在线报名后，需扫描报名系统内提供二维码加入项目管理微信群，后续项目相关通知将通过微信群即时通报，所有项目候选人务必及时进群。</strong></li><li>	<strong>七、离校手续</strong></li><li>	1、离校前填写《西安交通大学学生境外学习承诺书》。</li><li>	2、根据西安交通大学要求办理出访审批手续，出访审批手续办理请登录国际处主页“因公出境-校内审批”栏查看。</li><li>	3、参照《本科生赴境内外学习管理办法》（教务处主页“规章制度”栏查看）办理修读计划（与学院协商制定）、保留学籍、离校等手续。</li><li>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</li><li class=\"ql-align-right\">2021年3月15日</li></ol><p><br></p>', 1, 'YFB', '教务处', '2021-03-22 09:19:50');
INSERT INTO `announcement` VALUES ('26dcfbbe07794a87956bfaea5a85db1b', 35, '2021年秋季韩国高丽大学交换生项目选拔通知', 19, '<h1 class=\"ql-align-center\">2021年秋季韩国高丽大学交换生项目选拔通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-19<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;666</span></h3><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年秋季韩国高丽大学交换生项目选拔通知</strong></p><p>	我校与韩国高丽大学是校际友好学校，现据两校签订的学生交换协议将2021年秋季高丽大学交换生项目选拔事项通知如下，请各相关部门、学院按通知要求支持配合，做好相关选拔工作。</p><p>	<strong>校内报名截止时间：</strong>2021年3月24日</p><p>	<strong>项目时间：</strong>一学期，2021年秋季学期（9月初至12月底）</p><p>	<strong>一、学校简介</strong></p><p>	高丽大学是韩国最大的私立综合性大学，位列世界大学200强。 其始建于1905年，历史悠久，规模庞大，是全韩国最著名的三所大学之一,与首尔大学、延世大学被称为韩国大学的一片天(SKY)。高丽大学下设12个学院，分别是法学院、商业管理学院、文学院、农学院、政治经济学院、理学院、工程学院、医学院、教育学院等，下属84个系。除研究生院外，还有承担广泛研究项目的6个专业研究所，它们是：商业管理研究所、教育研究所、食品与农业研究所、政策研究所、工业科学与技术研究所、社区发展研究所。</p><p>	<strong>二、选拔名额</strong></p><p>	在读本科生2名</p><p>	<strong>三、选拔要求及所需申请材料</strong></p><p>	1、年级：大一、大二本科生。原则上不限制专业（符合要求的意向报名者务必登录对方学校官网查看专业及课程设置，确保外方院校专业及课程设置与报名者所学专业相关。）</p><p>	2、学科成绩：成绩优秀，学分成绩80分以上。（韩国GPA 2.5 分以上，4.0标准）</p><p>	3、外语成绩：优秀的英语或韩语语言综合能力，具有雅思、托福考试成绩优先。</p><p>	4、专业要求：医学、药学、法律、教育、信息安全、设计等专业课程不可选。商学院、信息通讯、国际关系等专业课程选择竞争非常大。请申请者根据自己专业匹配度选择，并注意灵活选择。（具体要求及解释以对方高校为准，可选课程参见：</p><p>	https://sugang.korea.ac.kr/）</p><p>	5、申请材料：护照尺寸照片（3.5cm x 4.5cm）、护照信息页、学业成绩单（学生事务大厅开定并转换）、申请书、健康证明、学生协议。</p><p>	<strong>四、选拔流程及时间节点</strong></p><p>	1、2021年3月24日前有意向且符合条件学生在西安交通大学外事服务平台<a href=\"http://org.xjtu.edu.cn/openplatform/login.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(30, 80, 162);\">http://org.xjtu.edu.cn/openplatform/login.html</a>完成报名。</p><p>	2、2021年3月26日前书院通过外事服务系统对报名人选进行审核。</p><p>	3、2021年3月29日前学院通过外事服务系统按要求完成初选审核。</p><p>	4、2021年3月30日前教务处通过外事服务系统对初选推荐名单进行审核。</p><p>	5、2021年3月31日前国际处终审确定最终校级推荐人选，并召开项目说明会。</p><p>	<strong>五、费用情况</strong></p><p>	对方免学费、我校学费正常缴纳。住宿费、生活费、往返旅费、保险等费用个人承担。</p><p>	<strong>六、项目咨询</strong></p><p>	报名咨询：学院教务员</p><p>	学分政策咨询：学院、校教务处联系电话：82665477</p><p>	项目咨询管理：国际处闫老师 办公地点：科学馆111室</p><p>	联系电话:029-82668236 E-mail:<a href=\"mailto:yanting@xjtu.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(30, 80, 162);\">yanting@xjtu.edu.cn</a></p><p>	咨询时间：周一至周五工作日，<strong>下午办公时间:</strong>14:00-18:00（冬令时）、14:30-18:30（夏令时），双休、法定节假日除外。非工作时间请邮件咨询。</p><p>	<strong>※注意：所有同学完成在线报名后，需扫描报名系统内提供二维码加入项目管理微信群，后续项目相关通知将通过微信群即时通报，所有项目候选人务必及时进群。</strong></p><p>	<strong>七、离校手续</strong></p><p>	1、离校前填写《西安交通大学学生境外学习承诺书》；</p><p>	2、根据西安交通大学要求办理出访审批手续，出访审批手续办理请登录国际处主页“因公出境-校内审批”栏查看；</p><p>	3、参照《本科生赴境内外学习管理办法》（教务处主页“规章制度”栏查看）办理修读计划（与学院协商制定）、保留学籍、离校等手续。</p><p>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p class=\"ql-align-right\">2021年3月16日</p><p><br></p>', 1, 'YFB', '教务处', '2021-03-22 22:33:35');
INSERT INTO `announcement` VALUES ('5a9ee63976bd4003ac143642fa146a4d', 36, '关于组织申报2021年度西安交通大学国际学生教育教学改革研究专项的通知', 12, '<h1 class=\"ql-align-center\">关于组织申报2021年度西安交通大学国际学生教育教学改革研究专项的通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-03<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;1592</span></h3><p class=\"ql-align-justify\"><strong style=\"color: rgb(13, 13, 13);\">各学院及相关单位：</strong></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">为深入贯彻落实《学校招收和培养国际学生管理办法》（教育部、外交部、公安部令〔2017〕第42号）、《来华留学生高等教育质量规范（试行）》（教外〔2018〕50号）及《西安交通大学国际学生学历教育质量规范》（西交来华〔2021〕1号）等文件精神，提高国际学生教学水平与人才培养质量，培育优秀教育教学成果，经学校研究决定，“国际学生教育教学改革研究专项”参照校级教育教学改革项目进行管理，具体由国际教育学院负责。现面向全校教职员工开展2021年立项申报工作，有关事宜通知如下：</span></p><p class=\"ql-align-justify\">	<strong style=\"color: rgb(13, 13, 13);\">一、指导思想</strong></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">遵循学校“扎根西部、服务国家、世界一流”的办学定位和“体现中国特色、与国际接轨”的培养原则，调动教职工参与国际学生培养工作的主动性和创造性，着重解决当前国际学生教育教学改革和专业建设过程中存在的关键问题，切实提高我校国际学生培养质量和管理服务水平，助力学校“双一流”建设。</span></p><p class=\"ql-align-justify\">	<strong style=\"color: rgb(13, 13, 13);\">二、资助范围</strong></p><p class=\"ql-align-justify\">	<strong style=\"color: rgb(13, 13, 13);\">1.面向国际学生的教学研究</strong></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">（1）以提高教学质量为目的，探索新型有效的课堂教学模式和教学方法；</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">（2）以后疫情时代为背景，探索新型教学技术（如MOOC、翻转课堂、智慧课堂等）与国际学生教学深度融合的方式与途径；</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">（3）课程体系和教学内容的调整改革及相应的教材建设；</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">（4）国际学生教育师资队伍培养和激励的长效机制；</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">（5）国际学生的汉语教学模式、教学方法以及汉语教材建设。</span></p><p class=\"ql-align-justify\">	<strong style=\"color: rgb(13, 13, 13);\">2.面向国际学生的教育管理研究</strong></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">（1）新时代背景下，国际学生教育管理体制机制的改革创新；</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">（2）国际学生教育管理水平与服务质量；</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">（3）国际学生的国情教育与法治教育等；</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">（4）疫情背景下，面向国际学生的招生策略与方法。</span></p><p class=\"ql-align-justify\">	<strong style=\"color: rgb(13, 13, 13);\">3.&nbsp;其他国际学生教育教学中的热点、难点问题以及教师自选的高质量项目。</strong></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">以现存问题为导向、以提质增效为目标，鼓励开展与创新人才培养新模式/新机制、专业实践能力培养、国际学生教育教学管理有关的具有试点推广效应的综合类选题。</span></p><p class=\"ql-align-justify\">	<strong style=\"color: rgb(13, 13, 13);\">三、项目类型与资助经费</strong></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">1.项目分为重点项目与一般项目，重点项目资助经费为每项2万元，一般项目资助经费为每项1万元，研究年限为2年。</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">2.本次教改项目拟立项15项，重点项目不超过5项，一般项目10项左右。</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">3.项目经费由国际教育学院负责管理，并遵照学校有关经费管理规定使用。</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">4.鼓励项目负责人所在学院或部门对确定立项的项目应给予相应配套支持。</span></p><p class=\"ql-align-justify\">	<strong style=\"color: rgb(13, 13, 13);\">四、项目申请</strong></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">1.申请者认真填写《西安交通大学2021年度国际学生教育教学改革研究专项项目申报书》（附件1），打印纸质文档一式2份，并同时提交电子档，交所在单位审核。</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">2.学院或单位应对本单位申报项目进行全面审核，由教学院长或单位负责人在纸质项目申报书上签署意见、盖章后集中报送国际教育学院，并同时报送项目汇总表（附件2）。</span></p><p class=\"ql-align-justify\">	<strong style=\"color: rgb(13, 13, 13);\">五、项目管理</strong></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">1.国际教育学院负责项目发布、立项评审、资助额度确定、中期检查和成果验收等方面的管理工作。</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">2.项目一经批准立项，项目负责人是项目研究的第一责任人，全面负责该项目的实施。中期检查时项目负责人应提交中期进展报告和阶段性成果；项目完成后，应及时提交项目的总结报告和研究成果，成果经验收合格后予以结项。</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">3.每位申请人作为项目负责人最多申报1个项目。有前续国际学生教改项目未结项的，不得作为项目负责人申请本年度项目。</span></p><p class=\"ql-align-justify\">	<strong style=\"color: rgb(13, 13, 13);\">六、成果验收形式</strong></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">须提交项目研究总结报告1份；提供出版教材或教材样稿、发表论文、典型范例、学生意见反馈及心得报告等能够反映项目研究成果的支撑材料。国际教育学院将对项目研究结果组织专家验收。</span></p><p class=\"ql-align-justify\">	<strong style=\"color: rgb(13, 13, 13);\">七、时间安排</strong></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">2021年3月10日前，各学院或相关教学单位将审核签字盖章后的申请书与汇总表报送至国际教育学院（外文楼A座902），逾期一概不予受理。</span><a href=\"mailto:%E7%94%B5%E5%AD%90%E7%89%88%E8%AF%B7%E5%8F%91%E9%80%81%E8%87%B3dengtian@xjtu.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: black;\">电子版请发送至dengtian@xjtu.edu.cn</a>.&nbsp;<span style=\"color: rgb(13, 13, 13);\">联系人：邓甜，电话82668245。</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">学校将组织专家评审，确定最终立项研究项目。</span></p><p class=\"ql-align-justify\">	</p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">附件：1.2021年西安交通大学国际学生教育教学改革研究项目申请书</span></p><p class=\"ql-align-justify\">	<span style=\"color: rgb(13, 13, 13);\">&nbsp;&nbsp;&nbsp;2.2021年西安交通大学国际学生教育教学改革研究项目申报汇总表</span></p><p><br></p><p><br></p><p class=\"ql-align-justify\"><span style=\"color: rgb(13, 13, 13);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;国际教育学院</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(13, 13, 13);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</span></p><p class=\"ql-align-justify\"><span style=\"color: rgb(13, 13, 13);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年3月3日</span></p><p><br></p>', 1, 'YFB', '国际教育学院', '2021-03-23 09:40:36');
INSERT INTO `announcement` VALUES ('1b771cea2bf34804aa86ebb3c1f3399a', 37, '1', 12, '<ol><li><br></li></ol>', 2, 'WFB', '1', '2021-03-23 13:36:48');

-- ----------------------------
-- Table structure for applied_subject
-- ----------------------------
DROP TABLE IF EXISTS `applied_subject`;
CREATE TABLE `applied_subject`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `SUB_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_ID` int(0) NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `FEEDBACK` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `AUDIT_BY` int(0) NULL DEFAULT NULL,
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_11`(`STU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_12`(`SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of applied_subject
-- ----------------------------
INSERT INTO `applied_subject` VALUES (1, '1', 1, '2021-03-10 09:21:00', '略', '546546546', 'YTG', '你选个🔨', NULL, NULL);
INSERT INTO `applied_subject` VALUES (7, '1', 3, '2021-03-16 12:45:07', '<p>爱<span class=\"ql-size-huge\">哭鬼吧</span></p>', 'fa3619710878464fa866542e416b19ad', 'YTG', '你选个象拔蚌', NULL, NULL);
INSERT INTO `applied_subject` VALUES (8, '1', 1, '2021-03-17 01:13:03', '<p>请输入申请<span class=\"ql-size-huge\">原因测试</span></p>', '0e8d688091214738bc09564c2e3a6fc9', 'WTG', '老板说你今天左脚进门', NULL, NULL);
INSERT INTO `applied_subject` VALUES (9, '1', 7, '2021-03-17 12:27:57', '<p>请输入申请原因</p><p>2222</p>', '9a9f8ab2211a46eeb79201aaf16ce5d6', 'WTG', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (10, '2', 6, '2021-03-18 11:23:57', '👴申请不需要理由', NULL, 'YTG', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (11, '2', 4, '2021-03-20 10:13:38', '晋老师在学习', '56415614516312', 'YTG', '对方公司', NULL, NULL);
INSERT INTO `applied_subject` VALUES (12, '3', 5, '2021-03-31 13:40:00', '你是个好人', '22321123', 'YTG', '', NULL, NULL);
INSERT INTO `applied_subject` VALUES (13, '4', 7, '2021-03-21 13:40:43', '让爷过', '26564645', 'YTG', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (14, '5', 8, '2021-03-21 13:45:55', '阿巴阿巴阿巴', '54455465', 'YTG', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (15, '5', 2, '2021-03-21 13:45:55', '阿巴阿巴阿巴', '76563524', 'YTG', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (16, '1', 6, '2021-03-22 23:02:51', '<p>这是我的理由，谢谢</p><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年秋季韩国高丽大学交换生项目选拔通知</strong></p><p>	我校与韩国高丽大学是校际友好学校，现据两校签订的学生交换协议将2021年秋季高丽大学交换生项目选拔事项通知如下，请各相关部门、学院按通知要求支持配合，做好相关选拔工作。</p><p>	<strong>校内报名截止时间：</strong>2021年3月24日</p><p>	<strong>项目时间：</strong>一学期，2021年秋季学期（9月初至12月底）</p><p>	<strong>一、学校简介</strong></p><p>	高丽大学是韩国最大的私立综合性大学，位列世界大学200强。 其始建于1905年，历史悠久，规模庞大，是全韩国最著名的三所大学之一,与首尔大学、延世大学被称为韩国大学的一片天(SKY)。高丽大学下设12个学院，分别是法学院、商业管理学院、文学院、农学院、政治经济学院、理学院、工程学院、医学院、教育学院等，下属84个系。除研究生院外，还有承担广泛研究项目的6个专业研究所，它们是：商业管理研究所、教育研究所、食品与农业研究所、政策研究所、工业科学与技术研究所、社区发展研究所。</p>', '07ecfabaf30d4128b751d0a740ec1521', 'WSH', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (17, '3cac2a8ceec24a04b868923dd97b3e45', 51, '2021-03-23 17:05:30', '<p>请输入申请原因sdsdfsdf</p>', '4e3c9277ce864d2e87511cde6758364e', 'YTG', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (18, '2', 1, '2021-03-23 17:07:03', '请输入申请原因', '3308bc2c2b034bed9dc177955412d900', 'WTG', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (19, '1', 1, '2021-03-23 17:12:00', '请输入申请原因', 'afd43bb6c8f043febca74d29922f6d7b', 'WSH', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (20, '1', 1, '2021-03-23 17:12:34', '<p>请输入申请原因1111</p>', 'a8d0f78297844d44a96bcacae95eed63', 'WSH', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (21, '', 1, '2021-03-23 17:19:03', '<p><br></p><p>喜喜喜喜喜喜喜喜喜喜</p><p>（请输入申请原因）本人保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。</p>', '63dbd0a30b7b4ae08884b213cdbb40db', 'WSH', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (22, '0f05154aea9b46f1938a6c4e7d3687de', 1, '2021-03-23 17:57:00', '请输入申请原因', '988a06d074bd4699845f5cf943a0c2c6', 'WTG', NULL, NULL, NULL);
INSERT INTO `applied_subject` VALUES (23, '0f05154aea9b46f1938a6c4e7d3687de', 1, '2021-03-23 17:57:59', '请输入申请原因', '27858b6843ab4940a9339cbb12f5a6b0', 'WTG', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `CLASS_ID` int(0) NOT NULL,
  `CLASS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CLASS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `CLASSROOM_ID` int(0) NOT NULL,
  `CLASSROOM_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CLASSROOM_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `COLLEGE_ID` int(0) NOT NULL,
  `COLLEGE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`COLLEGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学院' ROW_FORMAT = Dynamic;

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
  `DICT_ID` int(0) NULL DEFAULT NULL,
  `DICT_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DICT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DICT_VALUE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `FILE_ID` int(0) NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SIZE` bigint(0) NULL DEFAULT NULL,
  `LOCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEL_FLAG` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  `UPLOAD_BY` int(0) NULL DEFAULT NULL,
  `UPLOAD_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_22`(`UPLOAD_BY`) USING BTREE,
  INDEX `DOC_ID`(`DOC_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_22` FOREIGN KEY (`UPLOAD_BY`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `file_storage` VALUES ('1', 46, '1913027_1831_20190225-215805.png', NULL, 593000, 'D:\\fileuploadtest', 0, 2, '2021-03-20 09:33:56');
INSERT INTO `file_storage` VALUES ('1', 47, '1913027_1840_20190225-215816.png', NULL, 383250, 'D:\\fileuploadtest', 0, 2, '2021-03-20 09:33:56');
INSERT INTO `file_storage` VALUES ('1', 48, '1913027_1838_20190225-215815.png', NULL, 579125, 'D:\\fileuploadtest', 0, 2, '2021-03-20 09:33:56');
INSERT INTO `file_storage` VALUES ('1', 49, '微信图片_20190311202902.jpg', NULL, 488505, 'D:\\fileuploadtest', 0, 2, '2021-03-20 09:38:37');
INSERT INTO `file_storage` VALUES ('1', 50, '1913027_1838_20190225-215815.png', NULL, 579125, 'D:\\fileuploadtest', 0, 2, '2021-03-20 09:51:10');
INSERT INTO `file_storage` VALUES ('1', 51, '1913027_1831_20190225-215805.png', NULL, 593000, 'D:\\fileuploadtest', 0, 2, '2021-03-20 09:51:10');
INSERT INTO `file_storage` VALUES ('9f772ce77c484c7ba5d80a11e12c7821', 52, '微信图片_20190311202902.jpg', NULL, 488505, 'D:\\fileuploadtest', 0, 12, '2021-03-20 09:51:56');
INSERT INTO `file_storage` VALUES ('9f772ce77c484c7ba5d80a11e12c7821', 53, '1913052_0439_20190225-223325.png', NULL, 532823, 'D:\\fileuploadtest', 0, 12, '2021-03-20 09:51:56');
INSERT INTO `file_storage` VALUES ('9f772ce77c484c7ba5d80a11e12c7821', 54, '1913052_0432_20190225-223316.png', NULL, 639348, 'D:\\fileuploadtest', 0, 12, '2021-03-20 09:51:56');
INSERT INTO `file_storage` VALUES ('60b7a0735cd243d58ee2441e7ad0bd8b', 55, '1913027_2151_20190225-220129.png', NULL, 419221, 'D:\\fileuploadtest', 0, 7, '2021-03-20 10:09:38');
INSERT INTO `file_storage` VALUES ('60b7a0735cd243d58ee2441e7ad0bd8b', 56, '1913052_0430_20190225-223332.png', NULL, 569998, 'D:\\fileuploadtest', 0, 7, '2021-03-20 10:09:38');
INSERT INTO `file_storage` VALUES ('1d51fa43d9cb44b0b2b5276a7247a099', 57, '微信图片_20180908111210.jpg', NULL, 5406844, 'D:\\fileuploadtest', 0, 7, '2021-03-20 10:15:07');
INSERT INTO `file_storage` VALUES ('1d51fa43d9cb44b0b2b5276a7247a099', 58, '微信图片_20180908111336.jpg', NULL, 4840880, 'D:\\fileuploadtest', 0, 7, '2021-03-20 10:15:07');
INSERT INTO `file_storage` VALUES ('1d51fa43d9cb44b0b2b5276a7247a099', 59, '微信图片_20180908111341.jpg', NULL, 8078403, 'D:\\fileuploadtest', 0, 7, '2021-03-20 10:15:07');
INSERT INTO `file_storage` VALUES ('2f4cbdd65043400e81610da653b0f24e', 60, '微信图片_20180908111210.jpg', NULL, 5406844, 'D:\\fileuploadtest', 0, 5, '2021-03-20 12:10:30');
INSERT INTO `file_storage` VALUES ('2f4cbdd65043400e81610da653b0f24e', 61, '微信图片_20180908111336.jpg', NULL, 4840880, 'D:\\fileuploadtest', 0, 5, '2021-03-20 12:10:30');
INSERT INTO `file_storage` VALUES ('2f4cbdd65043400e81610da653b0f24e', 62, '公告测试.txt', NULL, 4271, 'D:\\fileuploadtest', 0, 5, '2021-03-20 12:12:28');
INSERT INTO `file_storage` VALUES ('dfgsdfg', 63, '测试.txt', NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `file_storage` VALUES ('67bc21ba428140e3807a8254f27176e4', 64, '1_Basics_1.pdf', NULL, 1451012, 'D:\\fileuploadtest', 0, 19, '2021-03-22 09:22:47');
INSERT INTO `file_storage` VALUES ('67bc21ba428140e3807a8254f27176e4', 65, '1_Basics_2.pdf', NULL, 420188, 'D:\\fileuploadtest', 0, 19, '2021-03-22 09:22:47');
INSERT INTO `file_storage` VALUES ('26dcfbbe07794a87956bfaea5a85db1b', 66, '3_DQN_1.pdf', NULL, 398254, 'D:\\fileuploadtest', 0, 19, '2021-03-22 22:33:48');
INSERT INTO `file_storage` VALUES ('26dcfbbe07794a87956bfaea5a85db1b', 67, '3_DQN_3.pdf', NULL, 382571, 'D:\\fileuploadtest', 0, 19, '2021-03-22 22:33:48');
INSERT INTO `file_storage` VALUES ('26dcfbbe07794a87956bfaea5a85db1b', 68, '3_DQN_2.pdf', NULL, 376545, 'D:\\fileuploadtest', 0, 19, '2021-03-22 22:33:48');
INSERT INTO `file_storage` VALUES ('b44964d41380476aaf62419d988027e7', 69, '2_TD_1.pdf', NULL, 312356, 'D:\\fileuploadtest', 0, 19, '2021-03-22 22:40:34');
INSERT INTO `file_storage` VALUES ('b44964d41380476aaf62419d988027e7', 70, '2_TD_3.pdf', NULL, 84699, 'D:\\fileuploadtest', 0, 19, '2021-03-22 22:40:34');
INSERT INTO `file_storage` VALUES ('b44964d41380476aaf62419d988027e7', 71, '2_TD_2.pdf', NULL, 288071, 'D:\\fileuploadtest', 0, 19, '2021-03-22 22:40:34');
INSERT INTO `file_storage` VALUES ('f2d5b403ee744d0b857c22c3b7a0f4e0', 72, '6_Continuous_1.pdf', NULL, 229330, 'D:\\fileuploadtest', 0, 12, '2021-03-22 22:41:48');
INSERT INTO `file_storage` VALUES ('f2d5b403ee744d0b857c22c3b7a0f4e0', 73, '6_Continuous_3.pdf', NULL, 253487, 'D:\\fileuploadtest', 0, 12, '2021-03-22 22:41:48');
INSERT INTO `file_storage` VALUES ('f2d5b403ee744d0b857c22c3b7a0f4e0', 74, '6_Continuous_2.pdf', NULL, 198082, 'D:\\fileuploadtest', 0, 12, '2021-03-22 22:41:48');
INSERT INTO `file_storage` VALUES ('9a4e78e1617646faa55d9c0271acf0d5', 75, '1_Basics_4.pdf', NULL, 494385, 'D:\\fileuploadtest', 0, 12, '2021-03-22 22:43:02');
INSERT INTO `file_storage` VALUES ('9a4e78e1617646faa55d9c0271acf0d5', 76, '1_Basics_5.pdf', NULL, 2176196, 'D:\\fileuploadtest', 0, 12, '2021-03-22 22:43:02');
INSERT INTO `file_storage` VALUES ('07ecfabaf30d4128b751d0a740ec1521', 77, '4_Policy_1.pdf', NULL, 193000, 'D:\\fileuploadtest', 0, 7, '2021-03-22 23:03:15');
INSERT INTO `file_storage` VALUES ('07ecfabaf30d4128b751d0a740ec1521', 78, '4_Policy_3.pdf', NULL, 403901, 'D:\\fileuploadtest', 0, 7, '2021-03-22 23:03:15');
INSERT INTO `file_storage` VALUES ('07ecfabaf30d4128b751d0a740ec1521', 79, '4_Policy_2.pdf', NULL, 355187, 'D:\\fileuploadtest', 0, 7, '2021-03-22 23:03:15');
INSERT INTO `file_storage` VALUES ('07ecfabaf30d4128b751d0a740ec1521', 80, '4_Policy_4.pdf', NULL, 273038, 'D:\\fileuploadtest', 0, 7, '2021-03-22 23:03:15');
INSERT INTO `file_storage` VALUES ('5a9ee63976bd4003ac143642fa146a4d', 81, '2_TD_1.pdf', NULL, 312356, 'D:\\fileuploadtest', 0, 12, '2021-03-23 09:40:47');
INSERT INTO `file_storage` VALUES ('5a9ee63976bd4003ac143642fa146a4d', 82, '2_TD_2.pdf', NULL, 288071, 'D:\\fileuploadtest', 0, 12, '2021-03-23 09:40:47');
INSERT INTO `file_storage` VALUES ('5a9ee63976bd4003ac143642fa146a4d', 83, '2_TD_3.pdf', NULL, 84699, 'D:\\fileuploadtest', 0, 12, '2021-03-23 09:40:47');
INSERT INTO `file_storage` VALUES ('ad4d728dcbdd47998d29e2289807ddb0', 84, '7_MARL_2.pdf', NULL, 411141, 'D:\\fileuploadtest', 0, 12, '2021-03-23 09:44:22');
INSERT INTO `file_storage` VALUES ('ad4d728dcbdd47998d29e2289807ddb0', 85, '7_MARL_1.pdf', NULL, 1520853, 'D:\\fileuploadtest', 0, 12, '2021-03-23 09:44:22');
INSERT INTO `file_storage` VALUES ('8a993e59df634680b41e559d79d942c9', 86, '4_Policy_2.pdf', NULL, 355187, 'D:\\fileuploadtest', 0, 12, '2021-03-23 09:44:57');
INSERT INTO `file_storage` VALUES ('8a993e59df634680b41e559d79d942c9', 87, '4_Policy_1.pdf', NULL, 193000, 'D:\\fileuploadtest', 0, 12, '2021-03-23 09:44:57');
INSERT INTO `file_storage` VALUES ('2abf076e5a8c4366aedbde0407acac06', 88, '7_MARL_2.pdf', NULL, 411141, 'D:\\fileuploadtest', 0, 12, '2021-03-23 10:15:35');
INSERT INTO `file_storage` VALUES ('2abf076e5a8c4366aedbde0407acac06', 89, '7_MARL_1.pdf', NULL, 1520853, 'D:\\fileuploadtest', 0, 12, '2021-03-23 10:15:35');
INSERT INTO `file_storage` VALUES ('19bf20afdab14ed0a57fe12f3ca3105a', 90, '3_DQN_1.pdf', NULL, 398254, 'D:\\fileuploadtest', 0, 12, '2021-03-23 10:21:32');
INSERT INTO `file_storage` VALUES ('19bf20afdab14ed0a57fe12f3ca3105a', 91, '3_DQN_2.pdf', NULL, 376545, 'D:\\fileuploadtest', 0, 12, '2021-03-23 10:21:32');
INSERT INTO `file_storage` VALUES ('2d0decc9850e44cd94c4d6f37a0c3210', 92, '3_DQN_3.pdf', NULL, 382571, 'D:\\fileuploadtest', 0, 12, '2021-03-23 12:32:15');
INSERT INTO `file_storage` VALUES ('2d0decc9850e44cd94c4d6f37a0c3210', 93, '3_DQN_1.pdf', NULL, 398254, 'D:\\fileuploadtest', 0, 12, '2021-03-23 12:32:15');
INSERT INTO `file_storage` VALUES ('2d0decc9850e44cd94c4d6f37a0c3210', 94, '3_DQN_2.pdf', NULL, 376545, 'D:\\fileuploadtest', 0, 12, '2021-03-23 12:32:15');
INSERT INTO `file_storage` VALUES ('615a81dcfbf842bba65e75d84af97447', 95, '4_Policy_1.pdf', NULL, 193000, 'D:\\fileuploadtest', 0, 12, '2021-03-23 12:36:32');
INSERT INTO `file_storage` VALUES ('615a81dcfbf842bba65e75d84af97447', 96, '4_Policy_2.pdf', NULL, 355187, 'D:\\fileuploadtest', 0, 12, '2021-03-23 12:36:32');
INSERT INTO `file_storage` VALUES ('615a81dcfbf842bba65e75d84af97447', 97, '4_Policy_3.pdf', NULL, 403901, 'D:\\fileuploadtest', 0, 12, '2021-03-23 12:36:32');
INSERT INTO `file_storage` VALUES ('615a81dcfbf842bba65e75d84af97447', 98, '4_Policy_4.pdf', NULL, 273038, 'D:\\fileuploadtest', 0, 12, '2021-03-23 12:36:32');
INSERT INTO `file_storage` VALUES ('1f38c6e2004a44c09d2861da31eea769', 99, '6_Continuous_2.pdf', NULL, 198082, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:11:40');
INSERT INTO `file_storage` VALUES ('1f38c6e2004a44c09d2861da31eea769', 100, '6_Continuous_1.pdf', NULL, 229330, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:11:40');
INSERT INTO `file_storage` VALUES ('1f38c6e2004a44c09d2861da31eea769', 101, '6_Continuous_3.pdf', NULL, 253487, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:11:40');
INSERT INTO `file_storage` VALUES ('cdea956762974df1ac47ac7fb8718cba', 102, '1_Basics_2.pdf', NULL, 420188, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:13:49');
INSERT INTO `file_storage` VALUES ('cdea956762974df1ac47ac7fb8718cba', 103, '1_Basics_4.pdf', NULL, 494385, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:13:49');
INSERT INTO `file_storage` VALUES ('cdea956762974df1ac47ac7fb8718cba', 104, '1_Basics_3.pdf', NULL, 440952, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:13:49');
INSERT INTO `file_storage` VALUES ('cdea956762974df1ac47ac7fb8718cba', 105, '1_Basics_1.pdf', NULL, 1451012, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:13:49');
INSERT INTO `file_storage` VALUES ('cdea956762974df1ac47ac7fb8718cba', 106, '1_Basics_5.pdf', NULL, 2176196, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:13:49');
INSERT INTO `file_storage` VALUES ('cdea956762974df1ac47ac7fb8718cba', 107, 'lecture2.pdf', NULL, 1847227, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:14:51');
INSERT INTO `file_storage` VALUES ('cdea956762974df1ac47ac7fb8718cba', 108, 'lecture4.pdf', NULL, 5407737, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:14:51');
INSERT INTO `file_storage` VALUES ('cdea956762974df1ac47ac7fb8718cba', 109, 'lecture3.pdf', NULL, 4785979, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:14:51');
INSERT INTO `file_storage` VALUES ('cdea956762974df1ac47ac7fb8718cba', 110, 'lecture1.pdf', NULL, 6951707, 'D:\\fileuploadtest', 0, 12, '2021-03-23 14:14:51');
INSERT INTO `file_storage` VALUES ('88b0d202b6ba46f988dbf253031439ba', 111, 'test2.txt', NULL, 26, 'D:\\fileuploadtest', 0, 2, '2021-03-23 16:57:56');
INSERT INTO `file_storage` VALUES ('null', 112, '新建文本文档.txt', NULL, 0, 'D:\\fileuploadtest', 0, 2, '2021-03-23 17:07:05');
INSERT INTO `file_storage` VALUES ('a8d0f78297844d44a96bcacae95eed63', 113, '02第一个vue程序.md', NULL, 9421, 'D:\\fileuploadtest', 0, 2, '2021-03-23 17:16:28');
INSERT INTO `file_storage` VALUES ('null', 114, 'jquery学习笔记精要.docx', NULL, 3859739, 'D:\\fileuploadtest', 0, 2, '2021-03-23 17:19:12');
INSERT INTO `file_storage` VALUES ('27858b6843ab4940a9339cbb12f5a6b0', 115, '10实战快速上手.md', NULL, 18868, 'D:\\fileuploadtest', 0, 2, '2021-03-23 17:58:18');
INSERT INTO `file_storage` VALUES ('27858b6843ab4940a9339cbb12f5a6b0', 116, '07第一个vue-cli项目.md', NULL, 3490, 'D:\\fileuploadtest', 0, 2, '2021-03-23 17:58:18');
INSERT INTO `file_storage` VALUES ('9769eeceeb2d483bb0c125ee21d35ed7', 117, '1595238643753.png', NULL, 34229, 'D:\\fileuploadtest', 0, 2, '2021-03-23 18:22:08');

-- ----------------------------
-- Table structure for handin
-- ----------------------------
DROP TABLE IF EXISTS `handin`;
CREATE TABLE `handin`  (
  `ID` int(0) NOT NULL,
  `HANDIN_ID` int(0) NULL DEFAULT 0 COMMENT '如果是0（默认），即是不需要handin这个过程的doc',
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RETRIES` int(0) NULL DEFAULT NULL,
  `TYPE` int(0) NULL DEFAULT NULL,
  `FEEDBACK` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `HANDIN_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `HANDIN_ID`(`HANDIN_ID`, `DOC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `LOGIN_TIME` datetime(0) NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `login_log` VALUES ('stu1', '2021-03-19 21:38:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-19 22:07:48', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-20 09:03:29', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 09:06:01', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 09:20:31', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-20 09:30:48', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 09:39:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-20 09:42:06', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-20 09:48:53', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu3', '2021-03-20 09:52:33', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu3', '2021-03-20 09:52:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-20 10:07:57', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-20 10:14:26', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-20 10:15:18', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-20 10:15:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-20 10:20:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 10:24:30', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 10:24:30', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-20 11:01:30', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-20 11:29:29', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 11:51:36', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-20 11:57:43', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-20 12:09:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-20 13:25:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-20 13:25:37', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-20 14:06:03', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 15:58:04', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 16:34:17', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 17:00:08', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-20 17:03:19', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-20 17:05:01', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 17:57:04', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 18:05:06', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-20 18:15:02', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 18:40:26', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-20 18:43:33', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 18:44:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-20 21:17:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-20 21:36:13', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-20 21:45:57', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-20 21:52:54', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-20 21:54:03', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 22:05:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-20 22:08:52', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 22:36:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-20 22:42:58', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-20 23:14:27', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-21 00:08:22', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-21 10:31:58', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-21 10:53:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-21 13:33:07', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('jialaoshi', '2021-03-21 13:39:57', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-21 13:42:37', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-21 18:09:41', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-21 18:50:12', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-21 18:50:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-21 20:14:54', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-21 21:41:01', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-21 21:50:48', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-22 09:02:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-22 09:10:26', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-22 09:32:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-22 09:58:12', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-22 10:09:58', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-22 11:32:00', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-22 12:14:59', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-22 12:28:33', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-22 13:32:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 14:23:01', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-22 14:31:29', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 14:32:31', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('jialaoshi', '2021-03-22 14:40:20', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 14:48:02', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 15:47:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 16:07:29', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-22 16:11:05', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-22 16:16:39', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 16:25:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 16:29:08', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 16:29:08', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian1', '2021-03-22 16:39:01', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 16:39:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-22 16:40:22', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 16:43:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 16:43:58', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian1', '2021-03-22 16:45:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-22 16:46:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 16:47:41', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian', '2021-03-22 17:31:58', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-22 18:00:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-22 20:01:05', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-22 20:14:01', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dabian2', '2021-03-22 20:20:36', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-22 21:20:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-22 22:30:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-22 22:39:34', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-22 22:44:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-22 22:45:17', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu2', '2021-03-22 22:45:47', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu3', '2021-03-22 22:46:04', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-22 23:04:05', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-22 23:13:04', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-22 23:14:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-22 23:19:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('xiaozhang', '2021-03-23 00:02:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 00:24:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 09:05:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 09:18:00', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 09:19:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 09:32:08', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 09:37:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 09:38:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 10:16:56', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 10:17:16', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 10:20:17', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 10:23:36', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 10:27:18', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 10:29:48', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 10:37:31', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 10:38:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 10:38:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 10:43:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 10:48:59', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 10:55:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 11:15:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 11:17:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 11:45:01', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 11:45:27', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 11:48:27', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 11:50:40', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 11:50:54', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 12:04:21', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 12:14:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 12:16:13', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 12:29:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 12:30:56', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 12:32:39', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 12:33:56', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 12:35:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 12:36:44', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 12:39:41', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 12:39:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 13:34:47', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 13:35:26', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 13:37:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 14:06:52', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 14:12:34', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 14:13:12', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 14:13:41', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 14:15:13', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 14:17:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 14:47:01', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu4', '2021-03-23 14:47:36', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 14:50:22', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 15:35:17', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('dogshit', '2021-03-23 15:46:52', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 15:48:03', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 16:06:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('jialaoshi', '2021-03-23 16:25:58', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-23 16:41:34', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 16:42:09', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('jialaoshi', '2021-03-23 16:50:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 16:57:26', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-23 16:58:00', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-23 17:00:21', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 17:11:38', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 17:37:02', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 17:38:59', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 17:58:41', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 17:59:52', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 18:02:07', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 18:05:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 18:07:02', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 18:10:27', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 18:15:03', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 18:18:05', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('laoshi', '2021-03-23 19:32:33', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-23 19:33:17', NULL, '127.0.0.1');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `MAJOR_ID` int(0) NOT NULL,
  `COLLEGE_ID` int(0) NULL DEFAULT NULL,
  `MAJOR_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`MAJOR_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_32`(`COLLEGE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_32` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '专业' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, 1, '软件工程');
INSERT INTO `major` VALUES (2, 3, '自动化');
INSERT INTO `major` VALUES (3, 2, '医电');
INSERT INTO `major` VALUES (4, 3, '计算机');
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
  `MENU_ID` int(0) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(0) NULL DEFAULT NULL,
  `MENU_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPONENT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ICON` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` tinyint(1) NULL DEFAULT NULL,
  `PERMS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_NUM` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_42`(`PERMS`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `FROM_ID` int(0) NULL DEFAULT NULL,
  `TO_ID` int(0) NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREAT_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`) USING BTREE,
  INDEX `FROM_ID`(`FROM_ID`) USING BTREE,
  INDEX `TO_ID`(`TO_ID`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`FROM_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`TO_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('266dead02f6740cdbdfb811d284576f7', 2, NULL, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p></p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 17:19:03');
INSERT INTO `message` VALUES ('4a10bb3815b24babb1a20022a9c5c77f', 201, 101, '选题结果通知', 'WCK', '<p><strong>学生您好：</strong></p><p></p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 17:49:51');
INSERT INTO `message` VALUES ('7f4faaa72f4442c5ae6d93c0d502c48f', 2, 11, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p></p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 17:12:01');
INSERT INTO `message` VALUES ('9115562001c54f759406dbb120647aba', 101, 201, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p></p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 17:05:30');
INSERT INTO `message` VALUES ('d09883c1fedf48a9ad69d4abe67f6424', 2, 12, '选题通知', 'YCK', '<p><strong>尊敬的老师：</strong></p><p></p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 17:57:01');
INSERT INTO `message` VALUES ('e14db3bf392b4c13a9f53200375d98d7', 201, 101, '选题结果通知', 'WCK', '<p><strong>学生您好：</strong></p><p></p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 17:48:01');
INSERT INTO `message` VALUES ('e84f70aa65a64b84b6b6bab1f1090175', 2, 11, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p></p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p></p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-23 17:12:34');

-- ----------------------------
-- Table structure for passed_subject
-- ----------------------------
DROP TABLE IF EXISTS `passed_subject`;
CREATE TABLE `passed_subject`  (
  `SUB_ID` int(0) NOT NULL,
  `CHOSEN` int(0) NULL DEFAULT 0,
  `CAPACITY` int(0) NULL DEFAULT 3,
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
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_GROUP_ID` int(0) NULL DEFAULT NULL,
  `ACCEPTANCE_TEAM_ID` int(0) NULL DEFAULT NULL,
  `CLASSROOM_ID` int(0) NULL DEFAULT NULL,
  `START_TIME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `END_TIME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_RELEASE` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_39`(`STU_GROUP_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_9`(`ACCEPTANCE_TEAM_ID`) USING BTREE,
  INDEX `plea_ibfk_1`(`CLASSROOM_ID`) USING BTREE,
  CONSTRAINT `plea_ibfk_1` FOREIGN KEY (`CLASSROOM_ID`) REFERENCES `classroom` (`CLASSROOM_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `plea_ibfk_2` FOREIGN KEY (`ACCEPTANCE_TEAM_ID`) REFERENCES `acceptance_team` (`TEAM_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plea
-- ----------------------------
INSERT INTO `plea` VALUES (1, 'XT', 1, 1, 3, '2020-07-30 13:20:18', '2020-07-31 13:20:18', 0);
INSERT INTO `plea` VALUES (17, 'JT', 1, 56, 1, '2021-03-01 00:00:00', '2021-03-01 00:00:00', 1);
INSERT INTO `plea` VALUES (18, 'JT', 2, 57, 2, '2021-03-03 00:00:00', '2021-03-03 00:00:00', 1);
INSERT INTO `plea` VALUES (22, 'ZQ', 4, 61, 1, '2021-03-01 00:00:00', '2021-03-01 00:00:00', 1);
INSERT INTO `plea` VALUES (23, 'ZQ', 5, 62, 2, '2021-03-02 00:00:00', '2021-03-02 00:00:00', 1);
INSERT INTO `plea` VALUES (24, 'ZQ', 6, 63, 3, '2021-03-02 00:00:00', '2021-03-02 00:00:00', 1);
INSERT INTO `plea` VALUES (25, 'KT', 6, 67, 1, '2021-03-01 00:00:00', '2021-03-02 00:00:00', 1);
INSERT INTO `plea` VALUES (26, 'KT', 7, 68, 2, '2021-03-01 00:00:00', '2021-03-01 00:00:00', 1);
INSERT INTO `plea` VALUES (27, 'KT', 8, 69, 3, '2021-03-03 00:00:00', '2021-03-03 00:00:00', 1);

-- ----------------------------
-- Table structure for plea_result
-- ----------------------------
DROP TABLE IF EXISTS `plea_result`;
CREATE TABLE `plea_result`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `STU_ID` int(0) NOT NULL,
  `PLEA_ID` int(0) NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCORE` int(0) NULL DEFAULT 0,
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
INSERT INTO `plea_result` VALUES (1, 3, NULL, 'KT', 80, '你去吃粑粑吧', 1);
INSERT INTO `plea_result` VALUES (2, 1, NULL, 'KT', 85, '🐎', 0);
INSERT INTO `plea_result` VALUES (3, 1, NULL, 'ZQ', 66, '我是老板儿子', 1);
INSERT INTO `plea_result` VALUES (4, 1, NULL, 'JT', 88, '老板是我爹', 1);
INSERT INTO `plea_result` VALUES (5, 2, NULL, 'KT', 89, '我是老板爹', NULL);
INSERT INTO `plea_result` VALUES (6, 4, 26, 'KT', 0, '', 1);

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `SUB_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RETRIES` int(0) NULL DEFAULT 0,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阶段（开题或中期）',
  `MEANING` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `RESULT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `PLAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `PROGRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于中期',
  `POST_PLAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于中期',
  `APPLY_REASON` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于结题',
  `POSE_BY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSE_TIME` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `AUDIT_BY` int(0) NULL DEFAULT NULL,
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `COMMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SCORE` int(0) NULL DEFAULT NULL,
  `IS_RELEASED` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES (1, '1', 0, '456456', 'KT', '没啥意义', '没啥结果', '没啥计划', '', '', NULL, '3', '2021-03-17 10:54:56', 'YTG', 3, '2021-03-18 11:39:59', '<p>12312313</p>', 90, 0);
INSERT INTO `report` VALUES (5, '1', 0, NULL, 'KT', '<p>研究上课摸鱼很有意义哦</p>', '<p>调研了很久发现很多晋姓同学喜欢上课摸鱼</p>', '<p>我计划上课观察晋同学</p>', NULL, NULL, NULL, '1', '2021-03-19 19:53:41', 'YTG', NULL, NULL, '5191911', 80, 0);
INSERT INTO `report` VALUES (6, '1', 0, NULL, 'ZQ', NULL, NULL, NULL, '阿爸', '阿妈', NULL, '3', '2021-03-31 12:20:43', 'WSH', 2, '2021-03-20 13:27:25', NULL, 999, 0);
INSERT INTO `report` VALUES (7, NULL, 0, NULL, 'ZQ', NULL, NULL, NULL, '几天没见', '这么拉了', NULL, '1', '2021-03-23 12:31:35', 'YTG', NULL, NULL, NULL, 98, 0);
INSERT INTO `report` VALUES (8, '1', 0, '692e22e1fa1241e6ad3dd837fb797a1a', 'KT', '<p>还可以</p>', '<p>可以</p>', '<p>有计划</p>', NULL, NULL, NULL, '1', '2021-03-23 10:24:53', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (9, '1', 0, '89596599502047789178eadea3e0ef69', 'KT', '<p>请问企鹅去</p>', '<p>123123123123123</p>', '<p>31231231231312</p>', NULL, NULL, NULL, '1', '2021-03-23 10:26:28', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (10, '2', 0, '5646564', 'KT', '测试', '测试', '测试', NULL, NULL, NULL, '4', '2021-03-23 11:19:35', 'WSH', 2, '2021-03-23 11:56:54', '<p>啊实打实大大飒飒大苏打实打实大苏打撒旦</p>', 81, 0);
INSERT INTO `report` VALUES (11, '', 0, 'd68a0a93634a4e93812ab3510c470234', 'ZQ', NULL, NULL, NULL, '<p>请问请问请问请问请问请问</p>', NULL, NULL, '1', '2021-03-23 11:39:19', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (12, '', 0, 'aece8a14dc2e412aabb256d2e892a5cc', 'ZQ', NULL, NULL, NULL, '<p>强强委屈恶气恶气委屈恶趣味请问请问请问</p>', '<p>我热热微软微软微软微软微软微软</p>', NULL, '1', '2021-03-23 11:41:57', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (13, '', 0, 'b2d5d1d86bc04e9da2e7e214f949bb04', 'ZQ', NULL, NULL, NULL, '<p>独立开发背景的防空飞弹赶快回来风格恢复</p>', '<p>；国会立法大规模欢乐饭米粒免费劳工很麻烦</p>', NULL, '1', '2021-03-23 16:16:06', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (14, '1', 0, '173c0ed150f94090b3d3f1a05f61a54c', 'ZQ', NULL, NULL, NULL, '<p>还是的故事梵蒂冈豆腐干豆腐干豆腐干大概</p>', '<p>工行返回鸡冠花鸡冠花鸡冠花鸡冠花鸡冠花</p>', NULL, '1', '2021-03-23 16:18:00', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (15, '1', 0, 'f96fa3eda518482e81226deb508e2fd8', 'KT', '<p>打发手动阀手动阀手动阀手动阀</p>', '<p>士大夫撒大苏打收到阀手动阀收到f</p>', '<p>士大夫收到士大夫士大夫士大夫s\'d</p>', NULL, NULL, NULL, '1', '2021-03-23 16:54:03', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (16, '1', 0, 'f785505e01374c4fba36d7d29f4ab6da', 'KT', '<p>打发手动阀手动阀手动阀手动阀</p>', '<p>士大夫撒大苏打收到阀手动阀收到f</p>', '<p>士大夫收到士大夫士大夫士大夫s\'d</p>', NULL, NULL, NULL, '1', '2021-03-23 16:54:37', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (17, '1', 0, '88b0d202b6ba46f988dbf253031439ba', 'KT', '<p>风格化风格化风格化风格化</p>', '<p>腐干和法规和腐干和法规和腐干和法国</p>', '<p>风格和风格和风格和风格和风格和风格和风格和</p>', NULL, NULL, NULL, '1', '2021-03-23 16:57:45', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (18, '1', 0, '9769eeceeb2d483bb0c125ee21d35ed7', 'KT', '<p>qwcwec</p>', '<p>xasqwc</p>', '<p>dsacasc</p>', NULL, NULL, NULL, '1', '2021-03-23 18:21:51', 'WSH', NULL, NULL, NULL, NULL, 0);
INSERT INTO `report` VALUES (22, '1', 0, 'bc9df55dd77b40eaa4616e4aa99096c7', 'JT', NULL, NULL, NULL, NULL, NULL, '（请输入申请原因）本人保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。', '1', '2021-03-23 19:30:42', 'WSH', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `ROLE_ID` int(0) NOT NULL,
  `ROLE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(0) NULL DEFAULT NULL,
  `STAGE_ID` int(0) NULL DEFAULT NULL,
  `PERMS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_43`(`ROLE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_44`(`PERMS`) USING BTREE,
  INDEX `STAGE_ID`(`STAGE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_43` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_stage_perms_ibfk_1` FOREIGN KEY (`PERMS`) REFERENCES `menu` (`PERMS`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 695 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置各阶段角色的权限' ROW_FORMAT = Dynamic;

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
  `STU_ID` int(0) NULL DEFAULT NULL,
  `START_DEFENSE_SCORE` int(0) NULL DEFAULT NULL,
  `START_REPORT_SCORE` int(0) NULL DEFAULT NULL COMMENT '答辩和成果（包括报告）',
  `MID_DEFENSE_SCORE` int(0) NULL DEFAULT NULL,
  `MID_REPORT_SCORE` int(0) NULL DEFAULT NULL,
  `END_DEFENSE_SCORE` int(0) NULL DEFAULT NULL,
  `END_REPORT_SCORE` int(0) NULL DEFAULT NULL COMMENT '即论文分',
  `PROCEDURE_SCORE` int(0) NULL DEFAULT NULL,
  `FINAL_SCORE` int(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for secretary
-- ----------------------------
DROP TABLE IF EXISTS `secretary`;
CREATE TABLE `secretary`  (
  `USER_ID` int(0) NOT NULL COMMENT '主键,用户id',
  `SEC_ID` int(0) NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `SEC_ID`(`SEC_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_5` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩秘书' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of secretary
-- ----------------------------
INSERT INTO `secretary` VALUES (14, 1);
INSERT INTO `secretary` VALUES (15, 2);
INSERT INTO `secretary` VALUES (16, 3);
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
  `TASK_ID` int(0) NOT NULL AUTO_INCREMENT,
  `SUB_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASK_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEACHER_ID` int(0) NULL DEFAULT NULL,
  `STU_ID` int(0) NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WTJ',
  `START_TIME` datetime(0) NULL DEFAULT NULL,
  `END_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TASK_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_16`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_17`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_16` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_17` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阶段任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stage_task
-- ----------------------------
INSERT INTO `stage_task` VALUES (1, '1', '帮老师遛狗', '不给你就退学吧', '879789879', 1, 1, 'KT', 'YTG', '2021-02-23 15:36:36', '2021-03-19 15:36:40');
INSERT INTO `stage_task` VALUES (2, 'ef3d55a7f0184c0688fe4d3cc13621e3', '帮老师吃饭', '123', NULL, NULL, 3, 'KT', 'WTJ', '2021-03-17 00:00:00', '2021-04-22 00:00:00');
INSERT INTO `stage_task` VALUES (3, '2', '准备学习材料', '你好', NULL, NULL, 3, 'KT', 'WTJ', '2021-03-04 00:00:00', '2021-03-04 00:00:00');
INSERT INTO `stage_task` VALUES (4, '2', '帮老师砍陈浩南', '谁扔的炮仗？', NULL, NULL, 3, 'ZQ', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (5, '2', '收山鸡当小弟', '给爷砍他', NULL, NULL, 3, 'ZQ', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (6, '2', '测试', '踩踩踩', '131df8ab8f2a4585ace190a7c6ff45e3', NULL, 3, 'KT', 'WTJ', '2021-03-03 00:00:00', '2021-03-03 00:00:00');
INSERT INTO `stage_task` VALUES (7, '2', '事实上', '事实上', 'd8d50354a5b24feab03d2902785c1784', NULL, 3, 'KT', 'WTJ', '2021-03-05 00:00:00', '2021-03-05 00:00:00');
INSERT INTO `stage_task` VALUES (8, '2', '任务2', '122121', '9b9be60af39c4613a2d5cbfade953831', NULL, 3, 'KT', 'WTJ', '2021-03-03 00:00:00', '2021-03-03 00:00:00');
INSERT INTO `stage_task` VALUES (9, '2', '任务3', '权威地位', '841f8b4f9c934e42870615b216163236', NULL, 3, 'KT', 'WTJ', '2021-03-02 00:00:00', '2021-03-03 00:00:00');
INSERT INTO `stage_task` VALUES (10, '1', '当校长', '没错👴是神', '879789880', 1, 1, 'KT', 'YTG', '2021-03-20 21:18:28', '2021-03-20 21:18:31');
INSERT INTO `stage_task` VALUES (14, '1', '把自己打一顿', '恰鸡腿', '64564564', 1, 1, 'KT', 'WTJ', '2021-03-10 21:18:14', '2021-03-20 21:18:17');
INSERT INTO `stage_task` VALUES (15, '1', '去菁蓉夜市', '卖冰纷', NULL, NULL, NULL, 'ZQ', 'WTJ', '2021-03-20 21:18:20', '2021-03-27 21:18:24');
INSERT INTO `stage_task` VALUES (19, '2', '帮老师上厕所', '13124214', '93ac3a04416a4345acb3669368447bca', NULL, 1, 'KT', 'WTJ', '2021-03-02 00:00:00', '2021-03-09 00:00:00');
INSERT INTO `stage_task` VALUES (20, '2', '帮老师刷碗', '刷不完别想毕业', '0affba27fa7e4d328c0b751ee66a5a06', NULL, 1, 'ZQ', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (21, '2', '帮老师带娃', '带到18岁就好', '2825cf31ae084a479ec5d00b34df893c', NULL, 1, 'ZQ', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (22, '2', '帮老师点外卖', '中份黄焖鸡不要辣', '76bc660dfd22442ca8df4db6479ffd95', NULL, 1, 'ZQ', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (23, '2', '帮老师倒垃圾', '垃圾分类 从我做起', 'c92fff0bcce04107a434f96a9f3df8ea', NULL, 1, 'KT', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (24, '2', '帮老师开电脑', '就这？', '6ed68a56be8a417c9d1f82aafa88db3e', NULL, 1, 'ZQ', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (25, '2', '任务1', '测试1', '9f772ce77c484c7ba5d80a11e12c7821', NULL, 6, 'KT', 'WTJ', '2021-03-01 00:00:00', '2021-03-01 00:00:00');
INSERT INTO `stage_task` VALUES (26, '2', '帮老师打扫卫生', '老师这栋楼就交给你了', '60b7a0735cd243d58ee2441e7ad0bd8b', NULL, 6, 'ZQ', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (27, '2', '任务一', '任务一描述', '1d51fa43d9cb44b0b2b5276a7247a099', 1, 4, 'KT', 'DSH', '2021-03-01 00:00:00', '2021-03-02 00:00:00');
INSERT INTO `stage_task` VALUES (28, '3', '帮老师通马桶', '水电费自理', '55113312321', NULL, 5, 'KT', 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (29, '4', '帮老师打麻将', '赢不了钱就别毕业了', '45641321332', NULL, 7, NULL, 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (30, '5', '帮老师买二次元桶', '啃得起那个', '64645655645', NULL, 8, NULL, 'WTJ', NULL, NULL);
INSERT INTO `stage_task` VALUES (31, '2', '任务1', '任务1描述', 'b44964d41380476aaf62419d988027e7', 2, 6, 'KT', 'DSH', '2021-03-01 00:00:00', '2021-03-03 00:00:00');

-- ----------------------------
-- Table structure for stage_task_result
-- ----------------------------
DROP TABLE IF EXISTS `stage_task_result`;
CREATE TABLE `stage_task_result`  (
  `TASK_ID` int(0) NULL DEFAULT NULL,
  `RETRIES` int(0) NULL DEFAULT 1,
  `SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'DSH',
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `SCORE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stage_task_result
-- ----------------------------
INSERT INTO `stage_task_result` VALUES (1, 1, '我是沙比', 'dfgsdfg', '🌶你去物管啊', 'YTG', '2021-03-19 14:34:12', '90');
INSERT INTO `stage_task_result` VALUES (1, 2, '我是日本人', '5445', '美好的一天', 'DSH', NULL, '0');
INSERT INTO `stage_task_result` VALUES (2, 1, '劳资复活🌶', '45453', '这就是你分手的接口', 'DSH', NULL, '90');
INSERT INTO `stage_task_result` VALUES (2, 2, 'test', '453453', '如果让你重新来过', 'DSH', NULL, '90');
INSERT INTO `stage_task_result` VALUES (2, 3, 'test', '12312', '你会不会爱我', 'DSH', NULL, '69');
INSERT INTO `stage_task_result` VALUES (10, 1, '👴不干了', '2321312', '爱情让人用友快乐', 'DSH', NULL, '85');
INSERT INTO `stage_task_result` VALUES (14, 1, '👴要退学', '12312312', '也会带来成魔', 'DSH', NULL, NULL);
INSERT INTO `stage_task_result` VALUES (15, 1, '阿巴阿巴阿爸', '3123', '曾经和你一起走过传说中的爱河', 'DSH', NULL, NULL);
INSERT INTO `stage_task_result` VALUES (27, 1, '我完成了', '132312', '姐就是女王', 'DSH', NULL, '999');
INSERT INTO `stage_task_result` VALUES (27, 2, '测试提交！', '2f4cbdd65043400e81610da653b0f24e', '✋靖🈷💩沙👃', 'DSH', NULL, NULL);
INSERT INTO `stage_task_result` VALUES (1, 3, '测试1', '5d210d8b99694ab4a2a6a06ca897ba40', NULL, 'DSH', NULL, NULL);
INSERT INTO `stage_task_result` VALUES (31, 1, '11111', '4b1f64254c7f4cadaf237221fb7a4363', NULL, 'DSH', NULL, NULL);
INSERT INTO `stage_task_result` VALUES (31, 1, '11111', 'f2d5b403ee744d0b857c22c3b7a0f4e0', NULL, 'DSH', NULL, NULL);
INSERT INTO `stage_task_result` VALUES (31, 3, '222', '9a4e78e1617646faa55d9c0271acf0d5', NULL, 'DSH', NULL, NULL);

-- ----------------------------
-- Table structure for stu_group
-- ----------------------------
DROP TABLE IF EXISTS `stu_group`;
CREATE TABLE `stu_group`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(0) NOT NULL,
  `STU_ID` int(0) NULL DEFAULT NULL,
  `STAGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_38`(`STU_ID`) USING BTREE,
  INDEX `GROUP_ID`(`GROUP_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_38` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生小组，分批进行答辩' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_group
-- ----------------------------
INSERT INTO `stu_group` VALUES (1, 1, 3, 'XT');
INSERT INTO `stu_group` VALUES (2, 1, 2, 'XT');
INSERT INTO `stu_group` VALUES (159, 1, 1, 'JT');
INSERT INTO `stu_group` VALUES (160, 2, 2, 'JT');
INSERT INTO `stu_group` VALUES (161, 1, 4, 'JT');
INSERT INTO `stu_group` VALUES (162, 2, 6, 'JT');
INSERT INTO `stu_group` VALUES (163, 1, 3, 'JT');
INSERT INTO `stu_group` VALUES (164, 2, 5, 'JT');
INSERT INTO `stu_group` VALUES (181, 4, 8, 'ZQ');
INSERT INTO `stu_group` VALUES (182, 5, 7, 'ZQ');
INSERT INTO `stu_group` VALUES (183, 6, 4, 'ZQ');
INSERT INTO `stu_group` VALUES (184, 4, 2, 'ZQ');
INSERT INTO `stu_group` VALUES (185, 5, 3, 'ZQ');
INSERT INTO `stu_group` VALUES (186, 6, 5, 'ZQ');
INSERT INTO `stu_group` VALUES (187, 4, 6, 'ZQ');
INSERT INTO `stu_group` VALUES (188, 5, 1, 'ZQ');
INSERT INTO `stu_group` VALUES (197, 6, 5, 'KT');
INSERT INTO `stu_group` VALUES (198, 7, 4, 'KT');
INSERT INTO `stu_group` VALUES (199, 8, 6, 'KT');
INSERT INTO `stu_group` VALUES (200, 6, 7, 'KT');
INSERT INTO `stu_group` VALUES (201, 7, 1, 'KT');
INSERT INTO `stu_group` VALUES (202, 8, 3, 'KT');
INSERT INTO `stu_group` VALUES (203, 6, 8, 'KT');
INSERT INTO `stu_group` VALUES (204, 7, 2, 'KT');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `USER_ID` int(0) NOT NULL COMMENT '主键,用户id',
  `STU_ID` int(0) NOT NULL,
  `COLLEGE_ID` int(0) NULL DEFAULT NULL,
  `MAJOR_ID` int(0) NULL DEFAULT NULL,
  `CLASS_ID` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `STU_ID`(`STU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_29`(`MAJOR_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_31`(`CLASS_ID`) USING BTREE,
  INDEX `COLLEGE_ID`(`COLLEGE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_29` FOREIGN KEY (`MAJOR_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_31` FOREIGN KEY (`CLASS_ID`) REFERENCES `class` (`CLASS_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生' ROW_FORMAT = Dynamic;

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
INSERT INTO `student` VALUES (20, 8, 2, 2, 6);
INSERT INTO `student` VALUES (101, 51, 101, 200, 3);
INSERT INTO `student` VALUES (102, 52, 102, 204, 2);
INSERT INTO `student` VALUES (103, 53, 103, 207, 3);
INSERT INTO `student` VALUES (104, 54, 104, 210, 1);
INSERT INTO `student` VALUES (105, 55, 105, 216, 4);
INSERT INTO `student` VALUES (106, 56, 106, 218, 8);
INSERT INTO `student` VALUES (107, 57, 107, 221, 5);
INSERT INTO `student` VALUES (108, 58, 108, 231, 1);
INSERT INTO `student` VALUES (109, 59, 123, 225, 1);
INSERT INTO `student` VALUES (110, 60, 101, 200, 4);
INSERT INTO `student` VALUES (111, 61, 102, 204, 5);
INSERT INTO `student` VALUES (112, 62, 103, 208, 3);
INSERT INTO `student` VALUES (113, 63, 104, 210, 6);
INSERT INTO `student` VALUES (114, 64, 105, 217, 2);
INSERT INTO `student` VALUES (115, 65, 106, 218, 7);
INSERT INTO `student` VALUES (116, 66, 107, 221, 2);
INSERT INTO `student` VALUES (117, 67, 108, 231, 1);
INSERT INTO `student` VALUES (118, 68, 123, 225, 2);
INSERT INTO `student` VALUES (119, 69, 104, 215, 5);
INSERT INTO `student` VALUES (120, 70, 105, 217, 3);

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUB_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SUB_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REQUIREMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CHOSEN` int(0) NULL DEFAULT 0,
  `CAPACITY` int(0) NULL DEFAULT 3,
  `ZONE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSE_BY` int(0) NULL DEFAULT NULL,
  `POSE_TIME` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `MAJOR_ID` int(0) NULL DEFAULT NULL,
  `AUDIT_BY` int(0) NULL DEFAULT NULL,
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_10`(`POSE_BY`) USING BTREE,
  INDEX `FK_RELATIONSHIP_28`(`MAJOR_ID`) USING BTREE,
  INDEX `SUB_ID`(`SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`POSE_BY`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_28` FOREIGN KEY (`MAJOR_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '456544465', '1', '上班摸鱼', '一般来说， 我认为， 歌德曾经说过，读一本好书，就如同和一个高尚的人在交谈。这句话把我们带到了一个新的维度去思考这个问题: 那么， 在这种困难的抉择下，本人思来想去，寝食难安。 经过上述讨论， 现在，解决上班摸鱼的问题，是非常非常重要的。 所以， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 而这些并不是完全重要，更加重要的问题是， 一般来讲，我们都必须务必慎重的考虑考虑。 上班摸鱼的发生，到底需要如何做到，不上班摸鱼的发生，又会如何产生。 王阳明曾经说过，故立志者，为学之心也；为学者，立志之事也。这句话语虽然很短, 但令我浮想联翩。', '有手就行', 0, 3, 'KXTS', 3, '2021-03-04 13:38:24', 'YTG', 1, NULL, NULL, 'asdvdsfvdsvdfv');
INSERT INTO `subject` VALUES (2, '124214234', '2', '上课开船', '一般来说， 我认为， 歌德曾经说过，读一本好书，就如同和一个高尚的人在交谈。这句话把我们带到了一个新的维度去思考这个问题: 那么， 在这种困难的抉择下，本人思来想去，寝食难安。 经过上述讨论， 现在，解决上班摸鱼的问题，是非常非常重要的。 所以， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 而这些并不是完全重要，更加重要的问题是， 一般来讲，我们都必须务必慎重的考虑考虑。 上班摸鱼的发生，到底需要如何做到，不上班摸鱼的发生，又会如何产生。 王阳明曾经说过，故立志者，为学之心也；为学者，立志之事也。这句话语虽然很短, 但令我浮想联翩。', '戴眼罩', 0, 3, 'KXTS', 2, '2021-03-21 12:30:17', 'YTG', 2, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (14, '464545654', 'ef3d55a7f0184c0688fe4d3cc13621e3', '我是啥币', '研究我自己', '名字笔画39画', 0, 3, 'KXTS', 2, '2021-03-15 20:27:39', 'WTG', 3, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (17, '456456546', '3', '它是啥币', '张老师⑧行', '张老师', 0, 3, 'KXTS', 1, '2021-03-21 12:30:15', 'YTG', 2, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (18, '454554655', '4', '她是啥币', '张老师⑦行', '张老师彳亍', 0, 3, 'KXTS', 4, '2021-03-28 12:42:38', 'YTG', 4, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (19, '565665552', '5', '他是啥币', '张老师⑥行', '鬼！', 0, 3, 'KXTS', 5, '2021-03-28 12:42:34', 'YTG', 1, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (23, NULL, '8e4e9710ef264c4590d7596fde3f31d5', '二七大小从', '船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v', '船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v船袜的爱我的我的期望VWED WD EQCWEXQ测温v', 0, 3, 'SMGH', 2, '2021-03-23 09:33:24', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (24, NULL, 'ace64868c133450a98130cafce780703', '', '', '', 0, 3, '', 2, '2021-03-23 09:37:33', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (25, NULL, '0466bd0bf8794703b91ec3170c617d7a', '', '', '', 0, 3, '', 2, '2021-03-23 09:38:59', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (26, NULL, 'ad4d728dcbdd47998d29e2289807ddb0', '1', '1', '1', 0, 3, 'KXTS', 2, '2021-03-23 09:44:05', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (27, NULL, '8a993e59df634680b41e559d79d942c9', '2', '2', '2', 0, 3, 'KXTS', 2, '2021-03-23 09:44:48', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (28, NULL, '1b5a6b97e4a14451b6ba56eeefb919ce', '1', '1', '1', 0, 3, 'KXTS', 2, '2021-03-23 09:48:14', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (29, NULL, '2abf076e5a8c4366aedbde0407acac06', '3', '3', '3', 0, 3, 'KXTS', 2, '2021-03-23 10:15:26', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (30, '19bf20afdab14ed0a57fe12f3ca3105a', '0f05154aea9b46f1938a6c4e7d3687de', '4', '4', '4', 0, 3, 'ZXZH', 2, '2021-03-23 10:21:00', 'YTG', NULL, 1, '2021-03-23 12:30:42', '测试审核');
INSERT INTO `subject` VALUES (31, '2d0decc9850e44cd94c4d6f37a0c3210', '8e814b39abea4c4c90d963a713a21ffc', '测试', '2', '2', 0, 3, 'SMGH', 2, '2021-03-23 12:32:07', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (32, '615a81dcfbf842bba65e75d84af97447', 'd6b296924a9644f7999831fc21a5df17', '科研课题', '科研课题的内容', '科研课题的要求', 0, 3, 'SMGH', 2, '2021-03-23 12:36:00', 'WTG', NULL, 1, '2021-03-23 12:39:41', '科研课题的审核意见');
INSERT INTO `subject` VALUES (33, 'e1373c9a8d3a48af9c0ac32937869876', 'adffa00c2c24491695e66add817d7626', 'kt', 'kt', 'kt', 0, 3, 'ZXZH', 2, '2021-03-23 13:35:55', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (34, 'ea664c91b32b4e40b4cf4a4655147c5e', '4c6e6f21c81a45e2898186961b48bf88', 'q', 'q', 'q', 0, 3, 'KXTS', 2, '2021-03-23 13:37:34', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (35, '7d0484436be24383b4c3ddda62d58e42', '49e97cf3277f4b85b01752a6f784107f', 'qq', 'qq', 'qq', 0, 3, 'KXTS', 2, '2021-03-23 14:05:22', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (36, '1f38c6e2004a44c09d2861da31eea769', 'c37e753cf86844519619cbd4545c60a6', 'w', 'w', 'w', 0, 3, 'KXTS', 2, '2021-03-23 14:07:12', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (37, 'cdea956762974df1ac47ac7fb8718cba', '079e182611a34b86827b7adc60bfe1f7', '5', '5', '5', 0, 3, 'KXTS', 2, '2021-03-23 14:13:31', 'WSH', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (38, 'b6bba728868743e88ff4542b1e8cf0b1', '3cac2a8ceec24a04b868923dd97b3e45', 'sdsfd', 'sdf', 'sdf', 1, 3, 'KXTS', 30, '2021-03-23 00:00:00', 'YTG', NULL, 51, '2021-03-23 17:14:23', 'gidsgjsfdgkjfdgdfg');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `ID` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作内容',
  `TIME` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `METHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作方法',
  `PARAMS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '方法参数',
  `IP` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  `RESPONSE_CODE` int(0) NULL DEFAULT NULL COMMENT '应答码',
  `RESPONSE_TEXT` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应答内容',
  `TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '0系统内部操作日志, 1系统外部请求日志',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_stage
-- ----------------------------
DROP TABLE IF EXISTS `system_stage`;
CREATE TABLE `system_stage`  (
  `IS_CURRENT` tinyint(1) NOT NULL,
  `STAGE_ID` int(0) NOT NULL,
  `STAGE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `START_TIME` datetime(0) NULL DEFAULT NULL,
  `END_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`STAGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统当前状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_stage
-- ----------------------------
INSERT INTO `system_stage` VALUES (0, 0, '课题申报', '在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 1, '课题申报审核', '在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。', '2021-03-11 00:00:00', '2021-03-11 00:00:00');
INSERT INTO `system_stage` VALUES (0, 2, '被驳回课题整改', '在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 3, '学生提交选题申请', '在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 4, '教师审核学生申请', '在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 5, '开题报告及材料提交', '在该阶段，学生可以在系统提交开题报告及与开题相关的材料。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 6, '开题答辩', '在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 7, '开题阶段收尾', '在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 8, '中期检查材料提交', '在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 9, '中期答辩', '在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (1, 10, '中期阶段收尾', '在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (1, 11, '结题材料提交', '在该阶段，学生提交毕业论文、最终成果物及结题报告。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 12, '结题收尾工作', '在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `USER_ID` int(0) NOT NULL COMMENT '主键,用户id',
  `TEACHER_ID` int(0) NOT NULL,
  `COLLEGE_ID` int(0) NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HOME_PAGE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TEACHER_ID`) USING BTREE,
  INDEX `TEACHER_ID`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_7`(`COLLEGE_ID`) USING BTREE,
  INDEX `USER_ID`(`USER_ID`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (10, 1, 1, '校长/ICU访问学者', 'https://baike.baidu.com/item/%E5%AE%8B%E6%B0%B8%E7%BA%A2/29205?fr=aladdin');
INSERT INTO `teacher` VALUES (12, 2, 3, '院长', 'http://gr.xjtu.edu.cn/web/xzdu');
INSERT INTO `teacher` VALUES (11, 3, 3, 'ICU访问学者', 'http://gr.xjtu.edu.cn/web/raoyuan');
INSERT INTO `teacher` VALUES (17, 4, 7, '教授', NULL);
INSERT INTO `teacher` VALUES (18, 5, 4, '副教授', NULL);
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
  `USER_ID` int(0) NOT NULL COMMENT '主键,用户id',
  `OFFICE_ID` int(0) NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `OFFICE_ID`(`OFFICE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_4` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教研室' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teaching_office
-- ----------------------------
INSERT INTO `teaching_office` VALUES (13, 1);
INSERT INTO `teaching_office` VALUES (401, 51);
INSERT INTO `teaching_office` VALUES (402, 52);

-- ----------------------------
-- Table structure for thesis
-- ----------------------------
DROP TABLE IF EXISTS `thesis`;
CREATE TABLE `thesis`  (
  `THESIS_ID` int(0) NOT NULL AUTO_INCREMENT,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_ID` int(0) NULL DEFAULT NULL,
  `POSE_TIME` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `SCORE` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`THESIS_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_21`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_21` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '论文' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thesis
-- ----------------------------
INSERT INTO `thesis` VALUES (1, '879789879', 1, '2021-03-28 21:52:51', 'YCF', 88);
INSERT INTO `thesis` VALUES (2, '646546465', 2, '2021-03-21 12:23:08', 'YCF', 99);
INSERT INTO `thesis` VALUES (3, '454545566', 3, '2021-03-10 12:24:37', 'YFZ', NULL);
INSERT INTO `thesis` VALUES (4, '512133122', 4, '2021-03-21 12:24:52', 'YFZ', NULL);
INSERT INTO `thesis` VALUES (5, '554645656', 5, '2021-03-21 12:25:04', 'YFZ', NULL);
INSERT INTO `thesis` VALUES (6, '645123222', 6, '2021-03-21 12:25:16', 'YFZ', NULL);
INSERT INTO `thesis` VALUES (7, '468944858', 7, '2021-03-21 12:25:31', 'YFZ', NULL);

-- ----------------------------
-- Table structure for thesis_teacher
-- ----------------------------
DROP TABLE IF EXISTS `thesis_teacher`;
CREATE TABLE `thesis_teacher`  (
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `TEACHER_ID` int(0) NULL DEFAULT NULL,
  `THESIS_ID` int(0) NULL DEFAULT NULL,
  `IS_RELEASE` tinyint(1) NULL DEFAULT 0,
  `SCORE` int(0) NULL DEFAULT -1,
  `TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `TEACHER_ID`(`TEACHER_ID`) USING BTREE,
  INDEX `THESIS_ID`(`THESIS_ID`) USING BTREE,
  CONSTRAINT `thesis_teacher_ibfk_1` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `thesis_teacher_ibfk_2` FOREIGN KEY (`THESIS_ID`) REFERENCES `thesis` (`THESIS_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thesis_teacher
-- ----------------------------
INSERT INTO `thesis_teacher` VALUES (113, 2, 2, 1, 62, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (114, 1, 2, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (115, 4, 2, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (116, 3, 5, 1, 68, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (117, 5, 5, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (118, 2, 5, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (119, 1, 7, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (120, 3, 7, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (121, 5, 7, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (122, 2, 1, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (123, 1, 1, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (124, 4, 1, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (125, 5, 3, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (126, 2, 3, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (127, 1, 3, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (128, 4, 4, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (129, 3, 4, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (130, 5, 4, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (131, 1, 6, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (132, 4, 6, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (133, 3, 6, 1, -1, '2021-03-22 15:58:54');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `USER_ID` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键,用户id',
  `REAL_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户真实姓名',
  `USERNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户登录账号',
  `PASSWORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `TEL` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `MAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别(F女M男)',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 403 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张狗蛋', 'mrbird', '94f860c4bbfeb2f49c84e321fdda4b07', '13455533233', 'mrbird12111111123@hotmail.com', 'M');
INSERT INTO `user` VALUES (2, '张静月', 'stu1', '98391446a5bd852b5773b061e27f69c4', '15134627380', 'scott@qq.com', 'M');
INSERT INTO `user` VALUES (3, '朱一丹', 'jack', '552649f10640385d0728a80a4242893e', '15896222223', 'jack@hotmail.com', 'M');
INSERT INTO `user` VALUES (4, '朱二丹', 'xiaoduan', 'dd3de68a6c00fed6168f8371233a6f7a', '13584556455', 'test@163.com', 'F');
INSERT INTO `user` VALUES (5, '朱三丹', 'stu4', '63b0990d522d58f569ff8691e66c8e54', '18811445654', 'sdfsdf@qq.com', 'F');
INSERT INTO `user` VALUES (6, '朱四丹', 'ddmtest14', '54b9e629dc5e6c8f13c076d397f0723c', '18856345234', '45116365@qq.com', 'F');
INSERT INTO `user` VALUES (7, '朱五丹', 'stu3', 'c736df18432a808ec54acff6be51c34d', '18811487981', 'test1@qq.com', 'F');
INSERT INTO `user` VALUES (8, '朱六丹', 'stu2', 'e7176eec59b1d0e411f101af2b71dac1', '18246544545', 'admin@admin.com', 'F');
INSERT INTO `user` VALUES (9, '朱七丹', 'test33333', '78b8011fa4d77888f331646926bf5a12', '18658273808', 'sdasdas@adas.com', 'F');
INSERT INTO `user` VALUES (10, '饶元', 'xiaozhang', '5c25bd899750dc00ba63a561c66a11a2', '18746511132', 'raoyuan@tea.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (11, '贾老师', 'jialaoshi', '4138d11bbf61ebc5d85b9cfb163ded5a', '18097275161', 'jialaoshi@qq.com', 'M');
INSERT INTO `user` VALUES (12, '老师', 'laoshi', '1d81aa6354f5e87dee512cbc7a0668d4', '13389974516', 'laoshi@qq.com', 'F');
INSERT INTO `user` VALUES (13, '系办', 'dogshit', '7640b31ef844c6dda2f3f7877c54e46e', '13389974516', 'dogshit@dogshit.com', 'M');
INSERT INTO `user` VALUES (14, '答辩秘书', 'dabian', 'b342b1743986407015468e3b65b98795', '13952764917', 'safs@sdaasdf.com', 'F');
INSERT INTO `user` VALUES (15, '答辩秘书1', 'dabian1', 'fb81233a20810c41925dbf4301e37d63', '13968738492', 'sadf@sdfsdfasfd.com', 'F');
INSERT INTO `user` VALUES (16, '答辩秘书2', 'dabian2', '4945ca484bc7f4756569f1b396aaedc8', '13368738492', 'dffdg@4545s6fd.com', 'M');
INSERT INTO `user` VALUES (17, '房峰辉', 'fangfenghui', '3a564cceb0eaddf81188b01ff8b1e86c', '15945746235', 'sdfsdf@sdfsidof.com', 'M');
INSERT INTO `user` VALUES (18, '中幅田', 'zhongfutian', 'fa0b132f5b41d29f7f3b51190c18bb0b', '17025331905', 'this@systemsuck.com', 'F');
INSERT INTO `user` VALUES (19, '管理员', 'admin', '3ee4a28b103216fa2d140d1979297910', '19963445154', '709046532@qq.com', 'F');
INSERT INTO `user` VALUES (20, '柬武朋', 'stu5', '90cdcd44d66e1e46decb2e50fbd29a1a', '12387516512', 'we@jiaban.com', 'F');
INSERT INTO `user` VALUES (101, '阎力言', 'student1', '039980483dcb6489166e1a6ba2da0b34', '17697576027', 'vhgj53@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (102, '高浩涆', 'student2', 'f07e767add41a8502acdc480fe884aa8', '15033432630', 'pabibruo@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (103, '刘浩歌', 'student3', '0f1db4b53835ffd6120845ab738c5f4e', '13177867883', 'erjnbcdlciatj14@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (104, '崔烨烁', 'student4', '46c47ab8544b14eec5396bbe1119f44d', '17576053067', 'avktjklkowojkqw@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (105, '叶康平', 'student5', '94fa038b07f3f797f669d15ee88a547f', '15816366018', 'e483212120575@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (106, '夏阳舒', 'student6', '7ebbf99e1cda3afc03f36472766b8434', '18463015511', 'bdtpkjshucjdmc@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (107, '夏德寿', 'student7', '524939ef821ac58264033d01afd7ce2b', '17670401263', 'bbjaacfrseq@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (108, '戴永宁', 'student8', '45668546bcb1567130cad10c047c2fcf', '16566451829', 'upa0@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (109, '叶浩浩', 'student9', 'f4478ca1df1f88dafb5f34ecc97d1e85', '13365169634', 'gtghoidwft06@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (110, '罗高轩', 'student10', '9818e270fc3a4d9d592cc13bcce269c1', '14709831780', 'imr@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (111, '曹紫琼', 'student11', '2c3aa0c5eb0f7bbf0e2c24c10941ec9a', '17805252431', 'twvcu@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (112, '龚晓枫', 'student12', '821b33484f99d17271775f8a4a5169d1', '19933625998', 'quakjb@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (113, '许颜英', 'student13', 'f62078076ac2ebb379aac1bd28547dd2', '13277747354', 'jssrrotcavslp@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (114, '胡晓旋', 'student14', '4b544c1294ec9513d584168b86bd7ab6', '17157967503', 'i87283363@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (115, '程梦秋', 'student15', '4b8bf2149ec3e192b6265f1c982e5e89', '19913259996', 'pgw@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (116, '程绿柏', 'student16', 'e75a00b64c58c020061f22e73d207bf6', '18608609762', 'vvgemrwkfatv1@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (117, '蒋雨晴', 'student17', 'e1bd4893af5bae35f3219931d0351983', '15944441733', 'aet@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (118, '丁芷兰', 'student18', '115cad676c1b9ad5d487488d3c185a14', '18741177283', 'nstiaaiqtwn@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (119, '曹雨雪', 'student19', '57ea017f08469f4fdac0dd0e268a9612', '17118282672', 'k743@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (120, '彭小枫', 'student20', 'ecf2fc877bf3ead11ce815521d26ed9b', '13638911701', 'oviau4@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (201, '敖兴朝', 'teacher1', 'b842b4673732526f68d9a06f1c8412b7', '15129298540', 'w54174@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (202, '菱意致', 'teacher2', 'f11ae84809ee8b7585752eecbf2daa2b', '17394628455', 'jcn@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (203, '贾凯乐', 'teacher3', '7b80722199dc27b8fab6a7192dffb0d3', '18862307793', 'dclnjiviwphqh@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (204, '方和光', 'teacher4', 'f6d33dcddda27dd85c002623cc07c50a', '13840561114', 'stcdle8241@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (205, '常明德', 'teacher5', '7ca0f96f147149e1d5713495d9c2d77e', '15009078565', 'a8064557@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (206, '甘依秋', 'teacher6', '3a2beb65cc1c8ef8bc9c69e96b459112', '18564971416', 'h403@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (207, '魏佳思', 'teacher7', '7cd6cb9a2ed237fde80778ac5a5818de', '15003194745', 'wdjlvttnwjhm@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (208, '国翠玉', 'teacher8', '496fbea9195de8cfeccfba418f6c8590', '17887756291', 'aiwhu@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (209, '蒲傲云', 'teacher9', '6bf9ceaf73d997143ac015610acdb9b6', '13173933675', 'vudqrbll@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (210, '敖合美', 'teacher10', '47b7878be1cbe4f92beef527e667e76d', '13203891843', 'dlaghsv1104@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (301, '张君浩', 'sec1', 'b01d0554881ddc66568236f9c7bd1af8', '19859673008', 'dahbgftmgfal@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (302, '白永宁', 'sec2', 'f10fcb9f2c251003406dc30ee1ec2b43', '15057791412', 'fjwl@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (303, '郝高翰', 'sec3', 'e2f503cc34f366ca5b8b6a666db65f80', '18895271680', 'c1500@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (304, '黎凡梅', 'sec4', '34fdab656c967bef22b11565b52cb140', '15287897878', 'v58@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (305, '姜飞雪', 'sec5', '5f9ffc0d9efacb6a1a8b4cbc25d5fad5', '18285106178', 'mlhcolkmramrgvu@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (306, '阎雪枫', 'sec6', '87436df686c28f923ccc3d5b81ae1bef', '13270715610', 'fmbnmtajhwgrv83@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (401, '秦文光', 'office1', '3285f6f3a77b9823fb4c6e0bab8b0390', '13173933675', 'nrrn@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (402, '刘语兰', 'office2', '9882d0ed29a2cff7e11f60c3cba1ad38', '13203891843', 'agjbrmplmr@mail.xjtu.edu.cn', 'F');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ROLE_ID` int(0) NULL DEFAULT NULL,
  `USER_ID` int(0) NULL DEFAULT NULL,
  INDEX `FK_RELATIONSHIP_23`(`USER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_24`(`ROLE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_23` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_24` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `user_role` VALUES (2, 20);
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
  `ID` int(0) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(0) NULL DEFAULT NULL,
  `STAGE_ID` int(0) NULL DEFAULT NULL,
  `START_TIME` datetime(0) NULL DEFAULT NULL,
  `END_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_30`(`USER_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_30` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户当前状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_stage
-- ----------------------------
INSERT INTO `user_stage` VALUES (1, 1, 1, '2021-03-09 13:14:55', '2021-03-11 13:15:00');
INSERT INTO `user_stage` VALUES (2, 1, 2, '2021-03-02 13:16:12', NULL);

-- ----------------------------
-- Table structure for validate
-- ----------------------------
DROP TABLE IF EXISTS `validate`;
CREATE TABLE `validate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reset_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of validate
-- ----------------------------
INSERT INTO `validate` VALUES (1, 19, '709046532@qq.com', 'd8cd2325-ab6a-4be9-aaf4-2f3ed392b4a2', 'passwordReset', '2021-03-21 16:51:18', '2021-03-21 16:51:18');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of weight
-- ----------------------------
INSERT INTO `weight` VALUES (10, 10, 60, 20, 20, 80, 30, 70, 50, 50);

SET FOREIGN_KEY_CHECKS = 1;
