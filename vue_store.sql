/*
 Navicat Premium Data Transfer

 Source Server         : jettie
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : vue_store

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 27/05/2022 15:34:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `isDefault` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uId` int(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addressDetail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `areaCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '1', 4, '张死神', '13333333333', '天津市', '天津市', '塘沽区', '应用语言学', '120101');

-- ----------------------------
-- Table structure for goods_cart
-- ----------------------------
DROP TABLE IF EXISTS `goods_cart`;
CREATE TABLE `goods_cart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uid` int(0) NULL DEFAULT NULL,
  `goods_id` int(0) NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` decimal(10, 2) NULL DEFAULT NULL,
  `goods_num` int(0) NULL DEFAULT NULL,
  `goods_imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_cart
-- ----------------------------

-- ----------------------------
-- Table structure for goods_list
-- ----------------------------
DROP TABLE IF EXISTS `goods_list`;
CREATE TABLE `goods_list`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float(255, 0) NULL DEFAULT NULL,
  `num` int(0) NULL DEFAULT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_list
-- ----------------------------
INSERT INTO `goods_list` VALUES (1, '赛事茶-第三届武夷茶', NULL, 238, 34, '/images/goods1.jpg');
INSERT INTO `goods_list` VALUES (2, '茶具-中式陶瓷茶叶', NULL, 26, 45, '/images/goods2.jpg');
INSERT INTO `goods_list` VALUES (3, '绿茶-远数龙井3号', NULL, 118, 112, '/images/goods3.jpg');
INSERT INTO `goods_list` VALUES (4, '明前春茶 绿茶龙井', NULL, 98, 8, '/images/goods4.jpg');

-- ----------------------------
-- Table structure for store_order
-- ----------------------------
DROP TABLE IF EXISTS `store_order`;
CREATE TABLE `store_order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` decimal(10, 2) NULL DEFAULT NULL,
  `goods_num` int(0) NULL DEFAULT NULL,
  `order_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_order
-- ----------------------------
INSERT INTO `store_order` VALUES (3, '20220526233310908188', '赛事茶-第三届武夷茶', 476.00, 2, '2', 4);
INSERT INTO `store_order` VALUES (4, '20220526233552322642', '赛事茶-第三届武夷茶', 238.00, 1, '2', 4);
INSERT INTO `store_order` VALUES (5, '20220527000550632107', '赛事茶-第三届武夷茶', 476.00, 2, '1', 4);
INSERT INTO `store_order` VALUES (6, '20220527000739342770', '赛事茶-第三届武夷茶', 476.00, 2, '2', 4);
INSERT INTO `store_order` VALUES (7, '20220527144037318759', '赛事茶-第三届武夷茶', 238.00, 1, '1', 4);
INSERT INTO `store_order` VALUES (8, '20220527144055780360', '赛事茶-第三届武夷茶', 238.00, 1, '1', 4);
INSERT INTO `store_order` VALUES (9, '20220527144107418693', '赛事茶-第三届武夷茶', 238.00, 1, '2', 4);
INSERT INTO `store_order` VALUES (10, '20220527152118458568', '茶具-中式陶瓷茶叶,赛事茶-第三届武夷茶,绿茶-远数龙井3号', 4280.00, 30, '1', 4);
INSERT INTO `store_order` VALUES (11, '20220527152135595462', '赛事茶-第三届武夷茶', 2380.00, 10, '1', 4);
INSERT INTO `store_order` VALUES (12, '20220527152501543350', '茶具-中式陶瓷茶叶,赛事茶-第三届武夷茶,绿茶-远数龙井3号', 4306.00, 31, '2', 4);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, '15556631665', '666666', '/images/user.jpeg', '15556631665', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWwiOiIxNTU1NjYzMTY2NSIsImlhdCI6MTY1MzYzMzk0MCwiZXhwIjoxNjUzNjM0MDAwfQ.NBMAdv9dbv04XJdbGfh6Lhx0rXwUXqoKkL18UXyJzYw');

SET FOREIGN_KEY_CHECKS = 1;
