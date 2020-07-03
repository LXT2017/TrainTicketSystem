/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : train

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 22/06/2020 23:35:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `status` int(2) NULL DEFAULT NULL,
  `price` decimal(8, 2) NULL DEFAULT NULL,
  `traindate` date NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `user_id` int(20) NULL DEFAULT NULL,
  `train_id` int(20) NULL DEFAULT NULL,
  `seattype` int(2) NULL DEFAULT NULL,
  `carriage` int(3) NULL DEFAULT NULL,
  `seat` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `train_id`(`train_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1100000004, 2, 25.00, '2020-06-23', '2020-06-21 17:51:31', 3, 3, 2, 1, '01A', 1);
INSERT INTO `orders` VALUES (1100000005, 2, 30.00, '2020-06-23', '2020-06-21 17:53:02', 4, 2, 1, 1, '01A', 1);

-- ----------------------------
-- Table structure for orderseat
-- ----------------------------
DROP TABLE IF EXISTS `orderseat`;
CREATE TABLE `orderseat`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `status` int(2) NULL DEFAULT NULL,
  `orderdate` date NULL DEFAULT NULL,
  `train_id` int(20) NULL DEFAULT NULL,
  `seat_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `train_id`(`train_id`) USING BTREE,
  INDEX `seat_id`(`seat_id`) USING BTREE,
  CONSTRAINT `orderseat_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderseat_ibfk_2` FOREIGN KEY (`seat_id`) REFERENCES `trainseat` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderseat
-- ----------------------------
INSERT INTO `orderseat` VALUES (1, 1, '2020-06-03', 1, 1);
INSERT INTO `orderseat` VALUES (2, 0, '2020-06-24', 1, 2);
INSERT INTO `orderseat` VALUES (3, 1, '2020-06-24', 1, 3);
INSERT INTO `orderseat` VALUES (4, 0, '2020-06-24', 1, 4);
INSERT INTO `orderseat` VALUES (5, 0, '2020-06-24', 1, 1);
INSERT INTO `orderseat` VALUES (6, 0, '2020-06-12', 1, 1);
INSERT INTO `orderseat` VALUES (7, 0, '2020-06-12', 1, 2);
INSERT INTO `orderseat` VALUES (8, 0, '2020-06-12', 1, 3);
INSERT INTO `orderseat` VALUES (9, 0, '2020-06-12', 1, 4);
INSERT INTO `orderseat` VALUES (10, 0, '2020-06-12', 1, 5);
INSERT INTO `orderseat` VALUES (11, 0, '2020-06-12', 1, 6);
INSERT INTO `orderseat` VALUES (12, 0, '2020-06-12', 1, 7);
INSERT INTO `orderseat` VALUES (13, 0, '2020-06-12', 1, 8);
INSERT INTO `orderseat` VALUES (14, 0, '2020-06-12', 1, 9);
INSERT INTO `orderseat` VALUES (15, 0, '2020-06-12', 1, 10);
INSERT INTO `orderseat` VALUES (16, 0, '2020-06-12', 1, 11);
INSERT INTO `orderseat` VALUES (17, 0, '2020-06-12', 1, 12);
INSERT INTO `orderseat` VALUES (18, 0, '2020-06-12', 1, 13);
INSERT INTO `orderseat` VALUES (19, 0, '2020-06-12', 1, 14);
INSERT INTO `orderseat` VALUES (20, 0, '2020-06-12', 1, 15);
INSERT INTO `orderseat` VALUES (21, 0, '2020-06-12', 1, 16);
INSERT INTO `orderseat` VALUES (22, 0, '2020-06-12', 1, 17);
INSERT INTO `orderseat` VALUES (23, 0, '2020-06-12', 1, 18);
INSERT INTO `orderseat` VALUES (24, 0, '2020-06-12', 1, 19);
INSERT INTO `orderseat` VALUES (25, 0, '2020-06-12', 1, 20);
INSERT INTO `orderseat` VALUES (26, 0, '2020-06-13', 1, 1);
INSERT INTO `orderseat` VALUES (27, 0, '2020-06-13', 1, 2);
INSERT INTO `orderseat` VALUES (28, 0, '2020-06-13', 1, 3);
INSERT INTO `orderseat` VALUES (29, 0, '2020-06-13', 1, 4);
INSERT INTO `orderseat` VALUES (30, 0, '2020-06-13', 1, 5);
INSERT INTO `orderseat` VALUES (31, 0, '2020-06-13', 1, 6);
INSERT INTO `orderseat` VALUES (32, 0, '2020-06-13', 1, 7);
INSERT INTO `orderseat` VALUES (33, 0, '2020-06-13', 1, 8);
INSERT INTO `orderseat` VALUES (34, 0, '2020-06-13', 1, 9);
INSERT INTO `orderseat` VALUES (35, 0, '2020-06-13', 1, 10);
INSERT INTO `orderseat` VALUES (36, 0, '2020-06-13', 1, 11);
INSERT INTO `orderseat` VALUES (37, 0, '2020-06-13', 1, 12);
INSERT INTO `orderseat` VALUES (38, 0, '2020-06-13', 1, 13);
INSERT INTO `orderseat` VALUES (39, 0, '2020-06-13', 1, 14);
INSERT INTO `orderseat` VALUES (40, 0, '2020-06-13', 1, 15);
INSERT INTO `orderseat` VALUES (41, 0, '2020-06-13', 1, 16);
INSERT INTO `orderseat` VALUES (42, 0, '2020-06-13', 1, 17);
INSERT INTO `orderseat` VALUES (43, 0, '2020-06-13', 1, 18);
INSERT INTO `orderseat` VALUES (44, 0, '2020-06-13', 1, 19);
INSERT INTO `orderseat` VALUES (45, 0, '2020-06-13', 1, 20);
INSERT INTO `orderseat` VALUES (46, 1, '2020-06-15', 2, 42);
INSERT INTO `orderseat` VALUES (47, 1, '2020-06-15', 2, 43);
INSERT INTO `orderseat` VALUES (48, 1, '2020-06-15', 2, 44);
INSERT INTO `orderseat` VALUES (49, 1, '2020-06-15', 2, 45);
INSERT INTO `orderseat` VALUES (50, 1, '2020-06-15', 2, 46);
INSERT INTO `orderseat` VALUES (51, 1, '2020-06-15', 2, 47);
INSERT INTO `orderseat` VALUES (52, 1, '2020-06-15', 2, 48);
INSERT INTO `orderseat` VALUES (53, 1, '2020-06-15', 2, 49);
INSERT INTO `orderseat` VALUES (54, 1, '2020-06-15', 2, 50);
INSERT INTO `orderseat` VALUES (55, 1, '2020-06-15', 2, 51);
INSERT INTO `orderseat` VALUES (56, 1, '2020-06-15', 2, 52);
INSERT INTO `orderseat` VALUES (57, 1, '2020-06-15', 2, 53);
INSERT INTO `orderseat` VALUES (58, 1, '2020-06-15', 2, 54);
INSERT INTO `orderseat` VALUES (59, 1, '2020-06-15', 2, 55);
INSERT INTO `orderseat` VALUES (60, 1, '2020-06-15', 2, 56);
INSERT INTO `orderseat` VALUES (61, 1, '2020-06-15', 2, 57);
INSERT INTO `orderseat` VALUES (62, 1, '2020-06-15', 2, 58);
INSERT INTO `orderseat` VALUES (63, 1, '2020-06-15', 2, 59);
INSERT INTO `orderseat` VALUES (64, 1, '2020-06-15', 2, 60);
INSERT INTO `orderseat` VALUES (65, 1, '2020-06-15', 2, 61);
INSERT INTO `orderseat` VALUES (66, 1, '2020-06-15', 3, 62);
INSERT INTO `orderseat` VALUES (67, 1, '2020-06-15', 3, 63);
INSERT INTO `orderseat` VALUES (68, 1, '2020-06-15', 3, 64);
INSERT INTO `orderseat` VALUES (69, 1, '2020-06-15', 3, 65);
INSERT INTO `orderseat` VALUES (70, 1, '2020-06-15', 3, 66);
INSERT INTO `orderseat` VALUES (71, 1, '2020-06-15', 3, 67);
INSERT INTO `orderseat` VALUES (72, 1, '2020-06-15', 3, 68);
INSERT INTO `orderseat` VALUES (73, 1, '2020-06-15', 3, 69);
INSERT INTO `orderseat` VALUES (74, 1, '2020-06-15', 3, 70);
INSERT INTO `orderseat` VALUES (75, 1, '2020-06-15', 3, 71);
INSERT INTO `orderseat` VALUES (76, 1, '2020-06-15', 3, 72);
INSERT INTO `orderseat` VALUES (77, 1, '2020-06-15', 3, 73);
INSERT INTO `orderseat` VALUES (78, 1, '2020-06-15', 3, 74);
INSERT INTO `orderseat` VALUES (79, 1, '2020-06-15', 3, 75);
INSERT INTO `orderseat` VALUES (80, 1, '2020-06-15', 3, 76);
INSERT INTO `orderseat` VALUES (81, 1, '2020-06-15', 3, 77);
INSERT INTO `orderseat` VALUES (82, 1, '2020-06-15', 3, 78);
INSERT INTO `orderseat` VALUES (83, 1, '2020-06-15', 3, 79);
INSERT INTO `orderseat` VALUES (84, 1, '2020-06-15', 3, 80);
INSERT INTO `orderseat` VALUES (85, 1, '2020-06-15', 3, 81);
INSERT INTO `orderseat` VALUES (86, 1, '2020-06-16', 2, 42);
INSERT INTO `orderseat` VALUES (87, 1, '2020-06-16', 2, 43);
INSERT INTO `orderseat` VALUES (88, 1, '2020-06-16', 2, 44);
INSERT INTO `orderseat` VALUES (89, 1, '2020-06-16', 2, 45);
INSERT INTO `orderseat` VALUES (90, 1, '2020-06-16', 2, 46);
INSERT INTO `orderseat` VALUES (91, 1, '2020-06-16', 2, 47);
INSERT INTO `orderseat` VALUES (92, 1, '2020-06-16', 2, 48);
INSERT INTO `orderseat` VALUES (93, 1, '2020-06-16', 2, 49);
INSERT INTO `orderseat` VALUES (94, 1, '2020-06-16', 2, 50);
INSERT INTO `orderseat` VALUES (95, 1, '2020-06-16', 2, 51);
INSERT INTO `orderseat` VALUES (96, 1, '2020-06-16', 2, 52);
INSERT INTO `orderseat` VALUES (97, 1, '2020-06-16', 2, 53);
INSERT INTO `orderseat` VALUES (98, 1, '2020-06-16', 2, 54);
INSERT INTO `orderseat` VALUES (99, 1, '2020-06-16', 2, 55);
INSERT INTO `orderseat` VALUES (100, 1, '2020-06-16', 2, 56);
INSERT INTO `orderseat` VALUES (101, 1, '2020-06-16', 2, 57);
INSERT INTO `orderseat` VALUES (102, 1, '2020-06-16', 2, 58);
INSERT INTO `orderseat` VALUES (103, 1, '2020-06-16', 2, 59);
INSERT INTO `orderseat` VALUES (104, 1, '2020-06-16', 2, 60);
INSERT INTO `orderseat` VALUES (105, 1, '2020-06-16', 2, 61);
INSERT INTO `orderseat` VALUES (106, 1, '2020-06-16', 3, 62);
INSERT INTO `orderseat` VALUES (107, 1, '2020-06-16', 3, 63);
INSERT INTO `orderseat` VALUES (108, 1, '2020-06-16', 3, 64);
INSERT INTO `orderseat` VALUES (109, 1, '2020-06-16', 3, 65);
INSERT INTO `orderseat` VALUES (110, 1, '2020-06-16', 3, 66);
INSERT INTO `orderseat` VALUES (111, 1, '2020-06-16', 3, 67);
INSERT INTO `orderseat` VALUES (112, 1, '2020-06-16', 3, 68);
INSERT INTO `orderseat` VALUES (113, 1, '2020-06-16', 3, 69);
INSERT INTO `orderseat` VALUES (114, 1, '2020-06-16', 3, 70);
INSERT INTO `orderseat` VALUES (115, 1, '2020-06-16', 3, 71);
INSERT INTO `orderseat` VALUES (116, 1, '2020-06-16', 3, 72);
INSERT INTO `orderseat` VALUES (117, 1, '2020-06-16', 3, 73);
INSERT INTO `orderseat` VALUES (118, 1, '2020-06-16', 3, 74);
INSERT INTO `orderseat` VALUES (119, 1, '2020-06-16', 3, 75);
INSERT INTO `orderseat` VALUES (120, 1, '2020-06-16', 3, 76);
INSERT INTO `orderseat` VALUES (121, 1, '2020-06-16', 3, 77);
INSERT INTO `orderseat` VALUES (122, 1, '2020-06-16', 3, 78);
INSERT INTO `orderseat` VALUES (123, 1, '2020-06-16', 3, 79);
INSERT INTO `orderseat` VALUES (124, 1, '2020-06-16', 3, 80);
INSERT INTO `orderseat` VALUES (125, 1, '2020-06-16', 3, 81);
INSERT INTO `orderseat` VALUES (126, 1, '2020-06-23', 2, 42);
INSERT INTO `orderseat` VALUES (127, 1, '2020-06-23', 2, 43);
INSERT INTO `orderseat` VALUES (128, 1, '2020-06-23', 2, 44);
INSERT INTO `orderseat` VALUES (129, 1, '2020-06-23', 2, 45);
INSERT INTO `orderseat` VALUES (130, 1, '2020-06-23', 2, 46);
INSERT INTO `orderseat` VALUES (131, 1, '2020-06-23', 2, 47);
INSERT INTO `orderseat` VALUES (132, 1, '2020-06-23', 2, 48);
INSERT INTO `orderseat` VALUES (133, 1, '2020-06-23', 2, 49);
INSERT INTO `orderseat` VALUES (134, 1, '2020-06-23', 2, 50);
INSERT INTO `orderseat` VALUES (135, 1, '2020-06-23', 2, 51);
INSERT INTO `orderseat` VALUES (136, 1, '2020-06-23', 2, 52);
INSERT INTO `orderseat` VALUES (137, 1, '2020-06-23', 2, 53);
INSERT INTO `orderseat` VALUES (138, 1, '2020-06-23', 2, 54);
INSERT INTO `orderseat` VALUES (139, 1, '2020-06-23', 2, 55);
INSERT INTO `orderseat` VALUES (140, 1, '2020-06-23', 2, 56);
INSERT INTO `orderseat` VALUES (141, 1, '2020-06-23', 2, 57);
INSERT INTO `orderseat` VALUES (142, 1, '2020-06-23', 2, 58);
INSERT INTO `orderseat` VALUES (143, 1, '2020-06-23', 2, 59);
INSERT INTO `orderseat` VALUES (144, 1, '2020-06-23', 2, 60);
INSERT INTO `orderseat` VALUES (145, 1, '2020-06-23', 2, 61);
INSERT INTO `orderseat` VALUES (146, 1, '2020-06-23', 3, 62);
INSERT INTO `orderseat` VALUES (147, 1, '2020-06-23', 3, 63);
INSERT INTO `orderseat` VALUES (148, 1, '2020-06-23', 3, 64);
INSERT INTO `orderseat` VALUES (149, 1, '2020-06-23', 3, 65);
INSERT INTO `orderseat` VALUES (150, 1, '2020-06-23', 3, 66);
INSERT INTO `orderseat` VALUES (151, 1, '2020-06-23', 3, 67);
INSERT INTO `orderseat` VALUES (152, 1, '2020-06-23', 3, 68);
INSERT INTO `orderseat` VALUES (153, 1, '2020-06-23', 3, 69);
INSERT INTO `orderseat` VALUES (154, 1, '2020-06-23', 3, 70);
INSERT INTO `orderseat` VALUES (155, 1, '2020-06-23', 3, 71);
INSERT INTO `orderseat` VALUES (156, 1, '2020-06-23', 3, 72);
INSERT INTO `orderseat` VALUES (157, 1, '2020-06-23', 3, 73);
INSERT INTO `orderseat` VALUES (158, 1, '2020-06-23', 3, 74);
INSERT INTO `orderseat` VALUES (159, 1, '2020-06-23', 3, 75);
INSERT INTO `orderseat` VALUES (160, 1, '2020-06-23', 3, 76);
INSERT INTO `orderseat` VALUES (161, 1, '2020-06-23', 3, 77);
INSERT INTO `orderseat` VALUES (162, 1, '2020-06-23', 3, 78);
INSERT INTO `orderseat` VALUES (163, 1, '2020-06-23', 3, 79);
INSERT INTO `orderseat` VALUES (164, 1, '2020-06-23', 3, 80);
INSERT INTO `orderseat` VALUES (165, 1, '2020-06-23', 3, 81);

-- ----------------------------
-- Table structure for passenger
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int(2) NULL DEFAULT 0,
  `idcard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int(20) NULL DEFAULT NULL,
  `userrelation_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `userrelation_id`(`userrelation_id`) USING BTREE,
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `passenger_ibfk_2` FOREIGN KEY (`userrelation_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of passenger
-- ----------------------------
INSERT INTO `passenger` VALUES (1, '小红', 0, '330621195402324252', 2, 1);
INSERT INTO `passenger` VALUES (2, '小李', 0, '330214568754123589', 3, 1);
INSERT INTO `passenger` VALUES (3, '杨戬', 0, '330214568754123589', 4, 1);

-- ----------------------------
-- Table structure for pricemanage
-- ----------------------------
DROP TABLE IF EXISTS `pricemanage`;
CREATE TABLE `pricemanage`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `returnprice` double NULL DEFAULT NULL,
  `Discount` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pricemanage
-- ----------------------------

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `carriage` int(3) NULL DEFAULT NULL,
  `type` int(2) NULL DEFAULT NULL,
  `seat` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES (1, 1, 1, '01A');
INSERT INTO `seat` VALUES (2, 1, 1, '01B');
INSERT INTO `seat` VALUES (3, 1, 1, '02A');
INSERT INTO `seat` VALUES (4, 1, 1, '02B');
INSERT INTO `seat` VALUES (5, 1, 1, '03A');
INSERT INTO `seat` VALUES (6, 1, 1, '03B');
INSERT INTO `seat` VALUES (7, 1, 1, '04A');
INSERT INTO `seat` VALUES (8, 1, 1, '04B');
INSERT INTO `seat` VALUES (9, 1, 1, '05A');
INSERT INTO `seat` VALUES (10, 1, 1, '05B');
INSERT INTO `seat` VALUES (11, 2, 2, '01A');
INSERT INTO `seat` VALUES (12, 2, 2, '01B');
INSERT INTO `seat` VALUES (13, 2, 2, '02A');
INSERT INTO `seat` VALUES (14, 2, 2, '02B');
INSERT INTO `seat` VALUES (15, 2, 2, '03A');
INSERT INTO `seat` VALUES (16, 2, 2, '03B');
INSERT INTO `seat` VALUES (17, 2, 2, '04A');
INSERT INTO `seat` VALUES (18, 2, 2, '04B');
INSERT INTO `seat` VALUES (19, 2, 2, '05A');
INSERT INTO `seat` VALUES (20, 2, 2, '05B');

-- ----------------------------
-- Table structure for train
-- ----------------------------
DROP TABLE IF EXISTS `train`;
CREATE TABLE `train`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int(2) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train
-- ----------------------------
INSERT INTO `train` VALUES (1, 'G100', 0);
INSERT INTO `train` VALUES (2, 'G101', 0);
INSERT INTO `train` VALUES (3, 'G102', 0);
INSERT INTO `train` VALUES (4, 'G104', 0);
INSERT INTO `train` VALUES (5, 'G105', 0);
INSERT INTO `train` VALUES (6, 'G106', 0);
INSERT INTO `train` VALUES (7, 'G107', 0);
INSERT INTO `train` VALUES (8, 'G108', 0);
INSERT INTO `train` VALUES (9, 'G109', 0);
INSERT INTO `train` VALUES (10, 'G110', 0);

-- ----------------------------
-- Table structure for traininfo
-- ----------------------------
DROP TABLE IF EXISTS `traininfo`;
CREATE TABLE `traininfo`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `startcity` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `starttime` time(0) NULL DEFAULT NULL,
  `endcity` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `endtime` time(0) NULL DEFAULT NULL,
  `fprice` decimal(8, 2) NULL DEFAULT NULL,
  `sprice` decimal(8, 2) NULL DEFAULT NULL,
  `fnum` int(8) NULL DEFAULT NULL,
  `snum` int(8) NULL DEFAULT NULL,
  `train_id` int(20) NULL DEFAULT NULL,
  `duration` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `train_id`(`train_id`) USING BTREE,
  CONSTRAINT `traininfo_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traininfo
-- ----------------------------
INSERT INTO `traininfo` VALUES (1, '杭州', '14:59:35', '绍兴', '15:59:52', 33.00, 19.00, 10, 10, 1, '1小时25分种');
INSERT INTO `traininfo` VALUES (2, '杭州', '15:35:55', '宁波', '17:59:52', 30.00, 15.00, 10, 10, 2, '2小时25分种');
INSERT INTO `traininfo` VALUES (3, '杭州', '15:11:55', '宁波', '15:59:52', 55.00, 25.00, 10, 10, 3, '25分种');
INSERT INTO `traininfo` VALUES (4, '绍兴', '10:16:52', '金华', '13:16:55', 22.00, 11.00, 10, 10, 4, '1小时33分种');
INSERT INTO `traininfo` VALUES (5, '温州', '11:17:36', '绍兴', '17:17:45', 105.00, 65.00, 10, 10, 5, '5小时59分种');
INSERT INTO `traininfo` VALUES (6, '杭州', '11:18:08', '温州', '15:59:52', 125.00, 75.00, 10, 10, 6, '4小时25分种');
INSERT INTO `traininfo` VALUES (8, '杭州', '08:11:55', '宁波', '08:59:52', 30.00, 15.00, 10, 10, 7, '35分钟');
INSERT INTO `traininfo` VALUES (9, '杭州', '10:11:55', '宁波', '15:59:52', 55.00, 25.00, 10, 10, 8, '45分种');
INSERT INTO `traininfo` VALUES (10, '杭州', '12:11:55', '宁波', '12:59:52', 55.00, 25.00, 10, 10, 9, '45分种');
INSERT INTO `traininfo` VALUES (11, '杭州', '17:11:55', '宁波', '17:59:52', 55.00, 25.00, 10, 10, 10, '45分种');

-- ----------------------------
-- Table structure for trainseat
-- ----------------------------
DROP TABLE IF EXISTS `trainseat`;
CREATE TABLE `trainseat`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `carriage` int(3) NULL DEFAULT NULL,
  `type` int(2) NULL DEFAULT NULL,
  `seat` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `train_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `train_id`(`train_id`) USING BTREE,
  CONSTRAINT `trainseat_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 221 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trainseat
-- ----------------------------
INSERT INTO `trainseat` VALUES (1, 1, 1, '01A', 1);
INSERT INTO `trainseat` VALUES (2, 1, 1, '01B', 1);
INSERT INTO `trainseat` VALUES (3, 1, 1, '02A', 1);
INSERT INTO `trainseat` VALUES (4, 1, 1, '02B', 1);
INSERT INTO `trainseat` VALUES (5, 1, 1, '03A', 1);
INSERT INTO `trainseat` VALUES (6, 1, 1, '03B', 1);
INSERT INTO `trainseat` VALUES (7, 1, 1, '04A', 1);
INSERT INTO `trainseat` VALUES (8, 1, 1, '04B', 1);
INSERT INTO `trainseat` VALUES (9, 1, 1, '05A', 1);
INSERT INTO `trainseat` VALUES (10, 1, 1, '05B', 1);
INSERT INTO `trainseat` VALUES (11, 2, 2, '01A', 1);
INSERT INTO `trainseat` VALUES (12, 2, 2, '01B', 1);
INSERT INTO `trainseat` VALUES (13, 2, 2, '02A', 1);
INSERT INTO `trainseat` VALUES (14, 2, 2, '02B', 1);
INSERT INTO `trainseat` VALUES (15, 2, 2, '03A', 1);
INSERT INTO `trainseat` VALUES (16, 2, 2, '03B', 1);
INSERT INTO `trainseat` VALUES (17, 2, 2, '04A', 1);
INSERT INTO `trainseat` VALUES (18, 2, 2, '04B', 1);
INSERT INTO `trainseat` VALUES (19, 2, 2, '05A', 1);
INSERT INTO `trainseat` VALUES (20, 2, 2, '05B', 1);
INSERT INTO `trainseat` VALUES (42, 1, 1, '01A', 2);
INSERT INTO `trainseat` VALUES (43, 1, 1, '01B', 2);
INSERT INTO `trainseat` VALUES (44, 1, 1, '02A', 2);
INSERT INTO `trainseat` VALUES (45, 1, 1, '02B', 2);
INSERT INTO `trainseat` VALUES (46, 1, 1, '03A', 2);
INSERT INTO `trainseat` VALUES (47, 1, 1, '03B', 2);
INSERT INTO `trainseat` VALUES (48, 1, 1, '04A', 2);
INSERT INTO `trainseat` VALUES (49, 1, 1, '04B', 2);
INSERT INTO `trainseat` VALUES (50, 1, 1, '05A', 2);
INSERT INTO `trainseat` VALUES (51, 1, 1, '05B', 2);
INSERT INTO `trainseat` VALUES (52, 2, 2, '01A', 2);
INSERT INTO `trainseat` VALUES (53, 2, 2, '01B', 2);
INSERT INTO `trainseat` VALUES (54, 2, 2, '02A', 2);
INSERT INTO `trainseat` VALUES (55, 2, 2, '02B', 2);
INSERT INTO `trainseat` VALUES (56, 2, 2, '03A', 2);
INSERT INTO `trainseat` VALUES (57, 2, 2, '03B', 2);
INSERT INTO `trainseat` VALUES (58, 2, 2, '04A', 2);
INSERT INTO `trainseat` VALUES (59, 2, 2, '04B', 2);
INSERT INTO `trainseat` VALUES (60, 2, 2, '05A', 2);
INSERT INTO `trainseat` VALUES (61, 2, 2, '05B', 2);
INSERT INTO `trainseat` VALUES (62, 1, 1, '01A', 3);
INSERT INTO `trainseat` VALUES (63, 1, 1, '01B', 3);
INSERT INTO `trainseat` VALUES (64, 1, 1, '02A', 3);
INSERT INTO `trainseat` VALUES (65, 1, 1, '02B', 3);
INSERT INTO `trainseat` VALUES (66, 1, 1, '03A', 3);
INSERT INTO `trainseat` VALUES (67, 1, 1, '03B', 3);
INSERT INTO `trainseat` VALUES (68, 1, 1, '04A', 3);
INSERT INTO `trainseat` VALUES (69, 1, 1, '04B', 3);
INSERT INTO `trainseat` VALUES (70, 1, 1, '05A', 3);
INSERT INTO `trainseat` VALUES (71, 1, 1, '05B', 3);
INSERT INTO `trainseat` VALUES (72, 2, 2, '01A', 3);
INSERT INTO `trainseat` VALUES (73, 2, 2, '01B', 3);
INSERT INTO `trainseat` VALUES (74, 2, 2, '02A', 3);
INSERT INTO `trainseat` VALUES (75, 2, 2, '02B', 3);
INSERT INTO `trainseat` VALUES (76, 2, 2, '03A', 3);
INSERT INTO `trainseat` VALUES (77, 2, 2, '03B', 3);
INSERT INTO `trainseat` VALUES (78, 2, 2, '04A', 3);
INSERT INTO `trainseat` VALUES (79, 2, 2, '04B', 3);
INSERT INTO `trainseat` VALUES (80, 2, 2, '05A', 3);
INSERT INTO `trainseat` VALUES (81, 2, 2, '05B', 3);
INSERT INTO `trainseat` VALUES (82, 1, 1, '01A', 4);
INSERT INTO `trainseat` VALUES (83, 1, 1, '01B', 4);
INSERT INTO `trainseat` VALUES (84, 1, 1, '02A', 4);
INSERT INTO `trainseat` VALUES (85, 1, 1, '02B', 4);
INSERT INTO `trainseat` VALUES (86, 1, 1, '03A', 4);
INSERT INTO `trainseat` VALUES (87, 1, 1, '03B', 4);
INSERT INTO `trainseat` VALUES (88, 1, 1, '04A', 4);
INSERT INTO `trainseat` VALUES (89, 1, 1, '04B', 4);
INSERT INTO `trainseat` VALUES (90, 1, 1, '05A', 4);
INSERT INTO `trainseat` VALUES (91, 1, 1, '05B', 4);
INSERT INTO `trainseat` VALUES (92, 2, 2, '01A', 4);
INSERT INTO `trainseat` VALUES (93, 2, 2, '01B', 4);
INSERT INTO `trainseat` VALUES (94, 2, 2, '02A', 4);
INSERT INTO `trainseat` VALUES (95, 2, 2, '02B', 4);
INSERT INTO `trainseat` VALUES (96, 2, 2, '03A', 4);
INSERT INTO `trainseat` VALUES (97, 2, 2, '03B', 4);
INSERT INTO `trainseat` VALUES (98, 2, 2, '04A', 4);
INSERT INTO `trainseat` VALUES (99, 2, 2, '04B', 4);
INSERT INTO `trainseat` VALUES (100, 2, 2, '05A', 4);
INSERT INTO `trainseat` VALUES (101, 2, 2, '05B', 4);
INSERT INTO `trainseat` VALUES (102, 1, 1, '01A', 5);
INSERT INTO `trainseat` VALUES (103, 1, 1, '01B', 5);
INSERT INTO `trainseat` VALUES (104, 1, 1, '02A', 5);
INSERT INTO `trainseat` VALUES (105, 1, 1, '02B', 5);
INSERT INTO `trainseat` VALUES (106, 1, 1, '03A', 5);
INSERT INTO `trainseat` VALUES (107, 1, 1, '03B', 5);
INSERT INTO `trainseat` VALUES (108, 1, 1, '04A', 5);
INSERT INTO `trainseat` VALUES (109, 1, 1, '04B', 5);
INSERT INTO `trainseat` VALUES (110, 1, 1, '05A', 5);
INSERT INTO `trainseat` VALUES (111, 1, 1, '05B', 5);
INSERT INTO `trainseat` VALUES (112, 2, 2, '01A', 5);
INSERT INTO `trainseat` VALUES (113, 2, 2, '01B', 5);
INSERT INTO `trainseat` VALUES (114, 2, 2, '02A', 5);
INSERT INTO `trainseat` VALUES (115, 2, 2, '02B', 5);
INSERT INTO `trainseat` VALUES (116, 2, 2, '03A', 5);
INSERT INTO `trainseat` VALUES (117, 2, 2, '03B', 5);
INSERT INTO `trainseat` VALUES (118, 2, 2, '04A', 5);
INSERT INTO `trainseat` VALUES (119, 2, 2, '04B', 5);
INSERT INTO `trainseat` VALUES (120, 2, 2, '05A', 5);
INSERT INTO `trainseat` VALUES (121, 2, 2, '05B', 5);
INSERT INTO `trainseat` VALUES (122, 1, 1, '01A', 6);
INSERT INTO `trainseat` VALUES (123, 1, 1, '01B', 6);
INSERT INTO `trainseat` VALUES (124, 1, 1, '02A', 6);
INSERT INTO `trainseat` VALUES (125, 1, 1, '02B', 6);
INSERT INTO `trainseat` VALUES (126, 1, 1, '03A', 6);
INSERT INTO `trainseat` VALUES (127, 1, 1, '03B', 6);
INSERT INTO `trainseat` VALUES (128, 1, 1, '04A', 6);
INSERT INTO `trainseat` VALUES (129, 1, 1, '04B', 6);
INSERT INTO `trainseat` VALUES (130, 1, 1, '05A', 6);
INSERT INTO `trainseat` VALUES (131, 1, 1, '05B', 6);
INSERT INTO `trainseat` VALUES (132, 2, 2, '01A', 6);
INSERT INTO `trainseat` VALUES (133, 2, 2, '01B', 6);
INSERT INTO `trainseat` VALUES (134, 2, 2, '02A', 6);
INSERT INTO `trainseat` VALUES (135, 2, 2, '02B', 6);
INSERT INTO `trainseat` VALUES (136, 2, 2, '03A', 6);
INSERT INTO `trainseat` VALUES (137, 2, 2, '03B', 6);
INSERT INTO `trainseat` VALUES (138, 2, 2, '04A', 6);
INSERT INTO `trainseat` VALUES (139, 2, 2, '04B', 6);
INSERT INTO `trainseat` VALUES (140, 2, 2, '05A', 6);
INSERT INTO `trainseat` VALUES (141, 2, 2, '05B', 6);
INSERT INTO `trainseat` VALUES (142, 1, 1, '01A', 7);
INSERT INTO `trainseat` VALUES (143, 1, 1, '01B', 7);
INSERT INTO `trainseat` VALUES (144, 1, 1, '02A', 7);
INSERT INTO `trainseat` VALUES (145, 1, 1, '02B', 7);
INSERT INTO `trainseat` VALUES (146, 1, 1, '03A', 7);
INSERT INTO `trainseat` VALUES (147, 1, 1, '03B', 7);
INSERT INTO `trainseat` VALUES (148, 1, 1, '04A', 7);
INSERT INTO `trainseat` VALUES (149, 1, 1, '04B', 7);
INSERT INTO `trainseat` VALUES (150, 1, 1, '05A', 7);
INSERT INTO `trainseat` VALUES (151, 1, 1, '05B', 7);
INSERT INTO `trainseat` VALUES (152, 2, 2, '01A', 7);
INSERT INTO `trainseat` VALUES (153, 2, 2, '01B', 7);
INSERT INTO `trainseat` VALUES (154, 2, 2, '02A', 7);
INSERT INTO `trainseat` VALUES (155, 2, 2, '02B', 7);
INSERT INTO `trainseat` VALUES (156, 2, 2, '03A', 7);
INSERT INTO `trainseat` VALUES (157, 2, 2, '03B', 7);
INSERT INTO `trainseat` VALUES (158, 2, 2, '04A', 7);
INSERT INTO `trainseat` VALUES (159, 2, 2, '04B', 7);
INSERT INTO `trainseat` VALUES (160, 2, 2, '05A', 7);
INSERT INTO `trainseat` VALUES (161, 2, 2, '05B', 7);
INSERT INTO `trainseat` VALUES (162, 1, 1, '01A', 8);
INSERT INTO `trainseat` VALUES (163, 1, 1, '01B', 8);
INSERT INTO `trainseat` VALUES (164, 1, 1, '02A', 8);
INSERT INTO `trainseat` VALUES (165, 1, 1, '02B', 8);
INSERT INTO `trainseat` VALUES (166, 1, 1, '03A', 8);
INSERT INTO `trainseat` VALUES (167, 1, 1, '03B', 8);
INSERT INTO `trainseat` VALUES (168, 1, 1, '04A', 8);
INSERT INTO `trainseat` VALUES (169, 1, 1, '04B', 8);
INSERT INTO `trainseat` VALUES (170, 1, 1, '05A', 8);
INSERT INTO `trainseat` VALUES (171, 1, 1, '05B', 8);
INSERT INTO `trainseat` VALUES (172, 2, 2, '01A', 8);
INSERT INTO `trainseat` VALUES (173, 2, 2, '01B', 8);
INSERT INTO `trainseat` VALUES (174, 2, 2, '02A', 8);
INSERT INTO `trainseat` VALUES (175, 2, 2, '02B', 8);
INSERT INTO `trainseat` VALUES (176, 2, 2, '03A', 8);
INSERT INTO `trainseat` VALUES (177, 2, 2, '03B', 8);
INSERT INTO `trainseat` VALUES (178, 2, 2, '04A', 8);
INSERT INTO `trainseat` VALUES (179, 2, 2, '04B', 8);
INSERT INTO `trainseat` VALUES (180, 2, 2, '05A', 8);
INSERT INTO `trainseat` VALUES (181, 2, 2, '05B', 8);
INSERT INTO `trainseat` VALUES (182, 1, 1, '01A', 9);
INSERT INTO `trainseat` VALUES (183, 1, 1, '01B', 9);
INSERT INTO `trainseat` VALUES (184, 1, 1, '02A', 9);
INSERT INTO `trainseat` VALUES (185, 1, 1, '02B', 9);
INSERT INTO `trainseat` VALUES (186, 1, 1, '03A', 9);
INSERT INTO `trainseat` VALUES (187, 1, 1, '03B', 9);
INSERT INTO `trainseat` VALUES (188, 1, 1, '04A', 9);
INSERT INTO `trainseat` VALUES (189, 1, 1, '04B', 9);
INSERT INTO `trainseat` VALUES (190, 1, 1, '05A', 9);
INSERT INTO `trainseat` VALUES (191, 1, 1, '05B', 9);
INSERT INTO `trainseat` VALUES (192, 2, 2, '01A', 9);
INSERT INTO `trainseat` VALUES (193, 2, 2, '01B', 9);
INSERT INTO `trainseat` VALUES (194, 2, 2, '02A', 9);
INSERT INTO `trainseat` VALUES (195, 2, 2, '02B', 9);
INSERT INTO `trainseat` VALUES (196, 2, 2, '03A', 9);
INSERT INTO `trainseat` VALUES (197, 2, 2, '03B', 9);
INSERT INTO `trainseat` VALUES (198, 2, 2, '04A', 9);
INSERT INTO `trainseat` VALUES (199, 2, 2, '04B', 9);
INSERT INTO `trainseat` VALUES (200, 2, 2, '05A', 9);
INSERT INTO `trainseat` VALUES (201, 2, 2, '05B', 9);
INSERT INTO `trainseat` VALUES (202, 1, 1, '01A', 10);
INSERT INTO `trainseat` VALUES (203, 1, 1, '01B', 10);
INSERT INTO `trainseat` VALUES (204, 1, 1, '02A', 10);
INSERT INTO `trainseat` VALUES (205, 1, 1, '02B', 10);
INSERT INTO `trainseat` VALUES (206, 1, 1, '03A', 10);
INSERT INTO `trainseat` VALUES (207, 1, 1, '03B', 10);
INSERT INTO `trainseat` VALUES (208, 1, 1, '04A', 10);
INSERT INTO `trainseat` VALUES (209, 1, 1, '04B', 10);
INSERT INTO `trainseat` VALUES (210, 1, 1, '05A', 10);
INSERT INTO `trainseat` VALUES (211, 1, 1, '05B', 10);
INSERT INTO `trainseat` VALUES (212, 2, 2, '01A', 10);
INSERT INTO `trainseat` VALUES (213, 2, 2, '01B', 10);
INSERT INTO `trainseat` VALUES (214, 2, 2, '02A', 10);
INSERT INTO `trainseat` VALUES (215, 2, 2, '02B', 10);
INSERT INTO `trainseat` VALUES (216, 2, 2, '03A', 10);
INSERT INTO `trainseat` VALUES (217, 2, 2, '03B', 10);
INSERT INTO `trainseat` VALUES (218, 2, 2, '04A', 10);
INSERT INTO `trainseat` VALUES (219, 2, 2, '04B', 10);
INSERT INTO `trainseat` VALUES (220, 2, 2, '05A', 10);
INSERT INTO `trainseat` VALUES (221, 2, 2, '05B', 10);

-- ----------------------------
-- Table structure for trainstate
-- ----------------------------
DROP TABLE IF EXISTS `trainstate`;
CREATE TABLE `trainstate`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `status` int(2) NULL DEFAULT NULL,
  `train_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `train_id`(`train_id`) USING BTREE,
  CONSTRAINT `trainstate_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trainstate
-- ----------------------------
INSERT INTO `trainstate` VALUES (1, 1, 1);
INSERT INTO `trainstate` VALUES (2, 1, 2);
INSERT INTO `trainstate` VALUES (3, 1, 3);

-- ----------------------------
-- Table structure for trainticket
-- ----------------------------
DROP TABLE IF EXISTS `trainticket`;
CREATE TABLE `trainticket`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `fnum` int(8) NULL DEFAULT NULL,
  `snum` int(8) NULL DEFAULT NULL,
  `ticketdate` date NULL DEFAULT NULL,
  `train_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `train_id`(`train_id`) USING BTREE,
  CONSTRAINT `trainticket_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trainticket
-- ----------------------------
INSERT INTO `trainticket` VALUES (1, 10, 10, '2020-06-12', 1);
INSERT INTO `trainticket` VALUES (2, 10, 10, '2020-06-13', 1);
INSERT INTO `trainticket` VALUES (3, 10, 10, '2020-06-15', 2);
INSERT INTO `trainticket` VALUES (4, 10, 10, '2020-06-15', 3);
INSERT INTO `trainticket` VALUES (5, 10, 10, '2020-06-16', 2);
INSERT INTO `trainticket` VALUES (6, 10, 10, '2020-06-16', 3);
INSERT INTO `trainticket` VALUES (7, 10, 10, '2020-06-23', 2);
INSERT INTO `trainticket` VALUES (8, 10, 10, '2020-06-23', 3);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `realname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int(2) NULL DEFAULT 0,
  `idcard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` int(2) NULL DEFAULT 0,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '匿名用户', '张三', 'e10adc3949ba59abbe56e057f20f883e', 0, '330621195402324252', '17365264524572', 0, NULL);
INSERT INTO `user` VALUES (2, 'test11', '小红', 'e10adc3949ba59abbe56e057f20f883e', 0, '330214568754123589', NULL, 0, NULL);
INSERT INTO `user` VALUES (3, 'test12', '小李', 'e10adc3949ba59abbe56e057f20f883e', 0, '330214568754123589', NULL, 0, NULL);
INSERT INTO `user` VALUES (4, 'test13', '杨戬', 'e10adc3949ba59abbe56e057f20f883e', 0, '330214568754123589', NULL, 0, NULL);
INSERT INTO `user` VALUES (7, 'test1234', '李四', 'e10adc3949ba59abbe56e057f20f883e', 0, '', '', 0, NULL);
INSERT INTO `user` VALUES (8, '12345678', '王五', 'fcea920f7412b5da7be0cf42b8c93759', 0, '', '', 0, NULL);
INSERT INTO `user` VALUES (9, '123', '玉儿', 'e10adc3949ba59abbe56e057f20f883e', 0, '', '', 0, NULL);

-- ----------------------------
-- View structure for orderinfo
-- ----------------------------
DROP VIEW IF EXISTS `orderinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `orderinfo` AS select `o`.`id` AS `id`,`u`.`idcard` AS `idcard`,`u`.`realname` AS `realname`,`o`.`seattype` AS `seattype`,`o`.`status` AS `status`,`o`.`carriage` AS `carriage`,`o`.`seat` AS `seat`,`o`.`traindate` AS `traindate`,`o`.`createtime` AS `createtime`,`t`.`name` AS `trainname`,`o`.`price` AS `price`,`o`.`order_id` AS `order_id`,`tf`.`duration` AS `duration`,`tf`.`startcity` AS `startcity`,`tf`.`starttime` AS `starttime`,`tf`.`endcity` AS `endcity`,`tf`.`endtime` AS `endtime` from (((`orders` `o` join `train` `t`) join `traininfo` `tf`) join `user` `u`) where ((`t`.`id` = `tf`.`train_id`) and (`o`.`user_id` = `u`.`id`) and (`o`.`train_id` = `t`.`id`));

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1100000004, '330214568754123589', '小李', 2, 2, 1, '01A', '2020-06-23', '2020-06-21 17:51:31', 'G102', 25.00, 1, '25分种', '杭州', '15:11:55', '宁波', '15:59:52');
INSERT INTO `user` VALUES (1100000005, '330214568754123589', '杨戬', 1, 2, 1, '01A', '2020-06-23', '2020-06-21 17:53:02', 'G101', 30.00, 1, '2小时25分种', '杭州', '15:35:55', '宁波', '17:59:52');

-- ----------------------------
-- View structure for seatinfo
-- ----------------------------
DROP VIEW IF EXISTS `seatinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `seatinfo` AS select `t`.`id` AS `id`,`t`.`name` AS `name`,`t`.`type` AS `traintype`,`ts`.`carriage` AS `carriage`,`ts`.`type` AS `seattype`,`ts`.`seat` AS `seat`,`os`.`status` AS `status`,`os`.`orderdate` AS `orderdate` from ((`train` `t` join `trainseat` `ts`) join `orderseat` `os`) where ((`t`.`id` = `ts`.`train_id`) and (`os`.`seat_id` = `ts`.`id`));

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01A', 1, '2020-06-03');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01B', 0, '2020-06-24');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02A', 1, '2020-06-24');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02B', 0, '2020-06-24');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01A', 0, '2020-06-24');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01A', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01B', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02A', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02B', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '03A', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '03B', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '04A', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '04B', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '05A', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '05B', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '01A', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '01B', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '02A', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '02B', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '03A', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '03B', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '04A', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '04B', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '05A', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '05B', 0, '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01A', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01B', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02A', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02B', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '03A', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '03B', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '04A', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '04B', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '05A', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '05B', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '01A', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '01B', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '02A', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '02B', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '03A', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '03B', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '04A', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '04B', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '05A', 0, '2020-06-13');
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '05B', 0, '2020-06-13');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01A', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01B', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02A', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02B', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03A', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03B', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04A', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04B', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05A', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05B', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01A', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01B', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02A', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02B', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03A', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03B', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04A', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04B', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05A', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05B', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01A', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 1, '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 1, '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01A', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01B', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02A', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02B', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03A', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03B', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04A', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04B', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05A', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05B', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01A', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01B', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02A', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02B', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03A', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03B', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04A', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04B', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05A', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05B', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01A', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 1, '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 1, '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01A', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01B', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02A', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02B', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03A', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03B', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04A', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04B', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05A', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05B', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01A', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01B', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02A', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02B', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03A', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03B', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04A', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04B', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05A', 1, '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05B', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01A', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 1, '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 1, '2020-06-23');

-- ----------------------------
-- View structure for traininfos
-- ----------------------------
DROP VIEW IF EXISTS `traininfos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `traininfos` AS select `train`.`id` AS `id`,`train`.`name` AS `name`,`train`.`type` AS `type`,`f`.`starttime` AS `starttime`,`f`.`startcity` AS `startcity`,`f`.`endtime` AS `endtime`,`f`.`endcity` AS `endcity`,`f`.`fprice` AS `fprice`,`f`.`sprice` AS `sprice`,`tt`.`fnum` AS `fnum`,`tt`.`snum` AS `snum`,`s`.`status` AS `status`,`f`.`duration` AS `duration`,`tt`.`ticketdate` AS `ticketdate` from (((`train` join `traininfo` `f`) join `trainstate` `s`) join `trainticket` `tt`) where ((`f`.`train_id` = `train`.`id`) and (`s`.`train_id` = `train`.`id`) and (`tt`.`train_id` = `train`.`id`));

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'G100', 0, '14:59:35', '杭州', '15:59:52', '绍兴', 33.00, 19.00, 10, 10, 1, '1小时25分种', '2020-06-12');
INSERT INTO `user` VALUES (1, 'G100', 0, '14:59:35', '杭州', '15:59:52', '绍兴', 33.00, 19.00, 10, 10, 1, '1小时25分种', '2020-06-13');
INSERT INTO `user` VALUES (2, 'G101', 0, '15:35:55', '杭州', '17:59:52', '宁波', 30.00, 15.00, 10, 10, 1, '2小时25分种', '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, '15:35:55', '杭州', '17:59:52', '宁波', 30.00, 15.00, 10, 10, 1, '2小时25分种', '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, '15:35:55', '杭州', '17:59:52', '宁波', 30.00, 15.00, 10, 10, 1, '2小时25分种', '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-06-23');

-- ----------------------------
-- Procedure structure for newticket
-- ----------------------------
DROP PROCEDURE IF EXISTS `newticket`;
delimiter ;;
CREATE PROCEDURE `newticket`(IN trainid INT,
IN orderdate VARCHAR(20))
BEGIN
	DECLARE done BOOLEAN DEFAULT 0;
	DECLARE seatid INT;

	DECLARE queryseat CURSOR
	FOR
	SELECT id FROM trainseat WHERE train_id=trainid;
-- 	当索引到最后
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;  
	open queryseat;
	REPEAT
	FETCH queryseat INTO seatid;
-- 	防止最后一条数据重复
	IF done<>1 THEN
	INSERT INTO orderseat(`status`,orderdate,train_id,seat_id) 
	VALUES(0,orderdate,trainid,seatid);
-- 	结束循环
	END IF;
	 UNTIL done END REPEAT;
	CLOSE queryseat;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for newtrainseat
-- ----------------------------
DROP PROCEDURE IF EXISTS `newtrainseat`;
delimiter ;;
CREATE PROCEDURE `newtrainseat`(IN trainid INT)
BEGIN
	DECLARE done BOOLEAN DEFAULT 0;
	DECLARE carriages INT;
	DECLARE types INT;
	DECLARE seats VARCHAR(10);
	DECLARE queryseat CURSOR
	FOR
	SELECT carriage,type,seat FROM seat;
-- 	当索引到最后
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;  
	open queryseat;
	REPEAT
	FETCH queryseat INTO carriages,types,seats;
	IF done<>1 THEN
		INSERT INTO trainseat(carriage,type,seat,train_id) 
		VALUES(carriages,types,seats,trainid);
	END if;
-- 	结束循环
	 UNTIL done END REPEAT;
	CLOSE queryseat;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ticketprice
-- ----------------------------
DROP PROCEDURE IF EXISTS `ticketprice`;
delimiter ;;
CREATE PROCEDURE `ticketprice`(INOUT price DECIMAL(8,2),
IN weektype BOOLEAN)
  COMMENT 'query price'
BEGIN
	DECLARE discount DOUBLE;
	if weektype THEN
		SELECT Discount
		FROM pricemanage
		WHERE id=1
		INTO discount;
		SELECT price * discount INTO price;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for totalprice
-- ----------------------------
DROP PROCEDURE IF EXISTS `totalprice`;
delimiter ;;
CREATE PROCEDURE `totalprice`(IN traindates DATETIME,
OUT totalprice DECIMAL(8,2))
  COMMENT 'query price'
BEGIN
	SELECT SUM(price) 
	FROM orders 
	WHERE traindates=traindate
	INTO totalprice;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for unorderseat
-- ----------------------------
DROP PROCEDURE IF EXISTS `unorderseat`;
delimiter ;;
CREATE PROCEDURE `unorderseat`(IN seattypes INT,
IN trainname VARCHAR(10),
IN traindate VARCHAR(10))
BEGIN
	DECLARE done BOOLEAN DEFAULT 0;
	DECLARE traincarriage INT;
	DECLARE seats VARCHAR(10);
	DECLARE queryseat CURSOR
	FOR
	SELECT carriage,seat FROM seatinfo 
	WHERE `name`=trainname AND seattype=seattypes
	AND orderdate=traindate AND seatinfo.`status`=0;
-- 	当索引到最后
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;  
	
	open queryseat;
	REPEAT
	FETCH queryseat INTO traincarriage,seats;
	SELECT traincarriage,seats;
-- 	结束循环
	 UNTIL done END REPEAT;
	CLOSE queryseat;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table train
-- ----------------------------
DROP TRIGGER IF EXISTS `newtrainseats`;
delimiter ;;
CREATE TRIGGER `newtrainseats` AFTER INSERT ON `train` FOR EACH ROW BEGIN
	CALL newtrainseat(NEW.id);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table trainticket
-- ----------------------------
DROP TRIGGER IF EXISTS `newtickets`;
delimiter ;;
CREATE TRIGGER `newtickets` AFTER INSERT ON `trainticket` FOR EACH ROW BEGIN
	CALL newticket(NEW.train_id,NEW.ticketdate);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
