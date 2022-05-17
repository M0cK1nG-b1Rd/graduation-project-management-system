/*
 Navicat Premium Data Transfer

 Source Server         : stephan
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : gms

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 30/03/2021 20:24:00
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
) ENGINE = InnoDB AUTO_INCREMENT = 190 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收老师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acceptance_teacher
-- ----------------------------
INSERT INTO `acceptance_teacher` VALUES (181, 39, 76, 1);
INSERT INTO `acceptance_teacher` VALUES (182, 35, 77, 1);
INSERT INTO `acceptance_teacher` VALUES (183, 33, 76, 0);
INSERT INTO `acceptance_teacher` VALUES (184, 30, 77, 0);
INSERT INTO `acceptance_teacher` VALUES (185, 34, 76, 0);
INSERT INTO `acceptance_teacher` VALUES (186, 31, 77, 0);
INSERT INTO `acceptance_teacher` VALUES (187, 38, 76, 0);
INSERT INTO `acceptance_teacher` VALUES (188, 37, 77, 0);
INSERT INTO `acceptance_teacher` VALUES (189, 32, 76, 0);
INSERT INTO `acceptance_teacher` VALUES (190, 36, 77, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收小组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acceptance_team
-- ----------------------------
INSERT INTO `acceptance_team` VALUES (76, 103, 'KT');
INSERT INTO `acceptance_team` VALUES (77, 106, 'KT');

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
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('da9e4529498d42e18087ca50d451ddf3', 38, '2021年秋季日本千叶大学顶尖设计专业课程学分项目选拔通知', 401, '<h1 class=\"ql-align-center\">2021年秋季日本千叶大学顶尖设计专业课程学分项目选拔通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-23<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;262</span></h3><p class=\"ql-align-center\"><br></p><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年秋季日本千叶大学顶尖设计专业课程学分项目选拔通知</strong></p><p>	依据我校发展国际化教育的方针和校际合作协议，为实施我校的教育国际化战略，培养具有国际视野和国际竞争力的高素质人才，鼓励我校学生出国（境）深造获得第二校园的学习经历，2021年秋季，我校将选拔优秀在校本科生前往日本千叶大学，参加为期一学期的交流学习。</p><p>	<strong>项目报名截止时间：2021年3月31日</strong></p><p>	<strong>地点：日本千叶大学</strong></p><p>	<strong>项目时间：</strong>2021年10月-2022年1月</p><p>	<strong>一、项目介绍</strong></p><p>	<strong>1、学校简介</strong></p><p>	千叶大学是日本著名的国立大学，也是最早设立工业设计专业的大学。一直以来其专业排名处于日本领先地位。现在知名的工业设计专家几乎都出身于千叶大学工学部。如索尼Walkman设计总监黒木靖夫、丰田汽车设计总监平井和平等。在各大学纷纷设立工业设计专业的今天，大多数学校的学科带头人也出身于千叶大学。</p><p>	<strong>2、项目介绍</strong></p><p>	为进一步加强和推动世界主要国家间的高等教育交流，培养国际化高端人才，千叶大学工学部特此开设了Top-Design专业学期课程。参加该项目的学生将以千叶大学工学部【特别听讲生】身份赴日学习。</p><p>	在零距离触感世界顶尖设计理念的引导下，深化领略和学习艺术与科技融合的巧妙构思。所有课程均采用英文授课，以【演习形式】的授课模式分成全新的设计小组。学生根据老师设置的课题通过进行头脑风暴、实际设计、动手操作，最终完成作品。在学习期间，中国学生也将有同千叶大学在校本籍学生共同学习，互动交流的机会。最终通过考核后，千叶大学会给予中国学生20学分作为该阶段学习的认可,并颁发官方成绩单和结业证书。</p><p>	<strong>3、课程内容</strong></p><p>	<strong>授课方式：</strong></p><p>	Top-Design Program will be conducted in the studio work. Professors who worked in the company as an in-house designer, will be teaching all programs.（以工作室形式教学，本项目由从事企业工作的资深教授全程授课。）</p><p>	<strong>授课语言：</strong>英文</p><p>	<strong>课程主题（大类）</strong>：</p><p>	*下表为往年学期内容参考，具体以学校实际课程为准：（见附件）</p><p>	项目费用：811,038日元/人（日元对人民币汇率仅供参考,以当日银行官方价格为准）</p><p>	项目费包含报名费、学费及项目参加服务费；</p><p>	其中，项目参加服务费包括：出发前的指导申请材料及入学材料、国际邮寄、在留换签指导、协助在日住宿申请、行前指导；日本现地服务的接机服务、住宿安置、协助在当地事务所办理外国人登录手续、协助办理银行开户手续、协助办理开通手机手续、国民健康保险费等。</p><p>	<strong>二、报名要求</strong></p><p>	1、大一、大二在校本科生，工业设计（设计相关）专业；</p><p>	2、大学英语4级480分以上或相应英文水平；</p><p>	3、在校期间未受处分、无不及格成绩、成绩优异、品行端正；</p><p>	<strong>三、项目申请报名流程及所需材料</strong></p><p>	1、2021年3月28日前有意向且符合条件学生在西安交通大学外事服务平台<a href=\"http://org.xjtu.edu.cn/openplatform/login.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(30, 80, 162);\">http://org.xjtu.edu.cn/openplatform/login.html</a>完成报名；</p><p>	2、2021年3月28日前书院通过外事服务系统对报名人选进行审核；</p><p>	3、2021年3月29日前学院通过外事服务系统按要求完成初选审核；</p><p>	4、2021年3月30日前教务处通过外事服务系统对初选名单进行审核；</p><p>	5、2021年3月31日前国际处终审确定最终校级推荐人选；</p><p>	<strong>四、项目管理</strong></p><p>	报名咨询：学院教务员</p><p>	学分转换政策咨询：学院、校教务处魏老师联系电话：82665477</p><p>	项目咨询管理：国际处徐老师办公地点：科学馆111室</p><p>	联系电话:029-82668236 E-mail: yanting@xjtu.edu.cn</p><p>	咨询时间：周一至周五工作日，下午工作时间：14:00-18:00（冬令时）、14:30-18:30（夏令时），双休、法定节假日除外，非工作时间请邮件咨询。</p><p>	<strong>注：所有同学完成在线报名后，需扫描报名系统内提供二维码加入项目管理微信群，后续项目相关通知将通过微信群即时通报，所有项目候选人务必及时进群。</strong></p><p>	<strong>五、离校手续</strong></p><p>	1、入选学生离校前填写《西安交通大学学生境外学习承诺书》；</p><p>	2、根据西安交通大学要求办理出访审批手续，出访审批手续办理请登录国际处主页“因公出境-校内审批”栏查看；</p><p>	3、参照《本科生赴国境外学习管理办法》（教务处主页“规章制度”栏查看）办理修读计划（与学院协商制定）、保留学籍、离校等手续。</p><p>	<strong>注：日本千叶大学3月24日召开线上项目官方说明会，有意向参会的学生请查看宣讲会详细信息（见附件）。</strong></p><p>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</p><p class=\"ql-align-right\">2021年3月23日</p><p><br></p>', 1, 'YFB', '教务处', '2021-03-23 20:00:00');
INSERT INTO `announcement` VALUES ('abec385709e94861acd9f41c3c5c66ce', 39, '关于开展西安交通大学2021年“格兰富杯”节能减排社会实践与科技竞赛的通知', 401, '<h1 class=\"ql-align-center\">关于开展西安交通大学2021年“格兰富杯”节能减排社会实践与科技竞赛的通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-24<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;796</span></h3><p class=\"ql-align-center\"><br></p><p><span style=\"color: rgb(51, 51, 51);\">各学院(部)、书院、各学生组织及相关单位：</span></p><p>	<span style=\"color: rgb(51, 51, 51);\">为进一步传扬</span>&nbsp;<span style=\"color: rgb(51, 51, 51);\">“西迁精神”，引导我校学生关注社会发展需求，培养学生创新意识和实践能力，同时为第十四届全国大学生节能减排社会实践与科技竞赛选拔优秀团队与作品，教务处、实践教学中心、团委和能动学院经过充分筹备，决定开展西安交通大学2021年“格兰富杯”节能减排社会实践与科技竞赛。现将竞赛相关事项通知如下：</span></p><p>	<strong style=\"color: rgb(51, 51, 51);\">一、竞赛主题</strong></p><p>	<span style=\"color: rgb(51, 51, 51);\">节能减排，绿色能源</span></p><p>	<strong style=\"color: rgb(51, 51, 51);\">二、竞赛内容</strong></p><p>	<span style=\"color: rgb(51, 51, 51);\">紧扣竞赛主题，作品包括实物制作（含模型）、软件、设计和社会实践调研报告等，体现新思想、新原理、新方法以及新技术。</span></p><p>	<strong style=\"color: rgb(51, 51, 51);\">三、竞赛规则</strong></p><p>	<strong style=\"color: rgb(68, 114, 196);\">1、参赛对象：</strong><span style=\"color: rgb(51, 51, 51);\">在校全日制本科生、硕士研究生和博士研究生均可参加，学院、专业和年级不限。一年内已经参加过其他比赛的项目或者新项目都可以参赛。参赛者必须以小组形式参赛，每组不得超过7人,可聘请指导教师不超过2名。每位参赛学生只允许参加1个队，鼓励跨院（系）组队。</span></p><p>	<strong style=\"color: rgb(68, 114, 196);\">2、参赛单位：</strong><span style=\"color: rgb(51, 51, 51);\">以学生自由组合的小组为单位，申报作品时需对所有参加人员进行作者排序。</span></p><p>	<strong style=\"color: rgb(68, 114, 196);\">3、作品申报：</strong><span style=\"color: rgb(51, 51, 51);\">参赛作品必须是比赛当年完成的作品。参赛学生必须在规定时间内完成设计，准时上交作品，未按时上交者按自动放弃处理。</span></p><p>	<strong style=\"color: rgb(68, 114, 196);\">4、作品评审：</strong><span style=\"color: rgb(51, 51, 51);\">专家委员会根据作品的科学性、可行性、创新性和经济性等指标对作品进行初审和终审，并提出获奖名单。</span></p><p>	<strong style=\"color: rgb(51, 51, 51);\">四、竞赛日程与安排</strong></p><p>	<span style=\"color: rgb(51, 51, 51);\">1、作品申报：各参赛小组在</span><strong style=\"color: red;\">2021年4月30日24：00</strong><span style=\"color: rgb(51, 51, 51);\">前，提交电子版申报书（附件一，其中对外推荐、盖章等内容暂时不填写）至邮箱</span><strong style=\"color: rgb(68, 114, 196);\">ndxyyjsh_xcb@163.com</strong><span style=\"color: rgb(51, 51, 51);\">，邮件以“节能减排竞赛作品+作品名称”为主题，逾期不予受理。</span></p><p>	<span style=\"color: rgb(51, 51, 51);\">2、作品初审：竞赛组委会将于</span><strong style=\"color: red;\">2021年5月上旬</strong><span style=\"color: rgb(51, 51, 51);\">进行作品初审，根据竞赛组委会的评议结果，评审小组将评审出参加终审的作品，并对各参赛作品提出进一步完善的意见和建议。</span></p><p>	<span style=\"color: rgb(51, 51, 51);\">3、作品终审：组委会专家将于</span><strong style=\"color: red;\">2021年5月中旬</strong><span style=\"color: rgb(51, 51, 51);\">对入围竞赛作品进行终审与答辩，通过实物、模型、软件和报告等形式进行现场展示，每件作品</span><strong style=\"color: red;\">PPT汇报时间为10分钟</strong><span style=\"color: rgb(51, 51, 51);\">（现场设置投影仪），</span><strong style=\"color: red;\">学生答辩时间6分钟</strong><span style=\"color: rgb(51, 51, 51);\">。评审小组提出改进意见并确定最终报送国赛的作品名单，5月29日24:00前完成作品上传。</span></p><p>	<strong style=\"color: rgb(51, 51, 51);\">五、大赛奖励</strong></p><p>	<span style=\"color: rgb(51, 51, 51);\">1、校内选拔赛设一等奖3项、二等奖5项、三等奖7项及优秀奖若干。</span></p><p>	<span style=\"color: rgb(51, 51, 51);\">2、参加第十四届全国大学生节能减排社会实践与科技竞赛并取得优异成绩团队的研究生推免奖励按照学校的相关文件和政策执行。</span></p><p>	<span style=\"color: rgb(51, 51, 51);\">3、校内赛获奖团队及指导教师获得由格兰富（中国）投资有限公司提供的奖励金（一等3000元，二等2000元，三等1000元，指导教师1000元）。</span></p><p>	<span style=\"color: rgb(51, 51, 51);\">校内选拔赛信息交流QQ群：862274688；</span></p><p>	<span style=\"color: rgb(51, 51, 51);\">科技类申报书及报告格式和社会实践类申报书及报告格式见</span><strong style=\"color: red;\">附件一</strong><span style=\"color: rgb(51, 51, 51);\">；</span></p><p>	<span style=\"color: black;\">未尽事宜请联系——</span>&nbsp;<span style=\"color: rgb(51, 51, 51);\">崔老师（能动学院）电话：029-82667940</span></p><p>	<strong style=\"color: rgb(51, 51, 51);\">赞助方介绍：</strong></p><p>	<span style=\"color: rgb(51, 51, 51);\">格兰富集团是一家全球领先的水泵产品及解决方案供应商。格兰富成立于1945年，总部设在丹麦边昂布市（Bjerringbro）。全球雇员约18,000人。在超过55个国家设有85家分公司。年产量超过1,600万台水泵装置。全球年销售收入260亿丹麦克朗（2017年）。</span></p><p>	<span style=\"color: rgb(51, 51, 51);\">格兰富公司成立70年来，始终专心致力于水泵及相关技术的研发，生产，并向市场提供全方位的解决方案。为提高生活品质，始终致力于倡导节能减排和可持续性发展，不断改善地球生存环境。</span></p><p>	<span style=\"color: rgb(51, 51, 51);\">格兰富公司1994年底进入中国以来，在中国的业务飞速发展。至2014年，在中国大陆地区已建立两家生产工厂，两家销售中心，一个研发中心。员工超过1,600名。年销售收入近29亿人民币（2017年）。</span></p><p>	<span style=\"color: rgb(51, 51, 51);\">附件一：科技类申报书及报告格式和社会实践类申报书及报告格式</span></p><p class=\"ql-align-right\">	<span style=\"color: rgb(51, 51, 51);\">教务处</span></p><p class=\"ql-align-right\">	<span style=\"color: rgb(51, 51, 51);\">实践教学中心</span></p><p class=\"ql-align-right\">	<span style=\"color: rgb(51, 51, 51);\">团委</span></p><p class=\"ql-align-right\">	<span style=\"color: rgb(51, 51, 51);\">能动学院</span></p><p class=\"ql-align-right\">	<span style=\"color: black;\">2021年3月23日</span></p><p><br></p>', 1, 'YFB', '教务处', '2021-03-25 00:04:00');
INSERT INTO `announcement` VALUES ('56042ddfd58a4d03911f270d42c6bb48', 40, '2021年秋季美国宾夕法尼亚大学学分项目选拔通知', 401, '<h1 class=\"ql-align-center\">2021年秋季美国宾夕法尼亚大学学分项目选拔通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-22<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;1545</span></h3><p class=\"ql-align-center\"><br></p><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021年秋季美国宾夕法尼亚大学学分项目选拔通知</strong></p><p>	依据我校发展国际化教育的方针和校际合作协议，为实施我校的教育国际化战略，培养具有国际视野和国际竞争力的高素质人才，鼓励我校学生出国（境）深造获得第二校园的学习经历，2021年秋季，我校将选拔优秀在校本科生前往<strong>美国宾夕法尼亚大学（University of Pennsylvania)</strong>，参加为期一学期的交流学习。</p><p>	<strong>项目报名截止时间：2021年5月3日</strong></p><p>	<strong>地点：美国宾西法尼亚大学，费城</strong></p><p>	<strong>项目时间：</strong>2021年9月-12月</p><p>	<strong>一、项目介绍</strong></p><p>	<strong>1.学校简介</strong></p><p>	宾夕法尼亚大学（University of Pennsylvania ），简称为宾大，位于宾夕法尼亚州的费城，是美国一所著名的私立研究型大学，八所常春藤盟校之一。宾夕法尼亚大学由本杰明·富兰克林创建于1740年，是美国第四古老的高等教育机构，也是美国第一所从事科学技术和人文教育的现代高等学校，一直秉承着她的创建者，本杰明.富兰克林的指导精神——开创、创新、发明、拓展和对知识的热爱。独立宣言的9位签字者和美国宪法的11位签字者与该校有关。</p><p>	宾大在艺术、人文、社会科学、建筑与工程教育上处于领先地位，其中最为知名的学科是商学、法学与医学。学校每年的建设投入达到4亿美元以上，在著名的常春藤盟校中名列前茅，始终位列美国和世界研究性大学的前十位。宾大的教授荣获过很多奖项，包括国家科学奖，诺贝尔奖，普利策奖，艾尔弗雷德.P. 斯隆基金奖和古根海姆基金奖。宾大在2020年US News大学综合排名中位列全美第6名。</p><p>	<strong>2.项目介绍</strong></p><p>	本项目（International Guest Student Program (IGSP)）由宾夕法尼亚大学主办，学生可在宾夕法尼亚大学进行一个学期的专业课学习，体验美国常春藤高校的学习氛围、教学资源及一流校园设施，享受宾大提供的专业课程指导，与宾大就读的美国及国际留学生交流，感受多元文化；</p><p>	学生可从该校文理学院、沃顿商学院、工程及应用科学学院选择专业课程，并获得宾夕法尼亚大学提供的官方成绩单，同时可申请获得名校教授推荐信，为将来申研助力；宾夕法尼亚大学文理学院提供学术课程和跨学科课程可供学生选修，选择范围广泛。</p><p>	<strong>3.选课及学分</strong></p><p>	学生可以从宾大的课程目录中选择4个课程单元（Course units），于2021年秋季学期进行一学期的专业学习。学生可在文理学院、沃顿商学院及工程与应学科学学院进行选择。有关2021年秋季学期选课列表，可登录以下链接查看：https://www.lps.upenn.edu/non-degree-programs/igsp/curriculum</p><p>	※注意：需提前查看选课列表，查询是否有与我校本专业2021年秋季学期培养方案相同或相近课程，如无相关课程仍坚持报名者，返校后学分可能不予认定和转换。</p><p>	4.<strong>项目费用</strong>（以下费用仅做参考，请以2021年秋季公布的最终费用为准）</p><p>	根据选课课程单元（course units）的不同，收取相应的学费及杂费，根据宾大的选课要求，须选择至少4个课程单元。根据所选课程所在学院的不同，2021年春季学费由17328</p><p>	美元到30023美元不等。</p><p>	申请费、国际机票、住宿、餐费、书本费、医疗保险（约315美金/学期）、签证费等其他费用自理。</p><p>	<strong>二、报名要求</strong></p><p>	1、仅限本校大一、大二年级本科生，成绩优异，学分成绩85分以上。道德品质好，在校期间未受过纪律处分，身心健康，能顺利完成在美学习任务；</p><p>	2、选拔专业：宾夕法尼亚大学文理学院、沃顿商学院、工程及应用科学学院相关专业学生；</p><p>	3、英语要求：TOEFL IBT 100，雅思7.0，多灵格英语测试120；</p><p>	4、家庭具有一定经济基础，能够提供访学所需学费及生活费。</p><p>	<strong>三、项目申请报名流程及所需材料</strong></p><p>	1、2021年5月3日前有意向且符合条件学生在西安交通大学外事服务平台<a href=\"http://org.xjtu.edu.cn/openplatform/login.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(30, 80, 162);\">http://org.xjtu.edu.cn/openplatform/login.html</a>完成报名；</p><p>	2、2021年5月5日前书院通过外事服务系统对报名人选进行审核；</p><p>	3、2021年5月6日前学院通过外事服务系统按要求完成初选审核；</p><p>	4、2021年5月7日前教务处通过外事服务系统对初选名单进行审核；</p><p>	5、2021年5月10日前国际处终审确定最终校级推荐人选，5月12日召开项目说明会；</p><ol><li>	所有有意向报名的同学尽快准备后续申请材料,包括：1）托福（须通过ETS寄送）或雅思官方纸质成绩单；2）西安交通大学英文成绩单；3）Application essays；4）推荐信（最多三封）。所有材料准备要求可参考以下网站：</li><li>	https://www.lps.upenn.edu/non-degree-programs/igsp/application</li><li>	<strong>四、项目管理</strong></li><li>	报名咨询：学院教务员</li><li>	学分转换政策咨询：学院、校教务处联系电话：82665477</li><li>	项目咨询管理：国际处闫老师办公地点：科学馆111室</li><li>	联系电话:029-82668236 E-mail:yanting@xjtu.edu.cn</li><li>	咨询时间：周一至周五工作日，下午工作时间：14:00-18:00（冬令时）、14:30-18:30（夏令时），双休、法定节假日除外，非工作时间请邮件咨询。</li><li>	<strong>注：所有同学完成在线报名后，需扫描报名系统内提供二维码加入项目管理微信群，后续项目相关通知将通过微信群即时通报，所有项目候选人务必及时进群。</strong></li><li>	<strong>五、离校手续</strong></li><li>	1、入选学生离校前填写《西安交通大学学生境外学习承诺书》；</li><li>	2、根据西安交通大学要求办理出访审批手续，出访审批手续办理请登录国际处主页“因公出境-校内审批”栏查看；</li><li>	3、参照《本科生赴国境外学习管理办法》（教务处主页“规章制度”栏查看）办理修读计划（与学院协商制定）、保留学籍、离校等手续。</li><li>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教务处</li><li class=\"ql-align-right\">2021年3月22日</li></ol><p><br></p>', 3, 'YFB', '教务处', '2021-03-25 00:05:25');
INSERT INTO `announcement` VALUES ('a0ea3d7bca2a458c99bf3e6ffbe805f9', 41, '关于启动2021年西安交通大学国家级、 省级“大学生创新训练项目”和“本科生科研训练和实践创新基金项目” 申报工作的通知', 401, '<h1 class=\"ql-align-center\">关于启动2021年西安交通大学国家级、 省级“大学生创新训练项目”和“本科生科研训练和实践创新基金项目” 申报工作的通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-16<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;6484</span></h3><p class=\"ql-align-center\"><br></p><p><span style=\"color: black;\">各学院（部）、中心及有关单位：</span></p><p>	<span style=\"color: black;\">为贯彻落实国家创新创业教育工作精神，深化高校创新创业教育改革，增强大学生的创新能力、实践能力和创业能力，提高人才培养质量。现决定启动我校2021年国家级、省级“大学生创新训练项目”和“本科生科研训练和实践创新基金”（以下统称“大创项目”）项目的立项申报工作，有关注意事项通知如下：</span></p><p><span style=\"color: black;\">一、申报对象</span></p><p>	<span style=\"color: black;\">1、项目申报人一般为我校全日制在校的大二、大三本科生，五年制可放宽至大四本科生，项目由所在学院配备指导教师进行指导；</span></p><p>	<span style=\"color: black;\">2、鼓励有国家级、省级大学生创新训练项目或西安交通大学本科生科研训练和实践创新基金项目经历的同学申报。</span></p><p><span style=\"color: black;\">二、申报要求</span></p><p>	<span style=\"color: black;\">1、大学生创新训练项目执行时间原则上为1年，特殊可执行2年，但不得超过申报学生的在校时间；</span></p><p>	<span style=\"color: black;\">2、每位学生参与大创项目不得超过2项（申请人身份不超过1项），指导老师应有中级以上职称，每位指导教师指导的大创项目不得超过2项；</span></p><p>	<span style=\"color: black;\">3、项目参与人须为本科生团队，每个团队人数以3～5人为宜，不可超过5人（不允许单独申报），团队组成鼓励学科交叉、跨专业联合，项目成员必须有明确分工；</span></p><p>	<span style=\"color: black;\">4、项目必须由学生根据兴趣自主选题，要求选题思路新颖、目标明确，具有创新性和探索性；</span></p><p>	<span style=\"color: black;\">5、大学生创新训练项目资助金额如下：</span></p><p class=\"ql-align-center\">类别</p><p class=\"ql-align-center\">理工医学类</p><p class=\"ql-align-center\">文史经管类</p><p class=\"ql-align-center\">国家级</p><p class=\"ql-align-center\">10000元</p><p class=\"ql-align-center\">6000元</p><p class=\"ql-align-center\">省级</p><p class=\"ql-align-center\">7000元</p><p class=\"ql-align-center\">4000元</p><p class=\"ql-align-center\">校级</p><p class=\"ql-align-center\">5000元</p><p class=\"ql-align-center\">3000元</p><p>	<span style=\"color: black;\">备注：以上为批准立项的平均金额。</span></p><p><span style=\"color: black;\">三、申报流程</span></p><p>	<span style=\"color: black;\">1、项目申请人需登录“大学生创新创业项目智能管理系统”（http://pts.xjtu.edu.cn:8081/），按照要求填写系统中各项内容，将“大学生创新创业训练计划项目申报表”（附件1）作为附件上传，提交指导教师签字纸质版申报表至学院管理员处，请申请人务必认真填写申报书内容，注意参与人员信息准确完整。</span></p><p>	<span style=\"color: black;\">2、学院组织专家进行项目评审，评审结果院内公示不少于3天，无异议后提交《西安交通大学大学生创新训练项目申请项目信息统计表》（附件2）电子版</span><a href=\"mailto:%E9%A1%B9%E7%9B%AE%E4%BF%A1%E6%81%AF%E7%BB%9F%E8%AE%A1%E8%A1%A8%E3%80%8B%E5%90%8C%E6%97%B6%E5%8F%91%E9%80%81%E8%87%B3%E9%82%AE%E7%AE%B1sjk@mail.xjtu.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: windowtext;\">至邮箱zzhang86@ xjtu.edu.cn</a>，纸质版<span style=\"color: black;\">统计表经教学院长签字，学院盖章后送至实践教学中心，截止日期4月12日。</span></p><p>	<span style=\"color: black;\">3、实践教学中心组织专家对学院申报项目进行评审，确定报送陕西省教育厅参评项目及项目资助金额。（报送项目纸质申报表提交时间另行通知）</span></p><p><span style=\"color: black;\">四、相关政策</span></p><p>	<span style=\"color: black;\">1、大学生创新训练项目采取动态考核机制，将综合中期、结题等考核综合考评进行升级、降级、淘汰；</span></p><p>	<span style=\"color: black;\">2、根据学校2021年人才培养工作的部署，请各学院认真组织，完成项目申报数量的指标，确保项目的质量以及学生创新能力培养的效果，该项工作的完成情况纳入各学院2021年人才培养绩效考核指标。</span></p><p>	<span style=\"color: black;\">联系人：张老师</span>&nbsp;<span style=\"color: black;\">联系电话：82668901</span></p><p>	<span style=\"color: black;\">办公室：工程坊A区515</span></p><p><br></p><p><br></p><p class=\"ql-align-right\">	<span style=\"color: black;\">实践教学中心</span></p><p class=\"ql-align-right\">	<span style=\"color: black;\">2021年3月15日</span></p><p><br></p>', 3, 'YSC', '实践教学中心', '2021-03-25 00:06:00');
INSERT INTO `announcement` VALUES ('4f7e149af7984906834a8e25e70f0016', 42, '关于2021年上半年全国大学外语四、六级考试报名的通知', 401, '<h1 class=\"ql-align-center\">关于2021年上半年全国大学外语四、六级考试报名的通知</h1><h3 class=\"ql-align-center\"><span style=\"color: rgb(35, 101, 168);\">信息来源：</span>&nbsp;<span style=\"color: rgb(35, 101, 168);\">发布日期:&nbsp;</span>2021-03-17<span style=\"color: rgb(35, 101, 168);\">浏览次数:&nbsp;20923</span></h3><p class=\"ql-align-center\"><br></p><p>	各学院、研究生院、城市学院，全体本科生：</p><p>	根据教育部考试中心决定，2021年上半年全国大学外语四、六级考试笔试（以下简称CET）和口试（以下简称CET-SET）将分别于6月12日、5月22至23日举行。现将考试报名工作有关事项通知如下：</p><p>	一、考试科目及时间</p><p>	1．笔试考试时间</p><p>	英语四级考试 9∶00—11∶20</p><p>	日语、德语、俄语、法语四级考试 9∶00—11∶10</p><p>	英语六级考试 15∶00—17∶25</p><p>	日语、德语、俄语六级考试 15∶00—17∶10</p><p>	2．口试考试时间</p><p>	英语四级口语考试（CET-SET4）考试时间为5月22日（F211次），英语六级口语考试（CET-SET6）考试时间为5月23日（S212次）。</p><p>	二、报名对象</p><p>	（一）CET报考资格</p><p>	1.修完大学英语四级课程的全日制在校本科生、在籍研究生和城市学院的学生可报考CET4；</p><p>	2.修完大学英语六级课程且CET4达到425分的学生方能报考CET6；</p><p>	3.我校不接收外校学生及我校往届已毕(结)业学生的笔试考试报名。</p><p>	（二）CET—SET报考资格为完成对应级别笔试科目报考的考生，即完成本次CET4笔试报名后可报考CET—SET4，完成本次CET6笔试报名后可报考CET—SET6。</p><p>	三、报名时间和方式</p><p>	（一）采用网上报名方式。</p><p>	（二）我省考生网报时间为3月23日14∶00至4月6日17∶00，报名工作分两个阶段进行。</p><p>	第一阶段时间为3月23日14∶00至3月25日14∶00，此阶段仅限于我校学生报名，且口试报名仅接受我校考生。</p><p>	第二阶段时间为3月25日14∶00至4月6日17∶00，此阶段为全省高校笔试考点报名时间，我校口试考点对全省考生开放，报满为止。</p><p>	（三）考生自行登录http://cet-bm.neea.edu.cn网址，点击相应栏目进行报名，完成用户注册、查证报名资格、个人信息确认、选择报考科目、网上缴费等报名手续。考生也可以下载、安装“CET”手机APP，同时完成报名及缴费。逾期不接受补报名。考生报名前和报名过程中须认真阅读并充分了解网站首页的考生须知、报名流程、常见问题、特别提示、最新动态及省通告、学校通告等信息。</p><p>	（四）因考位数有限，请及时网上报名。报名工作结束后，报名系统关闭，不再接受任何理由的补报名。</p><p>	（五）在校生笔试收费按照《陕价服函〔2018〕164号》规定执行，收费标准为每人每次20元；小语种四级、六级均为45元。口试收费标准全国统一为每人每次50元。</p><p>	（六）成功完成口试报名的考生于5月17日起登录报名系统自行打印准考证；成功完成笔试报名的考生于6月1日起登录报名系统自行打印准考证。</p><p>	四、成绩报告单</p><p>	本次考试，教育部考试中心试行电子成绩报告单，在成绩发布25个工作日后，考生可登录中国教育考试网（www.neea.edu.cn）查看并下载电子成绩报告单（小语种科目为电子证书），电子成绩报告单与纸质成绩报告单同等效力。</p><p class=\"ql-align-right\">	教务处</p><p class=\"ql-align-right\">2021年3月16日</p><p><br></p>', 2, 'WFB', '教务处', '2021-03-25 00:07:00');

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
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of applied_subject
-- ----------------------------
INSERT INTO `applied_subject` VALUES (32, '70b54e75790f4badbfef12af27c44a41', 52, '2021-03-25 01:04:33', '<p>请输入申请原因</p>', '9b51fbac55f94abf8ece8a7a88030311', 'YTG', NULL, 30, '2021-03-25 01:18:15');
INSERT INTO `applied_subject` VALUES (33, '33c06f19b35e421195fdf3527bc7336e', 53, '2021-03-25 01:07:01', '<p>请输入申请原因</p>', 'a501b63889df420f8d98b194e1e9d979', 'YTG', NULL, 31, '2021-03-25 01:19:08');
INSERT INTO `applied_subject` VALUES (34, '63cfe67ddf5d477da56ed03f95c5e33c', 54, '2021-03-25 01:07:39', '请输入申请理由', 'd72d50e0a25440cd8b3137f86207cc65', 'YTG', NULL, 32, '2021-03-25 01:19:50');
INSERT INTO `applied_subject` VALUES (35, '860eb13645a14b09b3a3b09c8a2bf942', 55, '2021-03-25 01:10:31', '请输入申请原因', 'd3425af8f4c04de687db12ca745dfcd8', 'YTG', NULL, 33, '2021-03-25 01:20:17');
INSERT INTO `applied_subject` VALUES (36, '8d794a4ebd5244ab9bfa4c4fc6b43ae9', 56, '2021-03-25 01:11:30', '请输入申请原因', '6ff45f662f8a4f50955c472990243af1', 'YTG', NULL, 34, '2021-03-25 02:01:20');
INSERT INTO `applied_subject` VALUES (37, '70b54e75790f4badbfef12af27c44a41', 57, '2021-03-25 01:12:27', '请输入申请原因', 'c34be6eb543b448a8e8ddd1c0c9cb5b2', 'YTG', NULL, 30, '2021-03-25 01:18:22');
INSERT INTO `applied_subject` VALUES (38, '33c06f19b35e421195fdf3527bc7336e', 58, '2021-03-25 01:13:01', '请输入申请原因', '09ca02fdc76445a59bc8462a667a0e87', 'YTG', NULL, 31, '2021-03-25 01:19:15');
INSERT INTO `applied_subject` VALUES (39, '63cfe67ddf5d477da56ed03f95c5e33c', 59, '2021-03-25 01:13:44', '请输入申请原因', '3df2aad51ccd4529b64107a6c886404d', 'YTG', NULL, 32, '2021-03-25 01:19:56');
INSERT INTO `applied_subject` VALUES (40, '860eb13645a14b09b3a3b09c8a2bf942', 60, '2021-03-25 01:14:10', '请输入申请原因', '6f813f4c2a15473292fe615288ddee8f', 'YTG', NULL, 33, '2021-03-25 01:20:22');
INSERT INTO `applied_subject` VALUES (41, '8d794a4ebd5244ab9bfa4c4fc6b43ae9', 61, '2021-03-25 01:14:47', '请输入申请原因', '77ecbfe548384955a32a2129361f3048', 'YTG', NULL, 34, '2021-03-25 02:11:29');
INSERT INTO `applied_subject` VALUES (42, '8d794a4ebd5244ab9bfa4c4fc6b43ae9', 62, '2021-03-25 01:15:38', '请输入申请原因', '903769d98de24befbcd30e31a9102372', 'YTG', NULL, 34, '2021-03-25 02:01:26');
INSERT INTO `applied_subject` VALUES (43, '70b54e75790f4badbfef12af27c44a41', 51, '2021-03-25 13:44:38', '请输入申请原因', 'f17f40cae3e849ae82c559d649573037', 'YTG', NULL, 30, '2021-03-25 13:46:06');
INSERT INTO `applied_subject` VALUES (44, '33c06f19b35e421195fdf3527bc7336e', 51, '2021-03-25 13:44:57', '请输入申请原因', '9b90f05f2f5a4f2cafbf631463b3a8d8', 'WTG', NULL, 31, '2021-03-25 13:47:34');

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
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_storage
-- ----------------------------
INSERT INTO `file_storage` VALUES ('abec385709e94861acd9f41c3c5c66ce', 157, '01-emmet语法使用.html', NULL, 1925, 'D:\\fileuploadtest', 0, 401, '2021-03-25 00:04:13');
INSERT INTO `file_storage` VALUES ('56042ddfd58a4d03911f270d42c6bb48', 158, '02-快速格式化代码.html', NULL, 436, 'D:\\fileuploadtest', 0, 401, '2021-03-25 00:05:32');
INSERT INTO `file_storage` VALUES ('a0ea3d7bca2a458c99bf3e6ffbe805f9', 159, '03-后代选择器.html', NULL, 1336, 'D:\\fileuploadtest', 0, 401, '2021-03-25 00:07:05');
INSERT INTO `file_storage` VALUES ('4f7e149af7984906834a8e25e70f0016', 160, '04-子元素选择器.html', NULL, 525, 'D:\\fileuploadtest', 0, 401, '2021-03-25 00:08:05');
INSERT INTO `file_storage` VALUES ('974dd0f539414e7a899a7de3fbc0dbc6', 161, '课题1说明.txt', NULL, 0, 'D:\\fileuploadtest', 0, 201, '2021-03-25 00:27:08');
INSERT INTO `file_storage` VALUES ('283e333cf5c2470d9aebb933a2a689ab', 162, '课题2说明.txt', NULL, 0, 'D:\\fileuploadtest', 0, 202, '2021-03-25 00:30:13');
INSERT INTO `file_storage` VALUES ('049b7788f0b746d19b459c211dcbd143', 163, '课题3说明 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 203, '2021-03-25 00:32:11');
INSERT INTO `file_storage` VALUES ('5ab4d0293ba0433db5ba5464b345490d', 164, '课题4说明.txt', NULL, 0, 'D:\\fileuploadtest', 0, 204, '2021-03-25 00:37:49');
INSERT INTO `file_storage` VALUES ('410ab7076d6a4515a41c55de70c423a4', 165, '课题5说明.txt', NULL, 0, 'D:\\fileuploadtest', 0, 205, '2021-03-25 00:40:16');
INSERT INTO `file_storage` VALUES ('9b51fbac55f94abf8ece8a7a88030311', 166, '学生2选题申请1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 102, '2021-03-25 01:04:44');
INSERT INTO `file_storage` VALUES ('a501b63889df420f8d98b194e1e9d979', 167, '学生3选题申请1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 103, '2021-03-25 01:07:10');
INSERT INTO `file_storage` VALUES ('d72d50e0a25440cd8b3137f86207cc65', 168, '学生4选题申请1 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 104, '2021-03-25 01:07:50');
INSERT INTO `file_storage` VALUES ('d3425af8f4c04de687db12ca745dfcd8', 169, '学生5选题申请1 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 105, '2021-03-25 01:11:03');
INSERT INTO `file_storage` VALUES ('6ff45f662f8a4f50955c472990243af1', 170, '学生6选题申请1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 106, '2021-03-25 01:11:39');
INSERT INTO `file_storage` VALUES ('c34be6eb543b448a8e8ddd1c0c9cb5b2', 171, '学生7选题申请1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 107, '2021-03-25 01:12:33');
INSERT INTO `file_storage` VALUES ('09ca02fdc76445a59bc8462a667a0e87', 172, '学生8选题申请1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 108, '2021-03-25 01:13:09');
INSERT INTO `file_storage` VALUES ('3df2aad51ccd4529b64107a6c886404d', 173, '学生9选题申请1 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 109, '2021-03-25 01:13:51');
INSERT INTO `file_storage` VALUES ('6f813f4c2a15473292fe615288ddee8f', 174, '学生10选题申请1 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 110, '2021-03-25 01:14:16');
INSERT INTO `file_storage` VALUES ('77ecbfe548384955a32a2129361f3048', 175, '学生11选题申请1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 111, '2021-03-25 01:14:57');
INSERT INTO `file_storage` VALUES ('903769d98de24befbcd30e31a9102372', 176, '学生12选题申请1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 112, '2021-03-25 01:15:47');
INSERT INTO `file_storage` VALUES ('eae5b736afa54e89b1313e17387e898b', 177, '任务1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 201, '2021-03-25 01:34:55');
INSERT INTO `file_storage` VALUES ('1e271679ba4947569d6ce49f6689659b', 178, '任务2.txt', NULL, 0, 'D:\\fileuploadtest', 0, 201, '2021-03-25 01:36:18');
INSERT INTO `file_storage` VALUES ('22e88218e5db47b4a461decc678abd60', 179, '任务3 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 201, '2021-03-25 01:36:35');
INSERT INTO `file_storage` VALUES ('fa114d94644246309794043084f78048', 180, '学生-任务1提交1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 102, '2021-03-25 01:38:33');
INSERT INTO `file_storage` VALUES ('eb65280cbe42466da18c96d32165ef66', 181, '学生-任务1提交2.txt', NULL, 0, 'D:\\fileuploadtest', 0, 102, '2021-03-25 01:39:06');
INSERT INTO `file_storage` VALUES ('934a51c612234ae4b905da789b6cfda9', 182, '学生-任务1提交3 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 102, '2021-03-25 01:41:08');
INSERT INTO `file_storage` VALUES ('5756a1fdc28d4126a3edfcb5290de749', 183, '学生-任务1提交4.txt', NULL, 0, 'D:\\fileuploadtest', 0, 102, '2021-03-25 01:41:31');
INSERT INTO `file_storage` VALUES ('2e39a9ddb11d43388fcca07586f0d097', 184, '学生-任务1提交5.txt', NULL, 0, 'D:\\fileuploadtest', 0, 102, '2021-03-25 01:41:49');
INSERT INTO `file_storage` VALUES ('e5be494fe63e445badae4f1497c9748f', 185, '学生-任务2提交1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 102, '2021-03-25 01:45:44');
INSERT INTO `file_storage` VALUES ('cf9db0e5551842898014434a2b5254c5', 186, '学生-任务2提交2 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 102, '2021-03-25 01:47:11');
INSERT INTO `file_storage` VALUES ('42f5910069bc400ca55b3c08782df947', 187, '学生-任务3提交1.txt', NULL, 0, 'D:\\fileuploadtest', 0, 102, '2021-03-25 01:51:29');
INSERT INTO `file_storage` VALUES ('a489b9dd4cb7434da3ff1b276ea40bc5', 188, '学生3开题报告 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 103, '2021-03-25 02:15:39');
INSERT INTO `file_storage` VALUES ('51f3a00135754b78b5d5c903772a44d4', 189, '学生3中期报告.txt', NULL, 0, 'D:\\fileuploadtest', 0, 103, '2021-03-25 09:18:37');
INSERT INTO `file_storage` VALUES ('c10ef54e084c48f58e7f7fd4d9cf1742', 190, '学生3毕业论文 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 103, '2021-03-25 09:21:40');
INSERT INTO `file_storage` VALUES ('247fa02e2c664e7cbef850311b8a66db', 191, '学生4毕业论文 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 104, '2021-03-25 09:24:03');
INSERT INTO `file_storage` VALUES ('null', 192, '学生5毕业论文.txt', NULL, 0, 'D:\\fileuploadtest', 0, 105, '2021-03-25 09:25:29');
INSERT INTO `file_storage` VALUES ('86675fa31c344f07aabf2e72a7350cf5', 193, '学生5毕业论文.txt', NULL, 0, 'D:\\fileuploadtest', 0, 105, '2021-03-25 09:27:58');
INSERT INTO `file_storage` VALUES ('898f9c108e2c4d40908d8629baa7b462', 194, '学生6毕业论文.txt', NULL, 0, 'D:\\fileuploadtest', 0, 106, '2021-03-25 09:28:51');
INSERT INTO `file_storage` VALUES ('3d9b79a71573470099d408ee3417b098', 195, '学生7毕业论文.txt', NULL, 0, 'D:\\fileuploadtest', 0, 107, '2021-03-25 09:29:45');
INSERT INTO `file_storage` VALUES ('fdf39a2af7794c7783641fb1a47a87e8', 196, '学生8毕业论文.txt', NULL, 0, 'D:\\fileuploadtest', 0, 108, '2021-03-25 09:30:20');
INSERT INTO `file_storage` VALUES ('fdaa7c26ced84478b22b5a9004287b39', 197, '学生9毕业论文.txt', NULL, 0, 'D:\\fileuploadtest', 0, 109, '2021-03-25 09:31:09');
INSERT INTO `file_storage` VALUES ('f7554133f22f4945b3e5da84fe54df67', 198, '学生10毕业论文 .txt', NULL, 0, 'D:\\fileuploadtest', 0, 110, '2021-03-25 09:32:43');
INSERT INTO `file_storage` VALUES ('d2122a11eeae4a27ad5a7836e28e15dd', 199, '课题1说明.txt', NULL, 0, 'D:\\fileuploadtest', 0, 206, '2021-03-25 13:38:32');
INSERT INTO `file_storage` VALUES ('d2122a11eeae4a27ad5a7836e28e15dd', 200, '课题6说明(演示).txt', NULL, 0, 'D:\\fileuploadtest', 0, 206, '2021-03-25 13:38:32');
INSERT INTO `file_storage` VALUES ('51a4f1eddbae4adc87e2c34bd6fff877', 201, '任务4 (演示).txt', NULL, 0, 'D:\\fileuploadtest', 0, 201, '2021-03-25 13:51:43');
INSERT INTO `file_storage` VALUES ('d44d905cf7954c6098f745dadd6ce5c8', 202, '学生-任务4提交1（演示） .txt', NULL, 0, 'D:\\fileuploadtest', 0, 101, '2021-03-25 13:52:53');
INSERT INTO `file_storage` VALUES ('236c9dc7dadd439ab5d97dff58c73c07', 203, '学生2毕业论文(演示).txt', NULL, 0, 'D:\\fileuploadtest', 0, 102, '2021-03-25 14:04:06');

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
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 20:08:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher2', '2021-03-23 20:17:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher3', '2021-03-23 20:24:19', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-23 20:28:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-23 20:35:32', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student3', '2021-03-23 20:36:37', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student4', '2021-03-23 20:37:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 20:38:28', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student6', '2021-03-23 20:39:18', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 20:40:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher2', '2021-03-23 20:43:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 20:48:56', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher3', '2021-03-23 20:53:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-23 20:54:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-23 21:01:38', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 21:02:11', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 21:07:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 21:12:44', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 21:13:56', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 21:15:13', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 21:16:17', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 21:37:37', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 21:38:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student7', '2021-03-23 21:44:33', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 21:49:09', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student7', '2021-03-23 21:49:49', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 21:51:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 22:02:21', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 22:07:19', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 22:10:26', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student7', '2021-03-23 22:11:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 22:13:00', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student7', '2021-03-23 22:13:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 22:36:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-23 23:06:47', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 23:08:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 23:09:21', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 23:09:57', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 23:10:41', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 23:12:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 23:13:39', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 23:15:52', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 23:20:48', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 23:27:57', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-23 23:36:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 23:38:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-23 23:45:28', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 00:21:43', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 00:24:27', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec6', '2021-03-24 00:28:13', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 00:28:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec6', '2021-03-24 00:29:32', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-24 00:30:29', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 00:30:53', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec6', '2021-03-24 00:31:30', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 00:38:05', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 00:40:22', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec6', '2021-03-24 00:40:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-24 08:48:02', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-24 08:48:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 08:51:22', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 09:10:39', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 09:11:06', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 09:27:12', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 09:30:08', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 09:32:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 09:41:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 10:12:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 10:20:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 10:22:04', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 10:22:43', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 10:23:49', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 10:24:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec4', '2021-03-24 10:24:30', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 10:24:47', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 10:26:38', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 10:28:36', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec4', '2021-03-24 10:32:34', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 10:33:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 10:38:28', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 10:38:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 10:39:03', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 10:56:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 11:00:17', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 11:00:26', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 11:00:40', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec4', '2021-03-24 11:00:49', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 11:13:32', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-24 11:32:22', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec2', '2021-03-24 12:00:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 13:16:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 13:18:32', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 13:40:02', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 13:48:33', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 13:48:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 13:53:48', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 14:06:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 14:07:12', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 15:30:30', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-24 15:36:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 15:47:21', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 15:47:38', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 16:07:01', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 16:08:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-24 16:09:38', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student3', '2021-03-24 16:09:57', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student4', '2021-03-24 16:10:31', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student6', '2021-03-24 16:11:00', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student7', '2021-03-24 16:16:20', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student6', '2021-03-24 16:19:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 16:19:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student4', '2021-03-24 16:20:30', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student3', '2021-03-24 16:20:59', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-24 16:21:42', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 16:22:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 16:22:48', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher2', '2021-03-24 16:25:29', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher3', '2021-03-24 16:27:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 16:30:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec2', '2021-03-24 16:33:11', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 16:33:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec4', '2021-03-24 16:48:16', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-24 17:07:58', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 17:42:31', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec2', '2021-03-24 17:43:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 17:44:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 17:51:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-24 17:53:27', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student3', '2021-03-24 17:54:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student4', '2021-03-24 17:54:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 17:55:20', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 17:56:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student6', '2021-03-24 17:57:05', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student7', '2021-03-24 17:57:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 17:59:13', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 17:59:13', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher4', '2021-03-24 18:25:56', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher10', '2021-03-24 18:27:06', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student3', '2021-03-24 18:27:52', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-24 19:09:03', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 19:42:58', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-24 19:57:00', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 20:02:47', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec1', '2021-03-24 20:03:04', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 20:03:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 20:04:05', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 20:05:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-24 20:07:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-24 20:07:11', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-24 20:07:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-24 20:14:57', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 21:00:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('stu1', '2021-03-24 21:03:32', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 23:45:43', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-24 23:46:03', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-24 23:46:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-24 23:46:34', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec1', '2021-03-24 23:46:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-24 23:47:40', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher2', '2021-03-25 00:27:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher3', '2021-03-25 00:30:31', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher4', '2021-03-25 00:36:34', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher5', '2021-03-25 00:38:53', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-25 00:53:53', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-25 01:03:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student3', '2021-03-25 01:05:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student4', '2021-03-25 01:07:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student4', '2021-03-25 01:08:03', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-25 01:08:18', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student6', '2021-03-25 01:11:17', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student7', '2021-03-25 01:12:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student8', '2021-03-25 01:12:46', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student9', '2021-03-25 01:13:20', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student10', '2021-03-25 01:14:02', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student11', '2021-03-25 01:14:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student12', '2021-03-25 01:15:22', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher2', '2021-03-25 01:18:47', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher3', '2021-03-25 01:19:38', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher4', '2021-03-25 01:20:06', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher5', '2021-03-25 01:20:32', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher6', '2021-03-25 01:25:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-25 01:29:41', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-25 01:30:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-25 01:31:18', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher5', '2021-03-25 02:00:51', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-25 02:01:39', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-25 02:02:00', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-25 02:03:12', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student3', '2021-03-25 02:13:20', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher2', '2021-03-25 02:15:03', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-25 09:03:32', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-25 09:03:45', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-25 09:04:00', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-25 09:04:17', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec1', '2021-03-25 09:04:30', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student3', '2021-03-25 09:17:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher2', '2021-03-25 09:17:39', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student4', '2021-03-25 09:22:56', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-25 09:24:16', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student6', '2021-03-25 09:28:29', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student7', '2021-03-25 09:29:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student8', '2021-03-25 09:29:56', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student9', '2021-03-25 09:30:36', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student10', '2021-03-25 09:31:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-25 09:33:53', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher2', '2021-03-25 09:34:33', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher3', '2021-03-25 09:35:39', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student4', '2021-03-25 09:36:33', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher4', '2021-03-25 09:36:44', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student5', '2021-03-25 09:37:23', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher5', '2021-03-25 09:37:50', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-25 13:26:24', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('office1', '2021-03-25 13:26:44', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-25 13:26:55', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-25 13:27:16', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec1', '2021-03-25 13:27:27', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher6', '2021-03-25 13:36:35', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-25 13:45:14', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher2', '2021-03-25 13:47:13', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher1', '2021-03-25 13:48:25', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-25 13:48:38', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-25 13:52:10', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student2', '2021-03-25 13:54:26', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('sec6', '2021-03-25 14:01:43', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('teacher2', '2021-03-26 16:23:04', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('student1', '2021-03-26 16:26:53', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-03-30 19:59:38', NULL, '127.0.0.1');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('002f17288fd04934a828a197033efa0e', 401, 113, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('006137932fb14ec0a8e5997fbd59125c', 205, 106, '中期成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的中期成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:38:24');
INSERT INTO `message` VALUES ('00a88f46f8d54241b50870a521391a61', 401, 102, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('00f3f71eb81d457cb93bd353218548ce', 103, 103, '结题答辩申请通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交结题答辩申请，请及时前往相关页面进行批复。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:21:29');
INSERT INTO `message` VALUES ('01e692895420406783c1705665f05741', 401, 109, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('01e7f3f7b68346b5aeed03d96a1eb5c1', 201, 401, '出题审核通知', 'YCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:26:29');
INSERT INTO `message` VALUES ('02702af97a33477a8f9aa4ccdc10ab4f', 202, 103, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:19:08');
INSERT INTO `message` VALUES ('02826eace09a431081c7012f7d023f1c', 20, 118, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('02f899087fbb4d02989c9a6284512fc4', 401, 207, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('0316a6fd49294d319e6f0d11d1d6611f', 202, 402, '出题审核通知', 'WCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:30:02');
INSERT INTO `message` VALUES ('035c1194d87c49c884f2838e3dfbcef5', 401, 113, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('03d4f41d0c9e4ba790eb39b6542ce200', 401, 110, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('03f9fe3b9dbf4c919c4ca388849543ba', 20, 205, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('053cf5716a1d438b904c60b179f7bdd6', 401, 111, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('05968926d4ee4eb091af44696dbfb59c', 401, 202, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('05b1c9b2d3774d8493538830794ad354', 104, 203, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:07:39');
INSERT INTO `message` VALUES ('05cf192363d1461789496fa8d47a2ca5', 20, 402, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('05fd279f843745c89804b98e70826947', 201, 101, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:46:06');
INSERT INTO `message` VALUES ('06250828673b4fed84b173d8bc9c720b', 401, 108, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('064988609bdd4412bbfcb7420e4421d5', 203, 109, '中期成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的中期成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:36:06');
INSERT INTO `message` VALUES ('067d9065a81f4c6ca593cdc1fc6b35c1', 401, 115, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('06ab836cd04d4a84bce56a07bfb2290e', 401, 102, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('073bf8405ec147e3a1253d94e4558a8b', 201, 102, '中期成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的中期成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:04:45');
INSERT INTO `message` VALUES ('07f04c3303bd4a50841ff68dd2a3da54', 401, 203, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('08105dbbd2ac40afb35ff9569f3cf1ce', 401, 301, '阶段变更通知', 'YCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('081b6eccb59e442a9f675d459a92607e', 401, 205, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('08260b0e6890421a94b3a5ad8f3ecf8c', 401, 203, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('086213d679184013b578e5488958490d', 401, 118, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('08d3abfc48904078934025187b544430', 401, 117, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('0967b858c1f84aa09485a38b70c82857', 201, 102, '阶段任务通知', 'YCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您有新的阶段任务，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:34:38');
INSERT INTO `message` VALUES ('098646705eb04ea29b5cab3d7b4251bb', 401, 115, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('0a7a6295253048e9b4a5fce285aa0357', 202, 108, '中期成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的中期成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:35:30');
INSERT INTO `message` VALUES ('0a85a1d89a00413aae94aa7d8b4eab47', 401, 301, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('0b89cabc1e184c6a87204d5a2d72cf36', 401, 208, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('0bc18e528ed649e48c3913a35daab364', 401, 209, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('0c8e9aced3594243b822b1779c9eac58', 401, 106, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('0c92ce0cf52f4cefae5b0eca5d4fa778', 401, 116, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('0d790203be6a40f48663b9ccb31f96de', 20, 106, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('0da771935dcb48c7ad1563f6946f8a87', 401, 110, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('0db92653ae444cafa76bb8c240e2132a', 401, 102, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('0dc9f12d86bd4b77b589acc183c4723f', 401, 205, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('0dd2efd55dd04bbb9d791c4c8aa31bd3', 204, 105, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:20:17');
INSERT INTO `message` VALUES ('0ddbb831238f41fbb6e9b2d327e9f82f', 401, 108, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('0dde684cd5d547a88b340a1c4f4b6026', 401, 208, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('0dfed046e053420983e467cc9abbe930', 401, 112, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('0e989ca7379c4944b035d96ea0857e13', 401, 401, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('0ef0c84b87824624b0e9be4c94c8aeb5', 401, 104, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('0fa7b85d6d664e8d8dc83dcd200bcc37', 401, 305, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('0fd8fb5a7a694823b42ba6cfb6a50e3b', 401, 102, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('1032d287c0e045e2bfc54d3e2ff0d181', 401, 116, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('11b1e36425e541a1981af87f302bcc2d', 101, 205, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:02:41');
INSERT INTO `message` VALUES ('11d6e3a560b4489782588558fe5cf729', 205, 402, '出题审核通知', 'WCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:40:10');
INSERT INTO `message` VALUES ('121eff3c316f449188905a3aeab3daf1', 401, 102, '阶段变更通知', 'YCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('12dbfb3e872f4d6ba16c7a07f5109182', 102, 201, '阶段任务通知', 'YCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交了阶段任务成果，请及时前往相关页面进行查看评分。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:45:30');
INSERT INTO `message` VALUES ('13ae5f2b56b54d49bec3001521ae03c3', 401, 104, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('13f87d33b9c04908a1e3b9b34738b814', 401, 106, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('14133c9a927241ebbf1fe25cfc242a07', 401, 112, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('144bef3223374a57870f75b79ea6ec6c', 401, 112, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('155bbb50f1f4428595936fbb5dd481c0', 401, 402, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('160a0a24de214e07ad6754920d21b0a7', 201, 102, '阶段任务通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的阶段任务提交已经被老师批复，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:51:57');
INSERT INTO `message` VALUES ('16225ff3b40d4ceeab062e4ce0374b44', 401, 102, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('16a73c6014294fd181d5d7d235b803f4', 101, 205, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:43:34');
INSERT INTO `message` VALUES ('16c669fecfd24de7b371e344317a54e9', 203, 401, '出题审核通知', 'YCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:32:03');
INSERT INTO `message` VALUES ('16cc0956394b4287be9bf356433dad70', 401, 205, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('1810c22b40e14b9e9aa442509ff1a34b', 401, 106, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('182e7d868dbb466ba490cbfb1847b6ba', 20, 111, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('185a79fa8cad46b2bd8c5f963989738a', 401, 304, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('18af08f55efa4b18b9d5c4003a11f703', 401, 208, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('18af97c63d7c4b5c82210e1e9d0a104f', 106, 205, '选题通知', 'YCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:11:30');
INSERT INTO `message` VALUES ('18dbbd7aa7ec458686474f722386992a', 401, 302, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('190d8bcb1c704ac0ba819558c3969fa2', 401, 107, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('195822c4c17541e3b1b946bbf4d28d9b', 401, 105, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('19ed243169b0461388d56548ef4e24fb', 401, 115, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('1a9ef9f0be2a4fdbb052298d87bea766', 401, 119, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('1ac50981e9b44cefb670806ca9a6c06c', 401, 110, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('1c891841b2064b429d2b3946ffd83f2f', 205, 106, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:01:20');
INSERT INTO `message` VALUES ('1cafcae56b87402e9f278bb76bfbc0fd', 401, 120, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('1cd9bc087acc43608a4ef8e691664ae2', 401, 306, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('1d3c855ba94c4dd5b8c8387405d2b95d', 401, 206, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('1e073fb9d3504e8da257c8558200b6a0', 401, 110, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('1e93be295876422499473e3599830a85', 101, 205, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:02:10');
INSERT INTO `message` VALUES ('1f8a0917f99d4467bb7c108945436fe7', 401, 302, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('1ff84c6b5a4042d2a56bc3509e0fd061', 401, 305, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('216f6df72cb04f58a11697ce80c275b8', 201, 101, '阶段任务通知', 'YCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您有新的阶段任务，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:51:31');
INSERT INTO `message` VALUES ('224c1755f4e3478c804c896578340753', 401, 301, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('226faacc168e4f0d87ce3e24062dcd42', 401, 111, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('228bc7bce6da4ceeae747f11d69611b8', 401, 102, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('22acb2cfc4e749199dfa5a928a27f64f', 401, 208, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('22d7e88c73104c5daac05d000f9a4b69', 105, 204, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:10:31');
INSERT INTO `message` VALUES ('241ddb66e214434fb457f1a475896110', 401, 306, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('2437e182820343e1a71af82687e75906', 401, 109, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('24c7f8293b3b4f9b8babfd6b707dc003', 401, 210, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('2537f12951824f4db7417fe8c13b6e42', 102, 201, '选题通知', 'YCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:04:33');
INSERT INTO `message` VALUES ('259b4c88c9f34c77bf05bc1719c979aa', 106, 106, '结题答辩申请通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交结题答辩申请，请及时前往相关页面进行批复。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:28:45');
INSERT INTO `message` VALUES ('25fb0c2403114efda323e5bf20042daa', 205, 106, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:24:07');
INSERT INTO `message` VALUES ('264cdb7c3d27437ab38215accfd3c65c', 203, 104, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:19:50');
INSERT INTO `message` VALUES ('264d75f66125413686d28a8340921389', 205, 111, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:25:07');
INSERT INTO `message` VALUES ('26a9cc4a9a404028b13386fe333f2499', 401, 102, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('26b116944f504d8cb6b61afaf0a85222', 401, 106, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('277c793667094ceba130e5a4ae35b55c', 20, 209, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('28750c2b69494d9e990c1c1eff96ac42', 401, 201, '阶段变更通知', 'YCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('28e3cdb3a2c5444ebb0316f3cd0527e4', 401, 110, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('299975e42b48425abacb080b12fc07e2', 401, 402, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('29e8dd3e84754ff594267435f20aa0b9', 205, 111, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:13:47');
INSERT INTO `message` VALUES ('2a239f314663418d964dfa50c930e0c5', 401, 110, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('2a885d1e9fce46f4b1e0ce357a239aea', 401, 306, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('2abee2afe43440eeaa02e6685c77acfd', 401, 210, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('2ac599d2c8a44ba79ec7f6dc2af3a93c', 101, 205, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:02:19');
INSERT INTO `message` VALUES ('2ad9543a1e894a81bd7edd050eed2e9f', 20, 107, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('2b4ef61e84fc4f8eafc6a2c3b7ffa858', 20, 117, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('2c57931b8dec447c98bffb55caa9d6ff', 205, 106, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:21:50');
INSERT INTO `message` VALUES ('2f22649f441147a9bbc4d79d2d7f6cd7', 20, 105, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('2f2ced80028c48c997f8ac0db27c1cbb', 201, 102, '阶段任务通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的阶段任务提交已经被老师批复，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:50:42');
INSERT INTO `message` VALUES ('2f5d9ee7224d4268a6ec8d0beaf1cbda', 401, 301, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('306018db0369418795a49500514198bf', 102, 205, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:10:54');
INSERT INTO `message` VALUES ('317de834ecd4460eb79e26e1366c1a62', 401, 206, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('317f7c2a1a124fc282bcb1a36fab5742', 401, 301, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('3183e8d0bd2f4921b8a63578d17db9bf', 204, 110, '中期成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的中期成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:37:00');
INSERT INTO `message` VALUES ('31f412d410e34e89a8f535996a839c2d', 401, 117, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('324098ed18a8471a8eae52da89c69751', 109, 109, '结题答辩申请通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交结题答辩申请，请及时前往相关页面进行批复。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:31:03');
INSERT INTO `message` VALUES ('3288bbd87c53434c8ad325f52180ebfa', 20, 114, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('330b4329e0584111be80ebf0fd10afc9', 20, 103, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('330e7d7e231f4f888e40efea00eaba15', 401, 108, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('3349a8db84e84c40b34ad68264bf6f72', 401, 208, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('339c370bb84c49e9a7b9be57ab6663f0', 401, 306, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('341a6eee0970497aaf55e8c931113f72', 401, 109, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('35cb8df434ea433ea403877acdd5013c', 401, 119, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('360aed32d207405eaa9ad80542270591', 20, 102, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('36e5012a7d3f4d159c2181baabdb3d48', 401, 116, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('38d6a46841754a7ab206baea1a4dc556', 401, 402, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('3a9d103175fd4be3a7210c2e5fafb75c', 401, 302, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('3b3fe1a15c6b431d967378a7cd91ea86', 401, 303, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('3b6c4d7c112f45d3b2e2dc9cfa0f9ff4', 401, 116, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('3be8dc83d5ff4306b00e48d05b060734', 401, 112, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('3c7d98f1662c4c0fb6f3844b62e18d43', 401, 306, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('3c8dfcbb7d1b4a4198c054e90d2f4fdb', 401, 112, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('3e8d80f65cd340c6828bdb75cb68826a', 401, 205, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('3eafecd6a93542a2b6613b89b84ff6be', 401, 401, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('3ec47dee85c24e288f079f139ca7fb17', 401, 119, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('3f1f09cceebf4b32b6f505258d59c7b2', 401, 201, '课题审核通知', 'YCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题出题状态已经更新，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:51:32');
INSERT INTO `message` VALUES ('3f62213e048149af9ef7d66e80bebd0c', 401, 301, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('3fb26d09dc6147f5aebaabc80bf49816', 401, 106, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('3fb5414956074869aae5793973466573', 205, 111, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:11:29');
INSERT INTO `message` VALUES ('4062180b7fcf48999b2a3975d5010093', 401, 103, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('41c293d40c42439abc01943dbdf3bcd1', 401, 115, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('4321f3044acd4304a1da2ee46f6a1ab4', 401, 118, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('43b0b859f1b149ddae743ee7d1dc130a', 401, 306, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('43b9d1f2100848edac69cedf80c05f89', 401, 401, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('43eca2597e88454f912f2d8aaa410236', 204, 402, '出题审核通知', 'WCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:37:40');
INSERT INTO `message` VALUES ('449202aa82d648fa8c3e6e18dafff100', 401, 106, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('44e2ce6d97ad485d808facc510016199', 401, 209, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('45b1a6db7f8e4cf9877db2c85f6fd245', 401, 120, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('4659dd438c5b4298adb983675b7bacf7', 20, 208, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('4676c957679141ebbe273d518f9a1578', 401, 108, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('468d7d3ed1424fe6bd85893fb2eb5dad', 401, 113, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('47f6ddffd8c54b0fa9cf09d24ffa7300', 401, 105, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('4833ed105256429d83ebc46c977d33f8', 401, 118, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('48646257e59e4889868d7bf3a2f8ffc8', 401, 202, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('486c055052784045ac77bdde619ac4a7', 401, 305, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('48c20bb708a44b90b7d309b401701329', 401, 207, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('48c974cc78fe477bae58c50756ac4733', 401, 105, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('4a75012922fb4d0d983d8c645af449da', 201, 107, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:18:22');
INSERT INTO `message` VALUES ('4ab0a4541442448bbb0a73ec615759c1', 401, 401, '阶段变更通知', 'YCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('4ad658d689f7478e9f7a11ffa4f5b5f4', 401, 203, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('4b30408a59344c58a617d703aa3b67e9', 401, 115, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('4b6ec651efa14163a7d274e1123a7975', 109, 203, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:13:44');
INSERT INTO `message` VALUES ('4b6fcf5e28634a479993fd5cf8420fda', 401, 106, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('4b87fc1d34ee4c4a80d6c5d8335f3e76', 401, 112, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('4cc03574931b484a9fed34ca99851fec', 401, 304, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('4cc7174f889d44b0b1a01405ab273269', 401, 302, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('4d0be98de3af47088900a5b67efd1d82', 401, 112, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('4e37f0d16977432eb8b98b2c88547adf', 401, 304, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('4f0d94be327e447bb41cd7f224557d7d', 401, 117, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('4ff746a54e6c456092a9660ea9cab275', 401, 106, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('4ffbf397ed7e4afca0e8b4954d9d6d45', 401, 206, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('5058676b2a63451faf23353eff14f6a7', 401, 120, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('5071169f9e4f4d2f91acfe29db193892', 401, 119, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('50edade27dcc47419892035b28e14ad0', 401, 204, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('51200a0870164e99b396f1f7241ca3ac', 401, 207, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('5164ea51180d4b7b9ca43a3093643a10', 401, 402, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('51e6c97ad0f24685a387fe45d1261b7b', 401, 101, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('5293457f82024f27b8f47de5c3132310', 401, 102, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('537cee1ced624440bd62116a11591613', 401, 114, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('53aa9075313b4581aefbe3af372a121d', 401, 112, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('5402f142ad5c4ffb8bc03f37b1a83ce8', 401, 108, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('543bc5b5ae9b4e35840c3a7df837cdc2', 401, 111, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('54cf17b2951d4f079a1c75a952a35e5a', 401, 114, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('55008c0945304e9b94c36f048062bacc', 105, 105, '结题答辩申请通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交结题答辩申请，请及时前往相关页面进行批复。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:27:50');
INSERT INTO `message` VALUES ('5548664b9b784e8bac2b98563a6cf33e', 401, 209, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('559d634f122b445990641a5c16bc3ec9', 401, 118, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('55de883698254dea91269b7061c96331', 401, 108, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('586cfd751c384b11878b777f11c879f1', 401, 304, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('59d3c00a4f6c4a10931019aba10a2928', 401, 206, '课题审核通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题出题状态已经更新，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:40:05');
INSERT INTO `message` VALUES ('5a62f034cbca44028746938410236101', 20, 303, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('5a9ca347c78244b9a5c35814f26115e6', 101, 201, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:44:38');
INSERT INTO `message` VALUES ('5b35901c26fd4f86979af7306fa30abc', 203, 402, '出题审核通知', 'WCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:32:03');
INSERT INTO `message` VALUES ('5c046d3d859647e09f857353dad854b0', 401, 201, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('5c659e09a4a342519e7896ed7cb31a56', 401, 113, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('5c874bf8c2f84ae9834f2129dbe1255d', 401, 107, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('5d052e03dc7d4a839b6b1a973e371b94', 401, 117, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('5d663f7622654c53aab5f6fc39b7deab', 202, 103, '中期成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的中期成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:22:25');
INSERT INTO `message` VALUES ('5d9606a47fbd45f6a8415a8b7a7fde50', 20, 204, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('5e5abbbf62ce4cd4a1d32558bb76dd9e', 401, 107, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('5e927791b8aa4968b21d2604bc428927', 401, 109, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('5ebdba186d0c4242bc9d3be4d4195fcc', 201, 101, '阶段任务通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的阶段任务提交已经被老师批复，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:53:31');
INSERT INTO `message` VALUES ('5f9670f7a32a4b24b9b9147f1e6fecfa', 401, 118, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('5faabcc6d2b54c78b2bc39597c5cabae', 401, 107, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('5fe446ea5678482bb12bb33c238304d9', 401, 103, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('6063f1b898db4a6188044fb61587b8ce', 401, 207, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('6069696288be42399e982b740cd976ef', 401, 105, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('6095ad2857644061b1fae9646155aa1b', 401, 208, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('61ce7693817c47a9894c5bde8ac20098', 401, 210, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('621ed6c30c2c431aa4f23b5b889a03a4', 20, 120, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('6400cdcb419b4d47aeb40f869fce9a6d', 201, 402, '出题审核通知', 'WCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:26:29');
INSERT INTO `message` VALUES ('643fe806c9ae4045bfce89301cf4c339', 401, 303, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('65503e32cdcf4ff1a215bd84fcf20b57', 204, 110, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:20:22');
INSERT INTO `message` VALUES ('656cae88a3434fc582b7874c8fe7b857', 401, 107, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('670d5178a6be4dc89c48473ecb1efb73', 201, 107, '中期成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的中期成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:34:23');
INSERT INTO `message` VALUES ('6854e9a2c7814f57a964dc6b7dd2207c', 401, 208, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('69c6233a56254ec38fa200f8e07d208c', 401, 110, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('6a2a31bbf1d54bea8887affc4b1b3561', 401, 202, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('6abc32816fa74722ae7aac8a99a21278', 401, 120, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('6b6ed40fd2774bd49be79a76091fef85', 20, 104, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('6b821fec109941a4ae09f973406e985d', 401, 204, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('6be3114ab86547a6b9aa924f9c203539', 401, 207, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('6c64de1d542f44d899cc403878651c66', 401, 204, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('6c6ef73de0da4e6993c28165426694a0', 401, 207, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('6c88e720096c499089652f02694ec222', 206, 401, '出题审核通知', 'YCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:38:07');
INSERT INTO `message` VALUES ('6d52754f7af44fbfb1258ae375343e0b', 20, 202, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:16:28');
INSERT INTO `message` VALUES ('6e6b543554c44bb794b509bcd6fd5072', 401, 101, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('6f65cbddd59c49e498d40f463d80b4b9', 401, 120, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('7044005a8d14493bb9525203fb02808c', 401, 109, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('71fc51911b9c4f28805729446250dcac', 102, 102, '结题答辩申请通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交结题答辩申请，请及时前往相关页面进行批复。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:03:54');
INSERT INTO `message` VALUES ('722cc26d137e4daebc617c21d372822b', 401, 202, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('7291f582a67b4bc38a161b3baddefb51', 401, 104, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('730881ca0c444ac88782deb076fa498e', 401, 109, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('73177d8ba61f457f812303294bf7cba9', 401, 107, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('73ca2ad699e44093ba624515049993c3', 401, 114, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('745705b1d027454a92f7cace82b173f2', 401, 402, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('74c04f5404064f7b9aa653f468335786', 401, 117, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('7618d4e2033b4eceb9019474313f0d03', 401, 111, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('765862c40e1e4167b49792ce4dfd2fed', 401, 101, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('76cd5f67af53406ca21cb3de5a50062f', 401, 301, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('77db07071bf9447f8cc9df4e078f2a1f', 401, 303, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('782abada68204252b84117d2e0cc5a36', 20, 207, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('7883b7350e4d49b1bcdd470390a6354b', 401, 107, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('7946be7d146841c4bec3423ccfd84bb8', 401, 109, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('79f8f6ad486d4fd8a06886519ba80614', 202, 401, '出题审核通知', 'YCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:30:02');
INSERT INTO `message` VALUES ('7b4af7cf7dc74f0cb3b3f75639cc3a85', 401, 202, '课题审核通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题出题状态已经更新，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:51:48');
INSERT INTO `message` VALUES ('7b4f88ad760840aa9d85d0a25df6bd54', 401, 203, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('7c96da46259d49688eae04ffbb2824b9', 306, 102, '答辩成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的开题答辩成绩已经出分，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:02:20');
INSERT INTO `message` VALUES ('7db375353602451f93daecebb237e36e', 401, 119, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('7e0df0a5d0e44cbcba9e0b3f7f47376c', 401, 105, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('7e1a078d4b4d477d90a70209e7e8f3b3', 401, 104, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('7e894ed9b32e4970b728382e37f7d83e', 401, 206, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('7e8d7984682a4685b9ba70bcf99b9cab', 401, 302, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('7ed31ad2eac14ceb8f388cb39c5f2c34', 101, 202, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:44:57');
INSERT INTO `message` VALUES ('7ee2fce4e4544a37b60f4dcdfd574ca8', 401, 204, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('7ee7844365cf432289a6a904736a45da', 401, 106, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('802a6c2a9d584c92a996422738801f73', 401, 204, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('80c0834d723e4062a76fce5567a3ca4e', 401, 108, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('80d167607e124447bd80fd0be5be3191', 202, 101, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:47:34');
INSERT INTO `message` VALUES ('81425b828d7b4459b5e07bf73f88cb2d', 401, 203, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('819d21d66e374179a92125369ab7087b', 401, 303, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('81d8aee00e3e444db1c21382f8e06204', 401, 202, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('81e16fc787904a4484cc46ea4645b6de', 401, 111, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('8228a65a571348d7ac3af48373e8e342', 401, 303, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('8312f84696a2401e85086e44965af579', 401, 202, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('8338e9838a6b4b119de1054fd634ebb7', 401, 205, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('836570c756c043d0aabe2df2e2593d8e', 401, 208, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('83bb7d32f92148f6a432549a20e0eede', 401, 202, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('83c58aad47f0405c942f60461ece35de', 401, 109, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('8427bc7c83be41708c2cda0ebbc10c14', 401, 101, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('842ca89017884dcd90daa235765460ed', 401, 206, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('84433c8195814346b997ed949c636e31', 401, 110, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('846f4313791e4c2dbef8d69defae83c2', 401, 108, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('854d0cc9edbc4422b67e22c99f3859ed', 401, 207, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('85a3c189b31848e18c04547eae531af6', 401, 114, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('85e5760b8b3e487480be6bee3da29adc', 401, 106, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('8670a9b4091245abbb7e8886b9c9195d', 401, 103, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('86abc8851d9f488dadef97f126b2f552', 203, 104, '中期成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的中期成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:36:01');
INSERT INTO `message` VALUES ('86ec54512e4449b28a97e3a621de35fe', 401, 104, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('870bdf6c67e24c7ebffa2d341beb3ebf', 401, 306, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('87363a6f9db7428fb4dfeae288d2f7b8', 401, 203, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('87dbb86b402143c1b8b640d056692408', 401, 111, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('88293fda96a047698761ef1df7ad9680', 401, 206, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('8926a4b89ecb44e2ba647d52c5c16d81', 401, 210, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('8a33e569e1c240309ca5475a372f6a68', 401, 204, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('8b44c340b29f4067abc2ed555ed75146', 401, 110, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('8b7bc5f2f1e1481784edb8552307f3c5', 401, 209, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('8c27e97d1fce40f2b7ad8ff09ff12a48', 401, 105, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('8c5803d75d28467ca06577a8c7539a47', 202, 103, '中期成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的中期成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:19:36');
INSERT INTO `message` VALUES ('8c5f3bb5eb7b49e296345872f92d7cba', 401, 304, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('8c87372df4874d8784a450c2fe74e6c7', 401, 102, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('8d0ac38af02c47d6a1295be900b8f17d', 401, 210, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('8e776170b0c04430873c2781a4ee5a49', 401, 306, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('8ed87eb877304cb09189e9b99f3a64bd', 401, 207, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('8fef99c3cf994034acf123aa221c58ab', 401, 206, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('90ad2d2cecaf46d38155814ce56b6338', 401, 203, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('922111ea380140ed8d9b37318875b528', 401, 305, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('930fcf18b7844662b0237a2933faa3cb', 401, 103, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('93b037593a1845cbb39780ac435b0771', 401, 107, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('93b6a2e501ca4f9890cf883134350b48', 401, 101, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('94753ef31a5140b18a995c1f3ddf755d', 401, 204, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('94e7814fa88949a7a6e1d3bbcd6e4e53', 20, 206, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('9674ab4467df4818bded9f0a8763012a', 401, 106, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('96bb0b42b1c34d489b72eb728d796691', 401, 303, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('96cc0632d48d40acbdd4fc9b27552ffc', 104, 104, '结题答辩申请通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交结题答辩申请，请及时前往相关页面进行批复。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:23:57');
INSERT INTO `message` VALUES ('96d9264009b34d7ab5bc33586b093998', 401, 210, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('9839ca094c134b82af5064cd0fe4dc3e', 401, 202, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('98e457103b4f40269d4a753c4e7aaa21', 204, 401, '出题审核通知', 'YCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:37:40');
INSERT INTO `message` VALUES ('98eaa2f7e88e448abc207fee1f1a32ab', 101, 201, '阶段任务通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交了阶段任务成果，请及时前往相关页面进行查看评分。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:52:44');
INSERT INTO `message` VALUES ('98fd557f9d7d46088dae4e32257be0d2', 401, 401, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('990c7038a5664c35af925cc1b93ed026', 401, 206, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('99d275650c954befb458d617a1c115c4', 401, 302, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('9b802e536d8445898187d97f3e93316a', 110, 110, '结题答辩申请通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交结题答辩申请，请及时前往相关页面进行批复。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:32:36');
INSERT INTO `message` VALUES ('9bc0c70fdf244a4ca6cdae6838f2813b', 401, 104, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('9c5449b57ba347f29f3d07b47d0ed9f6', 401, 105, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('9cafe55b3bdd45ed92ec279f01cbfa3b', 401, 112, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('9cc47312b2e0461fa0cb5a5c4558b87b', 401, 402, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('9cf3f43c4b0e44729650f39b1680600b', 401, 101, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('9d3553aeda5e40bbb17edec3261eddf5', 206, 402, '出题审核通知', 'WCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:38:07');
INSERT INTO `message` VALUES ('9d3cb010dd684cf38f97e9fe3c723e6b', 401, 103, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('9d427a6c5adf4d4886b73f383860f6b0', 401, 109, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('a145e38c44fb42c686235dbf88b96929', 20, 401, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('a152ab3cd4e74a9a802ef3b9766aee20', 401, 104, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('a17a8e64b80b4336b5a0d73b6797cf97', 401, 102, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('a1e4071f4db9487caaa9dcb9d009f976', 401, 306, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('a2e61223979b48b994d76dc68f47b79c', 401, 102, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('a2fea6411192413d9d534de021d99ac3', 401, 202, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('a3a50b63c37f4de68d462514ceb8e1e2', 205, 401, '出题审核通知', 'WCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:40:10');
INSERT INTO `message` VALUES ('a493e05998eb4d868534f6593265155d', 202, 108, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:19:15');
INSERT INTO `message` VALUES ('a562f811f67342c28e019f8cdcb35c4e', 401, 104, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('a5924a0f30334c3caee768834b57bb6c', 401, 209, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('a5f7df5c9d7b4155a6e27a2199db26dd', 401, 205, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('a65713b8195148119846795f25e85e8c', 401, 104, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('a805c38a9bb8454aa560f32d62d05ff9', 401, 306, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('a8db66c0255d473ca31833de305e9d34', 401, 210, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('a95078045152409aa8c1d2ec341ba64f', 401, 105, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('aabf923d42524c898160529d06f52363', 205, 106, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:20:49');
INSERT INTO `message` VALUES ('ad1f7e4b27af43e78ec7704a47f783a5', 401, 116, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('ae15734e4a3b4ea9ac42b7ba631d5139', 401, 105, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('ae25e251446b49feb4089d98ab8655db', 401, 301, '答辩安排通知', 'YCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('ae522f2121af486aa218a9a4e8984f3f', 401, 117, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('af23c72cb5434e37b0a8ef9e223bdefe', 401, 204, '课题审核通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题出题状态已经更新，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:51:58');
INSERT INTO `message` VALUES ('af26abf383fa40369025096a76658174', 401, 204, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('af3f4d8eeb5e4871aa9866d7f8b60ff0', 401, 205, '课题审核通知', 'YCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题出题状态已经更新，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:52:04');
INSERT INTO `message` VALUES ('af58fd1c369f45cbb73f552b46365d5a', 20, 110, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('aff5ac27a4754e8cb45702d1db76581a', 204, 105, '中期成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的中期成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:36:54');
INSERT INTO `message` VALUES ('b240105fc11d45b9901972779d70471f', 401, 206, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('b27bb783c98f4066a6ad75620bd4342f', 401, 210, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('b3a0c6e9551a46cc8e02d905da48eb2c', 108, 202, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:13:01');
INSERT INTO `message` VALUES ('b3fde835410848f981d0e2e0ffeb6311', 201, 102, '开题成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的开题成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:56:44');
INSERT INTO `message` VALUES ('b407ba8267e542bd88ae7e0cf8962b25', 401, 202, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('b40df55d878e4a1dbb4d966e39811fb2', 401, 401, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('b45f2b4d8e864a46b09d46463e71263d', 401, 209, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('b498b2c9003d46d59de1cd2e1b1f5798', 401, 205, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('b4ec85920f0341078b62dfa577b707fa', 401, 109, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('b52f4aebfd13446ea331e0d76d51b1ed', 20, 201, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('b575483ceb694143816196554ad06f22', 401, 113, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('b666cb9389274b81acd50a5572bd2705', 401, 103, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('b69579e71071438b8e56924a2bb4f4b7', 401, 111, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('b6f610a35fc346b9ae7b07714c31534d', 401, 210, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('b7496404427944e6a34bb22aa80e8319', 202, 402, '出题审核通知', 'WCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:28:43');
INSERT INTO `message` VALUES ('b7e8ab93e14c43e28900995dd10bcec0', 401, 118, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('b7f9f1ee9049424b8fc5a0f0d71fabae', 401, 105, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('b8352cee2f1645a4b061155af2a35d6a', 103, 202, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:07:01');
INSERT INTO `message` VALUES ('b85d2e4428eb4dd49dbad774a50463c1', 201, 102, '阶段任务通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的阶段任务提交已经被老师批复，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:46:39');
INSERT INTO `message` VALUES ('b8ae1f909d024150963d27b6cfbc7337', 401, 203, '课题审核通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题出题状态已经更新，请及时前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:51:53');
INSERT INTO `message` VALUES ('b8af87e2b2104e4f8ca835ee8488fae1', 401, 205, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('b942c8668d18446ea50f756bd176eedf', 401, 106, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('b9bcb1d1210c4537a9ee291443d9d7a6', 401, 107, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('b9e05634dbc6495a88113dcfa3002eb7', 205, 111, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:01:23');
INSERT INTO `message` VALUES ('bb78b44e629a406082be0cbab5412575', 401, 107, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('bc991cda515748a7aa2cec3e3407361e', 401, 203, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('bccc18f735d9421087354efeda198d65', 401, 108, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('bce6948894bd491dba1023ea4692fb4d', 110, 204, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:14:10');
INSERT INTO `message` VALUES ('bd08a6d8f8874958be0ec487d83345d7', 401, 209, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('bd5f6fc42da340e5b4bc791fbda93341', 401, 205, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('bd88d0f60e4541c3a151df3b77fdca2a', 401, 304, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('be38dcf38a6747e882f2870a0a156ef6', 401, 210, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('bef4522537a54210a346e88285a11f83', 401, 203, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('c0417dc4fdb04b8a9744d2f978a1c834', 101, 205, '选题通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您的课题有学生进行了选择，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:43:50');
INSERT INTO `message` VALUES ('c0b5890f7068442783e21dcc0a0fcf24', 20, 109, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('c10bbd920410419eabb0dc26ca0e5190', 401, 114, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('c276b8b2878241669e4dee9e6d84a291', 401, 209, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('c31a5d1539a94d5e86ddb2fc43d9d543', 401, 107, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('c33a29308a8940eca3a70b4243319743', 201, 102, '选题结果通知', 'YCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:18:15');
INSERT INTO `message` VALUES ('c33b45921f51491d8761f725a8ed41b5', 401, 301, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('c44de230e29a4deeb10665311d76938b', 20, 304, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('c45cd1eeb3cd45eebd646e8a826078d2', 401, 207, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('c46c0631b41d4e2fbbc4f00bbe044d34', 401, 108, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('c4980c47741149228392173286c0bf12', 401, 210, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('c4e223d32e9f4b04b6ff93837ade6162', 401, 203, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('c4fd230b05cb4a689dda26d0df530584', 401, 103, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('c5220c60bcaf49cda28ac7e20531ea35', 401, 104, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('c60f9a1175684c8abe1fac70f73a80c5', 401, 201, '阶段变更通知', 'YCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('c6550ad271cd411b9ce2a592575b0685', 20, 202, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('c6798ece36674e4589710108fea78a24', 401, 201, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('c6c4a49411c746be96c8a9f98b16342e', 401, 112, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('c721b7d10ff044cba8e58941db2db90b', 401, 204, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('c7312ea3668047d882c19d939831de6d', 401, 114, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('c74ec9fcbfbb46a1ab09b88429f1cb60', 401, 201, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('c7f47c41cd384145844f3f2814695399', 401, 207, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('c9767071b0be49adb504fc96c40ea43f', 107, 107, '结题答辩申请通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交结题答辩申请，请及时前往相关页面进行批复。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:29:39');
INSERT INTO `message` VALUES ('cac31ff86b304c699c5d96a12a4a54b2', 401, 303, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('cbb88decdc30452394db8843276d93b8', 401, 120, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('cc252c517a5a4eb89d26dabb7a709e2a', 401, 305, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('cc85999b30ee4a33b402e775a2dfda77', 20, 119, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('cc9d04d21ac942299475f7ae1596cbbf', 401, 304, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('ccd47650f985496e801ef7abdd4df539', 401, 113, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('cd7b32af51a646ca93c1528a3b06d49b', 401, 108, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('ce15eb0123f14464a49b89d4f9c0d0e8', 401, 115, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('ce1d5dd80a804cedace810bd258f6daf', 20, 108, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('ce6de889491048e1a62399298b53ae23', 401, 209, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('ce982db0834048ef8d1879ef86d71b1e', 20, 306, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('cf4bcf79c5134c92a005021578afae29', 401, 208, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('cf872d08b90a4915ab420aa4aecf5af6', 401, 103, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('d03c5ea7ca00469782589fa0a827c097', 401, 202, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('d0a3cbf150ee4405b836d2c7a60184f7', 202, 401, '出题审核通知', 'YCK', '<p><strong>教务处老师好：</strong></p><p>	</p><p>		有老师提交了自己的毕业设计课题，请及时前往相关页面进行审核。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 00:28:43');
INSERT INTO `message` VALUES ('d0fb64a29435480db9c89bd37e78ecaf', 401, 203, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('d14a0b94733343b5a2cf58770e879823', 401, 101, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('d152ef6b998c4674a5cef44451d492fb', 401, 208, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('d15fff28880f4e6e80db6984c10647c1', 401, 208, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('d1c3be2ac094434488c26424c8a1d382', 401, 207, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('d225dd383e4140698bd9fa94b613310c', 401, 118, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('d2836145530d4903afbd85673ae3de27', 401, 114, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('d31507d550cc4f1d9aa04536e127d824', 20, 112, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('d3f7c024deb348bc8d736b3294783633', 401, 104, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('d43c43baaf4447b29fb953c5b21d3579', 203, 109, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:19:57');
INSERT INTO `message` VALUES ('d48fb683f1524804be29f6836e001287', 401, 203, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('d5ce1fbad89540a19e8d18990e50c592', 401, 115, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('d7580f114795461c8649ee1d4b4ae922', 401, 306, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('d765063ff01d43bbae97e744449ee88d', 401, 111, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('d820ba3651ca45009099877e9757c695', 401, 110, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('d828b570a30642fa9144c4fb04e3e39c', 401, 120, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('d9712b3f48784b888ec4c83e7a582911', 401, 204, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('db89999424d3430a87e1e5a213565a0e', 202, 101, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:47:22');
INSERT INTO `message` VALUES ('dbf5ce81d6184cf79ce1d67b07a04fdd', 20, 115, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('dc0abf769f4f40cf94835eec1c028e24', 401, 208, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('dc1ede9ba93c4f59ab3ef5bb0026188f', 401, 306, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('dc93e1dcb8cf4999b2c4e6d0bc547545', 401, 111, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('dd2aeeccc7ad4cbebfcb186764799b99', 401, 101, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('de3d24742bfb4b67b0a99a519736bc1d', 401, 101, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('de527fa595f4415a940fd6017b48e532', 205, 112, '选题结果通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的选题申请状态已经更新，请前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:01:26');
INSERT INTO `message` VALUES ('de53f5efa2a847aa987f039ca0e4f0e1', 401, 206, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('df0a584a2b714d0b973fbb94ee3023ba', 401, 205, '阶段变更通知', 'YCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('df9e6f012e0d4efea0fcfed05a475330', 401, 204, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('dfe650076cde43709698095a287128ca', 401, 111, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('e061859af2d5473d9dbae0cef26e9e87', 401, 210, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('e0904a027c634613a3d3c37f868a973f', 401, 110, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('e0d49e6163334092bfb0ac252e73869b', 401, 303, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('e137248d5d3d430aafa9b33c9caf8ea4', 401, 402, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('e1a1776b5099462496371e2b5f27f0e2', 20, 101, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('e1ffe25d2ea849cfb8cf8409c3452de8', 20, 301, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('e21cd7abf8b84e6aba43adcb68e91ba1', 401, 111, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('e473260b963740a7ac9fd65e48ba4a4d', 108, 108, '结题答辩申请通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交结题答辩申请，请及时前往相关页面进行批复。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:30:14');
INSERT INTO `message` VALUES ('e4bdbb416d2440eca248a41df602f37c', 401, 113, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('e6a5c8ee36864fb8b4ec7a91808065c8', 401, 201, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('e889d5d0f572418a9dd9253d5072d12e', 401, 209, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('e962cfbf203d4b0d8ab8402fec9e1367', 401, 110, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('e97ff3f66c3548728ef91ddc369b4198', 401, 205, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('ea2e162f8d62469a8cff9a42e7257661', 401, 207, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 14:00:25');
INSERT INTO `message` VALUES ('eade31f0247e416aad496d13c7ac7e3c', 401, 119, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('eb1d957fcaf24582a1ffe65e7fabf727', 20, 116, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('ebdffc81e36345b9994a98dcd86f260a', 401, 116, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('ec0a92200eba42f39ce5451805571d4a', 401, 303, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('ec10be1fa56c4648967aac8090995e75', 401, 206, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('ec409f75786047c0bafd246a3cd534f8', 401, 112, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');
INSERT INTO `message` VALUES ('ec646e2e03f148479a59c21cbefb7483', 401, 117, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('ec9e35399a6741bea208963cb05ec274', 401, 105, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('edd28571a9f046af8147cbaac39a6e84', 401, 109, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('eea59e1c4d734f5a83201ab985ba25a0', 401, 301, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('eec0634e0e6c46b092516825d1e12a11', 401, 105, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您之前的答辩安排已经取消，请等待之后的最新通知。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:58');
INSERT INTO `message` VALUES ('ef19333d6dde4f84876d06e339b5f319', 401, 305, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('ef5019f0c4114b05847982fef0c1d19b', 401, 302, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('f00620669e2d44f591863ff71d14332a', 401, 305, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('f1c62b523a4a41abaf5935b69a7fe6d9', 401, 104, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('f236c038f6ee4832bc24414a402ccd5e', 401, 209, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('f2ed4b7c5bef41b7bec9dab02f071ba1', 20, 203, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('f2f0f1b65f0f496cadcfbe3e4b45f517', 401, 109, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:52');
INSERT INTO `message` VALUES ('f3d978dcb5cd4fa78a814ec26a14bec8', 401, 116, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('f40a95d7e0aa496e9fe9d13382805145', 401, 111, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('f53e702786534b0fa9361d851ca3c944', 20, 113, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('f62a32b0a197459b99858c93371228c5', 20, 210, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('f835755179a849dba2652df96b8ef0d8', 401, 206, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:30:11');
INSERT INTO `message` VALUES ('f8d439da57c644159f93a539d4c0a2ac', 401, 112, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:10:34');
INSERT INTO `message` VALUES ('fa177b3769d042e08f239ca9c4a8fb85', 401, 107, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:11:15');
INSERT INTO `message` VALUES ('faee464f426e465591410cfaa4b806e3', 102, 102, '开题报告提交通知', 'WCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交了开题报告，请及时前往相关页面进行打分。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:55:15');
INSERT INTO `message` VALUES ('fba208a011d0482bb9a7159d1a5bdba7', 401, 401, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 09:06:22');
INSERT INTO `message` VALUES ('fba423a509e342809acd869b898cdedf', 401, 204, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:21:15');
INSERT INTO `message` VALUES ('fbae9084ea5148d383a2e3e5cc4f3913', 20, 302, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('fbc2745559804f7699f9d086ee82d279', 401, 209, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:24:50');
INSERT INTO `message` VALUES ('fc717fe99edb480fbca0ef5f80ea2a6a', 202, 103, '开题成果成绩通知', 'WCK', '<p><strong>同学您好：</strong></p><p>	</p><p>		您的开题成果老师已经出分，可以前往相关页面进行查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 02:16:44');
INSERT INTO `message` VALUES ('fe1140e56d854ccd8f9b80e90bb428d2', 20, 305, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-30 20:01:34');
INSERT INTO `message` VALUES ('fe3f9f44534f40a99af10416528d15ba', 401, 119, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:32:11');
INSERT INTO `message` VALUES ('fe84fe6143ba468d85b93d5116fd8134', 401, 205, '答辩安排通知', 'WCK', '<p><strong>尊敬的用户：</strong></p><p>	</p><p>		您有新的答辩安排，请前往答辩安排处查看。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 13:59:23');
INSERT INTO `message` VALUES ('fec30a16641840efa3faba0eb707968b', 102, 201, '阶段任务通知', 'YCK', '<p><strong>尊敬的老师：</strong></p><p>	</p><p>		您有学生提交了阶段任务成果，请及时前往相关页面进行查看评分。</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-25 01:38:21');
INSERT INTO `message` VALUES ('fff99f8b520542a1a437d685cc96f558', 401, 108, '阶段变更通知', 'WCK', '<p><strong>尊敬的用户您好：</strong></p><p>	</p><p>		当前系统所处阶段已经变更，目前的阶段和相应说明如下：</p><p>		◉课题申报：在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。</p><p>		◉课题申报审核：在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。</p><p>		◉被驳回课题整改：在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。</p><p>		◉学生提交选题申请：在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。</p><p>		◉教师审核学生申请：在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。</p><p>		◉开题报告及材料提交：在该阶段，学生可以在系统提交开题报告及与开题相关的材料。</p><p>		◉开题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。</p><p>		◉开题阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。</p><p>		◉中期检查材料提交：在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。</p><p>		◉中期答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。</p><p>		◉中期阶段收尾：在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。</p><p>		◉结题材料提交：在该阶段，学生提交毕业论文、最终成果物及结题报告。</p><p>		◉结题答辩：在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。</p><p>		◉结题收尾工作：在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。</p><p>		注意相关事务的处理执行，以免错过！</p><p>	</p><p class=\"ql-align-right\"><strong>系统管理员</strong></p>', '2021-03-24 23:54:51');

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plea
-- ----------------------------
INSERT INTO `plea` VALUES (45, 'KT', 0, 76, 1, '2021-03-25 00:00:00', '2021-03-25 00:00:00', 1);
INSERT INTO `plea` VALUES (46, 'KT', 1, 77, 2, '2021-03-26 00:00:00', '2021-03-26 00:00:00', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plea_result
-- ----------------------------
INSERT INTO `plea_result` VALUES (20, 52, 46, 'KT', 90, '<p>表现不错！</p>', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES (35, '33c06f19b35e421195fdf3527bc7336e', 0, 'a489b9dd4cb7434da3ff1b276ea40bc5', 'KT', '<p>研究意义</p>', '<p>研究成果</p>', '<p>研究计划</p>', NULL, NULL, NULL, '53', '2021-03-25 02:15:29', 'YTG', 31, '2021-03-25 02:16:44', '<p>开题一切顺利！</p>', 90, 0);
INSERT INTO `report` VALUES (36, '33c06f19b35e421195fdf3527bc7336e', 0, '51f3a00135754b78b5d5c903772a44d4', 'ZQ', NULL, NULL, NULL, '<p>这是研究进展！</p>', '<p>这是后续计划！</p>', NULL, '53', '2021-03-25 09:18:16', 'YTG', 31, '2021-03-25 09:19:36', '<p>不错，继续加油！</p>', 98, 0);
INSERT INTO `report` VALUES (37, '33c06f19b35e421195fdf3527bc7336e', 0, 'c10ef54e084c48f58e7f7fd4d9cf1742', 'JT', NULL, NULL, NULL, NULL, NULL, '<p>学生3保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。</p>', '53', '2021-03-25 09:21:29', 'YTG', 31, '2021-03-25 09:22:25', '<p>祝你顺利毕业，加油！</p>', NULL, 0);
INSERT INTO `report` VALUES (38, '63cfe67ddf5d477da56ed03f95c5e33c', 0, '247fa02e2c664e7cbef850311b8a66db', 'JT', NULL, NULL, NULL, NULL, NULL, '<p>学生4保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。</p>', '54', '2021-03-25 09:23:57', 'YTG', 32, '2021-03-25 09:36:01', '<p>祝你顺利毕业！</p>', NULL, 0);
INSERT INTO `report` VALUES (39, '860eb13645a14b09b3a3b09c8a2bf942', 0, '86675fa31c344f07aabf2e72a7350cf5', 'JT', NULL, NULL, NULL, NULL, NULL, '<p>学生5保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。</p>', '55', '2021-03-25 09:27:50', 'YTG', 33, '2021-03-25 09:36:54', '<p>祝你顺利毕业！</p>', NULL, 0);
INSERT INTO `report` VALUES (40, '8d794a4ebd5244ab9bfa4c4fc6b43ae9', 0, '898f9c108e2c4d40908d8629baa7b462', 'JT', NULL, NULL, NULL, NULL, NULL, '<p>学生6保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。</p>', '56', '2021-03-25 09:28:45', 'YTG', 34, '2021-03-25 09:38:24', '<p>祝你顺利毕业！</p>', NULL, 0);
INSERT INTO `report` VALUES (41, '70b54e75790f4badbfef12af27c44a41', 0, '3d9b79a71573470099d408ee3417b098', 'JT', NULL, NULL, NULL, NULL, NULL, '<p>学生7保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。</p>', '57', '2021-03-25 09:29:39', 'YTG', 30, '2021-03-25 09:34:23', '<p>祝你顺利毕业！</p>', NULL, 0);
INSERT INTO `report` VALUES (42, '33c06f19b35e421195fdf3527bc7336e', 0, 'fdf39a2af7794c7783641fb1a47a87e8', 'JT', NULL, NULL, NULL, NULL, NULL, '<p>学生8保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。</p>', '58', '2021-03-25 09:30:14', 'YTG', 31, '2021-03-25 09:35:30', '<p>祝你顺利毕业！</p>', NULL, 0);
INSERT INTO `report` VALUES (43, '63cfe67ddf5d477da56ed03f95c5e33c', 0, 'fdaa7c26ced84478b22b5a9004287b39', 'JT', NULL, NULL, NULL, NULL, NULL, '<p>学生9保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。</p>', '59', '2021-03-25 09:31:03', 'YTG', 32, '2021-03-25 09:36:05', '请输入反馈信息', NULL, 0);
INSERT INTO `report` VALUES (44, '860eb13645a14b09b3a3b09c8a2bf942', 0, 'f7554133f22f4945b3e5da84fe54df67', 'JT', NULL, NULL, NULL, NULL, NULL, '<p>学生10保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。</p>', '60', '2021-03-25 09:32:36', 'YTG', 33, '2021-03-25 09:37:00', '<p>祝你顺利毕业！</p>', NULL, 0);
INSERT INTO `report` VALUES (45, '70b54e75790f4badbfef12af27c44a41', 0, 'abaaa2db9bd742c79e41d295c09dad8e', 'KT', '', '', '', NULL, NULL, NULL, '52', '2021-03-25 13:55:15', 'YTG', 30, '2021-03-25 13:56:44', '<p>不错！</p>', 91, 0);
INSERT INTO `report` VALUES (46, '70b54e75790f4badbfef12af27c44a41', 0, '236c9dc7dadd439ab5d97dff58c73c07', 'JT', NULL, NULL, NULL, NULL, NULL, '（请输入申请原因）本人保证：所提交论文完全为个人工作成果，所用资料、实验结果及计算数。（通过查阅文献和阅读相关资料，严格按照毕业论文的格式和要求，完成论文的撰写工作。经过指导教师审核检查、评阅教师审核，所写论文已经达到了本科生毕业论文要求，特申请进行毕业论文答辩。', '52', '2021-03-25 14:03:54', 'YTG', 30, '2021-03-25 14:04:45', '<p>通过！</p>', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2906 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置各阶段角色的权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_stage_perms
-- ----------------------------
INSERT INTO `role_stage_perms` VALUES (695, 1, 0, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (696, 1, 0, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (697, 1, 0, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (698, 1, 0, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (699, 1, 0, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (700, 1, 0, 'notice');
INSERT INTO `role_stage_perms` VALUES (701, 1, 0, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (702, 1, 0, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (703, 1, 0, 'process');
INSERT INTO `role_stage_perms` VALUES (704, 1, 0, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (705, 1, 0, 'process:my');
INSERT INTO `role_stage_perms` VALUES (706, 1, 0, 'process:record');
INSERT INTO `role_stage_perms` VALUES (707, 1, 0, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (708, 1, 0, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (709, 1, 0, 'apply');
INSERT INTO `role_stage_perms` VALUES (710, 1, 0, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (711, 1, 0, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (712, 1, 0, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (713, 1, 0, 'select');
INSERT INTO `role_stage_perms` VALUES (714, 1, 0, 'select:view');
INSERT INTO `role_stage_perms` VALUES (715, 1, 0, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (717, 1, 0, 'select:result');
INSERT INTO `role_stage_perms` VALUES (718, 1, 0, 'init');
INSERT INTO `role_stage_perms` VALUES (719, 1, 0, 'mid');
INSERT INTO `role_stage_perms` VALUES (720, 1, 0, 'fin');
INSERT INTO `role_stage_perms` VALUES (721, 1, 0, 'init:report');
INSERT INTO `role_stage_perms` VALUES (722, 1, 0, 'init:list');
INSERT INTO `role_stage_perms` VALUES (723, 1, 0, 'init:check');
INSERT INTO `role_stage_perms` VALUES (724, 1, 0, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (725, 1, 0, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (726, 1, 0, 'init:score');
INSERT INTO `role_stage_perms` VALUES (727, 1, 0, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (728, 1, 0, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (729, 1, 0, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (730, 1, 0, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (731, 1, 0, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (732, 1, 0, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (733, 1, 0, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (734, 1, 0, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (735, 1, 0, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (736, 1, 0, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (737, 1, 0, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (738, 1, 0, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (739, 1, 0, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (740, 1, 0, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (742, 1, 0, 'score');
INSERT INTO `role_stage_perms` VALUES (743, 1, 0, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (744, 1, 0, 'score:my');
INSERT INTO `role_stage_perms` VALUES (745, 1, 0, 'score:list');
INSERT INTO `role_stage_perms` VALUES (746, 1, 0, 'sys');
INSERT INTO `role_stage_perms` VALUES (747, 1, 1, 'sys');
INSERT INTO `role_stage_perms` VALUES (748, 1, 1, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (749, 1, 1, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (750, 1, 1, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (751, 1, 1, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (752, 1, 1, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (753, 1, 1, 'notice');
INSERT INTO `role_stage_perms` VALUES (754, 1, 1, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (755, 1, 1, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (756, 1, 1, 'process');
INSERT INTO `role_stage_perms` VALUES (757, 1, 1, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (758, 1, 1, 'process:my');
INSERT INTO `role_stage_perms` VALUES (759, 1, 1, 'process:record');
INSERT INTO `role_stage_perms` VALUES (760, 1, 1, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (761, 1, 1, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (762, 1, 1, 'apply');
INSERT INTO `role_stage_perms` VALUES (763, 1, 1, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (764, 1, 1, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (765, 1, 1, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (766, 1, 1, 'select');
INSERT INTO `role_stage_perms` VALUES (767, 1, 1, 'select:view');
INSERT INTO `role_stage_perms` VALUES (768, 1, 1, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (770, 1, 1, 'select:result');
INSERT INTO `role_stage_perms` VALUES (771, 1, 1, 'init');
INSERT INTO `role_stage_perms` VALUES (772, 1, 1, 'mid');
INSERT INTO `role_stage_perms` VALUES (773, 1, 1, 'fin');
INSERT INTO `role_stage_perms` VALUES (774, 1, 1, 'init:report');
INSERT INTO `role_stage_perms` VALUES (775, 1, 1, 'init:list');
INSERT INTO `role_stage_perms` VALUES (776, 1, 1, 'init:check');
INSERT INTO `role_stage_perms` VALUES (777, 1, 1, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (778, 1, 1, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (779, 1, 1, 'init:score');
INSERT INTO `role_stage_perms` VALUES (780, 1, 1, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (781, 1, 1, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (782, 1, 1, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (783, 1, 1, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (784, 1, 1, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (785, 1, 1, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (786, 1, 1, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (787, 1, 1, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (788, 1, 1, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (789, 1, 1, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (790, 1, 1, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (791, 1, 1, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (792, 1, 1, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (793, 1, 1, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (795, 1, 1, 'score');
INSERT INTO `role_stage_perms` VALUES (796, 1, 1, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (797, 1, 1, 'score:my');
INSERT INTO `role_stage_perms` VALUES (798, 1, 1, 'score:list');
INSERT INTO `role_stage_perms` VALUES (799, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (800, 1, 2, 'sys');
INSERT INTO `role_stage_perms` VALUES (801, 1, 2, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (802, 1, 2, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (803, 1, 2, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (804, 1, 2, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (805, 1, 2, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (806, 1, 2, 'notice');
INSERT INTO `role_stage_perms` VALUES (807, 1, 2, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (808, 1, 2, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (809, 1, 2, 'process');
INSERT INTO `role_stage_perms` VALUES (810, 1, 2, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (811, 1, 2, 'process:my');
INSERT INTO `role_stage_perms` VALUES (812, 1, 2, 'process:record');
INSERT INTO `role_stage_perms` VALUES (813, 1, 2, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (814, 1, 2, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (815, 1, 2, 'apply');
INSERT INTO `role_stage_perms` VALUES (816, 1, 2, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (817, 1, 2, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (818, 1, 2, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (819, 1, 2, 'select');
INSERT INTO `role_stage_perms` VALUES (820, 1, 2, 'select:view');
INSERT INTO `role_stage_perms` VALUES (821, 1, 2, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (823, 1, 2, 'select:result');
INSERT INTO `role_stage_perms` VALUES (824, 1, 2, 'init');
INSERT INTO `role_stage_perms` VALUES (825, 1, 2, 'mid');
INSERT INTO `role_stage_perms` VALUES (826, 1, 2, 'fin');
INSERT INTO `role_stage_perms` VALUES (827, 1, 2, 'init:report');
INSERT INTO `role_stage_perms` VALUES (828, 1, 2, 'init:list');
INSERT INTO `role_stage_perms` VALUES (829, 1, 2, 'init:check');
INSERT INTO `role_stage_perms` VALUES (830, 1, 2, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (831, 1, 2, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (832, 1, 2, 'init:score');
INSERT INTO `role_stage_perms` VALUES (833, 1, 2, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (834, 1, 2, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (835, 1, 2, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (836, 1, 2, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (837, 1, 2, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (838, 1, 2, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (839, 1, 2, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (840, 1, 2, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (841, 1, 2, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (842, 1, 2, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (843, 1, 2, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (844, 1, 2, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (845, 1, 2, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (846, 1, 2, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (848, 1, 2, 'score');
INSERT INTO `role_stage_perms` VALUES (849, 1, 2, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (850, 1, 2, 'score:my');
INSERT INTO `role_stage_perms` VALUES (851, 1, 2, 'score:list');
INSERT INTO `role_stage_perms` VALUES (852, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (853, 1, 3, 'sys');
INSERT INTO `role_stage_perms` VALUES (854, 1, 3, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (855, 1, 3, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (856, 1, 3, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (857, 1, 3, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (858, 1, 3, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (859, 1, 3, 'notice');
INSERT INTO `role_stage_perms` VALUES (860, 1, 3, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (861, 1, 3, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (862, 1, 3, 'process');
INSERT INTO `role_stage_perms` VALUES (863, 1, 3, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (864, 1, 3, 'process:my');
INSERT INTO `role_stage_perms` VALUES (865, 1, 3, 'process:record');
INSERT INTO `role_stage_perms` VALUES (866, 1, 3, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (867, 1, 3, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (868, 1, 3, 'apply');
INSERT INTO `role_stage_perms` VALUES (869, 1, 3, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (870, 1, 3, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (871, 1, 3, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (872, 1, 3, 'select');
INSERT INTO `role_stage_perms` VALUES (873, 1, 3, 'select:view');
INSERT INTO `role_stage_perms` VALUES (874, 1, 3, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (876, 1, 3, 'select:result');
INSERT INTO `role_stage_perms` VALUES (877, 1, 3, 'init');
INSERT INTO `role_stage_perms` VALUES (878, 1, 3, 'mid');
INSERT INTO `role_stage_perms` VALUES (879, 1, 3, 'fin');
INSERT INTO `role_stage_perms` VALUES (880, 1, 3, 'init:report');
INSERT INTO `role_stage_perms` VALUES (881, 1, 3, 'init:list');
INSERT INTO `role_stage_perms` VALUES (882, 1, 3, 'init:check');
INSERT INTO `role_stage_perms` VALUES (883, 1, 3, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (884, 1, 3, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (885, 1, 3, 'init:score');
INSERT INTO `role_stage_perms` VALUES (886, 1, 3, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (887, 1, 3, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (888, 1, 3, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (889, 1, 3, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (890, 1, 3, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (891, 1, 3, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (892, 1, 3, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (893, 1, 3, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (894, 1, 3, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (895, 1, 3, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (896, 1, 3, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (897, 1, 3, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (898, 1, 3, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (899, 1, 3, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (901, 1, 3, 'score');
INSERT INTO `role_stage_perms` VALUES (902, 1, 3, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (903, 1, 3, 'score:my');
INSERT INTO `role_stage_perms` VALUES (904, 1, 3, 'score:list');
INSERT INTO `role_stage_perms` VALUES (905, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (906, 1, 4, 'sys');
INSERT INTO `role_stage_perms` VALUES (907, 1, 4, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (908, 1, 4, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (909, 1, 4, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (910, 1, 4, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (911, 1, 4, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (912, 1, 4, 'notice');
INSERT INTO `role_stage_perms` VALUES (913, 1, 4, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (914, 1, 4, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (915, 1, 4, 'process');
INSERT INTO `role_stage_perms` VALUES (916, 1, 4, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (917, 1, 4, 'process:my');
INSERT INTO `role_stage_perms` VALUES (918, 1, 4, 'process:record');
INSERT INTO `role_stage_perms` VALUES (919, 1, 4, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (920, 1, 4, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (921, 1, 4, 'apply');
INSERT INTO `role_stage_perms` VALUES (922, 1, 4, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (923, 1, 4, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (924, 1, 4, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (925, 1, 4, 'select');
INSERT INTO `role_stage_perms` VALUES (926, 1, 4, 'select:view');
INSERT INTO `role_stage_perms` VALUES (927, 1, 4, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (929, 1, 4, 'select:result');
INSERT INTO `role_stage_perms` VALUES (930, 1, 4, 'init');
INSERT INTO `role_stage_perms` VALUES (931, 1, 4, 'mid');
INSERT INTO `role_stage_perms` VALUES (932, 1, 4, 'fin');
INSERT INTO `role_stage_perms` VALUES (933, 1, 4, 'init:report');
INSERT INTO `role_stage_perms` VALUES (934, 1, 4, 'init:list');
INSERT INTO `role_stage_perms` VALUES (935, 1, 4, 'init:check');
INSERT INTO `role_stage_perms` VALUES (936, 1, 4, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (937, 1, 4, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (938, 1, 4, 'init:score');
INSERT INTO `role_stage_perms` VALUES (939, 1, 4, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (940, 1, 4, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (941, 1, 4, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (942, 1, 4, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (943, 1, 4, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (944, 1, 4, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (945, 1, 4, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (946, 1, 4, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (947, 1, 4, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (948, 1, 4, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (949, 1, 4, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (950, 1, 4, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (951, 1, 4, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (952, 1, 4, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (954, 1, 4, 'score');
INSERT INTO `role_stage_perms` VALUES (955, 1, 4, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (956, 1, 4, 'score:my');
INSERT INTO `role_stage_perms` VALUES (957, 1, 4, 'score:list');
INSERT INTO `role_stage_perms` VALUES (958, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (959, 1, 5, 'sys');
INSERT INTO `role_stage_perms` VALUES (960, 1, 5, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (961, 1, 5, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (962, 1, 5, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (963, 1, 5, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (964, 1, 5, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (965, 1, 5, 'notice');
INSERT INTO `role_stage_perms` VALUES (966, 1, 5, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (967, 1, 5, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (968, 1, 5, 'process');
INSERT INTO `role_stage_perms` VALUES (969, 1, 5, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (970, 1, 5, 'process:my');
INSERT INTO `role_stage_perms` VALUES (971, 1, 5, 'process:record');
INSERT INTO `role_stage_perms` VALUES (972, 1, 5, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (973, 1, 5, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (974, 1, 5, 'apply');
INSERT INTO `role_stage_perms` VALUES (975, 1, 5, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (976, 1, 5, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (977, 1, 5, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (978, 1, 5, 'select');
INSERT INTO `role_stage_perms` VALUES (979, 1, 5, 'select:view');
INSERT INTO `role_stage_perms` VALUES (980, 1, 5, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (982, 1, 5, 'select:result');
INSERT INTO `role_stage_perms` VALUES (983, 1, 5, 'init');
INSERT INTO `role_stage_perms` VALUES (984, 1, 5, 'mid');
INSERT INTO `role_stage_perms` VALUES (985, 1, 5, 'fin');
INSERT INTO `role_stage_perms` VALUES (986, 1, 5, 'init:report');
INSERT INTO `role_stage_perms` VALUES (987, 1, 5, 'init:list');
INSERT INTO `role_stage_perms` VALUES (988, 1, 5, 'init:check');
INSERT INTO `role_stage_perms` VALUES (989, 1, 5, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (990, 1, 5, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (991, 1, 5, 'init:score');
INSERT INTO `role_stage_perms` VALUES (992, 1, 5, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (993, 1, 5, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (994, 1, 5, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (995, 1, 5, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (996, 1, 5, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (997, 1, 5, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (998, 1, 5, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (999, 1, 5, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1000, 1, 5, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (1001, 1, 5, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (1002, 1, 5, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1003, 1, 5, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (1004, 1, 5, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (1005, 1, 5, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (1007, 1, 5, 'score');
INSERT INTO `role_stage_perms` VALUES (1008, 1, 5, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (1009, 1, 5, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1010, 1, 5, 'score:list');
INSERT INTO `role_stage_perms` VALUES (1011, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1012, 1, 6, 'sys');
INSERT INTO `role_stage_perms` VALUES (1013, 1, 6, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (1014, 1, 6, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (1015, 1, 6, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (1016, 1, 6, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (1017, 1, 6, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (1018, 1, 6, 'notice');
INSERT INTO `role_stage_perms` VALUES (1019, 1, 6, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (1020, 1, 6, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1021, 1, 6, 'process');
INSERT INTO `role_stage_perms` VALUES (1022, 1, 6, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (1023, 1, 6, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1024, 1, 6, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1025, 1, 6, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (1026, 1, 6, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1027, 1, 6, 'apply');
INSERT INTO `role_stage_perms` VALUES (1028, 1, 6, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (1029, 1, 6, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (1030, 1, 6, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (1031, 1, 6, 'select');
INSERT INTO `role_stage_perms` VALUES (1032, 1, 6, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1033, 1, 6, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (1035, 1, 6, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1036, 1, 6, 'init');
INSERT INTO `role_stage_perms` VALUES (1037, 1, 6, 'mid');
INSERT INTO `role_stage_perms` VALUES (1038, 1, 6, 'fin');
INSERT INTO `role_stage_perms` VALUES (1039, 1, 6, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1040, 1, 6, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1041, 1, 6, 'init:check');
INSERT INTO `role_stage_perms` VALUES (1042, 1, 6, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (1043, 1, 6, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1044, 1, 6, 'init:score');
INSERT INTO `role_stage_perms` VALUES (1045, 1, 6, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1046, 1, 6, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1047, 1, 6, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (1048, 1, 6, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (1049, 1, 6, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1050, 1, 6, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (1051, 1, 6, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (1052, 1, 6, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1053, 1, 6, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (1054, 1, 6, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (1055, 1, 6, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1056, 1, 6, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (1057, 1, 6, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (1058, 1, 6, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (1060, 1, 6, 'score');
INSERT INTO `role_stage_perms` VALUES (1061, 1, 6, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (1062, 1, 6, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1063, 1, 6, 'score:list');
INSERT INTO `role_stage_perms` VALUES (1064, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1065, 1, 7, 'sys');
INSERT INTO `role_stage_perms` VALUES (1066, 1, 7, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (1067, 1, 7, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (1068, 1, 7, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (1069, 1, 7, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (1070, 1, 7, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (1071, 1, 7, 'notice');
INSERT INTO `role_stage_perms` VALUES (1072, 1, 7, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (1073, 1, 7, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1074, 1, 7, 'process');
INSERT INTO `role_stage_perms` VALUES (1075, 1, 7, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (1076, 1, 7, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1077, 1, 7, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1078, 1, 7, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (1079, 1, 7, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1080, 1, 7, 'apply');
INSERT INTO `role_stage_perms` VALUES (1081, 1, 7, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (1082, 1, 7, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (1083, 1, 7, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (1084, 1, 7, 'select');
INSERT INTO `role_stage_perms` VALUES (1085, 1, 7, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1086, 1, 7, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (1088, 1, 7, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1089, 1, 7, 'init');
INSERT INTO `role_stage_perms` VALUES (1090, 1, 7, 'mid');
INSERT INTO `role_stage_perms` VALUES (1091, 1, 7, 'fin');
INSERT INTO `role_stage_perms` VALUES (1092, 1, 7, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1093, 1, 7, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1094, 1, 7, 'init:check');
INSERT INTO `role_stage_perms` VALUES (1095, 1, 7, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (1096, 1, 7, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1097, 1, 7, 'init:score');
INSERT INTO `role_stage_perms` VALUES (1098, 1, 7, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1099, 1, 7, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1100, 1, 7, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (1101, 1, 7, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (1102, 1, 7, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1103, 1, 7, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (1104, 1, 7, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (1105, 1, 7, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1106, 1, 7, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (1107, 1, 7, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (1108, 1, 7, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1109, 1, 7, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (1110, 1, 7, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (1111, 1, 7, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (1113, 1, 7, 'score');
INSERT INTO `role_stage_perms` VALUES (1114, 1, 7, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (1115, 1, 7, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1116, 1, 7, 'score:list');
INSERT INTO `role_stage_perms` VALUES (1117, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1118, 1, 8, 'sys');
INSERT INTO `role_stage_perms` VALUES (1119, 1, 8, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (1120, 1, 8, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (1121, 1, 8, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (1122, 1, 8, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (1123, 1, 8, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (1124, 1, 8, 'notice');
INSERT INTO `role_stage_perms` VALUES (1125, 1, 8, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (1126, 1, 8, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1127, 1, 8, 'process');
INSERT INTO `role_stage_perms` VALUES (1128, 1, 8, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (1129, 1, 8, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1130, 1, 8, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1131, 1, 8, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (1132, 1, 8, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1133, 1, 8, 'apply');
INSERT INTO `role_stage_perms` VALUES (1134, 1, 8, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (1135, 1, 8, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (1136, 1, 8, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (1137, 1, 8, 'select');
INSERT INTO `role_stage_perms` VALUES (1138, 1, 8, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1139, 1, 8, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (1141, 1, 8, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1142, 1, 8, 'init');
INSERT INTO `role_stage_perms` VALUES (1143, 1, 8, 'mid');
INSERT INTO `role_stage_perms` VALUES (1144, 1, 8, 'fin');
INSERT INTO `role_stage_perms` VALUES (1145, 1, 8, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1146, 1, 8, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1147, 1, 8, 'init:check');
INSERT INTO `role_stage_perms` VALUES (1148, 1, 8, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (1149, 1, 8, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1150, 1, 8, 'init:score');
INSERT INTO `role_stage_perms` VALUES (1151, 1, 8, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1152, 1, 8, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1153, 1, 8, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (1154, 1, 8, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (1155, 1, 8, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1156, 1, 8, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (1157, 1, 8, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (1158, 1, 8, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1159, 1, 8, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (1160, 1, 8, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (1161, 1, 8, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1162, 1, 8, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (1163, 1, 8, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (1164, 1, 8, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (1166, 1, 8, 'score');
INSERT INTO `role_stage_perms` VALUES (1167, 1, 8, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (1168, 1, 8, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1169, 1, 8, 'score:list');
INSERT INTO `role_stage_perms` VALUES (1170, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1171, 1, 9, 'sys');
INSERT INTO `role_stage_perms` VALUES (1172, 1, 9, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (1173, 1, 9, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (1174, 1, 9, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (1175, 1, 9, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (1176, 1, 9, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (1177, 1, 9, 'notice');
INSERT INTO `role_stage_perms` VALUES (1178, 1, 9, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (1179, 1, 9, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1180, 1, 9, 'process');
INSERT INTO `role_stage_perms` VALUES (1181, 1, 9, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (1182, 1, 9, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1183, 1, 9, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1184, 1, 9, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (1185, 1, 9, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1186, 1, 9, 'apply');
INSERT INTO `role_stage_perms` VALUES (1187, 1, 9, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (1188, 1, 9, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (1189, 1, 9, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (1190, 1, 9, 'select');
INSERT INTO `role_stage_perms` VALUES (1191, 1, 9, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1192, 1, 9, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (1194, 1, 9, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1195, 1, 9, 'init');
INSERT INTO `role_stage_perms` VALUES (1196, 1, 9, 'mid');
INSERT INTO `role_stage_perms` VALUES (1197, 1, 9, 'fin');
INSERT INTO `role_stage_perms` VALUES (1198, 1, 9, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1199, 1, 9, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1200, 1, 9, 'init:check');
INSERT INTO `role_stage_perms` VALUES (1201, 1, 9, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (1202, 1, 9, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1203, 1, 9, 'init:score');
INSERT INTO `role_stage_perms` VALUES (1204, 1, 9, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1205, 1, 9, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1206, 1, 9, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (1207, 1, 9, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (1208, 1, 9, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1209, 1, 9, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (1210, 1, 9, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (1211, 1, 9, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1212, 1, 9, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (1213, 1, 9, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (1214, 1, 9, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1215, 1, 9, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (1216, 1, 9, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (1217, 1, 9, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (1219, 1, 9, 'score');
INSERT INTO `role_stage_perms` VALUES (1220, 1, 9, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (1221, 1, 9, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1222, 1, 9, 'score:list');
INSERT INTO `role_stage_perms` VALUES (1223, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1224, 1, 10, 'sys');
INSERT INTO `role_stage_perms` VALUES (1225, 1, 10, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (1226, 1, 10, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (1227, 1, 10, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (1228, 1, 10, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (1229, 1, 10, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (1230, 1, 10, 'notice');
INSERT INTO `role_stage_perms` VALUES (1231, 1, 10, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (1232, 1, 10, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1233, 1, 10, 'process');
INSERT INTO `role_stage_perms` VALUES (1234, 1, 10, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (1235, 1, 10, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1236, 1, 10, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1237, 1, 10, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (1238, 1, 10, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1239, 1, 10, 'apply');
INSERT INTO `role_stage_perms` VALUES (1240, 1, 10, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (1241, 1, 10, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (1242, 1, 10, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (1243, 1, 10, 'select');
INSERT INTO `role_stage_perms` VALUES (1244, 1, 10, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1245, 1, 10, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (1247, 1, 10, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1248, 1, 10, 'init');
INSERT INTO `role_stage_perms` VALUES (1249, 1, 10, 'mid');
INSERT INTO `role_stage_perms` VALUES (1250, 1, 10, 'fin');
INSERT INTO `role_stage_perms` VALUES (1251, 1, 10, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1252, 1, 10, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1253, 1, 10, 'init:check');
INSERT INTO `role_stage_perms` VALUES (1254, 1, 10, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (1255, 1, 10, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1256, 1, 10, 'init:score');
INSERT INTO `role_stage_perms` VALUES (1257, 1, 10, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1258, 1, 10, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1259, 1, 10, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (1260, 1, 10, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (1261, 1, 10, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1262, 1, 10, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (1263, 1, 10, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (1264, 1, 10, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1265, 1, 10, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (1266, 1, 10, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (1267, 1, 10, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1268, 1, 10, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (1269, 1, 10, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (1270, 1, 10, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (1272, 1, 10, 'score');
INSERT INTO `role_stage_perms` VALUES (1273, 1, 10, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (1274, 1, 10, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1275, 1, 10, 'score:list');
INSERT INTO `role_stage_perms` VALUES (1276, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1277, 1, 11, 'sys');
INSERT INTO `role_stage_perms` VALUES (1278, 1, 11, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (1279, 1, 11, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (1280, 1, 11, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (1281, 1, 11, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (1282, 1, 11, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (1283, 1, 11, 'notice');
INSERT INTO `role_stage_perms` VALUES (1284, 1, 11, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (1285, 1, 11, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1286, 1, 11, 'process');
INSERT INTO `role_stage_perms` VALUES (1287, 1, 11, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (1288, 1, 11, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1289, 1, 11, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1290, 1, 11, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (1291, 1, 11, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1292, 1, 11, 'apply');
INSERT INTO `role_stage_perms` VALUES (1293, 1, 11, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (1294, 1, 11, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (1295, 1, 11, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (1296, 1, 11, 'select');
INSERT INTO `role_stage_perms` VALUES (1297, 1, 11, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1298, 1, 11, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (1300, 1, 11, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1301, 1, 11, 'init');
INSERT INTO `role_stage_perms` VALUES (1302, 1, 11, 'mid');
INSERT INTO `role_stage_perms` VALUES (1303, 1, 11, 'fin');
INSERT INTO `role_stage_perms` VALUES (1304, 1, 11, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1305, 1, 11, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1306, 1, 11, 'init:check');
INSERT INTO `role_stage_perms` VALUES (1307, 1, 11, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (1308, 1, 11, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1309, 1, 11, 'init:score');
INSERT INTO `role_stage_perms` VALUES (1310, 1, 11, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1311, 1, 11, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1312, 1, 11, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (1313, 1, 11, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (1314, 1, 11, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1315, 1, 11, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (1316, 1, 11, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (1317, 1, 11, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1318, 1, 11, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (1319, 1, 11, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (1320, 1, 11, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1321, 1, 11, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (1322, 1, 11, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (1323, 1, 11, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (1325, 1, 11, 'score');
INSERT INTO `role_stage_perms` VALUES (1326, 1, 11, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (1327, 1, 11, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1328, 1, 11, 'score:list');
INSERT INTO `role_stage_perms` VALUES (1329, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1330, 1, 12, 'sys');
INSERT INTO `role_stage_perms` VALUES (1331, 1, 12, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (1332, 1, 12, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (1333, 1, 12, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (1334, 1, 12, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (1335, 1, 12, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (1336, 1, 12, 'notice');
INSERT INTO `role_stage_perms` VALUES (1337, 1, 12, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (1338, 1, 12, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1339, 1, 12, 'process');
INSERT INTO `role_stage_perms` VALUES (1340, 1, 12, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (1341, 1, 12, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1342, 1, 12, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1343, 1, 12, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (1344, 1, 12, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1345, 1, 12, 'apply');
INSERT INTO `role_stage_perms` VALUES (1346, 1, 12, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (1347, 1, 12, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (1348, 1, 12, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (1349, 1, 12, 'select');
INSERT INTO `role_stage_perms` VALUES (1350, 1, 12, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1351, 1, 12, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (1353, 1, 12, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1354, 1, 12, 'init');
INSERT INTO `role_stage_perms` VALUES (1355, 1, 12, 'mid');
INSERT INTO `role_stage_perms` VALUES (1356, 1, 12, 'fin');
INSERT INTO `role_stage_perms` VALUES (1357, 1, 12, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1358, 1, 12, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1359, 1, 12, 'init:check');
INSERT INTO `role_stage_perms` VALUES (1360, 1, 12, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (1361, 1, 12, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1362, 1, 12, 'init:score');
INSERT INTO `role_stage_perms` VALUES (1363, 1, 12, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1364, 1, 12, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1365, 1, 12, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (1366, 1, 12, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (1367, 1, 12, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1368, 1, 12, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (1369, 1, 12, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (1370, 1, 12, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1371, 1, 12, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (1372, 1, 12, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (1373, 1, 12, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1374, 1, 12, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (1375, 1, 12, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (1376, 1, 12, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (1378, 1, 12, 'score');
INSERT INTO `role_stage_perms` VALUES (1379, 1, 12, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (1380, 1, 12, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1381, 1, 12, 'score:list');
INSERT INTO `role_stage_perms` VALUES (1382, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1383, 1, 13, 'sys');
INSERT INTO `role_stage_perms` VALUES (1384, 1, 13, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (1385, 1, 13, 'role:manage');
INSERT INTO `role_stage_perms` VALUES (1386, 1, 13, 'perms:manage');
INSERT INTO `role_stage_perms` VALUES (1387, 1, 13, 'menu:manage');
INSERT INTO `role_stage_perms` VALUES (1388, 1, 13, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (1389, 1, 13, 'notice');
INSERT INTO `role_stage_perms` VALUES (1390, 1, 13, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (1391, 1, 13, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1392, 1, 13, 'process');
INSERT INTO `role_stage_perms` VALUES (1393, 1, 13, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (1394, 1, 13, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1395, 1, 13, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1396, 1, 13, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (1397, 1, 13, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1398, 1, 13, 'apply');
INSERT INTO `role_stage_perms` VALUES (1399, 1, 13, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (1400, 1, 13, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (1401, 1, 13, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (1402, 1, 13, 'select');
INSERT INTO `role_stage_perms` VALUES (1403, 1, 13, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1404, 1, 13, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (1406, 1, 13, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1407, 1, 13, 'init');
INSERT INTO `role_stage_perms` VALUES (1408, 1, 13, 'mid');
INSERT INTO `role_stage_perms` VALUES (1409, 1, 13, 'fin');
INSERT INTO `role_stage_perms` VALUES (1410, 1, 13, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1411, 1, 13, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1412, 1, 13, 'init:check');
INSERT INTO `role_stage_perms` VALUES (1413, 1, 13, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (1414, 1, 13, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1415, 1, 13, 'init:score');
INSERT INTO `role_stage_perms` VALUES (1416, 1, 13, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1417, 1, 13, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1418, 1, 13, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (1419, 1, 13, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (1420, 1, 13, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1421, 1, 13, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (1422, 1, 13, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (1423, 1, 13, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1424, 1, 13, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (1425, 1, 13, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (1426, 1, 13, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1427, 1, 13, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (1428, 1, 13, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (1429, 1, 13, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (1431, 1, 13, 'score');
INSERT INTO `role_stage_perms` VALUES (1432, 1, 13, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (1433, 1, 13, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1434, 1, 13, 'score:list');
INSERT INTO `role_stage_perms` VALUES (1435, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1436, 2, 0, 'notice');
INSERT INTO `role_stage_perms` VALUES (1437, 2, 0, 'init');
INSERT INTO `role_stage_perms` VALUES (1438, 2, 0, 'mid');
INSERT INTO `role_stage_perms` VALUES (1439, 2, 0, 'fin');
INSERT INTO `role_stage_perms` VALUES (1440, 2, 0, 'process');
INSERT INTO `role_stage_perms` VALUES (1441, 2, 0, 'score');
INSERT INTO `role_stage_perms` VALUES (1442, 2, 1, 'notice');
INSERT INTO `role_stage_perms` VALUES (1443, 2, 1, 'init');
INSERT INTO `role_stage_perms` VALUES (1444, 2, 1, 'mid');
INSERT INTO `role_stage_perms` VALUES (1445, 2, 1, 'fin');
INSERT INTO `role_stage_perms` VALUES (1446, 2, 1, 'process');
INSERT INTO `role_stage_perms` VALUES (1447, 2, 1, 'score');
INSERT INTO `role_stage_perms` VALUES (1448, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1449, 2, 2, 'notice');
INSERT INTO `role_stage_perms` VALUES (1450, 2, 2, 'init');
INSERT INTO `role_stage_perms` VALUES (1451, 2, 2, 'mid');
INSERT INTO `role_stage_perms` VALUES (1452, 2, 2, 'fin');
INSERT INTO `role_stage_perms` VALUES (1453, 2, 2, 'process');
INSERT INTO `role_stage_perms` VALUES (1454, 2, 2, 'score');
INSERT INTO `role_stage_perms` VALUES (1455, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1456, 2, 3, 'notice');
INSERT INTO `role_stage_perms` VALUES (1457, 2, 3, 'init');
INSERT INTO `role_stage_perms` VALUES (1458, 2, 3, 'mid');
INSERT INTO `role_stage_perms` VALUES (1459, 2, 3, 'fin');
INSERT INTO `role_stage_perms` VALUES (1460, 2, 3, 'process');
INSERT INTO `role_stage_perms` VALUES (1461, 2, 3, 'score');
INSERT INTO `role_stage_perms` VALUES (1462, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1463, 2, 4, 'notice');
INSERT INTO `role_stage_perms` VALUES (1464, 2, 4, 'init');
INSERT INTO `role_stage_perms` VALUES (1465, 2, 4, 'mid');
INSERT INTO `role_stage_perms` VALUES (1466, 2, 4, 'fin');
INSERT INTO `role_stage_perms` VALUES (1467, 2, 4, 'process');
INSERT INTO `role_stage_perms` VALUES (1468, 2, 4, 'score');
INSERT INTO `role_stage_perms` VALUES (1469, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1470, 2, 5, 'notice');
INSERT INTO `role_stage_perms` VALUES (1471, 2, 5, 'init');
INSERT INTO `role_stage_perms` VALUES (1472, 2, 5, 'mid');
INSERT INTO `role_stage_perms` VALUES (1473, 2, 5, 'fin');
INSERT INTO `role_stage_perms` VALUES (1474, 2, 5, 'process');
INSERT INTO `role_stage_perms` VALUES (1475, 2, 5, 'score');
INSERT INTO `role_stage_perms` VALUES (1476, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1477, 2, 6, 'notice');
INSERT INTO `role_stage_perms` VALUES (1478, 2, 6, 'init');
INSERT INTO `role_stage_perms` VALUES (1479, 2, 6, 'mid');
INSERT INTO `role_stage_perms` VALUES (1480, 2, 6, 'fin');
INSERT INTO `role_stage_perms` VALUES (1481, 2, 6, 'process');
INSERT INTO `role_stage_perms` VALUES (1482, 2, 6, 'score');
INSERT INTO `role_stage_perms` VALUES (1483, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1484, 2, 7, 'notice');
INSERT INTO `role_stage_perms` VALUES (1485, 2, 7, 'init');
INSERT INTO `role_stage_perms` VALUES (1486, 2, 7, 'mid');
INSERT INTO `role_stage_perms` VALUES (1487, 2, 7, 'fin');
INSERT INTO `role_stage_perms` VALUES (1488, 2, 7, 'process');
INSERT INTO `role_stage_perms` VALUES (1489, 2, 7, 'score');
INSERT INTO `role_stage_perms` VALUES (1490, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1491, 2, 8, 'notice');
INSERT INTO `role_stage_perms` VALUES (1492, 2, 8, 'init');
INSERT INTO `role_stage_perms` VALUES (1493, 2, 8, 'mid');
INSERT INTO `role_stage_perms` VALUES (1494, 2, 8, 'fin');
INSERT INTO `role_stage_perms` VALUES (1495, 2, 8, 'process');
INSERT INTO `role_stage_perms` VALUES (1496, 2, 8, 'score');
INSERT INTO `role_stage_perms` VALUES (1497, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1498, 2, 9, 'notice');
INSERT INTO `role_stage_perms` VALUES (1499, 2, 9, 'init');
INSERT INTO `role_stage_perms` VALUES (1500, 2, 9, 'mid');
INSERT INTO `role_stage_perms` VALUES (1501, 2, 9, 'fin');
INSERT INTO `role_stage_perms` VALUES (1502, 2, 9, 'process');
INSERT INTO `role_stage_perms` VALUES (1503, 2, 9, 'score');
INSERT INTO `role_stage_perms` VALUES (1504, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1505, 2, 10, 'notice');
INSERT INTO `role_stage_perms` VALUES (1506, 2, 10, 'init');
INSERT INTO `role_stage_perms` VALUES (1507, 2, 10, 'mid');
INSERT INTO `role_stage_perms` VALUES (1508, 2, 10, 'fin');
INSERT INTO `role_stage_perms` VALUES (1509, 2, 10, 'process');
INSERT INTO `role_stage_perms` VALUES (1510, 2, 10, 'score');
INSERT INTO `role_stage_perms` VALUES (1511, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1512, 2, 11, 'notice');
INSERT INTO `role_stage_perms` VALUES (1513, 2, 11, 'init');
INSERT INTO `role_stage_perms` VALUES (1514, 2, 11, 'mid');
INSERT INTO `role_stage_perms` VALUES (1515, 2, 11, 'fin');
INSERT INTO `role_stage_perms` VALUES (1516, 2, 11, 'process');
INSERT INTO `role_stage_perms` VALUES (1517, 2, 11, 'score');
INSERT INTO `role_stage_perms` VALUES (1518, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1519, 2, 12, 'notice');
INSERT INTO `role_stage_perms` VALUES (1520, 2, 12, 'init');
INSERT INTO `role_stage_perms` VALUES (1521, 2, 12, 'mid');
INSERT INTO `role_stage_perms` VALUES (1522, 2, 12, 'fin');
INSERT INTO `role_stage_perms` VALUES (1523, 2, 12, 'process');
INSERT INTO `role_stage_perms` VALUES (1524, 2, 12, 'score');
INSERT INTO `role_stage_perms` VALUES (1525, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1526, 2, 13, 'notice');
INSERT INTO `role_stage_perms` VALUES (1527, 2, 13, 'init');
INSERT INTO `role_stage_perms` VALUES (1528, 2, 13, 'mid');
INSERT INTO `role_stage_perms` VALUES (1529, 2, 13, 'fin');
INSERT INTO `role_stage_perms` VALUES (1530, 2, 13, 'process');
INSERT INTO `role_stage_perms` VALUES (1531, 2, 13, 'score');
INSERT INTO `role_stage_perms` VALUES (1532, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1533, 2, 0, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1534, 2, 1, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1535, 2, 2, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1536, 2, 3, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1537, 2, 4, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1538, 2, 5, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1539, 2, 6, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1540, 2, 7, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1541, 2, 8, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1542, 2, 9, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1543, 2, 10, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1544, 2, 11, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1545, 2, 12, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1546, 2, 13, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (1547, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1548, 2, 0, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1549, 2, 1, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1550, 2, 2, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1551, 2, 3, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1552, 2, 4, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1553, 2, 5, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1554, 2, 6, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1555, 2, 7, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1556, 2, 8, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1557, 2, 9, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1558, 2, 10, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1559, 2, 11, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1560, 2, 12, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1561, 2, 13, 'process:my');
INSERT INTO `role_stage_perms` VALUES (1562, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1563, 2, 0, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1564, 2, 1, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1565, 2, 2, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1566, 2, 3, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1567, 2, 4, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1568, 2, 5, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1569, 2, 6, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1570, 2, 7, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1571, 2, 8, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1572, 2, 9, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1573, 2, 10, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1574, 2, 11, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1575, 2, 12, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1576, 2, 13, 'process:record');
INSERT INTO `role_stage_perms` VALUES (1577, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1578, 2, 0, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1579, 2, 1, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1580, 2, 2, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1581, 2, 3, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1582, 2, 4, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1583, 2, 5, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1584, 2, 6, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1585, 2, 7, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1586, 2, 8, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1587, 2, 9, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1588, 2, 10, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1589, 2, 11, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1590, 2, 12, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1591, 2, 13, 'process:statistics');
INSERT INTO `role_stage_perms` VALUES (1592, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1593, 2, 0, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1594, 2, 1, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1595, 2, 2, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1596, 2, 3, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1597, 2, 4, 'select:view');
INSERT INTO `role_stage_perms` VALUES (1598, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1599, 2, 0, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1600, 2, 1, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1601, 2, 2, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1602, 2, 3, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1603, 2, 4, 'select:result');
INSERT INTO `role_stage_perms` VALUES (1604, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1605, 2, 5, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1606, 2, 6, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1607, 2, 7, 'init:report');
INSERT INTO `role_stage_perms` VALUES (1608, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1609, 2, 0, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1610, 2, 1, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1611, 2, 2, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1612, 2, 3, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1613, 2, 4, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1614, 2, 5, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1615, 2, 6, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1616, 2, 7, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1617, 2, 8, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1618, 2, 9, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1619, 2, 10, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1620, 2, 11, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1621, 2, 12, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1622, 2, 13, 'init:list');
INSERT INTO `role_stage_perms` VALUES (1623, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1624, 2, 0, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1625, 2, 1, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1626, 2, 2, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1627, 2, 3, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1628, 2, 4, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1629, 2, 5, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1630, 2, 6, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1631, 2, 7, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1632, 2, 8, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1633, 2, 9, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1634, 2, 10, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1635, 2, 11, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1636, 2, 12, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1637, 2, 13, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (1638, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1639, 2, 8, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1640, 2, 9, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1641, 2, 10, 'mid:report');
INSERT INTO `role_stage_perms` VALUES (1642, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1643, 2, 0, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1644, 2, 1, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1645, 2, 2, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1646, 2, 3, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1647, 2, 4, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1648, 2, 5, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1649, 2, 6, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1650, 2, 7, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1651, 2, 8, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1652, 2, 9, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1653, 2, 10, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1654, 2, 11, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1655, 2, 12, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1656, 2, 13, 'mid:list');
INSERT INTO `role_stage_perms` VALUES (1657, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1658, 2, 0, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1659, 2, 1, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1660, 2, 2, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1661, 2, 3, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1662, 2, 4, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1663, 2, 5, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1664, 2, 6, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1665, 2, 7, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1666, 2, 8, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1667, 2, 9, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1668, 2, 10, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1669, 2, 11, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1670, 2, 12, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1671, 2, 13, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (1672, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1673, 2, 11, 'fin:apply');
INSERT INTO `role_stage_perms` VALUES (1674, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1675, 2, 0, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1676, 2, 1, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1677, 2, 2, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1678, 2, 3, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1679, 2, 4, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1680, 2, 5, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1681, 2, 6, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1682, 2, 7, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1683, 2, 8, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1684, 2, 9, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1685, 2, 10, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1686, 2, 11, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1687, 2, 12, 'fin:list');
INSERT INTO `role_stage_perms` VALUES (1688, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1690, 2, 0, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1691, 2, 1, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1692, 2, 2, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1693, 2, 3, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1694, 2, 4, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1695, 2, 5, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1696, 2, 6, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1697, 2, 7, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1698, 2, 8, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1699, 2, 9, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1700, 2, 10, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1701, 2, 11, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1702, 2, 12, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1703, 2, 13, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (1704, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1705, 2, 0, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1706, 2, 1, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1707, 2, 2, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1708, 2, 3, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1709, 2, 4, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1710, 2, 5, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1711, 2, 6, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1712, 2, 7, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1713, 2, 8, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1714, 2, 9, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1715, 2, 10, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1716, 2, 11, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1717, 2, 12, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1718, 2, 13, 'score:my');
INSERT INTO `role_stage_perms` VALUES (1719, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1734, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1742, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1750, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1758, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1766, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1774, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1782, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1790, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1798, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1806, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1814, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1822, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1830, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1838, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1846, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1861, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1876, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1891, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1895, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1899, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1905, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1911, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1917, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1921, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1936, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1951, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1955, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1959, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1974, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1983, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (1992, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2001, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2010, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2019, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2028, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2037, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2046, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2055, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2064, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2073, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2082, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2091, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2100, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2115, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2119, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2123, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2129, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2133, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2137, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2141, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2145, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2149, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2164, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2165, 5, 0, 'notice');
INSERT INTO `role_stage_perms` VALUES (2166, 5, 0, 'init');
INSERT INTO `role_stage_perms` VALUES (2167, 5, 0, 'mid');
INSERT INTO `role_stage_perms` VALUES (2168, 5, 0, 'fin');
INSERT INTO `role_stage_perms` VALUES (2169, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2170, 5, 1, 'notice');
INSERT INTO `role_stage_perms` VALUES (2171, 5, 1, 'init');
INSERT INTO `role_stage_perms` VALUES (2172, 5, 1, 'mid');
INSERT INTO `role_stage_perms` VALUES (2173, 5, 1, 'fin');
INSERT INTO `role_stage_perms` VALUES (2174, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2175, 5, 2, 'notice');
INSERT INTO `role_stage_perms` VALUES (2176, 5, 2, 'init');
INSERT INTO `role_stage_perms` VALUES (2177, 5, 2, 'mid');
INSERT INTO `role_stage_perms` VALUES (2178, 5, 2, 'fin');
INSERT INTO `role_stage_perms` VALUES (2179, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2180, 5, 3, 'notice');
INSERT INTO `role_stage_perms` VALUES (2181, 5, 3, 'init');
INSERT INTO `role_stage_perms` VALUES (2182, 5, 3, 'mid');
INSERT INTO `role_stage_perms` VALUES (2183, 5, 3, 'fin');
INSERT INTO `role_stage_perms` VALUES (2184, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2185, 5, 4, 'notice');
INSERT INTO `role_stage_perms` VALUES (2186, 5, 4, 'init');
INSERT INTO `role_stage_perms` VALUES (2187, 5, 4, 'mid');
INSERT INTO `role_stage_perms` VALUES (2188, 5, 4, 'fin');
INSERT INTO `role_stage_perms` VALUES (2189, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2190, 5, 5, 'notice');
INSERT INTO `role_stage_perms` VALUES (2191, 5, 5, 'init');
INSERT INTO `role_stage_perms` VALUES (2192, 5, 5, 'mid');
INSERT INTO `role_stage_perms` VALUES (2193, 5, 5, 'fin');
INSERT INTO `role_stage_perms` VALUES (2194, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2195, 5, 6, 'notice');
INSERT INTO `role_stage_perms` VALUES (2196, 5, 6, 'init');
INSERT INTO `role_stage_perms` VALUES (2197, 5, 6, 'mid');
INSERT INTO `role_stage_perms` VALUES (2198, 5, 6, 'fin');
INSERT INTO `role_stage_perms` VALUES (2199, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2200, 5, 7, 'notice');
INSERT INTO `role_stage_perms` VALUES (2201, 5, 7, 'init');
INSERT INTO `role_stage_perms` VALUES (2202, 5, 7, 'mid');
INSERT INTO `role_stage_perms` VALUES (2203, 5, 7, 'fin');
INSERT INTO `role_stage_perms` VALUES (2204, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2205, 5, 8, 'notice');
INSERT INTO `role_stage_perms` VALUES (2206, 5, 8, 'init');
INSERT INTO `role_stage_perms` VALUES (2207, 5, 8, 'mid');
INSERT INTO `role_stage_perms` VALUES (2208, 5, 8, 'fin');
INSERT INTO `role_stage_perms` VALUES (2209, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2210, 5, 9, 'notice');
INSERT INTO `role_stage_perms` VALUES (2211, 5, 9, 'init');
INSERT INTO `role_stage_perms` VALUES (2212, 5, 9, 'mid');
INSERT INTO `role_stage_perms` VALUES (2213, 5, 9, 'fin');
INSERT INTO `role_stage_perms` VALUES (2214, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2215, 5, 10, 'notice');
INSERT INTO `role_stage_perms` VALUES (2216, 5, 10, 'init');
INSERT INTO `role_stage_perms` VALUES (2217, 5, 10, 'mid');
INSERT INTO `role_stage_perms` VALUES (2218, 5, 10, 'fin');
INSERT INTO `role_stage_perms` VALUES (2219, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2220, 5, 11, 'notice');
INSERT INTO `role_stage_perms` VALUES (2221, 5, 11, 'init');
INSERT INTO `role_stage_perms` VALUES (2222, 5, 11, 'mid');
INSERT INTO `role_stage_perms` VALUES (2223, 5, 11, 'fin');
INSERT INTO `role_stage_perms` VALUES (2224, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2225, 5, 12, 'notice');
INSERT INTO `role_stage_perms` VALUES (2226, 5, 12, 'init');
INSERT INTO `role_stage_perms` VALUES (2227, 5, 12, 'mid');
INSERT INTO `role_stage_perms` VALUES (2228, 5, 12, 'fin');
INSERT INTO `role_stage_perms` VALUES (2229, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2230, 5, 13, 'notice');
INSERT INTO `role_stage_perms` VALUES (2231, 5, 13, 'init');
INSERT INTO `role_stage_perms` VALUES (2232, 5, 13, 'mid');
INSERT INTO `role_stage_perms` VALUES (2233, 5, 13, 'fin');
INSERT INTO `role_stage_perms` VALUES (2234, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2235, 5, 0, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2236, 5, 1, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2237, 5, 2, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2238, 5, 3, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2239, 5, 4, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2240, 5, 5, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2241, 5, 6, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2242, 5, 7, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2243, 5, 8, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2244, 5, 9, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2245, 5, 10, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2246, 5, 11, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2247, 5, 12, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2248, 5, 13, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2249, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2250, 5, 7, 'init:score');
INSERT INTO `role_stage_perms` VALUES (2251, 5, 10, 'mid:score');
INSERT INTO `role_stage_perms` VALUES (2252, 5, 13, 'fin:score');
INSERT INTO `role_stage_perms` VALUES (2253, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2254, 5, 0, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2255, 5, 1, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2256, 5, 2, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2257, 5, 3, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2258, 5, 4, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2259, 5, 5, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2260, 5, 6, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2261, 5, 7, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2262, 5, 8, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2263, 5, 9, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2264, 5, 10, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2265, 5, 11, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2266, 5, 12, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2267, 5, 13, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2268, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2269, 5, 0, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2270, 5, 1, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2271, 5, 2, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2272, 5, 3, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2273, 5, 4, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2274, 5, 5, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2275, 5, 6, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2276, 5, 7, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2277, 5, 8, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2278, 5, 9, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2279, 5, 10, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2280, 5, 11, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2281, 5, 12, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2282, 5, 13, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2283, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2284, 5, 0, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2285, 5, 1, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2286, 5, 2, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2287, 5, 3, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2288, 5, 4, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2289, 5, 5, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2290, 5, 6, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2291, 5, 7, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2292, 5, 8, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2293, 5, 9, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2294, 5, 10, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2295, 5, 11, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2296, 5, 12, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2297, 5, 13, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2311, 2, 1, 'select');
INSERT INTO `role_stage_perms` VALUES (2312, 2, 2, 'select');
INSERT INTO `role_stage_perms` VALUES (2313, 2, 3, 'select');
INSERT INTO `role_stage_perms` VALUES (2314, 2, 4, 'select');
INSERT INTO `role_stage_perms` VALUES (2315, 2, 5, 'select');
INSERT INTO `role_stage_perms` VALUES (2316, 2, 6, 'select');
INSERT INTO `role_stage_perms` VALUES (2317, 2, 7, 'select');
INSERT INTO `role_stage_perms` VALUES (2318, 2, 8, 'select');
INSERT INTO `role_stage_perms` VALUES (2319, 2, 9, 'select');
INSERT INTO `role_stage_perms` VALUES (2320, 2, 10, 'select');
INSERT INTO `role_stage_perms` VALUES (2321, 2, 11, 'select');
INSERT INTO `role_stage_perms` VALUES (2322, 2, 12, 'select');
INSERT INTO `role_stage_perms` VALUES (2323, 2, 13, 'select');
INSERT INTO `role_stage_perms` VALUES (2392, 4, 1, 'apply');
INSERT INTO `role_stage_perms` VALUES (2393, 4, 2, 'apply');
INSERT INTO `role_stage_perms` VALUES (2394, 4, 3, 'apply');
INSERT INTO `role_stage_perms` VALUES (2395, 4, 4, 'apply');
INSERT INTO `role_stage_perms` VALUES (2396, 4, 5, 'apply');
INSERT INTO `role_stage_perms` VALUES (2397, 4, 6, 'apply');
INSERT INTO `role_stage_perms` VALUES (2398, 4, 7, 'apply');
INSERT INTO `role_stage_perms` VALUES (2399, 4, 8, 'apply');
INSERT INTO `role_stage_perms` VALUES (2400, 4, 9, 'apply');
INSERT INTO `role_stage_perms` VALUES (2401, 4, 10, 'apply');
INSERT INTO `role_stage_perms` VALUES (2402, 4, 11, 'apply');
INSERT INTO `role_stage_perms` VALUES (2403, 4, 12, 'apply');
INSERT INTO `role_stage_perms` VALUES (2404, 4, 13, 'apply');
INSERT INTO `role_stage_perms` VALUES (2405, 4, 0, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2406, 4, 1, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2407, 4, 2, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2408, 4, 3, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2409, 4, 4, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2410, 4, 5, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2411, 4, 6, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2412, 4, 7, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2413, 4, 8, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2414, 4, 9, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2415, 4, 10, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2416, 4, 11, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2417, 4, 12, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2418, 4, 13, 'apply:office');
INSERT INTO `role_stage_perms` VALUES (2419, 4, 0, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2420, 4, 1, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2421, 4, 2, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2422, 4, 3, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2423, 4, 4, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2424, 4, 5, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2425, 4, 6, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2426, 4, 7, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2427, 4, 8, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2428, 4, 9, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2429, 4, 10, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2430, 4, 11, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2431, 4, 12, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2432, 4, 13, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2433, 4, 0, 'fin');
INSERT INTO `role_stage_perms` VALUES (2434, 4, 1, 'fin');
INSERT INTO `role_stage_perms` VALUES (2435, 4, 2, 'fin');
INSERT INTO `role_stage_perms` VALUES (2436, 4, 3, 'fin');
INSERT INTO `role_stage_perms` VALUES (2437, 4, 4, 'fin');
INSERT INTO `role_stage_perms` VALUES (2438, 4, 5, 'fin');
INSERT INTO `role_stage_perms` VALUES (2439, 4, 6, 'fin');
INSERT INTO `role_stage_perms` VALUES (2440, 4, 7, 'fin');
INSERT INTO `role_stage_perms` VALUES (2441, 4, 8, 'fin');
INSERT INTO `role_stage_perms` VALUES (2442, 4, 9, 'fin');
INSERT INTO `role_stage_perms` VALUES (2443, 4, 10, 'fin');
INSERT INTO `role_stage_perms` VALUES (2444, 4, 11, 'fin');
INSERT INTO `role_stage_perms` VALUES (2445, 4, 12, 'fin');
INSERT INTO `role_stage_perms` VALUES (2446, 4, 13, 'fin');
INSERT INTO `role_stage_perms` VALUES (2447, 4, 0, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2448, 4, 1, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2449, 4, 2, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2450, 4, 3, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2451, 4, 4, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2452, 4, 5, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2453, 4, 6, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2454, 4, 7, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2455, 4, 8, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2456, 4, 9, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2457, 4, 10, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2458, 4, 11, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2459, 4, 12, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2460, 4, 13, 'fin:arrange');
INSERT INTO `role_stage_perms` VALUES (2461, 4, 0, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2462, 4, 1, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2463, 4, 2, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2464, 4, 3, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2465, 4, 4, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2466, 4, 5, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2467, 4, 6, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2468, 4, 7, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2469, 4, 8, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2470, 4, 9, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2471, 4, 10, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2472, 4, 11, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2473, 4, 12, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2474, 4, 13, 'fin:cross');
INSERT INTO `role_stage_perms` VALUES (2475, 4, 0, 'init');
INSERT INTO `role_stage_perms` VALUES (2476, 4, 1, 'init');
INSERT INTO `role_stage_perms` VALUES (2477, 4, 2, 'init');
INSERT INTO `role_stage_perms` VALUES (2478, 4, 3, 'init');
INSERT INTO `role_stage_perms` VALUES (2479, 4, 4, 'init');
INSERT INTO `role_stage_perms` VALUES (2480, 4, 5, 'init');
INSERT INTO `role_stage_perms` VALUES (2481, 4, 6, 'init');
INSERT INTO `role_stage_perms` VALUES (2482, 4, 7, 'init');
INSERT INTO `role_stage_perms` VALUES (2483, 4, 8, 'init');
INSERT INTO `role_stage_perms` VALUES (2484, 4, 9, 'init');
INSERT INTO `role_stage_perms` VALUES (2485, 4, 10, 'init');
INSERT INTO `role_stage_perms` VALUES (2486, 4, 11, 'init');
INSERT INTO `role_stage_perms` VALUES (2487, 4, 12, 'init');
INSERT INTO `role_stage_perms` VALUES (2488, 4, 13, 'init');
INSERT INTO `role_stage_perms` VALUES (2489, 4, 0, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2490, 4, 1, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2491, 4, 2, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2492, 4, 3, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2493, 4, 4, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2494, 4, 5, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2495, 4, 6, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2496, 4, 7, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2497, 4, 8, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2498, 4, 9, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2499, 4, 10, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2500, 4, 11, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2501, 4, 12, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2502, 4, 13, 'init:arrange');
INSERT INTO `role_stage_perms` VALUES (2503, NULL, NULL, NULL);
INSERT INTO `role_stage_perms` VALUES (2504, 4, 0, 'mid');
INSERT INTO `role_stage_perms` VALUES (2505, 4, 1, 'mid');
INSERT INTO `role_stage_perms` VALUES (2506, 4, 2, 'mid');
INSERT INTO `role_stage_perms` VALUES (2507, 4, 3, 'mid');
INSERT INTO `role_stage_perms` VALUES (2508, 4, 4, 'mid');
INSERT INTO `role_stage_perms` VALUES (2509, 4, 5, 'mid');
INSERT INTO `role_stage_perms` VALUES (2510, 4, 6, 'mid');
INSERT INTO `role_stage_perms` VALUES (2511, 4, 7, 'mid');
INSERT INTO `role_stage_perms` VALUES (2512, 4, 8, 'mid');
INSERT INTO `role_stage_perms` VALUES (2513, 4, 9, 'mid');
INSERT INTO `role_stage_perms` VALUES (2514, 4, 10, 'mid');
INSERT INTO `role_stage_perms` VALUES (2515, 4, 11, 'mid');
INSERT INTO `role_stage_perms` VALUES (2516, 4, 12, 'mid');
INSERT INTO `role_stage_perms` VALUES (2517, 4, 13, 'mid');
INSERT INTO `role_stage_perms` VALUES (2518, 4, 0, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2519, 4, 1, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2520, 4, 2, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2521, 4, 3, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2522, 4, 4, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2523, 4, 5, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2524, 4, 6, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2525, 4, 7, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2526, 4, 8, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2527, 4, 9, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2528, 4, 10, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2529, 4, 11, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2530, 4, 12, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2531, 4, 13, 'mid:arrange');
INSERT INTO `role_stage_perms` VALUES (2532, 4, 0, 'notice');
INSERT INTO `role_stage_perms` VALUES (2533, 4, 1, 'notice');
INSERT INTO `role_stage_perms` VALUES (2534, 4, 2, 'notice');
INSERT INTO `role_stage_perms` VALUES (2535, 4, 3, 'notice');
INSERT INTO `role_stage_perms` VALUES (2536, 4, 4, 'notice');
INSERT INTO `role_stage_perms` VALUES (2537, 4, 5, 'notice');
INSERT INTO `role_stage_perms` VALUES (2538, 4, 6, 'notice');
INSERT INTO `role_stage_perms` VALUES (2539, 4, 7, 'notice');
INSERT INTO `role_stage_perms` VALUES (2540, 4, 8, 'notice');
INSERT INTO `role_stage_perms` VALUES (2541, 4, 9, 'notice');
INSERT INTO `role_stage_perms` VALUES (2542, 4, 10, 'notice');
INSERT INTO `role_stage_perms` VALUES (2543, 4, 11, 'notice');
INSERT INTO `role_stage_perms` VALUES (2544, 4, 12, 'notice');
INSERT INTO `role_stage_perms` VALUES (2545, 4, 13, 'notice');
INSERT INTO `role_stage_perms` VALUES (2546, 4, 0, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2547, 4, 1, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2548, 4, 2, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2549, 4, 3, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2550, 4, 4, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2551, 4, 5, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2552, 4, 6, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2553, 4, 7, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2554, 4, 8, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2555, 4, 9, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2556, 4, 10, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2557, 4, 11, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2558, 4, 12, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2559, 4, 13, 'notice:manage');
INSERT INTO `role_stage_perms` VALUES (2560, 4, 0, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2561, 4, 1, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2562, 4, 2, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2563, 4, 3, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2564, 4, 4, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2565, 4, 5, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2566, 4, 6, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2567, 4, 7, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2568, 4, 8, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2569, 4, 9, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2570, 4, 10, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2571, 4, 11, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2572, 4, 12, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2573, 4, 13, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2574, 4, 0, 'score');
INSERT INTO `role_stage_perms` VALUES (2575, 4, 1, 'score');
INSERT INTO `role_stage_perms` VALUES (2576, 4, 2, 'score');
INSERT INTO `role_stage_perms` VALUES (2577, 4, 3, 'score');
INSERT INTO `role_stage_perms` VALUES (2578, 4, 4, 'score');
INSERT INTO `role_stage_perms` VALUES (2579, 4, 5, 'score');
INSERT INTO `role_stage_perms` VALUES (2580, 4, 6, 'score');
INSERT INTO `role_stage_perms` VALUES (2581, 4, 7, 'score');
INSERT INTO `role_stage_perms` VALUES (2582, 4, 8, 'score');
INSERT INTO `role_stage_perms` VALUES (2583, 4, 9, 'score');
INSERT INTO `role_stage_perms` VALUES (2584, 4, 10, 'score');
INSERT INTO `role_stage_perms` VALUES (2585, 4, 11, 'score');
INSERT INTO `role_stage_perms` VALUES (2586, 4, 12, 'score');
INSERT INTO `role_stage_perms` VALUES (2587, 4, 13, 'score');
INSERT INTO `role_stage_perms` VALUES (2588, 4, 0, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2589, 4, 1, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2590, 4, 2, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2591, 4, 3, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2592, 4, 4, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2593, 4, 5, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2594, 4, 6, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2595, 4, 7, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2596, 4, 8, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2597, 4, 9, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2598, 4, 10, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2599, 4, 11, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2600, 4, 12, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2601, 4, 13, 'score:weight');
INSERT INTO `role_stage_perms` VALUES (2602, 4, 0, 'select');
INSERT INTO `role_stage_perms` VALUES (2603, 4, 1, 'select');
INSERT INTO `role_stage_perms` VALUES (2604, 4, 2, 'select');
INSERT INTO `role_stage_perms` VALUES (2605, 4, 3, 'select');
INSERT INTO `role_stage_perms` VALUES (2606, 4, 4, 'select');
INSERT INTO `role_stage_perms` VALUES (2607, 4, 5, 'select');
INSERT INTO `role_stage_perms` VALUES (2608, 4, 6, 'select');
INSERT INTO `role_stage_perms` VALUES (2609, 4, 7, 'select');
INSERT INTO `role_stage_perms` VALUES (2610, 4, 8, 'select');
INSERT INTO `role_stage_perms` VALUES (2611, 4, 9, 'select');
INSERT INTO `role_stage_perms` VALUES (2612, 4, 10, 'select');
INSERT INTO `role_stage_perms` VALUES (2613, 4, 11, 'select');
INSERT INTO `role_stage_perms` VALUES (2614, 4, 12, 'select');
INSERT INTO `role_stage_perms` VALUES (2615, 4, 13, 'select');
INSERT INTO `role_stage_perms` VALUES (2616, 4, 0, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2617, 4, 1, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2618, 4, 2, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2619, 4, 3, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2620, 4, 4, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2621, 4, 5, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2622, 4, 6, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2623, 4, 7, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2624, 4, 8, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2625, 4, 9, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2626, 4, 10, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2627, 4, 11, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2628, 4, 12, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2629, 4, 13, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2630, 4, 0, 'sys');
INSERT INTO `role_stage_perms` VALUES (2631, 4, 1, 'sys');
INSERT INTO `role_stage_perms` VALUES (2632, 4, 2, 'sys');
INSERT INTO `role_stage_perms` VALUES (2633, 4, 3, 'sys');
INSERT INTO `role_stage_perms` VALUES (2634, 4, 4, 'sys');
INSERT INTO `role_stage_perms` VALUES (2635, 4, 5, 'sys');
INSERT INTO `role_stage_perms` VALUES (2636, 4, 6, 'sys');
INSERT INTO `role_stage_perms` VALUES (2637, 4, 7, 'sys');
INSERT INTO `role_stage_perms` VALUES (2638, 4, 8, 'sys');
INSERT INTO `role_stage_perms` VALUES (2639, 4, 9, 'sys');
INSERT INTO `role_stage_perms` VALUES (2640, 4, 10, 'sys');
INSERT INTO `role_stage_perms` VALUES (2641, 4, 11, 'sys');
INSERT INTO `role_stage_perms` VALUES (2642, 4, 12, 'sys');
INSERT INTO `role_stage_perms` VALUES (2643, 4, 13, 'sys');
INSERT INTO `role_stage_perms` VALUES (2644, 4, 0, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2645, 4, 1, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2646, 4, 2, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2647, 4, 3, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2648, 4, 4, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2649, 4, 5, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2650, 4, 6, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2651, 4, 7, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2652, 4, 8, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2653, 4, 9, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2654, 4, 10, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2655, 4, 11, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2656, 4, 12, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2657, 4, 13, 'sys:stage');
INSERT INTO `role_stage_perms` VALUES (2658, 4, 0, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2659, 4, 1, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2660, 4, 2, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2661, 4, 3, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2662, 4, 4, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2663, 4, 5, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2664, 4, 6, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2665, 4, 7, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2666, 4, 8, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2667, 4, 9, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2668, 4, 10, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2669, 4, 11, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2670, 4, 12, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2671, 4, 13, 'user:manage');
INSERT INTO `role_stage_perms` VALUES (2672, 4, 0, 'apply');
INSERT INTO `role_stage_perms` VALUES (2673, 3, 1, 'apply');
INSERT INTO `role_stage_perms` VALUES (2674, 3, 2, 'apply');
INSERT INTO `role_stage_perms` VALUES (2675, 3, 3, 'apply');
INSERT INTO `role_stage_perms` VALUES (2676, 3, 4, 'apply');
INSERT INTO `role_stage_perms` VALUES (2677, 3, 5, 'apply');
INSERT INTO `role_stage_perms` VALUES (2678, 3, 6, 'apply');
INSERT INTO `role_stage_perms` VALUES (2679, 3, 7, 'apply');
INSERT INTO `role_stage_perms` VALUES (2680, 3, 8, 'apply');
INSERT INTO `role_stage_perms` VALUES (2681, 3, 9, 'apply');
INSERT INTO `role_stage_perms` VALUES (2682, 3, 10, 'apply');
INSERT INTO `role_stage_perms` VALUES (2683, 3, 11, 'apply');
INSERT INTO `role_stage_perms` VALUES (2684, 3, 12, 'apply');
INSERT INTO `role_stage_perms` VALUES (2685, 3, 13, 'apply');
INSERT INTO `role_stage_perms` VALUES (2686, 3, 0, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2687, 3, 1, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2688, 3, 2, 'apply:result');
INSERT INTO `role_stage_perms` VALUES (2689, 3, 0, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (2690, 3, 1, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (2691, 3, 2, 'apply:teacher');
INSERT INTO `role_stage_perms` VALUES (2692, 3, 0, 'fin');
INSERT INTO `role_stage_perms` VALUES (2693, 3, 1, 'fin');
INSERT INTO `role_stage_perms` VALUES (2694, 3, 2, 'fin');
INSERT INTO `role_stage_perms` VALUES (2695, 3, 3, 'fin');
INSERT INTO `role_stage_perms` VALUES (2696, 3, 4, 'fin');
INSERT INTO `role_stage_perms` VALUES (2697, 3, 5, 'fin');
INSERT INTO `role_stage_perms` VALUES (2698, 3, 6, 'fin');
INSERT INTO `role_stage_perms` VALUES (2699, 3, 7, 'fin');
INSERT INTO `role_stage_perms` VALUES (2700, 3, 8, 'fin');
INSERT INTO `role_stage_perms` VALUES (2701, 3, 9, 'fin');
INSERT INTO `role_stage_perms` VALUES (2702, 3, 10, 'fin');
INSERT INTO `role_stage_perms` VALUES (2703, 3, 11, 'fin');
INSERT INTO `role_stage_perms` VALUES (2704, 3, 12, 'fin');
INSERT INTO `role_stage_perms` VALUES (2705, 3, 13, 'fin');
INSERT INTO `role_stage_perms` VALUES (2706, 3, 11, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (2707, 3, 12, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (2708, 3, 13, 'fin:check');
INSERT INTO `role_stage_perms` VALUES (2709, 3, 11, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (2710, 3, 12, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (2711, 3, 13, 'fin:judge');
INSERT INTO `role_stage_perms` VALUES (2712, 3, 0, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2713, 3, 1, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2714, 3, 2, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2715, 3, 3, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2716, 3, 4, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2717, 3, 5, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2718, 3, 6, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2719, 3, 7, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2720, 3, 8, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2721, 3, 9, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2722, 3, 10, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2723, 3, 11, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2724, 3, 12, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2725, 3, 13, 'fin:myarrange');
INSERT INTO `role_stage_perms` VALUES (2726, 3, 0, 'init');
INSERT INTO `role_stage_perms` VALUES (2727, 3, 1, 'init');
INSERT INTO `role_stage_perms` VALUES (2728, 3, 2, 'init');
INSERT INTO `role_stage_perms` VALUES (2729, 3, 3, 'init');
INSERT INTO `role_stage_perms` VALUES (2730, 3, 4, 'init');
INSERT INTO `role_stage_perms` VALUES (2731, 3, 5, 'init');
INSERT INTO `role_stage_perms` VALUES (2732, 3, 6, 'init');
INSERT INTO `role_stage_perms` VALUES (2733, 3, 7, 'init');
INSERT INTO `role_stage_perms` VALUES (2734, 3, 8, 'init');
INSERT INTO `role_stage_perms` VALUES (2735, 3, 9, 'init');
INSERT INTO `role_stage_perms` VALUES (2736, 3, 10, 'init');
INSERT INTO `role_stage_perms` VALUES (2737, 3, 11, 'init');
INSERT INTO `role_stage_perms` VALUES (2738, 3, 12, 'init');
INSERT INTO `role_stage_perms` VALUES (2739, 3, 13, 'init');
INSERT INTO `role_stage_perms` VALUES (2740, 3, 5, 'init:check');
INSERT INTO `role_stage_perms` VALUES (2741, 3, 6, 'init:check');
INSERT INTO `role_stage_perms` VALUES (2742, 3, 7, 'init:check');
INSERT INTO `role_stage_perms` VALUES (2743, 3, 0, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2744, 3, 1, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2745, 3, 2, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2746, 3, 3, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2747, 3, 4, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2748, 3, 5, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2749, 3, 6, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2750, 3, 7, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2751, 3, 8, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2752, 3, 9, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2753, 3, 10, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2754, 3, 11, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2755, 3, 12, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2756, 3, 13, 'init:myarrange');
INSERT INTO `role_stage_perms` VALUES (2757, 3, 0, 'mid');
INSERT INTO `role_stage_perms` VALUES (2758, 3, 1, 'mid');
INSERT INTO `role_stage_perms` VALUES (2759, 3, 2, 'mid');
INSERT INTO `role_stage_perms` VALUES (2760, 3, 3, 'mid');
INSERT INTO `role_stage_perms` VALUES (2761, 3, 4, 'mid');
INSERT INTO `role_stage_perms` VALUES (2762, 3, 5, 'mid');
INSERT INTO `role_stage_perms` VALUES (2763, 3, 6, 'mid');
INSERT INTO `role_stage_perms` VALUES (2764, 3, 7, 'mid');
INSERT INTO `role_stage_perms` VALUES (2765, 3, 8, 'mid');
INSERT INTO `role_stage_perms` VALUES (2766, 3, 9, 'mid');
INSERT INTO `role_stage_perms` VALUES (2767, 3, 10, 'mid');
INSERT INTO `role_stage_perms` VALUES (2768, 3, 11, 'mid');
INSERT INTO `role_stage_perms` VALUES (2769, 3, 12, 'mid');
INSERT INTO `role_stage_perms` VALUES (2770, 3, 13, 'mid');
INSERT INTO `role_stage_perms` VALUES (2771, 3, 8, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (2772, 3, 9, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (2773, 3, 10, 'mid:check');
INSERT INTO `role_stage_perms` VALUES (2774, 3, 0, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2775, 3, 1, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2776, 3, 2, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2777, 3, 3, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2778, 3, 4, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2779, 3, 5, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2780, 3, 6, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2781, 3, 7, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2782, 3, 8, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2783, 3, 9, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2784, 3, 10, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2785, 3, 11, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2786, 3, 12, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2787, 3, 13, 'mid:myarrange');
INSERT INTO `role_stage_perms` VALUES (2788, 3, 0, 'notice');
INSERT INTO `role_stage_perms` VALUES (2789, 3, 1, 'notice');
INSERT INTO `role_stage_perms` VALUES (2790, 3, 2, 'notice');
INSERT INTO `role_stage_perms` VALUES (2791, 3, 3, 'notice');
INSERT INTO `role_stage_perms` VALUES (2792, 3, 4, 'notice');
INSERT INTO `role_stage_perms` VALUES (2793, 3, 5, 'notice');
INSERT INTO `role_stage_perms` VALUES (2794, 3, 6, 'notice');
INSERT INTO `role_stage_perms` VALUES (2795, 3, 7, 'notice');
INSERT INTO `role_stage_perms` VALUES (2796, 3, 8, 'notice');
INSERT INTO `role_stage_perms` VALUES (2797, 3, 9, 'notice');
INSERT INTO `role_stage_perms` VALUES (2798, 3, 10, 'notice');
INSERT INTO `role_stage_perms` VALUES (2799, 3, 11, 'notice');
INSERT INTO `role_stage_perms` VALUES (2800, 3, 12, 'notice');
INSERT INTO `role_stage_perms` VALUES (2801, 3, 13, 'notice');
INSERT INTO `role_stage_perms` VALUES (2802, 3, 0, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2803, 3, 1, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2804, 3, 2, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2805, 3, 3, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2806, 3, 4, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2807, 3, 5, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2808, 3, 6, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2809, 3, 7, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2810, 3, 8, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2811, 3, 9, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2812, 3, 10, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2813, 3, 11, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2814, 3, 12, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2815, 3, 13, 'notice:view');
INSERT INTO `role_stage_perms` VALUES (2816, 3, 0, 'process');
INSERT INTO `role_stage_perms` VALUES (2817, 3, 1, 'process');
INSERT INTO `role_stage_perms` VALUES (2818, 3, 2, 'process');
INSERT INTO `role_stage_perms` VALUES (2819, 3, 3, 'process');
INSERT INTO `role_stage_perms` VALUES (2820, 3, 4, 'process');
INSERT INTO `role_stage_perms` VALUES (2821, 3, 5, 'process');
INSERT INTO `role_stage_perms` VALUES (2822, 3, 6, 'process');
INSERT INTO `role_stage_perms` VALUES (2823, 3, 7, 'process');
INSERT INTO `role_stage_perms` VALUES (2824, 3, 8, 'process');
INSERT INTO `role_stage_perms` VALUES (2825, 3, 9, 'process');
INSERT INTO `role_stage_perms` VALUES (2826, 3, 10, 'process');
INSERT INTO `role_stage_perms` VALUES (2827, 3, 11, 'process');
INSERT INTO `role_stage_perms` VALUES (2828, 3, 12, 'process');
INSERT INTO `role_stage_perms` VALUES (2829, 3, 13, 'process');
INSERT INTO `role_stage_perms` VALUES (2830, 3, 5, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (2831, 3, 6, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (2832, 3, 7, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (2833, 3, 8, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (2834, 3, 9, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (2835, 3, 10, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (2836, 3, 11, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (2837, 3, 12, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (2838, 3, 13, 'process:judge');
INSERT INTO `role_stage_perms` VALUES (2839, 3, 5, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (2840, 3, 6, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (2841, 3, 7, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (2842, 3, 8, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (2843, 3, 9, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (2844, 3, 10, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (2845, 3, 11, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (2846, 3, 12, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (2847, 3, 13, 'process:manage');
INSERT INTO `role_stage_perms` VALUES (2848, 3, 0, 'score');
INSERT INTO `role_stage_perms` VALUES (2849, 3, 1, 'score');
INSERT INTO `role_stage_perms` VALUES (2850, 3, 2, 'score');
INSERT INTO `role_stage_perms` VALUES (2851, 3, 3, 'score');
INSERT INTO `role_stage_perms` VALUES (2852, 3, 4, 'score');
INSERT INTO `role_stage_perms` VALUES (2853, 3, 5, 'score');
INSERT INTO `role_stage_perms` VALUES (2854, 3, 6, 'score');
INSERT INTO `role_stage_perms` VALUES (2855, 3, 7, 'score');
INSERT INTO `role_stage_perms` VALUES (2856, 3, 8, 'score');
INSERT INTO `role_stage_perms` VALUES (2857, 3, 9, 'score');
INSERT INTO `role_stage_perms` VALUES (2858, 3, 10, 'score');
INSERT INTO `role_stage_perms` VALUES (2859, 3, 11, 'score');
INSERT INTO `role_stage_perms` VALUES (2860, 3, 12, 'score');
INSERT INTO `role_stage_perms` VALUES (2861, 3, 13, 'score');
INSERT INTO `role_stage_perms` VALUES (2862, 3, 0, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2863, 3, 1, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2864, 3, 2, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2865, 3, 3, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2866, 3, 4, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2867, 3, 5, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2868, 3, 6, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2869, 3, 7, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2870, 3, 8, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2871, 3, 9, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2872, 3, 10, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2873, 3, 11, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2874, 3, 12, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2875, 3, 13, 'score:list');
INSERT INTO `role_stage_perms` VALUES (2876, 3, 0, 'select');
INSERT INTO `role_stage_perms` VALUES (2877, 3, 1, 'select');
INSERT INTO `role_stage_perms` VALUES (2878, 3, 2, 'select');
INSERT INTO `role_stage_perms` VALUES (2879, 3, 3, 'select');
INSERT INTO `role_stage_perms` VALUES (2880, 3, 4, 'select');
INSERT INTO `role_stage_perms` VALUES (2881, 3, 5, 'select');
INSERT INTO `role_stage_perms` VALUES (2882, 3, 6, 'select');
INSERT INTO `role_stage_perms` VALUES (2883, 3, 7, 'select');
INSERT INTO `role_stage_perms` VALUES (2884, 3, 8, 'select');
INSERT INTO `role_stage_perms` VALUES (2885, 3, 9, 'select');
INSERT INTO `role_stage_perms` VALUES (2886, 3, 10, 'select');
INSERT INTO `role_stage_perms` VALUES (2887, 3, 11, 'select');
INSERT INTO `role_stage_perms` VALUES (2888, 3, 12, 'select');
INSERT INTO `role_stage_perms` VALUES (2889, 3, 13, 'select');
INSERT INTO `role_stage_perms` VALUES (2890, 3, 0, 'select:result');
INSERT INTO `role_stage_perms` VALUES (2891, 3, 1, 'select:result');
INSERT INTO `role_stage_perms` VALUES (2892, 3, 2, 'select:result');
INSERT INTO `role_stage_perms` VALUES (2893, 3, 3, 'select:result');
INSERT INTO `role_stage_perms` VALUES (2894, 3, 4, 'select:result');
INSERT INTO `role_stage_perms` VALUES (2895, 3, 0, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (2896, 3, 1, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (2897, 3, 2, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (2898, 3, 3, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (2899, 3, 4, 'select:teacher');
INSERT INTO `role_stage_perms` VALUES (2900, 3, 0, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2901, 3, 1, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2902, 3, 2, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2903, 3, 3, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2904, 3, 4, 'select:view');
INSERT INTO `role_stage_perms` VALUES (2905, 3, 0, 'apply');

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
  CONSTRAINT `FK_INHERITANCE_5` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩秘书' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阶段任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stage_task
-- ----------------------------
INSERT INTO `stage_task` VALUES (37, '70b54e75790f4badbfef12af27c44a41', '阶段任务1', '这是阶段任务一的描述', 'eae5b736afa54e89b1313e17387e898b', 30, 52, 'KT', 'YTG', '2021-03-27 00:00:00', '2021-03-29 00:00:00');
INSERT INTO `stage_task` VALUES (38, '70b54e75790f4badbfef12af27c44a41', '阶段任务2', '这是阶段任务二的描述', '1e271679ba4947569d6ce49f6689659b', 30, 52, 'KT', 'YTG', '2021-03-25 00:00:00', '2021-03-27 00:00:00');
INSERT INTO `stage_task` VALUES (39, '70b54e75790f4badbfef12af27c44a41', '阶段任务3', '这是阶段任务三的描述', '22e88218e5db47b4a461decc678abd60', 30, 52, 'KT', 'YTG', NULL, NULL);
INSERT INTO `stage_task` VALUES (40, '70b54e75790f4badbfef12af27c44a41', '4', '这是4', '51a4f1eddbae4adc87e2c34bd6fff877', 30, 51, 'KT', 'YTG', '2021-03-27 00:00:00', '2021-03-30 00:00:00');

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
INSERT INTO `stage_task_result` VALUES (37, 1, '阶段任务1第一次提交', 'fa114d94644246309794043084f78048', '继续整改', 'WTG', '2021-03-25 01:42:54', '60');
INSERT INTO `stage_task_result` VALUES (37, 2, '阶段任务1第二次提交', 'eb65280cbe42466da18c96d32165ef66', '继续整改', 'WTG', '2021-03-25 01:43:02', '61');
INSERT INTO `stage_task_result` VALUES (37, 3, '阶段任务1第三次提交', '934a51c612234ae4b905da789b6cfda9', '继续整改', 'WTG', '2021-03-25 01:43:10', '62');
INSERT INTO `stage_task_result` VALUES (37, 4, '阶段任务1第四次提交', '5756a1fdc28d4126a3edfcb5290de749', '继续整改', 'WTG', '2021-03-25 01:43:16', '63');
INSERT INTO `stage_task_result` VALUES (37, 5, '阶段任务1第五次提交', '2e39a9ddb11d43388fcca07586f0d097', '这次过了，继续加油！', 'YTG', '2021-03-25 01:43:29', '99');
INSERT INTO `stage_task_result` VALUES (38, 1, '阶段任务2第1次提交', 'e5be494fe63e445badae4f1497c9748f', '继续整改', 'WTG', '2021-03-25 01:46:39', '67');
INSERT INTO `stage_task_result` VALUES (38, 2, '阶段任务2提交2', 'cf9db0e5551842898014434a2b5254c5', '这次做的不错，下次继续加油！', 'YTG', '2021-03-25 01:50:42', '100');
INSERT INTO `stage_task_result` VALUES (39, 1, '阶段任务3提交1', '42f5910069bc400ca55b3c08782df947', '好家伙，一遍就过！', 'YTG', '2021-03-25 01:51:57', '89');
INSERT INTO `stage_task_result` VALUES (40, 1, '提交1', 'd44d905cf7954c6098f745dadd6ce5c8', 'guo', 'YTG', '2021-03-25 13:53:31', '90');

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
) ENGINE = InnoDB AUTO_INCREMENT = 244 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生小组，分批进行答辩' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu_group
-- ----------------------------
INSERT INTO `stu_group` VALUES (233, 0, 60, 'KT');
INSERT INTO `stu_group` VALUES (234, 1, 61, 'KT');
INSERT INTO `stu_group` VALUES (235, 0, 57, 'KT');
INSERT INTO `stu_group` VALUES (236, 1, 59, 'KT');
INSERT INTO `stu_group` VALUES (237, 0, 56, 'KT');
INSERT INTO `stu_group` VALUES (238, 1, 52, 'KT');
INSERT INTO `stu_group` VALUES (239, 0, 55, 'KT');
INSERT INTO `stu_group` VALUES (240, 1, 51, 'KT');
INSERT INTO `stu_group` VALUES (241, 0, 54, 'KT');
INSERT INTO `stu_group` VALUES (242, 1, 62, 'KT');
INSERT INTO `stu_group` VALUES (243, 0, 53, 'KT');
INSERT INTO `stu_group` VALUES (244, 1, 58, 'KT');

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
  INDEX `student_ibfk_1`(`COLLEGE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_29` FOREIGN KEY (`MAJOR_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_31` FOREIGN KEY (`CLASS_ID`) REFERENCES `class` (`CLASS_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (43, '974dd0f539414e7a899a7de3fbc0dbc6', '70b54e75790f4badbfef12af27c44a41', '基于视觉惯性组合的小型旋翼无人机定位系统', '<p>	<span style=\"color: rgb(77, 77, 77);\">基于视觉惯性组合的小型旋翼无人机定位系统，到底是一种怎么样的存在。 我们不得不面对一个非常尴尬的事实，那就是， 而这些并不是完全重要，更加重要的问题是， 总结的来说， 既然如何， 我认为， 我们都知道，只要有意义，那么就必须慎重考虑。 所谓基于视觉惯性组合的小型旋翼无人机定位系统，关键是基于视觉惯性组合的小型旋翼无人机定位系统需要如何写。 而这些并不是完全重要，更加重要的问题是， 而这些并不是完全重要，更加重要的问题是， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。</span></p>', '<p><span style=\"background-color: rgb(248, 248, 248); color: rgb(77, 77, 77);\">而这些并不是完全重要，更加重要的问题是， 一般来讲，我们都必须务必慎重的考虑考虑。 我们不得不面对一个非常尴尬的事实，那就是， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 每个人都不得不面对这些问题。 在面对这种问题时， 可是，即使是这样，基于视觉惯性组合的小型旋翼无人机定位系统的出现仍然代表了一定的意义。 奥斯特洛夫斯基在不经意间这样说过，共同的事业，共同的斗争，可以使人们产生忍受一切的力量。</span></p>', 3, 3, 'KXTS', 30, '2021-03-25 00:00:00', 'YTG', NULL, 51, '2021-03-25 00:51:32', '符合双一流建设要求，通过！');
INSERT INTO `subject` VALUES (45, '283e333cf5c2470d9aebb933a2a689ab', '33c06f19b35e421195fdf3527bc7336e', '基于Raft的分布式高可用强一致性监控录像存储系统', '<p><span style=\"background-color: rgb(248, 248, 248); color: rgb(77, 77, 77);\">基于Raft的分布式高可用强一致性监控录像存储系统的发生，到底需要如何做到，不基于Raft的分布式高可用强一致性监控录像存储系统的发生，又会如何产生。 而这些并不是完全重要，更加重要的问题是， 我认为， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 既然如何， 史美尔斯曾经提到过，书籍把我们引入最美好的社会，使我们认识各个时代的伟大智者。这句话语虽然很短，但令我浮想联翩。</span></p>', '<p><span style=\"background-color: rgb(248, 248, 248); color: rgb(77, 77, 77);\">要想清楚，基于Raft的分布式高可用强一致性监控录像存储系统，到底是一种怎么样的存在。 要想清楚，基于Raft的分布式高可用强一致性监控录像存储系统，到底是一种怎么样的存在。 所谓基于Raft的分布式高可用强一致性监控录像存储系统，关键是基于Raft的分布式高可用强一致性监控录像存储系统需要如何写。 我们不得不面对一个非常尴尬的事实，那就是， 邓拓说过一句富有哲理的话，越是没有本领的就越加自命不凡。我希望诸位也能好好地体会这句话。</span></p>', 2, 3, 'ZXZH', 31, '2021-03-25 00:00:00', 'YTG', NULL, 51, '2021-03-25 00:51:48', '符合双一流建设要求，通过！');
INSERT INTO `subject` VALUES (46, '049b7788f0b746d19b459c211dcbd143', '63cfe67ddf5d477da56ed03f95c5e33c', '基于深度学习的智能病理系统研究与构建', '<p><span style=\"background-color: rgb(248, 248, 248); color: rgb(77, 77, 77);\">基于深度学习的智能病理系统研究与构建储系统的问题，是非常非常重要的。 所以， 了解清楚基于深度学习的智能病理系统研究与构建储系统到底是一种怎么样的存在，是解决一切问题的关键。 基于深度学习的智能病理系统研究与构建储系统，到底应该如何实现。 可是，即使是这样，基于深度学习的智能病理系统研究与构建储系统的出现仍然代表了一定的意义。 既然如此， 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。</span></p>', '<p><span style=\"background-color: rgb(248, 248, 248); color: rgb(77, 77, 77);\">只要有意义，那么就必须慎重考虑。 基于深度学习的智能病理系统研究与构建储系统，到底应该如何实现。 基于深度学习的智能病理系统研究与构建储系统因何而发生？ 我们都知道，只要有意义，那么就必须慎重考虑。 而这些并不是完全重要，更加重要的问题是， 赫尔普斯曾经提到过，有时候读书是一种巧妙地避开思考的方法。这启发了我， 现在，解决基于深度学习的智能病理系统研究与构建储系统的问题，是非常非常重要的。 所以， 生活中，若基于深度学习的智能病理系统研究与构建储系统出现了，我们就不得不考虑它出现了的事实。 而这些并不是完全重要，更加重要的问题是， 一般来讲，我们都必须务必慎重的考虑考虑。 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。</span></p>', 2, 3, 'SMGH', 32, '2021-03-25 00:00:00', 'YTG', NULL, 51, '2021-03-25 00:51:53', '符合双一流建设要求，通过！');
INSERT INTO `subject` VALUES (47, '5ab4d0293ba0433db5ba5464b345490d', '860eb13645a14b09b3a3b09c8a2bf942', '基于使用后评价方法的西安市社区公共空间微更新研究', '<p><span style=\"background-color: rgb(248, 248, 248); color: rgb(77, 77, 77);\">基于使用后评价方法的西安市社区公共空间微更新研究因何而发生？ 问题的关键究竟为何？ 我认为， 希腊说过一句富有哲理的话，最困难的事情就是认识自己。这启发了我， 基于使用后评价方法的西安市社区公共空间微更新研究因何而发生？ 这样看来， 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 莎士比亚曾经说过，抛弃时间的人，时间也抛弃他。这似乎解答了我的疑惑。 问题的关键究竟为何？ 了解清楚基于使用后评价方法的西安市社区公共空间微更新研究到底是一种怎么样的存在，是解决一切问题的关键。</span></p>', '<p><span style=\"background-color: rgb(248, 248, 248); color: rgb(77, 77, 77);\">这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 别林斯基曾经提到过，好的书籍是最贵重的珍宝。这似乎解答了我的疑惑。 塞涅卡在不经意间这样说过，真正的人生，只有在经过艰难卓绝的斗争之后才能实现。这启发了我， 拉罗什夫科在不经意间这样说过，取得成就时坚持不懈，要比遭到失败时顽强不屈更重要。这启发了我， 带着这些问题，我们来审视一下基于使用后评价方法的西安市社区公共空间微更新研究。 达·芬奇说过一句富有哲理的话，大胆和坚定的决心能够抵得上武器的精良。</span></p>', 2, 3, 'ZXZH', 33, '2021-03-25 00:00:00', 'YTG', NULL, 51, '2021-03-25 00:51:58', '符合双一流建设要求，通过！');
INSERT INTO `subject` VALUES (48, '410ab7076d6a4515a41c55de70c423a4', '8d794a4ebd5244ab9bfa4c4fc6b43ae9', '干细胞成骨分化过程中线粒体自噬传递ACP矿化前驱体的作用研究', '<p><span style=\"background-color: rgb(248, 248, 248); color: rgb(77, 77, 77);\">干细胞成骨分化过程中线粒体自噬传递ACP矿化前驱体的作用研究到底是一种怎么样的存在，是解决一切问题的关键。 总结的来说， 干细胞成骨分化过程中线粒体自噬传递ACP矿化前驱体的作用研究因何而发生？ 总结的来说， 从这个角度来看， 干细胞成骨分化过程中线粒体自噬传递ACP矿化前驱体的作用研究的发生，到底需要如何做到，不干细胞成骨分化过程中线粒体自噬传递ACP矿化前驱体的作用研究的发生，又会如何产生。 从这个角度来看。</span></p>', '<p><span style=\"background-color: rgb(248, 248, 248); color: rgb(77, 77, 77);\">每个人都不得不面对这些问题。 在面对这种问题时， 经过上述讨论， 我们都知道，只要有意义，那么就必须慎重考虑。 我认为， 对我个人而言，干细胞成骨分化过程中线粒体自噬传递ACP矿化前驱体的作用研究不仅仅是一个重大的事件，还可能会改变我的人生。 这样看来， 干细胞成骨分化过程中线粒体自噬传递ACP矿化前驱体的作用研究，发生了会如何，不发生又会如何。 可是，即使是这样，干细胞成骨分化过程中线粒体自噬传递ACP矿化前驱体的作用研究的出现仍然代表了一定的意义。&nbsp;</span></p>', 3, 3, 'KXTS', 34, '2021-03-25 00:00:00', 'YTG', NULL, 51, '2021-03-25 00:52:04', '符合双一流建设要求，通过！');
INSERT INTO `subject` VALUES (49, 'd2122a11eeae4a27ad5a7836e28e15dd', '2b5fb8af645d415590ba3ff58fb339ee', '课题6', '<p>课题内容</p>', '<p>课题要求</p>', 0, 3, 'ZXZH', 35, '2021-03-25 00:00:00', 'YTG', NULL, 51, '2021-03-25 13:40:05', '通过审核！');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `system_stage` VALUES (1, 0, '课题申报', '在该阶段，教师及学生(自拟课题)可以在系统中提交申报毕业设计课题申请，逾期不可进行提交。', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 1, '课题申报审核', '在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。', '2021-03-11 00:00:00', '2021-03-11 00:00:00');
INSERT INTO `system_stage` VALUES (0, 2, '被驳回课题整改', '在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请。', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 3, '学生提交选题申请', '在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 4, '教师审核学生申请', '在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核。', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 5, '开题报告及材料提交', '在该阶段，学生可以在系统提交开题报告及与开题相关的材料。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 6, '开题答辩', '在该阶段，学生、老师、答辩秘书按照教研室安排组织进行开题答辩。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 7, '开题阶段收尾', '在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入开题答辩结果。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 8, '中期检查材料提交', '在该阶段，学生需在系统提交中期报告及阶段成果，通过后方可获得答辩资格。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 9, '中期答辩', '在该阶段，学生、老师、答辩秘书按照教研室安排组织进行中期答辩。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 10, '中期阶段收尾', '在该阶段，指导教师对学生开题报告进行评阅；答辩秘书录入中期答辩结果。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 11, '结题材料提交', '在该阶段，学生提交毕业论文、最终成果物及结题报告。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 12, '结题答辩', '在该阶段，学生、老师、答辩秘书按照教研室安排组织进行结题答辩。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 13, '结题收尾工作', '在该阶段，教师对学生毕业论文进行交叉评审并录入结果，答辩秘书录入结题答辩结果。', '1900-01-20 00:00:00', '1900-01-20 23:59:59');

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
  CONSTRAINT `FK_INHERITANCE_4` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教研室' ROW_FORMAT = Dynamic;

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
  `THESIS_ID` int(0) NOT NULL AUTO_INCREMENT,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_ID` int(0) NULL DEFAULT NULL,
  `POSE_TIME` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `SCORE` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`THESIS_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_21`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_21` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '论文' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thesis
-- ----------------------------
INSERT INTO `thesis` VALUES (8, 'c10ef54e084c48f58e7f7fd4d9cf1742', 53, '2021-03-25 09:21:29', 'DFZ', NULL);
INSERT INTO `thesis` VALUES (9, '247fa02e2c664e7cbef850311b8a66db', 54, '2021-03-25 09:23:57', 'DFZ', NULL);
INSERT INTO `thesis` VALUES (10, '86675fa31c344f07aabf2e72a7350cf5', 55, '2021-03-25 09:27:50', 'DFZ', NULL);
INSERT INTO `thesis` VALUES (11, '898f9c108e2c4d40908d8629baa7b462', 56, '2021-03-25 09:28:45', 'DFZ', NULL);
INSERT INTO `thesis` VALUES (12, '3d9b79a71573470099d408ee3417b098', 57, '2021-03-25 09:29:39', 'DFZ', NULL);
INSERT INTO `thesis` VALUES (13, 'fdf39a2af7794c7783641fb1a47a87e8', 58, '2021-03-25 09:30:15', 'DFZ', NULL);
INSERT INTO `thesis` VALUES (14, 'fdaa7c26ced84478b22b5a9004287b39', 59, '2021-03-25 09:31:03', 'DFZ', NULL);
INSERT INTO `thesis` VALUES (15, 'f7554133f22f4945b3e5da84fe54df67', 60, '2021-03-25 09:32:36', 'DFZ', NULL);
INSERT INTO `thesis` VALUES (16, '236c9dc7dadd439ab5d97dff58c73c07', 52, '2021-03-25 14:03:54', 'DFZ', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thesis_teacher
-- ----------------------------
INSERT INTO `thesis_teacher` VALUES (158, 34, 10, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (159, 31, 10, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (160, 36, 10, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (161, 39, 11, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (162, 30, 11, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (163, 35, 11, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (164, 32, 12, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (165, 33, 12, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (166, 37, 12, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (167, 38, 16, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (168, 34, 16, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (169, 31, 16, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (170, 36, 8, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (171, 39, 8, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (172, 30, 8, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (173, 35, 13, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (174, 32, 13, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (175, 33, 13, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (176, 37, 14, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (177, 38, 14, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (178, 34, 14, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (179, 31, 9, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (180, 36, 9, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (181, 39, 9, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (182, 30, 15, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (183, 35, 15, 0, -1, '2021-03-25 14:06:06');
INSERT INTO `thesis_teacher` VALUES (184, 32, 15, 0, -1, '2021-03-25 14:06:06');

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
INSERT INTO `user_role` VALUES (1, 20);
INSERT INTO `user_role` VALUES (1, 20);

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
  CONSTRAINT `FK_RELATIONSHIP_30` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户当前状态' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
