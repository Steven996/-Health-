
-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `customer_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(6) NULL DEFAULT NULL,
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '上次买的消炎药十分好用', '2019-07-03 09:02:09.000000', 1);
INSERT INTO `t_comment` VALUES ('2', '药还可以，小孩子吃了好的很快', '2019-06-12 09:03:34.000000', 2);
INSERT INTO `t_comment` VALUES ('3', '谢谢发货前的仔细包装，东西没破损，看着也不错', '2019-03-15 09:04:12.000000', 3);
INSERT INTO `t_comment` VALUES ('2', '真的是物美价廉，性价比很高', '2019-07-01 09:05:05.000000', 4);
INSERT INTO `t_comment` VALUES ('3', '物流快，价格低，质量好！', '2019-06-14 09:06:35.000000', 5);
INSERT INTO `t_comment` VALUES ('2', '已经买了两次，效果不错', '2019-07-06 09:07:01.000000', 6);
INSERT INTO `t_comment` VALUES ('1', '上次那篇健康资讯非常实用', '2019-06-10 09:07:39.000000', 7);
INSERT INTO `t_comment` VALUES ('2', '十分不错，治疗鼻炎的首选', '2019-05-28 09:08:20.000000', 8);
INSERT INTO `t_comment` VALUES ('1', '上次的文章让我养成了良好的饮食习惯', '2019-04-10 11:11:00.000000', 9);
INSERT INTO `t_comment` VALUES ('3', '我了解到了什么不能混在一起吃，十分有用', '2019-06-24 09:12:22.000000', 10);
INSERT INTO `t_comment` VALUES ('2', '学到了许多在夏天解暑的小妙招', '2019-07-06 09:13:53.000000', 11);
INSERT INTO `t_comment` VALUES ('1', '给家里人买的，吃完以后，食欲不振的问题得到了解决', '2019-06-19 09:14:48.000000', 12);
INSERT INTO `t_comment` VALUES ('3', '确实很不错，就是总是缺货', '2019-05-12 09:17:47.000000', 13);
INSERT INTO `t_comment` VALUES ('2', '品质有保证，值得信赖，就是价格能有优惠就好了', '2019-06-23 09:18:34.000000', 14);
INSERT INTO `t_comment` VALUES ('3', '包装完好，口感和药店的差不多', '2019-07-04 09:19:21.000000', 15);
INSERT INTO `t_comment` VALUES ('1', '服用后，药效很好', '2019-06-10 09:20:55.000000', 17);
INSERT INTO `t_comment` VALUES ('3', '吃了三个月，感觉不再胸闷气短了', '2019-05-25 09:21:59.000000', 18);
INSERT INTO `t_comment` VALUES ('31', '大飒飒法撒打发', '2020-04-15 15:38:29.000000', 21);

-- ----------------------------
-- Table structure for t_commodity
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity`;
CREATE TABLE `t_commodity`  (
  `commodity_id` int(255) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commodity_totalCount` int(255) NULL DEFAULT NULL COMMENT '销量',
  `commodity_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commodity_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commodity_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commodity_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`commodity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_commodity
-- ----------------------------
INSERT INTO `t_commodity` VALUES (1, '多多乳酸菌素片', 3214, 'images/m8.png', '18.8', '开胃消食，便于消化', '1');
INSERT INTO `t_commodity` VALUES (2, '银涛六味安消胶囊', 11, 'images/m9.png', '12', '用于胃痛胀满', '1');
INSERT INTO `t_commodity` VALUES (3, '阿莫西林', 108, 'images/m1.png', '18', '常用于消炎', '1');
INSERT INTO `t_commodity` VALUES (4, '三九感冒灵颗粒', 66, 'images/m2.png', '55', '感冒发热，家庭常备', '1');
INSERT INTO `t_commodity` VALUES (5, '云南白药气雾剂', 99, 'images/m3.png', '99', '双屏双效，红白交替使用', '1');
INSERT INTO `t_commodity` VALUES (6, '太极藿香正气口服液', 7, 'images/m4.png', '24', '理气和中，高性价比', '1');
INSERT INTO `t_commodity` VALUES (7, '丙酸氟替卡松鼻喷雾剂', 1221, 'images/m5.png', '78', '过敏性鼻炎专用', '1');
INSERT INTO `t_commodity` VALUES (8, '康琦远红外平喘止咳贴', 643, 'images/m6.png', '68', '用于慢性支气管炎', '1');
INSERT INTO `t_commodity` VALUES (9, '养无极补肺丸', 87, 'images/m7.png', '298', '清热补肺', '1');
INSERT INTO `t_commodity` VALUES (11, '迪赛口腔溃疡含片', 1234, 'images/m10.png', '11.8', '治疗口腔溃疡', '-1');
INSERT INTO `t_commodity` VALUES (13, '力度伸维c泡腾片', 312, 'images/m11.png', '63', '增强机体抵抗力', '1');
INSERT INTO `t_commodity` VALUES (14, '三精蓝瓶口服液', 2344, 'images/m12.png', '28', '补锌补钙，蓝瓶的', '1');
INSERT INTO `t_commodity` VALUES (15, '钙尔奇钙片', 879, 'images/m13.png', '56', '补充碳酸钙', '1');
INSERT INTO `t_commodity` VALUES (16, '好将来小儿腹泻理疗贴', 156, 'images/m14.png', '16.9', '治疗小儿腹泻问题', '1');
INSERT INTO `t_commodity` VALUES (17, '优赛明维生素E乳', 122, 'images/m15.png', '35', '用于皮肤瘙痒处', '1');
INSERT INTO `t_commodity` VALUES (18, '邦力复方樟脑乳膏', 21, 'images/m16.png', '19.5', '用于虫咬皮炎，神经性皮炎', '1');
INSERT INTO `t_commodity` VALUES (19, '敬修堂跌打万花油', 324, 'images/m17.png', '8', '用于跌打损伤', '1');
INSERT INTO `t_commodity` VALUES (20, '信东聚乙烯醇滴眼液', 132, 'images/m18.png', '25', '有效缓解眼疲劳', '1');
INSERT INTO `t_commodity` VALUES (21, '珍视明护眼贴', 213, 'images/m19.png', '18', '缓解眼疲劳，酸胀，干涩', '1');
INSERT INTO `t_commodity` VALUES (22, '金牌风油精', 2453, 'images/m20.png', '13.8', '涂抹后可减少蚊虫叮咬', '1');
INSERT INTO `t_commodity` VALUES (23, '波尔多液', 45324, 'images/a.png', '50', '泡东西', '1');
INSERT INTO `t_commodity` VALUES (25, '不锈钢开口器', 654, 'images/c.png', '25', '给病人开口的东西', '1');
INSERT INTO `t_commodity` VALUES (26, '加厚不锈钢推车', 7865, 'images/d.png', '300', '推小器械的小推车', '1');
INSERT INTO `t_commodity` VALUES (27, '不锈钢刀柄', 9999, 'images/e.png', '10', '刀柄', '2');
INSERT INTO `t_commodity` VALUES (28, '高压消毒锅', 9998, 'images/f.png', '600', '消毒用的器皿', '2');
INSERT INTO `t_commodity` VALUES (29, '骨锤', 7778, 'images/g.png', '25', '测试膝跳反射', '2');
INSERT INTO `t_commodity` VALUES (30, '电烤灯', 555, 'images/h.png', '1888', '电烤等靠癌细胞', '2');
INSERT INTO `t_commodity` VALUES (31, '前列腺治疗仪', 200, 'images/i.png', '600', '用于治疗前列腺', '2');
INSERT INTO `t_commodity` VALUES (32, '医用手术器具', 222222, 'images/j.png', '50', '各种医疗器皿', '2');
INSERT INTO `t_commodity` VALUES (33, '体温计', 5156156, 'images/k.png', '200', '测量体温', '2');
INSERT INTO `t_commodity` VALUES (34, '雾化器', 666, 'images/l.png', '1000', '用来喷雾', '2');
INSERT INTO `t_commodity` VALUES (35, '消毒熏箱', 55555, 'images/m.png', '666', '用来存放甲醛福尔马林', '2');
INSERT INTO `t_commodity` VALUES (36, '创可贴', 818, 'images/n.png', '50', '用来沾手', '2');
INSERT INTO `t_commodity` VALUES (37, '不锈钢牙骨锤', 449849, 'images/o.png', '50', '锤牙', '2');
INSERT INTO `t_commodity` VALUES (38, '不锈钢底座', 555, 'images/p.png', '80', '座位仪器的底座', '2');
INSERT INTO `t_commodity` VALUES (39, '不锈钢剪', 666, 'images/q.png', '30', '开膛破肚', '2');
INSERT INTO `t_commodity` VALUES (40, '三槽', 448, 'images/r.png', '150', '洗手洗仪器好几遍', '2');
INSERT INTO `t_commodity` VALUES (41, '止血钳', 16165165, 'images/s.png', '30', '止血的钳子', '2');
INSERT INTO `t_commodity` VALUES (42, '注射器', 56156, 'images/t.png', '42', '扎人', '2');
INSERT INTO `t_commodity` VALUES (43, '以岭 连花清瘟胶囊 ', 2134, 'images/m21.jpg', '13.60', '24粒 莲花清瘟 清瘟解毒 宣肺泄热 流行性感冒 发烧或发热头痛咳嗽 中药感冒药 ', '2');
INSERT INTO `t_commodity` VALUES (44, '磨磨', 11, 'images/2f3c37f66dae4ab0b03620756b91c45c.jpeg', '111', '某咯无聊', '-1');

-- ----------------------------
-- Table structure for t_commodity_type
-- ----------------------------
DROP TABLE IF EXISTS `t_commodity_type`;
CREATE TABLE `t_commodity_type`  (
  `commodity_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commodity_type_id` int(255) NOT NULL AUTO_INCREMENT,
  `commodity_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`commodity_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_commodity_type
-- ----------------------------
INSERT INTO `t_commodity_type` VALUES ('医疗用品', 1, '1');
INSERT INTO `t_commodity_type` VALUES ('医疗器材', 2, '2');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `customer_id` int(255) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip` int(20) NULL DEFAULT NULL,
  `customer_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_height` double(255, 0) NULL DEFAULT NULL,
  `customer_weight` double(255, 0) NULL DEFAULT NULL,
  `customer_bmi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (1, 'Frank', '11', 0, 'images/19cace4da0024456bd858f1f4b748d85.png', 100, 12, '24.2为过重体质，请合理饮食', '147856958');
INSERT INTO `t_customer` VALUES (2, '1309114954@qq.com', '54', 1, 'images/user2.png', 150, 70, '100', '97956665');
INSERT INTO `t_customer` VALUES (3, 'panghu', '1', 1, 'images/user3.png', 170, 200, '10', '55458877');
INSERT INTO `t_customer` VALUES (4, '白色冰激凌', '123', 1, 'images/qq.jpg', 165, 90, '14', '89887989');
INSERT INTO `t_customer` VALUES (5, '绿色的毛驴', '123', 1, 'images/ww.jpg', 168, 70, '12.0', '32434344');
INSERT INTO `t_customer` VALUES (6, '村里的小路', '123ww', 1, 'images/ee.jpg', 185, 80, '13', '123233567');
INSERT INTO `t_customer` VALUES (7, '忧伤的笔记本', '123', 1, 'images/rr.jpg', 178, 75, '14', '543332621');
INSERT INTO `t_customer` VALUES (8, 'vector', '123', 0, 'images/tt.jpg', 174, 87, '15', '565546897');
INSERT INTO `t_customer` VALUES (9, '火锅的诱惑', '123', 1, 'images/yy.jpg', 210, 90, '13', '3472343422');
INSERT INTO `t_customer` VALUES (10, '团团', 'asdf', 1, 'images/uu.jpg', 213, 34, '23.0为正常体质，请合理饮食', '123432432141234');
INSERT INTO `t_customer` VALUES (30, '吕小布', '111', NULL, 'images/49932e6b58584e0a978711aa06290f1c.jpg', 12, 123, '21.3', '130193201493214');
INSERT INTO `t_customer` VALUES (31, '凯', '1234', NULL, 'images/ac97967bbdc94d96aa88b33bbb0b2649.jfif', 12, 123, '18.1为偏瘦体质，请合理饮食', '12340213949123');
INSERT INTO `t_customer` VALUES (32, '李白', '1234', NULL, 'images/89f375cb55214305b11a4521f6b5a90d.jpg', NULL, NULL, NULL, '123432141324123');

-- ----------------------------
-- Table structure for t_like
-- ----------------------------
DROP TABLE IF EXISTS `t_like`;
CREATE TABLE `t_like`  (
  `customer_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `like_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`like_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `news_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `news_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES (6, '香蕉和它煮在一起不仅能减肥，还可以改善便秘和失眠！\r\n', 'images/6.png', '香蕉和它煮在一起不仅能减肥，还可以改善便秘和失眠！\r\n');
INSERT INTO `t_news` VALUES (7, '胃癌多是“拖”出来的，如果你在饭后有这3种表现，务必去检查\r\n', 'images/7.png', '胃癌多是“拖”出来的，如果你在饭后有这3种表现，务必去检查\r\n');
INSERT INTO `t_news` VALUES (9, '用它泡过的葡萄干，不仅能有效防治减肥反弹，还能防癌、降血压！\r\n', 'images/9.png', '用它泡过的葡萄干，不仅能有效防治减肥反弹，还能防癌、降血压！\r\n');
INSERT INTO `t_news` VALUES (10, '口腔里出现的溃疡糜烂，吃3个水果就能帮到你！\r\n', 'images/10.png', '口腔里出现的溃疡糜烂，吃3个水果就能帮到你！\r\n');
INSERT INTO `t_news` VALUES (11, '4种养生水果，大肚子克星，坚持吃肚子平平，皮肤还超好\r\n', 'images/11.png', '4种养生水果，大肚子克星，坚持吃肚子平平，皮肤还超好\r\n');
INSERT INTO `t_news` VALUES (12, '芹菜中除了含有大量的膳食纤维、钙、胡萝卜素、维生素C、酸性物质以及蛋白质等营养物质。芹菜中的酸性物质可以有效降低血压，高血压患者经常食用，不仅可以降低血压，还可以补充人体所需的营养物质。', 'images/12.png', '芹菜的好处多多多');
INSERT INTO `t_news` VALUES (25, '商务部发布的数据显示，3月30日，11家主要电商平台多数生活必需品库存充足，其中食用油可销售17天，大米可销售12天，面粉可销售15天。  　　有人担心，只有10多天会不会不太够？其实，电商平台考虑到库存成本、食品安全等角度，一般会科学设定库存。所以，这个时间一般不会太长。只需在预定时间内，做好库存接续就行。所以，无论是线上还是线下，买到米面油都是没问题的！', 'images/3b69804c350f4ad280d787ec47532f3d.jpg', '有人在囤米面油？官方回应来了：这个，真没必要 ');
INSERT INTO `t_news` VALUES (26, '每天晒晒太阳，户外活动可以有效预防近视，由于太阳光能刺激多巴胺含量，起到延缓近视发展的作用。但由于疫情期间不方便长时间进行户外活动，所以，我们也可以选择在自家阳台或院子等能照射到阳光的地方多晒太阳，每天至少2个小时。', 'images/b1b36983f41748f2ac4296408f73548d.jpg', '电脑手机每天使用 孩子视力如何保护？');
INSERT INTO `t_news` VALUES (27, '心理倾向，“脑补”是美丽遐想  　　“在人的五官中，眼睛所表现的表情最为丰富，眼神、瞳孔、眼皮、方向等的组合，可以表现出无数意义，遐想和猜测成为一种必然。”心理和社交专家于际敬告诉记者，对于被口罩遮挡的部分，人类的心理会本能地补全，而且一般是往好的方向补全，所以小姜那种对口罩背后美丽的联想是合情合理的。', 'images/fa4bb364e3104b2aa4669fa6e375280e.jpg', '戴上口罩都变好看了？专家称确有科学依据');
INSERT INTO `t_news` VALUES (28, '疫情期间，大家响应“勤洗手，戴口罩，不聚集”的号召，无论是一线的医护人员还是普通人，洗手的频率都大大增加。但过于频繁的清洁和消毒会对皮肤屏障造成破坏，导致皮肤干燥进而引发皮炎或皮肤感染。因此，在保持手部清洁、防止接触传播的同时，避免频繁清洁对皮肤屏障的损害同样十分重要。', 'images/f794d6ca6b1d44d3ad9c56ab5daf56d8.jpg', '勤洗手还要会洗手');
INSERT INTO `t_news` VALUES (29, '醋是由高粱、大麦发酵而成，有活血化瘀、消食下气的功效，醋尤其是陈醋、黑醋，色黑入肝肾，有助化解肝血的瘀滞，所以春天吃用陈醋很有保健价值。  　　中药里面很多需要入肝的药物都是用黑醋作为药引进行炮制，例如醋龟甲、醋鳖甲，一些活血化瘀的方剂，服用的时候需要加醋佐服，春天吃醋泡黑豆、黑醋鸡蛋、陈醋大蒜等，有助养血活血、改善睡眠、调节血压、预防中风，对心脑血管病患者很有好处。', 'images/208757e96998466fbf89037d791de59a.jpg', '春天就要“争蜂吃醋”');
INSERT INTO `t_news` VALUES (30, '随着新冠疫情得到进一步的控制，消费者的出游意愿有什么变化？由中山大学保继刚教授团队和澳大利亚格里菲斯大学金鑫博士团队联合推出的“新冠疫情结束后消费者旅游态度”调查(以下简称“研究成果”)显示，超过一半的受访者选择今年下半年出游，其中选择七月或八月出游的超过四分之一。长江学者、中山大学教授保继刚指出，在旅游业休眠和恢复初期，旅游企业和从业者应该更多地思考如何开发适合旅游者的创新产品，以鼓励旅游消费愿望，同时，疫情在全球的爆发会否对国内旅游恢复产生负面影响，消费者出行的时间线会否改变，还需要作进一步的调查。', 'images/255bbf43d99940d9be053a79806c86a4.jpg', '疫情结束，你会在什么时间出游？');
INSERT INTO `t_news` VALUES (31, '辟谣 新冠病毒经呼吸道进入人体，主要侵害部位是肺部。目前没有研究证据表明，病毒会在咽喉部位停留4日才进入肺部；而且，盐水、醋和清水对病毒本身并没有杀灭作用。目前对新冠病毒有效的消毒方式有医用75%酒精、紫外线以及含氯消毒剂等，这些消毒剂属体外消毒用品，其消毒机制与体内消毒并不相同。', 'images/480a253b99f14d12902cf97331b50037.jpg', '喝醋能消灭新冠病毒？假的');
INSERT INTO `t_news` VALUES (32, '2014年世界卫生组织-国际癌症研究机构发布了“根除幽门螺旋杆菌感染预防胃癌策略”共识报告，推荐根除幽门螺旋杆菌感染可以作为预防胃癌的有效手段。这家机构的研究团队近期公布的分析结果显示：导致癌症的元凶排名前三的是幽门螺旋杆菌、人乳头瘤病毒和乙肝病毒。其中，幽门螺旋杆菌容易通过共餐传染。', 'images/d93a21b11ec849058f1f372204762ab3.jpg', '共餐还有这些风险？看看专家怎么说');
INSERT INTO `t_news` VALUES (33, '在使用电子产品时，除了需要保持合适的距离，也要把电脑屏幕调整到合适的高度，当人的眼睛与电脑屏幕同高时，眼球的暴露程度大约为90%。眼球暴露面积越多，这就导致了眼球表面的泪液蒸发得更多，眼睛也就更容易干涩和疲劳。将屏幕角度从仰角调整成相对俯角的状态，屏幕中心点在眼睛下方15cm左右，屏幕亮度以不刺眼、不费力能看清为宜。可以降低眼睛睁开的角度，减少眼球暴露，缓解眼睛疲劳的发生。', 'images/1b809bff9d6645b9be76a14e6e759e67.jpg', '上网课、网络办公导致眼睛干涩？四个妙招缓解视疲劳');

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pass` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (1, 'admin', '11', 'images/user1.png');

SET FOREIGN_KEY_CHECKS = 1;
