-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 21, 2020 at 08:49 PM
-- Server version: 5.7.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test3`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) DEFAULT NULL,
  `street1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `country`) VALUES
(21, 'street 1', 'street 2', 'madinat zayed', 'Abudhabi', 'AE'),
(22, 'street 1', 'street 2', 'madinat zayed', 'Abudhabi', 'AE'),
(23, 'street 1', 'street 2', 'madinat zayed', 'Abudhabi', 'AE'),
(24, 'street 1', 'street 2', 'madinat zayed', 'Abudhabi', 'AE'),
(25, 'street 1', 'street 2', 'madinat zayed', 'Abudhabi', 'AE'),
(26, 'street 1', 'street 2', 'madinat zayed', 'Abudhabi', 'AE');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `parent_sort` int(11) DEFAULT NULL,
  `image` blob,
  `background_color` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `sort`, `parent_sort`, `image`, `background_color`) VALUES
(1, 'La Familia', 0, 1, 1, NULL, '#ff8080');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `phone`, `email`) VALUES
(21, 'Test', 'Dev', '+971 00000000', 'testdev@gmail.com'),
(22, 'Test', 'Dev', '+971 00000000', 'testdev@gmail.com'),
(23, 'Test', 'Dev', '+971 00000000', 'testdev@gmail.com'),
(24, 'Test', 'Dev', '+971 00000000', 'testdev@gmail.com'),
(25, 'Test', 'Dev', '+971 00000000', 'testdev@gmail.com'),
(26, 'Test', 'Dev', '+971 00000000', 'testdev@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `special_request` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_ibfk_1` (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `id_order`, `product`, `price`, `quantity`, `special_request`) VALUES
(4, 17, 1000, 100.00, 10, 'p'),
(5, 17, 1005, 50.00, 10, 'p'),
(6, 18, 1000, 100.00, 10, 'p'),
(7, 18, 1005, 50.00, 10, 'p'),
(8, 19, 1000, 100.00, 10, 'p'),
(9, 19, 1005, 50.00, 10, 'p'),
(10, 20, 1000, 100.00, 10, 'p'),
(11, 20, 1005, 50.00, 10, 'p'),
(12, 21, 1000, 100.00, 10, 'p'),
(13, 21, 1005, 50.00, 10, 'p'),
(14, 22, 1000, 100.00, 10, 'p'),
(15, 22, 1005, 50.00, 10, 'p'),
(16, 23, 1000, 100.00, 10, 'p'),
(17, 23, 1005, 50.00, 10, 'p'),
(18, 24, 1000, 100.00, 10, 'p'),
(19, 24, 1005, 50.00, 10, 'p'),
(20, 25, 1000, 100.00, 10, 'p'),
(21, 25, 1005, 50.00, 10, 'p'),
(22, 26, 1000, 100.00, 10, 'p'),
(23, 26, 1005, 50.00, 10, 'p');

-- --------------------------------------------------------

--
-- Table structure for table `item_modifiers`
--

DROP TABLE IF EXISTS `item_modifiers`;
CREATE TABLE IF NOT EXISTS `item_modifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_item` (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item_modifiers`
--

INSERT INTO `item_modifiers` (`id`, `id_item`, `modifier`, `qty`) VALUES
(1, 4, 10, 1),
(2, 4, 11, 1),
(3, 6, 10, 1),
(4, 6, 11, 1),
(5, 8, 10, 1),
(6, 8, 11, 1),
(7, 10, 10, 1),
(8, 10, 11, 1),
(9, 12, 10, 1),
(10, 12, 11, 1),
(11, 14, 10, 1),
(12, 14, 11, 1),
(13, 16, 10, 1),
(14, 16, 11, 1),
(15, 18, 10, 1),
(16, 18, 11, 1),
(17, 20, 10, 1),
(18, 20, 11, 1),
(19, 22, 10, 1),
(20, 22, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modifiers`
--

DROP TABLE IF EXISTS `modifiers`;
CREATE TABLE IF NOT EXISTS `modifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modifier_class` int(11) DEFAULT NULL,
  `sku` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `barcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` float(10,2) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `selected` bit(1) DEFAULT NULL,
  `is_quick` bit(1) DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_modifier_class` (`id_modifier_class`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modifiers`
--

INSERT INTO `modifiers` (`id`, `id_modifier_class`, `sku`, `sort`, `name`, `price`, `barcode`, `cost`, `active`, `selected`, `is_quick`, `image_url`) VALUES
(1, 1, NULL, 0, 'Side Cheese', 4.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(2, 1, NULL, 1, 'Side Melted Cheese', 5.00, NULL, 0.00, b'1', b'0', b'0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modifier_classes`
--

DROP TABLE IF EXISTS `modifier_classes`;
CREATE TABLE IF NOT EXISTS `modifier_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) DEFAULT NULL,
  `modifier_class_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `minimum_amount` int(11) DEFAULT NULL,
  `maximum_amount` int(11) DEFAULT NULL,
  `admin_modifier` bit(1) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `forced` bit(1) DEFAULT NULL,
  `amount_free_is_dollars` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount_free` int(11) DEFAULT NULL,
  `admin_mod_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `split` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modifier_classes`
--

INSERT INTO `modifier_classes` (`id`, `id_product`, `modifier_class_id`, `sort`, `name`, `minimum_amount`, `maximum_amount`, `admin_modifier`, `active`, `forced`, `amount_free_is_dollars`, `amount_free`, `admin_mod_type`, `split`) VALUES
(1, 1, 1, 1, 'Side Extra', 0, 0, b'0', b'1', b'0', NULL, 0, NULL, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `establishment` int(11) DEFAULT NULL,
  `discount_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_amount` int(11) DEFAULT NULL,
  `discount_amount` int(11) DEFAULT NULL,
  `timestamp` float(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `establishment`, `discount_code`, `delivery_amount`, `discount_amount`, `timestamp`) VALUES
(14, 1, 'null', 10, 12, NULL),
(15, 1, 'null', 10, 12, NULL),
(16, 1, 'null', 10, 12, NULL),
(17, 1, 'null', 10, 12, NULL),
(18, 1, 'null', 10, 12, NULL),
(19, 1, 'null', 10, 12, NULL),
(20, 1, 'null', 10, 12, NULL),
(21, 1, 'null', 10, 12, NULL),
(22, 1, 'null', 10, 12, NULL),
(23, 1, 'null', 10, 12, NULL),
(24, 1, 'null', 10, 12, NULL),
(25, 1, 'null', 10, 12, NULL),
(26, 1, 'null', 10, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE IF NOT EXISTS `orderinfo` (
  `id` int(11) DEFAULT NULL,
  `dining_option` int(11) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderinfo`
--

INSERT INTO `orderinfo` (`id`, `dining_option`, `notes`) VALUES
(21, 2, 'oo'),
(22, 2, 'oo'),
(23, 2, 'oo'),
(24, 2, 'oo'),
(25, 2, 'oo'),
(26, 2, 'oo');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `sku` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `arabic_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `arabic_description` text COLLATE utf8_unicode_ci,
  `barcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` blob,
  `stock_amount` int(11) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `uom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` float(10,2) DEFAULT NULL,
  `sold_by_weight` bit(1) DEFAULT NULL,
  `attribute_type` int(11) DEFAULT NULL,
  `is_shipping` bit(1) DEFAULT NULL,
  `is_gift` bit(1) DEFAULT NULL,
  `is_combo` int(11) DEFAULT NULL,
  `has_upsell` bit(1) DEFAULT NULL,
  `max_price` float(10,2) DEFAULT NULL,
  `size_chart` int(11) DEFAULT NULL,
  `point_value` float(10,2) DEFAULT NULL,
  `course_number` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sort`, `sku`, `id_category`, `name`, `arabic_name`, `description`, `arabic_description`, `barcode`, `images`, `stock_amount`, `price`, `uom`, `cost`, `sold_by_weight`, `attribute_type`, `is_shipping`, `is_gift`, `is_combo`, `has_upsell`, `max_price`, `size_chart`, `point_value`, `course_number`, `created_date`) VALUES
(1, 0, 1, 1, 'El Camron', 'El Camron', NULL, NULL, '00000001', NULL, 0, 30.00, 'serv', 0.00, b'0', 0, b'0', b'0', 1, b'0', NULL, NULL, NULL, NULL, '2020-09-20 12:30:58'),
(3, 0, 1, 1, 'hgjgj', 'jhgjhg', NULL, NULL, '00000021', NULL, 0, 4.00, 'serv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
CREATE TABLE IF NOT EXISTS `timetable` (
  `id` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `timetable_data` json DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `active`, `from_date`, `to_date`, `timetable_data`, `type`) VALUES
(1, 1, '2020-09-20 12:30:58', '2022-09-20 13:46:50', NULL, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id`) REFERENCES `orderinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `item_modifiers`
--
ALTER TABLE `item_modifiers`
  ADD CONSTRAINT `item_modifiers_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `modifiers`
--
ALTER TABLE `modifiers`
  ADD CONSTRAINT `modifiers_ibfk_1` FOREIGN KEY (`id_modifier_class`) REFERENCES `modifier_classes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `modifier_classes`
--
ALTER TABLE `modifier_classes`
  ADD CONSTRAINT `modifier_classes_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD CONSTRAINT `orderinfo_ibfk_1` FOREIGN KEY (`id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
