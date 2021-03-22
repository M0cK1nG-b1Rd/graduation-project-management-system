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

 Date: 22/03/2021 17:51:22
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
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收老师' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收小组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acceptance_team
-- ----------------------------
INSERT INTO `acceptance_team` VALUES (1, 1, 'XT');
INSERT INTO `acceptance_team` VALUES (56, 1, 'JT');
INSERT INTO `acceptance_team` VALUES (57, 3, 'JT');

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
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('01afdfb03215496dbb9b0c101109ad55', 29, '关于第七届全国大学生工程训练综合能力竞赛校内第一轮评审的通知', 8, '<h1 class=\"ql-align-center\">关于第七届全国大学生工程训练综合能力竞赛校内第一轮评审的通知</h1><h6 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-10<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;2064</span></h6><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><br></p><p>各学院（部）、中心及有关单位：</p><p><br></p><p>	根据教育部印发《教育部评审评比评估和竞赛管理暂行办法》《教育部评审评估和竞赛清单》的通知精神，全国大学生工程训练综合能力大赛是纳入教育部评审评估和竞赛清单的三大赛事之一，对于推动人才培养和开展学科评估具有重要的作用，本届大赛由教育部高等教育司主办，教育部高等学校工程训练教学指导委员会举办。</p><p>	为深入推进工程教育改革，全面提升大学生工程创新综合能力水平，第七届全国大学生工程训练综合能力竞赛陕西省省赛初步定于4月底举行。根据近期对各项目团队的情况摸底与各项组织筹备工作的安排，学校拟定于4月中旬举办校赛，并将于近期开展2-3轮校内评审工作，力求保证参赛项目质量与进度，同时评审结果也将作为遴选推荐省赛的重要依据。现将校内第一轮评审有关事项通知如下：</p><p>	</p><p>	一、评审答辩要求</p><p>	本轮评审主要结合各项目团队的《项目设计报告》（模板见附件1）和项目进展PPT汇报进行评分，各团队需认真完成《项目设计报告》的填写，于3月16日之前连同项目进展PPT以指定方式提交。</p><p>	（一）项目设计报告要求</p><p>	《项目设计报告》需按照“第X组-XXX赛道-XXX赛项-项目设计报告-XXX（组长姓名）”的规则命名，各项填报内容不得留空。</p><p>	（二）答辩PPT要求</p><p>	项目进展PPT需要包括但不仅限于以下内容：</p><p>	1、项目方案</p><p>	明确列出项目设计的构想与出发点，实物组需包含机械结构与控制部分的设计思路与方案。</p><p>	2、目前工作进展</p><p>	清晰说明已实现和尚未实现的内容，以及预计完成项目的时间点。</p><p>	3、创新点与优势</p><p>	项目设计与实施中的创新思路与做法，以及作品体现出的技术、模式上的创新性、先进性及竞争优势。</p><p>	4、存在的问题</p><p>	项目目前存在的问题与分析，以及改进思路与措施。</p><p>	5、下一步工作计划</p><p>	后续备赛阶段拟定开展改进或者优化项目的举措，需列明时间安排。</p><p>	6、经费预算</p><p>	列明前期已产生的设备、耗材等相关费用，以及后续工作计划中的经费预算。</p><p>	（三）其他要求</p><p>	答辩时，如有实物允许带入答辩教室现场进行演示，如无实物或实物不便携带的应以视频的形式进行展示。</p><p>	</p><p>	二、评审答辩时间安排</p><p>	本次评审答辩定于3月17日（星期三）下午14:00-18:00进行，每组PPT汇报（含视频或者实物展示）7分钟，现场提问1分钟。</p><p>	</p><p>	材料提交方式、答辩分组及具体答辩时间表另行通知。</p><p class=\"ql-align-right\"><br></p><p class=\"ql-align-right\">实践教学中心</p><p class=\"ql-align-right\">机械工程学院</p><p class=\"ql-align-right\">2021年3月10日</p><p><br></p>', 2, 'YFB', '实践教学中心', '2021-03-17 00:00:00');
INSERT INTO `announcement` VALUES ('e7214455e39b4e869b3f31fb3dad5fea', 30, '2021年秋季日本爱媛大学交换生项目选拔通知', 8, '<h3 class=\"ql-align-center\"><span class=\"ql-size-large\">2021年秋季日本爱媛大学交换生项目选拔通知</span></h3><h4 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-16<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;411</span></h4><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年秋季日本爱媛大学交换生项目选拔通知</strong></p><p>	据我校与日本爱媛大学签订的校际学生交换协议，现将2021年秋季赴日参加爱媛大学交换生项目选拔事项通知如下，请各相关部门、学院按通知要求严肃认真做好选拔工作。</p><p>	<strong>校内报名截止时间：</strong>2021年3月21日</p><p>	<strong>项目时间：</strong>1学期或1年，2021秋季学期入学。</p><p>	<strong>项目介绍：</strong></p><p>	爱媛大学（Ehime University），位于爱媛县的日本国立大学。通称“爱大”或者媛大。〔因为有人将爱知大学称为“爱大”〕城北校区（法文学部、教育学部、工学部、理学部）紧靠松山大学。1949年 旧制松山高等学校、爱媛师范学校、爱媛青年师范学校、新居浜工业专门学校合并成爱媛大学，设立文理学部、教育学部、工学部。1954年 爱媛县立松山农科大学移交国有，设立农学部。1968年改组文理学部，设立法文学部、理学部。1973年设立医学部。2004年设立法科大学院。根据国立大学法人法，改为国立大学法人。</p><p>	交换生在日本爱媛大学对应学部参加交换学习，期间所获学分原则上返校后予以转换。</p><p>	<strong>选拔名额：</strong>2名</p><p>	<strong>选拔要求：</strong></p><p>	1、品学兼优，有赴日交换意向的我校外国语学院日语系研究生，非毕业班本科生。</p><p>	优先录取顺序为：研究生、大二、大一本科生。</p><p>	2、日语能力优秀。通过日本语能力测试（JLPT）N2并获得证书，或具有等同水平。</p><p>	注：满足以上所列所有要求者方可报名。有挂科、违纪受过处分者不予报名。</p><p>	<strong>选拔流程及时间节点：</strong></p><p>	1、2021年3月21日有意向的学生在西安交通大学外事工作服务系统-学生海外留学项目申报处（http://ims.xjtu.edu.cn/default.aspx）报名。</p><p>	2、2021年3月22日书院通过外事服务系统对报名人选进行审核。</p><p>	3、2021年3月22日学院通过外事服务系统按要求完成初选推荐。</p><p>	4、2021年3月23日教务处通过外事服务系统对初选推荐名单进行审核。</p><p>	5、2021年3月23日国际处终审确定最终校级推荐人选。</p><p>	<strong>费用情况：</strong></p><p>	对方免学费、注册费，我校学费正常缴纳。住宿费、生活费、往返旅费、保险费等个人承担。</p><p>	<strong>项目咨询：</strong></p><p>	本科生项目报名、学籍、学分转化认定：学院教务、教务处魏老师</p><p>	办公地点：主E1303室联系电话：029-82665477</p><p>	E-mail:xawei@xjtu.edu.cn</p><p>	研究生目报名、学籍、学分转化认定：学院教务、研究生院贺老师</p><p>	办公地点：主E1310室联系电话：029-82668580</p><p>	E-mail:tianyuanhe@xjtu.edu.cn</p><p>	项目内容：国际处徐阳老师</p><p>	办公地点：科学馆111室 联系电话：029-82668236</p><p>	E-mail:xuyang520@xjtu.edu.cn</p><p>	<strong>离校手续：</strong></p><p>	1、离校前填写《西安交通大学学生境外学习承诺书》。</p><p>	2、根据西安交通大学要求办理出访审批手续，出访审批手续办理请登录外事工作服务系统-学生因公出国（境）事务。</p><p>	3、参照《本科生赴境内外学习管理办法》（教务处主页“规章制度”栏查看）办理修读计划（与学院协商制定）、保留学籍、离校等手续。</p><p>	<strong>温馨提示：</strong></p><p>	项目申请流程较为紧凑，请有意申请者尽快备好以下材料以确保顺利参加项目：1）有效护照、2）语言能力证书或相关官方证明、3）中英文成绩单、在读证明等。以上材料请务必提前备好。其余材料国际处将组织申请指导（入选者将得到电话通知）特别说明。</p><p>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p class=\"ql-align-right\">2021年3月16日</p><p><br></p>', 1, 'YFB', ' 教务处', '2021-03-17 12:22:47');
INSERT INTO `announcement` VALUES ('bc1b25d792d24794bb23d69ea84d92bf', 31, '关于转发《教育部办公厅关于推荐新文科研究与改革实践项目的通知》《陕西省教育厅办公室关于做好新文科研究与改革实践项目申报工作的通知》的通知', 8, '<h3 class=\"ql-align-center\"><span class=\"ql-size-large\">关于转发《教育部办公厅关于推荐新文科研究与改革实践项目的通知》《陕西省教育厅办公室关于做好新文科研究与改革实践项目申报工作的通知》的通知</span></h3><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-12<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;728</span></h3><p><br></p><p>各学院（部、中心）及有关单位：</p><p>	现将《教育部办公厅关于推荐新文科研究与改革实践项目的通知》（教高厅函〔2021〕10号）（附件1）《陕西省教育厅办公室关于做好新文科研究与改革实践项目申报工作的通知》文件（附件2）转发给你们。</p><p>	一、申报要求</p><p class=\"ql-align-justify\">	本次遴选的项目为<strong>教育部</strong>及<strong>陕西省</strong>教育厅立项的新文科研究与改革实践项目。</p><p class=\"ql-align-justify\">	根据文件要求，请各单位认真研究《新文科研究与改革实践项目指南》（附件3），坚持问题导向、打通学科界别、突出自身特色、创新改革思路，结合已有工作基础和具体情况，按照选题要求确定申报项目内容。</p><p>	二、申报途径</p><p class=\"ql-align-justify\">	1.请各学院认真组织动员教师积极申报。我校向教育部及陕西省推荐限额各5项，学校每个教学单位限报2项。</p><p class=\"ql-align-justify\">	2.教育部《通知》指出“各教学指导委员会、中国高等教育学会应发挥统筹协调作用，各教学指导委员会可择优推荐不超过2项，中国高等教育学会可推荐不超过10项”。</p><p class=\"ql-align-justify\">	</p><p class=\"ql-align-justify\">	陕西省《通知》指出“陕西省高等学校教学指导委员会，陕西高等教育学会应发挥统筹协调作用，可分别择优遴选推荐不超过5项”。</p><p class=\"ql-align-justify\">	请各教学单位，特别是担任教指委主任和副主任单位的学院，充分利用教育部、陕西省教指委和协（学）会推荐资格积极申报。</p><p class=\"ql-align-justify\">	3.已向教务处提交的<strong>教育部</strong>新文科研究与改革实践项目，若未获得推荐机会，将自动进入本次省级新文科研究与改革实践项目候选队列，参与遴选。</p><p>	三、材料报送</p><p class=\"ql-align-justify\">	请申报单位认真填写《新文科研究与改革实践项目推荐表》（附件4），经教学院长审核签字盖章后于3月23日前统一上报至教务处通识科（主楼E座1303），电子版发送至bhzhang19@xjtu.edu.cn。</p><p>	联系人：张博华&nbsp;&nbsp;联系电话：82668311</p><p>	</p><p>	附件：1.《教育部办公厅关于推荐新文科研究与改革实践项目的通知》</p><p>	&nbsp;&nbsp;&nbsp;2.《陕西省教育厅办公室关于推荐新文科研究与改革实践项目的通知》</p><p>		&nbsp;&nbsp;&nbsp;3.	《	新文科研究与改革实践项目指南	》</p><p>		&nbsp;&nbsp;&nbsp;4.	《	新文科研究与实践项推荐表	》</p><p>	</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年3月16日</p>', 3, 'YSC', ' 教务处', '2021-03-17 12:25:00');
INSERT INTO `announcement` VALUES ('e4346180007a46bf8e3522bf0cc140b8', 32, '关于开展2021西安交通大学美国大学生数学建模竞赛（MCM/ICM）相关工作的通知', 10, '<h1 class=\"ql-align-center\">关于开展2021西安交通大学美国大学生数学建模竞赛（MCM/ICM）相关工作的通知</h1><h2 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2020-12-16<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;5578</span></h2><p><span style=\"color: black;\">各学院（部）、中心及有关单位：</span></p><p><span style=\"color: black;\">&nbsp;&nbsp;美国大学生数学建模竞赛(MCM/ICM)由美国数学及其应用联合会主办，是唯一的国际性数学建模竞赛，也是世界范围内最具影响力的数学建模竞赛，对于推动人才培养和提高学生实践创新能力具有重要意义。现决定组织开展2021西安交通大学美国大学生数学建模竞赛（MCM/ICM）相关工作。</span></p><p>	<span style=\"color: black;\">本届大赛由实践教学中心统筹组织安排，数学与统计学院具体负责组织实施，设立美赛建模竞赛工作小组和教练组，负责活动的报名、培训等相关工作。</span></p><p>	<span style=\"color: black;\">现将参赛有关事项通知如下：</span></p><p><strong style=\"color: black;\">一、报名：</strong></p><p>	<span style=\"color: black;\">1.&nbsp;每3人一队（指明队长），</span>参赛队员应有数学建模培训或参赛经历,&nbsp;并具备完成英文科技论文的写作能力;</p><p>	<span style=\"color: black;\">2.&nbsp;报名时间：12月16日至12月23日</span></p><p>	<span style=\"color: black;\">3.&nbsp;报名办法：https://www.wjx.top/jq/99771759.aspx 或手机扫描下方报名。</span></p><p class=\"ql-align-center\"><img src=\"http://dean.xjtu.edu.cn/__local/6/38/29/D2B83439520976A4453CA9B7025_8EA6D239_345B.jpg\" width=\"173\"></p><p><strong style=\"color: black;\">二、活动咨询：</strong></p><p><span style=\"color: black;\">&nbsp;&nbsp;报名完成后，请队长加入2021美赛QQ群：849428917。教练组将对大家的具体问题进行解答。同时，有关数学建模竞赛活动的所有通知包括赛题都将在QQ群发布。</span></p><p><strong style=\"color: black;\">三、缴费</strong></p><p>	本届大赛报名费为每队100美金，参赛队需先自行支付。获M奖及以上奖项队伍可凭获奖证书至教练组负责人处登记、报销。</p><p><strong style=\"color: black;\">四、其他</strong></p><p>	其他未尽事宜由<span style=\"color: black;\">竞赛工作组负责解释。</span></p><p><br></p><p><br></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-right\">数学与统计学院</p><p class=\"ql-align-right\">实践教学中心</p><p class=\"ql-align-right\">2020年12月16日</p><p><br></p>', 1, 'WFB', '数学与统计学院', '2021-03-21 18:56:18');
INSERT INTO `announcement` VALUES ('b43bd7d2478447caa2c077c0b5f76d39', 33, '关于征集西安交通大学优秀通识课程论文及教学成果展示作品的通知', 19, '<h1 class=\"ql-align-center\">关于征集西安交通大学优秀通识课程论文及教学成果展示作品的通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-08<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;2494</span></h3><p>	为促进我校通识教育教学改革与发展，激发同学的学习热情，积累通识课程教学经验，丰富通识教育教学成果，教务处将组织优秀通识课程论文及教学成果展示作品征集活动。</p><p class=\"ql-align-justify\"><strong>一、&nbsp;征集范围</strong></p><p>	1、通识课程的课程论文，或者是基于通识课程的作业、读书笔记、调查报告、实践报告等修改而成的论文。</p><p>	2、通识课程的教学成果（实验实践成果、艺术创作成果、表演视频等）。</p><p>	3、以“通识教育与大学生成长”为主题，自定形式和标题，展现对通识教育的认识，或者通识教育对自己的影响。</p><p class=\"ql-align-justify\"><strong>二、&nbsp;征集要求</strong></p><p>	1、论文要求：篇幅2000-3000字，符合学术规范，具有原创性。包括论文题目、个人信息（学院 班级 学生姓名 指导教师:姓名）、正文、参考文献四个部分。A4页面；字体：宋体；字号：小四；字符间距：标准；行距：20磅。</p><p>	2、教学成果要求：实物作品、照片、视频等。实物作品1-3件；清晰照片不少于3张（像素不低于300dpi）；视频资料不超过15分钟的样片（mpeg等压缩视频格式），同时附作品简要介绍。</p><p>	3、内容应体现我校通识课程的人才培养目标要求，展现科学精神、人文素养、全球视野、创新思维和家国情怀与使命担等。</p><p><strong>三、&nbsp;提交方式</strong></p><p>	1、本次征集接受学生个人申请和任课教师推荐两种方式。除论文外，其他作品可以团队名义参加，团队人数不超过3人。</p><p>	2、请于2021年7月16日前，将作品电子版及参赛表格（见附件）发送至bhzhang19@xjtu.edu.cn，作品文件命名格式：论文/教学成果（2选1）+学院+班级+姓名+标题+指导教师：姓名。</p><p><strong>四、&nbsp;评选流程</strong></p><p>	教务处将组织专家对征集作品进行综合评选，评选通过后，作者根据专家意见进一步修改并提交最终版本，届时将另行通知。</p><p><strong>五、&nbsp;展示及奖励颁发</strong></p><p>	经评审遴选出的优秀作品将：</p><p>	1	、颁发证书及纪念品，优秀论文将汇编成文集出版。</p><p>	2	、在四大发明广场实地、新闻主页、微信公众号等以多种形式展览。</p><p>	3	、从中择优评选一、二、三等奖及优秀指导教师奖若干（一等奖奖金1000，二等奖奖金500，三等奖奖	金200元）</p><p><strong>六、&nbsp;联系方式及其他</strong></p><p>	联系人：张博华，联系电话：82668311</p><p>	主办方享有对所有参赛作品进行媒体宣传、出版发行、展览展示的权利。</p><p>	</p><p>	附件：西安交通大学通识课程优秀论文及教学成果展示作品参赛表格</p><p>	</p><p>	</p><p>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年3月4日</p>', 1, 'YFB', ' 教务处', '2021-03-22 09:17:42');
INSERT INTO `announcement` VALUES ('67bc21ba428140e3807a8254f27176e4', 34, '2021年秋季比利时布鲁塞尔管理大学交换生项目选拔通知', 19, '<h1 class=\"ql-align-center\">2021年秋季比利时布鲁塞尔管理大学交换生项目选拔通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-15<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;892</span></h3><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年秋季比利时布鲁塞尔管理大学交换生项目选拔通知</strong></p><p>	我校与比利时布鲁塞尔管理大学是校际友好学校，现据两校签订的学生交换协议将2021年秋季布鲁塞尔管理大学交换生项目选拔事项通知如下，请各相关部门、学院按通知要求支持配合，做好相关选拔工作。</p><p>	<strong>项目校内报名申请截止时间：</strong>2021年5月24日</p><p>	<strong>项目时间：</strong>秋季学期：2021年9月至1月</p><p>	春季学期：2022年2月至6月</p><p>	<strong>一、学校简介</strong></p><p>	布鲁塞尔管理学院（ICHEC），法语名称：Institut Catholique des Hautes Etudes Commerciales，是一所规模传统商业方向的公立大学，前身是比利时鲁汶大学管理学院，后独立成为比利时首屈一指的商学院，拥有52年的经验。布鲁塞尔管理学院位于比利时首都布鲁塞尔，布鲁塞尔是欧洲最美的城市，是欧洲的心脏，欧盟委员会和欧盟部长理事会位于布鲁塞尔，另一个重要机构欧洲议会在布鲁塞尔也有分处，所以它有欧洲首都的美誉。北大西洋公约组织的总部也在该市。ICHEC布鲁塞尔管理学校是一所私立天主教学院。主要提供商业和金融科学的培训和课程。在校教职员超过2500多人，大学开设有三年制的本科与一年到两年的硕士课程 集中在商业工程学和商业管理学上。ICHEC于2018年获得AACSB认证。</p><p>	学校总体英文授课情况请参考：</p><p>	https://www.ichec.be/sites/default/files/uploads/International/List%20courses%202020-2021_.pdf</p><p>	我校与布鲁塞尔管理大学大学举办互派交换生项目，期间所获学分返校后由所在学院进行认证。</p><p>	<strong>二、选拔名额</strong></p><p>	管理学院在读本科生3-6名，一学年交换生3名或一学期交换生6名。</p><p>	<strong>三、选拔要求及所需申请材料</strong></p><p>	1、品学兼优，有赴比利时交换意向的我校管理学院大一、大二本科生。</p><p>	2、学习成绩优秀，能够适应英文或法语授课环境。</p><p>	注：满足以上所列所有要求者方可报名。有不及格成绩、违纪受过处分者不予报名。</p><p>	<strong>四、选拔流程及时间节点</strong></p><p>	1、2021年5月24日前有意向且符合条件学生在西安交通大学外事服务平台<a href=\"http://org.xjtu.edu.cn/openplatform/login.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(30, 80, 162);\">http://org.xjtu.edu.cn/openplatform/login.html</a>完成报名；</p><p>	2、2021年5月26日前书院通过外事服务系统对报名人选进行审核；</p><p>	3、2021年5月27日前学院通过外事服务系统按要求完成初选审核；</p><p>	4、2021年5月28日前教务处通过外事服务系统按要求完成初选名单审核；</p><p>	5、2021年5月31日前国际处终审确定最终校级推荐人选，并召开项目说明会；</p><ol><li>	<strong>费用情况</strong></li><li>	对方免学费、我校学费正常缴纳。住宿费、生活费、往返旅费、保险等费用个人承担。</li><li>	<strong>六、项目咨询</strong></li><li>	报名咨询：学院教务员</li><li>	学分政策咨询：学院、校教务处联系电话：82665477</li><li>	项目咨询管理：国际处闫老师 办公地点：科学馆111室</li><li>	联系电话:029-82668236 E-mail:<a href=\"mailto:yanting@xjtu.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(30, 80, 162);\">yanting@xjtu.edu.cn</a></li><li>	咨询时间：周一至周五工作日，下午办公时间:14:00-18:00（冬令时）、14:30-18:30（夏令时），双休、法定节假日除外。非工作时间请邮件咨询。</li><li>	<strong>注：所有同学完成在线报名后，需扫描报名系统内提供二维码加入项目管理微信群，后续项目相关通知将通过微信群即时通报，所有项目候选人务必及时进群。</strong></li><li>	<strong>七、离校手续</strong></li><li>	1、离校前填写《西安交通大学学生境外学习承诺书》。</li><li>	2、根据西安交通大学要求办理出访审批手续，出访审批手续办理请登录国际处主页“因公出境-校内审批”栏查看。</li><li>	3、参照《本科生赴境内外学习管理办法》（教务处主页“规章制度”栏查看）办理修读计划（与学院协商制定）、保留学籍、离校等手续。</li><li>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</li><li class=\"ql-align-right\">2021年3月15日</li></ol><p><br></p>', 1, 'YFB', '教务处', '2021-03-22 09:19:50');

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选题' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `menu` VALUES (56, 0, '成绩管理', '/scoreManage', NULL, 'el-icon-s-platform', NULL, 'score:mange', NULL);
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
INSERT INTO `message` VALUES ('0617fb55b1164b9caa43b95067bf5030', 19, 4, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-20 09:45:46');
INSERT INTO `message` VALUES ('176d517a579e46a9832a192095ae8957', 19, 14, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-20 09:45:46');
INSERT INTO `message` VALUES ('176d517a579e46a9832a192095ae8958', 19, 14, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-20 09:45:46');
INSERT INTO `message` VALUES ('176d517a579e46a9832a192095ae8959', 19, 14, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-05 09:45:46');
INSERT INTO `message` VALUES ('43b620aa11ce43edac195b5421855c2e', 19, 3, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-20 09:45:46');
INSERT INTO `message` VALUES ('df1be3eebf2e4f02a8edeb6bc42d8f67', 19, 11, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-20 09:45:46');
INSERT INTO `message` VALUES ('e6dde008330d409ba69037d0179586a3', 19, 18, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-20 09:45:46');

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plea
-- ----------------------------
INSERT INTO `plea` VALUES (1, 'XT', 1, 1, 3, '2020-07-30 13:20:18', '2020-07-31 13:20:18', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plea_result
-- ----------------------------
INSERT INTO `plea_result` VALUES (1, 3, NULL, 'KT', 80, '你去吃粑粑吧', 1);
INSERT INTO `plea_result` VALUES (2, 1, NULL, 'KT', 85, '🐎', 0);
INSERT INTO `plea_result` VALUES (3, 1, NULL, 'ZQ', 66, '我是老板儿子', 1);
INSERT INTO `plea_result` VALUES (4, 1, NULL, 'JT', 88, '老板是我爹', 1);
INSERT INTO `plea_result` VALUES (5, 2, NULL, 'KT', 89, '我是老板爹', NULL);

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
  `POSE_BY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSE_TIME` datetime NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `AUDIT_BY` int NULL DEFAULT NULL,
  `AUDIT_TIME` datetime NULL DEFAULT NULL,
  `COMMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SCORE` int NULL DEFAULT NULL,
  `IS_RELEASED` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES (1, '1', 0, '456456', 'KT', '没啥意义', '没啥结果', '没啥计划', '', '', '3', '2021-03-17 10:54:56', 'YTG', 3, '2021-03-18 11:39:59', '<p>12312313</p>', 90, 0);
INSERT INTO `report` VALUES (4, '5', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2021-03-17 17:49:28', 'WSH', NULL, NULL, NULL, 88, 0);
INSERT INTO `report` VALUES (5, '1', 0, NULL, 'KT', '<p>研究上课摸鱼很有意义哦</p>', '<p>调研了很久发现很多晋姓同学喜欢上课摸鱼</p>', '<p>我计划上课观察晋同学</p>', NULL, NULL, '1', '2021-03-19 19:53:41', 'WSH', NULL, NULL, '5191911', 80, 0);
INSERT INTO `report` VALUES (6, '1', 0, NULL, 'ZQ', NULL, NULL, NULL, '阿爸', '阿妈', '3', '2021-03-31 12:20:43', 'WSH', 2, '2021-03-20 13:27:25', NULL, 999, 0);
INSERT INTO `report` VALUES (7, NULL, 0, NULL, 'ZQ', NULL, NULL, NULL, '几天没见', '这么拉了', '1', NULL, 'WSH', NULL, NULL, NULL, 98, 0);

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
INSERT INTO `role_stage_perms` VALUES (2, 1, 1, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (3, 1, 2, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (4, 2, 3, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (5, 2, 4, 'process');
INSERT INTO `role_stage_perms` VALUES (6, 3, 5, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (7, 1, 4, 'process:record');

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
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阶段任务' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生小组，分批进行答辩' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `student` VALUES (20, 8, 2, 2, 6);

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '456544465', '1', '上班摸鱼', '一般来说， 我认为， 歌德曾经说过，读一本好书，就如同和一个高尚的人在交谈。这句话把我们带到了一个新的维度去思考这个问题: 那么， 在这种困难的抉择下，本人思来想去，寝食难安。 经过上述讨论， 现在，解决上班摸鱼的问题，是非常非常重要的。 所以， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 而这些并不是完全重要，更加重要的问题是， 一般来讲，我们都必须务必慎重的考虑考虑。 上班摸鱼的发生，到底需要如何做到，不上班摸鱼的发生，又会如何产生。 王阳明曾经说过，故立志者，为学之心也；为学者，立志之事也。这句话语虽然很短, 但令我浮想联翩。', '有手就行', 'KXTS', 3, '2021-03-04 13:38:24', 'YTG', 1, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (2, '124214234', '2', '上课开船', '一般来说， 我认为， 歌德曾经说过，读一本好书，就如同和一个高尚的人在交谈。这句话把我们带到了一个新的维度去思考这个问题: 那么， 在这种困难的抉择下，本人思来想去，寝食难安。 经过上述讨论， 现在，解决上班摸鱼的问题，是非常非常重要的。 所以， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 而这些并不是完全重要，更加重要的问题是， 一般来讲，我们都必须务必慎重的考虑考虑。 上班摸鱼的发生，到底需要如何做到，不上班摸鱼的发生，又会如何产生。 王阳明曾经说过，故立志者，为学之心也；为学者，立志之事也。这句话语虽然很短, 但令我浮想联翩。', '戴眼罩', 'KXTS', 2, '2021-03-21 12:30:17', 'YTG', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (14, '464545654', 'ef3d55a7f0184c0688fe4d3cc13621e3', '我是啥币', '研究我自己', '名字笔画39画', 'KXTS', 2, '2021-03-15 20:27:39', 'WTG', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (17, '456456546', '3', '它是啥币', '张老师⑧行', '张老师', 'KXTS', 1, '2021-03-21 12:30:15', 'YTG', 2, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (18, '454554655', '4', '她是啥币', '张老师⑦行', '张老师彳亍', 'KXTS', 4, '2021-03-28 12:42:38', 'YTG', NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (19, '565665552', '5', '他是啥币', '张老师⑥行', '鬼！', 'KXTS', 5, '2021-03-28 12:42:34', 'YTG', NULL, NULL, NULL, NULL);

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
INSERT INTO `system_stage` VALUES (0, 0, '课题申报', '在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 1, '课题申报审核', '在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。dwqvqw', '2021-03-11 00:00:00', '2021-03-11 00:00:00');
INSERT INTO `system_stage` VALUES (0, 2, '被驳回课题整改', '在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 3, '学生提交选题申请', '在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 4, '教师审核学生申请', '在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (1, 5, '开题报告及材料提交', '在该阶段，学生可以在系统提交开题报告及与开题相关的材料。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
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
INSERT INTO `thesis` VALUES (1, '879789879', 1, '2021-03-28 21:52:51', 'YFZ', 88);
INSERT INTO `thesis` VALUES (2, '646546465', 2, '2021-03-21 12:23:08', 'YFZ', NULL);
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thesis_teacher
-- ----------------------------
INSERT INTO `thesis_teacher` VALUES (113, 2, 2, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (114, 1, 2, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (115, 4, 2, 1, -1, '2021-03-22 15:58:54');
INSERT INTO `thesis_teacher` VALUES (116, 3, 5, 1, -1, '2021-03-22 15:58:54');
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
  `USER_ID` int NOT NULL AUTO_INCREMENT COMMENT '主键,用户id',
  `REAL_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户真实姓名',
  `USERNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户登录账号',
  `PASSWORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `TEL` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `MAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别(F女M男)',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `user_role` VALUES (2, 20);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of weight
-- ----------------------------
INSERT INTO `weight` VALUES (10, 10, 60, 20, 20, 80, 30, 70, 50, 50);

SET FOREIGN_KEY_CHECKS = 1;
