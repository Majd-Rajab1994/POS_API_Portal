-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 22, 2020 at 04:32 PM
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
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_color` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `sort`, `parent_sort`, `image`, `background_color`) VALUES
(1, 'LA FAMILIA', 0, 1, 1, 'null', NULL),
(2, 'SLIDERS', 0, 2, 2, 'null', NULL),
(3, 'BURGERS', 0, 3, 3, 'null', NULL),
(4, 'CHICKEN BURGER', 0, 4, 4, 'null', NULL),
(5, 'KASHTA BOX', 0, 5, 5, 'null', NULL),
(6, 'APPETIZERS', 0, 6, 6, 'null', NULL),
(7, 'HOTDOG', 0, 7, 7, 'null', NULL),
(8, 'SIDE EXTRAS', 0, 8, 8, 'null', NULL),
(9, 'DRINKS', 0, 9, 9, 'null', NULL),
(10, 'SOFT DRINKS', 9, 10, 10, 'null', NULL),
(11, 'MOJITOS', 9, 11, 11, 'null', NULL),
(12, 'LITTLE ONES', 8, 0, 0, 'null', NULL),
(13, 'SIDES', 0, 13, 13, 'null', NULL),
(23, 'FRIES', 8, 0, 0, 'null', NULL),
(24, 'WINGS', 8, 0, 0, 'null', NULL);

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
  `sku` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `barcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` float(10,2) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `selected` bit(1) DEFAULT NULL,
  `is_quick` bit(1) DEFAULT NULL,
  `img_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modifiers_ibfk_1` (`id_modifier_class`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modifiers`
--

INSERT INTO `modifiers` (`id`, `id_modifier_class`, `sku`, `sort`, `name`, `price`, `barcode`, `cost`, `active`, `selected`, `is_quick`, `img_url`) VALUES
(1, 1, '', 0, 'Add Beef Bacon (+8AED)', 8.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(2, 1, '', 1, 'Add Beef Patty (Not Stuffed) (+10AED)', 10.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(3, 1, '', 2, 'Add Chili Powder (Free)', 0.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(4, 1, '', 3, 'Add Egg(+4AED)', 4.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(5, 1, '', 4, 'Add Lettuce(Free)', 0.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(6, 1, '', 5, 'Add Tomato(Free)', 0.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(7, 1, '', 6, 'Add White Onion(Free)', 0.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(8, 1, '', 7, 'Extra Pasta(+5AED)', 5.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(9, 1, '', 8, 'Side Apache Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(10, 1, '', 9, 'Side ASAP Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(11, 1, '', 10, 'Side Buffalo Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(12, 1, '', 11, 'Side Burgerista  Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(13, 1, '', 12, 'Side Cheese (+4AED)', 4.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(14, 1, '', 13, 'Side Chick In Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(15, 1, '', 14, 'Side Chickira Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(16, 1, '', 15, 'Side FYA Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(17, 1, '', 16, 'Side FYI Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(18, 1, '', 17, 'Side HP Way Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(19, 1, '', 18, 'Side Huff Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(20, 1, '', 19, 'Side Huffed &amp; Stuffed Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(21, 1, '', 20, 'Side Jalapeno(+6AED)', 6.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(22, 1, '', 21, 'Side Ketchup(+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(23, 1, '', 22, 'Side Mayonnais (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(24, 1, '', 23, 'Side Melted Cheese(+5AED)', 5.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(25, 1, '', 24, 'Side OMG  Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(26, 1, '', 25, 'Side Onion Rings  Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(27, 1, '', 26, 'Side Pickels (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(28, 1, '', 27, 'Side Puff Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(29, 1, '', 28, 'Side Puffed &amp; Stuffed Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(30, 1, '', 29, 'Side Son of Gun Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(31, 1, '', 30, 'Side Stick-wich Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(32, 1, '', 31, 'Side Storm Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(33, 1, '', 32, 'Side Vintage Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL),
(34, 1, '', 33, 'Side Volcano  Sauce (+2AED)', 2.00, NULL, 0.00, b'1', b'0', b'0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modifier_classes`
--

DROP TABLE IF EXISTS `modifier_classes`;
CREATE TABLE IF NOT EXISTS `modifier_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modifier_class_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `minimum_amount` int(11) DEFAULT NULL,
  `maximum_amount` int(11) DEFAULT NULL,
  `admin_modifier` bit(1) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `forced` bit(1) DEFAULT NULL,
  `amount_free_is_dollars` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount_free` int(11) DEFAULT NULL,
  `admin_mod_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `split` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modifier_classes`
--

INSERT INTO `modifier_classes` (`id`, `modifier_class_id`, `sort`, `name`, `minimum_amount`, `maximum_amount`, `admin_modifier`, `active`, `forced`, `amount_free_is_dollars`, `amount_free`, `admin_mod_type`, `split`) VALUES
(1, 1, 1, 'SIDE EXTRA', 0, 0, b'0', 0, b'0', NULL, 0, NULL, b'0');

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
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  KEY `products_ibfk_1` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sort`, `sku`, `id_category`, `name`, `arabic_name`, `description`, `arabic_description`, `barcode`, `images`, `stock_amount`, `price`, `uom`, `cost`, `sold_by_weight`, `attribute_type`, `is_shipping`, `is_gift`, `is_combo`, `has_upsell`, `max_price`, `size_chart`, `point_value`, `course_number`, `created_date`) VALUES
(1, 0, 1, 1, 'El Camron', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/1.jpg', 0, 26.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:30:51'),
(2, 0, 2, 1, 'EL Patron', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/2.jpg', 0, 26.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:32:59'),
(3, 0, 3, 1, 'El Toro', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/3.jpg', 0, 21.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:34:00'),
(4, 0, 4, 2, 'FYI', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/4.jpg', 0, 32.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:36:51'),
(5, 0, 5, 2, 'ASAP', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/5.jpg', 0, 31.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:38:58'),
(6, 0, 6, 2, 'FYA', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/6.jpg', 0, 30.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:40:29'),
(7, 0, 7, 2, 'OMG', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/7.jpg', 0, 29.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:42:55'),
(8, 0, 8, 3, 'Huff Burger', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/8.jpg', 0, 26.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:44:13'),
(9, 0, 9, 3, 'Puff Burger', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/9.jpg', 0, 32.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:46:51'),
(10, 0, 10, 3, 'Puffed &amp; Stuffed', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/10.jpg', 0, 37.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:48:16'),
(11, 0, 11, 3, 'Huffed &amp; Stuffed', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/11.jpg', 0, 42.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 09:53:31'),
(12, 0, 12, 3, 'Stick- Wich', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/12.jpg', 0, 28.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:00:46'),
(13, 0, 13, 3, 'Burgerista', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/13.jpg', 0, 31.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:01:54'),
(14, 0, 14, 3, 'Vintage Burger', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/14.jpg', 0, 29.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:03:07'),
(15, 0, 15, 4, 'Chik In', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/15.jpg', 0, 21.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:04:35'),
(16, 0, 16, 4, 'Son Of Gun', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/16.jpg', 0, 37.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:06:03'),
(17, 0, 17, 4, 'Apache', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/17.jpg', 0, 37.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:07:10'),
(18, 0, 18, 4, 'Chickira', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/18.jpg', 0, 35.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:08:54'),
(19, 0, 19, 5, 'Kashta Box', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/19.jpg', 0, 263.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:09:57'),
(20, 0, 20, 6, 'Volcano Shrimps', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/20.jpg', 0, 32.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:11:27'),
(21, 0, 21, 6, 'Storm Shrimps', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/21.jpg', 0, 32.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:12:30'),
(22, 0, 22, 6, 'Onion Rings', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/22.jpg', 0, 11.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:13:17'),
(23, 0, 23, 7, 'Classic Hotdog', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/23.jpg', 0, 19.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:14:34'),
(24, 0, 24, 7, 'H &amp; P Way Hotdog', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/24.jpg', 0, 27.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 10:16:23'),
(25, 0, 25, 23, 'Potato Strips', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/25.jpg', 0, 11.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 11:39:41'),
(26, 0, 26, 23, 'Melted Cheese Fries', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/26.jpg', 0, 15.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 11:40:28'),
(27, 0, 27, 23, 'Salted Potato', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/27.jpg', 0, 8.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 11:41:04'),
(28, 0, 28, 23, 'Savory Fries', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/28.jpg', 0, 10.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 11:41:53'),
(29, 0, 29, 23, 'H &amp; P All the Way Fries', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/29.jpg', 0, 21.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 11:42:31'),
(30, 0, 30, 24, 'Crispy Bufflo Wings', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/30.jpg', 0, 35.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 11:43:07'),
(31, 0, 31, 24, 'Boneless  Bufflo Wings', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/31.jpg', 0, 34.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 11:43:58'),
(32, 0, 32, 24, 'Classic  Bufflo Wings', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/32.jpg', 0, 32.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-20 11:44:40'),
(33, 0, 33, 9, 'Water', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/33.jpg', 0, 6.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:13:23'),
(34, 0, 34, 10, 'Coca Cola', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/34.jpg', 0, 6.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:13:52'),
(35, 0, 35, 10, 'Diet Coca Cola', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/35.jpg', 0, 6.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:14:33'),
(36, 0, 36, 10, 'Fanta', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/36.jpg', 0, 6.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:14:56'),
(37, 0, 37, 10, 'Sprite', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/37.jpg', 0, 6.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:15:16'),
(38, 0, 38, 11, 'Passion It Up', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/38.jpg', 0, 32.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:19:19'),
(39, 0, 39, 11, 'Strawbtasstic', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/39.jpg', 0, 27.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:19:41'),
(40, 0, 40, 11, 'Mint to Be', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/40.jpg', 0, 21.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:20:18'),
(41, 0, 41, 12, 'Huffy', NULL, 'Huffy', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/41.jpg', 0, 27.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:20:58'),
(42, 0, 42, 12, 'Puffy', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/42.jpg', 0, 27.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:21:23'),
(43, 0, 43, 12, 'H &amp; P Nuggets', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/43.jpg', 0, 21.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 08:21:47'),
(44, 0, 44, 13, 'Add Beef Bacon', NULL, 'Extra Beef Bacon', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/44.jpg', 0, 8.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 09:45:02'),
(45, 0, 45, 13, 'Add Beef Patty (Not Stuffed)', NULL, 'Add Beef Patty (Not Stuffed)', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/45.jpg', 0, 10.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 09:49:00'),
(46, 0, 46, 13, 'Add Chili Powder', NULL, 'Add Chili Powder', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/46.jpg', 0, 0.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 09:53:47'),
(47, 0, 47, 13, 'Add Egg', NULL, 'Add Egg', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/47.jpg', 0, 4.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 09:54:13'),
(48, 0, 48, 13, 'Add Lettuce', NULL, 'Add Lettuce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/48.jpg', 0, 0.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 09:54:37'),
(49, 0, 49, 13, 'Add Tomato', NULL, 'Add Tomato', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/49.jpg', 0, 0.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 09:55:16'),
(50, 0, 50, 13, 'Add White Onion', NULL, 'Add White Onion', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/50.jpg', 0, 0.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 09:55:42'),
(51, 0, 51, 13, 'Extra Pasta', NULL, 'Extra Pasta', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/51.jpg', 0, 5.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 09:56:02'),
(52, 0, 52, 13, 'Side Apache Sauce', NULL, 'Side Apache Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/52.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 09:56:26'),
(53, 0, 53, 13, 'Side ASAP Sauce', NULL, 'Side ASAP Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/53.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:04:16'),
(54, 0, 54, 13, 'Side Buffalo Sauce', NULL, 'Side Buffalo Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/54.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:04:53'),
(55, 0, 55, 13, 'Side Burgerista  Sauce', NULL, 'Side Burgerista  Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/55.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:05:17'),
(56, 0, 56, 13, 'Side Cheese', NULL, 'Side Cheese', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/56.jpg', 0, 4.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:05:44'),
(57, 0, 57, 13, 'Side Chick In Sauce', NULL, 'Side Chick In Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/57.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:06:05'),
(58, 0, 58, 13, 'Side Chickira Sauce', NULL, 'Side Chickira Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/58.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:06:39'),
(59, 0, 59, 13, 'Side FYA Sauce', NULL, 'Side FYA Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/59.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:07:08'),
(60, 0, 60, 13, 'Side FYI Sauce', NULL, 'Side FYI Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/60.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:07:35'),
(61, 0, 61, 13, 'Side HP Way Sauce', NULL, 'Side HP Way Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/61.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:08:00'),
(62, 0, 62, 13, 'Side Huff Sauce', NULL, 'Side Huff Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/62.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:08:19'),
(63, 0, 63, 13, 'Side Huffed and Stuffed Sauce', NULL, 'Side Huffed and Puffed Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/63.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:09:02'),
(64, 0, 64, 13, 'Side Jalapeno', NULL, 'Side Jalapeno', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/64.jpg', 0, 6.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:09:22'),
(65, 0, 65, 13, 'Side Ketchup', NULL, 'Side Ketchup', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/65.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:09:47'),
(66, 0, 66, 13, 'Side Mayonnais', NULL, 'Side Mayonnais', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/66.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:10:08'),
(67, 0, 67, 13, 'Side Melted Cheese', NULL, 'Side Melted Cheese', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/67.jpg', 0, 5.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:10:30'),
(68, 0, 68, 13, 'Side OMG  Sauce', NULL, 'Side OMG  Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/68.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:10:58'),
(69, 0, 69, 13, 'Side Onion Rings Sauce', NULL, 'Side Onion Rings Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/69.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:11:23'),
(70, 0, 70, 13, 'Side Pickles', NULL, 'Side Pickels', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/70.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:11:47'),
(71, 0, 71, 13, 'Side Puff Sauce', NULL, 'Side Puff Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/71.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:12:08'),
(72, 0, 72, 13, 'Side Puffed and Stuffed Sauce', NULL, 'Side Puffed and Stuffed Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/72.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:12:45'),
(73, 0, 73, 13, 'Side Son of Gun Sauce', NULL, 'Side Son of Gun Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/73.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:13:06'),
(74, 0, 74, 13, 'Side Stick-wich Sauce', NULL, 'Side Stick-wich Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/74.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:13:33'),
(75, 0, 75, 13, 'Side Storm Sauce', NULL, 'Side Storm Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/75.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:13:54'),
(76, 0, 76, 13, 'Side Vintage Sauce', NULL, 'Side Vintage Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/76.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:14:18'),
(77, 0, 77, 13, 'Side Volcano  Sauce', NULL, 'Side Volcano  Sauce', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/77.jpg', 0, 2.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-09-21 10:15:01'),
(101, 0, 101, 3, 'Double Trouble', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/101.jpg', 0, 37.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-11-15 05:51:23'),
(102, 0, 102, 3, 'Shrimping', NULL, '', NULL, NULL, 'https://huffnpuff.polarispos.com/company/0/images/102.jpg', 0, 31.00, 'Serve', 0.00, b'0', 0, b'0', b'0', NULL, b'0', NULL, NULL, NULL, NULL, '2020-11-15 05:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `product_modifier_class`
--

DROP TABLE IF EXISTS `product_modifier_class`;
CREATE TABLE IF NOT EXISTS `product_modifier_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) DEFAULT NULL,
  `id_modifier_class` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  KEY `id_modifier_class` (`id_modifier_class`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_modifier_class`
--

INSERT INTO `product_modifier_class` (`id`, `id_product`, `id_modifier_class`) VALUES
(1, 30, 1),
(2, 31, 1),
(3, 32, 1),
(4, 25, 1),
(5, 26, 1),
(6, 27, 1),
(7, 28, 1),
(8, 29, 1),
(9, 41, 1),
(10, 42, 1),
(11, 43, 1),
(12, 1, 1),
(13, 2, 1),
(14, 3, 1),
(15, 4, 1),
(16, 5, 1),
(17, 6, 1),
(18, 7, 1),
(19, 8, 1),
(20, 9, 1),
(21, 10, 1),
(22, 11, 1),
(23, 12, 1),
(24, 13, 1),
(25, 14, 1),
(26, 101, 1),
(27, 102, 1),
(28, 15, 1),
(29, 16, 1),
(30, 17, 1),
(31, 18, 1),
(32, 19, 1),
(33, 20, 1),
(34, 21, 1),
(35, 22, 1),
(36, 23, 1),
(37, 24, 1),
(38, 71, 1);

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
  KEY `timetable_ibfk_1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `active`, `from_date`, `to_date`, `timetable_data`, `type`) VALUES
(30, 1, '2020-09-20 11:43:07', '2022-11-22 19:33:10', '{}', 1),
(31, 1, '2020-09-20 11:43:58', '2022-11-22 19:33:10', '{}', 1),
(32, 1, '2020-09-20 11:44:40', '2022-11-22 19:33:10', '{}', 1),
(25, 1, '2020-09-20 11:39:41', '2022-11-22 19:33:10', '{}', 1),
(26, 1, '2020-09-20 11:40:28', '2022-11-22 19:33:10', '{}', 1),
(27, 1, '2020-09-20 11:41:04', '2022-11-22 19:33:11', '{}', 1),
(28, 1, '2020-09-20 11:41:53', '2022-11-22 19:33:11', '{}', 1),
(29, 1, '2020-09-20 11:42:31', '2022-11-22 19:33:11', '{}', 1),
(41, 1, '2020-09-21 08:20:58', '2022-11-22 19:33:11', '{}', 1),
(42, 1, '2020-09-21 08:21:23', '2022-11-22 19:33:11', '{}', 1),
(43, 1, '2020-09-21 08:21:47', '2022-11-22 19:33:12', '{}', 1),
(1, 1, '2020-09-20 09:30:51', '2022-11-22 19:33:12', '{}', 1),
(2, 1, '2020-09-20 09:32:59', '2022-11-22 19:33:12', '{}', 1),
(3, 1, '2020-09-20 09:34:00', '2022-11-22 19:33:12', '{}', 1),
(4, 1, '2020-09-20 09:36:51', '2022-11-22 19:33:12', '{}', 1),
(5, 1, '2020-09-20 09:38:58', '2022-11-22 19:33:13', '{}', 1),
(6, 1, '2020-09-20 09:40:29', '2022-11-22 19:33:13', '{}', 1),
(7, 1, '2020-09-20 09:42:55', '2022-11-22 19:33:13', '{}', 1),
(8, 1, '2020-09-20 09:44:13', '2022-11-22 19:33:13', '{}', 1),
(9, 1, '2020-09-20 09:46:51', '2022-11-22 19:33:13', '{}', 1),
(10, 1, '2020-09-20 09:48:16', '2022-11-22 19:33:13', '{}', 1),
(11, 1, '2020-09-20 09:53:31', '2022-11-22 19:33:14', '{}', 1),
(12, 1, '2020-09-20 10:00:46', '2022-11-22 19:33:14', '{}', 1),
(13, 1, '2020-09-20 10:01:54', '2022-11-22 19:33:14', '{}', 1),
(14, 1, '2020-09-20 10:03:07', '2022-11-22 19:33:14', '{}', 1),
(101, 1, '2020-11-15 05:51:23', '2022-11-22 19:33:14', '{}', 1),
(102, 1, '2020-11-15 05:51:36', '2022-11-22 19:33:14', '{}', 1),
(15, 1, '2020-09-20 10:04:35', '2022-11-22 19:33:15', '{}', 1),
(16, 1, '2020-09-20 10:06:03', '2022-11-22 19:33:15', '{}', 1),
(17, 1, '2020-09-20 10:07:10', '2022-11-22 19:33:15', '{}', 1),
(18, 1, '2020-09-20 10:08:54', '2022-11-22 19:33:15', '{}', 1),
(19, 1, '2020-09-20 10:09:57', '2022-11-22 19:33:15', '{}', 1),
(20, 1, '2020-09-20 10:11:27', '2022-11-22 19:33:16', '{}', 1),
(21, 1, '2020-09-20 10:12:30', '2022-11-22 19:33:16', '{}', 1),
(22, 1, '2020-09-20 10:13:17', '2022-11-22 19:33:16', '{}', 1),
(23, 1, '2020-09-20 10:14:34', '2022-11-22 19:33:16', '{}', 1),
(24, 1, '2020-09-20 10:16:23', '2022-11-22 19:33:16', '{}', 1),
(33, 1, '2020-09-21 08:13:23', '2022-11-22 19:33:17', '{}', 1),
(34, 1, '2020-09-21 08:13:52', '2022-11-22 19:33:17', '{}', 1),
(35, 1, '2020-09-21 08:14:33', '2022-11-22 19:33:17', '{}', 1),
(36, 1, '2020-09-21 08:14:56', '2022-11-22 19:33:17', '{}', 1),
(37, 1, '2020-09-21 08:15:16', '2022-11-22 19:33:17', '{}', 1),
(38, 1, '2020-09-21 08:19:19', '2022-11-22 19:33:17', '{}', 1),
(39, 1, '2020-09-21 08:19:41', '2022-11-22 19:33:17', '{}', 1),
(40, 1, '2020-09-21 08:20:18', '2022-11-22 19:33:18', '{}', 1),
(44, 1, '2020-09-21 09:45:02', '2022-11-22 19:33:18', '{}', 1),
(45, 1, '2020-09-21 09:49:00', '2022-11-22 19:33:18', '{}', 1),
(46, 1, '2020-09-21 09:53:47', '2022-11-22 19:33:18', '{}', 1),
(47, 1, '2020-09-21 09:54:13', '2022-11-22 19:33:18', '{}', 1),
(48, 1, '2020-09-21 09:54:37', '2022-11-22 19:33:18', '{}', 1),
(49, 1, '2020-09-21 09:55:16', '2022-11-22 19:33:18', '{}', 1),
(50, 1, '2020-09-21 09:55:42', '2022-11-22 19:33:18', '{}', 1),
(51, 1, '2020-09-21 09:56:02', '2022-11-22 19:33:19', '{}', 1),
(52, 1, '2020-09-21 09:56:26', '2022-11-22 19:33:19', '{}', 1),
(53, 1, '2020-09-21 10:04:16', '2022-11-22 19:33:19', '{}', 1),
(54, 1, '2020-09-21 10:04:53', '2022-11-22 19:33:19', '{}', 1),
(55, 1, '2020-09-21 10:05:17', '2022-11-22 19:33:19', '{}', 1),
(56, 1, '2020-09-21 10:05:44', '2022-11-22 19:33:19', '{}', 1),
(57, 1, '2020-09-21 10:06:05', '2022-11-22 19:33:19', '{}', 1),
(58, 1, '2020-09-21 10:06:39', '2022-11-22 19:33:19', '{}', 1),
(59, 1, '2020-09-21 10:07:08', '2022-11-22 19:33:19', '{}', 1),
(60, 1, '2020-09-21 10:07:35', '2022-11-22 19:33:20', '{}', 1),
(61, 1, '2020-09-21 10:08:00', '2022-11-22 19:33:20', '{}', 1),
(62, 1, '2020-09-21 10:08:19', '2022-11-22 19:33:20', '{}', 1),
(63, 1, '2020-09-21 10:09:02', '2022-11-22 19:33:20', '{}', 1),
(64, 1, '2020-09-21 10:09:22', '2022-11-22 19:33:20', '{}', 1),
(65, 1, '2020-09-21 10:09:47', '2022-11-22 19:33:20', '{}', 1),
(66, 1, '2020-09-21 10:10:08', '2022-11-22 19:33:20', '{}', 1),
(67, 1, '2020-09-21 10:10:30', '2022-11-22 19:33:20', '{}', 1),
(68, 1, '2020-09-21 10:10:58', '2022-11-22 19:33:20', '{}', 1),
(69, 1, '2020-09-21 10:11:23', '2022-11-22 19:33:21', '{}', 1),
(70, 1, '2020-09-21 10:11:47', '2022-11-22 19:33:21', '{}', 1),
(71, 1, '2020-09-21 10:12:08', '2022-11-22 19:33:21', '{}', 1),
(72, 1, '2020-09-21 10:12:45', '2022-11-22 19:33:21', '{}', 1),
(73, 1, '2020-09-21 10:13:06', '2022-11-22 19:33:21', '{}', 1),
(74, 1, '2020-09-21 10:13:33', '2022-11-22 19:33:21', '{}', 1),
(75, 1, '2020-09-21 10:13:54', '2022-11-22 19:33:21', '{}', 1),
(76, 1, '2020-09-21 10:14:18', '2022-11-22 19:33:21', '{}', 1),
(77, 1, '2020-09-21 10:15:01', '2022-11-22 19:33:22', '{}', 1);

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
  ADD CONSTRAINT `modifiers_ibfk_1` FOREIGN KEY (`id_modifier_class`) REFERENCES `modifier_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD CONSTRAINT `orderinfo_ibfk_1` FOREIGN KEY (`id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_modifier_class`
--
ALTER TABLE `product_modifier_class`
  ADD CONSTRAINT `product_modifier_class_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_modifier_class_ibfk_2` FOREIGN KEY (`id_modifier_class`) REFERENCES `modifier_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
