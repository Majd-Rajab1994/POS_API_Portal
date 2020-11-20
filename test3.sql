-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 20, 2020 at 01:48 PM
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
(1, 'La Familia', 0, 1, 1, NULL, '#ff8080'),
(2, 'kkk', 0, 1, 1, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sort`, `sku`, `id_category`, `name`, `arabic_name`, `description`, `arabic_description`, `barcode`, `images`, `stock_amount`, `price`, `uom`, `cost`, `sold_by_weight`, `attribute_type`, `is_shipping`, `is_gift`, `is_combo`, `has_upsell`, `max_price`, `size_chart`, `point_value`, `course_number`, `created_date`) VALUES
(1, 0, 1, 1, 'El Camron', 'El Camron', NULL, NULL, '00000001', NULL, 0, 30.00, 'serv', 0.00, b'0', 0, b'0', b'0', 1, b'0', NULL, NULL, NULL, NULL, '2020-09-20 12:30:58'),
(2, 0, 1, 1, 'hghjg', 'bvcbcb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
