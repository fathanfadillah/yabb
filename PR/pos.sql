/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : yabb

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 19/07/2021 01:00:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'main dish');
INSERT INTO `categories` VALUES (2, 'beverage');
INSERT INTO `categories` VALUES (3, 'dessert');

-- ----------------------------
-- Table structure for item_categories
-- ----------------------------
DROP TABLE IF EXISTS `item_categories`;
CREATE TABLE `item_categories`  (
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `item_categories_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_categories
-- ----------------------------
INSERT INTO `item_categories` VALUES (1, 1);
INSERT INTO `item_categories` VALUES (2, 2);
INSERT INTO `item_categories` VALUES (3, 1);
INSERT INTO `item_categories` VALUES (4, 2);
INSERT INTO `item_categories` VALUES (5, 2);
INSERT INTO `item_categories` VALUES (6, 3);
INSERT INTO `item_categories` VALUES (7, 1);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, 'Nasi Goreng Gila', 25000);
INSERT INTO `items` VALUES (2, 'Ice Water', 2000);
INSERT INTO `items` VALUES (3, 'Spaghetti', 40000);
INSERT INTO `items` VALUES (4, 'Green Tea Latte', 18000);
INSERT INTO `items` VALUES (5, 'Orange Juice', 15000);
INSERT INTO `items` VALUES (6, 'Vanilla Ice Cream', 13000);
INSERT INTO `items` VALUES (7, 'Cordon Blue', 36000);
INSERT INTO `items` VALUES (8, 'French Fries', 20000);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item_categories` (`item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (1, 1, 1, 25000, 1);
INSERT INTO `order_details` VALUES (2, 1, 2, 2000, 1);
INSERT INTO `order_details` VALUES (3, 2, 3, 40000, 1);
INSERT INTO `order_details` VALUES (4, 2, 4, 15000, 1);
INSERT INTO `order_details` VALUES (5, 3, 3, 40000, 1);
INSERT INTO `order_details` VALUES (6, 3, 5, 15000, 1);
INSERT INTO `order_details` VALUES (7, 4, 1, 25000, 1);
INSERT INTO `order_details` VALUES (8, 4, 2, 2000, 1);
INSERT INTO `order_details` VALUES (9, 5, 7, 36000, 1);
INSERT INTO `order_details` VALUES (10, 5, 4, 18000, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NULL DEFAULT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 27000, '2020-10-10');
INSERT INTO `orders` VALUES (2, 2, 58000, '2020-10-10');
INSERT INTO `orders` VALUES (3, 3, 55000, '2020-10-10');
INSERT INTO `orders` VALUES (4, 1, 27000, '2020-10-11');
INSERT INTO `orders` VALUES (5, 2, 54000, '2020-10-11');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Budiawan', NULL, '+6212345678', NULL);
INSERT INTO `users` VALUES (2, 'Mary Jones', NULL, '+6287654321', NULL);
INSERT INTO `users` VALUES (3, 'Budiawan', NULL, '+6289753124', NULL);
INSERT INTO `users` VALUES (4, 'Fathan', NULL, '+6288888888', NULL);
INSERT INTO `users` VALUES (5, 'Fathan', NULL, '+6222222222', NULL);

SET FOREIGN_KEY_CHECKS = 1;
