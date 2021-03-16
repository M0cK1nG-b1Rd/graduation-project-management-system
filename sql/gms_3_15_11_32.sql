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

 Date: 15/03/2021 11:32:21
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收老师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of acceptance_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for acceptance_team
-- ----------------------------
DROP TABLE IF EXISTS `acceptance_team`;
CREATE TABLE `acceptance_team`  (
  `TEAM_ID` int NOT NULL,
  `TEAM_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEC_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`TEAM_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_35`(`SEC_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_35` FOREIGN KEY (`SEC_ID`) REFERENCES `secretary` (`SEC_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收小组' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('sdiushiash', 1, '软件学院软件工程专业获批2020年度国家级一流本科专业建设点', 1, '<h1 class=\"ql-align-center\"><strong style=\"color: rgb(0, 0, 0);\">软件学院软件工程专业获批2020年度国家级一流本科专业建设点</strong></h1><p class=\"ql-align-center\"><br></p><p><span class=\"ql-size-large\"> 近日，教育部公布了2020年度国家级和省级一流本科专业建设点名单，西安交通大学电信学部软件学院的软件工程专业获批2020年度国家级一流本科专业建设点。学院高度重视本科专业的建设与发展，并积极完成了国家级一流本科专业建设点的申报工作。</span></p><p><span class=\"ql-size-large\"> 软件工程专业设立于2002年，同年面向大三学生招收本科生；2004年面向高考直接招收本科生；2016年获批省一流专业培育项目，2019年入选省本科一流专业建设点。该专业遵循西安交通大学“扎根西部、服务国家、世界一流”的办学定位，以提升国家核心软件、核心竞争力为目标，以培养一流软件人才为己任，立足于国家重大战略需求和西部建设的需要，培养具有多学科交叉、国际视野、社会担当的软件专业一流创新创业人才。</span></p><p><span class=\"ql-size-large\"> 拥有着软件工程专业的软件学院更是国家首批35所“示范性软件学院”之一，是高层次复合型软件人才的培养基地。软件工程专业人才培养秉承交大“起点高、基础厚、要求严、重实践”的办学传统，拥有一支教学、实践经验丰富的师资队伍。正高级职称教师6人（含1名国家特聘教授/IEEE Fellow、2名青拔教授）、副高级职称教师13人，其中，博士生导师14人，硕士生导师28人。软件工程专业致力于培养高层次、国际化、复合型、实用型的软件开发和管理人才，拥有软件工程专业学位硕士点，与计算机学院共建“计算机科学与技术”一级学科博士点，并建有陕西省人工智能联合实验室。</span></p><p><span class=\"ql-size-large\"> 此外，软件工程专业具有国际视野的培养体系和教学理念。课程体系遵循ACM/IEEE国际标准，形成了符合国际化要求的软件工程人才培养体系，得到了教育部“新工科”建设项目的支持，符合国际专业认证的要求。形成了“软件+”的新专业体系与模式。该专业的主干学科为计算机科学与技术，关联学科有数学与统计分析、控制科学与工程、信息与通信工程、管理科学与工程等。同时，该专业还建立了完善的“产教研”协同培养体系。采用基础扎实、知识系统、口径宽广、实践性强的工程技术专家和领军人才育人模式。依托陕西省人工智能联合实验室和移动互联网与云计算应用工程研究中心，并与华为、百度等知名企业建立了紧密合作关系，毕业生中也出现了一批在行业具有强大影响力的优秀软件人才，如张祥雨、聂礼强、高自光等。</span></p><p><span class=\"ql-size-large\"> 软件工程专业的人才培养质量呈现逐步走高的趋势。近三年，本科生就业率提高了5.3%，学生获国家级、省部级科研竞赛奖达50余项，雇主对学生的满意度也增长了10%。毕业生受到社会的普遍关注与欢迎，就业去向主要是大型软件企业、银行、电信等事企业单位。大部分毕业生会选择继续深造，其中本科生出境留学比例达到14.43%，国内升学比例达到43.31%。</span></p><p><span class=\"ql-size-large\"> 近三年，软件工程专业累计获省部级及以上奖励和支持42项，其中教学成果10项、教学名师和教学团队4项、专业建设2项、课程与教材4项、实验和实践教学平台10项、教学改革项目12项。软件学院将在深化专业综合改革、师资队伍和基层教学组织建设、专业教学质量保障体系建设、毕业生培养质量提高等方面持续发力，以期获得更好成效。未来，软件工程专业将结合“新工科”理念，以专业认证为契机，在人才培养方案、课程体系、教学模式、校企合作等方面不断创新，加大资金和人力投入，以培育出更多国家需要的优秀人才。</span></p>', 1, 'YFB', '软件学院', '2021-03-10 14:22:23');
INSERT INTO `announcement` VALUES ('gdbgbnth', 2, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告2', 1, '对我个人而言，生活的意义不仅仅是一个重大的事件，还可能会改变我的人生。 奥斯特洛夫斯基在不经意间这样说过，共同的事业，共同的斗争，可以使人们产生忍受一切的力量。　这似乎解答了我的疑惑。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 所谓生活的意义，关键是生活的意义需要如何写。 对我个人而言，生活的意义不仅仅是一个重大的事件，还可能会改变我的人生。 西班牙在不经意间这样说过，自己的鞋子，自己知道紧在哪里。这似乎解答了我的疑惑。 生活的意义因何而发生？ 问题的关键究竟为何？ 我认为， 一般来讲，我们都必须务必慎重的考虑考虑。 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 我们不得不面对一个非常尴尬的事实，那就是， 既然如何， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 卡耐基曾经提到过，一个不注意小事情的人，永远不会成就大事业。这启发了我， 我们不得不面对一个非常尴尬的事实，那就是， 那么， 既然如何， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 卡耐基说过一句富有哲理的话，我们若已接受最坏的，就再没有什么损失。我希望诸位也能好好地体会这句话。 经过上述讨论， 叔本华曾经提到过，意志是一个强壮的盲人，倚靠在明眼的跛子肩上。我希望诸位也能好好地体会这句话。 一般来说， 生活的意义，到底应该如何实现。 达·芬奇说过一句富有哲理的话，大胆和坚定的决心能够抵得上武器的精良。这启发了我， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 既然如何， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 一般来说， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 既然如此， 迈克尔·F·斯特利说过一句富有哲理的话，最具挑战性的挑战莫过于提升自我。这启发了我， 非洲说过一句富有哲理的话，最灵繁的人也看不见自己的背脊。这句话语虽然很短，但令我浮想联翩。 我认为， 阿卜·日·法拉兹曾经说过，学问是异常珍贵的东西，从任何源泉吸收都不可耻。这句话语虽然很短，但令我浮想联翩。 问题的关键究竟为何？ 马尔顿说过一句富有哲理的话，坚强的信心，能使平凡的人做出惊人的事业。带着这句话，我们还要更加慎重的审视这个问题： 带着这些问题，我们来审视一下生活的意义。 所谓生活的意义，关键是生活的意义需要如何写。 经过上述讨论， 既然如此， 对我个人而言，生活的意义不仅仅是一个重大的事件，还可能会改变我的人生。 生活的意义，到底应该如何实现。 既然如此， 所谓生活的意义，关键是生活的意义需要如何写。 要想清楚，生活的意义，到底是一种怎么样的存在。 一般来讲，我们都必须务必慎重的考虑考虑。 我们都知道，只要有意义，那么就必须慎重考虑。 笛卡儿曾经说过，我的努力求学没有得到别的好处，只不过是愈来愈发觉自己的无知。这不禁令我深思。 在这种困难的抉择下，本人思来想去，寝食难安。 现在，解决生活的意义的问题，是非常非常重要的。 所以， 一般来讲，我们都必须务必慎重的考虑考虑。 拿破仑·希尔曾经提到过，不要等待，时机永远不会恰到好处。这不禁令我深思。 那么， 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 而这些并不是完全重要，更加重要的问题是， 培根曾经说过，要知道对好事的称颂过于夸大，也会招来人们的反感轻蔑和嫉妒。这似乎解答了我的疑惑。 从这个角度来看， 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 一般来讲，我们都必须务必慎重的考虑考虑。 那么， 生活的意义，到底应该如何实现。 一般来讲，我们都必须务必慎重的考虑考虑。', 2, 'YSC', '电气学院', '2021-03-09 14:22:23');
INSERT INTO `announcement` VALUES ('gfhfghrgh', 3, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告3', 1, '既然如此， 生活的意义，到底应该如何实现。 现在，解决生活的意义的问题，是非常非常重要的。 所以， 在这种困难的抉择下，本人思来想去，寝食难安。 就我个人来说，生活的意义对我的意义，不能不说非常重大。 就我个人来说，生活的意义对我的意义，不能不说非常重大。 所谓生活的意义，关键是生活的意义需要如何写。 从这个角度来看， 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 总结的来说， 奥普拉·温弗瑞说过一句富有哲理的话，你相信什么，你就成为什么样的人。我希望诸位也能好好地体会这句话。 拉罗什夫科曾经提到过，取得成就时坚持不懈，要比遭到失败时顽强不屈更重要。这启发了我， 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。', 3, 'YFB', '马克思学院', '2021-03-08 14:22:22');
INSERT INTO `announcement` VALUES ('fghfhfgd', 4, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告4', 3, '生活的意义因何而发生？ 生活的意义，到底应该如何实现。 既然如此， 生活的意义因何而发生？ 我认为， 生活的意义，发生了会如何，不发生又会如何。 我们都知道，只要有意义，那么就必须慎重考虑。 培根曾经提到过，合理安排时间，就等于节约时间。这不禁令我深思。 生活的意义，到底应该如何实现。 这样看来， 那么， 问题的关键究竟为何？ 问题的关键究竟为何？ 叔本华在不经意间这样说过，意志是一个强壮的盲人，倚靠在明眼的跛子肩上。我希望诸位也能好好地体会这句话。 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 生活的意义因何而发生？ 生活的意义因何而发生？ 我们都知道，只要有意义，那么就必须慎重考虑。 那么， 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 生活的意义，到底应该如何实现。 经过上述讨论， 总结的来说， 生活的意义，发生了会如何，不发生又会如何。 生活的意义因何而发生？ 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 生活的意义因何而发生？ 要想清楚，生活的意义，到底是一种怎么样的存在。 每个人都不得不面对这些问题。 在面对这种问题时， 左拉曾经提到过，生活的道路一旦选定，就要勇敢地走到底，决不回头。带着这句话，我们还要更加慎重的审视这个问题： 笛卡儿在不经意间这样说过，读一切好书，就是和许多高尚的人谈话。这似乎解答了我的疑惑。 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 一般来讲，我们都必须务必慎重的考虑考虑。 一般来说， 在这种困难的抉择下，本人思来想去，寝食难安。 就我个人来说，生活的意义对我的意义，不能不说非常重大。 我们都知道，只要有意义，那么就必须慎重考虑。 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 经过上述讨论， 总结的来说， 现在，解决生活的意义的问题，是非常非常重要的。 所以， 经过上述讨论， 生活的意义，发生了会如何，不发生又会如何。 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 生活的意义，到底应该如何实现。', 1, 'WFB', '社会学院', '2021-03-07 14:22:22');
INSERT INTO `announcement` VALUES ('erergrg', 5, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告5', 1, '我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 每个人都不得不面对这些问题。 在面对这种问题时， 莎士比亚曾经说过，意志命运往往背道而驰，决心到最后会全部推倒。这句话语虽然很短，但令我浮想联翩。 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 斯宾诺莎曾经提到过，最大的骄傲于最大的自卑都表示心灵的最软弱无力。我希望诸位也能好好地体会这句话。 马克思在不经意间这样说过，一切节省，归根到底都归结为时间的节省。这似乎解答了我的疑惑。 经过上述讨论， 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 黑塞在不经意间这样说过，有勇气承担命运这才是英雄好汉。这不禁令我深思。 西班牙曾经提到过，自知之明是最难得的知识。这似乎解答了我的疑惑。 一般来说， 总结的来说， 生活中，若生活的意义出现了，我们就不得不考虑它出现了的事实。 一般来说， 生活的意义因何而发生？ 一般来说， 每个人都不得不面对这些问题。 在面对这种问题时， 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 现在，解决生活的意义的问题，是非常非常重要的。 所以， 我认为， 经过上述讨论， 笛卡儿曾经说过，阅读一切好书如同和过去最杰出的人谈话。这似乎解答了我的疑惑。 所谓生活的意义，关键是生活的意义需要如何写。 这样看来。', 2, 'YFB', '经济学院', '2021-03-06 14:22:22');
INSERT INTO `announcement` VALUES ('ertryrtd', 6, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告6', 5, '拉罗什福科说过一句富有哲理的话，我们唯一不会改正的缺点是软弱。这启发了我， 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 卡耐基曾经说过，一个不注意小事情的人，永远不会成就大事业。这启发了我， 在这种困难的抉择下，本人思来想去，寝食难安。 我们不得不面对一个非常尴尬的事实，那就是， 既然如此， 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 既然如何， 带着这些问题，我们来审视一下生活的意义。 既然如此， 那么， 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 既然如何， 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 一般来说， 我认为。', 3, 'YFB', '电信学院', '2021-03-04 14:22:22');
INSERT INTO `announcement` VALUES ('regerea', 7, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告7', 1, '从这个角度来看， 生活的意义，发生了会如何，不发生又会如何。 生活的意义，到底应该如何实现。 一般来说， 带着这些问题，我们来审视一下生活的意义。 韩非在不经意间这样说过，内外相应，言行相称。这启发了我， 文森特·皮尔曾经说过，改变你的想法，你就改变了自己的世界。这句话语虽然很短，但令我浮想联翩。 阿卜·日·法拉兹说过一句富有哲理的话，学问是异常珍贵的东西，从任何源泉吸收都不可耻。这句话语虽然很短，但令我浮想联翩。 每个人都不得不面对这些问题。 在面对这种问题时， 左拉在不经意间这样说过，生活的道路一旦选定，就要勇敢地走到底，决不回头。带着这句话，我们还要更加慎重的审视这个问题： 莎士比亚在不经意间这样说过，那脑袋里的智慧，就像打火石里的火花一样，不去打它是不肯出来的。这似乎解答了我的疑惑。 就我个人来说，生活的意义对我的意义，不能不说非常重大。 带着这些问题，我们来审视一下生活的意义。 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 总结的来说， 从这个角度来看， 在这种困难的抉择下，本人思来想去，寝食难安。 经过上述讨论， 每个人都不得不面对这些问题。 在面对这种问题时， 从这个角度来看， 非洲说过一句富有哲理的话，最灵繁的人也看不见自己的背脊。这启发了我， 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 生活的意义因何而发生？ 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 生活中，若生活的意义出现了，我们就不得不考虑它出现了的事实。 生活中，若生活的意义出现了，我们就不得不考虑它出现了的事实。 所谓生活的意义，关键是生活的意义需要如何写。 经过上述讨论， 一般来说， 既然如何。', 1, 'YSC', '生命学院', '2021-03-03 14:22:22');
INSERT INTO `announcement` VALUES ('efwe', 8, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告8', 3, '在这种困难的抉择下，本人思来想去，寝食难安。 要想清楚，生活的意义，到底是一种怎么样的存在。 这样看来， 笛卡儿曾经说过，阅读一切好书如同和过去最杰出的人谈话。这不禁令我深思。 带着这些问题，我们来审视一下生活的意义。 生活的意义，发生了会如何，不发生又会如何。 从这个角度来看， 亚伯拉罕·林肯曾经说过，你活了多少岁不算什么，重要的是你是如何度过这些岁月的。带着这句话，我们还要更加慎重的审视这个问题： 叔本华曾经提到过，意志是一个强壮的盲人，倚靠在明眼的跛子肩上。带着这句话，我们还要更加慎重的审视这个问题： 现在，解决生活的意义的问题，是非常非常重要的。 所以， 对我个人而言，生活的意义不仅仅是一个重大的事件，还可能会改变我的人生。 生活的意义，发生了会如何，不发生又会如何。 我们不得不面对一个非常尴尬的事实，那就是， 总结的来说， 就我个人来说，生活的意义对我的意义，不能不说非常重大。 从这个角度来看， 那么， 问题的关键究竟为何？ 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 每个人都不得不面对这些问题。 在面对这种问题时， 在这种困难的抉择下，本人思来想去，寝食难安。 而这些并不是完全重要，更加重要的问题是， 既然如此， 在这种困难的抉择下，本人思来想去，寝食难安。 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 我们不得不面对一个非常尴尬的事实，那就是， 生活的意义，发生了会如何，不发生又会如何。 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。', 1, 'YFB', '摸鱼学院', '2021-03-02 14:22:22');
INSERT INTO `announcement` VALUES ('ewtresc', 9, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告9', 1, '可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 文森特·皮尔说过一句富有哲理的话，改变你的想法，你就改变了自己的世界。这启发了我， 生活的意义因何而发生？ 问题的关键究竟为何？ 生活的意义，到底应该如何实现。 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 吉格·金克拉说过一句富有哲理的话，如果你能做梦，你就能实现它。这句话语虽然很短，但令我浮想联翩。 生活的意义因何而发生？ 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 这样看来， 带着这些问题，我们来审视一下生活的意义。 所谓生活的意义，关键是生活的意义需要如何写。 生活中，若生活的意义出现了，我们就不得不考虑它出现了的事实。 我认为， 既然如此， 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 迈克尔·F·斯特利说过一句富有哲理的话，最具挑战性的挑战莫过于提升自我。这句话语虽然很短，但令我浮想联翩。 生活的意义，到底应该如何实现。 达·芬奇曾经提到过，大胆和坚定的决心能够抵得上武器的精良。这启发了我， 既然如此， 总结的来说， 叔本华曾经说过，普通人只想到如何度过时间，有才能的人设法利用时间。我希望诸位也能好好地体会这句话。', 1, 'WFB', '材料学院', '2021-03-01 14:22:22');
INSERT INTO `announcement` VALUES ('segtrhry', 10, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告10', 1, '裴斯泰洛齐说过一句富有哲理的话，今天应做的事没有做，明天再早也是耽误了。带着这句话，我们还要更加慎重的审视这个问题： 生活的意义，发生了会如何，不发生又会如何。 别林斯基曾经提到过，好的书籍是最贵重的珍宝。带着这句话，我们还要更加慎重的审视这个问题： 而这些并不是完全重要，更加重要的问题是， 既然如何， 既然如何， 布尔沃曾经提到过，要掌握书，莫被书掌握；要为生而读，莫为读而生。这句话语虽然很短，但令我浮想联翩。 德谟克利特曾经提到过，节制使快乐增加并使享受加强。这启发了我， 那么， 我们都知道，只要有意义，那么就必须慎重考虑。 所谓生活的意义，关键是生活的意义需要如何写。 我们不得不面对一个非常尴尬的事实，那就是， 俾斯麦说过一句富有哲理的话，失败是坚忍的最后考验。这似乎解答了我的疑惑。 这样看来， 既然如此， 一般来说， 在这种困难的抉择下，本人思来想去，寝食难安。 要想清楚，生活的意义，到底是一种怎么样的存在。 那么， 我们不得不面对一个非常尴尬的事实，那就是， 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 对我个人而言，生活的意义不仅仅是一个重大的事件，还可能会改变我的人生。 生活的意义，发生了会如何，不发生又会如何。 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 所谓生活的意义，关键是生活的意义需要如何写。 马克思曾经说过，一切节省，归根到底都归结为时间的节省。这不禁令我深思。 现在，解决生活的意义的问题，是非常非常重要的。 所以。', 1, 'YFB', '保研学院', '2021-03-10 13:22:22');
INSERT INTO `announcement` VALUES ('fwefeag', 11, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告11', 5, '生活中，若生活的意义出现了，我们就不得不考虑它出现了的事实。 既然如何， 带着这些问题，我们来审视一下生活的意义。 塞涅卡说过一句富有哲理的话，生命如同寓言，其价值不在与长短，而在与内容。这句话语虽然很短，但令我浮想联翩。 康德曾经说过，既然我已经踏上这条道路，那么，任何东西都不应妨碍我沿着这条路走下去。这启发了我， 现在，解决生活的意义的问题，是非常非常重要的。 所以， 博在不经意间这样说过，一次失败，只是证明我们成功的决心还够坚强。 维这句话语虽然很短，但令我浮想联翩。 奥普拉·温弗瑞曾经提到过，你相信什么，你就成为什么样的人。这不禁令我深思。 经过上述讨论， 史美尔斯在不经意间这样说过，书籍把我们引入最美好的社会，使我们认识各个时代的伟大智者。带着这句话，我们还要更加慎重的审视这个问题： 带着这些问题，我们来审视一下生活的意义。 既然如此， 在这种困难的抉择下，本人思来想去，寝食难安。 从这个角度来看， 我们都知道，只要有意义，那么就必须慎重考虑。 一般来讲，我们都必须务必慎重的考虑考虑。 一般来讲，我们都必须务必慎重的考虑考虑。 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 我们不得不面对一个非常尴尬的事实，那就是， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 博曾经说过，一次失败，只是证明我们成功的决心还够坚强。 维这不禁令我深思。 要想清楚，生活的意义，到底是一种怎么样的存在。 生活的意义，发生了会如何，不发生又会如何。 而这些并不是完全重要，更加重要的问题是， 既然如何， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 在这种困难的抉择下，本人思来想去，寝食难安。 既然如何， 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 既然如何， 阿卜·日·法拉兹曾经说过，学问是异常珍贵的东西，从任何源泉吸收都不可耻。这似乎解答了我的疑惑。 生活的意义，发生了会如何，不发生又会如何。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 生活的意义，发生了会如何，不发生又会如何。 查尔斯·史考伯曾经提到过，一个人几乎可以在任何他怀有无限热忱的事情上成功。 这不禁令我深思。 易卜生曾经说过，伟大的事业，需要决心，能力，组织和责任感。这似乎解答了我的疑惑。 达尔文在不经意间这样说过，敢于浪费哪怕一个钟头时间的人，说明他还不懂得珍惜生命的全部价值。这句话语虽然很短，但令我浮想联翩。 我们不得不面对一个非常尴尬的事实，那就是， 生活中，若生活的意义出现了，我们就不得不考虑它出现了的事实。 生活的意义，到底应该如何实现。 既然如何， 左拉曾经提到过，生活的道路一旦选定，就要勇敢地走到底，决不回头。带着这句话，我们还要更加慎重的审视这个问题： 所谓生活的意义，关键是生活的意义需要如何写。 拿破仑·希尔在不经意间这样说过，不要等待，时机永远不会恰到好处。这句话语虽然很短，但令我浮想联翩。 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 既然如何， 那么， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 生活的意义，发生了会如何，不发生又会如何。', 1, 'YSC', '考研学院', '2021-03-10 12:22:22');
INSERT INTO `announcement` VALUES ('treaferear', 12, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告12', 1, '经过上述讨论， 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 而这些并不是完全重要，更加重要的问题是， 歌德曾经提到过，读一本好书，就如同和一个高尚的人在交谈。带着这句话，我们还要更加慎重的审视这个问题： 这样看来， 而这些并不是完全重要，更加重要的问题是， 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 总结的来说， 达尔文说过一句富有哲理的话，敢于浪费哪怕一个钟头时间的人，说明他还不懂得珍惜生命的全部价值。我希望诸位也能好好地体会这句话。 生活的意义，发生了会如何，不发生又会如何。 生活中，若生活的意义出现了，我们就不得不考虑它出现了的事实。 我们不得不面对一个非常尴尬的事实，那就是， 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 笛卡儿曾经说过，我的努力求学没有得到别的好处，只不过是愈来愈发觉自己的无知。这启发了我， 我们都知道，只要有意义，那么就必须慎重考虑。 莫扎特曾经说过，谁和我一样用功，谁就会和我一样成功。这启发了我， 亚伯拉罕·林肯在不经意间这样说过，你活了多少岁不算什么，重要的是你是如何度过这些岁月的。我希望诸位也能好好地体会这句话。 叔本华在不经意间这样说过，普通人只想到如何度过时间，有才能的人设法利用时间。带着这句话，我们还要更加慎重的审视这个问题： 我们不得不面对一个非常尴尬的事实，那就是， 在这种困难的抉择下，本人思来想去，寝食难安。 既然如此。', 1, 'YFB', '打工学院', '2021-03-10 10:22:22');
INSERT INTO `announcement` VALUES ('gettye', 13, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告13', 1, '我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 而这些并不是完全重要，更加重要的问题是， 总结的来说， 莎士比亚曾经说过，抛弃时间的人，时间也抛弃他。我希望诸位也能好好地体会这句话。 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 那么， 就我个人来说，生活的意义对我的意义，不能不说非常重大。 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 而这些并不是完全重要，更加重要的问题是， 在这种困难的抉择下，本人思来想去，寝食难安。 生活的意义因何而发生？ 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 一般来讲，我们都必须务必慎重的考虑考虑。 总结的来说， 吕凯特曾经提到过，生命不可能有两次，但许多人连一次也不善于度过。这不禁令我深思。 带着这些问题，我们来审视一下生活的意义。 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 一般来说， 而这些并不是完全重要，更加重要的问题是， 我认为， 要想清楚，生活的意义，到底是一种怎么样的存在。 奥斯特洛夫斯基在不经意间这样说过，共同的事业，共同的斗争，可以使人们产生忍受一切的力量。　这启发了我， 从这个角度来看， 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 在这种困难的抉择下，本人思来想去，寝食难安。 生活的意义，到底应该如何实现。 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 笛卡儿说过一句富有哲理的话，我的努力求学没有得到别的好处，只不过是愈来愈发觉自己的无知。这句话语虽然很短，但令我浮想联翩。 生活的意义，发生了会如何，不发生又会如何。 问题的关键究竟为何？ 经过上述讨论， 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 每个人都不得不面对这些问题。 在面对这种问题时， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 生活的意义，到底应该如何实现。 对我个人而言，生活的意义不仅仅是一个重大的事件，还可能会改变我的人生。 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 从这个角度来看， 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 培根曾经说过，要知道对好事的称颂过于夸大，也会招来人们的反感轻蔑和嫉妒。这句话语虽然很短，但令我浮想联翩。 所谓生活的意义，关键是生活的意义需要如何写。 一般来说， 我们都知道，只要有意义，那么就必须慎重考虑。 总结的来说。', 2, 'YSC', '睡觉学院', '2021-03-10 00:00:00');
INSERT INTO `announcement` VALUES ('sgsgsgrae', 14, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告14', 1, '生活的意义，到底应该如何实现。 对我个人而言，生活的意义不仅仅是一个重大的事件，还可能会改变我的人生。 而这些并不是完全重要，更加重要的问题是， 我们不得不面对一个非常尴尬的事实，那就是， 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 在这种困难的抉择下，本人思来想去，寝食难安。 卢梭说过一句富有哲理的话，浪费时间是一桩大罪过。这不禁令我深思。 那么， 可是，即使是这样，生活的意义的出现仍然代表了一定的意义。 我们都知道，只要有意义，那么就必须慎重考虑。 经过上述讨论， 一般来说， 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 拿破仑·希尔曾经说过，不要等待，时机永远不会恰到好处。这似乎解答了我的疑惑。 要想清楚，生活的意义，到底是一种怎么样的存在。 别林斯基曾经提到过，好的书籍是最贵重的珍宝。这似乎解答了我的疑惑。 一般来讲，我们都必须务必慎重的考虑考虑。 从这个角度来看， 笛卡儿曾经提到过，读一切好书，就是和许多高尚的人谈话。我希望诸位也能好好地体会这句话。 问题的关键究竟为何？ 生活的意义的发生，到底需要如何做到，不生活的意义的发生，又会如何产生。 现在，解决生活的意义的问题，是非常非常重要的。 所以， 在这种困难的抉择下，本人思来想去，寝食难安。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 所谓生活的意义，关键是生活的意义需要如何写。 亚伯拉罕·林肯曾经说过，我这个人走得很慢，但是我从不后退。这不禁令我深思。 生活中，若生活的意义出现了，我们就不得不考虑它出现了的事实。 布尔沃说过一句富有哲理的话，要掌握书，莫被书掌握；要为生而读，莫为读而生。这似乎解答了我的疑惑。 生活中，若生活的意义出现了，我们就不得不考虑它出现了的事实。 生活的意义，到底应该如何实现。 一般来讲，我们都必须务必慎重的考虑考虑。 黑塞说过一句富有哲理的话，有勇气承担命运这才是英雄好汉。这似乎解答了我的疑惑。 带着这些问题，我们来审视一下生活的意义。 生活的意义，到底应该如何实现。 鲁巴金在不经意间这样说过，读书是在别人思想的帮助下，建立起自己的思想。这启发了我， 每个人都不得不面对这些问题。 在面对这种问题时， 既然如何， 在这种困难的抉择下，本人思来想去，寝食难安。 了解清楚生活的意义到底是一种怎么样的存在，是解决一切问题的关键。 生活的意义，到底应该如何实现。 孔子曾经提到过，知之者不如好之者，好之者不如乐之者。这句话语虽然很短，但令我浮想联翩。 就我个人来说，生活的意义对我的意义，不能不说非常重大。 而这些并不是完全重要，更加重要的问题是， 马克思在不经意间这样说过，一切节省，归根到底都归结为时间的节省。这不禁令我深思。 对我个人而言，生活的意义不仅仅是一个重大的事件，还可能会改变我的人生。 从这个角度来看， 卡莱尔在不经意间这样说过，过去一切时代的精华尽在书中。这似乎解答了我的疑惑。 卡耐基说过一句富有哲理的话，一个不注意小事情的人，永远不会成就大事业。我希望诸位也能好好地体会这句话。 而这些并不是完全重要，更加重要的问题是， 带着这些问题，我们来审视一下生活的意义。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 所谓生活的意义，关键是生活的意义需要如何写。 一般来讲，我们都必须务必慎重的考虑考虑。', 3, 'YSC', '校长学院', '2021-03-10 00:00:00');
INSERT INTO `announcement` VALUES ('r3refrg', 15, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告15', 2, '总结的来说， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 我认为， 所谓生活的意义，关键是生活的意义需要如何写。 现在，解决生活的意义的问题，是非常非常重要的。 所以， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 生活的意义，到底应该如何实现。 我认为， 生活中，若生活的意义出现了，我们就不得不考虑它出现了的事实。 我们不得不面对一个非常尴尬的事实，那就是， 我们都知道，只要有意义，那么就必须慎重考虑。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。', 2, 'WFB', '饶元学院', '2021-03-10 09:22:22');
INSERT INTO `announcement` VALUES ('erageragat', 16, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告16', 9, '莎士比亚曾经说过，本来无望的事，大胆尝试，往往能成功。这句话语虽然很短，但令我浮想联翩。 了解清楚彭老师真帅到底是一种怎么样的存在，是解决一切问题的关键。 培根说过一句富有哲理的话，阅读使人充实，会谈使人敏捷，写作使人精确。这似乎解答了我的疑惑。 每个人都不得不面对这些问题。 在面对这种问题时， 既然如此， 彭老师真帅，到底应该如何实现。 从这个角度来看， 既然如何， 了解清楚彭老师真帅到底是一种怎么样的存在，是解决一切问题的关键。 一般来讲，我们都必须务必慎重的考虑考虑。 一般来说， 彭老师真帅的发生，到底需要如何做到，不彭老师真帅的发生，又会如何产生。 生活中，若彭老师真帅出现了，我们就不得不考虑它出现了的事实。 既然如何， 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 所谓彭老师真帅，关键是彭老师真帅需要如何写。 就我个人来说，彭老师真帅对我的意义，不能不说非常重大。 我们不得不面对一个非常尴尬的事实，那就是， 带着这些问题，我们来审视一下彭老师真帅', 2, 'YFB', '机械学院', '2021-03-10 07:22:22');
INSERT INTO `announcement` VALUES ('thrtsera', 17, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告17', 1, '彭老师真帅，发生了会如何，不发生又会如何。 对我个人而言，彭老师真帅不仅仅是一个重大的事件，还可能会改变我的人生。 我们一般认为，抓住了问题的关键，其他一切则会迎刃而解。 德国在不经意间这样说过，只有在人群中间，才能认识自己。我希望诸位也能好好地体会这句话。 米歇潘说过一句富有哲理的话，生命是一条艰险的峡谷，只有勇敢的人才能通过。这启发了我， 经过上述讨论， 每个人都不得不面对这些问题。 在面对这种问题时， 既然如此， 彭老师真帅因何而发生？ 这样看来， 而这些并不是完全重要，更加重要的问题是， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 培根说过一句富有哲理的话，深窥自己的心，而后发觉一切的奇迹在你自己。这不禁令我深思。 既然如此， 经过上述讨论， 从这个角度来看， 每个人都不得不面对这些问题。 在面对这种问题时， 现在，解决彭老师真帅的问题，是非常非常重要的。 所以， 那么， 现在，解决彭老师真帅的问题，是非常非常重要的。 所以， 要想清楚，彭老师真帅，到底是一种怎么样的存在。 生活中，若彭老师真帅出现了，我们就不得不考虑它出现了的事实。 经过上述讨论， 我认为， 在这种困难的抉择下，本人思来想去，寝食难安。 这样看来， 现在，解决彭老师真帅的问题，是非常非常重要的。 所以， 就我个人来说，彭老师真帅对我的意义，不能不说非常重大。 这样看来， 我们不得不面对一个非常尴尬的事实，那就是， 彭老师真帅的发生，到底需要如何做到，不彭老师真帅的发生，又会如何产生。 在这种困难的抉择下，本人思来想去，寝食难安。 生活中，若彭老师真帅出现了，我们就不得不考虑它出现了的事实。 就我个人来说，彭老师真帅对我的意义，不能不说非常重大。 总结的来说， 经过上述讨论， 爱迪生曾经说过，失败也是我需要的，它和成功对我一样有价值。这启发了我， 我们不得不面对一个非常尴尬的事实，那就是， 马尔顿曾经说过，坚强的信心，能使平凡的人做出惊人的事业。带着这句话，我们还要更加慎重的审视这个问题。', 2, 'YFB', '能动学院', '2021-03-10 05:22:22');
INSERT INTO `announcement` VALUES ('geriu', 18, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告18', 1, '既然如此， 一般来讲，我们都必须务必慎重的考虑考虑。 俾斯麦在不经意间这样说过，对于不屈不挠的人来说，没有失败这回事。我希望诸位也能好好地体会这句话。 彭老师真帅因何而发生？ 苏轼曾经提到过，古之立大事者，不惟有超世之才，亦必有坚忍不拔之志。这启发了我， 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 一般来讲，我们都必须务必慎重的考虑考虑。 本人也是经过了深思熟虑，在每个日日夜夜思考这个问题。 彭老师真帅，发生了会如何，不发生又会如何。 生活中，若彭老师真帅出现了，我们就不得不考虑它出现了的事实。 了解清楚彭老师真帅到底是一种怎么样的存在，是解决一切问题的关键。 老子说过一句富有哲理的话，知人者智，自知者明。胜人者有力，自胜者强。这句话语虽然很短，但令我浮想联翩。 我认为， 在这种困难的抉择下，本人思来想去，寝食难安。 一般来说， 美华纳说过一句富有哲理的话，勿问成功的秘诀为何，且尽全力做你应该做的事吧。我希望诸位也能好好地体会这句话。 对我个人而言，彭老师真帅不仅仅是一个重大的事件，还可能会改变我的人生。 带着这些问题，我们来审视一下彭老师真帅。 一般来讲，我们都必须务必慎重的考虑考虑。 了解清楚彭老师真帅到底是一种怎么样的存在，是解决一切问题的关键。 郭沫若说过一句富有哲理的话，形成天才的决定因素应该是勤奋。我希望诸位也能好好地体会这句话。 佚名曾经提到过，感激每一个新的挑战，因为它会锻造你的意志和品格。这句话语虽然很短，但令我浮想联翩。 了解清楚彭老师真帅到底是一种怎么样的存在，是解决一切问题的关键。 每个人都不得不面对这些问题。 在面对这种问题时， 要想清楚，彭老师真帅，到底是一种怎么样的存在。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。', 1, 'YSC', '奖金学院 ', '2021-02-28 14:22:22');
INSERT INTO `announcement` VALUES ('afg', 19, '关于我想不出测试公告的标题只好起这样的名字但意外的竟然不错然后就这样办了的测试公告19', 8, '生活中，若彭老师真帅出现了，我们就不得不考虑它出现了的事实。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 这样看来， 彭老师真帅，发生了会如何，不发生又会如何。 一般来说， 塞涅卡说过一句富有哲理的话，真正的人生，只有在经过艰难卓绝的斗争之后才能实现。这句话语虽然很短，但令我浮想联翩。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 既然如何， 那么， 现在，解决彭老师真帅的问题，是非常非常重要的。 所以， 彭老师真帅，到底应该如何实现。 那么， 我们不得不面对一个非常尴尬的事实，那就是， 总结的来说， 歌德说过一句富有哲理的话，意志坚强的人能把世界放在手中像泥块一样任意揉捏。这不禁令我深思。 要想清楚，彭老师真帅，到底是一种怎么样的存在。 我们都知道，只要有意义，那么就必须慎重考虑。', 3, 'YFB', '软件学院', '2021-02-27 14:22:22');
INSERT INTO `announcement` VALUES ('aergergre', 20, '模拟公告', 1, '在这种困难的抉择下，本人思来想去，寝食难安。 既然如何， 俾斯麦曾经提到过，失败是坚忍的最后考验。这句话语虽然很短，但令我浮想联翩。 总结的来说， 了解清楚彭老师真帅到底是一种怎么样的存在，是解决一切问题的关键。 在这种困难的抉择下，本人思来想去，寝食难安。 总结的来说， 而这些并不是完全重要，更加重要的问题是， 了解清楚彭老师真帅到底是一种怎么样的存在，是解决一切问题的关键。 所谓彭老师真帅，关键是彭老师真帅需要如何写。 了解清楚彭老师真帅到底是一种怎么样的存在，是解决一切问题的关键。 了解清楚彭老师真帅到底是一种怎么样的存在，是解决一切问题的关键。 所谓彭老师真帅，关键是彭老师真帅需要如何写。 就我个人来说，彭老师真帅对我的意义，不能不说非常重大。 笛卡儿说过一句富有哲理的话，阅读一切好书如同和过去最杰出的人谈话。我希望诸位也能好好地体会这句话。 彭老师真帅因何而发生？ 卢梭在不经意间这样说过，浪费时间是一桩大罪过。这似乎解答了我的疑惑。 我们不得不面对一个非常尴尬的事实，那就是， 彭老师真帅，发生了会如何，不发生又会如何', 3, 'YFB', '电气学院', '2021-01-31 14:22:22');
INSERT INTO `announcement` VALUES ('d51dd07371c14df39886abb05485c40b', 21, 'hhh', 8, '测试', 1, 'YFB', '神学院', '2021-03-13 00:00:00');
INSERT INTO `announcement` VALUES ('1421d93de9ca42e692100f3d18cdca21', 22, '公告发布测试', 8, '<p class=\"ql-align-center\"><span style=\"background-color: rgb(230, 0, 0);\">这是</span>一段富文本</p>', 1, 'YFB', '测试组', '2021-03-13 00:00:00');
INSERT INTO `announcement` VALUES ('e023fa33db1440f38a60a566ea9cb9c8', 23, '我院“金币沉”同学斩获选美大赛第一名', 8, '<h1 class=\"ql-align-center\">我院“金币沉”同学斩获选美大赛第一名</h1><p class=\"ql-align-center\"><br></p><h3 class=\"ql-align-justify\">	金币沉因何而发生？ 现在，解决金币沉的问题，是非常非常重要的。 所以， 莎士比亚在不经意间这样说过，人的一生是短的，但如果卑劣地过这一生，就太长了。这不禁令我深思。 总结的来说， 我们不得不面对一个非常尴尬的事实，那就是， 海贝尔曾经说过，人生就是学校。在那里，与其说好的教师是幸福，不如说好的教师是不幸。带着这句话，我们还要更加慎重的审视这个问题： 这样看来， 一般来讲，我们都必须务必慎重的考虑考虑。 对我个人而言，金币沉不仅仅是一个重大的事件，还可能会改变我的人生。 既然如何， 在这种困难的抉择下，本人思来想去，寝食难安。 生活中，若金币沉出现了，我们就不得不考虑它出现了的事实。 金币沉，发生了会如何，不发生又会如何。 邓拓在不经意间这样说过，越是没有本领的就越加自命不凡。这启发了我， 生活中，若金币沉出现了，我们就不得不考虑它出现了的事实。 卡耐基曾经说过，我们若已接受最坏的，就再没有什么损失。带着这句话，我们还要更加慎重的审视这个问题： 每个人都不得不面对这些问题。 在面对这种问题时， 金币沉，发生了会如何，不发生又会如何。 生活中，若金币沉出现了，我们就不得不考虑它出现了的事实。 了解清楚金币沉到底是一种怎么样的存在，是解决一切问题的关键。 金币沉因何而发生？ 韩非曾经提到过，内外相应，言行相称。我希望诸位也能好好地体会这句话。 马云曾经说过，最大的挑战和突破在于用人，而用人最大的突破在于信任人。这句话语虽然很短，但令我浮想联翩。 一般来说， 要想清楚，金币沉，到底是一种怎么样的存在。 既然如何， 要想清楚，金币沉，到底是一种怎么样的存在。 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 裴斯泰洛齐曾经说过，今天应做的事没有做，明天再早也是耽误了。这不禁令我深思。</h3><p class=\"ql-align-justify\"><br></p><h2 class=\"ql-align-right\">选美学院         </h2><h2 class=\"ql-align-right\">2021年3月13日	</h2><p><br></p>', 1, 'YFB', '选美学院', '2021-03-13 00:00:00');
INSERT INTO `announcement` VALUES ('5b0f17698a344bcc928bca215abbb442', 24, '额', 8, '<p>？？？</p>', 1, 'YFB', '选美学院', '2021-03-13 00:00:00');
INSERT INTO `announcement` VALUES ('1b75e9e7ad4044f491e752aebff2ba82', 25, '', 8, NULL, NULL, 'YFB', '', '2021-03-13 00:00:00');
INSERT INTO `announcement` VALUES ('83778838f94848a7af9451d6de351abd', 26, '测试2', 8, '<p>大器晚成</p>', 1, 'YSC', '我从', '2021-03-13 00:00:00');

-- ----------------------------
-- Table structure for applied_subject
-- ----------------------------
DROP TABLE IF EXISTS `applied_subject`;
CREATE TABLE `applied_subject`  (
  `ID` int NOT NULL,
  `SUB_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEEDBACK` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_11`(`STU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_12`(`SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of applied_subject
-- ----------------------------
INSERT INTO `applied_subject` VALUES (1, '1', 1, 'WTG', '你选个🔨');

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
  `ORDER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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

-- ----------------------------
-- Table structure for file_storage
-- ----------------------------
DROP TABLE IF EXISTS `file_storage`;
CREATE TABLE `file_storage`  (
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HANDIN_ID` int NOT NULL DEFAULT 0 COMMENT '0（默认）则该值没有意义',
  `FILE_ID` int NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SIZE` int NULL DEFAULT NULL,
  `LOCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEL_FLAG` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  `UPLOAD_BY` int NULL DEFAULT NULL,
  `UPLOAD_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_22`(`UPLOAD_BY`) USING BTREE,
  INDEX `DOC_ID`(`DOC_ID`, `HANDIN_ID`) USING BTREE,
  INDEX `HANDIN_ID`(`HANDIN_ID`, `DOC_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_22` FOREIGN KEY (`UPLOAD_BY`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_storage
-- ----------------------------

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
  `MESSAGE_ID` int NOT NULL,
  `TEACHER_ID` int NULL DEFAULT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` int NULL DEFAULT NULL,
  `DETAIL` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`MESSAGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------

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

-- ----------------------------
-- Table structure for plea
-- ----------------------------
DROP TABLE IF EXISTS `plea`;
CREATE TABLE `plea`  (
  `ID` int NOT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ARRANGE_ID` int NULL DEFAULT NULL,
  `STU_GROUP_ID` int NULL DEFAULT NULL,
  `ACCEPTANCE_TEAM_ID` int NULL DEFAULT NULL,
  `CLASSROOM_ID` int NULL DEFAULT NULL,
  `SEC_ID` int NULL DEFAULT NULL,
  `TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_36`(`ARRANGE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_39`(`STU_GROUP_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_9`(`ACCEPTANCE_TEAM_ID`) USING BTREE,
  INDEX `CLASSROOM_ID`(`CLASSROOM_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`ACCEPTANCE_TEAM_ID`) REFERENCES `acceptance_team` (`TEAM_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `plea_ibfk_1` FOREIGN KEY (`CLASSROOM_ID`) REFERENCES `classroom` (`CLASSROOM_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plea
-- ----------------------------

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

-- ----------------------------
-- Table structure for plea_result
-- ----------------------------
DROP TABLE IF EXISTS `plea_result`;
CREATE TABLE `plea_result`  (
  `ID` int NOT NULL,
  `STU_ID` int NOT NULL,
  `PLEA_ID` int NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT NULL,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_PASSED` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `PLEA_ID`(`PLEA_ID`) USING BTREE,
  INDEX `STAGE`(`STAGE`) USING BTREE,
  CONSTRAINT `plea_result_ibfk_1` FOREIGN KEY (`PLEA_ID`) REFERENCES `plea` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plea_result
-- ----------------------------

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `REPORT_ID` int NOT NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT NULL,
  PRIMARY KEY (`REPORT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报告' ROW_FORMAT = DYNAMIC;

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
  `START_SCORE` int NULL DEFAULT NULL COMMENT '答辩和成果（包括报告）',
  `MID_SCORE` int NULL DEFAULT NULL,
  `END_SCORE` int NULL DEFAULT NULL,
  `THESIS_SCORE` int NULL DEFAULT NULL,
  `PROCEDURE_SCORE` int NULL DEFAULT NULL,
  `FINAL_SCORE` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score
-- ----------------------------

-- ----------------------------
-- Table structure for score_detail
-- ----------------------------
DROP TABLE IF EXISTS `score_detail`;
CREATE TABLE `score_detail`  (
  `STU_ID` int NULL DEFAULT NULL,
  `SCORE_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of score_detail
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

-- ----------------------------
-- Table structure for stage_task
-- ----------------------------
DROP TABLE IF EXISTS `stage_task`;
CREATE TABLE `stage_task`  (
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASK_ID` int NOT NULL,
  `TEACHER_ID` int NULL DEFAULT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCORE` int NULL DEFAULT NULL,
  `STATUS` int NULL DEFAULT NULL,
  `START_TIME` datetime NULL DEFAULT NULL,
  `END_TIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`TASK_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_16`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_17`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_16` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_17` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阶段任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stage_task
-- ----------------------------

-- ----------------------------
-- Table structure for stu_group
-- ----------------------------
DROP TABLE IF EXISTS `stu_group`;
CREATE TABLE `stu_group`  (
  `ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `STU_ID` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_38`(`STU_ID`) USING BTREE,
  INDEX `GROUP_ID`(`GROUP_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_38` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生小组，分批进行答辩' ROW_FORMAT = DYNAMIC;

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
  `PLEA_TYPE` int NULL DEFAULT NULL,
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
INSERT INTO `student` VALUES (2, 1, 1, 1, 1, 2);
INSERT INTO `student` VALUES (3, 2, 1, 1, 4, 2);
INSERT INTO `student` VALUES (4, 3, 2, 3, 11, 2);
INSERT INTO `student` VALUES (5, 4, 3, 2, 14, 2);
INSERT INTO `student` VALUES (6, 5, 3, 4, 9, 2);
INSERT INTO `student` VALUES (7, 6, 1, 1, 3, 2);
INSERT INTO `student` VALUES (8, 7, 3, 4, 5, 1);

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
  `ZONE` int NULL DEFAULT NULL,
  `POSE_BY` int NULL DEFAULT NULL,
  `POSE_TIME` datetime NULL DEFAULT NULL,
  `STATUS` int NULL DEFAULT 0,
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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课题' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '456544465', '1', '上班摸鱼', '一般来说， 我认为， 歌德曾经说过，读一本好书，就如同和一个高尚的人在交谈。这句话把我们带到了一个新的维度去思考这个问题: 那么， 在这种困难的抉择下，本人思来想去，寝食难安。 经过上述讨论， 现在，解决上班摸鱼的问题，是非常非常重要的。 所以， 这种事实对本人来说意义重大，相信对这个世界也是有一定意义的。 而这些并不是完全重要，更加重要的问题是， 一般来讲，我们都必须务必慎重的考虑考虑。 上班摸鱼的发生，到底需要如何做到，不上班摸鱼的发生，又会如何产生。 王阳明曾经说过，故立志者，为学之心也；为学者，立志之事也。这句话语虽然很短, 但令我浮想联翩。', 1, 3, '2021-03-04 13:38:24', 0, 1, NULL, NULL, NULL);

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
INSERT INTO `system_stage` VALUES (1, 1, '课题申报审核', '在该阶段，教研室对所有申报的课题进行审核，课题状态包含’待审核‘、’审核通过‘、’被驳回‘三种状态。对于\'审核通过\'及‘被驳回’的课题，向申请者发送消息。对于’被驳回‘的课题，可以在整改阶段进行编辑整改，已通过及待审核状态下，不可进行编辑。dwqvqw', '2021-03-11 00:00:00', '2021-03-11 00:00:00');
INSERT INTO `system_stage` VALUES (0, 2, '被驳回课题整改', '在该阶段，审核未通过的课题可以进行重新编辑整改，然后再次提交申请', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
INSERT INTO `system_stage` VALUES (0, 3, '学生提交选题申请', '在该阶段，学生可以查看所有可选课题信息，然后选择心仪课题进行申a请。学生可以随时查看申请审核状态（待审核、审核通过、被驳回）,审核状态变化时，系统向学生发送通知信息告知。当申请被驳回时可再次申请其他课题', '1900-01-20 00:00:00', '1900-01-20 23:59:59');
INSERT INTO `system_stage` VALUES (0, 4, '教师审核学生申请', '在该阶段，教师对学生提出的选题申请进行审核，需在规定时间内完成审核，审核结束前2天，讲发送信息提醒教师进行审核', '1900-01-19 00:05:43', '1900-01-20 00:05:43');
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
  `TEACHER_ID` int NOT NULL,
  `COLLEGE_ID` int NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HOME_PAGE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TEACHER_ID`) USING BTREE,
  INDEX `TEACHER_ID`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_7`(`COLLEGE_ID`) USING BTREE,
  INDEX `teacher_ibfk_1`(`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (10, 1, 1, '校长', 'hhhh');
INSERT INTO `teacher` VALUES (12, 2, 3, '院长', 'dhiud');
INSERT INTO `teacher` VALUES (11, 3, 3, '饶⚪', 'www.pxxxhub.com');

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
  `USER_ID` int NOT NULL COMMENT '主键,用户id',
  `REAL_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户真实姓名',
  `USERNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户登录账号',
  `PASSWORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `TEL` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `MAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别(F女M男)',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '张狗蛋', 'mrbird', '94f860c4bbfeb2f49c84e321fdda4b07', '13455533233', 'mrbird12111111123@hotmail.com', 'M');
INSERT INTO `user` VALUES (2, '张静月', 'scott', '7b44a5363e3fd52435beb472e1d2b91f', '15134627380', 'scott@qq.com', 'M');
INSERT INTO `user` VALUES (3, '朱一丹', 'jack', '552649f10640385d0728a80a4242893e', NULL, 'jack@hotmail.com', 'M');
INSERT INTO `user` VALUES (4, '朱二丹', 'xiaoduan', 'dd3de68a6c00fed6168f8371233a6f7a', NULL, 'test@163.com', 'F');
INSERT INTO `user` VALUES (5, '朱三丹', 'test', '1c9a231a07da290d3286500bdd5fe8a9', '18811445654', 'sdfsdf@qq.com', 'F');
INSERT INTO `user` VALUES (6, '朱四丹', 'ddmtest14', '54b9e629dc5e6c8f13c076d397f0723c', '18856345234', '45116365@qq.com', 'F');
INSERT INTO `user` VALUES (7, '朱五丹', 'test1', 'ec69baa6c7505fd94d0f5061804d00ca', '18811487981', 'test1@qq.com', 'F');
INSERT INTO `user` VALUES (8, '朱六丹', 'admin', '3ee4a28b103216fa2d140d1979297910', '18246544545', 'admin@admin.com', 'F');
INSERT INTO `user` VALUES (9, '朱七丹', 'test33333', '78b8011fa4d77888f331646926bf5a12', '18658273808', 'sdasdas@adas.com', 'F');
INSERT INTO `user` VALUES (10, '饶元', 'xiaozhang', '5c25bd899750dc00ba63a561c66a11a2', NULL, 'raoyuan@tea.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (11, '贾秘书', 'mishu', '06c3daae82836a3a7f03449266237d90', '18097275161', NULL, 'M');
INSERT INTO `user` VALUES (12, '老师', 'laoshi', '1d81aa6354f5e87dee512cbc7a0668d4', '13389974516', '7640b31ef844c6dda2f3f7877c54e46e', 'F');
INSERT INTO `user` VALUES (13, '系办', 'dogshit', '7640b31ef844c6dda2f3f7877c54e46e', '13389974516', NULL, 'M');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `ID` int NOT NULL,
  `STAGE` int NULL DEFAULT NULL,
  `WEIGHT` float NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of weight
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
