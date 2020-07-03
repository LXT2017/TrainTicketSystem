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

 Date: 03/07/2020 15:55:22
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456');

-- ----------------------------
-- Table structure for holiday
-- ----------------------------
DROP TABLE IF EXISTS `holiday`;
CREATE TABLE `holiday`  (
  `vacation` date NOT NULL,
  `status` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`vacation`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of holiday
-- ----------------------------
INSERT INTO `holiday` VALUES ('2020-07-01', 2);
INSERT INTO `holiday` VALUES ('2020-07-07', 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1100000034 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1100000013, 3, 15.00, '2020-06-28', '2020-06-28 15:55:11', 3, 7, 2, 2, '01B', 1);
INSERT INTO `orders` VALUES (1100000014, 3, 30.00, '2020-06-28', '2020-06-28 15:55:17', 4, 7, 1, 1, '01A', 1);
INSERT INTO `orders` VALUES (1100000036, 4, 21.00, '2020-07-07', '2020-07-03 15:26:50', 2, 9, 1, 1, '01B', 1);
INSERT INTO `orders` VALUES (1100000037, 4, 30.00, '2020-07-10', '2020-07-03 15:37:03', 2, 2, 1, 1, '01A', 1);
INSERT INTO `orders` VALUES (1100000038, 5, 38.50, '2020-07-10', '2020-07-03 15:37:56', 4, 2, 1, 1, '01B', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 565 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `orderseat` VALUES (166, 0, '2020-06-26', 3, 62);
INSERT INTO `orderseat` VALUES (167, 0, '2020-06-26', 3, 63);
INSERT INTO `orderseat` VALUES (168, 0, '2020-06-26', 3, 64);
INSERT INTO `orderseat` VALUES (169, 0, '2020-06-26', 3, 65);
INSERT INTO `orderseat` VALUES (170, 0, '2020-06-26', 3, 66);
INSERT INTO `orderseat` VALUES (171, 0, '2020-06-26', 3, 67);
INSERT INTO `orderseat` VALUES (172, 0, '2020-06-26', 3, 68);
INSERT INTO `orderseat` VALUES (173, 0, '2020-06-26', 3, 69);
INSERT INTO `orderseat` VALUES (174, 0, '2020-06-26', 3, 70);
INSERT INTO `orderseat` VALUES (175, 0, '2020-06-26', 3, 71);
INSERT INTO `orderseat` VALUES (176, 0, '2020-06-26', 3, 72);
INSERT INTO `orderseat` VALUES (177, 0, '2020-06-26', 3, 73);
INSERT INTO `orderseat` VALUES (178, 0, '2020-06-26', 3, 74);
INSERT INTO `orderseat` VALUES (179, 0, '2020-06-26', 3, 75);
INSERT INTO `orderseat` VALUES (180, 0, '2020-06-26', 3, 76);
INSERT INTO `orderseat` VALUES (181, 0, '2020-06-26', 3, 77);
INSERT INTO `orderseat` VALUES (182, 0, '2020-06-26', 3, 78);
INSERT INTO `orderseat` VALUES (183, 0, '2020-06-26', 3, 79);
INSERT INTO `orderseat` VALUES (184, 0, '2020-06-26', 3, 80);
INSERT INTO `orderseat` VALUES (185, 0, '2020-06-26', 3, 81);
INSERT INTO `orderseat` VALUES (246, 0, '2020-06-28', 5, 102);
INSERT INTO `orderseat` VALUES (247, 0, '2020-06-28', 5, 103);
INSERT INTO `orderseat` VALUES (248, 0, '2020-06-28', 5, 104);
INSERT INTO `orderseat` VALUES (249, 0, '2020-06-28', 5, 105);
INSERT INTO `orderseat` VALUES (250, 0, '2020-06-28', 5, 106);
INSERT INTO `orderseat` VALUES (251, 0, '2020-06-28', 5, 107);
INSERT INTO `orderseat` VALUES (252, 0, '2020-06-28', 5, 108);
INSERT INTO `orderseat` VALUES (253, 0, '2020-06-28', 5, 109);
INSERT INTO `orderseat` VALUES (254, 0, '2020-06-28', 5, 110);
INSERT INTO `orderseat` VALUES (255, 0, '2020-06-28', 5, 111);
INSERT INTO `orderseat` VALUES (256, 0, '2020-06-28', 5, 112);
INSERT INTO `orderseat` VALUES (257, 0, '2020-06-28', 5, 113);
INSERT INTO `orderseat` VALUES (258, 0, '2020-06-28', 5, 114);
INSERT INTO `orderseat` VALUES (259, 0, '2020-06-28', 5, 115);
INSERT INTO `orderseat` VALUES (260, 0, '2020-06-28', 5, 116);
INSERT INTO `orderseat` VALUES (261, 0, '2020-06-28', 5, 117);
INSERT INTO `orderseat` VALUES (262, 0, '2020-06-28', 5, 118);
INSERT INTO `orderseat` VALUES (263, 0, '2020-06-28', 5, 119);
INSERT INTO `orderseat` VALUES (264, 0, '2020-06-28', 5, 120);
INSERT INTO `orderseat` VALUES (265, 0, '2020-06-28', 5, 121);
INSERT INTO `orderseat` VALUES (266, 0, '2020-06-28', 8, 162);
INSERT INTO `orderseat` VALUES (267, 0, '2020-06-28', 8, 163);
INSERT INTO `orderseat` VALUES (268, 0, '2020-06-28', 8, 164);
INSERT INTO `orderseat` VALUES (269, 0, '2020-06-28', 8, 165);
INSERT INTO `orderseat` VALUES (270, 0, '2020-06-28', 8, 166);
INSERT INTO `orderseat` VALUES (271, 0, '2020-06-28', 8, 167);
INSERT INTO `orderseat` VALUES (272, 0, '2020-06-28', 8, 168);
INSERT INTO `orderseat` VALUES (273, 0, '2020-06-28', 8, 169);
INSERT INTO `orderseat` VALUES (274, 0, '2020-06-28', 8, 170);
INSERT INTO `orderseat` VALUES (275, 0, '2020-06-28', 8, 171);
INSERT INTO `orderseat` VALUES (276, 0, '2020-06-28', 8, 172);
INSERT INTO `orderseat` VALUES (277, 0, '2020-06-28', 8, 173);
INSERT INTO `orderseat` VALUES (278, 0, '2020-06-28', 8, 174);
INSERT INTO `orderseat` VALUES (279, 0, '2020-06-28', 8, 175);
INSERT INTO `orderseat` VALUES (280, 0, '2020-06-28', 8, 176);
INSERT INTO `orderseat` VALUES (281, 0, '2020-06-28', 8, 177);
INSERT INTO `orderseat` VALUES (282, 0, '2020-06-28', 8, 178);
INSERT INTO `orderseat` VALUES (283, 0, '2020-06-28', 8, 179);
INSERT INTO `orderseat` VALUES (284, 0, '2020-06-28', 8, 180);
INSERT INTO `orderseat` VALUES (285, 0, '2020-06-28', 8, 181);
INSERT INTO `orderseat` VALUES (286, 0, '2020-06-28', 9, 182);
INSERT INTO `orderseat` VALUES (287, 0, '2020-06-28', 9, 183);
INSERT INTO `orderseat` VALUES (288, 0, '2020-06-28', 9, 184);
INSERT INTO `orderseat` VALUES (289, 0, '2020-06-28', 9, 185);
INSERT INTO `orderseat` VALUES (290, 0, '2020-06-28', 9, 186);
INSERT INTO `orderseat` VALUES (291, 0, '2020-06-28', 9, 187);
INSERT INTO `orderseat` VALUES (292, 0, '2020-06-28', 9, 188);
INSERT INTO `orderseat` VALUES (293, 0, '2020-06-28', 9, 189);
INSERT INTO `orderseat` VALUES (294, 0, '2020-06-28', 9, 190);
INSERT INTO `orderseat` VALUES (295, 0, '2020-06-28', 9, 191);
INSERT INTO `orderseat` VALUES (296, 0, '2020-06-28', 9, 192);
INSERT INTO `orderseat` VALUES (297, 0, '2020-06-28', 9, 193);
INSERT INTO `orderseat` VALUES (298, 0, '2020-06-28', 9, 194);
INSERT INTO `orderseat` VALUES (299, 0, '2020-06-28', 9, 195);
INSERT INTO `orderseat` VALUES (300, 0, '2020-06-28', 9, 196);
INSERT INTO `orderseat` VALUES (301, 0, '2020-06-28', 9, 197);
INSERT INTO `orderseat` VALUES (302, 0, '2020-06-28', 9, 198);
INSERT INTO `orderseat` VALUES (303, 0, '2020-06-28', 9, 199);
INSERT INTO `orderseat` VALUES (304, 0, '2020-06-28', 9, 200);
INSERT INTO `orderseat` VALUES (305, 0, '2020-06-28', 9, 201);
INSERT INTO `orderseat` VALUES (306, 1, '2020-06-28', 7, 142);
INSERT INTO `orderseat` VALUES (307, 0, '2020-06-28', 7, 143);
INSERT INTO `orderseat` VALUES (308, 0, '2020-06-28', 7, 144);
INSERT INTO `orderseat` VALUES (309, 0, '2020-06-28', 7, 145);
INSERT INTO `orderseat` VALUES (310, 0, '2020-06-28', 7, 146);
INSERT INTO `orderseat` VALUES (311, 0, '2020-06-28', 7, 147);
INSERT INTO `orderseat` VALUES (312, 0, '2020-06-28', 7, 148);
INSERT INTO `orderseat` VALUES (313, 0, '2020-06-28', 7, 149);
INSERT INTO `orderseat` VALUES (314, 0, '2020-06-28', 7, 150);
INSERT INTO `orderseat` VALUES (315, 0, '2020-06-28', 7, 151);
INSERT INTO `orderseat` VALUES (316, 0, '2020-06-28', 7, 152);
INSERT INTO `orderseat` VALUES (317, 1, '2020-06-28', 7, 153);
INSERT INTO `orderseat` VALUES (318, 0, '2020-06-28', 7, 154);
INSERT INTO `orderseat` VALUES (319, 0, '2020-06-28', 7, 155);
INSERT INTO `orderseat` VALUES (320, 0, '2020-06-28', 7, 156);
INSERT INTO `orderseat` VALUES (321, 0, '2020-06-28', 7, 157);
INSERT INTO `orderseat` VALUES (322, 0, '2020-06-28', 7, 158);
INSERT INTO `orderseat` VALUES (323, 0, '2020-06-28', 7, 159);
INSERT INTO `orderseat` VALUES (324, 0, '2020-06-28', 7, 160);
INSERT INTO `orderseat` VALUES (325, 0, '2020-06-28', 7, 161);
INSERT INTO `orderseat` VALUES (366, 0, '2020-07-07', 1, 1);
INSERT INTO `orderseat` VALUES (367, 0, '2020-07-07', 1, 2);
INSERT INTO `orderseat` VALUES (368, 0, '2020-07-07', 1, 3);
INSERT INTO `orderseat` VALUES (369, 0, '2020-07-07', 1, 4);
INSERT INTO `orderseat` VALUES (370, 0, '2020-07-07', 1, 5);
INSERT INTO `orderseat` VALUES (371, 0, '2020-07-07', 1, 6);
INSERT INTO `orderseat` VALUES (372, 0, '2020-07-07', 1, 7);
INSERT INTO `orderseat` VALUES (373, 0, '2020-07-07', 1, 8);
INSERT INTO `orderseat` VALUES (374, 0, '2020-07-07', 1, 9);
INSERT INTO `orderseat` VALUES (375, 0, '2020-07-07', 1, 10);
INSERT INTO `orderseat` VALUES (376, 0, '2020-07-07', 1, 11);
INSERT INTO `orderseat` VALUES (377, 0, '2020-07-07', 1, 12);
INSERT INTO `orderseat` VALUES (378, 0, '2020-07-07', 1, 13);
INSERT INTO `orderseat` VALUES (379, 0, '2020-07-07', 1, 14);
INSERT INTO `orderseat` VALUES (380, 0, '2020-07-07', 1, 15);
INSERT INTO `orderseat` VALUES (381, 0, '2020-07-07', 1, 16);
INSERT INTO `orderseat` VALUES (382, 0, '2020-07-07', 1, 17);
INSERT INTO `orderseat` VALUES (383, 0, '2020-07-07', 1, 18);
INSERT INTO `orderseat` VALUES (384, 0, '2020-07-07', 1, 19);
INSERT INTO `orderseat` VALUES (385, 0, '2020-07-07', 1, 20);
INSERT INTO `orderseat` VALUES (387, 1, '2020-07-07', 2, 43);
INSERT INTO `orderseat` VALUES (388, 1, '2020-07-07', 2, 44);
INSERT INTO `orderseat` VALUES (389, 0, '2020-07-07', 2, 45);
INSERT INTO `orderseat` VALUES (390, 0, '2020-07-07', 2, 46);
INSERT INTO `orderseat` VALUES (391, 0, '2020-07-07', 2, 47);
INSERT INTO `orderseat` VALUES (392, 0, '2020-07-07', 2, 48);
INSERT INTO `orderseat` VALUES (393, 0, '2020-07-07', 2, 49);
INSERT INTO `orderseat` VALUES (394, 0, '2020-07-07', 2, 50);
INSERT INTO `orderseat` VALUES (395, 0, '2020-07-07', 2, 51);
INSERT INTO `orderseat` VALUES (396, 0, '2020-07-07', 2, 52);
INSERT INTO `orderseat` VALUES (397, 0, '2020-07-07', 2, 53);
INSERT INTO `orderseat` VALUES (398, 0, '2020-07-07', 2, 54);
INSERT INTO `orderseat` VALUES (399, 0, '2020-07-07', 2, 55);
INSERT INTO `orderseat` VALUES (400, 0, '2020-07-07', 2, 56);
INSERT INTO `orderseat` VALUES (401, 0, '2020-07-07', 2, 57);
INSERT INTO `orderseat` VALUES (402, 0, '2020-07-07', 2, 58);
INSERT INTO `orderseat` VALUES (403, 0, '2020-07-07', 2, 59);
INSERT INTO `orderseat` VALUES (404, 0, '2020-07-07', 2, 60);
INSERT INTO `orderseat` VALUES (405, 0, '2020-07-07', 2, 61);
INSERT INTO `orderseat` VALUES (406, 1, '2020-07-07', 3, 63);
INSERT INTO `orderseat` VALUES (408, 1, '2020-07-07', 3, 64);
INSERT INTO `orderseat` VALUES (409, 1, '2020-07-07', 3, 65);
INSERT INTO `orderseat` VALUES (410, 1, '2020-07-07', 3, 66);
INSERT INTO `orderseat` VALUES (411, 0, '2020-07-07', 3, 67);
INSERT INTO `orderseat` VALUES (412, 0, '2020-07-07', 3, 68);
INSERT INTO `orderseat` VALUES (413, 0, '2020-07-07', 3, 69);
INSERT INTO `orderseat` VALUES (414, 0, '2020-07-07', 3, 70);
INSERT INTO `orderseat` VALUES (415, 0, '2020-07-07', 3, 71);
INSERT INTO `orderseat` VALUES (416, 0, '2020-07-07', 3, 72);
INSERT INTO `orderseat` VALUES (417, 0, '2020-07-07', 3, 73);
INSERT INTO `orderseat` VALUES (418, 0, '2020-07-07', 3, 74);
INSERT INTO `orderseat` VALUES (419, 0, '2020-07-07', 3, 75);
INSERT INTO `orderseat` VALUES (420, 0, '2020-07-07', 3, 76);
INSERT INTO `orderseat` VALUES (421, 0, '2020-07-07', 3, 77);
INSERT INTO `orderseat` VALUES (422, 0, '2020-07-07', 3, 78);
INSERT INTO `orderseat` VALUES (423, 0, '2020-07-07', 3, 79);
INSERT INTO `orderseat` VALUES (424, 0, '2020-07-07', 3, 80);
INSERT INTO `orderseat` VALUES (425, 0, '2020-07-07', 3, 81);
INSERT INTO `orderseat` VALUES (426, 0, '2020-07-07', 4, 82);
INSERT INTO `orderseat` VALUES (427, 0, '2020-07-07', 4, 83);
INSERT INTO `orderseat` VALUES (428, 0, '2020-07-07', 4, 84);
INSERT INTO `orderseat` VALUES (429, 0, '2020-07-07', 4, 85);
INSERT INTO `orderseat` VALUES (430, 0, '2020-07-07', 4, 86);
INSERT INTO `orderseat` VALUES (431, 0, '2020-07-07', 4, 87);
INSERT INTO `orderseat` VALUES (432, 0, '2020-07-07', 4, 88);
INSERT INTO `orderseat` VALUES (433, 0, '2020-07-07', 4, 89);
INSERT INTO `orderseat` VALUES (434, 0, '2020-07-07', 4, 90);
INSERT INTO `orderseat` VALUES (435, 0, '2020-07-07', 4, 91);
INSERT INTO `orderseat` VALUES (436, 0, '2020-07-07', 4, 92);
INSERT INTO `orderseat` VALUES (437, 0, '2020-07-07', 4, 93);
INSERT INTO `orderseat` VALUES (438, 0, '2020-07-07', 4, 94);
INSERT INTO `orderseat` VALUES (439, 0, '2020-07-07', 4, 95);
INSERT INTO `orderseat` VALUES (440, 0, '2020-07-07', 4, 96);
INSERT INTO `orderseat` VALUES (441, 0, '2020-07-07', 4, 97);
INSERT INTO `orderseat` VALUES (442, 0, '2020-07-07', 4, 98);
INSERT INTO `orderseat` VALUES (443, 0, '2020-07-07', 4, 99);
INSERT INTO `orderseat` VALUES (444, 0, '2020-07-07', 4, 100);
INSERT INTO `orderseat` VALUES (445, 0, '2020-07-07', 4, 101);
INSERT INTO `orderseat` VALUES (446, 0, '2020-07-07', 5, 102);
INSERT INTO `orderseat` VALUES (447, 0, '2020-07-07', 5, 103);
INSERT INTO `orderseat` VALUES (448, 0, '2020-07-07', 5, 104);
INSERT INTO `orderseat` VALUES (449, 0, '2020-07-07', 5, 105);
INSERT INTO `orderseat` VALUES (450, 0, '2020-07-07', 5, 106);
INSERT INTO `orderseat` VALUES (451, 0, '2020-07-07', 5, 107);
INSERT INTO `orderseat` VALUES (452, 0, '2020-07-07', 5, 108);
INSERT INTO `orderseat` VALUES (453, 0, '2020-07-07', 5, 109);
INSERT INTO `orderseat` VALUES (454, 0, '2020-07-07', 5, 110);
INSERT INTO `orderseat` VALUES (455, 0, '2020-07-07', 5, 111);
INSERT INTO `orderseat` VALUES (456, 0, '2020-07-07', 5, 112);
INSERT INTO `orderseat` VALUES (457, 0, '2020-07-07', 5, 113);
INSERT INTO `orderseat` VALUES (458, 0, '2020-07-07', 5, 114);
INSERT INTO `orderseat` VALUES (459, 0, '2020-07-07', 5, 115);
INSERT INTO `orderseat` VALUES (460, 0, '2020-07-07', 5, 116);
INSERT INTO `orderseat` VALUES (461, 0, '2020-07-07', 5, 117);
INSERT INTO `orderseat` VALUES (462, 0, '2020-07-07', 5, 118);
INSERT INTO `orderseat` VALUES (463, 0, '2020-07-07', 5, 119);
INSERT INTO `orderseat` VALUES (464, 0, '2020-07-07', 5, 120);
INSERT INTO `orderseat` VALUES (465, 0, '2020-07-07', 5, 121);
INSERT INTO `orderseat` VALUES (466, 0, '2020-07-07', 6, 122);
INSERT INTO `orderseat` VALUES (467, 0, '2020-07-07', 6, 123);
INSERT INTO `orderseat` VALUES (468, 0, '2020-07-07', 6, 124);
INSERT INTO `orderseat` VALUES (469, 0, '2020-07-07', 6, 125);
INSERT INTO `orderseat` VALUES (470, 0, '2020-07-07', 6, 126);
INSERT INTO `orderseat` VALUES (471, 0, '2020-07-07', 6, 127);
INSERT INTO `orderseat` VALUES (472, 0, '2020-07-07', 6, 128);
INSERT INTO `orderseat` VALUES (473, 0, '2020-07-07', 6, 129);
INSERT INTO `orderseat` VALUES (474, 0, '2020-07-07', 6, 130);
INSERT INTO `orderseat` VALUES (475, 0, '2020-07-07', 6, 131);
INSERT INTO `orderseat` VALUES (476, 0, '2020-07-07', 6, 132);
INSERT INTO `orderseat` VALUES (477, 0, '2020-07-07', 6, 133);
INSERT INTO `orderseat` VALUES (478, 0, '2020-07-07', 6, 134);
INSERT INTO `orderseat` VALUES (479, 0, '2020-07-07', 6, 135);
INSERT INTO `orderseat` VALUES (480, 0, '2020-07-07', 6, 136);
INSERT INTO `orderseat` VALUES (481, 0, '2020-07-07', 6, 137);
INSERT INTO `orderseat` VALUES (482, 0, '2020-07-07', 6, 138);
INSERT INTO `orderseat` VALUES (483, 0, '2020-07-07', 6, 139);
INSERT INTO `orderseat` VALUES (484, 0, '2020-07-07', 6, 140);
INSERT INTO `orderseat` VALUES (485, 0, '2020-07-07', 6, 141);
INSERT INTO `orderseat` VALUES (488, 1, '2020-07-07', 7, 144);
INSERT INTO `orderseat` VALUES (489, 0, '2020-07-07', 7, 145);
INSERT INTO `orderseat` VALUES (490, 0, '2020-07-07', 7, 146);
INSERT INTO `orderseat` VALUES (491, 0, '2020-07-07', 7, 147);
INSERT INTO `orderseat` VALUES (492, 0, '2020-07-07', 7, 148);
INSERT INTO `orderseat` VALUES (493, 0, '2020-07-07', 7, 149);
INSERT INTO `orderseat` VALUES (494, 0, '2020-07-07', 7, 150);
INSERT INTO `orderseat` VALUES (495, 0, '2020-07-07', 7, 151);
INSERT INTO `orderseat` VALUES (496, 0, '2020-07-07', 7, 152);
INSERT INTO `orderseat` VALUES (497, 0, '2020-07-07', 7, 153);
INSERT INTO `orderseat` VALUES (498, 0, '2020-07-07', 7, 154);
INSERT INTO `orderseat` VALUES (499, 0, '2020-07-07', 7, 155);
INSERT INTO `orderseat` VALUES (500, 0, '2020-07-07', 7, 156);
INSERT INTO `orderseat` VALUES (501, 0, '2020-07-07', 7, 157);
INSERT INTO `orderseat` VALUES (502, 0, '2020-07-07', 7, 158);
INSERT INTO `orderseat` VALUES (503, 0, '2020-07-07', 7, 159);
INSERT INTO `orderseat` VALUES (504, 0, '2020-07-07', 7, 160);
INSERT INTO `orderseat` VALUES (505, 0, '2020-07-07', 7, 161);
INSERT INTO `orderseat` VALUES (506, 0, '2020-07-07', 8, 162);
INSERT INTO `orderseat` VALUES (507, 0, '2020-07-07', 8, 163);
INSERT INTO `orderseat` VALUES (508, 0, '2020-07-07', 8, 164);
INSERT INTO `orderseat` VALUES (509, 0, '2020-07-07', 8, 165);
INSERT INTO `orderseat` VALUES (510, 0, '2020-07-07', 8, 166);
INSERT INTO `orderseat` VALUES (511, 0, '2020-07-07', 8, 167);
INSERT INTO `orderseat` VALUES (512, 0, '2020-07-07', 8, 168);
INSERT INTO `orderseat` VALUES (513, 0, '2020-07-07', 8, 169);
INSERT INTO `orderseat` VALUES (514, 0, '2020-07-07', 8, 170);
INSERT INTO `orderseat` VALUES (515, 0, '2020-07-07', 8, 171);
INSERT INTO `orderseat` VALUES (516, 0, '2020-07-07', 8, 172);
INSERT INTO `orderseat` VALUES (517, 0, '2020-07-07', 8, 173);
INSERT INTO `orderseat` VALUES (518, 0, '2020-07-07', 8, 174);
INSERT INTO `orderseat` VALUES (519, 0, '2020-07-07', 8, 175);
INSERT INTO `orderseat` VALUES (520, 0, '2020-07-07', 8, 176);
INSERT INTO `orderseat` VALUES (521, 0, '2020-07-07', 8, 177);
INSERT INTO `orderseat` VALUES (522, 0, '2020-07-07', 8, 178);
INSERT INTO `orderseat` VALUES (523, 0, '2020-07-07', 8, 179);
INSERT INTO `orderseat` VALUES (524, 0, '2020-07-07', 8, 180);
INSERT INTO `orderseat` VALUES (525, 0, '2020-07-07', 8, 181);
INSERT INTO `orderseat` VALUES (526, 0, '2020-07-07', 9, 182);
INSERT INTO `orderseat` VALUES (527, 0, '2020-07-07', 9, 183);
INSERT INTO `orderseat` VALUES (528, 0, '2020-07-07', 9, 184);
INSERT INTO `orderseat` VALUES (529, 0, '2020-07-07', 9, 185);
INSERT INTO `orderseat` VALUES (530, 0, '2020-07-07', 9, 186);
INSERT INTO `orderseat` VALUES (531, 0, '2020-07-07', 9, 187);
INSERT INTO `orderseat` VALUES (532, 0, '2020-07-07', 9, 188);
INSERT INTO `orderseat` VALUES (533, 0, '2020-07-07', 9, 189);
INSERT INTO `orderseat` VALUES (534, 0, '2020-07-07', 9, 190);
INSERT INTO `orderseat` VALUES (535, 0, '2020-07-07', 9, 191);
INSERT INTO `orderseat` VALUES (536, 0, '2020-07-07', 9, 192);
INSERT INTO `orderseat` VALUES (537, 0, '2020-07-07', 9, 193);
INSERT INTO `orderseat` VALUES (538, 0, '2020-07-07', 9, 194);
INSERT INTO `orderseat` VALUES (539, 0, '2020-07-07', 9, 195);
INSERT INTO `orderseat` VALUES (540, 0, '2020-07-07', 9, 196);
INSERT INTO `orderseat` VALUES (541, 0, '2020-07-07', 9, 197);
INSERT INTO `orderseat` VALUES (542, 0, '2020-07-07', 9, 198);
INSERT INTO `orderseat` VALUES (543, 0, '2020-07-07', 9, 199);
INSERT INTO `orderseat` VALUES (544, 0, '2020-07-07', 9, 200);
INSERT INTO `orderseat` VALUES (545, 0, '2020-07-07', 9, 201);
INSERT INTO `orderseat` VALUES (546, 0, '2020-07-07', 10, 202);
INSERT INTO `orderseat` VALUES (547, 0, '2020-07-07', 10, 203);
INSERT INTO `orderseat` VALUES (548, 0, '2020-07-07', 10, 204);
INSERT INTO `orderseat` VALUES (549, 0, '2020-07-07', 10, 205);
INSERT INTO `orderseat` VALUES (550, 0, '2020-07-07', 10, 206);
INSERT INTO `orderseat` VALUES (551, 0, '2020-07-07', 10, 207);
INSERT INTO `orderseat` VALUES (552, 0, '2020-07-07', 10, 208);
INSERT INTO `orderseat` VALUES (553, 0, '2020-07-07', 10, 209);
INSERT INTO `orderseat` VALUES (554, 0, '2020-07-07', 10, 210);
INSERT INTO `orderseat` VALUES (555, 0, '2020-07-07', 10, 211);
INSERT INTO `orderseat` VALUES (556, 0, '2020-07-07', 10, 212);
INSERT INTO `orderseat` VALUES (557, 0, '2020-07-07', 10, 213);
INSERT INTO `orderseat` VALUES (558, 0, '2020-07-07', 10, 214);
INSERT INTO `orderseat` VALUES (559, 0, '2020-07-07', 10, 215);
INSERT INTO `orderseat` VALUES (560, 0, '2020-07-07', 10, 216);
INSERT INTO `orderseat` VALUES (561, 0, '2020-07-07', 10, 217);
INSERT INTO `orderseat` VALUES (562, 0, '2020-07-07', 10, 218);
INSERT INTO `orderseat` VALUES (563, 0, '2020-07-07', 10, 219);
INSERT INTO `orderseat` VALUES (564, 0, '2020-07-07', 10, 220);
INSERT INTO `orderseat` VALUES (565, 0, '2020-07-07', 10, 221);
INSERT INTO `orderseat` VALUES (566, 0, '2020-07-08', 2, 42);
INSERT INTO `orderseat` VALUES (567, 0, '2020-07-08', 2, 43);
INSERT INTO `orderseat` VALUES (568, 0, '2020-07-08', 2, 44);
INSERT INTO `orderseat` VALUES (569, 0, '2020-07-08', 2, 45);
INSERT INTO `orderseat` VALUES (570, 0, '2020-07-08', 2, 46);
INSERT INTO `orderseat` VALUES (571, 0, '2020-07-08', 2, 47);
INSERT INTO `orderseat` VALUES (572, 0, '2020-07-08', 2, 48);
INSERT INTO `orderseat` VALUES (573, 0, '2020-07-08', 2, 49);
INSERT INTO `orderseat` VALUES (574, 0, '2020-07-08', 2, 50);
INSERT INTO `orderseat` VALUES (575, 0, '2020-07-08', 2, 51);
INSERT INTO `orderseat` VALUES (576, 0, '2020-07-08', 2, 52);
INSERT INTO `orderseat` VALUES (577, 0, '2020-07-08', 2, 53);
INSERT INTO `orderseat` VALUES (578, 0, '2020-07-08', 2, 54);
INSERT INTO `orderseat` VALUES (579, 0, '2020-07-08', 2, 55);
INSERT INTO `orderseat` VALUES (580, 0, '2020-07-08', 2, 56);
INSERT INTO `orderseat` VALUES (581, 0, '2020-07-08', 2, 57);
INSERT INTO `orderseat` VALUES (582, 0, '2020-07-08', 2, 58);
INSERT INTO `orderseat` VALUES (583, 0, '2020-07-08', 2, 59);
INSERT INTO `orderseat` VALUES (584, 0, '2020-07-08', 2, 60);
INSERT INTO `orderseat` VALUES (585, 0, '2020-07-08', 2, 61);
INSERT INTO `orderseat` VALUES (586, 0, '2020-07-08', 3, 62);
INSERT INTO `orderseat` VALUES (587, 0, '2020-07-08', 3, 63);
INSERT INTO `orderseat` VALUES (588, 0, '2020-07-08', 3, 64);
INSERT INTO `orderseat` VALUES (589, 0, '2020-07-08', 3, 65);
INSERT INTO `orderseat` VALUES (590, 0, '2020-07-08', 3, 66);
INSERT INTO `orderseat` VALUES (591, 0, '2020-07-08', 3, 67);
INSERT INTO `orderseat` VALUES (592, 0, '2020-07-08', 3, 68);
INSERT INTO `orderseat` VALUES (593, 0, '2020-07-08', 3, 69);
INSERT INTO `orderseat` VALUES (594, 0, '2020-07-08', 3, 70);
INSERT INTO `orderseat` VALUES (595, 0, '2020-07-08', 3, 71);
INSERT INTO `orderseat` VALUES (596, 0, '2020-07-08', 3, 72);
INSERT INTO `orderseat` VALUES (597, 0, '2020-07-08', 3, 73);
INSERT INTO `orderseat` VALUES (598, 0, '2020-07-08', 3, 74);
INSERT INTO `orderseat` VALUES (599, 0, '2020-07-08', 3, 75);
INSERT INTO `orderseat` VALUES (600, 0, '2020-07-08', 3, 76);
INSERT INTO `orderseat` VALUES (601, 0, '2020-07-08', 3, 77);
INSERT INTO `orderseat` VALUES (602, 0, '2020-07-08', 3, 78);
INSERT INTO `orderseat` VALUES (603, 0, '2020-07-08', 3, 79);
INSERT INTO `orderseat` VALUES (604, 0, '2020-07-08', 3, 80);
INSERT INTO `orderseat` VALUES (605, 0, '2020-07-08', 3, 81);
INSERT INTO `orderseat` VALUES (606, 0, '2020-07-09', 2, 42);
INSERT INTO `orderseat` VALUES (607, 0, '2020-07-09', 2, 43);
INSERT INTO `orderseat` VALUES (608, 0, '2020-07-09', 2, 44);
INSERT INTO `orderseat` VALUES (609, 0, '2020-07-09', 2, 45);
INSERT INTO `orderseat` VALUES (610, 0, '2020-07-09', 2, 46);
INSERT INTO `orderseat` VALUES (611, 0, '2020-07-09', 2, 47);
INSERT INTO `orderseat` VALUES (612, 0, '2020-07-09', 2, 48);
INSERT INTO `orderseat` VALUES (613, 0, '2020-07-09', 2, 49);
INSERT INTO `orderseat` VALUES (614, 0, '2020-07-09', 2, 50);
INSERT INTO `orderseat` VALUES (615, 0, '2020-07-09', 2, 51);
INSERT INTO `orderseat` VALUES (616, 0, '2020-07-09', 2, 52);
INSERT INTO `orderseat` VALUES (617, 0, '2020-07-09', 2, 53);
INSERT INTO `orderseat` VALUES (618, 0, '2020-07-09', 2, 54);
INSERT INTO `orderseat` VALUES (619, 0, '2020-07-09', 2, 55);
INSERT INTO `orderseat` VALUES (620, 0, '2020-07-09', 2, 56);
INSERT INTO `orderseat` VALUES (621, 0, '2020-07-09', 2, 57);
INSERT INTO `orderseat` VALUES (622, 0, '2020-07-09', 2, 58);
INSERT INTO `orderseat` VALUES (623, 0, '2020-07-09', 2, 59);
INSERT INTO `orderseat` VALUES (624, 0, '2020-07-09', 2, 60);
INSERT INTO `orderseat` VALUES (625, 0, '2020-07-09', 2, 61);
INSERT INTO `orderseat` VALUES (626, 0, '2020-07-09', 3, 62);
INSERT INTO `orderseat` VALUES (627, 0, '2020-07-09', 3, 63);
INSERT INTO `orderseat` VALUES (628, 0, '2020-07-09', 3, 64);
INSERT INTO `orderseat` VALUES (629, 0, '2020-07-09', 3, 65);
INSERT INTO `orderseat` VALUES (630, 0, '2020-07-09', 3, 66);
INSERT INTO `orderseat` VALUES (631, 0, '2020-07-09', 3, 67);
INSERT INTO `orderseat` VALUES (632, 0, '2020-07-09', 3, 68);
INSERT INTO `orderseat` VALUES (633, 0, '2020-07-09', 3, 69);
INSERT INTO `orderseat` VALUES (634, 0, '2020-07-09', 3, 70);
INSERT INTO `orderseat` VALUES (635, 0, '2020-07-09', 3, 71);
INSERT INTO `orderseat` VALUES (636, 0, '2020-07-09', 3, 72);
INSERT INTO `orderseat` VALUES (637, 0, '2020-07-09', 3, 73);
INSERT INTO `orderseat` VALUES (638, 0, '2020-07-09', 3, 74);
INSERT INTO `orderseat` VALUES (639, 0, '2020-07-09', 3, 75);
INSERT INTO `orderseat` VALUES (640, 0, '2020-07-09', 3, 76);
INSERT INTO `orderseat` VALUES (641, 0, '2020-07-09', 3, 77);
INSERT INTO `orderseat` VALUES (642, 0, '2020-07-09', 3, 78);
INSERT INTO `orderseat` VALUES (643, 0, '2020-07-09', 3, 79);
INSERT INTO `orderseat` VALUES (644, 0, '2020-07-09', 3, 80);
INSERT INTO `orderseat` VALUES (645, 0, '2020-07-09', 3, 81);
INSERT INTO `orderseat` VALUES (646, 0, '2020-07-10', 2, 42);
INSERT INTO `orderseat` VALUES (647, 1, '2020-07-10', 2, 43);
INSERT INTO `orderseat` VALUES (648, 0, '2020-07-10', 2, 44);
INSERT INTO `orderseat` VALUES (649, 0, '2020-07-10', 2, 45);
INSERT INTO `orderseat` VALUES (650, 0, '2020-07-10', 2, 46);
INSERT INTO `orderseat` VALUES (651, 0, '2020-07-10', 2, 47);
INSERT INTO `orderseat` VALUES (652, 0, '2020-07-10', 2, 48);
INSERT INTO `orderseat` VALUES (653, 0, '2020-07-10', 2, 49);
INSERT INTO `orderseat` VALUES (654, 0, '2020-07-10', 2, 50);
INSERT INTO `orderseat` VALUES (655, 0, '2020-07-10', 2, 51);
INSERT INTO `orderseat` VALUES (656, 0, '2020-07-10', 2, 52);
INSERT INTO `orderseat` VALUES (657, 0, '2020-07-10', 2, 53);
INSERT INTO `orderseat` VALUES (658, 0, '2020-07-10', 2, 54);
INSERT INTO `orderseat` VALUES (659, 0, '2020-07-10', 2, 55);
INSERT INTO `orderseat` VALUES (660, 0, '2020-07-10', 2, 56);
INSERT INTO `orderseat` VALUES (661, 0, '2020-07-10', 2, 57);
INSERT INTO `orderseat` VALUES (662, 0, '2020-07-10', 2, 58);
INSERT INTO `orderseat` VALUES (663, 0, '2020-07-10', 2, 59);
INSERT INTO `orderseat` VALUES (664, 0, '2020-07-10', 2, 60);
INSERT INTO `orderseat` VALUES (665, 0, '2020-07-10', 2, 61);
INSERT INTO `orderseat` VALUES (666, 0, '2020-07-10', 3, 62);
INSERT INTO `orderseat` VALUES (667, 0, '2020-07-10', 3, 63);
INSERT INTO `orderseat` VALUES (668, 0, '2020-07-10', 3, 64);
INSERT INTO `orderseat` VALUES (669, 0, '2020-07-10', 3, 65);
INSERT INTO `orderseat` VALUES (670, 0, '2020-07-10', 3, 66);
INSERT INTO `orderseat` VALUES (671, 0, '2020-07-10', 3, 67);
INSERT INTO `orderseat` VALUES (672, 0, '2020-07-10', 3, 68);
INSERT INTO `orderseat` VALUES (673, 0, '2020-07-10', 3, 69);
INSERT INTO `orderseat` VALUES (674, 0, '2020-07-10', 3, 70);
INSERT INTO `orderseat` VALUES (675, 0, '2020-07-10', 3, 71);
INSERT INTO `orderseat` VALUES (676, 0, '2020-07-10', 3, 72);
INSERT INTO `orderseat` VALUES (677, 0, '2020-07-10', 3, 73);
INSERT INTO `orderseat` VALUES (678, 0, '2020-07-10', 3, 74);
INSERT INTO `orderseat` VALUES (679, 0, '2020-07-10', 3, 75);
INSERT INTO `orderseat` VALUES (680, 0, '2020-07-10', 3, 76);
INSERT INTO `orderseat` VALUES (681, 0, '2020-07-10', 3, 77);
INSERT INTO `orderseat` VALUES (682, 0, '2020-07-10', 3, 78);
INSERT INTO `orderseat` VALUES (683, 0, '2020-07-10', 3, 79);
INSERT INTO `orderseat` VALUES (684, 0, '2020-07-10', 3, 80);
INSERT INTO `orderseat` VALUES (685, 0, '2020-07-10', 3, 81);

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
  `discount1` double NULL DEFAULT NULL,
  `discount2` double NULL DEFAULT NULL,
  `discount3` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pricemanage
-- ----------------------------
INSERT INTO `pricemanage` VALUES (1, 0.95, 0.9, 0.7, 0.55);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `traininfo` VALUES (11, '杭州', '18:29:20', '宁波', '23:29:30', 45.00, 32.00, 10, 10, 10, '2小时3分钟');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trainstate
-- ----------------------------
INSERT INTO `trainstate` VALUES (1, 1, 1);
INSERT INTO `trainstate` VALUES (2, 1, 2);
INSERT INTO `trainstate` VALUES (3, 1, 3);
INSERT INTO `trainstate` VALUES (4, 1, 4);
INSERT INTO `trainstate` VALUES (5, 1, 5);
INSERT INTO `trainstate` VALUES (6, 1, 6);
INSERT INTO `trainstate` VALUES (7, 1, 7);
INSERT INTO `trainstate` VALUES (8, 1, 8);
INSERT INTO `trainstate` VALUES (9, 1, 9);
INSERT INTO `trainstate` VALUES (10, 1, 10);

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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `trainticket` VALUES (9, 10, 10, '2020-06-26', 3);
INSERT INTO `trainticket` VALUES (13, 10, 10, '2020-06-28', 5);
INSERT INTO `trainticket` VALUES (16, 0, 10, '2020-06-28', 8);
INSERT INTO `trainticket` VALUES (17, 10, 10, '2020-06-28', 9);
INSERT INTO `trainticket` VALUES (18, 9, 9, '2020-06-28', 7);
INSERT INTO `trainticket` VALUES (21, 10, 10, '2020-07-07', 1);
INSERT INTO `trainticket` VALUES (22, 10, 10, '2020-07-07', 2);
INSERT INTO `trainticket` VALUES (23, 10, 10, '2020-07-07', 3);
INSERT INTO `trainticket` VALUES (24, 10, 10, '2020-07-07', 4);
INSERT INTO `trainticket` VALUES (25, 10, 10, '2020-07-07', 5);
INSERT INTO `trainticket` VALUES (26, 10, 10, '2020-07-07', 6);
INSERT INTO `trainticket` VALUES (27, 10, 10, '2020-07-07', 7);
INSERT INTO `trainticket` VALUES (28, 10, 10, '2020-07-07', 8);
INSERT INTO `trainticket` VALUES (29, 10, 10, '2020-07-07', 9);
INSERT INTO `trainticket` VALUES (30, 10, 10, '2020-07-07', 10);
INSERT INTO `trainticket` VALUES (31, 10, 10, '2020-07-08', 2);
INSERT INTO `trainticket` VALUES (32, 10, 10, '2020-07-08', 3);
INSERT INTO `trainticket` VALUES (33, 10, 10, '2020-07-09', 2);
INSERT INTO `trainticket` VALUES (34, 10, 10, '2020-07-09', 3);
INSERT INTO `trainticket` VALUES (35, 9, 10, '2020-07-10', 2);
INSERT INTO `trainticket` VALUES (36, 10, 10, '2020-07-10', 3);

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
  `createdate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '匿名用户', '张三', 'e10adc3949ba59abbe56e057f20f883e', 1, '330621195402324252', '17326262154', 0, NULL, '2020-06-17 00:00:00');
INSERT INTO `user` VALUES (2, 'test11', '小红', 'e10adc3949ba59abbe56e057f20f883e', 1, '330214568754134582', NULL, 0, NULL, '2020-06-17 00:00:00');
INSERT INTO `user` VALUES (3, 'test12', '小李', 'e10adc3949ba59abbe56e057f20f883e', 0, '330214568754122483', NULL, 0, NULL, '2020-06-02 18:43:01');
INSERT INTO `user` VALUES (4, 'test13', '杨戬', 'e10adc3949ba59abbe56e057f20f883e', 1, '330214568754123582', NULL, 0, NULL, '2020-06-16 00:00:00');
INSERT INTO `user` VALUES (7, 'test1234', '李四', 'e10adc3949ba59abbe56e057f20f883e', 1, '', '3242432', 0, NULL, '2020-06-04 00:00:00');
INSERT INTO `user` VALUES (8, '12345678', '王五', 'fcea920f7412b5da7be0cf42b8c93759', 0, '', '', 0, NULL, '2020-06-01 18:43:13');
INSERT INTO `user` VALUES (9, '123', '玉儿', 'e10adc3949ba59abbe56e057f20f883e', 1, '', '', 0, NULL, '2020-06-03 00:00:00');
INSERT INTO `user` VALUES (10, '2423', '34', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- View structure for orderinfo
-- ----------------------------
DROP VIEW IF EXISTS `orderinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `orderinfo` AS select `o`.`id` AS `id`,`u`.`idcard` AS `idcard`,`u`.`realname` AS `realname`,`o`.`seattype` AS `seattype`,`o`.`status` AS `status`,`o`.`carriage` AS `carriage`,`o`.`seat` AS `seat`,`o`.`traindate` AS `traindate`,`o`.`createtime` AS `createtime`,`t`.`name` AS `trainname`,`t`.`id` AS `trainid`,`o`.`price` AS `price`,`o`.`order_id` AS `order_id`,`tf`.`duration` AS `duration`,`tf`.`startcity` AS `startcity`,`tf`.`starttime` AS `starttime`,`tf`.`endcity` AS `endcity`,`tf`.`endtime` AS `endtime` from (((`orders` `o` join `train` `t`) join `traininfo` `tf`) join `user` `u`) where ((`t`.`id` = `tf`.`train_id`) and (`o`.`user_id` = `u`.`id`) and (`o`.`train_id` = `t`.`id`));

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1100000013, '330214568754122483', '小李', 2, 3, 2, '01B', '2020-06-28', '2020-06-28 15:55:11', 'G107', 7, 15.00, 1, '35分钟', '杭州', '08:11:55', '宁波', '08:59:52');
INSERT INTO `user` VALUES (1100000014, '330214568754123582', '杨戬', 1, 3, 1, '01A', '2020-06-28', '2020-06-28 15:55:17', 'G107', 7, 30.00, 1, '35分钟', '杭州', '08:11:55', '宁波', '08:59:52');
INSERT INTO `user` VALUES (1100000036, '330214568754134582', '小红', 1, 4, 1, '01B', '2020-07-07', '2020-07-03 15:26:50', 'G109', 9, 21.00, 1, '45分种', '杭州', '12:11:55', '宁波', '12:59:52');
INSERT INTO `user` VALUES (1100000037, '330214568754134582', '小红', 1, 4, 1, '01A', '2020-07-10', '2020-07-03 15:37:03', 'G101', 2, 30.00, 1, '2小时25分种', '杭州', '15:35:55', '宁波', '17:59:52');
INSERT INTO `user` VALUES (1100000038, '330214568754123582', '杨戬', 1, 5, 1, '01B', '2020-07-10', '2020-07-03 15:37:56', 'G101', 2, 38.50, 1, '2小时25分种', '杭州', '15:35:55', '宁波', '17:59:52');

-- ----------------------------
-- View structure for seatinfo
-- ----------------------------
DROP VIEW IF EXISTS `seatinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `seatinfo` AS select `t`.`id` AS `id`,`t`.`name` AS `name`,`t`.`type` AS `traintype`,`ts`.`carriage` AS `carriage`,`ts`.`type` AS `seattype`,`ts`.`seat` AS `seat`,`os`.`status` AS `status`,`os`.`orderdate` AS `orderdate`,`os`.`id` AS `orderseatid` from ((`train` `t` join `trainseat` `ts`) join `orderseat` `os`) where ((`t`.`id` = `ts`.`train_id`) and (`os`.`seat_id` = `ts`.`id`));

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01A', 1, '2020-06-03', 1);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01A', 0, '2020-06-24', 5);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01A', 0, '2020-06-12', 6);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01A', 0, '2020-06-13', 26);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01A', 0, '2020-07-07', 366);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01B', 0, '2020-06-24', 2);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01B', 0, '2020-06-12', 7);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01B', 0, '2020-06-13', 27);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '01B', 0, '2020-07-07', 367);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02A', 1, '2020-06-24', 3);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02A', 0, '2020-06-12', 8);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02A', 0, '2020-06-13', 28);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02A', 0, '2020-07-07', 368);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02B', 0, '2020-06-24', 4);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02B', 0, '2020-06-12', 9);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02B', 0, '2020-06-13', 29);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '02B', 0, '2020-07-07', 369);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '03A', 0, '2020-06-12', 10);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '03A', 0, '2020-06-13', 30);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '03A', 0, '2020-07-07', 370);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '03B', 0, '2020-06-12', 11);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '03B', 0, '2020-06-13', 31);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '03B', 0, '2020-07-07', 371);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '04A', 0, '2020-06-12', 12);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '04A', 0, '2020-06-13', 32);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '04A', 0, '2020-07-07', 372);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '04B', 0, '2020-06-12', 13);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '04B', 0, '2020-06-13', 33);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '04B', 0, '2020-07-07', 373);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '05A', 0, '2020-06-12', 14);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '05A', 0, '2020-06-13', 34);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '05A', 0, '2020-07-07', 374);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '05B', 0, '2020-06-12', 15);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '05B', 0, '2020-06-13', 35);
INSERT INTO `user` VALUES (1, 'G100', 0, 1, 1, '05B', 0, '2020-07-07', 375);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '01A', 0, '2020-06-12', 16);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '01A', 0, '2020-06-13', 36);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '01A', 0, '2020-07-07', 376);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '01B', 0, '2020-06-12', 17);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '01B', 0, '2020-06-13', 37);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '01B', 0, '2020-07-07', 377);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '02A', 0, '2020-06-12', 18);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '02A', 0, '2020-06-13', 38);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '02A', 0, '2020-07-07', 378);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '02B', 0, '2020-06-12', 19);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '02B', 0, '2020-06-13', 39);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '02B', 0, '2020-07-07', 379);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '03A', 0, '2020-06-12', 20);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '03A', 0, '2020-06-13', 40);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '03A', 0, '2020-07-07', 380);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '03B', 0, '2020-06-12', 21);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '03B', 0, '2020-06-13', 41);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '03B', 0, '2020-07-07', 381);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '04A', 0, '2020-06-12', 22);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '04A', 0, '2020-06-13', 42);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '04A', 0, '2020-07-07', 382);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '04B', 0, '2020-06-12', 23);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '04B', 0, '2020-06-13', 43);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '04B', 0, '2020-07-07', 383);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '05A', 0, '2020-06-12', 24);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '05A', 0, '2020-06-13', 44);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '05A', 0, '2020-07-07', 384);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '05B', 0, '2020-06-12', 25);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '05B', 0, '2020-06-13', 45);
INSERT INTO `user` VALUES (1, 'G100', 0, 2, 2, '05B', 0, '2020-07-07', 385);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01A', 1, '2020-06-15', 46);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01A', 1, '2020-06-16', 86);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01A', 1, '2020-06-23', 126);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01A', 0, '2020-07-08', 566);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01A', 0, '2020-07-09', 606);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01A', 0, '2020-07-10', 646);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01B', 1, '2020-06-15', 47);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01B', 1, '2020-06-16', 87);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01B', 1, '2020-06-23', 127);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01B', 1, '2020-07-07', 387);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01B', 0, '2020-07-08', 567);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01B', 0, '2020-07-09', 607);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '01B', 1, '2020-07-10', 647);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02A', 1, '2020-06-15', 48);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02A', 1, '2020-06-16', 88);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02A', 1, '2020-06-23', 128);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02A', 1, '2020-07-07', 388);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02A', 0, '2020-07-08', 568);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02A', 0, '2020-07-09', 608);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02A', 0, '2020-07-10', 648);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02B', 1, '2020-06-15', 49);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02B', 1, '2020-06-16', 89);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02B', 1, '2020-06-23', 129);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02B', 0, '2020-07-07', 389);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02B', 0, '2020-07-08', 569);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02B', 0, '2020-07-09', 609);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '02B', 0, '2020-07-10', 649);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03A', 1, '2020-06-15', 50);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03A', 1, '2020-06-16', 90);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03A', 1, '2020-06-23', 130);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03A', 0, '2020-07-07', 390);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03A', 0, '2020-07-08', 570);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03A', 0, '2020-07-09', 610);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03A', 0, '2020-07-10', 650);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03B', 1, '2020-06-15', 51);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03B', 1, '2020-06-16', 91);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03B', 1, '2020-06-23', 131);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03B', 0, '2020-07-07', 391);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03B', 0, '2020-07-08', 571);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03B', 0, '2020-07-09', 611);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '03B', 0, '2020-07-10', 651);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04A', 1, '2020-06-15', 52);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04A', 1, '2020-06-16', 92);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04A', 1, '2020-06-23', 132);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04A', 0, '2020-07-07', 392);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04A', 0, '2020-07-08', 572);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04A', 0, '2020-07-09', 612);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04A', 0, '2020-07-10', 652);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04B', 1, '2020-06-15', 53);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04B', 1, '2020-06-16', 93);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04B', 1, '2020-06-23', 133);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04B', 0, '2020-07-07', 393);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04B', 0, '2020-07-08', 573);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04B', 0, '2020-07-09', 613);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '04B', 0, '2020-07-10', 653);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05A', 1, '2020-06-15', 54);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05A', 1, '2020-06-16', 94);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05A', 1, '2020-06-23', 134);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05A', 0, '2020-07-07', 394);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05A', 0, '2020-07-08', 574);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05A', 0, '2020-07-09', 614);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05A', 0, '2020-07-10', 654);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05B', 1, '2020-06-15', 55);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05B', 1, '2020-06-16', 95);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05B', 1, '2020-06-23', 135);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05B', 0, '2020-07-07', 395);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05B', 0, '2020-07-08', 575);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05B', 0, '2020-07-09', 615);
INSERT INTO `user` VALUES (2, 'G101', 0, 1, 1, '05B', 0, '2020-07-10', 655);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01A', 1, '2020-06-15', 56);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01A', 1, '2020-06-16', 96);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01A', 1, '2020-06-23', 136);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01A', 0, '2020-07-07', 396);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01A', 0, '2020-07-08', 576);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01A', 0, '2020-07-09', 616);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01A', 0, '2020-07-10', 656);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01B', 1, '2020-06-15', 57);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01B', 1, '2020-06-16', 97);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01B', 1, '2020-06-23', 137);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01B', 0, '2020-07-07', 397);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01B', 0, '2020-07-08', 577);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01B', 0, '2020-07-09', 617);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '01B', 0, '2020-07-10', 657);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02A', 1, '2020-06-15', 58);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02A', 1, '2020-06-16', 98);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02A', 1, '2020-06-23', 138);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02A', 0, '2020-07-07', 398);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02A', 0, '2020-07-08', 578);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02A', 0, '2020-07-09', 618);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02A', 0, '2020-07-10', 658);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02B', 1, '2020-06-15', 59);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02B', 1, '2020-06-16', 99);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02B', 1, '2020-06-23', 139);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02B', 0, '2020-07-07', 399);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02B', 0, '2020-07-08', 579);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02B', 0, '2020-07-09', 619);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '02B', 0, '2020-07-10', 659);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03A', 1, '2020-06-15', 60);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03A', 1, '2020-06-16', 100);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03A', 1, '2020-06-23', 140);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03A', 0, '2020-07-07', 400);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03A', 0, '2020-07-08', 580);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03A', 0, '2020-07-09', 620);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03A', 0, '2020-07-10', 660);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03B', 1, '2020-06-15', 61);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03B', 1, '2020-06-16', 101);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03B', 1, '2020-06-23', 141);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03B', 0, '2020-07-07', 401);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03B', 0, '2020-07-08', 581);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03B', 0, '2020-07-09', 621);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '03B', 0, '2020-07-10', 661);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04A', 1, '2020-06-15', 62);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04A', 1, '2020-06-16', 102);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04A', 1, '2020-06-23', 142);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04A', 0, '2020-07-07', 402);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04A', 0, '2020-07-08', 582);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04A', 0, '2020-07-09', 622);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04A', 0, '2020-07-10', 662);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04B', 1, '2020-06-15', 63);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04B', 1, '2020-06-16', 103);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04B', 1, '2020-06-23', 143);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04B', 0, '2020-07-07', 403);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04B', 0, '2020-07-08', 583);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04B', 0, '2020-07-09', 623);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '04B', 0, '2020-07-10', 663);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05A', 1, '2020-06-15', 64);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05A', 1, '2020-06-16', 104);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05A', 1, '2020-06-23', 144);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05A', 0, '2020-07-07', 404);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05A', 0, '2020-07-08', 584);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05A', 0, '2020-07-09', 624);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05A', 0, '2020-07-10', 664);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05B', 1, '2020-06-15', 65);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05B', 1, '2020-06-16', 105);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05B', 1, '2020-06-23', 145);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05B', 0, '2020-07-07', 405);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05B', 0, '2020-07-08', 585);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05B', 0, '2020-07-09', 625);
INSERT INTO `user` VALUES (2, 'G101', 0, 2, 2, '05B', 0, '2020-07-10', 665);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01A', 1, '2020-06-15', 66);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01A', 1, '2020-06-16', 106);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01A', 1, '2020-06-23', 146);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01A', 0, '2020-06-26', 166);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01A', 0, '2020-07-08', 586);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01A', 0, '2020-07-09', 626);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01A', 0, '2020-07-10', 666);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 1, '2020-06-15', 67);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 1, '2020-06-16', 107);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 1, '2020-06-23', 147);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 0, '2020-06-26', 167);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 1, '2020-07-07', 406);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 0, '2020-07-08', 587);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 0, '2020-07-09', 627);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '01B', 0, '2020-07-10', 667);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 1, '2020-06-15', 68);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 1, '2020-06-16', 108);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 1, '2020-06-23', 148);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 0, '2020-06-26', 168);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 1, '2020-07-07', 408);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 0, '2020-07-08', 588);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 0, '2020-07-09', 628);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02A', 0, '2020-07-10', 668);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 1, '2020-06-15', 69);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 1, '2020-06-16', 109);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 1, '2020-06-23', 149);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 0, '2020-06-26', 169);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 1, '2020-07-07', 409);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 0, '2020-07-08', 589);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 0, '2020-07-09', 629);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '02B', 0, '2020-07-10', 669);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 1, '2020-06-15', 70);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 1, '2020-06-16', 110);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 1, '2020-06-23', 150);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 0, '2020-06-26', 170);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 1, '2020-07-07', 410);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 0, '2020-07-08', 590);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 0, '2020-07-09', 630);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03A', 0, '2020-07-10', 670);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 1, '2020-06-15', 71);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 1, '2020-06-16', 111);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 1, '2020-06-23', 151);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 0, '2020-06-26', 171);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 0, '2020-07-07', 411);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 0, '2020-07-08', 591);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 0, '2020-07-09', 631);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '03B', 0, '2020-07-10', 671);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 1, '2020-06-15', 72);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 1, '2020-06-16', 112);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 1, '2020-06-23', 152);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 0, '2020-06-26', 172);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 0, '2020-07-07', 412);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 0, '2020-07-08', 592);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 0, '2020-07-09', 632);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04A', 0, '2020-07-10', 672);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 1, '2020-06-15', 73);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 1, '2020-06-16', 113);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 1, '2020-06-23', 153);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 0, '2020-06-26', 173);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 0, '2020-07-07', 413);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 0, '2020-07-08', 593);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 0, '2020-07-09', 633);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '04B', 0, '2020-07-10', 673);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 1, '2020-06-15', 74);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 1, '2020-06-16', 114);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 1, '2020-06-23', 154);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 0, '2020-06-26', 174);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 0, '2020-07-07', 414);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 0, '2020-07-08', 594);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 0, '2020-07-09', 634);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05A', 0, '2020-07-10', 674);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 1, '2020-06-15', 75);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 1, '2020-06-16', 115);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 1, '2020-06-23', 155);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 0, '2020-06-26', 175);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 0, '2020-07-07', 415);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 0, '2020-07-08', 595);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 0, '2020-07-09', 635);
INSERT INTO `user` VALUES (3, 'G102', 0, 1, 1, '05B', 0, '2020-07-10', 675);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 1, '2020-06-15', 76);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 1, '2020-06-16', 116);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 1, '2020-06-23', 156);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 0, '2020-06-26', 176);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 0, '2020-07-07', 416);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 0, '2020-07-08', 596);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 0, '2020-07-09', 636);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01A', 0, '2020-07-10', 676);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 1, '2020-06-15', 77);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 1, '2020-06-16', 117);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 1, '2020-06-23', 157);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 0, '2020-06-26', 177);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 0, '2020-07-07', 417);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 0, '2020-07-08', 597);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 0, '2020-07-09', 637);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '01B', 0, '2020-07-10', 677);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 1, '2020-06-15', 78);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 1, '2020-06-16', 118);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 1, '2020-06-23', 158);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 0, '2020-06-26', 178);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 0, '2020-07-07', 418);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 0, '2020-07-08', 598);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 0, '2020-07-09', 638);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02A', 0, '2020-07-10', 678);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 1, '2020-06-15', 79);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 1, '2020-06-16', 119);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 1, '2020-06-23', 159);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 0, '2020-06-26', 179);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 0, '2020-07-07', 419);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 0, '2020-07-08', 599);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 0, '2020-07-09', 639);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '02B', 0, '2020-07-10', 679);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 1, '2020-06-15', 80);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 1, '2020-06-16', 120);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 1, '2020-06-23', 160);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 0, '2020-06-26', 180);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 0, '2020-07-07', 420);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 0, '2020-07-08', 600);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 0, '2020-07-09', 640);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03A', 0, '2020-07-10', 680);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 1, '2020-06-15', 81);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 1, '2020-06-16', 121);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 1, '2020-06-23', 161);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 0, '2020-06-26', 181);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 0, '2020-07-07', 421);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 0, '2020-07-08', 601);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 0, '2020-07-09', 641);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '03B', 0, '2020-07-10', 681);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 1, '2020-06-15', 82);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 1, '2020-06-16', 122);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 1, '2020-06-23', 162);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 0, '2020-06-26', 182);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 0, '2020-07-07', 422);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 0, '2020-07-08', 602);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 0, '2020-07-09', 642);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04A', 0, '2020-07-10', 682);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 1, '2020-06-15', 83);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 1, '2020-06-16', 123);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 1, '2020-06-23', 163);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 0, '2020-06-26', 183);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 0, '2020-07-07', 423);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 0, '2020-07-08', 603);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 0, '2020-07-09', 643);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '04B', 0, '2020-07-10', 683);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 1, '2020-06-15', 84);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 1, '2020-06-16', 124);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 1, '2020-06-23', 164);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 0, '2020-06-26', 184);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 0, '2020-07-07', 424);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 0, '2020-07-08', 604);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 0, '2020-07-09', 644);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05A', 0, '2020-07-10', 684);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 1, '2020-06-15', 85);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 1, '2020-06-16', 125);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 1, '2020-06-23', 165);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 0, '2020-06-26', 185);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 0, '2020-07-07', 425);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 0, '2020-07-08', 605);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 0, '2020-07-09', 645);
INSERT INTO `user` VALUES (3, 'G102', 0, 2, 2, '05B', 0, '2020-07-10', 685);
INSERT INTO `user` VALUES (4, 'G104', 0, 1, 1, '01A', 0, '2020-07-07', 426);
INSERT INTO `user` VALUES (4, 'G104', 0, 1, 1, '01B', 0, '2020-07-07', 427);
INSERT INTO `user` VALUES (4, 'G104', 0, 1, 1, '02A', 0, '2020-07-07', 428);
INSERT INTO `user` VALUES (4, 'G104', 0, 1, 1, '02B', 0, '2020-07-07', 429);
INSERT INTO `user` VALUES (4, 'G104', 0, 1, 1, '03A', 0, '2020-07-07', 430);
INSERT INTO `user` VALUES (4, 'G104', 0, 1, 1, '03B', 0, '2020-07-07', 431);
INSERT INTO `user` VALUES (4, 'G104', 0, 1, 1, '04A', 0, '2020-07-07', 432);
INSERT INTO `user` VALUES (4, 'G104', 0, 1, 1, '04B', 0, '2020-07-07', 433);
INSERT INTO `user` VALUES (4, 'G104', 0, 1, 1, '05A', 0, '2020-07-07', 434);
INSERT INTO `user` VALUES (4, 'G104', 0, 1, 1, '05B', 0, '2020-07-07', 435);
INSERT INTO `user` VALUES (4, 'G104', 0, 2, 2, '01A', 0, '2020-07-07', 436);
INSERT INTO `user` VALUES (4, 'G104', 0, 2, 2, '01B', 0, '2020-07-07', 437);
INSERT INTO `user` VALUES (4, 'G104', 0, 2, 2, '02A', 0, '2020-07-07', 438);
INSERT INTO `user` VALUES (4, 'G104', 0, 2, 2, '02B', 0, '2020-07-07', 439);
INSERT INTO `user` VALUES (4, 'G104', 0, 2, 2, '03A', 0, '2020-07-07', 440);
INSERT INTO `user` VALUES (4, 'G104', 0, 2, 2, '03B', 0, '2020-07-07', 441);
INSERT INTO `user` VALUES (4, 'G104', 0, 2, 2, '04A', 0, '2020-07-07', 442);
INSERT INTO `user` VALUES (4, 'G104', 0, 2, 2, '04B', 0, '2020-07-07', 443);
INSERT INTO `user` VALUES (4, 'G104', 0, 2, 2, '05A', 0, '2020-07-07', 444);
INSERT INTO `user` VALUES (4, 'G104', 0, 2, 2, '05B', 0, '2020-07-07', 445);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '01A', 0, '2020-06-28', 246);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '01A', 0, '2020-07-07', 446);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '01B', 0, '2020-06-28', 247);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '01B', 0, '2020-07-07', 447);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '02A', 0, '2020-06-28', 248);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '02A', 0, '2020-07-07', 448);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '02B', 0, '2020-06-28', 249);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '02B', 0, '2020-07-07', 449);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '03A', 0, '2020-06-28', 250);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '03A', 0, '2020-07-07', 450);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '03B', 0, '2020-06-28', 251);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '03B', 0, '2020-07-07', 451);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '04A', 0, '2020-06-28', 252);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '04A', 0, '2020-07-07', 452);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '04B', 0, '2020-06-28', 253);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '04B', 0, '2020-07-07', 453);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '05A', 0, '2020-06-28', 254);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '05A', 0, '2020-07-07', 454);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '05B', 0, '2020-06-28', 255);
INSERT INTO `user` VALUES (5, 'G105', 0, 1, 1, '05B', 0, '2020-07-07', 455);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '01A', 0, '2020-06-28', 256);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '01A', 0, '2020-07-07', 456);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '01B', 0, '2020-06-28', 257);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '01B', 0, '2020-07-07', 457);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '02A', 0, '2020-06-28', 258);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '02A', 0, '2020-07-07', 458);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '02B', 0, '2020-06-28', 259);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '02B', 0, '2020-07-07', 459);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '03A', 0, '2020-06-28', 260);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '03A', 0, '2020-07-07', 460);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '03B', 0, '2020-06-28', 261);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '03B', 0, '2020-07-07', 461);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '04A', 0, '2020-06-28', 262);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '04A', 0, '2020-07-07', 462);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '04B', 0, '2020-06-28', 263);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '04B', 0, '2020-07-07', 463);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '05A', 0, '2020-06-28', 264);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '05A', 0, '2020-07-07', 464);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '05B', 0, '2020-06-28', 265);
INSERT INTO `user` VALUES (5, 'G105', 0, 2, 2, '05B', 0, '2020-07-07', 465);
INSERT INTO `user` VALUES (6, 'G106', 0, 1, 1, '01A', 0, '2020-07-07', 466);
INSERT INTO `user` VALUES (6, 'G106', 0, 1, 1, '01B', 0, '2020-07-07', 467);
INSERT INTO `user` VALUES (6, 'G106', 0, 1, 1, '02A', 0, '2020-07-07', 468);
INSERT INTO `user` VALUES (6, 'G106', 0, 1, 1, '02B', 0, '2020-07-07', 469);
INSERT INTO `user` VALUES (6, 'G106', 0, 1, 1, '03A', 0, '2020-07-07', 470);
INSERT INTO `user` VALUES (6, 'G106', 0, 1, 1, '03B', 0, '2020-07-07', 471);
INSERT INTO `user` VALUES (6, 'G106', 0, 1, 1, '04A', 0, '2020-07-07', 472);
INSERT INTO `user` VALUES (6, 'G106', 0, 1, 1, '04B', 0, '2020-07-07', 473);
INSERT INTO `user` VALUES (6, 'G106', 0, 1, 1, '05A', 0, '2020-07-07', 474);
INSERT INTO `user` VALUES (6, 'G106', 0, 1, 1, '05B', 0, '2020-07-07', 475);
INSERT INTO `user` VALUES (6, 'G106', 0, 2, 2, '01A', 0, '2020-07-07', 476);
INSERT INTO `user` VALUES (6, 'G106', 0, 2, 2, '01B', 0, '2020-07-07', 477);
INSERT INTO `user` VALUES (6, 'G106', 0, 2, 2, '02A', 0, '2020-07-07', 478);
INSERT INTO `user` VALUES (6, 'G106', 0, 2, 2, '02B', 0, '2020-07-07', 479);
INSERT INTO `user` VALUES (6, 'G106', 0, 2, 2, '03A', 0, '2020-07-07', 480);
INSERT INTO `user` VALUES (6, 'G106', 0, 2, 2, '03B', 0, '2020-07-07', 481);
INSERT INTO `user` VALUES (6, 'G106', 0, 2, 2, '04A', 0, '2020-07-07', 482);
INSERT INTO `user` VALUES (6, 'G106', 0, 2, 2, '04B', 0, '2020-07-07', 483);
INSERT INTO `user` VALUES (6, 'G106', 0, 2, 2, '05A', 0, '2020-07-07', 484);
INSERT INTO `user` VALUES (6, 'G106', 0, 2, 2, '05B', 0, '2020-07-07', 485);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '01A', 1, '2020-06-28', 306);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '01B', 0, '2020-06-28', 307);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '02A', 0, '2020-06-28', 308);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '02A', 1, '2020-07-07', 488);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '02B', 0, '2020-06-28', 309);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '02B', 0, '2020-07-07', 489);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '03A', 0, '2020-06-28', 310);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '03A', 0, '2020-07-07', 490);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '03B', 0, '2020-06-28', 311);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '03B', 0, '2020-07-07', 491);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '04A', 0, '2020-06-28', 312);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '04A', 0, '2020-07-07', 492);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '04B', 0, '2020-06-28', 313);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '04B', 0, '2020-07-07', 493);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '05A', 0, '2020-06-28', 314);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '05A', 0, '2020-07-07', 494);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '05B', 0, '2020-06-28', 315);
INSERT INTO `user` VALUES (7, 'G107', 0, 1, 1, '05B', 0, '2020-07-07', 495);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '01A', 0, '2020-06-28', 316);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '01A', 0, '2020-07-07', 496);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '01B', 1, '2020-06-28', 317);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '01B', 0, '2020-07-07', 497);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '02A', 0, '2020-06-28', 318);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '02A', 0, '2020-07-07', 498);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '02B', 0, '2020-06-28', 319);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '02B', 0, '2020-07-07', 499);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '03A', 0, '2020-06-28', 320);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '03A', 0, '2020-07-07', 500);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '03B', 0, '2020-06-28', 321);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '03B', 0, '2020-07-07', 501);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '04A', 0, '2020-06-28', 322);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '04A', 0, '2020-07-07', 502);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '04B', 0, '2020-06-28', 323);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '04B', 0, '2020-07-07', 503);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '05A', 0, '2020-06-28', 324);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '05A', 0, '2020-07-07', 504);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '05B', 0, '2020-06-28', 325);
INSERT INTO `user` VALUES (7, 'G107', 0, 2, 2, '05B', 0, '2020-07-07', 505);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '01A', 0, '2020-06-28', 266);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '01A', 0, '2020-07-07', 506);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '01B', 0, '2020-06-28', 267);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '01B', 0, '2020-07-07', 507);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '02A', 0, '2020-06-28', 268);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '02A', 0, '2020-07-07', 508);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '02B', 0, '2020-06-28', 269);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '02B', 0, '2020-07-07', 509);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '03A', 0, '2020-06-28', 270);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '03A', 0, '2020-07-07', 510);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '03B', 0, '2020-06-28', 271);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '03B', 0, '2020-07-07', 511);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '04A', 0, '2020-06-28', 272);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '04A', 0, '2020-07-07', 512);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '04B', 0, '2020-06-28', 273);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '04B', 0, '2020-07-07', 513);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '05A', 0, '2020-06-28', 274);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '05A', 0, '2020-07-07', 514);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '05B', 0, '2020-06-28', 275);
INSERT INTO `user` VALUES (8, 'G108', 0, 1, 1, '05B', 0, '2020-07-07', 515);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '01A', 0, '2020-06-28', 276);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '01A', 0, '2020-07-07', 516);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '01B', 0, '2020-06-28', 277);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '01B', 0, '2020-07-07', 517);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '02A', 0, '2020-06-28', 278);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '02A', 0, '2020-07-07', 518);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '02B', 0, '2020-06-28', 279);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '02B', 0, '2020-07-07', 519);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '03A', 0, '2020-06-28', 280);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '03A', 0, '2020-07-07', 520);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '03B', 0, '2020-06-28', 281);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '03B', 0, '2020-07-07', 521);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '04A', 0, '2020-06-28', 282);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '04A', 0, '2020-07-07', 522);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '04B', 0, '2020-06-28', 283);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '04B', 0, '2020-07-07', 523);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '05A', 0, '2020-06-28', 284);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '05A', 0, '2020-07-07', 524);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '05B', 0, '2020-06-28', 285);
INSERT INTO `user` VALUES (8, 'G108', 0, 2, 2, '05B', 0, '2020-07-07', 525);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '01A', 0, '2020-06-28', 286);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '01A', 0, '2020-07-07', 526);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '01B', 0, '2020-06-28', 287);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '01B', 0, '2020-07-07', 527);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '02A', 0, '2020-06-28', 288);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '02A', 0, '2020-07-07', 528);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '02B', 0, '2020-06-28', 289);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '02B', 0, '2020-07-07', 529);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '03A', 0, '2020-06-28', 290);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '03A', 0, '2020-07-07', 530);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '03B', 0, '2020-06-28', 291);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '03B', 0, '2020-07-07', 531);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '04A', 0, '2020-06-28', 292);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '04A', 0, '2020-07-07', 532);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '04B', 0, '2020-06-28', 293);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '04B', 0, '2020-07-07', 533);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '05A', 0, '2020-06-28', 294);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '05A', 0, '2020-07-07', 534);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '05B', 0, '2020-06-28', 295);
INSERT INTO `user` VALUES (9, 'G109', 0, 1, 1, '05B', 0, '2020-07-07', 535);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '01A', 0, '2020-06-28', 296);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '01A', 0, '2020-07-07', 536);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '01B', 0, '2020-06-28', 297);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '01B', 0, '2020-07-07', 537);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '02A', 0, '2020-06-28', 298);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '02A', 0, '2020-07-07', 538);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '02B', 0, '2020-06-28', 299);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '02B', 0, '2020-07-07', 539);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '03A', 0, '2020-06-28', 300);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '03A', 0, '2020-07-07', 540);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '03B', 0, '2020-06-28', 301);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '03B', 0, '2020-07-07', 541);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '04A', 0, '2020-06-28', 302);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '04A', 0, '2020-07-07', 542);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '04B', 0, '2020-06-28', 303);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '04B', 0, '2020-07-07', 543);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '05A', 0, '2020-06-28', 304);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '05A', 0, '2020-07-07', 544);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '05B', 0, '2020-06-28', 305);
INSERT INTO `user` VALUES (9, 'G109', 0, 2, 2, '05B', 0, '2020-07-07', 545);
INSERT INTO `user` VALUES (10, 'G110', 0, 1, 1, '01A', 0, '2020-07-07', 546);
INSERT INTO `user` VALUES (10, 'G110', 0, 1, 1, '01B', 0, '2020-07-07', 547);
INSERT INTO `user` VALUES (10, 'G110', 0, 1, 1, '02A', 0, '2020-07-07', 548);
INSERT INTO `user` VALUES (10, 'G110', 0, 1, 1, '02B', 0, '2020-07-07', 549);
INSERT INTO `user` VALUES (10, 'G110', 0, 1, 1, '03A', 0, '2020-07-07', 550);
INSERT INTO `user` VALUES (10, 'G110', 0, 1, 1, '03B', 0, '2020-07-07', 551);
INSERT INTO `user` VALUES (10, 'G110', 0, 1, 1, '04A', 0, '2020-07-07', 552);
INSERT INTO `user` VALUES (10, 'G110', 0, 1, 1, '04B', 0, '2020-07-07', 553);
INSERT INTO `user` VALUES (10, 'G110', 0, 1, 1, '05A', 0, '2020-07-07', 554);
INSERT INTO `user` VALUES (10, 'G110', 0, 1, 1, '05B', 0, '2020-07-07', 555);
INSERT INTO `user` VALUES (10, 'G110', 0, 2, 2, '01A', 0, '2020-07-07', 556);
INSERT INTO `user` VALUES (10, 'G110', 0, 2, 2, '01B', 0, '2020-07-07', 557);
INSERT INTO `user` VALUES (10, 'G110', 0, 2, 2, '02A', 0, '2020-07-07', 558);
INSERT INTO `user` VALUES (10, 'G110', 0, 2, 2, '02B', 0, '2020-07-07', 559);
INSERT INTO `user` VALUES (10, 'G110', 0, 2, 2, '03A', 0, '2020-07-07', 560);
INSERT INTO `user` VALUES (10, 'G110', 0, 2, 2, '03B', 0, '2020-07-07', 561);
INSERT INTO `user` VALUES (10, 'G110', 0, 2, 2, '04A', 0, '2020-07-07', 562);
INSERT INTO `user` VALUES (10, 'G110', 0, 2, 2, '04B', 0, '2020-07-07', 563);
INSERT INTO `user` VALUES (10, 'G110', 0, 2, 2, '05A', 0, '2020-07-07', 564);
INSERT INTO `user` VALUES (10, 'G110', 0, 2, 2, '05B', 0, '2020-07-07', 565);

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
INSERT INTO `user` VALUES (1, 'G100', 0, '14:59:35', '杭州', '15:59:52', '绍兴', 33.00, 19.00, 10, 10, 1, '1小时25分种', '2020-07-07');
INSERT INTO `user` VALUES (2, 'G101', 0, '15:35:55', '杭州', '17:59:52', '宁波', 30.00, 15.00, 10, 10, 1, '2小时25分种', '2020-06-15');
INSERT INTO `user` VALUES (2, 'G101', 0, '15:35:55', '杭州', '17:59:52', '宁波', 30.00, 15.00, 10, 10, 1, '2小时25分种', '2020-06-16');
INSERT INTO `user` VALUES (2, 'G101', 0, '15:35:55', '杭州', '17:59:52', '宁波', 30.00, 15.00, 10, 10, 1, '2小时25分种', '2020-06-23');
INSERT INTO `user` VALUES (2, 'G101', 0, '15:35:55', '杭州', '17:59:52', '宁波', 30.00, 15.00, 10, 10, 1, '2小时25分种', '2020-07-07');
INSERT INTO `user` VALUES (2, 'G101', 0, '15:35:55', '杭州', '17:59:52', '宁波', 30.00, 15.00, 10, 10, 1, '2小时25分种', '2020-07-08');
INSERT INTO `user` VALUES (2, 'G101', 0, '15:35:55', '杭州', '17:59:52', '宁波', 30.00, 15.00, 10, 10, 1, '2小时25分种', '2020-07-09');
INSERT INTO `user` VALUES (2, 'G101', 0, '15:35:55', '杭州', '17:59:52', '宁波', 30.00, 15.00, 9, 10, 1, '2小时25分种', '2020-07-10');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-06-15');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-06-16');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-06-23');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-06-26');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-07-07');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-07-08');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-07-09');
INSERT INTO `user` VALUES (3, 'G102', 0, '15:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '25分种', '2020-07-10');
INSERT INTO `user` VALUES (4, 'G104', 0, '10:16:52', '绍兴', '13:16:55', '金华', 22.00, 11.00, 10, 10, 1, '1小时33分种', '2020-07-07');
INSERT INTO `user` VALUES (5, 'G105', 0, '11:17:36', '温州', '17:17:45', '绍兴', 105.00, 65.00, 10, 10, 1, '5小时59分种', '2020-06-28');
INSERT INTO `user` VALUES (5, 'G105', 0, '11:17:36', '温州', '17:17:45', '绍兴', 105.00, 65.00, 10, 10, 1, '5小时59分种', '2020-07-07');
INSERT INTO `user` VALUES (6, 'G106', 0, '11:18:08', '杭州', '15:59:52', '温州', 125.00, 75.00, 10, 10, 1, '4小时25分种', '2020-07-07');
INSERT INTO `user` VALUES (7, 'G107', 0, '08:11:55', '杭州', '08:59:52', '宁波', 30.00, 15.00, 9, 9, 1, '35分钟', '2020-06-28');
INSERT INTO `user` VALUES (7, 'G107', 0, '08:11:55', '杭州', '08:59:52', '宁波', 30.00, 15.00, 10, 10, 1, '35分钟', '2020-07-07');
INSERT INTO `user` VALUES (8, 'G108', 0, '10:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 0, 10, 1, '45分种', '2020-06-28');
INSERT INTO `user` VALUES (8, 'G108', 0, '10:11:55', '杭州', '15:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '45分种', '2020-07-07');
INSERT INTO `user` VALUES (9, 'G109', 0, '12:11:55', '杭州', '12:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '45分种', '2020-06-28');
INSERT INTO `user` VALUES (9, 'G109', 0, '12:11:55', '杭州', '12:59:52', '宁波', 55.00, 25.00, 10, 10, 1, '45分种', '2020-07-07');
INSERT INTO `user` VALUES (10, 'G110', 0, '18:29:20', '杭州', '23:29:30', '宁波', 45.00, 32.00, 10, 10, 1, '2小时3分钟', '2020-07-07');

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
-- Procedure structure for returndiscount
-- ----------------------------
DROP PROCEDURE IF EXISTS `returndiscount`;
delimiter ;;
CREATE PROCEDURE `returndiscount`(IN `status` INT,
	OUT outdiscount DOUBLE)
BEGIN
	DECLARE outdiscount DOUBLE;
	DECLARE outdiscount1 DOUBLE;
	DECLARE outdiscount2 DOUBLE;
	DECLARE outdiscount3 DOUBLE;
	SELECT discount1,discount2,discount3 into outdiscount1 ,outdiscount2,outdiscount3 from pricemanage where id =1;
	if status=1 THEN
		set outdiscount = outdiscount1;
	ELSEIF status=2 THEN
		set outdiscount = outdiscount2;
	ELSEIF status=3 then
		set outdiscount = outdiscount3;
	ELSE 
		set outdiscount = 1;
	END if;
	SELECT outdiscount;
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
	DECLARE discounts DOUBLE;
	if weektype THEN
		SELECT discount
		FROM pricemanage
		WHERE id=1
		INTO discounts;
		SELECT price * discounts INTO price;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for totalprice
-- ----------------------------
DROP PROCEDURE IF EXISTS `totalprice`;
delimiter ;;
CREATE PROCEDURE `totalprice`(IN traindates DATE,
OUT totalprice DECIMAL(8,2))
  COMMENT 'query price'
BEGIN
	SELECT SUM(price) 
	FROM orders 
	WHERE Date(createtime)=Date(traindates)
	AND status=2
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
