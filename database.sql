-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 15, 2021 at 08:41 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'ohoOd79S9BjFYFKfLH15OYzXAGnHZSrn', 1, '2021-03-14 18:40:36', '2021-03-14 18:40:36', '2021-03-14 18:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Ecommerce', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(2, 'Fashion', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(3, 'Electronic', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(4, 'Commercial', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_brands`
--

CREATE TABLE `ec_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_brands`
--

INSERT INTO `ec_brands` (`id`, `name`, `description`, `website`, `logo`, `status`, `order`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Fashion live', NULL, NULL, 'brands/1.png', 'published', 0, 1, '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(2, 'Hand crafted', NULL, NULL, 'brands/2.png', 'published', 1, 1, '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(3, 'Mestonix', NULL, NULL, 'brands/3.png', 'published', 2, 1, '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(4, 'Sunshine', NULL, NULL, 'brands/4.png', 'published', 3, 1, '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(5, 'Pure', NULL, NULL, 'brands/5.png', 'published', 4, 1, '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(6, 'Anfold', NULL, NULL, 'brands/6.png', 'published', 5, 1, '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(7, 'Automotive', NULL, NULL, 'brands/7.png', 'published', 6, 1, '2021-03-14 18:40:04', '2021-03-14 18:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `ec_cart`
--

CREATE TABLE `ec_cart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_currencies`
--

CREATE TABLE `ec_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `decimals` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_currencies`
--

INSERT INTO `ec_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 1, 2, 0, 1, 1, '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(2, 'EUR', '???', 0, 2, 1, 0, 1.18, '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(3, 'VND', '???', 0, 0, 2, 0, 23203, '2021-03-14 18:40:04', '2021-03-14 18:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customers`
--

CREATE TABLE `ec_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customers`
--

INSERT INTO `ec_customers` (`id`, `name`, `email`, `password`, `avatar`, `dob`, `phone`, `remember_token`, `created_at`, `updated_at`, `confirmed_at`, `email_verify_token`) VALUES
(1, 'John Smith', 'john.smith@acenetics.com', '$2y$10$0dRkwN.6mDIQSNRengIyGOsXsZvmjuDbKqilJCFxBp.bEiUIrQDqm', 'customers/1.jpg', NULL, '+6235581691460', NULL, '2021-03-14 18:40:25', '2021-03-14 18:40:25', '2021-03-15 01:40:25', NULL),
(2, 'Horacio Dibbert', 'esta.watsica@example.org', '$2y$10$NnRxhVPG3KRA.xHjVUrp9eOoz5Sd0oD95vlRXuzeiEhrxYd/cLnlS', 'customers/1.jpg', NULL, '+7342211456166', NULL, '2021-03-14 18:40:26', '2021-03-14 18:40:26', '2021-03-15 01:40:26', NULL),
(3, 'Miss Brooke Hammes DVM', 'cmosciski@example.com', '$2y$10$XjSbrM2cBLNYKHBh30oga.OhEqv8NsQaFCLxN9PDh3GsV0Jnh7ioK', 'customers/2.jpg', NULL, '+3435385367049', NULL, '2021-03-14 18:40:26', '2021-03-14 18:40:26', '2021-03-15 01:40:26', NULL),
(4, 'Adelle Boehm', 'jaydon68@example.net', '$2y$10$/UYCa4riucnDyVDk4rsV.uPq/nDwIJJm5QsCRqyRbY7pryU9ATz2G', 'customers/3.jpg', NULL, '+7702758744740', NULL, '2021-03-14 18:40:26', '2021-03-14 18:40:26', '2021-03-15 01:40:26', NULL),
(5, 'Vida Terry', 'hayes.lulu@example.org', '$2y$10$ZCNUHtadTT/jta5PsG8LR.Nse0qr5rsP5KYUjet3W.8VPj2JYGANu', 'customers/4.jpg', NULL, '+6491271359115', NULL, '2021-03-14 18:40:27', '2021-03-14 18:40:27', '2021-03-15 01:40:27', NULL),
(6, 'Glenna Mante II', 'arden40@example.org', '$2y$10$DvP4VJfmxguYABYPbcwXjey8o6GWV6h32xyZTZyEc7hw.ke36m1ma', 'customers/5.jpg', NULL, '+6882001002171', NULL, '2021-03-14 18:40:27', '2021-03-14 18:40:27', '2021-03-15 01:40:27', NULL),
(7, 'Tracy Olson Sr.', 'tzboncak@example.net', '$2y$10$qs6B4kNADuuK9LvnlJ2ZPueO5wwsInuPDI7C2JL81qDAN655.e3D2', 'customers/6.jpg', NULL, '+3817456762947', NULL, '2021-03-14 18:40:27', '2021-03-14 18:40:27', '2021-03-15 01:40:27', NULL),
(8, 'Adan Howe', 'summer.emard@example.org', '$2y$10$tODnT0qYkDG6jth7jTpo0Ola27aKbwbopPV3i1R4Did20lI.aufDm', 'customers/7.jpg', NULL, '+5980032861901', NULL, '2021-03-14 18:40:27', '2021-03-14 18:40:27', '2021-03-15 01:40:27', NULL),
(9, 'Mr. Gerald Schowalter II', 'pwalker@example.com', '$2y$10$c7sf/o6cU7If0f/wlJRscOvkmw6rU2kmGknUNDilrJMVM2oLgIQhm', 'customers/8.jpg', NULL, '+9406793984818', NULL, '2021-03-14 18:40:28', '2021-03-14 18:40:28', '2021-03-15 01:40:28', NULL),
(10, 'Ms. Ashlee Keeling', 'luigi.pouros@example.org', '$2y$10$WlxL0LYAILVHlzVY7PrDLeknZKYsW8baJ3pU6R05yG6TAH4uLxZ4y', 'customers/9.jpg', NULL, '+5067936162309', NULL, '2021-03-14 18:40:28', '2021-03-14 18:40:28', '2021-03-15 01:40:28', NULL),
(11, 'Alison Fritsch II', 'modesta96@example.com', '$2y$10$LQA3SE9zHwjU9pWN/PZ2Eu.F2Lagk34fgjMqL7z6EQaaVWn71Jhr2', 'customers/10.jpg', NULL, '+2272712866404', NULL, '2021-03-14 18:40:28', '2021-03-14 18:40:28', '2021-03-15 01:40:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_addresses`
--

CREATE TABLE `ec_customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customer_addresses`
--

INSERT INTO `ec_customer_addresses` (`id`, `name`, `email`, `phone`, `country`, `state`, `city`, `address`, `customer_id`, `is_default`, `created_at`, `updated_at`, `zip_code`) VALUES
(1, 'John Smith', 'john.smith@acenetics.com', '+5034548786989', 'LK', 'Delaware', 'Joyton', '2243 Herzog Ramp', 1, 1, '2021-03-14 18:40:25', '2021-03-14 18:40:25', '73618'),
(2, 'John Smith', 'john.smith@acenetics.com', '+6934493640977', 'CK', 'Montana', 'East Keeleyside', '67887 Darian Street', 1, 0, '2021-03-14 18:40:25', '2021-03-14 18:40:25', '98509-0110'),
(3, 'Horacio Dibbert', 'esta.watsica@example.org', '+2930044056523', 'TF', 'South Carolina', 'Lake Phoebeville', '6927 D\'Amore Crossing', 2, 1, '2021-03-14 18:40:26', '2021-03-14 18:40:26', '69485-3794'),
(4, 'Miss Brooke Hammes DVM', 'cmosciski@example.com', '+7283132009140', 'SM', 'Mississippi', 'Schaefertown', '1089 DuBuque Orchard', 3, 1, '2021-03-14 18:40:26', '2021-03-14 18:40:26', '89272-4745'),
(5, 'Adelle Boehm', 'jaydon68@example.net', '+1825985803082', 'GM', 'Mississippi', 'Tremblayborough', '369 Dickinson Forges Apt. 895', 4, 1, '2021-03-14 18:40:26', '2021-03-14 18:40:26', '81725-9198'),
(6, 'Vida Terry', 'hayes.lulu@example.org', '+3155484047462', 'GF', 'Mississippi', 'New Rudy', '99307 Marjorie Greens Apt. 816', 5, 1, '2021-03-14 18:40:27', '2021-03-14 18:40:27', '00727'),
(7, 'Glenna Mante II', 'arden40@example.org', '+6737739103186', 'CU', 'Georgia', 'East Danborough', '92950 Schultz Square', 6, 1, '2021-03-14 18:40:27', '2021-03-14 18:40:27', '12880-2615'),
(8, 'Tracy Olson Sr.', 'tzboncak@example.net', '+7520633382656', 'GY', 'Texas', 'New Zion', '4715 Rossie Mills Suite 105', 7, 1, '2021-03-14 18:40:27', '2021-03-14 18:40:27', '11761'),
(9, 'Adan Howe', 'summer.emard@example.org', '+9700725497713', 'CG', 'Rhode Island', 'Santinahaven', '30959 Imogene Port', 8, 1, '2021-03-14 18:40:27', '2021-03-14 18:40:27', '58770'),
(10, 'Mr. Gerald Schowalter II', 'pwalker@example.com', '+8786424289442', 'AD', 'Maryland', 'South Jacqueschester', '5951 Eliseo Mills', 9, 1, '2021-03-14 18:40:28', '2021-03-14 18:40:28', '88942'),
(11, 'Ms. Ashlee Keeling', 'luigi.pouros@example.org', '+5628891435099', 'TN', 'Wisconsin', 'Port Joannie', '86955 Jackson Overpass', 10, 1, '2021-03-14 18:40:28', '2021-03-14 18:40:28', '39818-9519'),
(12, 'Alison Fritsch II', 'modesta96@example.com', '+3079067388676', 'BY', 'South Carolina', 'Johathanchester', '32369 Cecile Lock', 11, 1, '2021-03-14 18:40:28', '2021-03-14 18:40:28', '87559-5002');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_password_resets`
--

CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discounts`
--

CREATE TABLE `ec_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_used` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(10) UNSIGNED DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_customers`
--

CREATE TABLE `ec_discount_customers` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_products`
--

CREATE TABLE `ec_discount_products` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_product_collections`
--

CREATE TABLE `ec_discount_product_collections` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `product_collection_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_flash_sales`
--

CREATE TABLE `ec_flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_flash_sale_products`
--

CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` double UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `sold` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_grouped_products`
--

CREATE TABLE `ec_grouped_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_product_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `fixed_qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_orders`
--

CREATE TABLE `ec_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '1',
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_addresses`
--

CREATE TABLE `ec_order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_histories`
--

CREATE TABLE `ec_order_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_product`
--

CREATE TABLE `ec_order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `restock_quantity` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_products`
--

CREATE TABLE `ec_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `is_variation` tinyint(4) NOT NULL DEFAULT '0',
  `is_searchable` tinyint(4) NOT NULL DEFAULT '0',
  `is_show_on_list` tinyint(4) NOT NULL DEFAULT '0',
  `sale_type` tinyint(4) NOT NULL DEFAULT '0',
  `price` double UNSIGNED DEFAULT NULL,
  `sale_price` double UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wide_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_products`
--

INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `options`, `category_id`, `brand_id`, `is_variation`, `is_searchable`, `is_show_on_list`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `barcode`, `length_unit`, `wide_unit`, `height_unit`, `weight_unit`, `created_at`, `updated_at`, `tax_id`, `views`) VALUES
(1, 'Wallet handmade', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/4-a.jpg\",\"products\\/4-b.jpg\"]', 'HS-146-A0', 0, 16, 0, 1, 1, NULL, NULL, 2, 0, 0, 0, 0, 220, 178.2, NULL, NULL, 12.00, 11.00, 20.00, 754.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', 1, 28429),
(2, 'Clutch handmade', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/7-a.jpg\",\"products\\/5-b.jpg\"]', 'HS-109-A0', 0, 15, 0, 1, 1, NULL, NULL, 7, 0, 0, 0, 0, 347, 291.48, NULL, NULL, 14.00, 10.00, 18.00, 519.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', 1, 185330),
(3, 'Gucci Zip Around Wallet', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/5-a.jpg\",\"products\\/2-b.jpg\"]', 'HS-178-A0', 0, 14, 0, 1, 1, NULL, NULL, 6, 0, 0, 0, 0, 234, 182.52, NULL, NULL, 10.00, 12.00, 11.00, 861.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', 1, 56331),
(4, 'Snapshot Standard', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/5-a.jpg\",\"products\\/1-b.jpg\"]', 'HS-180-A0', 0, 11, 0, 1, 1, NULL, NULL, 1, 0, 0, 0, 0, 200, 142, NULL, NULL, 20.00, 12.00, 16.00, 653.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', 1, 150665),
(5, 'Joan Mini Camera Bag', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/1-a.jpg\",\"products\\/7-b.jpg\"]', 'HS-181-A0', 0, 13, 0, 1, 1, NULL, NULL, 6, 0, 0, 0, 0, 75, 63, NULL, NULL, 19.00, 14.00, 20.00, 766.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', 1, 177781),
(6, 'Cyan Boheme', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/3-a.jpg\",\"products\\/1-b.jpg\"]', 'HS-153-A0', 0, 13, 0, 1, 1, NULL, NULL, 7, 0, 0, 0, 0, 50, 43, NULL, NULL, 18.00, 12.00, 15.00, 859.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', 1, 38410),
(7, 'The Marc Jacobs', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/6-a.jpg\",\"products\\/7-b.jpg\"]', 'HS-108-A0', 0, 14, 0, 1, 1, NULL, NULL, 1, 0, 0, 0, 0, 50, 40, NULL, NULL, 20.00, 13.00, 15.00, 721.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', 1, 39885),
(8, 'Round Crossbody Bag', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/3-a.jpg\",\"products\\/1-b.jpg\"]', 'HS-155-A0', 0, 10, 0, 1, 1, NULL, NULL, 6, 0, 0, 0, 0, 120, 108, NULL, NULL, 18.00, 12.00, 18.00, 825.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', 1, 65646),
(9, 'Wallet handmade', NULL, NULL, 'published', '[\"products\\/4-a.jpg\",\"products\\/4-b.jpg\"]', 'HS-146-A0', 0, 16, 0, 1, 0, NULL, NULL, 2, 1, 0, 0, 0, 220, 178.2, NULL, NULL, 12.00, 11.00, 20.00, 754.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(10, 'Wallet handmade', NULL, NULL, 'published', '[\"products\\/6-a.jpg\",\"products\\/6-b.jpg\"]', 'HS-146-A0-A1', 0, 16, 0, 1, 0, NULL, NULL, 2, 1, 0, 0, 0, 220, 173.8, NULL, NULL, 12.00, 11.00, 20.00, 754.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(11, 'Wallet handmade', NULL, NULL, 'published', '[\"products\\/5-a.jpg\",\"products\\/6-b.jpg\"]', 'HS-146-A0-A2', 0, 16, 0, 1, 0, NULL, NULL, 2, 1, 0, 0, 0, 220, 193.6, NULL, NULL, 12.00, 11.00, 20.00, 754.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(12, 'Clutch handmade', NULL, NULL, 'published', '[\"products\\/7-a.jpg\",\"products\\/5-b.jpg\"]', 'HS-109-A0', 0, 15, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 347, 291.48, NULL, NULL, 14.00, 10.00, 18.00, 519.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(13, 'Clutch handmade', NULL, NULL, 'published', '[\"products\\/1-a.jpg\",\"products\\/1-b.jpg\"]', 'HS-109-A0-A1', 0, 15, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 347, 246.37, NULL, NULL, 14.00, 10.00, 18.00, 519.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(14, 'Clutch handmade', NULL, NULL, 'published', '[\"products\\/5-a.jpg\",\"products\\/7-b.jpg\"]', 'HS-109-A0-A2', 0, 15, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 347, 267.19, NULL, NULL, 14.00, 10.00, 18.00, 519.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(15, 'Gucci Zip Around Wallet', NULL, NULL, 'published', '[\"products\\/5-a.jpg\",\"products\\/2-b.jpg\"]', 'HS-178-A0', 0, 14, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 234, 182.52, NULL, NULL, 10.00, 12.00, 11.00, 861.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(16, 'Gucci Zip Around Wallet', NULL, NULL, 'published', '[\"products\\/5-a.jpg\",\"products\\/5-b.jpg\"]', 'HS-178-A0-A1', 0, 14, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 234, 198.9, NULL, NULL, 10.00, 12.00, 11.00, 861.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(17, 'Gucci Zip Around Wallet', NULL, NULL, 'published', '[\"products\\/4-a.jpg\",\"products\\/4-b.jpg\"]', 'HS-178-A0-A2', 0, 14, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 234, 201.24, NULL, NULL, 10.00, 12.00, 11.00, 861.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(18, 'Snapshot Standard', NULL, NULL, 'published', '[\"products\\/5-a.jpg\",\"products\\/1-b.jpg\"]', 'HS-180-A0', 0, 11, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 200, 142, NULL, NULL, 20.00, 12.00, 16.00, 653.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(19, 'Snapshot Standard', NULL, NULL, 'published', '[\"products\\/1-a.jpg\",\"products\\/5-b.jpg\"]', 'HS-180-A0-A1', 0, 11, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 200, 174, NULL, NULL, 20.00, 12.00, 16.00, 653.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(20, 'Joan Mini Camera Bag', NULL, NULL, 'published', '[\"products\\/1-a.jpg\",\"products\\/7-b.jpg\"]', 'HS-181-A0', 0, 13, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 75, 63, NULL, NULL, 19.00, 14.00, 20.00, 766.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(21, 'Joan Mini Camera Bag', NULL, NULL, 'published', '[\"products\\/5-a.jpg\",\"products\\/5-b.jpg\"]', 'HS-181-A0-A1', 0, 13, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 75, 65.25, NULL, NULL, 19.00, 14.00, 20.00, 766.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(22, 'Cyan Boheme', NULL, NULL, 'published', '[\"products\\/3-a.jpg\",\"products\\/1-b.jpg\"]', 'HS-153-A0', 0, 13, 0, 1, 0, NULL, NULL, 7, 1, 0, 0, 0, 50, 43, NULL, NULL, 18.00, 12.00, 15.00, 859.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(23, 'The Marc Jacobs', NULL, NULL, 'published', '[\"products\\/6-a.jpg\",\"products\\/7-b.jpg\"]', 'HS-108-A0', 0, 14, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 50, 40, NULL, NULL, 20.00, 13.00, 15.00, 721.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(24, 'The Marc Jacobs', NULL, NULL, 'published', '[\"products\\/5-a.jpg\",\"products\\/1-b.jpg\"]', 'HS-108-A0-A1', 0, 14, 0, 1, 0, NULL, NULL, 1, 1, 0, 0, 0, 50, 37, NULL, NULL, 20.00, 13.00, 15.00, 721.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(25, 'Round Crossbody Bag', NULL, NULL, 'published', '[\"products\\/3-a.jpg\",\"products\\/1-b.jpg\"]', 'HS-155-A0', 0, 10, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 120, 108, NULL, NULL, 18.00, 12.00, 18.00, 825.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(26, 'Round Crossbody Bag', NULL, NULL, 'published', '[\"products\\/4-a.jpg\",\"products\\/3-b.jpg\"]', 'HS-155-A0-A1', 0, 10, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 120, 98.4, NULL, NULL, 18.00, 12.00, 18.00, 825.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0),
(27, 'Round Crossbody Bag', NULL, NULL, 'published', '[\"products\\/7-a.jpg\",\"products\\/5-b.jpg\"]', 'HS-155-A0-A2', 0, 10, 0, 1, 0, NULL, NULL, 6, 1, 0, 0, 0, 120, 106.8, NULL, NULL, 18.00, 12.00, 18.00, 825.00, NULL, NULL, NULL, NULL, NULL, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attributes`
--

CREATE TABLE `ec_product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_attributes`
--

INSERT INTO `ec_product_attributes` (`id`, `attribute_set_id`, `title`, `slug`, `color`, `image`, `is_default`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Green', 'green', '#5FB7D4', NULL, 1, 1, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(2, 1, 'Blue', 'blue', '#333333', NULL, 0, 2, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(3, 1, 'Red', 'red', '#DA323F', NULL, 0, 3, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(4, 1, 'Black', 'back', '#2F366C', NULL, 0, 4, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(5, 1, 'Brown', 'brown', '#87554B', NULL, 0, 5, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(6, 2, 'S', 's', NULL, NULL, 1, 1, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(7, 2, 'M', 'm', NULL, NULL, 1, 2, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(8, 2, 'L', 'l', NULL, NULL, 1, 3, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(9, 2, 'XL', 'xl', NULL, NULL, 1, 4, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(10, 2, 'XXL', 'xxl', NULL, NULL, 1, 5, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attribute_sets`
--

CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_comparable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_attribute_sets`
--

INSERT INTO `ec_product_attribute_sets` (`id`, `title`, `slug`, `display_layout`, `is_searchable`, `is_comparable`, `is_use_in_product_listing`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'color', 'visual', 1, 1, 1, 'published', 0, '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(2, 'Size', 'size', 'text', 1, 1, 1, 'published', 0, '2021-03-14 18:40:06', '2021-03-14 18:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_categories`
--

CREATE TABLE `ec_product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_categories`
--

INSERT INTO `ec_product_categories` (`id`, `name`, `parent_id`, `description`, `status`, `order`, `image`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Woman wallet', 0, NULL, 'published', 1, 'product-categories/1.png', 1, '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(2, 'Office bags', 0, NULL, 'published', 2, 'product-categories/2.png', 1, '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(3, 'Hand bag', 0, NULL, 'published', 3, 'product-categories/3.png', 1, '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(4, 'Backpack', 0, NULL, 'published', 4, 'product-categories/4.png', 1, '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(5, 'Bags', 0, NULL, 'published', 5, 'product-categories/5.png', 1, '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(6, 'Wallet', 0, NULL, 'published', 6, 'product-categories/6.png', 1, '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(7, 'Men wallet', 0, NULL, 'published', 7, 'product-categories/7.png', 1, '2021-03-14 18:40:05', '2021-03-14 18:40:05');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_category_product`
--

CREATE TABLE `ec_product_category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_category_product`
--

INSERT INTO `ec_product_category_product` (`id`, `category_id`, `product_id`) VALUES
(1, 5, 1),
(2, 1, 1),
(3, 9, 1),
(4, 1, 2),
(5, 11, 2),
(6, 12, 3),
(7, 4, 3),
(8, 11, 3),
(9, 14, 4),
(10, 4, 4),
(11, 12, 4),
(12, 7, 5),
(13, 10, 5),
(14, 13, 5),
(15, 2, 6),
(16, 3, 6),
(17, 13, 6),
(18, 1, 7),
(19, 11, 7),
(20, 13, 7),
(21, 10, 8),
(22, 1, 8),
(23, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collections`
--

CREATE TABLE `ec_product_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_collections`
--

INSERT INTO `ec_product_collections` (`id`, `name`, `slug`, `description`, `image`, `status`, `created_at`, `updated_at`, `is_featured`) VALUES
(1, 'New Arrival', 'new-arrival', NULL, 'product-collections/1.jpg', 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06', 1),
(2, 'Best Sellers', 'best-sellers', NULL, 'product-collections/2.jpg', 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06', 1),
(3, 'Special Offer', 'special-offer', NULL, 'product-collections/3.jpg', 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06', 1),
(4, 'Trending Fashion', 'trending-fashion', NULL, 'product-collections/4.jpg', 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collection_products`
--

CREATE TABLE `ec_product_collection_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_collection_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_collection_products`
--

INSERT INTO `ec_product_collection_products` (`id`, `product_collection_id`, `product_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 3, 3),
(4, 2, 4),
(5, 3, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_cross_sale_relations`
--

CREATE TABLE `ec_product_cross_sale_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

INSERT INTO `ec_product_cross_sale_relations` (`id`, `from_product_id`, `to_product_id`) VALUES
(1, 1, 7),
(2, 1, 8),
(3, 1, 6),
(4, 1, 2),
(5, 2, 5),
(6, 2, 3),
(7, 2, 8),
(8, 3, 4),
(9, 3, 5),
(10, 3, 2),
(11, 4, 1),
(12, 4, 3),
(13, 5, 6),
(14, 5, 8),
(15, 5, 2),
(16, 6, 5),
(17, 6, 8),
(18, 6, 1),
(19, 7, 1),
(20, 7, 2),
(21, 7, 6),
(22, 8, 5),
(23, 8, 4),
(24, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_related_relations`
--

CREATE TABLE `ec_product_related_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tags`
--

CREATE TABLE `ec_product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_tags`
--

INSERT INTO `ec_product_tags` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wallet', NULL, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(2, 'Bags', NULL, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(3, 'Shoes', NULL, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(4, 'Clothes', NULL, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(5, 'Hand bag', NULL, 'published', '2021-03-14 18:40:06', '2021-03-14 18:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tag_product`
--

CREATE TABLE `ec_product_tag_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_tag_product`
--

INSERT INTO `ec_product_tag_product` (`product_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(1, 5),
(2, 3),
(2, 6),
(3, 1),
(3, 4),
(4, 1),
(4, 3),
(4, 6),
(5, 3),
(5, 4),
(5, 5),
(6, 1),
(6, 4),
(6, 6),
(7, 1),
(7, 2),
(7, 4),
(8, 1),
(8, 5),
(8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_up_sale_relations`
--

CREATE TABLE `ec_product_up_sale_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_variations`
--

CREATE TABLE `ec_product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `configurable_product_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_variations`
--

INSERT INTO `ec_product_variations` (`id`, `product_id`, `configurable_product_id`, `is_default`) VALUES
(1, 9, 1, 1),
(2, 10, 1, 0),
(3, 11, 1, 0),
(4, 12, 2, 1),
(5, 13, 2, 0),
(6, 14, 2, 0),
(7, 15, 3, 1),
(8, 16, 3, 0),
(9, 17, 3, 0),
(10, 18, 4, 1),
(11, 19, 4, 0),
(12, 20, 5, 1),
(13, 21, 5, 0),
(14, 22, 6, 1),
(15, 23, 7, 1),
(16, 24, 7, 0),
(17, 25, 8, 1),
(18, 26, 8, 0),
(19, 27, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_variation_items`
--

CREATE TABLE `ec_product_variation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_variation_items`
--

INSERT INTO `ec_product_variation_items` (`id`, `attribute_id`, `variation_id`) VALUES
(1, 1, 1),
(2, 9, 1),
(3, 3, 2),
(4, 9, 2),
(5, 5, 3),
(6, 8, 3),
(7, 4, 4),
(8, 7, 4),
(9, 5, 5),
(10, 10, 5),
(11, 5, 6),
(12, 10, 6),
(13, 5, 7),
(14, 6, 7),
(15, 5, 8),
(16, 6, 8),
(17, 5, 9),
(18, 7, 9),
(19, 1, 10),
(20, 6, 10),
(21, 2, 11),
(22, 10, 11),
(23, 1, 12),
(24, 6, 12),
(25, 1, 13),
(26, 6, 13),
(27, 3, 14),
(28, 6, 14),
(29, 4, 15),
(30, 7, 15),
(31, 3, 16),
(32, 7, 16),
(33, 1, 17),
(34, 9, 17),
(35, 5, 18),
(36, 10, 18),
(37, 1, 19),
(38, 9, 19);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_with_attribute`
--

CREATE TABLE `ec_product_with_attribute` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_with_attribute`
--

INSERT INTO `ec_product_with_attribute` (`id`, `attribute_id`, `product_id`) VALUES
(1, 2, 1),
(2, 10, 1),
(3, 2, 2),
(4, 8, 2),
(5, 2, 3),
(6, 9, 3),
(7, 2, 4),
(8, 8, 4),
(9, 3, 5),
(10, 8, 5),
(11, 2, 6),
(12, 10, 6),
(13, 2, 7),
(14, 7, 7),
(15, 3, 8),
(16, 6, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_with_attribute_set`
--

CREATE TABLE `ec_product_with_attribute_set` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

INSERT INTO `ec_product_with_attribute_set` (`id`, `attribute_set_id`, `product_id`, `order`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(3, 1, 2, 0),
(4, 2, 2, 0),
(5, 1, 3, 0),
(6, 2, 3, 0),
(7, 1, 4, 0),
(8, 2, 4, 0),
(9, 1, 5, 0),
(10, 2, 5, 0),
(11, 1, 6, 0),
(12, 2, 6, 0),
(13, 1, 7, 0),
(14, 2, 7, 0),
(15, 1, 8, 0),
(16, 2, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_reviews`
--

CREATE TABLE `ec_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_reviews`
--

INSERT INTO `ec_reviews` (`id`, `customer_id`, `product_id`, `star`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 2, 2.00, 'Molestias odio aut sequi est quae sed at accusantium. Doloremque et consequatur officiis quidem voluptas iusto. Saepe in temporibus aliquid amet.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(2, 11, 4, 2.00, 'Excepturi voluptas similique non atque harum sapiente eos. Optio et ut nesciunt nemo. Soluta voluptate nam facilis tempora distinctio.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(3, 6, 10, 5.00, 'Sed eos voluptates eaque non nemo. Impedit harum ducimus voluptatibus. In omnis omnis quae voluptas dicta. Modi consequuntur et modi aut aut dolorum.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(4, 4, 2, 3.00, 'Optio rerum voluptas ut omnis enim recusandae ea. Nostrum quos ut corrupti occaecati quo rerum.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(5, 8, 7, 3.00, 'Quas enim voluptatem fugit et mollitia. Aut ea aut ad fugiat magnam culpa neque. Ut similique natus consequatur.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(6, 10, 10, 4.00, 'Animi odio nesciunt quae. Consectetur laborum ex qui tempora. Rerum temporibus est molestiae.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(7, 9, 10, 1.00, 'Sunt aliquam quaerat in. Optio nemo et aut quos laudantium.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(8, 11, 4, 5.00, 'Praesentium ut doloribus qui autem. Voluptas consequatur aspernatur sed unde animi et alias. Optio sequi aut laborum aliquam quia et veniam.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(9, 3, 3, 2.00, 'Beatae et culpa recusandae qui sint. Consequatur odit magnam esse repellat harum nihil. Dolorum consequatur sapiente sint.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(10, 10, 10, 1.00, 'Enim optio eveniet quasi magni nisi. Eaque consequatur ut reprehenderit cupiditate explicabo quos fugit et. Iure vitae quaerat in voluptatibus et et.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(11, 9, 5, 1.00, 'Aut aut aliquid dolorum unde deleniti in. Corporis dolores itaque assumenda dolor. Voluptatum commodi perferendis architecto ut cum.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(12, 6, 5, 2.00, 'In ut praesentium molestias reprehenderit iusto adipisci odit in. Nihil voluptatum est sint aut pariatur eos est aut.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(13, 9, 10, 2.00, 'Ullam ut sint aut consequatur animi. Totam optio non sed ut. Quaerat qui ut vel labore est eos.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(14, 9, 9, 4.00, 'Nisi sapiente quidem nam consequatur omnis. Harum vel dolor officia et. At dolore aut aliquid qui. Numquam neque voluptatem qui alias qui enim quia.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(15, 8, 10, 2.00, 'Exercitationem deserunt incidunt et sequi autem. Alias quasi aut deleniti harum sint maiores. Quod ad autem inventore modi.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(16, 10, 6, 4.00, 'Nesciunt possimus sed et molestiae. Accusamus dolor illum quia natus sit neque. Necessitatibus illo eligendi laborum. Qui et culpa quia in quis.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(17, 4, 9, 2.00, 'Iste aliquid sit praesentium aut et reiciendis quis. Maxime debitis rerum hic voluptas. Et eos provident molestiae expedita cumque et.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(18, 3, 4, 5.00, 'Et esse delectus voluptatibus ad quis. Ex eos laborum nostrum minima dolorem perferendis assumenda. Sed molestiae porro iusto et veritatis odit.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(19, 7, 1, 4.00, 'Natus ut qui beatae blanditiis. Ex voluptatem sequi corrupti nam natus dolores. Et voluptas quos quidem magni consequatur odio.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(20, 4, 2, 2.00, 'Sapiente aliquid facilis dignissimos veritatis aut vel quisquam. Libero voluptates nesciunt quia asperiores alias aut.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(21, 10, 10, 4.00, 'Quia voluptatem optio impedit saepe. Deserunt incidunt minus ducimus rerum consequatur nostrum voluptatum.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(22, 6, 9, 4.00, 'Omnis facilis ipsam veniam repellendus. Voluptates doloribus nisi sequi minus eveniet voluptas ea doloremque. Consequatur cumque facere magnam modi.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(23, 10, 5, 3.00, 'Voluptatum qui deleniti adipisci qui. Eligendi aliquid repudiandae amet architecto impedit dolores eum. Tempora earum repellendus totam magni.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(24, 3, 9, 3.00, 'Et repellendus temporibus cum corrupti. Porro laborum vero voluptas sed. Et laborum vel nam harum.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(25, 5, 4, 2.00, 'Adipisci sequi impedit nemo aliquam dolores cum. Et ut atque consequatur non vero porro officiis. Et omnis cupiditate magnam.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(26, 5, 10, 1.00, 'Blanditiis ut illo sit id veritatis non vero. At quidem consequuntur expedita facilis cupiditate. Aut optio expedita non voluptas eius doloribus.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(27, 9, 6, 4.00, 'Libero voluptatem sunt nihil iure nesciunt cupiditate asperiores. Accusamus minima maiores consequatur iusto aut. Qui deserunt quam soluta hic.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(28, 8, 2, 3.00, 'Numquam et expedita voluptas est. Quibusdam illo assumenda corrupti libero sit eveniet. Ullam ex officia tempora vitae.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(29, 8, 9, 1.00, 'In id occaecati et culpa delectus. Molestiae assumenda et nostrum quaerat veritatis nemo ipsa.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(30, 10, 9, 1.00, 'Et animi placeat voluptates esse. Modi possimus non eos tenetur dolorem quas. Quae est ut totam numquam qui magni fuga.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(31, 6, 1, 1.00, 'Voluptatem non ab qui sit nulla ipsum eius. Et maiores esse perspiciatis dolores. Cum beatae itaque esse alias quos quae.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(32, 4, 2, 4.00, 'Ut culpa est odit fugit aut alias laborum. Accusantium occaecati et eum quod. Quia mollitia saepe odio id aut sed quos.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(33, 6, 2, 2.00, 'Fugiat est rem ut enim itaque minima expedita. Doloribus est nihil numquam tempore amet adipisci.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(34, 11, 3, 2.00, 'Aliquam dicta ullam dolorum dignissimos voluptatibus et. Voluptatibus voluptas aut nesciunt dicta.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(35, 10, 3, 3.00, 'Et qui nostrum laudantium. Non illo corrupti ab consequatur. Minima nulla et excepturi sed. Possimus vitae consectetur dicta eos dolores id.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(36, 7, 10, 2.00, 'Eveniet est omnis delectus qui. Est cumque est facere debitis. Iste ut molestiae eos qui et repudiandae fugiat.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(37, 9, 3, 2.00, 'In repellendus sunt mollitia animi. Labore et consectetur sunt fuga. Et cum aliquid et ad quas.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(38, 2, 7, 3.00, 'Dolor accusamus perspiciatis magnam sint culpa rem. Consectetur incidunt ea quia. Eveniet perferendis et est ipsa in ut.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(39, 4, 2, 1.00, 'Aut modi vel sequi ut. Atque perferendis nesciunt minus qui rerum sed iure totam. Ea corporis qui ut nostrum maiores ex aut. Magni quo eos et quo.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(40, 10, 10, 3.00, 'Quas est culpa doloremque harum veritatis. Maiores rerum corrupti magni animi temporibus vero. Aliquam eos dignissimos nemo iure et asperiores.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(41, 11, 3, 5.00, 'Excepturi quisquam et quae et eaque mollitia. Ex nulla at dolorem consequatur illum est fugiat. Ut velit optio deserunt placeat velit ea.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(42, 3, 2, 5.00, 'Culpa suscipit illo minus aspernatur quo. Omnis voluptates quo debitis ipsam nobis. Reiciendis quas cupiditate voluptates est modi voluptate.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(43, 10, 7, 2.00, 'Ipsum ut voluptatem quis culpa cupiditate fugiat quasi. Aliquam eum accusamus quod maxime. Et et ea itaque facere qui in itaque.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(44, 4, 7, 5.00, 'Omnis enim consequatur autem aut enim ipsam. Eaque vitae iusto nihil ducimus. Dicta quaerat voluptatum tempore architecto voluptatem.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(45, 2, 3, 4.00, 'Voluptatem voluptas non sunt. Asperiores at numquam nisi voluptate. Vel architecto enim nobis perferendis veniam.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(46, 2, 4, 3.00, 'Possimus qui culpa ducimus. Saepe blanditiis consequuntur et eius voluptatibus quibusdam. Laboriosam aut vitae voluptatem quaerat saepe laborum.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(47, 6, 6, 4.00, 'Eum sit odio recusandae est. Provident ipsam magni cum. Quos blanditiis rerum occaecati dolorem. Dicta a modi sit iure recusandae.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(48, 3, 7, 4.00, 'Et suscipit optio dolores reiciendis deleniti optio. Id omnis quisquam repellendus ex. Soluta ut non voluptas.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(49, 10, 7, 3.00, 'Deserunt tempore iusto quis quasi aspernatur quaerat laboriosam. Blanditiis hic nulla omnis ut est qui.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28'),
(50, 2, 6, 2.00, 'Odio in ut illum repellendus ipsum dolores in. Blanditiis rerum omnis quos ut in est. Amet modi ad dolorem aut facere occaecati.', 'published', '2021-03-14 18:40:28', '2021-03-14 18:40:28');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipments`
--

CREATE TABLE `ec_shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipment_histories`
--

CREATE TABLE `ec_shipment_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping`
--

CREATE TABLE `ec_shipping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipping`
--

INSERT INTO `ec_shipping` (`id`, `title`, `country`, `created_at`, `updated_at`) VALUES
(1, 'All', NULL, '2021-03-14 18:40:28', '2021-03-14 18:40:28');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping_rules`
--

CREATE TABLE `ec_shipping_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `type` enum('base_on_price','base_on_weight') COLLATE utf8mb4_unicode_ci DEFAULT 'base_on_price',
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipping_rules`
--

INSERT INTO `ec_shipping_rules` (`id`, `name`, `shipping_id`, `type`, `currency_id`, `from`, `to`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Delivery', 1, 'base_on_price', NULL, '0.00', NULL, '0.00', '2021-03-14 18:40:28', '2021-03-14 18:40:28');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping_rule_items`
--

CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_rule_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_store_locators`
--

CREATE TABLE `ec_store_locators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_store_locators`
--

INSERT INTO `ec_store_locators` (`id`, `name`, `email`, `phone`, `address`, `country`, `state`, `city`, `is_primary`, `is_shipping_location`, `created_at`, `updated_at`) VALUES
(1, 'HASA SG', 'sales@acenetics.com', '18006268', 'North Link Building, 10 Admiralty Street', 'SG', 'Singapore', 'Singapore', 1, 1, '2021-03-14 18:40:36', '2021-03-14 18:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `ec_taxes`
--

CREATE TABLE `ec_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_taxes`
--

INSERT INTO `ec_taxes` (`id`, `title`, `percentage`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VAT', 10.000000, 1, 'published', '2021-03-14 18:40:24', '2021-03-14 18:40:24'),
(2, 'None', 0.000000, 2, 'published', '2021-03-14 18:40:24', '2021-03-14 18:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `ec_wish_lists`
--

CREATE TABLE `ec_wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, '1', 1, 'image/png', 3509, 'brands/1.png', '[]', '2021-03-14 18:40:02', '2021-03-14 18:40:02', NULL),
(2, 0, '2', 1, 'image/png', 3505, 'brands/2.png', '[]', '2021-03-14 18:40:03', '2021-03-14 18:40:03', NULL),
(3, 0, '3', 1, 'image/png', 2585, 'brands/3.png', '[]', '2021-03-14 18:40:03', '2021-03-14 18:40:03', NULL),
(4, 0, '4', 1, 'image/png', 6427, 'brands/4.png', '[]', '2021-03-14 18:40:03', '2021-03-14 18:40:03', NULL),
(5, 0, '5', 1, 'image/png', 3246, 'brands/5.png', '[]', '2021-03-14 18:40:03', '2021-03-14 18:40:03', NULL),
(6, 0, '6', 1, 'image/png', 3276, 'brands/6.png', '[]', '2021-03-14 18:40:03', '2021-03-14 18:40:03', NULL),
(7, 0, '7', 1, 'image/png', 3120, 'brands/7.png', '[]', '2021-03-14 18:40:04', '2021-03-14 18:40:04', NULL),
(8, 0, '1', 2, 'image/png', 24529, 'product-categories/1.png', '[]', '2021-03-14 18:40:04', '2021-03-14 18:40:04', NULL),
(9, 0, '2', 2, 'image/png', 22406, 'product-categories/2.png', '[]', '2021-03-14 18:40:04', '2021-03-14 18:40:04', NULL),
(10, 0, '3', 2, 'image/png', 23795, 'product-categories/3.png', '[]', '2021-03-14 18:40:04', '2021-03-14 18:40:04', NULL),
(11, 0, '4', 2, 'image/png', 29386, 'product-categories/4.png', '[]', '2021-03-14 18:40:05', '2021-03-14 18:40:05', NULL),
(12, 0, '5', 2, 'image/png', 28764, 'product-categories/5.png', '[]', '2021-03-14 18:40:05', '2021-03-14 18:40:05', NULL),
(13, 0, '6', 2, 'image/png', 21674, 'product-categories/6.png', '[]', '2021-03-14 18:40:05', '2021-03-14 18:40:05', NULL),
(14, 0, '7', 2, 'image/png', 26121, 'product-categories/7.png', '[]', '2021-03-14 18:40:05', '2021-03-14 18:40:05', NULL),
(15, 0, '1', 3, 'image/jpeg', 134711, 'product-collections/1.jpg', '[]', '2021-03-14 18:40:06', '2021-03-14 18:40:06', NULL),
(16, 0, '2', 3, 'image/jpeg', 9190, 'product-collections/2.jpg', '[]', '2021-03-14 18:40:06', '2021-03-14 18:40:06', NULL),
(17, 0, '3', 3, 'image/jpeg', 67348, 'product-collections/3.jpg', '[]', '2021-03-14 18:40:06', '2021-03-14 18:40:06', NULL),
(18, 0, '4', 3, 'image/jpeg', 21888, 'product-collections/4.jpg', '[]', '2021-03-14 18:40:06', '2021-03-14 18:40:06', NULL),
(19, 0, '1-a', 4, 'image/jpeg', 40289, 'products/1-a.jpg', '[]', '2021-03-14 18:40:06', '2021-03-14 18:40:06', NULL),
(20, 0, '1-b', 4, 'image/jpeg', 35414, 'products/1-b.jpg', '[]', '2021-03-14 18:40:07', '2021-03-14 18:40:07', NULL),
(21, 0, '10-a', 4, 'image/jpeg', 115491, 'products/10-a.jpg', '[]', '2021-03-14 18:40:07', '2021-03-14 18:40:07', NULL),
(22, 0, '10-b', 4, 'image/jpeg', 125726, 'products/10-b.jpg', '[]', '2021-03-14 18:40:08', '2021-03-14 18:40:08', NULL),
(23, 0, '10-c', 4, 'image/jpeg', 217925, 'products/10-c.jpg', '[]', '2021-03-14 18:40:08', '2021-03-14 18:40:08', NULL),
(24, 0, '11-a', 4, 'image/jpeg', 98441, 'products/11-a.jpg', '[]', '2021-03-14 18:40:08', '2021-03-14 18:40:08', NULL),
(25, 0, '2-a', 4, 'image/jpeg', 58637, 'products/2-a.jpg', '[]', '2021-03-14 18:40:09', '2021-03-14 18:40:09', NULL),
(26, 0, '2-b', 4, 'image/jpeg', 68052, 'products/2-b.jpg', '[]', '2021-03-14 18:40:09', '2021-03-14 18:40:09', NULL),
(27, 0, '2-c', 4, 'image/jpeg', 61214, 'products/2-c.jpg', '[]', '2021-03-14 18:40:10', '2021-03-14 18:40:10', NULL),
(28, 0, '2-d', 4, 'image/jpeg', 69617, 'products/2-d.jpg', '[]', '2021-03-14 18:40:10', '2021-03-14 18:40:10', NULL),
(29, 0, '3-a', 4, 'image/jpeg', 76513, 'products/3-a.jpg', '[]', '2021-03-14 18:40:12', '2021-03-14 18:40:12', NULL),
(30, 0, '3-b', 4, 'image/jpeg', 56238, 'products/3-b.jpg', '[]', '2021-03-14 18:40:13', '2021-03-14 18:40:13', NULL),
(31, 0, '3-c', 4, 'image/jpeg', 72882, 'products/3-c.jpg', '[]', '2021-03-14 18:40:14', '2021-03-14 18:40:14', NULL),
(32, 0, '3-d', 4, 'image/jpeg', 62320, 'products/3-d.jpg', '[]', '2021-03-14 18:40:15', '2021-03-14 18:40:15', NULL),
(33, 0, '4-a', 4, 'image/jpeg', 109441, 'products/4-a.jpg', '[]', '2021-03-14 18:40:16', '2021-03-14 18:40:16', NULL),
(34, 0, '4-b', 4, 'image/jpeg', 74366, 'products/4-b.jpg', '[]', '2021-03-14 18:40:17', '2021-03-14 18:40:17', NULL),
(35, 0, '4-c', 4, 'image/jpeg', 98336, 'products/4-c.jpg', '[]', '2021-03-14 18:40:18', '2021-03-14 18:40:18', NULL),
(36, 0, '5-a', 4, 'image/jpeg', 114530, 'products/5-a.jpg', '[]', '2021-03-14 18:40:18', '2021-03-14 18:40:18', NULL),
(37, 0, '5-b', 4, 'image/jpeg', 136199, 'products/5-b.jpg', '[]', '2021-03-14 18:40:19', '2021-03-14 18:40:19', NULL),
(38, 0, '5-c', 4, 'image/jpeg', 47358, 'products/5-c.jpg', '[]', '2021-03-14 18:40:20', '2021-03-14 18:40:20', NULL),
(39, 0, '6-a', 4, 'image/jpeg', 31263, 'products/6-a.jpg', '[]', '2021-03-14 18:40:21', '2021-03-14 18:40:21', NULL),
(40, 0, '6-b', 4, 'image/jpeg', 31704, 'products/6-b.jpg', '[]', '2021-03-14 18:40:21', '2021-03-14 18:40:21', NULL),
(41, 0, '7-a', 4, 'image/jpeg', 161543, 'products/7-a.jpg', '[]', '2021-03-14 18:40:22', '2021-03-14 18:40:22', NULL),
(42, 0, '7-b', 4, 'image/jpeg', 161029, 'products/7-b.jpg', '[]', '2021-03-14 18:40:22', '2021-03-14 18:40:22', NULL),
(43, 0, '7-c', 4, 'image/jpeg', 121927, 'products/7-c.jpg', '[]', '2021-03-14 18:40:22', '2021-03-14 18:40:22', NULL),
(44, 0, '8-a', 4, 'image/jpeg', 191505, 'products/8-a.jpg', '[]', '2021-03-14 18:40:23', '2021-03-14 18:40:23', NULL),
(45, 0, '9-a', 4, 'image/jpeg', 104416, 'products/9-a.jpg', '[]', '2021-03-14 18:40:23', '2021-03-14 18:40:23', NULL),
(46, 0, '1', 5, 'image/jpeg', 11752, 'customers/1.jpg', '[]', '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL),
(47, 0, '10', 5, 'image/jpeg', 27814, 'customers/10.jpg', '[]', '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL),
(48, 0, '2', 5, 'image/jpeg', 19005, 'customers/2.jpg', '[]', '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL),
(49, 0, '3', 5, 'image/jpeg', 20400, 'customers/3.jpg', '[]', '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL),
(50, 0, '4', 5, 'image/jpeg', 26819, 'customers/4.jpg', '[]', '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL),
(51, 0, '5', 5, 'image/jpeg', 14367, 'customers/5.jpg', '[]', '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL),
(52, 0, '6', 5, 'image/jpeg', 12367, 'customers/6.jpg', '[]', '2021-03-14 18:40:25', '2021-03-14 18:40:25', NULL),
(53, 0, '7', 5, 'image/jpeg', 20652, 'customers/7.jpg', '[]', '2021-03-14 18:40:25', '2021-03-14 18:40:25', NULL),
(54, 0, '8', 5, 'image/jpeg', 21164, 'customers/8.jpg', '[]', '2021-03-14 18:40:25', '2021-03-14 18:40:25', NULL),
(55, 0, '9', 5, 'image/jpeg', 6084, 'customers/9.jpg', '[]', '2021-03-14 18:40:25', '2021-03-14 18:40:25', NULL),
(56, 0, '1', 6, 'image/jpeg', 709173, 'sliders/1.jpg', '[]', '2021-03-14 18:40:28', '2021-03-14 18:40:28', NULL),
(57, 0, '2', 6, 'image/jpeg', 1019757, 'sliders/2.jpg', '[]', '2021-03-14 18:40:29', '2021-03-14 18:40:29', NULL),
(58, 0, '3', 6, 'image/jpeg', 435599, 'sliders/3.jpg', '[]', '2021-03-14 18:40:30', '2021-03-14 18:40:30', NULL),
(59, 0, '1', 7, 'image/jpeg', 82629, 'news/1.jpg', '[]', '2021-03-14 18:40:31', '2021-03-14 18:40:31', NULL),
(60, 0, '2', 7, 'image/jpeg', 119904, 'news/2.jpg', '[]', '2021-03-14 18:40:31', '2021-03-14 18:40:31', NULL),
(61, 0, '3', 7, 'image/jpeg', 89543, 'news/3.jpg', '[]', '2021-03-14 18:40:31', '2021-03-14 18:40:31', NULL),
(62, 0, '4', 7, 'image/jpeg', 51573, 'news/4.jpg', '[]', '2021-03-14 18:40:31', '2021-03-14 18:40:31', NULL),
(63, 0, '5', 7, 'image/jpeg', 41164, 'news/5.jpg', '[]', '2021-03-14 18:40:32', '2021-03-14 18:40:32', NULL),
(64, 0, '6', 7, 'image/jpeg', 80696, 'news/6.jpg', '[]', '2021-03-14 18:40:32', '2021-03-14 18:40:32', NULL),
(65, 0, 'favicon', 8, 'image/png', 14500, 'general/favicon.png', '[]', '2021-03-14 18:40:32', '2021-03-14 18:40:32', NULL),
(66, 0, 'logo', 8, 'image/png', 333780, 'general/logo.png', '[]', '2021-03-14 18:40:32', '2021-03-14 18:40:32', NULL),
(67, 0, 'open-graph-image', 8, 'image/png', 580691, 'general/open-graph-image.png', '[]', '2021-03-14 18:40:35', '2021-03-14 18:40:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'brands', 'brands', 0, '2021-03-14 18:40:02', '2021-03-14 18:40:02', NULL),
(2, 0, 'product-categories', 'product-categories', 0, '2021-03-14 18:40:04', '2021-03-14 18:40:04', NULL),
(3, 0, 'product-collections', 'product-collections', 0, '2021-03-14 18:40:06', '2021-03-14 18:40:06', NULL),
(4, 0, 'products', 'products', 0, '2021-03-14 18:40:06', '2021-03-14 18:40:06', NULL),
(5, 0, 'customers', 'customers', 0, '2021-03-14 18:40:24', '2021-03-14 18:40:24', NULL),
(6, 0, 'sliders', 'sliders', 0, '2021-03-14 18:40:28', '2021-03-14 18:40:28', NULL),
(7, 0, 'news', 'news', 0, '2021-03-14 18:40:31', '2021-03-14 18:40:31', NULL),
(8, 0, 'general', 'general', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main menu', 'main-menu', 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(2, 'Customer services', 'customer-services', 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'main-menu', '2021-03-14 18:40:32', '2021-03-14 18:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `reference_id` int(10) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, NULL, NULL, '/', NULL, 0, 'Home', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(2, 1, 0, NULL, NULL, '/products', NULL, 0, 'Products', NULL, '_self', 1, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(3, 1, 2, 1, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/woman-wallet', NULL, 0, 'Woman wallet', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(4, 1, 2, 2, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/office-bags', NULL, 1, 'Office bags', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(5, 1, 2, 3, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/hand-bag', NULL, 2, 'Hand bag', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(6, 1, 2, 4, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/backpack', NULL, 3, 'Backpack', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(7, 1, 0, 2, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(8, 1, 0, 3, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(9, 2, 0, NULL, NULL, '/login', NULL, 0, 'Login', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(10, 2, 0, NULL, NULL, '/register', NULL, 0, 'Register', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(11, 2, 0, 2, 'Botble\\Page\\Models\\Page', '/blog', NULL, 0, 'Blog', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(12, 2, 0, 3, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2021-03-14 18:40:32', '2021-03-14 18:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2015_06_18_033822_create_blog_table', 1),
(6, '2015_06_29_025744_create_audit_history', 1),
(7, '2016_06_10_230148_create_acl_tables', 1),
(8, '2016_06_14_230857_create_menus_table', 1),
(9, '2016_06_17_091537_create_contacts_table', 1),
(10, '2016_06_28_221418_create_pages_table', 1),
(11, '2016_10_05_074239_create_setting_table', 1),
(12, '2016_10_07_193005_create_translations_table', 1),
(13, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(14, '2016_12_16_084601_create_widgets_table', 1),
(15, '2017_05_09_070343_create_media_tables', 1),
(16, '2017_05_18_080441_create_payment_tables', 1),
(17, '2017_07_11_140018_create_simple_slider_table', 1),
(18, '2017_10_24_154832_create_newsletter_table', 1),
(19, '2017_11_03_070450_create_slug_table', 1),
(20, '2019_01_05_053554_create_jobs_table', 1),
(21, '2019_08_19_000000_create_failed_jobs_table', 1),
(22, '2020_03_05_041139_create_ecommerce_tables', 1),
(23, '2020_09_22_135635_update_taxes_table', 1),
(24, '2020_09_29_101006_add_views_into_ec_products_table', 1),
(25, '2020_10_01_152311_make_column_image_in_product_attributes_table_nullable', 1),
(26, '2020_10_06_073439_improve_ecommerce_database', 1),
(27, '2020_10_18_134416_fix_audit_logs_table', 1),
(28, '2020_11_01_040415_update_table_ec_order_addresses', 1),
(29, '2020_11_04_091510_make_column_phone_in_order_addresses_nullable', 1),
(30, '2020_11_30_015801_update_table_ec_product_categories', 1),
(31, '2021_01_01_044147_ecommerce_create_flash_sale_table', 1),
(32, '2021_01_17_082713_add_column_is_featured_to_product_collections_table', 1),
(33, '2021_01_18_024333_add_zip_code_into_table_customer_addresses', 1),
(34, '2021_02_16_092633_remove_default_value_for_author_type', 1),
(35, '2021_02_18_073505_update_table_ec_reviews', 1),
(36, '2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers', 1),
(37, '2021_03_10_025153_change_column_tax_amount', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `is_featured`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Homepage', '<div>[simple-slider key=\"home-slider\"][/simple-slider]</div><div>[featured-product-categories title=\"Top Categories\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius.\"][/featured-product-categories]</div><div>[product-collections title=\"A change of Season\" description=\"Update your wardrobe with new seasonal trend\"][/product-collections]</div><div>[featured-products title=\"Our Picks For You\" description=\"Always find the best ways for you\" limit=\"8\"][/featured-products]</div><div>[trending-products title=\"Trending Products\" description=\"Products on trending\" limit=\"4\"][/trending-products]</div><div>[featured-brands title=\"Our Brands\"][/featured-brands]</div><div>[news title=\"Visit Our Blog\" description=\"Our Blog updated the newest trend of the world regularly\"][/news]</div><div>[our-features items=\'{\"title\": \"FREE SHIPPING\", \"description\": \"Free shipping on all US order or order above $200\", \"icon\": \"feather icon icon-truck\"}; {\"title\": \"SUPPORT 24/7\", \"description\": \"Contact us 24 hours a day, 7 days a week\", \"icon\": \"feather icon icon-life-buoy\"};{\"title\": \"30 DAYS RETURN\", \"description\": \"Simply return it within 30 days for an exchange\", \"icon\": \"feather icon icon-refresh-ccw\"};{\"title\": \"100% PAYMENT SECURE\", \"description\": \"We ensure secure payment with PEV\", \"icon\": \"feather icon icon-shield\"}\'][/our-features]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(2, 'Blog', '<p style=\"text-align: center\">We always share fashion tips with the hope you guys will find the best style for yourself.<br />Besides, we update the fashion trend as soon as we can.<br />Enjoy your journey!</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(3, 'Contact', '<p>[contact-form][/contact-form]</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(4, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `charge_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, '4 Expert Tips On How To Choose The Right Men???s Wallet', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 1299, NULL, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(2, 'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag', 'There isn???t much a girl can???t handle with the right accessories. That???s why the perfect women???s clutch bag is a wardrobe essential for first dates and spring weddings.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 1054, NULL, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(3, 'The Top 2020 Handbag Trends to Know', 'For the handbag obsessives, let\'s dive into the latter a little more. This year will bring a fresh array of bag designs, and already we\'ve gotten a sneak peek of what both spring and fall 2020 collections have to offer/', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 1772, NULL, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(4, 'How to Match the Color of Your Handbag With an Outfit', 'To match your multi-colored purses with your favorite outfits, simply select a complementary handbag hue that will make your outfit pop for work or the weekend.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 2320, NULL, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(5, 'How to Care for Leather Bags', 'A leather bag is a special, near-universally beloved object, appreciated in equal measure by bon-vivants of both sexes, who cherish the supple hand, understated burnish and heady smell that can only emanate from premium quality skin.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 313, NULL, '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(6, 'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends', 'Summer is just around the corner, and there\'s no easier way to amp up your new-season look than with a chic, new handbag. Whether you\'re wearing basic sweat shorts and a tank top or a pretty floral maxi dress, a bag is an effortless way to add interest to all your summer ensembles.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 484, NULL, '2021-03-14 18:40:32', '2021-03-14 18:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `category_id`, `post_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 1, 3),
(4, 4, 4),
(5, 4, 5),
(6, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `tag_id`, `post_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 1, 2),
(7, 2, 2),
(8, 3, 2),
(9, 4, 2),
(10, 5, 2),
(11, 1, 3),
(12, 2, 3),
(13, 3, 3),
(14, 4, 3),
(15, 5, 3),
(16, 1, 4),
(17, 2, 4),
(18, 3, 4),
(19, 4, 4),
(20, 5, 4),
(21, 1, 5),
(22, 2, 5),
(23, 3, 5),
(24, 4, 5),
(25, 5, 5),
(26, 1, 6),
(27, 2, 6),
(28, 3, 6),
(29, 4, 6),
(30, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'activated_plugins', '[\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"mollie\",\"newsletter\",\"payment\",\"paystack\",\"razorpay\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"translation\"]', NULL, NULL),
(4, 'theme', 'september', NULL, NULL),
(5, 'theme-september-site_title', 'HASA Fashion shop', NULL, NULL),
(6, 'theme-september-favicon', 'general/favicon.png', NULL, NULL),
(7, 'theme-september-logo', 'general/logo.png', NULL, NULL),
(8, 'theme-september-seo_og_image', 'general/open-graph-image.png', NULL, NULL),
(9, 'theme-september-address', 'North Link Building, 10 Admiralty Street, 757695 Singapore', NULL, NULL),
(10, 'theme-september-hotline', '18006268', NULL, NULL),
(11, 'theme-september-email', 'sales@acenetics.com', NULL, NULL),
(12, 'theme-september-facebook', 'https://facebook.com', NULL, NULL),
(13, 'theme-september-twitter', 'https://twitter.com', NULL, NULL),
(14, 'theme-september-youtube', 'https://youtube.com', NULL, NULL),
(15, 'theme-september-linkedin', 'https://linkedin.com', NULL, NULL),
(16, 'theme-september-pinterest', 'https://pinterest.com', NULL, NULL),
(17, 'theme-september-instagram', 'https://instagram.com', NULL, NULL),
(18, 'theme-september-homepage_id', '1', NULL, NULL),
(19, 'theme-september-blog_page_id', '2', NULL, NULL),
(20, 'theme-september-cookie_consent_message', 'Your experience on this site will be improved by allowing cookies ', NULL, NULL),
(21, 'theme-september-cookie_consent_learn_more_url', 'http://hasa.local/cookie-policy', NULL, NULL),
(22, 'theme-september-cookie_consent_learn_more_text', 'Cookie Policy', NULL, NULL),
(23, 'permalink-botble-blog-models-post', 'blog', NULL, NULL),
(24, 'permalink-botble-blog-models-category', 'blog', NULL, NULL),
(25, 'permalink-botble-blog-models-tag', 'tag', NULL, NULL),
(26, 'payment_cod_status', '1', NULL, NULL),
(27, 'payment_cod_description', 'Please pay money directly to the postman, if you choose cash on delivery method (COD).', NULL, NULL),
(28, 'payment_bank_transfer_status', '1', NULL, NULL),
(29, 'payment_bank_transfer_description', 'Please send money to our bank account: ACB - 1990 404 19.', NULL, NULL),
(30, 'plugins_ecommerce_customer_new_order_status', '0', NULL, NULL),
(31, 'plugins_ecommerce_admin_new_order_status', '0', NULL, NULL),
(32, 'ecommerce_store_name', 'HASA SG', NULL, NULL),
(33, 'ecommerce_store_phone', '18006268', NULL, NULL),
(34, 'ecommerce_store_address', 'North Link Building, 10 Admiralty Street', NULL, NULL),
(35, 'ecommerce_store_state', 'Singapore', NULL, NULL),
(36, 'ecommerce_store_city', 'Singapore', NULL, NULL),
(37, 'ecommerce_store_country', 'SG', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `simple_sliders`
--

CREATE TABLE `simple_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `simple_sliders`
--

INSERT INTO `simple_sliders` (`id`, `name`, `key`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home slider', 'home-slider', NULL, 'published', '2021-03-14 18:40:31', '2021-03-14 18:40:31');

-- --------------------------------------------------------

--
-- Table structure for table `simple_slider_items`
--

CREATE TABLE `simple_slider_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `simple_slider_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `simple_slider_items`
--

INSERT INTO `simple_slider_items` (`id`, `simple_slider_id`, `title`, `image`, `link`, `description`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'New Collection', 'sliders/1.jpg', '/products', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc id varius nunc.', 1, '2021-03-14 18:40:31', '2021-03-14 18:40:31'),
(2, 1, 'Hot Collection', 'sliders/2.jpg', '/products', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc id varius nunc.', 2, '2021-03-14 18:40:31', '2021-03-14 18:40:31'),
(3, 1, 'Trending Collection', 'sliders/3.jpg', '/products', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc id varius nunc.', 3, '2021-03-14 18:40:31', '2021-03-14 18:40:31');

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'fashion-live', 1, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(2, 'hand-crafted', 2, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(3, 'mestonix', 3, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(4, 'sunshine', 4, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(5, 'pure', 5, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(6, 'anfold', 6, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(7, 'automotive', 7, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-03-14 18:40:04', '2021-03-14 18:40:04'),
(8, 'woman-wallet', 1, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(9, 'office-bags', 2, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(10, 'hand-bag', 3, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(11, 'backpack', 4, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(12, 'bags', 5, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(13, 'wallet', 6, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(14, 'men-wallet', 7, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-03-14 18:40:05', '2021-03-14 18:40:05'),
(15, 'wallet', 1, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(16, 'bags', 2, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(17, 'shoes', 3, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(18, 'clothes', 4, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(19, 'hand-bag', 5, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-03-14 18:40:06', '2021-03-14 18:40:06'),
(20, 'wallet-handmade', 1, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-14 18:40:24', '2021-03-14 18:40:24'),
(21, 'clutch-handmade', 2, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-14 18:40:24', '2021-03-14 18:40:24'),
(22, 'gucci-zip-around-wallet', 3, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-14 18:40:24', '2021-03-14 18:40:24'),
(23, 'snapshot-standard', 4, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-14 18:40:24', '2021-03-14 18:40:24'),
(24, 'joan-mini-camera-bag', 5, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-14 18:40:24', '2021-03-14 18:40:24'),
(25, 'cyan-boheme', 6, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-14 18:40:24', '2021-03-14 18:40:24'),
(26, 'the-marc-jacobs', 7, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-14 18:40:24', '2021-03-14 18:40:24'),
(27, 'round-crossbody-bag', 8, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-14 18:40:24', '2021-03-14 18:40:24'),
(28, 'general', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(29, 'design', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(30, 'jquery', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(31, 'branding', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(32, 'modern', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(33, 'ecommerce', 1, 'Botble\\Blog\\Models\\Category', 'blog', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(34, 'fashion', 2, 'Botble\\Blog\\Models\\Category', 'blog', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(35, 'electronic', 3, 'Botble\\Blog\\Models\\Category', 'blog', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(36, 'commercial', 4, 'Botble\\Blog\\Models\\Category', 'blog', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(37, '4-expert-tips-on-how-to-choose-the-right-mens-wallet', 1, 'Botble\\Blog\\Models\\Post', 'blog', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(38, 'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag', 2, 'Botble\\Blog\\Models\\Post', 'blog', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(39, 'the-top-2020-handbag-trends-to-know', 3, 'Botble\\Blog\\Models\\Post', 'blog', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(40, 'how-to-match-the-color-of-your-handbag-with-an-outfit', 4, 'Botble\\Blog\\Models\\Post', 'blog', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(41, 'how-to-care-for-leather-bags', 5, 'Botble\\Blog\\Models\\Post', 'blog', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(42, 'were-crushing-hard-on-summers-10-biggest-bag-trends', 6, 'Botble\\Blog\\Models\\Post', 'blog', '2021-03-14 18:40:32', '2021-03-14 18:40:36'),
(43, 'homepage', 1, 'Botble\\Page\\Models\\Page', '', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(44, 'blog', 2, 'Botble\\Page\\Models\\Page', '', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(45, 'contact', 3, 'Botble\\Page\\Models\\Page', '', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(46, 'cookie-policy', 4, 'Botble\\Page\\Models\\Page', '', '2021-03-14 18:40:32', '2021-03-14 18:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(2, 'Design', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(3, 'Jquery', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(4, 'Branding', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32'),
(5, 'Modern', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2021-03-14 18:40:32', '2021-03-14 18:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(2, 1, 'en', 'auth', 'password', 'The provided password is incorrect.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(3, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(4, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(5, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(6, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(7, 1, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(8, 1, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(9, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(10, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(11, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(12, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(13, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(14, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(15, 1, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(16, 1, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(17, 1, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(18, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(19, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(20, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(21, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(22, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(23, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(24, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(25, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(26, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(27, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(28, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(29, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(30, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(31, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(32, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(33, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(34, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(35, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(36, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(37, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(38, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(39, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(40, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(41, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(42, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(43, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(44, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(45, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(46, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(47, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(48, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(49, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(50, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(51, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(52, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(53, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(54, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(55, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(56, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(57, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(58, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(59, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(60, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(61, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(62, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(63, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(64, 1, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(65, 1, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(66, 1, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(67, 1, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(68, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(69, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(70, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(71, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(72, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(73, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(74, 1, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(75, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(76, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(77, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(78, 1, 'en', 'validation', 'password', 'The password is incorrect.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(79, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(80, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(81, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(82, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(83, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(84, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(85, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(86, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(87, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(88, 1, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(89, 1, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(90, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(91, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(92, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(93, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(94, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(95, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(96, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(97, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(98, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(99, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(100, 1, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(101, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(102, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(103, 1, 'en', 'core/acl/api', 'api_clients', 'API Clients', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(104, 1, 'en', 'core/acl/api', 'create_new_client', 'Create new client', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(105, 1, 'en', 'core/acl/api', 'create_new_client_success', 'Create new client successfully!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(106, 1, 'en', 'core/acl/api', 'edit_client', 'Edit client \":name\"', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(107, 1, 'en', 'core/acl/api', 'edit_client_success', 'Updated client successfully!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(108, 1, 'en', 'core/acl/api', 'delete_success', 'Deleted client successfully!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(109, 1, 'en', 'core/acl/api', 'confirm_delete_title', 'Confirm delete client \":name\"', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(110, 1, 'en', 'core/acl/api', 'confirm_delete_description', 'Do you really want to delete client \":name\"?', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(111, 1, 'en', 'core/acl/api', 'cancel_delete', 'No', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(112, 1, 'en', 'core/acl/api', 'continue_delete', 'Yes, let\'s delete it!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(113, 1, 'en', 'core/acl/api', 'name', 'Name', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(114, 1, 'en', 'core/acl/api', 'cancel', 'Cancel', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(115, 1, 'en', 'core/acl/api', 'save', 'Save', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(116, 1, 'en', 'core/acl/api', 'edit', 'Edit', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(117, 1, 'en', 'core/acl/api', 'delete', 'Delete', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(118, 1, 'en', 'core/acl/api', 'client_id', 'Client ID', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(119, 1, 'en', 'core/acl/api', 'secret', 'Secret', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(120, 1, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(121, 1, 'en', 'core/acl/auth', 'login.email', 'Email', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(122, 1, 'en', 'core/acl/auth', 'login.password', 'Password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(123, 1, 'en', 'core/acl/auth', 'login.title', 'User Login', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(124, 1, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(125, 1, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(126, 1, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(127, 1, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(128, 1, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(129, 1, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(130, 1, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(131, 1, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(132, 1, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(133, 1, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(134, 1, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(135, 1, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(136, 1, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(137, 1, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(138, 1, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(139, 1, 'en', 'core/acl/auth', 'reset.email', 'Email', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(140, 1, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(141, 1, 'en', 'core/acl/auth', 'reset.update', 'Update', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(142, 1, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(143, 1, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(144, 1, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(145, 1, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(146, 1, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(147, 1, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(148, 1, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(149, 1, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(150, 1, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(151, 1, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(152, 1, 'en', 'core/acl/auth', 'failed', 'Failed', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(153, 1, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(154, 1, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(155, 1, 'en', 'core/acl/auth', 'register_now', 'Register now', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(156, 1, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(157, 1, 'en', 'core/acl/auth', 'login_title', 'Admin', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(158, 1, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(159, 1, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(160, 1, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(161, 1, 'en', 'core/acl/auth', 'languages', 'Languages', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(162, 1, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(163, 1, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(164, 1, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(165, 1, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(166, 1, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(167, 1, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(168, 1, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(169, 1, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(170, 1, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(171, 1, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(172, 1, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(173, 1, 'en', 'core/acl/permissions', 'name', 'Name', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(174, 1, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(175, 1, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(176, 1, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(177, 1, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(178, 1, 'en', 'core/acl/permissions', 'role_name', 'Name', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(179, 1, 'en', 'core/acl/permissions', 'role_description', 'Description', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(180, 1, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(181, 1, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(182, 1, 'en', 'core/acl/permissions', 'reset', 'Reset', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(183, 1, 'en', 'core/acl/permissions', 'save', 'Save', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(184, 1, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(185, 1, 'en', 'core/acl/permissions', 'details', 'Details', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(186, 1, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(187, 1, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(188, 1, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(189, 1, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(190, 1, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(191, 1, 'en', 'core/acl/permissions', 'actions', 'Actions', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(192, 1, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(193, 1, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(194, 1, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(195, 1, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(196, 1, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(197, 1, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(198, 1, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(199, 1, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(200, 1, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(201, 1, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(202, 1, 'en', 'core/acl/permissions', 'options', 'Options', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(203, 1, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(204, 1, 'en', 'core/acl/permissions', 'roles', 'Roles', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(205, 1, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(206, 1, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(207, 1, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(208, 1, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(209, 1, 'en', 'core/acl/reminders', 'password', 'Passwords must be at least six characters and match the confirmation.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(210, 1, 'en', 'core/acl/reminders', 'user', 'We can\'t find a user with that e-mail address.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(211, 1, 'en', 'core/acl/reminders', 'token', 'This password reset token is invalid.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(212, 1, 'en', 'core/acl/reminders', 'sent', 'Password reminder sent!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(213, 1, 'en', 'core/acl/reminders', 'reset', 'Password has been reset!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(214, 1, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(215, 1, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(216, 1, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(217, 1, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(218, 1, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(219, 1, 'en', 'core/acl/users', 'not_found', 'User not found', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(220, 1, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(221, 1, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(222, 1, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(223, 1, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(224, 1, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(225, 1, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(226, 1, 'en', 'core/acl/users', 'email', 'Email', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(227, 1, 'en', 'core/acl/users', 'role', 'Role', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(228, 1, 'en', 'core/acl/users', 'username', 'Username', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(229, 1, 'en', 'core/acl/users', 'last_name', 'Last Name', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(230, 1, 'en', 'core/acl/users', 'first_name', 'First Name', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(231, 1, 'en', 'core/acl/users', 'message', 'Message', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(232, 1, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(233, 1, 'en', 'core/acl/users', 'change_password', 'Change password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(234, 1, 'en', 'core/acl/users', 'current_password', 'Current password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(235, 1, 'en', 'core/acl/users', 'new_password', 'New Password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(236, 1, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(237, 1, 'en', 'core/acl/users', 'password', 'Password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(238, 1, 'en', 'core/acl/users', 'save', 'Save', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(239, 1, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(240, 1, 'en', 'core/acl/users', 'deleted', 'User deleted', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(241, 1, 'en', 'core/acl/users', 'last_login', 'Last Login', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(242, 1, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(243, 1, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(244, 1, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(245, 1, 'en', 'core/acl/users', 'new_image', 'New Image', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(246, 1, 'en', 'core/acl/users', 'loading', 'Loading', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(247, 1, 'en', 'core/acl/users', 'close', 'Close', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(248, 1, 'en', 'core/acl/users', 'update', 'Update', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(249, 1, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(250, 1, 'en', 'core/acl/users', 'users', 'Users', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(251, 1, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(252, 1, 'en', 'core/acl/users', 'info.title', 'User profile', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(253, 1, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(254, 1, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(255, 1, 'en', 'core/acl/users', 'info.email', 'Email', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(256, 1, 'en', 'core/acl/users', 'info.second_email', 'Secondary Email', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(257, 1, 'en', 'core/acl/users', 'info.address', 'Address', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(258, 1, 'en', 'core/acl/users', 'info.second_address', 'Secondary Address', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(259, 1, 'en', 'core/acl/users', 'info.birth_day', 'Date of birth', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(260, 1, 'en', 'core/acl/users', 'info.job', 'Job Position', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(261, 1, 'en', 'core/acl/users', 'info.mobile_number', 'Mobile Number', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(262, 1, 'en', 'core/acl/users', 'info.second_mobile_number', 'Secondary Phone', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(263, 1, 'en', 'core/acl/users', 'info.interes', 'Interests', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(264, 1, 'en', 'core/acl/users', 'info.about', 'About', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(265, 1, 'en', 'core/acl/users', 'gender.title', 'Gender', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(266, 1, 'en', 'core/acl/users', 'gender.male', 'Male', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(267, 1, 'en', 'core/acl/users', 'gender.female', 'Female', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(268, 1, 'en', 'core/acl/users', 'total_users', 'Total users', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(269, 1, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(270, 1, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(271, 1, 'en', 'core/acl/users', 'make_super', 'Make super', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(272, 1, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(273, 1, 'en', 'core/acl/users', 'is_super', 'Is super?', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(274, 1, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(275, 1, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(276, 1, 'en', 'core/acl/users', 'select_role', 'Select role', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(277, 1, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(278, 1, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(279, 1, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(280, 1, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(281, 1, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(282, 1, 'vi', 'core/acl/auth', 'login.username', 'T??n truy c????p', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(283, 1, 'vi', 'core/acl/auth', 'login.password', 'M????t kh????u', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(284, 1, 'vi', 'core/acl/auth', 'login.title', '????ng nh???p v??o qu???n tr???', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(285, 1, 'vi', 'core/acl/auth', 'login.remember', 'Nh???? m????t kh????u?', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(286, 1, 'vi', 'core/acl/auth', 'login.login', '????ng nh????p', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(287, 1, 'vi', 'core/acl/auth', 'login.placeholder.username', 'Vui lo??ng nh????p t??n truy c????p', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(288, 1, 'vi', 'core/acl/auth', 'login.placeholder.email', 'Vui l??ng nh???p email', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(289, 1, 'vi', 'core/acl/auth', 'login.success', '????ng nh????p tha??nh c??ng!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(290, 1, 'vi', 'core/acl/auth', 'login.fail', 'Sai t??n truy c????p ho????c m????t kh????u.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(291, 1, 'vi', 'core/acl/auth', 'login.not_active', 'Ta??i khoa??n cu??a ba??n ch??a ????????c ki??ch hoa??t!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(292, 1, 'vi', 'core/acl/auth', 'login.banned', 'Ta??i khoa??n na??y ??a?? bi?? kho??a.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(293, 1, 'vi', 'core/acl/auth', 'login.logout_success', '????ng xu????t tha??nh c??ng!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(294, 1, 'vi', 'core/acl/auth', 'login.dont_have_account', 'B???n kh??ng c?? t??i kho???n trong h??? th???ng, vui l??ng li??n h??? qu???n tr??? vi??n!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(295, 1, 'vi', 'core/acl/auth', 'login.email', 'Email', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(296, 1, 'vi', 'core/acl/auth', 'forgot_password.title', 'Qu??n m????t kh????u', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(297, 1, 'vi', 'core/acl/auth', 'forgot_password.message', '<p>Qu??n m????t kh????u?</p><p>Vui l??ng nh???p email ????ng nh???p t??i kho???n c???a b???n ????? h??? th???ng g???i li??n k???t kh??i ph???c m???t kh???u.</p>', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(298, 1, 'vi', 'core/acl/auth', 'forgot_password.submit', 'Hoa??n t????t', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(299, 1, 'vi', 'core/acl/auth', 'reset.new_password', 'M????t kh????u m????i', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(300, 1, 'vi', 'core/acl/auth', 'reset.repassword', 'Xa??c nh????n m????t kh????u m????i', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(301, 1, 'vi', 'core/acl/auth', 'reset.title', 'Kh??i phu??c m????t kh????u', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(302, 1, 'vi', 'core/acl/auth', 'reset.update', 'C????p nh????t', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(303, 1, 'vi', 'core/acl/auth', 'reset.wrong_token', 'Li??n k????t na??y kh??ng chi??nh xa??c ho????c ??a?? h????t hi????u l????c, vui lo??ng y??u c????u kh??i phu??c m????t kh????u la??i!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(304, 1, 'vi', 'core/acl/auth', 'reset.user_not_found', 'T??n ????ng nh????p kh??ng t????n ta??i.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(305, 1, 'vi', 'core/acl/auth', 'reset.success', 'Kh??i phu??c m????t kh????u tha??nh c??ng!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(306, 1, 'vi', 'core/acl/auth', 'reset.fail', 'Token kh??ng h????p l???? ho????c li??n k????t kh??i phu??c m????t kh????u ??a?? h????t th????i gian hi????u l????c!', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(307, 1, 'vi', 'core/acl/auth', 'reset.reset.title', 'Email kh??i phu??c m????t kh????u', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(308, 1, 'vi', 'core/acl/auth', 'reset.send.success', 'M????t email kh??i phu??c m????t kh????u ??a?? ????????c g????i t????i email cu??a ba??n, vui lo??ng ki????m tra va?? hoa??n t????t y??u c????u.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(309, 1, 'vi', 'core/acl/auth', 'reset.send.fail', 'Kh??ng th???? g????i email trong lu??c na??y. Vui lo??ng th????c hi????n la??i sau.', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(310, 1, 'vi', 'core/acl/auth', 'reset.new-password', 'M????t kh????u m????i', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(311, 1, 'vi', 'core/acl/auth', 'reset.email', 'Email', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(312, 1, 'vi', 'core/acl/auth', 'email.reminder.title', 'Email kh??i phu??c m????t kh????u', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(313, 1, 'vi', 'core/acl/auth', 'failed', 'Kh??ng tha??nh c??ng', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(314, 1, 'vi', 'core/acl/auth', 'repassword', 'Xa??c nh????n m????t kh????u', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(315, 1, 'vi', 'core/acl/auth', 'throttle', 'Throttle', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(316, 1, 'vi', 'core/acl/auth', 'back_to_login', 'Quay l???i trang ????ng nh???p', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(317, 1, 'vi', 'core/acl/auth', 'login_title', '????ng nh???p v??o qu???n tr???', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(318, 1, 'vi', 'core/acl/auth', 'login_via_social', '????ng nh???p th??ng qua m???ng x?? h???i', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(319, 1, 'vi', 'core/acl/auth', 'lost_your_password', 'Qu??n m???t kh???u?', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(320, 1, 'vi', 'core/acl/auth', 'not_member', 'Ch??a l?? th??nh vi??n?', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(321, 1, 'vi', 'core/acl/auth', 'register_now', '????ng k?? ngay', '2021-03-14 18:40:37', '2021-03-14 18:40:37'),
(322, 1, 'vi', 'core/acl/permissions', 'notices.role_in_use', 'Kh??ng th???? xo??a quy????n ng??????i du??ng na??y vi?? no?? ??ang ????????c s???? du??ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(323, 1, 'vi', 'core/acl/permissions', 'notices.role_delete_belong_user', 'Kh??ng th???? xo??a quy????n ha??n na??y vi?? no?? thu????c v???? ng??????i kha??c!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(324, 1, 'vi', 'core/acl/permissions', 'notices.role_edit_belong_user', 'Ba??n kh??ng ????????c phe??p s????a quy????n na??y vi?? no?? thu????c v???? ng??????i kha??c', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(325, 1, 'vi', 'core/acl/permissions', 'notices.delete_global_role', 'Ba??n kh??ng th???? xo??a quy????n ng??????i du??ng h???? th????ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(326, 1, 'vi', 'core/acl/permissions', 'notices.delete_success', 'Quy????n ng??????i du??ng ??a?? ????????c xo??a!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(327, 1, 'vi', 'core/acl/permissions', 'notices.modified_success', 'Quy????n ng??????i du??ng ??a?? ????????c c????p nh????t tha??nh c??ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(328, 1, 'vi', 'core/acl/permissions', 'notices.create_success', 'Quy????n ng??????i du??ng m????i ??a?? ????????c ta??o tha??nh c??ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(329, 1, 'vi', 'core/acl/permissions', 'notices.duplicated_success', 'Quy????n ng??????i du??ng ??a?? ????????c sao che??p tha??nh c??ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(330, 1, 'vi', 'core/acl/permissions', 'notices.no_select', 'Ha??y cho??n i??t nh????t m????t quy????n ng??????i du??ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(331, 1, 'vi', 'core/acl/permissions', 'notices.not_found', 'Kh??ng ti??m th????y quy????n ng??????i du??ng na??y', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(332, 1, 'vi', 'core/acl/permissions', 'list', 'Danh sa??ch ph??n quy????n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(333, 1, 'vi', 'core/acl/permissions', 'name', 'T??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(334, 1, 'vi', 'core/acl/permissions', 'current_role', 'Quy????n hi????n ta??i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(335, 1, 'vi', 'core/acl/permissions', 'no_role_assigned', 'Kh??ng co?? quy????n ha??n na??o', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(336, 1, 'vi', 'core/acl/permissions', 'role_assigned', 'Quy????n ??a?? ????????c ga??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(337, 1, 'vi', 'core/acl/permissions', 'create_role', 'Ta??o quy????n m????i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(338, 1, 'vi', 'core/acl/permissions', 'role_name', 'T??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(339, 1, 'vi', 'core/acl/permissions', 'role_description', 'M?? ta??', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(340, 1, 'vi', 'core/acl/permissions', 'permission_flags', 'C???? ??a??nh d????u quy????n ha??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(341, 1, 'vi', 'core/acl/permissions', 'cancel', 'Hu??y bo??', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(342, 1, 'vi', 'core/acl/permissions', 'reset', 'La??m la??i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(343, 1, 'vi', 'core/acl/permissions', 'save', 'L??u', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(344, 1, 'vi', 'core/acl/permissions', 'global_role_msg', '????y la?? m????t ph??n quy????n toa??n cu??c va?? kh??ng th???? thay ??????i.  Ba??n co?? th???? s???? du??ng nu??t \"Nh??n ba??n\" ?????? ta??o m????t ba??n sao che??p cho ph??n quy????n na??y va?? chi??nh s????a.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(345, 1, 'vi', 'core/acl/permissions', 'details', 'Chi ti????t', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(346, 1, 'vi', 'core/acl/permissions', 'duplicate', 'Nh??n ba??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(347, 1, 'vi', 'core/acl/permissions', 'all', 'T????t ca?? ph??n quy????n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(348, 1, 'vi', 'core/acl/permissions', 'list_role', 'Danh sa??ch quy????n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(349, 1, 'vi', 'core/acl/permissions', 'created_on', 'Nga??y ta??o', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(350, 1, 'vi', 'core/acl/permissions', 'created_by', '????????c ta??o b????i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(351, 1, 'vi', 'core/acl/permissions', 'actions', 'Ta??c vu??', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(352, 1, 'vi', 'core/acl/permissions', 'create_success', 'Ta??o tha??nh c??ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(353, 1, 'vi', 'core/acl/permissions', 'delete_global_role', 'Kh??ng th???? xo??a quy????n h???? th????ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(354, 1, 'vi', 'core/acl/permissions', 'delete_success', 'Xo??a quy????n tha??nh c??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(355, 1, 'vi', 'core/acl/permissions', 'duplicated_success', 'Nh??n ba??n tha??nh c??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(356, 1, 'vi', 'core/acl/permissions', 'modified_success', 'S????a tha??nh c??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(357, 1, 'vi', 'core/acl/permissions', 'no_select', 'Ha??y cho??n i??t nh????t m????t quy????n ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(358, 1, 'vi', 'core/acl/permissions', 'not_found', 'Kh??ng ti??m th????y quy????n tha??nh vi??n na??o!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(359, 1, 'vi', 'core/acl/permissions', 'options', 'Tu??y cho??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(360, 1, 'vi', 'core/acl/permissions', 'role_delete_belong_user', 'Kh??ng th???? xo??a quy????n ha??n na??y vi?? no?? thu????c v???? ng??????i kha??c!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(361, 1, 'vi', 'core/acl/permissions', 'role_edit_belong_user', 'Ba??n kh??ng ????????c phe??p s????a quy????n na??y vi?? no?? thu????c v???? ng??????i kha??c', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(362, 1, 'vi', 'core/acl/permissions', 'role_in_use', 'Kh??ng th???? xo??a quy????n ng??????i du??ng na??y vi?? no?? ??ang ????????c s???? du??ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(363, 1, 'vi', 'core/acl/permissions', 'access_denied_message', 'Ba??n kh??ng co?? quy????n s???? du??ng ch????c n??ng na??y!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(364, 1, 'vi', 'core/acl/permissions', 'roles', 'Quy???n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(365, 1, 'vi', 'core/acl/permissions', 'role_permission', 'Nh??m v?? ph??n quy???n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(366, 1, 'vi', 'core/acl/permissions', 'user_management', 'Qu???n l?? ng?????i d??ng h??? th???ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(367, 1, 'vi', 'core/acl/permissions', 'super_user_management', 'Qu???n l?? ng?????i d??ng c???p cao', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(368, 1, 'vi', 'core/acl/reminders', 'password', 'M???t kh???u ph???i ??t nh???t 6 k?? t??? v?? tr??ng kh???p v???i m???t kh???u x??c nh???n.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(369, 1, 'vi', 'core/acl/reminders', 'user', 'H??? th???ng kh??ng th??? t??m th???y t??i kho???n v???i email n??y.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(370, 1, 'vi', 'core/acl/reminders', 'token', 'M?? kh??i ph???c m???t kh???u n??y kh??ng h???p l???.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(371, 1, 'vi', 'core/acl/reminders', 'sent', 'Li??n k???t kh??i ph???c m???t kh???u ???? ???????c g???i!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(372, 1, 'vi', 'core/acl/reminders', 'reset', 'M???t kh???u ???? ???????c thay ?????i!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(373, 1, 'vi', 'core/acl/users', 'delete_user_logged_in', 'Kh??ng th???? xo??a ng??????i du??ng ??ang ????ng nh????p h???? th????ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(374, 1, 'vi', 'core/acl/users', 'no_select', 'Ha??y cho??n i??t nh????t m????t tr??????ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(375, 1, 'vi', 'core/acl/users', 'lock_user_logged_in', 'Kh??ng th???? kho??a ng??????i du??ng ??ang ????ng nh????p h???? th????ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(376, 1, 'vi', 'core/acl/users', 'update_success', 'C????p nh????t tra??ng tha??i tha??nh c??ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(377, 1, 'vi', 'core/acl/users', 'save_setting_failed', 'Co?? l????i xa??y ra trong qua?? tri??nh l??u ca??i ??????t cu??a ng??????i du??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(378, 1, 'vi', 'core/acl/users', 'not_found', 'Kh??ng ti??m th????y ng??????i du??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(379, 1, 'vi', 'core/acl/users', 'email_exist', 'Email na??y ??a?? ????????c s???? du??ng b????i ng??????i du??ng kha??c trong h???? th????ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(380, 1, 'vi', 'core/acl/users', 'username_exist', 'T??n ????ng nh????p na??y ??a?? ????????c s???? du??ng b????i ng??????i du??ng kha??c trong h???? th????ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(381, 1, 'vi', 'core/acl/users', 'update_profile_success', 'Th??ng tin ta??i khoa??n cu??a ba??n ??a?? ????????c c????p nh????t tha??nh c??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(382, 1, 'vi', 'core/acl/users', 'password_update_success', 'C????p nh????t m????t kh????u tha??nh c??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(383, 1, 'vi', 'core/acl/users', 'current_password_not_valid', 'M????t kh????u hi????n ta??i kh??ng chi??nh xa??c', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(384, 1, 'vi', 'core/acl/users', 'user_exist_in', 'Ng??????i du??ng ??a?? la?? tha??nh vi??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(385, 1, 'vi', 'core/acl/users', 'email', 'Email', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(386, 1, 'vi', 'core/acl/users', 'username', 'T??n ????ng nh????p', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(387, 1, 'vi', 'core/acl/users', 'role', 'Ph??n quy????n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(388, 1, 'vi', 'core/acl/users', 'first_name', 'Ho??', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(389, 1, 'vi', 'core/acl/users', 'last_name', 'T??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(390, 1, 'vi', 'core/acl/users', 'message', 'Th??ng ??i????p', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(391, 1, 'vi', 'core/acl/users', 'cancel_btn', 'Hu??y bo??', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(392, 1, 'vi', 'core/acl/users', 'password', 'M????t kh????u', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(393, 1, 'vi', 'core/acl/users', 'new_password', 'M????t kh????u m????i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(394, 1, 'vi', 'core/acl/users', 'save', 'L??u', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(395, 1, 'vi', 'core/acl/users', 'confirm_new_password', 'Xa??c nh????n m????t kh????u m????i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(396, 1, 'vi', 'core/acl/users', 'deleted', 'Xo??a tha??nh vi??n tha??nh c??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(397, 1, 'vi', 'core/acl/users', 'cannot_delete', 'Kh??ng th???? xo??a tha??nh vi??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(398, 1, 'vi', 'core/acl/users', 'list', 'Danh sa??ch tha??nh vi??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(399, 1, 'vi', 'core/acl/users', 'last_login', 'L???n cu???i ????ng nh???p', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(400, 1, 'vi', 'core/acl/users', 'error_update_profile_image', 'C?? l???i trong qu?? tr??nh ?????i ???nh ?????i di???n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(401, 1, 'vi', 'core/acl/users', 'email_reminder_template', '<h3>Xin cha??o :name</h3><p>H??? th???ng v???a nh???n ???????c y??u c???u kh??i ph???c m???t kh???u cho t??i kho???n c???a b???n, ????? ho??n t???t t??c v??? n??y vui l??ng click v??o ???????ng link b??n d?????i.</p><p><a href=\":link\">Kh??i phu??c m????t kh????u</a></p><p>N???u kh??ng ph???i b???n y??u c???u kh??i ph???c m???t kh???u, vui l??ng b??? qua email n??y.</p><p>Email n??y c?? gi?? tr??? trong v??ng 60 ph??t k??? t??? l??c nh???n ???????c email.</p>', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(402, 1, 'vi', 'core/acl/users', 'change_profile_image', 'Thay ?????i ???nh ?????i di???n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(403, 1, 'vi', 'core/acl/users', 'new_image', '???nh m???i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(404, 1, 'vi', 'core/acl/users', 'loading', '??ang t???i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(405, 1, 'vi', 'core/acl/users', 'close', '????ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(406, 1, 'vi', 'core/acl/users', 'update', 'C???p nh???t', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(407, 1, 'vi', 'core/acl/users', 'read_image_failed', 'Kh??ng ?????c ???????c n???i dung c???a h??nh ???nh', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(408, 1, 'vi', 'core/acl/users', 'update_avatar_success', 'C???p nh???t ???nh ?????i di???n th??nh c??ng!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(409, 1, 'vi', 'core/acl/users', 'users', 'Qu???n tr??? vi??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(410, 1, 'vi', 'core/acl/users', 'info.title', 'Th??ng tin ng?????i d??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(411, 1, 'vi', 'core/acl/users', 'info.first_name', 'H???', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(412, 1, 'vi', 'core/acl/users', 'info.last_name', 'T??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(413, 1, 'vi', 'core/acl/users', 'info.email', 'Email', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(414, 1, 'vi', 'core/acl/users', 'info.second_email', 'Email d??? ph??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(415, 1, 'vi', 'core/acl/users', 'info.address', '?????a ch???', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(416, 1, 'vi', 'core/acl/users', 'info.second_address', '?????a ch??? d??? ph??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(417, 1, 'vi', 'core/acl/users', 'info.birth_day', 'Ng??y sinh', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(418, 1, 'vi', 'core/acl/users', 'info.job', 'Ngh??? nghi???p', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(419, 1, 'vi', 'core/acl/users', 'info.mobile_number', 'S??? ??i???n tho???i di ?????ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(420, 1, 'vi', 'core/acl/users', 'info.second_mobile_number', 'S??? ??i???n tho???i d??? ph??ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(421, 1, 'vi', 'core/acl/users', 'info.interes', 'S??? th??ch', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(422, 1, 'vi', 'core/acl/users', 'info.about', 'Gi???i thi???u', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(423, 1, 'vi', 'core/acl/users', 'gender.title', 'Gi???i t??nh', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(424, 1, 'vi', 'core/acl/users', 'gender.male', 'nam', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(425, 1, 'vi', 'core/acl/users', 'gender.female', 'n???', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(426, 1, 'vi', 'core/acl/users', 'change_password', 'Thay ?????i m???t kh???u', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(427, 1, 'vi', 'core/acl/users', 'current_password', 'M???t kh???u hi???n t???i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(428, 1, 'en', 'core/base/base', 'yes', 'Yes', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(429, 1, 'en', 'core/base/base', 'no', 'No', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(430, 1, 'en', 'core/base/base', 'is_default', 'Is default?', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(431, 1, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(432, 1, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(433, 1, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(434, 1, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(435, 1, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(436, 1, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(437, 1, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(438, 1, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(439, 1, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(440, 1, 'en', 'core/base/base', 'change_image', 'Change image', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(441, 1, 'en', 'core/base/base', 'delete_image', 'Delete image', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(442, 1, 'en', 'core/base/base', 'preview_image', 'Preview image', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(443, 1, 'en', 'core/base/base', 'image', 'Image', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(444, 1, 'en', 'core/base/base', 'using_button', 'Using button', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(445, 1, 'en', 'core/base/base', 'select_image', 'Select image', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(446, 1, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(447, 1, 'en', 'core/base/base', 'add_image', 'Add image', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(448, 1, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(449, 1, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(450, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(451, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(452, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(453, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(454, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(455, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(456, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(457, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(458, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(459, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(460, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(461, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(462, 1, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(463, 1, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(464, 1, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(465, 1, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(466, 1, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(467, 1, 'en', 'core/base/enums', 'statuses.published', 'Published', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(468, 1, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(469, 1, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(470, 1, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(471, 1, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(472, 1, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(473, 1, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(474, 1, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(475, 1, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\"http://hasa.local/admin\">clicking here</a>.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(476, 1, 'en', 'core/base/errors', 'not_found', 'Not Found', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(477, 1, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(478, 1, 'en', 'core/base/forms', 'actions', 'Actions', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(479, 1, 'en', 'core/base/forms', 'save', 'Save', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(480, 1, 'en', 'core/base/forms', 'save_and_continue', 'Save & Edit', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(481, 1, 'en', 'core/base/forms', 'image', 'Image', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(482, 1, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(483, 1, 'en', 'core/base/forms', 'create', 'Create', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(484, 1, 'en', 'core/base/forms', 'edit', 'Edit', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(485, 1, 'en', 'core/base/forms', 'permalink', 'Permalink', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(486, 1, 'en', 'core/base/forms', 'ok', 'OK', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(487, 1, 'en', 'core/base/forms', 'cancel', 'Cancel', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(488, 1, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(489, 1, 'en', 'core/base/forms', 'template', 'Template', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(490, 1, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(491, 1, 'en', 'core/base/forms', 'file', 'File', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(492, 1, 'en', 'core/base/forms', 'content', 'Content', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(493, 1, 'en', 'core/base/forms', 'description', 'Description', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(494, 1, 'en', 'core/base/forms', 'name', 'Name', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(495, 1, 'en', 'core/base/forms', 'slug', 'Slug', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(496, 1, 'en', 'core/base/forms', 'title', 'Title', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(497, 1, 'en', 'core/base/forms', 'value', 'Value', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(498, 1, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(499, 1, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(500, 1, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(501, 1, 'en', 'core/base/forms', 'parent', 'Parent', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(502, 1, 'en', 'core/base/forms', 'icon', 'Icon', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(503, 1, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(504, 1, 'en', 'core/base/forms', 'order_by', 'Order by', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(505, 1, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(506, 1, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(507, 1, 'en', 'core/base/forms', 'is_default', 'Is default?', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(508, 1, 'en', 'core/base/forms', 'update', 'Update', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(509, 1, 'en', 'core/base/forms', 'publish', 'Publish', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(510, 1, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(511, 1, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(512, 1, 'en', 'core/base/forms', 'order', 'Order', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(513, 1, 'en', 'core/base/forms', 'alias', 'Alias', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(514, 1, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(515, 1, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(516, 1, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(517, 1, 'en', 'core/base/forms', 'add', 'Add', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(518, 1, 'en', 'core/base/forms', 'link', 'Link', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(519, 1, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(520, 1, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(521, 1, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(522, 1, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(523, 1, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(524, 1, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(525, 1, 'en', 'core/base/layouts', 'settings', 'Settings', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(526, 1, 'en', 'core/base/layouts', 'setting_general', 'General', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(527, 1, 'en', 'core/base/layouts', 'setting_email', 'Email', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(528, 1, 'en', 'core/base/layouts', 'system_information', 'System information', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(529, 1, 'en', 'core/base/layouts', 'theme', 'Theme', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(530, 1, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(531, 1, 'en', 'core/base/layouts', 'profile', 'Profile', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(532, 1, 'en', 'core/base/layouts', 'logout', 'Logout', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(533, 1, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(534, 1, 'en', 'core/base/layouts', 'home', 'Home', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(535, 1, 'en', 'core/base/layouts', 'search', 'Search', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(536, 1, 'en', 'core/base/layouts', 'add_new', 'Add new', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(537, 1, 'en', 'core/base/layouts', 'n_a', 'N/A', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(538, 1, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(539, 1, 'en', 'core/base/layouts', 'view_website', 'View website', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(540, 1, 'en', 'core/base/mail', 'send-fail', 'Send email failed', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(541, 1, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(542, 1, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(543, 1, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(544, 1, 'en', 'core/base/notices', 'success_header', 'Success!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(545, 1, 'en', 'core/base/notices', 'error_header', 'Error!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(546, 1, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(547, 1, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(548, 1, 'en', 'core/base/notices', 'error', 'Error!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(549, 1, 'en', 'core/base/notices', 'success', 'Success!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(550, 1, 'en', 'core/base/notices', 'info', 'Info!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(551, 1, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(552, 1, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(553, 1, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(554, 1, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(555, 1, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(556, 1, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(557, 1, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(558, 1, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(559, 1, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(560, 1, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(561, 1, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(562, 1, 'en', 'core/base/system', 'user_management', 'User Management', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(563, 1, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(564, 1, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(565, 1, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(566, 1, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(567, 1, 'en', 'core/base/system', 'user.email', 'Email', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(568, 1, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(569, 1, 'en', 'core/base/system', 'user.username', 'Username', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(570, 1, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(571, 1, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(572, 1, 'en', 'core/base/system', 'user.create', 'Create', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(573, 1, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(574, 1, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(575, 1, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(576, 1, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(577, 1, 'en', 'core/base/system', 'options.info', 'System information', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(578, 1, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(579, 1, 'en', 'core/base/system', 'info.title', 'System information', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(580, 1, 'en', 'core/base/system', 'info.cache', 'Cache', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(581, 1, 'en', 'core/base/system', 'info.locale', 'Active locale', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(582, 1, 'en', 'core/base/system', 'info.environment', 'Environment', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(583, 1, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(584, 1, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(585, 1, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(586, 1, 'en', 'core/base/system', 'system_environment', 'System Environment', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(587, 1, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(588, 1, 'en', 'core/base/system', 'timezone', 'Timezone', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(589, 1, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(590, 1, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(591, 1, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(592, 1, 'en', 'core/base/system', 'app_size', 'App Size', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(593, 1, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(594, 1, 'en', 'core/base/system', 'php_version', 'PHP Version', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(595, 1, 'en', 'core/base/system', 'php_version_error', 'PHP must be >= :version', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(596, 1, 'en', 'core/base/system', 'server_software', 'Server Software', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(597, 1, 'en', 'core/base/system', 'server_os', 'Server OS', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(598, 1, 'en', 'core/base/system', 'database', 'Database', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(599, 1, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(600, 1, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(601, 1, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(602, 1, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(603, 1, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(604, 1, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(605, 1, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(606, 1, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(607, 1, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(608, 1, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(609, 1, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(610, 1, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(611, 1, 'en', 'core/base/system', 'installed_packages', 'Installed packages and their version numbers', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(612, 1, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(613, 1, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(614, 1, 'en', 'core/base/system', 'package_name', 'Package Name', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(615, 1, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(616, 1, 'en', 'core/base/system', 'version', 'Version', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(617, 1, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(618, 1, 'en', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(619, 1, 'en', 'core/base/tables', 'id', 'ID', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(620, 1, 'en', 'core/base/tables', 'name', 'Name', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(621, 1, 'en', 'core/base/tables', 'slug', 'Slug', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(622, 1, 'en', 'core/base/tables', 'title', 'Title', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(623, 1, 'en', 'core/base/tables', 'order_by', 'Order By', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(624, 1, 'en', 'core/base/tables', 'order', 'Order', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(625, 1, 'en', 'core/base/tables', 'status', 'Status', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(626, 1, 'en', 'core/base/tables', 'created_at', 'Created At', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(627, 1, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(628, 1, 'en', 'core/base/tables', 'description', 'Description', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(629, 1, 'en', 'core/base/tables', 'operations', 'Operations', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(630, 1, 'en', 'core/base/tables', 'url', 'URL', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(631, 1, 'en', 'core/base/tables', 'author', 'Author', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(632, 1, 'en', 'core/base/tables', 'notes', 'Notes', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(633, 1, 'en', 'core/base/tables', 'column', 'Column', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(634, 1, 'en', 'core/base/tables', 'origin', 'Origin', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(635, 1, 'en', 'core/base/tables', 'after_change', 'After changes', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(636, 1, 'en', 'core/base/tables', 'views', 'Views', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(637, 1, 'en', 'core/base/tables', 'browser', 'Browser', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(638, 1, 'en', 'core/base/tables', 'session', 'Session', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(639, 1, 'en', 'core/base/tables', 'activated', 'activated', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(640, 1, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(641, 1, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(642, 1, 'en', 'core/base/tables', 'edit', 'Edit', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(643, 1, 'en', 'core/base/tables', 'delete', 'Delete', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(644, 1, 'en', 'core/base/tables', 'restore', 'Restore', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(645, 1, 'en', 'core/base/tables', 'activate', 'Activate', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(646, 1, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(647, 1, 'en', 'core/base/tables', 'excel', 'Excel', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(648, 1, 'en', 'core/base/tables', 'export', 'Export', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(649, 1, 'en', 'core/base/tables', 'csv', 'CSV', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(650, 1, 'en', 'core/base/tables', 'pdf', 'PDF', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(651, 1, 'en', 'core/base/tables', 'print', 'Print', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(652, 1, 'en', 'core/base/tables', 'reset', 'Reset', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(653, 1, 'en', 'core/base/tables', 'reload', 'Reload', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(654, 1, 'en', 'core/base/tables', 'display', 'Display', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(655, 1, 'en', 'core/base/tables', 'all', 'All', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(656, 1, 'en', 'core/base/tables', 'add_new', 'Add New', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(657, 1, 'en', 'core/base/tables', 'action', 'Actions', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(658, 1, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(659, 1, 'en', 'core/base/tables', 'view', 'View Detail', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(660, 1, 'en', 'core/base/tables', 'save', 'Save', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(661, 1, 'en', 'core/base/tables', 'show_from', 'Show from', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(662, 1, 'en', 'core/base/tables', 'to', 'to', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(663, 1, 'en', 'core/base/tables', 'in', 'in', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(664, 1, 'en', 'core/base/tables', 'records', 'records', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(665, 1, 'en', 'core/base/tables', 'no_data', 'No data to display', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(666, 1, 'en', 'core/base/tables', 'no_record', 'No record', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(667, 1, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(668, 1, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(669, 1, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(670, 1, 'en', 'core/base/tables', 'cancel', 'Cancel', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(671, 1, 'en', 'core/base/tables', 'template', 'Template', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(672, 1, 'en', 'core/base/tables', 'email', 'Email', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(673, 1, 'en', 'core/base/tables', 'last_login', 'Last login', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(674, 1, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(675, 1, 'en', 'core/base/tables', 'image', 'Image', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(676, 1, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(677, 1, 'en', 'core/base/tables', 'submit', 'Submit', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(678, 1, 'en', 'core/base/tabs', 'detail', 'Detail', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(679, 1, 'en', 'core/base/tabs', 'file', 'Files', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(680, 1, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(681, 1, 'en', 'core/base/tabs', 'revision', 'Revision History', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(682, 1, 'vi', 'core/base/cache', 'cache_management', 'Qu???n l?? b??? nh??? ?????m', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(683, 1, 'vi', 'core/base/cache', 'cache_commands', 'C??c l???nh xo?? b??? nh??? ?????m c?? b???n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(684, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.title', 'X??a t???t c??? b??? ?????m hi???n c?? c???a ???ng d???ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(685, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.description', 'X??a c??c b??? nh??? ?????m c???a ???ng d???ng: c?? s??? d??? li???u, n???i dung t??nh... Ch???y l???nh n??y khi b???n th??? c???p nh???t d??? li???u nh??ng giao di???n kh??ng thay ?????i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(686, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'B??? ?????m ???? ???????c x??a', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(687, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.title', 'L??m m???i b??? ?????m giao di???n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(688, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.description', 'L??m m???i b??? ?????m giao di???n gi??p ph???n giao di???n lu??n m???i nh???t', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(689, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'B??? ?????m giao di???n ???? ???????c l??m m???i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(690, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.title', 'X??a b??? nh??? ?????m c???a ph???n c???u h??nh', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(691, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.description', 'B???n c???n l??m m???i b??? ?????m c???u h??nh khi b???n t???o ra s??? thay ?????i n??o ???? ??? m??i tr?????ng th??nh ph???m.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(692, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'B??? ?????m c???u h??nh ???? ???????c x??a', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(693, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.title', 'Xo?? cache ???????ng d???n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(694, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.description', 'C???n th???c hi???n thao t??c n??y khi th???y kh??ng xu???t hi???n ???????ng d???n m???i.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(695, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'B??? ?????m ??i???u h?????ng ???? b??? x??a', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(696, 1, 'vi', 'core/base/cache', 'commands.clear_log.description', 'Xo?? l???ch s??? l???i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(697, 1, 'vi', 'core/base/cache', 'commands.clear_log.success_msg', 'L???ch s??? l???i ???? ???????c l??m s???ch', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(698, 1, 'vi', 'core/base/cache', 'commands.clear_log.title', 'Xo?? l???ch s??? l???i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(699, 1, 'vi', 'core/base/enums', 'statuses.draft', 'B???n nh??p', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(700, 1, 'vi', 'core/base/enums', 'statuses.pending', '??ang ch??? x??? l??', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(701, 1, 'vi', 'core/base/enums', 'statuses.publish', '???? xu???t b???n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(702, 1, 'vi', 'core/base/errors', '401_title', 'Ba??n kh??ng co?? quy????n truy c????p trang na??y', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(703, 1, 'vi', 'core/base/errors', '401_msg', '<li>Ba??n kh??ng ????????c c????p quy????n truy c????p b????i qua??n tri?? vi??n.</li>\n	                <li>Ba??n s???? du??ng sai loa??i ta??i khoa??n.</li>\n	                <li>Ba??n kh??ng ????????c c????p quy????n ?????? co?? th???? truy c????p trang na??y</li>', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(704, 1, 'vi', 'core/base/errors', '404_title', 'Kh??ng ti??m th????y trang y??u c????u', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(705, 1, 'vi', 'core/base/errors', '404_msg', '<li>Trang ba??n y??u c????u kh??ng t????n ta??i.</li>\n	                <li>Li??n k????t ba??n v????a nh????n kh??ng co??n ????????c s???? du??ng.</li>\n	                <li>Trang na??y co?? th???? ??a?? ????????c chuy????n sang vi?? tri?? kha??c.</li>\n	                <li>Co?? th???? co?? l????i xa??y ra.</li>\n	                <li>Ba??n kh??ng ????????c c????p quy????n ?????? co?? th???? truy c????p trang na??y</li>', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(706, 1, 'vi', 'core/base/errors', '500_title', 'Kh??ng th???? ta??i trang', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(707, 1, 'vi', 'core/base/errors', '500_msg', '<li>Trang ba??n y??u c????u kh??ng t????n ta??i.</li>\n	                <li>Li??n k????t ba??n v????a nh????n kh??ng co??n ????????c s???? du??ng.</li>\n	                <li>Trang na??y co?? th???? ??a?? ????????c chuy????n sang vi?? tri?? kha??c.</li>\n	                <li>Co?? th???? co?? l????i xa??y ra.</li>\n	                <li>Ba??n kh??ng ????????c c????p quy????n ?????? co?? th???? truy c????p trang na??y</li>', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(708, 1, 'vi', 'core/base/errors', 'reasons', '??i???u n??y c?? th??? x???y ra v?? nhi???u l?? do.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(709, 1, 'vi', 'core/base/errors', 'try_again', 'Vui l??ng th??? l???i trong v??i ph??t, ho???c quay tr??? l???i trang chu?? b???ng ca??ch <a href=\"http://cms.local/admin\"> nh???n v??o ????y </a>.', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(710, 1, 'vi', 'core/base/forms', 'choose_image', 'Ch???n ???nh', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(711, 1, 'vi', 'core/base/forms', 'actions', 'T??c v???', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(712, 1, 'vi', 'core/base/forms', 'save', 'L??u', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(713, 1, 'vi', 'core/base/forms', 'save_and_continue', 'L??u & ch???nh s???a', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(714, 1, 'vi', 'core/base/forms', 'image', 'H??nh ???nh', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(715, 1, 'vi', 'core/base/forms', 'image_placeholder', 'Ch??n ???????ng d???n h??nh ???nh ho???c nh???n n??t ????? ch???n h??nh', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(716, 1, 'vi', 'core/base/forms', 'create', 'T???o m???i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(717, 1, 'vi', 'core/base/forms', 'edit', 'S???a', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(718, 1, 'vi', 'core/base/forms', 'permalink', '????????ng d????n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(719, 1, 'vi', 'core/base/forms', 'ok', 'OK', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(720, 1, 'vi', 'core/base/forms', 'cancel', 'Hu??y bo??', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(721, 1, 'vi', 'core/base/forms', 'character_remain', 'k?? t??? c??n l???i', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(722, 1, 'vi', 'core/base/forms', 'template', 'Template', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(723, 1, 'vi', 'core/base/forms', 'choose_file', 'Ch???n t???p tin', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(724, 1, 'vi', 'core/base/forms', 'file', 'T???p tin', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(725, 1, 'vi', 'core/base/forms', 'content', 'N???i dung', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(726, 1, 'vi', 'core/base/forms', 'description', 'M?? t???', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(727, 1, 'vi', 'core/base/forms', 'name', 'T??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(728, 1, 'vi', 'core/base/forms', 'name_placeholder', 'Nh???p t??n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(729, 1, 'vi', 'core/base/forms', 'description_placeholder', 'M?? t??? ng???n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(730, 1, 'vi', 'core/base/forms', 'parent', 'Cha', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(731, 1, 'vi', 'core/base/forms', 'icon', 'Bi???u t?????ng', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(732, 1, 'vi', 'core/base/forms', 'order_by', 'S???p x???p', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(733, 1, 'vi', 'core/base/forms', 'order_by_placeholder', 'S???p x???p', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(734, 1, 'vi', 'core/base/forms', 'slug', 'Slug', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(735, 1, 'vi', 'core/base/forms', 'is_featured', 'N???i b???t?', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(736, 1, 'vi', 'core/base/forms', 'is_default', 'M???c ?????nh?', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(737, 1, 'vi', 'core/base/forms', 'icon_placeholder', 'V?? d???: fa fa-home', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(738, 1, 'vi', 'core/base/forms', 'update', 'C???p nh???t', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(739, 1, 'vi', 'core/base/forms', 'publish', 'Xu???t b???n', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(740, 1, 'vi', 'core/base/forms', 'remove_image', 'Xo?? ???nh', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(741, 1, 'vi', 'core/base/forms', 'add', 'Th??m', '2021-03-14 18:40:38', '2021-03-14 18:40:38'),
(742, 1, 'vi', 'core/base/forms', 'add_short_code', 'Th??m shortcode', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(743, 1, 'vi', 'core/base/forms', 'alias', 'M?? thay th???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(744, 1, 'vi', 'core/base/forms', 'alias_placeholder', 'M?? thay th???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(745, 1, 'vi', 'core/base/forms', 'basic_information', 'Th??ng tin c?? b???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(746, 1, 'vi', 'core/base/forms', 'link', 'Li??n k???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(747, 1, 'vi', 'core/base/forms', 'order', 'Th??? t???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(748, 1, 'vi', 'core/base/forms', 'short_code', 'Shortcode', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(749, 1, 'vi', 'core/base/forms', 'title', 'Ti??u ?????', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(750, 1, 'vi', 'core/base/forms', 'value', 'Gi?? tr???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(751, 1, 'vi', 'core/base/forms', 'show_hide_editor', '???n/Hi???n tr??nh so???n th???o', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(752, 1, 'vi', 'core/base/forms', 'basic_info_title', 'Th??ng tin c?? b???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(753, 1, 'vi', 'core/base/layouts', 'platform_admin', 'Qu???n tr??? h??? th???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(754, 1, 'vi', 'core/base/layouts', 'dashboard', 'B???ng ??i???u khi???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(755, 1, 'vi', 'core/base/layouts', 'appearance', 'Hi???n th???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(756, 1, 'vi', 'core/base/layouts', 'menu', 'Tr??nh ????n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(757, 1, 'vi', 'core/base/layouts', 'widgets', 'Ti???n ??ch', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(758, 1, 'vi', 'core/base/layouts', 'theme_options', 'Tu??? ch???n giao di???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(759, 1, 'vi', 'core/base/layouts', 'plugins', 'Ti???n ??ch m??? r???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(760, 1, 'vi', 'core/base/layouts', 'settings', 'C??i ?????t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(761, 1, 'vi', 'core/base/layouts', 'setting_general', 'C?? b???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(762, 1, 'vi', 'core/base/layouts', 'system_information', 'Th??ng tin h??? th???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(763, 1, 'vi', 'core/base/layouts', 'theme', 'Giao di???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(764, 1, 'vi', 'core/base/layouts', 'copyright', 'B???n quy???n :year &copy; :company. Phi??n b???n: <span>:version</span>', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(765, 1, 'vi', 'core/base/layouts', 'profile', 'Th??ng tin c?? nh??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(766, 1, 'vi', 'core/base/layouts', 'logout', '????ng xu???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(767, 1, 'vi', 'core/base/layouts', 'no_search_result', 'Kh??ng c?? k???t qu??? t??m ki???m, h??y th??? l???i v???i t??? kh??a kh??c.', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(768, 1, 'vi', 'core/base/layouts', 'home', 'Trang ch???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(769, 1, 'vi', 'core/base/layouts', 'search', 'T??m ki???m', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(770, 1, 'vi', 'core/base/layouts', 'add_new', 'Th??m m???i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(771, 1, 'vi', 'core/base/layouts', 'n_a', 'N/A', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(772, 1, 'vi', 'core/base/layouts', 'page_loaded_time', 'Trang t???i xong trong', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(773, 1, 'vi', 'core/base/layouts', 'view_website', 'Xem trang ngo??i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(774, 1, 'vi', 'core/base/layouts', 'setting_email', 'Email', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(775, 1, 'vi', 'core/base/mail', 'send-fail', 'G????i email kh??ng tha??nh c??ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(776, 1, 'vi', 'core/base/mail', 'happy_birthday', 'Ch??c m???ng sinh nh???t!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(777, 1, 'vi', 'core/base/notices', 'create_success_message', 'T???o th??nh c??ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(778, 1, 'vi', 'core/base/notices', 'update_success_message', 'C???p nh???t th??nh c??ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(779, 1, 'vi', 'core/base/notices', 'delete_success_message', 'X??a th??nh c??ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(780, 1, 'vi', 'core/base/notices', 'success_header', 'Th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(781, 1, 'vi', 'core/base/notices', 'error_header', 'L???i!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(782, 1, 'vi', 'core/base/notices', 'no_select', 'Cho??n i??t nh????t 1 tr?????ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(783, 1, 'vi', 'core/base/notices', 'cannot_delete', 'Kh??ng th??? x??a b???n ghi n??y', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(784, 1, 'vi', 'core/base/notices', 'processing_request', 'H??? th???ng ??ang x??? l?? y??u c???u.', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(785, 1, 'vi', 'core/base/notices', 'error', 'L???i!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(786, 1, 'vi', 'core/base/notices', 'success', 'Th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(787, 1, 'vi', 'core/base/notices', 'info', 'Th??ng tin!', '2021-03-14 18:40:39', '2021-03-14 18:40:39');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(788, 1, 'vi', 'core/base/system', 'no_select', 'Ha??y cho??n i??t nh????t 1 tr??????ng ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(789, 1, 'vi', 'core/base/system', 'cannot_find_user', 'Kh??ng th???? ta??i ????????c th??ng tin ng??????i du??ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(790, 1, 'vi', 'core/base/system', 'supper_revoked', 'Quy????n qua??n tri?? vi??n cao nh????t ??a?? ????????c g???? bo??', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(791, 1, 'vi', 'core/base/system', 'cannot_revoke_yourself', 'Kh??ng th??? g??? b??? quy???n qu???n tr??? c???p cao c???a ch??nh b???n!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(792, 1, 'vi', 'core/base/system', 'cant_remove_supper', 'Ba??n kh??ng co?? quy????n xo??a qua??n tri?? vi??n c????p cao', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(793, 1, 'vi', 'core/base/system', 'cant_find_user_with_email', 'Kh??ng th???? ti??m th????y ng??????i du??ng v????i email na??y', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(794, 1, 'vi', 'core/base/system', 'supper_granted', 'Quy????n qua??n tri?? cao nh????t ??a?? ????????c ga??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(795, 1, 'vi', 'core/base/system', 'delete_log_success', 'Xo??a t????p tin log tha??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(796, 1, 'vi', 'core/base/system', 'get_member_success', 'Hi????n thi?? danh sa??ch tha??nh vi??n tha??nh c??ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(797, 1, 'vi', 'core/base/system', 'error_occur', 'C?? l???i d?????i ????y', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(798, 1, 'vi', 'core/base/system', 'role_and_permission', 'Ph??n quy????n h???? th????ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(799, 1, 'vi', 'core/base/system', 'role_and_permission_description', 'Qua??n ly?? nh????ng ph??n quy????n trong h???? th????ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(800, 1, 'vi', 'core/base/system', 'user.list_super', 'Danh sa??ch qua??n tri?? vi??n c????p cao', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(801, 1, 'vi', 'core/base/system', 'user.username', 'T??n ????ng nh????p', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(802, 1, 'vi', 'core/base/system', 'user.email', 'Email', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(803, 1, 'vi', 'core/base/system', 'user.last_login', '????ng nh????p l????n cu????i	', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(804, 1, 'vi', 'core/base/system', 'user.add_user', 'Th??m qua??n tri?? vi??n c????p cao', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(805, 1, 'vi', 'core/base/system', 'user.cancel', 'Hu??y bo??', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(806, 1, 'vi', 'core/base/system', 'user.create', 'Th??m', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(807, 1, 'vi', 'core/base/system', 'options.features', 'Ki????m soa??t truy c????p ca??c ti??nh n??ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(808, 1, 'vi', 'core/base/system', 'options.feature_description', 'B????t/t????t ca??c ti??nh n??ng.', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(809, 1, 'vi', 'core/base/system', 'options.manage_super', 'Qua??n ly?? qua??n tri?? vi??n c????p cao', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(810, 1, 'vi', 'core/base/system', 'options.manage_super_description', 'Th??m/xo??a qua??n tri?? vi??n c????p cao', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(811, 1, 'vi', 'core/base/system', 'options.info', 'Th??ng tin h???? th????ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(812, 1, 'vi', 'core/base/system', 'options.info_description', 'Nh????ng th??ng tin v???? c????u hi??nh hi????n ta??i cu??a h???? th????ng.', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(813, 1, 'vi', 'core/base/system', 'info.title', 'Th??ng tin h???? th????ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(814, 1, 'vi', 'core/base/system', 'info.cache', 'B??? nh??? ?????m', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(815, 1, 'vi', 'core/base/system', 'info.environment', 'M??i tr?????ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(816, 1, 'vi', 'core/base/system', 'info.locale', 'Ng??n ng??? h??? th???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(817, 1, 'vi', 'core/base/system', 'user_management', 'Qu???n l?? th??nh vi??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(818, 1, 'vi', 'core/base/system', 'user_management_description', 'Qu???n l?? ng?????i d??ng trong h??? th???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(819, 1, 'vi', 'core/base/system', 'app_size', 'K??ch th?????c ???ng d???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(820, 1, 'vi', 'core/base/system', 'cache_dir_writable', 'C?? th??? ghi b??? nh??? ?????m', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(821, 1, 'vi', 'core/base/system', 'cache_driver', 'Lo???i l??u tr??? b??? nh??? ?????m', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(822, 1, 'vi', 'core/base/system', 'copy_report', 'Sao ch??p b??o c??o', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(823, 1, 'vi', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(824, 1, 'vi', 'core/base/system', 'database', 'H??? th???ng d??? li???u', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(825, 1, 'vi', 'core/base/system', 'debug_mode', 'Ch??? ????? s???a l???i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(826, 1, 'vi', 'core/base/system', 'dependency_name', 'T??n g??i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(827, 1, 'vi', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(828, 1, 'vi', 'core/base/system', 'extra_information', 'Th??ng tin m??? r???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(829, 1, 'vi', 'core/base/system', 'extra_stats', 'Th???ng k?? th??m', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(830, 1, 'vi', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(831, 1, 'vi', 'core/base/system', 'framework_version', 'Phi??n b???n framework', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(832, 1, 'vi', 'core/base/system', 'get_system_report', 'L???y th??ng tin h??? th???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(833, 1, 'vi', 'core/base/system', 'installed_packages', 'C??c g??i ???? c??i ?????t v?? phi??n b???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(834, 1, 'vi', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(835, 1, 'vi', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(836, 1, 'vi', 'core/base/system', 'package_name', 'T??n g??i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(837, 1, 'vi', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(838, 1, 'vi', 'core/base/system', 'php_version', 'Phi??n b???n PHP', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(839, 1, 'vi', 'core/base/system', 'report_description', 'Vui l??ng chia s??? th??ng tin n??y nh???m m???c ????ch ??i???u tra nguy??n nh??n g??y l???i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(840, 1, 'vi', 'core/base/system', 'server_environment', 'M??i tr?????ng m??y ch???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(841, 1, 'vi', 'core/base/system', 'server_os', 'H??? ??i???u h??nh c???a m??y ch???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(842, 1, 'vi', 'core/base/system', 'server_software', 'Ph???n m???m', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(843, 1, 'vi', 'core/base/system', 'session_driver', 'Lo???i l??u tr??? phi??n l??m vi???c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(844, 1, 'vi', 'core/base/system', 'ssl_installed', '???? c??i ?????t ch???ng ch??? SSL', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(845, 1, 'vi', 'core/base/system', 'storage_dir_writable', 'C?? th??? l??u tr??? d??? li???u t???m', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(846, 1, 'vi', 'core/base/system', 'system_environment', 'M??i tr?????ng h??? th???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(847, 1, 'vi', 'core/base/system', 'timezone', 'M??i gi???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(848, 1, 'vi', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(849, 1, 'vi', 'core/base/system', 'version', 'Phi??n b???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(850, 1, 'vi', 'core/base/system', 'cms_version', 'Phi??n b???n CMS', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(851, 1, 'vi', 'core/base/tables', 'filter_enabled', 'T??m ki???m n??ng cao ???? ???????c k??ch ho???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(852, 1, 'vi', 'core/base/tables', 'id', 'ID', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(853, 1, 'vi', 'core/base/tables', 'name', 'T??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(854, 1, 'vi', 'core/base/tables', 'order_by', 'Th??? t???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(855, 1, 'vi', 'core/base/tables', 'status', 'Tr???ng th??i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(856, 1, 'vi', 'core/base/tables', 'created_at', 'Ng??y t???o', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(857, 1, 'vi', 'core/base/tables', 'updated_at', 'Ng??y c???p nh???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(858, 1, 'vi', 'core/base/tables', 'operations', 'T??c v???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(859, 1, 'vi', 'core/base/tables', 'loading_data', '??ang t???i d??? li???u t??? server', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(860, 1, 'vi', 'core/base/tables', 'url', 'URL', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(861, 1, 'vi', 'core/base/tables', 'author', 'Ng??????i ta??o', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(862, 1, 'vi', 'core/base/tables', 'column', 'C????t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(863, 1, 'vi', 'core/base/tables', 'origin', 'Ba??n cu??', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(864, 1, 'vi', 'core/base/tables', 'after_change', 'Sau khi thay ??????i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(865, 1, 'vi', 'core/base/tables', 'notes', 'Ghi chu??', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(866, 1, 'vi', 'core/base/tables', 'activated', 'k??ch ho???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(867, 1, 'vi', 'core/base/tables', 'browser', 'Tr??nh duy???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(868, 1, 'vi', 'core/base/tables', 'deactivated', 'h???y k??ch ho???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(869, 1, 'vi', 'core/base/tables', 'description', 'M?? t???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(870, 1, 'vi', 'core/base/tables', 'session', 'Phi??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(871, 1, 'vi', 'core/base/tables', 'views', 'L?????t xem', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(872, 1, 'vi', 'core/base/tables', 'restore', 'Kh??i ph???c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(873, 1, 'vi', 'core/base/tables', 'edit', 'S???a', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(874, 1, 'vi', 'core/base/tables', 'delete', 'X??a', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(875, 1, 'vi', 'core/base/tables', 'action', 'H??nh ?????ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(876, 1, 'vi', 'core/base/tables', 'activate', 'K??ch ho???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(877, 1, 'vi', 'core/base/tables', 'add_new', 'Th??m m???i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(878, 1, 'vi', 'core/base/tables', 'all', 'T???t c???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(879, 1, 'vi', 'core/base/tables', 'cancel', 'H???y b???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(880, 1, 'vi', 'core/base/tables', 'confirm_delete', 'X??c nh???n x??a', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(881, 1, 'vi', 'core/base/tables', 'confirm_delete_msg', 'B???n c?? ch???c ch???n mu???n x??a b???n ghi n??y?', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(882, 1, 'vi', 'core/base/tables', 'csv', 'CSV', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(883, 1, 'vi', 'core/base/tables', 'deactivate', 'H???y k??ch ho???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(884, 1, 'vi', 'core/base/tables', 'delete_entry', 'X??a b???n ghi', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(885, 1, 'vi', 'core/base/tables', 'display', 'Hi???n th???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(886, 1, 'vi', 'core/base/tables', 'excel', 'Excel', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(887, 1, 'vi', 'core/base/tables', 'export', 'Xu???t b???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(888, 1, 'vi', 'core/base/tables', 'filter', 'Nh???p t??? kh??a...', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(889, 1, 'vi', 'core/base/tables', 'filtered_from', '???????c l???c t???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(890, 1, 'vi', 'core/base/tables', 'in', 'trong t???ng s???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(891, 1, 'vi', 'core/base/tables', 'loading', '??ang t???i d??? li???u t??? h??? th???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(892, 1, 'vi', 'core/base/tables', 'no_data', 'Kh??ng c?? d??? li???u ????? hi???n th???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(893, 1, 'vi', 'core/base/tables', 'no_record', 'Kh??ng c?? d??? li???u', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(894, 1, 'vi', 'core/base/tables', 'pdf', 'PDF', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(895, 1, 'vi', 'core/base/tables', 'print', 'In', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(896, 1, 'vi', 'core/base/tables', 'records', 'b???n ghi', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(897, 1, 'vi', 'core/base/tables', 'reload', 'T???i l???i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(898, 1, 'vi', 'core/base/tables', 'reset', 'L??m m???i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(899, 1, 'vi', 'core/base/tables', 'save', 'L??u', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(900, 1, 'vi', 'core/base/tables', 'show_from', 'Hi???n th??? t???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(901, 1, 'vi', 'core/base/tables', 'template', 'Giao di???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(902, 1, 'vi', 'core/base/tables', 'to', '?????n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(903, 1, 'vi', 'core/base/tables', 'view', 'Xem chi ti???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(904, 1, 'vi', 'core/base/tables', 'email', 'Email', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(905, 1, 'vi', 'core/base/tables', 'image', 'H??nh ???nh', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(906, 1, 'vi', 'core/base/tables', 'is_featured', 'N???i b???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(907, 1, 'vi', 'core/base/tables', 'last_login', 'L???n cu???i ????ng nh???p', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(908, 1, 'vi', 'core/base/tables', 'order', 'Th??? t???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(909, 1, 'vi', 'core/base/tables', 'shortcode', 'Shortcode', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(910, 1, 'vi', 'core/base/tables', 'slug', 'Slug', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(911, 1, 'vi', 'core/base/tables', 'title', 'Ti??u ?????', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(912, 1, 'vi', 'core/base/tabs', 'detail', 'Chi ti???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(913, 1, 'vi', 'core/base/tabs', 'file', 'T???p tin', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(914, 1, 'vi', 'core/base/tabs', 'record_note', 'Ghi ch??', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(915, 1, 'vi', 'core/base/tabs', 'revision', 'L???ch s??? thay ?????i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(916, 1, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(917, 1, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(918, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(919, 1, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(920, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(921, 1, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(922, 1, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(923, 1, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(924, 1, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(925, 1, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(926, 1, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(927, 1, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(928, 1, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(929, 1, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(930, 1, 'vi', 'core/dashboard/dashboard', 'cancel_hide_btn', 'H???y b???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(931, 1, 'vi', 'core/dashboard/dashboard', 'collapse_expand', 'M??? r???ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(932, 1, 'vi', 'core/dashboard/dashboard', 'confirm_hide', 'B???n c?? ch???c?', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(933, 1, 'vi', 'core/dashboard/dashboard', 'confirm_hide_btn', 'V??ng, ???n ti???n ??ch n??y', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(934, 1, 'vi', 'core/dashboard/dashboard', 'hide', '???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(935, 1, 'vi', 'core/dashboard/dashboard', 'hide_message', 'B???n c?? ch???c ch???n mu???n ???n ti???n ??ch n??y? N?? s??? kh??ng ???????c hi???n th??? tr??n trang ch??? n???a!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(936, 1, 'vi', 'core/dashboard/dashboard', 'hide_success', '???n ti???n ??ch th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(937, 1, 'vi', 'core/dashboard/dashboard', 'manage_widgets', 'Qu???n l?? ti???n ??ch', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(938, 1, 'vi', 'core/dashboard/dashboard', 'reload', 'L??m m???i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(939, 1, 'vi', 'core/dashboard/dashboard', 'save_setting_success', 'L??u ti???n ??ch th??nh c??ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(940, 1, 'vi', 'core/dashboard/dashboard', 'update_position_success', 'C???p nh???t v??? tr?? ti???n ??ch th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(941, 1, 'vi', 'core/dashboard/dashboard', 'widget_not_exists', 'Ti???n ??ch n??y kh??ng t???n t???i!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(942, 1, 'vi', 'core/dashboard/dashboard', 'fullscreen', 'To??n m??n h??nh', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(943, 1, 'vi', 'core/dashboard/dashboard', 'title', 'Trang qu???n tr???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(944, 1, 'en', 'core/media/media', 'filter', 'Filter', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(945, 1, 'en', 'core/media/media', 'everything', 'Everything', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(946, 1, 'en', 'core/media/media', 'image', 'Image', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(947, 1, 'en', 'core/media/media', 'video', 'Video', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(948, 1, 'en', 'core/media/media', 'document', 'Document', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(949, 1, 'en', 'core/media/media', 'view_in', 'View in', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(950, 1, 'en', 'core/media/media', 'all_media', 'All media', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(951, 1, 'en', 'core/media/media', 'trash', 'Trash', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(952, 1, 'en', 'core/media/media', 'recent', 'Recent', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(953, 1, 'en', 'core/media/media', 'favorites', 'Favorites', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(954, 1, 'en', 'core/media/media', 'upload', 'Upload', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(955, 1, 'en', 'core/media/media', 'create_folder', 'Create folder', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(956, 1, 'en', 'core/media/media', 'refresh', 'Refresh', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(957, 1, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(958, 1, 'en', 'core/media/media', 'search_file_and_folder', 'Search file and folder', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(959, 1, 'en', 'core/media/media', 'sort', 'Sort', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(960, 1, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(961, 1, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(962, 1, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(963, 1, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(964, 1, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(965, 1, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(966, 1, 'en', 'core/media/media', 'actions', 'Actions', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(967, 1, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(968, 1, 'en', 'core/media/media', 'insert', 'Insert', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(969, 1, 'en', 'core/media/media', 'folder_name', 'Folder name', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(970, 1, 'en', 'core/media/media', 'create', 'Create', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(971, 1, 'en', 'core/media/media', 'rename', 'Rename', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(972, 1, 'en', 'core/media/media', 'close', 'Close', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(973, 1, 'en', 'core/media/media', 'save_changes', 'Save changes', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(974, 1, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(975, 1, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(976, 1, 'en', 'core/media/media', 'confirm', 'Confirm', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(977, 1, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(978, 1, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(979, 1, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(980, 1, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(981, 1, 'en', 'core/media/media', 'up_level', 'Up one level', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(982, 1, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(983, 1, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(984, 1, 'en', 'core/media/media', 'gallery', 'Media gallery', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(985, 1, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(986, 1, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(987, 1, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(988, 1, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(989, 1, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(990, 1, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(991, 1, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(992, 1, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(993, 1, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(994, 1, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(995, 1, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(996, 1, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(997, 1, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(998, 1, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(999, 1, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1000, 1, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1001, 1, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1002, 1, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1003, 1, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1004, 1, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1005, 1, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1006, 1, 'en', 'core/media/media', 'menu_name', 'Media', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1007, 1, 'en', 'core/media/media', 'add', 'Add media', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1008, 1, 'en', 'core/media/media', 'javascript.name', 'Name', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1009, 1, 'en', 'core/media/media', 'javascript.url', 'URL', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1010, 1, 'en', 'core/media/media', 'javascript.full_url', 'Full URL', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1011, 1, 'en', 'core/media/media', 'javascript.size', 'Size', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1012, 1, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1013, 1, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1014, 1, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1015, 1, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1016, 1, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1017, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1018, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1019, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1020, 1, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1021, 1, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1022, 1, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1023, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1024, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1025, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1026, 1, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1027, 1, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1028, 1, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1029, 1, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1030, 1, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1031, 1, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1032, 1, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links has been copied to clipboard', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1033, 1, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1034, 1, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1035, 1, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1036, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1037, 1, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1038, 1, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1039, 1, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1040, 1, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1041, 1, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1042, 1, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1043, 1, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1044, 1, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1045, 1, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1046, 1, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1047, 1, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1048, 1, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1049, 1, 'vi', 'core/media/media', 'filter', 'L???c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1050, 1, 'vi', 'core/media/media', 'everything', 'T???t c???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1051, 1, 'vi', 'core/media/media', 'image', 'H??nh ???nh', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1052, 1, 'vi', 'core/media/media', 'video', 'Phim', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1053, 1, 'vi', 'core/media/media', 'document', 'T??i li???u', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1054, 1, 'vi', 'core/media/media', 'view_in', 'Ch??? ????? xem', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1055, 1, 'vi', 'core/media/media', 'all_media', 'T???t c??? t???p tin', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1056, 1, 'vi', 'core/media/media', 'trash', 'Th??ng r??c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1057, 1, 'vi', 'core/media/media', 'recent', 'G???n ????y', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1058, 1, 'vi', 'core/media/media', 'favorites', '???????c g???n d???u sao', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1059, 1, 'vi', 'core/media/media', 'upload', 'T???i l??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1060, 1, 'vi', 'core/media/media', 'add_from', 'Th??m t???', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1061, 1, 'vi', 'core/media/media', 'youtube', 'Youtube', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1062, 1, 'vi', 'core/media/media', 'vimeo', 'Vimeo', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1063, 1, 'vi', 'core/media/media', 'vine', 'Vine', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1064, 1, 'vi', 'core/media/media', 'daily_motion', 'Dailymotion', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1065, 1, 'vi', 'core/media/media', 'create_folder', 'T???o th?? m???c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1066, 1, 'vi', 'core/media/media', 'refresh', 'L??m m???i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1067, 1, 'vi', 'core/media/media', 'empty_trash', 'D???n th??ng r??c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1068, 1, 'vi', 'core/media/media', 'search_file_and_folder', 'T??m ki???m t???p tin v?? th?? m???c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1069, 1, 'vi', 'core/media/media', 'sort', 'S???p x???p', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1070, 1, 'vi', 'core/media/media', 'file_name_asc', 'T??n t???p tin - ASC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1071, 1, 'vi', 'core/media/media', 'file_name_desc', 'T??n t???p tin - DESC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1072, 1, 'vi', 'core/media/media', 'created_date_asc', 'Ng??y t???o - ASC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1073, 1, 'vi', 'core/media/media', 'created_date_desc', 'Ng??y t???o - DESC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1074, 1, 'vi', 'core/media/media', 'uploaded_date_asc', 'Ng??y t???i l??n - ASC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1075, 1, 'vi', 'core/media/media', 'uploaded_date_desc', 'Ng??y t???i l??n - DESC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1076, 1, 'vi', 'core/media/media', 'size_asc', 'K??ch th?????c - ASC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1077, 1, 'vi', 'core/media/media', 'size_desc', 'K??ch th?????c - DESC', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1078, 1, 'vi', 'core/media/media', 'actions', 'H??nh ?????ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1079, 1, 'vi', 'core/media/media', 'nothing_is_selected', 'Kh??ng c?? t???p tin n??o ???????c ch???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1080, 1, 'vi', 'core/media/media', 'insert', 'Ch??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1081, 1, 'vi', 'core/media/media', 'coming_soon', '??ang ph??t tri???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1082, 1, 'vi', 'core/media/media', 'add_from_youtube', 'Th??m t??? youtube', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1083, 1, 'vi', 'core/media/media', 'playlist', 'Playlist', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1084, 1, 'vi', 'core/media/media', 'add_url', 'Th??m ???????ng d???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1085, 1, 'vi', 'core/media/media', 'folder_name', 'T??n th?? m???c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1086, 1, 'vi', 'core/media/media', 'create', 'T???o', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1087, 1, 'vi', 'core/media/media', 'rename', '?????i t??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1088, 1, 'vi', 'core/media/media', 'close', '????ng', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1089, 1, 'vi', 'core/media/media', 'save_changes', 'L??u thay ?????i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1090, 1, 'vi', 'core/media/media', 'move_to_trash', '????a v??o th??ng r??c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1091, 1, 'vi', 'core/media/media', 'confirm_trash', 'B???n c?? ch???c ch???n mu???n b??? nh???ng t???p tin n??y v??o th??ng r??c?', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1092, 1, 'vi', 'core/media/media', 'confirm', 'X??c nh???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1093, 1, 'vi', 'core/media/media', 'confirm_delete', 'X??a t???p tin', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1094, 1, 'vi', 'core/media/media', 'confirm_delete_description', 'H??nh ?????ng n??y kh??ng th??? kh??i ph???c. B???n c?? ch???c ch???n mu???n x??a c??c t???p tin n??y?', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1095, 1, 'vi', 'core/media/media', 'empty_trash_title', 'D???n s???ch th??ng r??c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1096, 1, 'vi', 'core/media/media', 'empty_trash_description', 'H??nh ?????ng n??y kh??ng th??? kh??i ph???c. B???n c?? ch???c ch???n mu???n d???n s???ch th??ng r??c?', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1097, 1, 'vi', 'core/media/media', 'up_level', 'Quay l???i m???t c???p', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1098, 1, 'vi', 'core/media/media', 'upload_progress', 'Ti???n tr??nh t???i l??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1099, 1, 'vi', 'core/media/media', 'name_reserved', 'T??n n??y kh??ng ???????c ph??p ?????t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1100, 1, 'vi', 'core/media/media', 'folder_created', 'T???o th?? m???c th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1101, 1, 'vi', 'core/media/media', 'gallery', 'Th?? vi???n t???p tin', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1102, 1, 'vi', 'core/media/media', 'trash_error', 'C?? l???i khi x??a t???p tin/th?? m???c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1103, 1, 'vi', 'core/media/media', 'trash_success', 'X??a t???p tin/th?? m???c th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1104, 1, 'vi', 'core/media/media', 'restore_error', 'C?? l???i trong qu?? tr??nh kh??i ph???c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1105, 1, 'vi', 'core/media/media', 'restore_success', 'Kh??i ph???c th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1106, 1, 'vi', 'core/media/media', 'copy_success', 'Sao ch??p th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1107, 1, 'vi', 'core/media/media', 'delete_success', 'X??a th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1108, 1, 'vi', 'core/media/media', 'favorite_success', 'Th??m d???u sao th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1109, 1, 'vi', 'core/media/media', 'remove_favorite_success', 'B??? d???u sao th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1110, 1, 'vi', 'core/media/media', 'rename_error', 'C?? l???i trong qu?? tr??nh ?????i t??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1111, 1, 'vi', 'core/media/media', 'rename_success', '?????i t??n th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1112, 1, 'vi', 'core/media/media', 'invalid_action', 'H??nh ?????ng kh??ng h???p l???!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1113, 1, 'vi', 'core/media/media', 'file_not_exists', 'T???p tin kh??ng t???n t???i!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1114, 1, 'vi', 'core/media/media', 'download_file_error', 'C?? l???i trong qu?? tr??nh t???i xu???ng t???p tin!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1115, 1, 'vi', 'core/media/media', 'missing_zip_archive_extension', 'H??y b???t ZipArchive extension ????? t???i t???p tin!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1116, 1, 'vi', 'core/media/media', 'can_not_download_file', 'Kh??ng th??? t???i t???p tin!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1117, 1, 'vi', 'core/media/media', 'invalid_request', 'Y??u c???u kh??ng h???p l???!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1118, 1, 'vi', 'core/media/media', 'add_success', 'Th??m th??nh c??ng!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1119, 1, 'vi', 'core/media/media', 'file_too_big', 'T???p tin qu?? l???n. Gi???i h???n t???i l??n l?? :size bytes', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1120, 1, 'vi', 'core/media/media', 'can_not_detect_file_type', 'Lo???i t???p tin kh??ng h???p l??? ho???c kh??ng th??? x??c ?????nh lo???i t???p tin!', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1121, 1, 'vi', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1122, 1, 'vi', 'core/media/media', 'menu_name', 'Qu???n l?? t???p tin', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1123, 1, 'vi', 'core/media/media', 'add', 'Th??m t???p tin', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1124, 1, 'vi', 'core/media/media', 'javascript.name', 'T??n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1125, 1, 'vi', 'core/media/media', 'javascript.url', '???????ng d???n', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1126, 1, 'vi', 'core/media/media', 'javascript.full_url', '???????ng d???n tuy???t ?????i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1127, 1, 'vi', 'core/media/media', 'javascript.size', 'K??ch th?????c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1128, 1, 'vi', 'core/media/media', 'javascript.mime_type', 'Lo???i', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1129, 1, 'vi', 'core/media/media', 'javascript.created_at', '???????c t???i l??n l??c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1130, 1, 'vi', 'core/media/media', 'javascript.updated_at', '???????c ch???nh s???a l??c', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1131, 1, 'vi', 'core/media/media', 'javascript.nothing_selected', 'B???n ch??a ch???n t???p tin n??o', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1132, 1, 'vi', 'core/media/media', 'javascript.visit_link', 'M??? li??n k???t', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1133, 1, 'vi', 'core/media/media', 'javascript.add_from.youtube.original_msg', 'Vui l??ng nh???p ch??nh x??c ???????ng d???n Youtube', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1134, 1, 'vi', 'core/media/media', 'javascript.add_from.youtube.no_api_key_msg', 'Vui l??ng khai b??o API key c???a Youtube', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1135, 1, 'vi', 'core/media/media', 'javascript.add_from.youtube.invalid_url_msg', 'Li??n k???t n??y kh??ng d???n ?????n Youtube', '2021-03-14 18:40:39', '2021-03-14 18:40:39'),
(1136, 1, 'vi', 'core/media/media', 'javascript.add_from.youtube.error_msg', 'C?? l???i x???y ra trong ti???n tr??nh th???c hi???n...', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1137, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1138, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.title', 'B???n c?? th??? k??o th??? t???p tin v??o ????y ????? t???i l??n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1139, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.message', 'Ho???c c?? th??? b???m n??t T???i l??n ??? ph??a tr??n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1140, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1141, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.title', 'Hi???n t???i kh??ng c?? t???p tin n??o trong th??ng r??c', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1142, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.message', 'X??a t???p tin s??? ??em t???p tin l??u v??o th??ng r??c. X??a t???p tin trong th??ng r??c s??? x??a v??nh vi???n.', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1143, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1144, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.title', 'B???n ch??a ?????t t???p tin n??o v??o m???c y??u th??ch', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1145, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.message', 'Th??m t???p tin v??o m???c y??u th??ch ????? t??m ki???m ch??ng d??? d??ng sau n??y.', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1146, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1147, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.title', 'B???n ch??a m??? t???p tin n??o.', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1148, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.message', 'M???c n??y hi???n th??? c??c t???p tin b???n ???? xem g???n ????y.', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1149, 1, 'vi', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1150, 1, 'vi', 'core/media/media', 'javascript.no_item.default.title', 'Th?? m???c tr???ng', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1151, 1, 'vi', 'core/media/media', 'javascript.no_item.default.message', 'Th?? m???c n??y ch??a c?? t???p tin n??o', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1152, 1, 'vi', 'core/media/media', 'javascript.clipboard.success', '???????ng d???n c???a c??c t???p tin ???? ???????c sao ch??p v??o clipboard', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1153, 1, 'vi', 'core/media/media', 'javascript.message.error_header', 'L???i', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1154, 1, 'vi', 'core/media/media', 'javascript.message.success_header', 'Th??nh c??ng', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1155, 1, 'vi', 'core/media/media', 'javascript.download.error', 'B???n ch??a ch???n t???p tin n??o ho???c t???p tin n??y kh??ng cho ph??p t???i v???', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1156, 1, 'vi', 'core/media/media', 'javascript.actions_list.basic.preview', 'Xem tr?????c', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1157, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Sao ch??p ???????ng d???n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1158, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.rename', '?????i t??n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1159, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Nh??n b???n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1160, 1, 'vi', 'core/media/media', 'javascript.actions_list.user.favorite', 'Y??u th??ch', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1161, 1, 'vi', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'X??a kh???i m???c y??u th??ch', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1162, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.download', 'T???i xu???ng', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1163, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.trash', 'Chuy???n v??o th??ng r??c', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1164, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.delete', 'X??a ho??n to??n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1165, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.restore', 'Kh??i ph???c', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1166, 1, 'vi', 'core/media/media', 'empty_trash_success', 'D???n s???ch th??ng r??c th??nh c??ng', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1167, 1, 'vi', 'core/media/media', 'name_invalid', 'T??n th?? m???c ch???a k?? t??? kh??ng h???p l???', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1168, 1, 'en', 'core/setting/setting', 'title', 'Settings', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1169, 1, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1170, 1, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1171, 1, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1172, 1, 'en', 'core/setting/setting', 'general.title', 'General', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1173, 1, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1174, 1, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1175, 1, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1176, 1, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1177, 1, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1178, 1, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1179, 1, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1180, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1181, 1, 'en', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1182, 1, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1183, 1, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1184, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2021-03-14 18:40:40', '2021-03-14 18:40:40');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1185, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1186, 1, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1187, 1, 'en', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Google Site Verification', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1188, 1, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1189, 1, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1190, 1, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1191, 1, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1192, 1, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1193, 1, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1194, 1, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1195, 1, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1196, 1, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1197, 1, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1198, 1, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1199, 1, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1200, 1, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1201, 1, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1202, 1, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1203, 1, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1204, 1, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1205, 1, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1206, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1207, 1, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1208, 1, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1209, 1, 'en', 'core/setting/setting', 'general.no', 'No', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1210, 1, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1211, 1, 'en', 'core/setting/setting', 'general.select', '??? Select ???', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1212, 1, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1213, 1, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1214, 1, 'en', 'core/setting/setting', 'general.locale_direction', 'Language direction', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1215, 1, 'en', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1216, 1, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1217, 1, 'en', 'core/setting/setting', 'email.content', 'Content', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1218, 1, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1219, 1, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1220, 1, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1221, 1, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1222, 1, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1223, 1, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1224, 1, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1225, 1, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1226, 1, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1227, 1, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1228, 1, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1229, 1, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1230, 1, 'en', 'core/setting/setting', 'email.port', 'Port', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1231, 1, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1232, 1, 'en', 'core/setting/setting', 'email.host', 'Host', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1233, 1, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1234, 1, 'en', 'core/setting/setting', 'email.username', 'Username', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1235, 1, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1236, 1, 'en', 'core/setting/setting', 'email.password', 'Password', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1237, 1, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1238, 1, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1239, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1240, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1241, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1242, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1243, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1244, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1245, 1, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1246, 1, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1247, 1, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1248, 1, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1249, 1, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1250, 1, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1251, 1, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1252, 1, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1253, 1, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1254, 1, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1255, 1, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1256, 1, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1257, 1, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1258, 1, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1259, 1, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1260, 1, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1261, 1, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1262, 1, 'en', 'core/setting/setting', 'email.default', 'Default', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1263, 1, 'en', 'core/setting/setting', 'email.using_queue_to_send_mail', 'Using queue job to send emails (Must to setup Queue first https://laravel.com/docs/queues#supervisor-configuration)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1264, 1, 'en', 'core/setting/setting', 'media.title', 'Media', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1265, 1, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1266, 1, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1267, 1, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1268, 1, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1269, 1, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1270, 1, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1271, 1, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1272, 1, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1273, 1, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1274, 1, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1275, 1, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1276, 1, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1277, 1, 'en', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Is DO Spaces CDN enabled?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1278, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1279, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://your-custom-domain.com', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1280, 1, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1281, 1, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1282, 1, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1283, 1, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1284, 1, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1285, 1, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1286, 1, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1287, 1, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1288, 1, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1289, 1, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1290, 1, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1291, 1, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1292, 1, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1293, 1, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1294, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1295, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1296, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1297, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1298, 1, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1299, 1, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1300, 1, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1301, 1, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1302, 1, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1303, 1, 'en', 'core/setting/setting', 'template', 'Template', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1304, 1, 'en', 'core/setting/setting', 'description', 'Description', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1305, 1, 'en', 'core/setting/setting', 'enable', 'Enable', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1306, 1, 'en', 'core/setting/setting', 'send', 'Send', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1307, 1, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1308, 1, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1309, 1, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1310, 1, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1311, 1, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1312, 1, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1313, 1, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1314, 1, 'vi', 'core/setting/setting', 'title', 'Ca??i ??????t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1315, 1, 'vi', 'core/setting/setting', 'general.theme', 'Giao di???n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1316, 1, 'vi', 'core/setting/setting', 'general.description', 'C????u hi??nh nh????ng th??ng tin ca??i ??????t website.', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1317, 1, 'vi', 'core/setting/setting', 'general.title', 'Th??ng tin chung', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1318, 1, 'vi', 'core/setting/setting', 'general.general_block', 'Th??ng tin chung', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1319, 1, 'vi', 'core/setting/setting', 'general.site_title', 'T??n trang', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1320, 1, 'vi', 'core/setting/setting', 'general.admin_email', 'Email qua??n tri?? vi??n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1321, 1, 'vi', 'core/setting/setting', 'general.seo_block', 'C???u hi??nh SEO', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1322, 1, 'vi', 'core/setting/setting', 'general.seo_title', 'Ti??u ????? SEO', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1323, 1, 'vi', 'core/setting/setting', 'general.seo_description', 'M?? t??? SEO', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1324, 1, 'vi', 'core/setting/setting', 'general.seo_keywords', 'T??? kho?? SEO', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1325, 1, 'vi', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1326, 1, 'vi', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1327, 1, 'vi', 'core/setting/setting', 'general.enable_captcha', 'S???? du??ng Captcha?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1328, 1, 'vi', 'core/setting/setting', 'general.contact_block', 'Th??ng tin li??n h????', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1329, 1, 'vi', 'core/setting/setting', 'general.placeholder.site_title', 'T??n trang (t????i ??a 120 ki?? t????)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1330, 1, 'vi', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1331, 1, 'vi', 'core/setting/setting', 'general.placeholder.google_analytics', 'V?? d???: UA-42767940-2', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1332, 1, 'vi', 'core/setting/setting', 'general.placeholder.google_site_verification', 'M?? x??c nh???n trang web d??ng cho Google Webmaster Tool', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1333, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_title', 'Ti??u ????? SEO (t????i ??a 120 ki?? t????)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1334, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_description', 'M?? t??? SEO (t????i ??a 120 ki?? t????)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1335, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_keywords', 'T??? kho?? SEO (t????i ??a 60 ki?? t????, ph??n ca??ch t???? kho??a b????ng d????u ph????y)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1336, 1, 'vi', 'core/setting/setting', 'general.enable_change_admin_theme', 'Cho ph??p thay ?????i giao di???n qu???n tr????', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1337, 1, 'vi', 'core/setting/setting', 'general.enable_multi_language_in_admin', 'Cho ph??p thay ?????i ng??n ng??? trang qu???n tr????', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1338, 1, 'vi', 'core/setting/setting', 'general.enable', 'B???t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1339, 1, 'vi', 'core/setting/setting', 'general.disable', 'T???t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1340, 1, 'vi', 'core/setting/setting', 'general.enable_cache', 'B???t b??? nh??? ?????m?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1341, 1, 'vi', 'core/setting/setting', 'general.cache_time', 'Th???i gian l??u b??? nh??? ?????m (ph??t)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1342, 1, 'vi', 'core/setting/setting', 'general.cache_time_site_map', 'Th???i gian l??u s?? ????? trang trong b??? nh??? ?????m', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1343, 1, 'vi', 'core/setting/setting', 'general.admin_logo', 'Logo trang qu???n tr???', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1344, 1, 'vi', 'core/setting/setting', 'general.admin_title', 'Ti??u ????? trang qu???n tr???', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1345, 1, 'vi', 'core/setting/setting', 'general.admin_title_placeholder', 'Ti??u ????? hi???n th??? tr??n th??? tr??nh duy???t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1346, 1, 'vi', 'core/setting/setting', 'general.rich_editor', 'B??? so???n th???o v??n b???n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1347, 1, 'vi', 'core/setting/setting', 'general.cache_block', 'B??? nh??? ?????m', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1348, 1, 'vi', 'core/setting/setting', 'general.yes', 'B???t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1349, 1, 'vi', 'core/setting/setting', 'general.no', 'T???t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1350, 1, 'vi', 'core/setting/setting', 'email.subject', 'Ti??u ?????', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1351, 1, 'vi', 'core/setting/setting', 'email.content', 'N???i dung', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1352, 1, 'vi', 'core/setting/setting', 'email.title', 'C???u h??nh email template', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1353, 1, 'vi', 'core/setting/setting', 'email.description', 'C???u tr??c file template s??? d???ng HTML v?? c??c bi???n trong h??? th???ng.', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1354, 1, 'vi', 'core/setting/setting', 'email.reset_to_default', 'Kh??i ph???c v??? m???c ?????nh', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1355, 1, 'vi', 'core/setting/setting', 'email.back', 'Tr??? l???i trang c??i ?????t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1356, 1, 'vi', 'core/setting/setting', 'email.reset_success', 'Kh??i ph???c m???c ?????nh th??nh c??ng', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1357, 1, 'vi', 'core/setting/setting', 'email.confirm_reset', 'X??c nh???n kh??i ph???c m???c ?????nh?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1358, 1, 'vi', 'core/setting/setting', 'email.confirm_message', 'B???n c?? ch???c ch???n mu???n kh??i ph???c v??? b???n m???c ?????nh?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1359, 1, 'vi', 'core/setting/setting', 'email.continue', 'Ti???p t???c', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1360, 1, 'vi', 'core/setting/setting', 'email.sender_name', 'T??n ng?????i g???i', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1361, 1, 'vi', 'core/setting/setting', 'email.sender_name_placeholder', 'T??n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1362, 1, 'vi', 'core/setting/setting', 'email.sender_email', 'Email c???a ng?????i g???i', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1363, 1, 'vi', 'core/setting/setting', 'email.driver', 'Lo???i', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1364, 1, 'vi', 'core/setting/setting', 'email.port', 'C???ng', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1365, 1, 'vi', 'core/setting/setting', 'email.port_placeholder', 'V?? d???: 587', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1366, 1, 'vi', 'core/setting/setting', 'email.host', 'M??y ch???', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1367, 1, 'vi', 'core/setting/setting', 'email.host_placeholder', 'V?? d???: smtp.gmail.com', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1368, 1, 'vi', 'core/setting/setting', 'email.username', 'T??n ????ng nh???p', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1369, 1, 'vi', 'core/setting/setting', 'email.username_placeholder', 'T??n ????ng nh???p v??o m??y ch??? mail', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1370, 1, 'vi', 'core/setting/setting', 'email.password', 'M???t kh???u', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1371, 1, 'vi', 'core/setting/setting', 'email.password_placeholder', 'M???t kh???u ????ng nh???p v??o m??y ch??? mail', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1372, 1, 'vi', 'core/setting/setting', 'email.encryption', 'M?? ho??', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1373, 1, 'vi', 'core/setting/setting', 'email.mail_gun_domain', 'T??n mi???n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1374, 1, 'vi', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'T??n mi???n', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1375, 1, 'vi', 'core/setting/setting', 'email.mail_gun_secret', 'Chu???i b?? m???t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1376, 1, 'vi', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Chu???i b?? m???t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1377, 1, 'vi', 'core/setting/setting', 'email.template_title', 'M???u giao di???n email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1378, 1, 'vi', 'core/setting/setting', 'email.template_description', 'Giao di???n m???c ?????nh cho t???t c??? email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1379, 1, 'vi', 'core/setting/setting', 'email.template_header', 'M???u cho ph???n tr??n c???a email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1380, 1, 'vi', 'core/setting/setting', 'email.template_header_description', 'Ph???n tr??n c???a t???t c??? email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1381, 1, 'vi', 'core/setting/setting', 'email.template_footer', 'M???u cho ph???n d?????i c???a email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1382, 1, 'vi', 'core/setting/setting', 'email.template_footer_description', 'Ph???n d?????i c???a t???t c??? email', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1383, 1, 'vi', 'core/setting/setting', 'save_settings', 'L??u c??i ?????t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1384, 1, 'vi', 'core/setting/setting', 'template', 'M???u', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1385, 1, 'vi', 'core/setting/setting', 'description', 'M?? t???', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1386, 1, 'vi', 'core/setting/setting', 'enable', 'B???t', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1387, 1, 'vi', 'core/setting/setting', 'test_send_mail', 'G???i th??? nghi???m', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1388, 1, 'en', 'core/table/general', 'operations', 'Operations', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1389, 1, 'en', 'core/table/general', 'loading_data', 'Loading data from server', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1390, 1, 'en', 'core/table/general', 'display', 'Display', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1391, 1, 'en', 'core/table/general', 'all', 'All', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1392, 1, 'en', 'core/table/general', 'edit_entry', 'Edit', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1393, 1, 'en', 'core/table/general', 'delete_entry', 'Delete', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1394, 1, 'en', 'core/table/general', 'show_from', 'Showing from', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1395, 1, 'en', 'core/table/general', 'to', 'to', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1396, 1, 'en', 'core/table/general', 'in', 'in', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1397, 1, 'en', 'core/table/general', 'records', 'records', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1398, 1, 'en', 'core/table/general', 'no_data', 'No data to display', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1399, 1, 'en', 'core/table/general', 'no_record', 'No record', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1400, 1, 'en', 'core/table/general', 'loading', 'Loading data from server', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1401, 1, 'en', 'core/table/general', 'confirm_delete', 'Confirm delete', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1402, 1, 'en', 'core/table/general', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1403, 1, 'en', 'core/table/general', 'cancel', 'Cancel', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1404, 1, 'en', 'core/table/general', 'delete', 'Delete', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1405, 1, 'en', 'core/table/general', 'close', 'Close', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1406, 1, 'en', 'core/table/general', 'contains', 'Contains', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1407, 1, 'en', 'core/table/general', 'is_equal_to', 'Is equal to', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1408, 1, 'en', 'core/table/general', 'greater_than', 'Greater than', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1409, 1, 'en', 'core/table/general', 'less_than', 'Less than', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1410, 1, 'en', 'core/table/general', 'value', 'Value', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1411, 1, 'en', 'core/table/general', 'select_field', 'Select field', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1412, 1, 'en', 'core/table/general', 'reset', 'Reset', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1413, 1, 'en', 'core/table/general', 'add_additional_filter', 'Add additional filter', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1414, 1, 'en', 'core/table/general', 'apply', 'Apply', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1415, 1, 'en', 'core/table/general', 'filters', 'Filters', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1416, 1, 'en', 'core/table/general', 'bulk_change', 'Bulk changes', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1417, 1, 'en', 'core/table/general', 'select_option', 'Select option', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1418, 1, 'en', 'core/table/general', 'bulk_actions', 'Bulk Actions', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1419, 1, 'en', 'core/table/general', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1420, 1, 'en', 'core/table/general', 'please_select_record', 'Please select at least one record to perform this action!', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1421, 1, 'en', 'core/table/general', 'filtered', '(filtered from _MAX_ total records)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1422, 1, 'en', 'core/table/general', 'search', 'Search...', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1423, 1, 'en', 'core/table/table', 'operations', 'Operations', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1424, 1, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1425, 1, 'en', 'core/table/table', 'display', 'Display', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1426, 1, 'en', 'core/table/table', 'all', 'All', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1427, 1, 'en', 'core/table/table', 'edit_entry', 'Edit', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1428, 1, 'en', 'core/table/table', 'delete_entry', 'Delete', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1429, 1, 'en', 'core/table/table', 'show_from', 'Showing from', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1430, 1, 'en', 'core/table/table', 'to', 'to', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1431, 1, 'en', 'core/table/table', 'in', 'in', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1432, 1, 'en', 'core/table/table', 'records', 'records', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1433, 1, 'en', 'core/table/table', 'no_data', 'No data to display', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1434, 1, 'en', 'core/table/table', 'no_record', 'No record', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1435, 1, 'en', 'core/table/table', 'loading', 'Loading data from server', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1436, 1, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1437, 1, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1438, 1, 'en', 'core/table/table', 'cancel', 'Cancel', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1439, 1, 'en', 'core/table/table', 'delete', 'Delete', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1440, 1, 'en', 'core/table/table', 'close', 'Close', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1441, 1, 'en', 'core/table/table', 'contains', 'Contains', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1442, 1, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1443, 1, 'en', 'core/table/table', 'greater_than', 'Greater than', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1444, 1, 'en', 'core/table/table', 'less_than', 'Less than', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1445, 1, 'en', 'core/table/table', 'value', 'Value', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1446, 1, 'en', 'core/table/table', 'select_field', 'Select field', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1447, 1, 'en', 'core/table/table', 'reset', 'Reset', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1448, 1, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1449, 1, 'en', 'core/table/table', 'apply', 'Apply', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1450, 1, 'en', 'core/table/table', 'filters', 'Filters', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1451, 1, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1452, 1, 'en', 'core/table/table', 'select_option', 'Select option', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1453, 1, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1454, 1, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1455, 1, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1456, 1, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1457, 1, 'en', 'core/table/table', 'search', 'Search...', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1458, 1, 'vi', 'core/table/general', 'operations', 'H??nh ?????ng', '2021-03-14 18:40:40', '2021-03-14 18:40:40'),
(1459, 1, 'vi', 'core/table/general', 'loading_data', '??ang t???i d??? li???u t??? h??? th???ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1460, 1, 'vi', 'core/table/general', 'display', 'Hi???n th???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1461, 1, 'vi', 'core/table/general', 'all', 'T???t c???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1462, 1, 'vi', 'core/table/general', 'edit_entry', 'S???a', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1463, 1, 'vi', 'core/table/general', 'delete_entry', 'Xo??', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1464, 1, 'vi', 'core/table/general', 'show_from', 'Hi???n th??? t???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1465, 1, 'vi', 'core/table/general', 'to', '?????n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1466, 1, 'vi', 'core/table/general', 'in', 'trong t???ng s???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1467, 1, 'vi', 'core/table/general', 'records', 'b???n ghi', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1468, 1, 'vi', 'core/table/general', 'no_data', 'Kh??ng c?? d??? li???u ????? hi???n th???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1469, 1, 'vi', 'core/table/general', 'no_record', 'kh??ng c?? b???n ghi n??o', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1470, 1, 'vi', 'core/table/general', 'loading', '??ang t???i d??? li???u t??? h??? th???ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1471, 1, 'vi', 'core/table/general', 'confirm_delete', 'X??c nh???n xo??', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1472, 1, 'vi', 'core/table/general', 'confirm_delete_msg', 'B???n c?? ch???c ch???n mu???n xo?? b???n ghi n??y?', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1473, 1, 'vi', 'core/table/general', 'cancel', 'Hu??? b???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1474, 1, 'vi', 'core/table/general', 'delete', 'Xo??', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1475, 1, 'vi', 'core/table/general', 'close', '????ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1476, 1, 'vi', 'core/table/general', 'is_equal_to', 'B???ng v???i', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1477, 1, 'vi', 'core/table/general', 'greater_than', 'L???n h??n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1478, 1, 'vi', 'core/table/general', 'less_than', 'Nh??? h??n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1479, 1, 'vi', 'core/table/general', 'value', 'Gi?? tr???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1480, 1, 'vi', 'core/table/general', 'select_field', 'Ch???n tr?????ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1481, 1, 'vi', 'core/table/general', 'reset', 'L??m m???i', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1482, 1, 'vi', 'core/table/general', 'add_additional_filter', 'Th??m b??? l???c', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1483, 1, 'vi', 'core/table/general', 'apply', '??p d???ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1484, 1, 'vi', 'core/table/general', 'select_option', 'L???a ch???n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1485, 1, 'vi', 'core/table/general', 'filters', 'L???c d??? li???u', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1486, 1, 'vi', 'core/table/general', 'bulk_change', 'Thay ?????i h??ng lo???t', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1487, 1, 'vi', 'core/table/general', 'bulk_actions', 'H??nh ?????ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1488, 1, 'vi', 'core/table/general', 'contains', 'Bao g???m', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1489, 1, 'vi', 'core/table/general', 'filtered', '(???? ???????c l???c t??? _MAX_ b???n ghi)', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1490, 1, 'en', 'packages/menu/menu', 'name', 'Menus', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1491, 1, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1492, 1, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1493, 1, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1494, 1, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1495, 1, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1496, 1, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1497, 1, 'en', 'packages/menu/menu', 'remove', 'Remove', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1498, 1, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1499, 1, 'en', 'packages/menu/menu', 'title', 'Title', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1500, 1, 'en', 'packages/menu/menu', 'icon', 'Icon', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1501, 1, 'en', 'packages/menu/menu', 'url', 'URL', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1502, 1, 'en', 'packages/menu/menu', 'target', 'Target', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1503, 1, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1504, 1, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1505, 1, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1506, 1, 'en', 'packages/menu/menu', 'create', 'Create menu', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1507, 1, 'en', 'packages/menu/menu', 'edit', 'Edit menu', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1508, 1, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1509, 1, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1510, 1, 'vi', 'packages/menu/menu', 'name', 'Menu', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1511, 1, 'vi', 'packages/menu/menu', 'cancel', 'Hu??y bo??', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1512, 1, 'vi', 'packages/menu/menu', 'add_link', 'Th??m li??n k???t', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1513, 1, 'vi', 'packages/menu/menu', 'add_to_menu', 'Th??m v??o tr??nh ????n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1514, 1, 'vi', 'packages/menu/menu', 'basic_info', 'Th??ng tin c?? b???n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1515, 1, 'vi', 'packages/menu/menu', 'blank_open_link', 'M??? li??n k???t trong tab m???i', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1516, 1, 'vi', 'packages/menu/menu', 'css_class', 'CSS class', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1517, 1, 'vi', 'packages/menu/menu', 'custom_link', 'Li??n k???t t??y ch???n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1518, 1, 'vi', 'packages/menu/menu', 'icon', 'Bi???u t?????ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1519, 1, 'vi', 'packages/menu/menu', 'key_name', 'T??n menu (key::key)', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1520, 1, 'vi', 'packages/menu/menu', 'remove', 'X??a', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1521, 1, 'vi', 'packages/menu/menu', 'self_open_link', 'M??? li??n k???t trong tab hi???n t???i', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1522, 1, 'vi', 'packages/menu/menu', 'structure', 'C???u tr??c tr??nh ????n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1523, 1, 'vi', 'packages/menu/menu', 'target', 'Target', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1524, 1, 'vi', 'packages/menu/menu', 'title', 'Ti??u ?????', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1525, 1, 'vi', 'packages/menu/menu', 'url', 'URL', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1526, 1, 'vi', 'packages/menu/menu', 'create', 'T???o tr??nh ????n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1527, 1, 'vi', 'packages/menu/menu', 'edit', 'S???a tr??nh ????n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1528, 1, 'en', 'packages/optimize/optimize', 'settings.title', 'Optimize page speed', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1529, 1, 'en', 'packages/optimize/optimize', 'settings.description', 'Minify HTML output, inline CSS, remove comments...', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1530, 1, 'en', 'packages/optimize/optimize', 'settings.enable', 'Enable optimize page speed?', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1531, 1, 'en', 'packages/page/pages', 'create', 'Create new page', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1532, 1, 'en', 'packages/page/pages', 'edit', 'Edit page', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1533, 1, 'en', 'packages/page/pages', 'form.name', 'Name', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1534, 1, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1535, 1, 'en', 'packages/page/pages', 'form.content', 'Content', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1536, 1, 'en', 'packages/page/pages', 'form.note', 'Note content', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1537, 1, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1538, 1, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1539, 1, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1540, 1, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1541, 1, 'en', 'packages/page/pages', 'pages', 'Pages', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1542, 1, 'en', 'packages/page/pages', 'menu', 'Pages', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1543, 1, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1544, 1, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1545, 1, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1546, 1, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1547, 1, 'en', 'packages/page/pages', 'settings.select', '??? Select ???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1548, 1, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1549, 1, 'vi', 'packages/page/pages', 'model', 'Trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1550, 1, 'vi', 'packages/page/pages', 'models', 'Trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1551, 1, 'vi', 'packages/page/pages', 'list', 'Danh sa??ch trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1552, 1, 'vi', 'packages/page/pages', 'create', 'Th??m trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1553, 1, 'vi', 'packages/page/pages', 'edit', 'S????a trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1554, 1, 'vi', 'packages/page/pages', 'form.name', 'Ti??u ????? trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1555, 1, 'vi', 'packages/page/pages', 'form.note', 'N????i dung ghi chu??', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1556, 1, 'vi', 'packages/page/pages', 'form.name_placeholder', 'T??n trang (t???i ??a 120 k?? t???)', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1557, 1, 'vi', 'packages/page/pages', 'form.content', 'N???i dung', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1558, 1, 'vi', 'packages/page/pages', 'notices.no_select', 'Cho??n i??t nh????t 1 trang ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1559, 1, 'vi', 'packages/page/pages', 'notices.update_success_message', 'C????p nh????t tha??nh c??ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1560, 1, 'vi', 'packages/page/pages', 'deleted', 'Xo??a trang tha??nh c??ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1561, 1, 'vi', 'packages/page/pages', 'cannot_delete', 'Kh??ng th???? xo??a trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1562, 1, 'vi', 'packages/page/pages', 'menu', 'Trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1563, 1, 'vi', 'packages/page/pages', 'menu_name', 'Trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1564, 1, 'vi', 'packages/page/pages', 'edit_this_page', 'S???a trang n??y', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1565, 1, 'vi', 'packages/page/pages', 'pages', 'Trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1566, 1, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1567, 1, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1568, 1, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1569, 1, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1570, 1, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1571, 1, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1572, 1, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1573, 1, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1574, 1, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1575, 1, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1576, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1577, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1578, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1579, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1580, 1, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1581, 1, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2021-03-14 18:40:41', '2021-03-14 18:40:41');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1582, 1, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1583, 1, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1584, 1, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1585, 1, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1586, 1, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1587, 1, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1588, 1, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1589, 1, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1590, 1, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin is removed!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1591, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1592, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1593, 1, 'vi', 'packages/plugin-management/plugin', 'activate', 'K??ch ho???t', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1594, 1, 'vi', 'packages/plugin-management/plugin', 'author', 'T??c gi???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1595, 1, 'vi', 'packages/plugin-management/plugin', 'version', 'Phi??n b???n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1596, 1, 'vi', 'packages/plugin-management/plugin', 'activated', '???? k??ch ho???t', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1597, 1, 'vi', 'packages/plugin-management/plugin', 'deactivate', 'H???y k??ch ho???t', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1598, 1, 'vi', 'packages/plugin-management/plugin', 'deactivated', '???? v?? hi???u', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1599, 1, 'vi', 'packages/plugin-management/plugin', 'disabled_in_demo_mode', 'B???n kh??ng th??? th???c hi???n h??nh ?????ng n??y ??? ch??? ????? demo', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1600, 1, 'vi', 'packages/plugin-management/plugin', 'enabled', 'K??ch ho???t', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1601, 1, 'vi', 'packages/plugin-management/plugin', 'invalid_plugin', 'G??i m??? r???ng kh??ng h???p l???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1602, 1, 'vi', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'C???p nh???t tr???ng th??i g??i m??? r???ng th??nh c??ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1603, 1, 'vi', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Vui l??ng k??ch ho???t c??c ti???n ??ch m??? r???ng :plugins tr?????c khi k??ch ho???t ti???n ??ch n??y', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1604, 1, 'vi', 'packages/plugin-management/plugin', 'plugins', 'Ti???n ??ch m??? r???ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1605, 1, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1606, 1, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1607, 1, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1608, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1609, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1610, 1, 'vi', 'packages/seo-helper/seo-helper', 'meta_box_header', 'T???i ??u ho?? b??? m??y t??m ki???m (SEO)', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1611, 1, 'vi', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Ch???nh s???a SEO', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1612, 1, 'vi', 'packages/seo-helper/seo-helper', 'default_description', 'Thi???t l???p c??c th??? m?? t??? gi??p ng?????i d??ng d??? d??ng t??m th???y tr??n c??ng c??? t??m ki???m nh?? Google.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1613, 1, 'vi', 'packages/seo-helper/seo-helper', 'seo_title', 'Ti??u ????? trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1614, 1, 'vi', 'packages/seo-helper/seo-helper', 'seo_description', 'M?? t??? trang', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1615, 1, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1616, 1, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1617, 1, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1618, 1, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1619, 1, 'en', 'packages/slug/slug', 'preview', 'Preview', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1620, 1, 'en', 'packages/theme/theme', 'name', 'Themes', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1621, 1, 'en', 'packages/theme/theme', 'theme', 'Theme', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1622, 1, 'en', 'packages/theme/theme', 'author', 'Author', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1623, 1, 'en', 'packages/theme/theme', 'version', 'Version', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1624, 1, 'en', 'packages/theme/theme', 'description', 'Description', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1625, 1, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1626, 1, 'en', 'packages/theme/theme', 'active', 'Active', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1627, 1, 'en', 'packages/theme/theme', 'activated', 'Activated', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1628, 1, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1629, 1, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1630, 1, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1631, 1, 'en', 'packages/theme/theme', 'developer_mode', 'Developer Mode Enabled', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1632, 1, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1633, 1, 'en', 'packages/theme/theme', 'custom_js', 'Custom JS', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1634, 1, 'en', 'packages/theme/theme', 'custom_header_js', 'Header JS', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1635, 1, 'en', 'packages/theme/theme', 'custom_header_js_placeholder', 'JS in header of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1636, 1, 'en', 'packages/theme/theme', 'custom_body_js', 'Body JS', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1637, 1, 'en', 'packages/theme/theme', 'custom_body_js_placeholder', 'JS in body of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1638, 1, 'en', 'packages/theme/theme', 'custom_footer_js', 'Footer JS', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1639, 1, 'en', 'packages/theme/theme', 'custom_footer_js_placeholder', 'JS in footer of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1640, 1, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1641, 1, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1642, 1, 'en', 'packages/theme/theme', 'remove', 'Remove', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1643, 1, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1644, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1645, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1646, 1, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1647, 1, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1648, 1, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1649, 1, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1650, 1, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1651, 1, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1652, 1, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1653, 1, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1654, 1, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1655, 1, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1656, 1, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1657, 1, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1658, 1, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1659, 1, 'en', 'packages/theme/theme', 'update_custom_js_success', 'Update custom JS successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1660, 1, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1661, 1, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1662, 1, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1663, 1, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1664, 1, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1665, 1, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1666, 1, 'en', 'packages/theme/theme', 'theme_option_favicon', 'Favicon', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1667, 1, 'vi', 'packages/theme/theme', 'activated', '???? k??ch ho???t', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1668, 1, 'vi', 'packages/theme/theme', 'active', 'K??ch ho???t', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1669, 1, 'vi', 'packages/theme/theme', 'active_success', 'K??ch ho???t giao di???n th??nh c??ng!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1670, 1, 'vi', 'packages/theme/theme', 'author', 'T??c gi???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1671, 1, 'vi', 'packages/theme/theme', 'description', 'M?? t???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1672, 1, 'vi', 'packages/theme/theme', 'theme', 'Giao di???n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1673, 1, 'vi', 'packages/theme/theme', 'theme_options', 'Tu??? ch???n giao di???n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1674, 1, 'vi', 'packages/theme/theme', 'version', 'Phi??n b???n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1675, 1, 'vi', 'packages/theme/theme', 'save_changes', 'L??u thay ?????i', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1676, 1, 'vi', 'packages/theme/theme', 'developer_mode', '??ang k??ch ho???t ch??? ????? th??? nghi???m', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1677, 1, 'vi', 'packages/theme/theme', 'custom_css', 'Tu??? ch???nh CSS', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1678, 1, 'en', 'packages/widget/global', 'name', 'Widgets', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1679, 1, 'en', 'packages/widget/global', 'create', 'New widget', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1680, 1, 'en', 'packages/widget/global', 'edit', 'Edit widget', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1681, 1, 'en', 'packages/widget/global', 'delete', 'Delete', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1682, 1, 'en', 'packages/widget/global', 'available', 'Available Widgets', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1683, 1, 'en', 'packages/widget/global', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1684, 1, 'en', 'packages/widget/global', 'number_tag_display', 'Number tags will be display', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1685, 1, 'en', 'packages/widget/global', 'number_post_display', 'Number posts will be display', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1686, 1, 'en', 'packages/widget/global', 'select_menu', 'Select Menu', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1687, 1, 'en', 'packages/widget/global', 'widget_text', 'Text', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1688, 1, 'en', 'packages/widget/global', 'widget_text_description', 'Arbitrary text or HTML.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1689, 1, 'en', 'packages/widget/global', 'widget_recent_post', 'Recent Posts', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1690, 1, 'en', 'packages/widget/global', 'widget_recent_post_description', 'Recent posts widget.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1691, 1, 'en', 'packages/widget/global', 'widget_custom_menu', 'Custom Menu', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1692, 1, 'en', 'packages/widget/global', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1693, 1, 'en', 'packages/widget/global', 'widget_tag', 'Tags', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1694, 1, 'en', 'packages/widget/global', 'widget_tag_description', 'Popular tags', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1695, 1, 'en', 'packages/widget/global', 'save_success', 'Save widget successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1696, 1, 'en', 'packages/widget/global', 'delete_success', 'Delete widget successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1697, 1, 'en', 'packages/widget/widget', 'name', 'Widgets', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1698, 1, 'en', 'packages/widget/widget', 'create', 'New widget', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1699, 1, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1700, 1, 'en', 'packages/widget/widget', 'delete', 'Delete', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1701, 1, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1702, 1, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1703, 1, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1704, 1, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1705, 1, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1706, 1, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1707, 1, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1708, 1, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1709, 1, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1710, 1, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1711, 1, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1712, 1, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1713, 1, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1714, 1, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1715, 1, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1716, 1, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1717, 1, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1718, 1, 'vi', 'packages/widget/global', 'name', 'Widgets', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1719, 1, 'vi', 'packages/widget/global', 'create', 'New widget', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1720, 1, 'vi', 'packages/widget/global', 'edit', 'Edit widget', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1721, 1, 'vi', 'packages/widget/global', 'available', 'Ti???n ??ch c?? s???n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1722, 1, 'vi', 'packages/widget/global', 'delete', 'X??a', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1723, 1, 'vi', 'packages/widget/global', 'instruction', '????? k??ch ho???t ti???n ??ch, h??y k??o n?? v??o sidebar ho???c nh???n v??o n??. ????? h???y k??ch ho???t ti???n ??ch v?? x??a c??c thi???t l???p c???a ti???n ??ch, k??o n?? quay tr??? l???i.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1724, 1, 'vi', 'packages/widget/global', 'number_post_display', 'S??? b??i vi???t s??? hi???n th???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1725, 1, 'vi', 'packages/widget/global', 'number_tag_display', 'S??? th??? s??? hi???n th???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1726, 1, 'vi', 'packages/widget/global', 'select_menu', 'L???a ch???n tr??nh ????n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1727, 1, 'vi', 'packages/widget/global', 'widget_custom_menu', 'Menu t??y ch???nh', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1728, 1, 'vi', 'packages/widget/global', 'widget_custom_menu_description', 'Th??m menu t??y ch???nh v??o khu v???c ti???n ??ch c???a b???n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1729, 1, 'vi', 'packages/widget/global', 'widget_recent_post', 'B??i vi???t g???n ????y', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1730, 1, 'vi', 'packages/widget/global', 'widget_recent_post_description', 'Ti???n ??ch b??i vi???t g???n ????y', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1731, 1, 'vi', 'packages/widget/global', 'widget_tag', 'Th???', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1732, 1, 'vi', 'packages/widget/global', 'widget_tag_description', 'Th??? ph??? bi???n, s??? d???ng nhi???u', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1733, 1, 'vi', 'packages/widget/global', 'widget_text', 'V??n b???n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1734, 1, 'vi', 'packages/widget/global', 'widget_text_description', 'V??n b???n t??y ?? ho???c HTML.', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1735, 1, 'vi', 'packages/widget/global', 'delete_success', 'Xo?? ti???n ??ch th??nh c??ng', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1736, 1, 'vi', 'packages/widget/global', 'save_success', 'L??u ti???n ??ch th??nh c??ng!', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1737, 1, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1738, 1, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1739, 1, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1740, 1, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1741, 1, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1742, 1, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1743, 1, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1744, 1, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1745, 1, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1746, 1, 'en', 'plugins/analytics/analytics', 'views', 'views', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1747, 1, 'en', 'plugins/analytics/analytics', 'view_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.acenetics.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.acenetics.com/cms/:version/plugin-analytics</a>', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1748, 1, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.acenetics.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.acenetics.com/cms/:version/plugin-analytics</a>', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1749, 1, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1750, 1, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a google analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.acenetics.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.acenetics.com/cms/:version/plugin-analytics</a>', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1751, 1, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1752, 1, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1753, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking ID', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1754, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1755, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1756, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1757, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1758, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1759, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1760, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1761, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1762, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1763, 1, 'vi', 'plugins/analytics/analytics', 'avg_duration', 'Trung b??nh', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1764, 1, 'vi', 'plugins/analytics/analytics', 'bounce_rate', 'T??? l??? tho??t', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1765, 1, 'vi', 'plugins/analytics/analytics', 'page_session', 'Trang/Phi??n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1766, 1, 'vi', 'plugins/analytics/analytics', 'pageviews', 'L?????t xem', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1767, 1, 'vi', 'plugins/analytics/analytics', 'sessions', 'Phi??n', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1768, 1, 'vi', 'plugins/analytics/analytics', 'views', 'l?????t xem', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1769, 1, 'vi', 'plugins/analytics/analytics', 'visitors', 'Ng?????i truy c???p', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1770, 1, 'vi', 'plugins/analytics/analytics', 'visits', 'l?????t gh?? th??m', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1771, 1, 'vi', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Th??ng tin c??i ?????t kh??ng h???p l???. T??i li???u h?????ng d???n t???i ????y: <a href=\"http://docs.acenetics.com/cms/:version/analytics\" target=\"_blank\">http://docs.acenetics.com/cms/:version/analytics</a>', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1772, 1, 'vi', 'plugins/analytics/analytics', 'new_users', 'L?????t kh??ch m???i', '2021-03-14 18:40:41', '2021-03-14 18:40:41'),
(1773, 1, 'vi', 'plugins/analytics/analytics', 'percent_new_session', 'T??? l??? kh??ch m???i', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1774, 1, 'vi', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Ng??y b???t ?????u :start_date kh??ng th??? sau ng??y k???t th??c :end_date', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1775, 1, 'vi', 'plugins/analytics/analytics', 'view_id_not_specified', 'B???n ph???i cung c???p View ID h???p l??. T??i li???u h?????ng d???n t???i ????y: <a href=\"http://docs.acenetics.com/cms/:version/analytics\" target=\"_blank\">http://docs.acenetics.com/cms/:version/analytics</a>', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1776, 1, 'vi', 'plugins/analytics/analytics', 'wrong_configuration', '????? xem d??? li???u th???ng k?? Google Analytics, b???n c???n l???y th??ng tin Client ID v?? th??m n?? v??o trong ph???n c??i ?????t. B???n c??ng c???n th??ng tin x??c th???c d???ng JSON. T??i li???u h?????ng d???n t???i ????y: <a href=\"http://docs.acenetics.com/cms/:version/analytics\" target=\"_blank\">http://docs.acenetics.com/cms/:version/analytics</a>', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1777, 1, 'vi', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1778, 1, 'vi', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1779, 1, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking Code', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1780, 1, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1781, 1, 'vi', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1782, 1, 'vi', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1783, 1, 'vi', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1784, 1, 'vi', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1785, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Tr??nh duy???t truy c???p nhi???u', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1786, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_general', 'Th???ng k?? truy c???p', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1787, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_page', 'Trang ???????c xem nhi???u nh???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1788, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Trang gi???i thi???u nhi???u', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1789, 1, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1790, 1, 'en', 'plugins/audit-log/history', 'created', 'created', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1791, 1, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1792, 1, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1793, 1, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1794, 1, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1795, 1, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1796, 1, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1797, 1, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1798, 1, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1799, 1, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1800, 1, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1801, 1, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1802, 1, 'en', 'plugins/audit-log/history', 'post', 'post', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1803, 1, 'en', 'plugins/audit-log/history', 'page', 'page', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1804, 1, 'en', 'plugins/audit-log/history', 'category', 'category', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1805, 1, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1806, 1, 'en', 'plugins/audit-log/history', 'user', 'user', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1807, 1, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1808, 1, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1809, 1, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1810, 1, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1811, 1, 'en', 'plugins/audit-log/history', 'action', 'Action', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1812, 1, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1813, 1, 'en', 'plugins/audit-log/history', 'system', 'System', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1814, 1, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1815, 1, 'vi', 'plugins/audit-log/history', 'name', 'L???ch s??? ho???t ?????ng', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1816, 1, 'vi', 'plugins/audit-log/history', 'created', ' ???? t???o', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1817, 1, 'vi', 'plugins/audit-log/history', 'updated', ' ???? c???p nh???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1818, 1, 'vi', 'plugins/audit-log/history', 'deleted', ' ???? x??a', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1819, 1, 'vi', 'plugins/audit-log/history', 'attached', '????nh k??m', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1820, 1, 'vi', 'plugins/audit-log/history', 'backup', 'sao l??u', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1821, 1, 'vi', 'plugins/audit-log/history', 'category', 'danh m???c', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1822, 1, 'vi', 'plugins/audit-log/history', 'changed password', 'thay ?????i m???t kh???u', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1823, 1, 'vi', 'plugins/audit-log/history', 'contact', 'li??n h???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1824, 1, 'vi', 'plugins/audit-log/history', 'custom-field', 'khung m??? r???ng', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1825, 1, 'vi', 'plugins/audit-log/history', 'logged in', '????ng nh???p', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1826, 1, 'vi', 'plugins/audit-log/history', 'logged out', '????ng xu???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1827, 1, 'vi', 'plugins/audit-log/history', 'menu', 'tr??nh ????n', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1828, 1, 'vi', 'plugins/audit-log/history', 'of the system', 'kh???i h??? th???ng', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1829, 1, 'vi', 'plugins/audit-log/history', 'page', 'trang', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1830, 1, 'vi', 'plugins/audit-log/history', 'post', 'b??i vi???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1831, 1, 'vi', 'plugins/audit-log/history', 'shared', '???? chia s???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1832, 1, 'vi', 'plugins/audit-log/history', 'tag', 'th???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1833, 1, 'vi', 'plugins/audit-log/history', 'to the system', 'v??o h??? th???ng', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1834, 1, 'vi', 'plugins/audit-log/history', 'updated profile', 'c???p nh???t t??i kho???n', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1835, 1, 'vi', 'plugins/audit-log/history', 'user', 'th??nh vi??n', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1836, 1, 'vi', 'plugins/audit-log/history', 'widget_audit_logs', 'L???ch s??? ho???t ?????ng', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1837, 1, 'en', 'plugins/backup/backup', 'name', 'Backup', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1838, 1, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1839, 1, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1840, 1, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1841, 1, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1842, 1, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1843, 1, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1844, 1, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1845, 1, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1846, 1, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1847, 1, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1848, 1, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1849, 1, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1850, 1, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1851, 1, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1852, 1, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1853, 1, 'en', 'plugins/backup/backup', 'size', 'Size', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1854, 1, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1855, 1, 'vi', 'plugins/backup/backup', 'backup_description', 'Sao l??u c?? s??? d??? li???u v?? th?? m???c /uploads', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1856, 1, 'vi', 'plugins/backup/backup', 'create', 'T???o b???n sao l??u', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1857, 1, 'vi', 'plugins/backup/backup', 'create_backup_success', 'T???o b???n sao l??u th??nh c??ng!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1858, 1, 'vi', 'plugins/backup/backup', 'create_btn', 'T???o', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1859, 1, 'vi', 'plugins/backup/backup', 'delete_backup_success', 'X??a b???n sao l??u th??nh c??ng!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1860, 1, 'vi', 'plugins/backup/backup', 'generate_btn', 'T???o sao l??u', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1861, 1, 'vi', 'plugins/backup/backup', 'name', 'Sao l??u', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1862, 1, 'vi', 'plugins/backup/backup', 'restore', 'Kh??i ph???c b???n sao l??u', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1863, 1, 'vi', 'plugins/backup/backup', 'restore_backup_success', 'Kh??i ph???c b???n sao l??u th??nh c??ng', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1864, 1, 'vi', 'plugins/backup/backup', 'restore_btn', 'Kh??i ph???c', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1865, 1, 'vi', 'plugins/backup/backup', 'restore_confirm_msg', 'B???n c?? ch???c ch???n mu???n kh??i ph???c h??? th???ng v??? th???i ??i???m t???o b???n sao l??u n??y?', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1866, 1, 'vi', 'plugins/backup/backup', 'restore_tooltip', 'Kh??i ph???c b???n sao l??u n??y', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1867, 1, 'vi', 'plugins/backup/backup', 'download_database', 'T???i v??? b???n sao l??u CSDL', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1868, 1, 'vi', 'plugins/backup/backup', 'download_uploads_folder', 'T???i v??? b???n sao l??u th?? m???c uploads', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1869, 1, 'vi', 'plugins/backup/backup', 'menu_name', 'Sao l??u', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1870, 1, 'vi', 'plugins/backup/backup', 'demo_alert', 'Ch??o kh??ch, n???u b???n th???y trang demo b??? ph?? ho???i, h??y t???i <a href=\":link\">trang sao l??u</a> v?? kh??i ph???c b???n sao l??u cu???i c??ng. C???m ??n b???n nhi???u!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1871, 1, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1872, 1, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1873, 1, 'en', 'plugins/blog/base', 'select', '-- Select --', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1874, 1, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1875, 1, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1876, 1, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1877, 1, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1878, 1, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1879, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1880, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1881, 1, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1882, 1, 'en', 'plugins/blog/categories', 'edit', 'Edit category', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1883, 1, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1884, 1, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1885, 1, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1886, 1, 'en', 'plugins/blog/categories', 'none', 'None', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1887, 1, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1888, 1, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1889, 1, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1890, 1, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1891, 1, 'en', 'plugins/blog/member', 'posts', 'Posts', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1892, 1, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1893, 1, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1894, 1, 'en', 'plugins/blog/posts', 'edit', 'Edit post', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1895, 1, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1896, 1, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1897, 1, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1898, 1, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1899, 1, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1900, 1, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1901, 1, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1902, 1, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1903, 1, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1904, 1, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1905, 1, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1906, 1, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1907, 1, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1908, 1, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1909, 1, 'en', 'plugins/blog/posts', 'post', 'Post', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1910, 1, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1911, 1, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1912, 1, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1913, 1, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1914, 1, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1915, 1, 'en', 'plugins/blog/posts', 'category', 'Category', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1916, 1, 'en', 'plugins/blog/posts', 'author', 'Author', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1917, 1, 'en', 'plugins/blog/settings', 'select', '-- Select --', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1918, 1, 'en', 'plugins/blog/settings', 'blog_page_id', 'Blog page', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1919, 1, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1920, 1, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1921, 1, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1922, 1, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1923, 1, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1924, 1, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1925, 1, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1926, 1, 'en', 'plugins/blog/tags', 'edit', 'Edit tag', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1927, 1, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1928, 1, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1929, 1, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1930, 1, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1931, 1, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1932, 1, 'vi', 'plugins/blog/base', 'menu_name', 'Blog', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1933, 1, 'vi', 'plugins/blog/categories', 'model', 'Danh m???c', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1934, 1, 'vi', 'plugins/blog/categories', 'models', 'Danh m???c', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1935, 1, 'vi', 'plugins/blog/categories', 'list', 'Danh sa??ch danh mu??c', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1936, 1, 'vi', 'plugins/blog/categories', 'create', 'Th??m danh mu??c m????i', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1937, 1, 'vi', 'plugins/blog/categories', 'edit', 'S????a danh mu??c', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1938, 1, 'vi', 'plugins/blog/categories', 'menu_name', 'Danh m???c', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1939, 1, 'vi', 'plugins/blog/categories', 'edit_this_category', 'S???a danh m???c n??y', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1940, 1, 'vi', 'plugins/blog/categories', 'menu', 'Danh m???c', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1941, 1, 'vi', 'plugins/blog/posts', 'model', 'B??i vi???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1942, 1, 'vi', 'plugins/blog/posts', 'models', 'B??i vi???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1943, 1, 'vi', 'plugins/blog/posts', 'list', 'Danh sa??ch ba??i vi???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1944, 1, 'vi', 'plugins/blog/posts', 'create', 'Th??m ba??i vi???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1945, 1, 'vi', 'plugins/blog/posts', 'edit', 'S????a ba??i vi???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1946, 1, 'vi', 'plugins/blog/posts', 'form.name', 'T??n', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1947, 1, 'vi', 'plugins/blog/posts', 'form.name_placeholder', 'T??n b??i vi???t (T???i ??a 120 k?? t???)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1948, 1, 'vi', 'plugins/blog/posts', 'form.description', 'M?? t???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1949, 1, 'vi', 'plugins/blog/posts', 'form.description_placeholder', 'M?? t??? ng???n cho b??i vi???t (T???i ??a 400 k?? t???)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1950, 1, 'vi', 'plugins/blog/posts', 'form.categories', 'Chuy??n m???c', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1951, 1, 'vi', 'plugins/blog/posts', 'form.tags', 'T??? kh??a', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1952, 1, 'vi', 'plugins/blog/posts', 'form.tags_placeholder', 'Th??m t??? kh??a', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1953, 1, 'vi', 'plugins/blog/posts', 'form.content', 'N???i dung', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1954, 1, 'vi', 'plugins/blog/posts', 'form.featured', 'B??i vi???t n???i b???t?', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1955, 1, 'vi', 'plugins/blog/posts', 'form.note', 'N????i dung ghi chu??', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1956, 1, 'vi', 'plugins/blog/posts', 'form.format_type', '?????nh d???ng', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1957, 1, 'vi', 'plugins/blog/posts', 'post_deleted', 'Xo??a ba??i vi????t tha??nh c??ng', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1958, 1, 'vi', 'plugins/blog/posts', 'cannot_delete', 'Kh??ng th???? xo??a ba??i vi????t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1959, 1, 'vi', 'plugins/blog/posts', 'menu_name', 'B??i vi???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1960, 1, 'vi', 'plugins/blog/posts', 'edit_this_post', 'S???a b??i vi???t n??y', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1961, 1, 'vi', 'plugins/blog/posts', 'no_new_post_now', 'Hi???n t???i kh??ng c?? b??i vi???t m???i!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1962, 1, 'vi', 'plugins/blog/posts', 'posts', 'B??i vi???t', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1963, 1, 'vi', 'plugins/blog/posts', 'widget_posts_recent', 'B??i vi???t g???n ????y', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1964, 1, 'vi', 'plugins/blog/posts', 'author', 'T??c gi???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1965, 1, 'vi', 'plugins/blog/tags', 'model', 'Th???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1966, 1, 'vi', 'plugins/blog/tags', 'models', 'Th???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1967, 1, 'vi', 'plugins/blog/tags', 'list', 'Danh sa??ch th???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1968, 1, 'vi', 'plugins/blog/tags', 'create', 'Th??m th??? m????i', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1969, 1, 'vi', 'plugins/blog/tags', 'edit', 'S????a th???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1970, 1, 'vi', 'plugins/blog/tags', 'form.name', 'T??n', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1971, 1, 'vi', 'plugins/blog/tags', 'form.name_placeholder', 'T??n th??? (T???i ??a 120 k?? t???)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1972, 1, 'vi', 'plugins/blog/tags', 'form.description', 'M?? t???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1973, 1, 'vi', 'plugins/blog/tags', 'form.description_placeholder', 'M?? t??? ng???n cho tag (T???i ??a 400 k?? t???)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1974, 1, 'vi', 'plugins/blog/tags', 'form.categories', 'Chuy??n m???c', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1975, 1, 'vi', 'plugins/blog/tags', 'notices.no_select', 'Cho??n i??t nh????t 1 ba??i vi????t ?????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1976, 1, 'vi', 'plugins/blog/tags', 'cannot_delete', 'Kh??ng th???? xo??a th???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1977, 1, 'vi', 'plugins/blog/tags', 'deleted', 'Xo??a th??? tha??nh c??ng', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1978, 1, 'vi', 'plugins/blog/tags', 'menu_name', 'Th???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1979, 1, 'vi', 'plugins/blog/tags', 'edit_this_tag', 'S???a th??? n??y', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1980, 1, 'vi', 'plugins/blog/tags', 'menu', 'Th???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1981, 1, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1982, 1, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1983, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1984, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1985, 1, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1986, 1, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1987, 1, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1988, 1, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1989, 1, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1990, 1, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1991, 1, 'en', 'plugins/captcha/captcha', 'failed_validate', 'Failed to validate the captcha.', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1992, 1, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1993, 1, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1994, 1, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1995, 1, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1996, 1, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1997, 1, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1998, 1, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(1999, 1, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2000, 1, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2001, 1, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2002, 1, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2003, 1, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2004, 1, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2005, 1, 'en', 'plugins/contact/contact', 'email.success', 'Send message successfully!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2006, 1, 'en', 'plugins/contact/contact', 'email.failed', 'Can\'t send message on this time, please try again later!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2007, 1, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2008, 1, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2009, 1, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2010, 1, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2011, 1, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2012, 1, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2013, 1, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2014, 1, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2015, 1, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2016, 1, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2017, 1, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2018, 1, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2019, 1, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2020, 1, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2021, 1, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2022, 1, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2023, 1, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2024, 1, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2025, 1, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2026, 1, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2027, 1, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2028, 1, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2029, 1, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2030, 1, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2031, 1, 'en', 'plugins/contact/contact', 'address', 'Address', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2032, 1, 'en', 'plugins/contact/contact', 'message', 'Message', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2033, 1, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2034, 1, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2035, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2036, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2037, 1, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2038, 1, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2039, 1, 'en', 'plugins/contact/contact', 'send', 'Send', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2040, 1, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2041, 1, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2042, 1, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2043, 1, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2044, 1, 'vi', 'plugins/contact/contact', 'menu', 'Li??n h????', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2045, 1, 'vi', 'plugins/contact/contact', 'model', 'Li??n h????', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2046, 1, 'vi', 'plugins/contact/contact', 'models', 'Li??n h????', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2047, 1, 'vi', 'plugins/contact/contact', 'list', 'Danh sa??ch li??n h????', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2048, 1, 'vi', 'plugins/contact/contact', 'edit', 'Xem li??n h????', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2049, 1, 'vi', 'plugins/contact/contact', 'tables.phone', '??i????n thoa??i', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2050, 1, 'vi', 'plugins/contact/contact', 'tables.email', 'Email', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2051, 1, 'vi', 'plugins/contact/contact', 'tables.full_name', 'Ho?? t??n', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2052, 1, 'vi', 'plugins/contact/contact', 'tables.time', 'Th???i gian', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2053, 1, 'vi', 'plugins/contact/contact', 'tables.address', '??i??a ?????a ch???', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2054, 1, 'vi', 'plugins/contact/contact', 'tables.subject', 'Ti??u ?????', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2055, 1, 'vi', 'plugins/contact/contact', 'tables.content', 'N????i dung', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2056, 1, 'vi', 'plugins/contact/contact', 'form.is_read', '??a?? xem?', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2057, 1, 'vi', 'plugins/contact/contact', 'form.status', 'Tr???ng th??i', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2058, 1, 'vi', 'plugins/contact/contact', 'notices.no_select', 'Cho??n i??t nh????t 1 li??n h???? ????? th????c hi????n ha??nh ??????ng na??y!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2059, 1, 'vi', 'plugins/contact/contact', 'notices.update_success_message', 'C????p nh????t tha??nh c??ng', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2060, 1, 'vi', 'plugins/contact/contact', 'cannot_delete', 'Kh??ng th??? xo??a li??n h???? na??y', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2061, 1, 'vi', 'plugins/contact/contact', 'deleted', 'Li??n h???? ??a?? ????????c xo??a', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2062, 1, 'vi', 'plugins/contact/contact', 'contact_information', 'Th??ng tin li??n h????', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2063, 1, 'vi', 'plugins/contact/contact', 'email.title', 'Th??ng tin li??n h???? m????i', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2064, 1, 'vi', 'plugins/contact/contact', 'email.success', 'G????i tin nh????n tha??nh c??ng!', '2021-03-14 18:40:42', '2021-03-14 18:40:42'),
(2065, 1, 'vi', 'plugins/contact/contact', 'email.failed', 'Co?? l????i trong qua?? tri??nh g????i tin nh????n!', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2066, 1, 'vi', 'plugins/contact/contact', 'email.required', 'Email kh??ng ????????c ?????? tr????ng', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2067, 1, 'vi', 'plugins/contact/contact', 'email.email', '??i??a chi?? email kh??ng h????p l????', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2068, 1, 'vi', 'plugins/contact/contact', 'email.header', 'Email', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2069, 1, 'vi', 'plugins/contact/contact', 'name.required', 'Ho?? t??n kh??ng ????????c ????? tr???ng', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2070, 1, 'vi', 'plugins/contact/contact', 'content.required', 'N????i dung tin nh????n kh??ng ????????c ????? tr???ng', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2071, 1, 'vi', 'plugins/contact/contact', 'g-recaptcha-response.required', 'Ha??y xa??c minh kh??ng pha??i la?? robot tr??????c khi g???i tin nh???n.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2072, 1, 'vi', 'plugins/contact/contact', 'g-recaptcha-response.captcha', 'Ba??n ch??a xa??c minh kh??ng ph???i la?? robot tha??nh c??ng.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2073, 1, 'vi', 'plugins/contact/contact', 'confirm_not_robot', 'X??c nh???n kh??ng ph???i ng?????i m??y', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2074, 1, 'vi', 'plugins/contact/contact', 'contact_sent_from', 'Li??n h??? n??y ???????c g???i t???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2075, 1, 'vi', 'plugins/contact/contact', 'form_address', '?????a ch???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2076, 1, 'vi', 'plugins/contact/contact', 'form_email', 'Th?? ??i???n t???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2077, 1, 'vi', 'plugins/contact/contact', 'form_message', 'Th??ng ??i???p', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2078, 1, 'vi', 'plugins/contact/contact', 'form_name', 'H??? t??n', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2079, 1, 'vi', 'plugins/contact/contact', 'form_phone', 'S??? ??i???n tho???i', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2080, 1, 'vi', 'plugins/contact/contact', 'message_content', 'N???i dung th??ng ??i???p', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2081, 1, 'vi', 'plugins/contact/contact', 'required_field', 'Nh???ng tr?????ng c?? d???u (<span style=\"color: red\">*</span>) l?? b???t bu???c.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2082, 1, 'vi', 'plugins/contact/contact', 'send_btn', 'G???i tin nh???n', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2083, 1, 'vi', 'plugins/contact/contact', 'sender', 'Ng?????i g???i', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2084, 1, 'vi', 'plugins/contact/contact', 'sender_address', '?????a ch???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2085, 1, 'vi', 'plugins/contact/contact', 'sender_email', 'Th?? ??i???n t???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2086, 1, 'vi', 'plugins/contact/contact', 'sender_phone', 'S??? ??i???n tho???i', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2087, 1, 'vi', 'plugins/contact/contact', 'sent_from', 'Th?? ???????c g???i t???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2088, 1, 'vi', 'plugins/contact/contact', 'mark_as_read', '????nh d???u ???? ?????c', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2089, 1, 'vi', 'plugins/contact/contact', 'mark_as_unread', '????nh d???u ch??a ?????c', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2090, 1, 'vi', 'plugins/contact/contact', 'address', '?????a ch???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2091, 1, 'vi', 'plugins/contact/contact', 'message', 'Li??n h???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2092, 1, 'vi', 'plugins/contact/contact', 'new_msg_notice', 'B???n c?? <span class=\"bold\">:count</span> tin nh???n m???i', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2093, 1, 'vi', 'plugins/contact/contact', 'phone', '??i???n tho???i', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2094, 1, 'vi', 'plugins/contact/contact', 'statuses.read', '???? ?????c', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2095, 1, 'vi', 'plugins/contact/contact', 'statuses.unread', 'Ch??a ?????c', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2096, 1, 'vi', 'plugins/contact/contact', 'view_all', 'Xem t???t c???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2097, 1, 'vi', 'plugins/contact/contact', 'settings.email.title', 'Li??n h???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2098, 1, 'vi', 'plugins/contact/contact', 'settings.email.description', 'C???u h??nh th??ng tin cho m???c li??n h???', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2099, 1, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Th??ng b??o t???i admin', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2100, 1, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'M???u n???i dung email g???i t???i admin khi c?? li??n h??? m???i', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2101, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2102, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2103, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2104, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2105, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2106, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2107, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2108, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2109, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_url', 'Learn more URL', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2110, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_text', 'Learn more text', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2111, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2112, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2113, 1, 'en', 'plugins/ecommerce/brands', 'name', 'Brands', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2114, 1, 'en', 'plugins/ecommerce/brands', 'create', 'New brand', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2115, 1, 'en', 'plugins/ecommerce/brands', 'edit', 'Edit brand', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2116, 1, 'en', 'plugins/ecommerce/brands', 'form.name', 'Name', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2117, 1, 'en', 'plugins/ecommerce/brands', 'form.name_placeholder', 'Brand\'s name (Maximum 255 characters)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2118, 1, 'en', 'plugins/ecommerce/brands', 'form.description', 'Description', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2119, 1, 'en', 'plugins/ecommerce/brands', 'form.description_placeholder', 'Short description for brand (Maximum 400 characters)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2120, 1, 'en', 'plugins/ecommerce/brands', 'form.website', 'Website', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2121, 1, 'en', 'plugins/ecommerce/brands', 'form.logo', 'Logo', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2122, 1, 'en', 'plugins/ecommerce/brands', 'form.is_featured', 'Is featured', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2123, 1, 'en', 'plugins/ecommerce/brands', 'logo', 'Logo', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2124, 1, 'en', 'plugins/ecommerce/brands', 'website', 'Website', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2125, 1, 'en', 'plugins/ecommerce/brands', 'notices.no_select', 'Please select at least one record to take this action!', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2126, 1, 'en', 'plugins/ecommerce/brands', 'notices.update_success_message', 'Update successfully', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2127, 1, 'en', 'plugins/ecommerce/brands', 'cannot_delete', 'Brand could not be deleted', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2128, 1, 'en', 'plugins/ecommerce/brands', 'brand_deleted', 'Brand deleted', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2129, 1, 'en', 'plugins/ecommerce/brands', 'menu', 'Brands', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2130, 1, 'en', 'plugins/ecommerce/brands', 'no_brand', 'No brand', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2131, 1, 'en', 'plugins/ecommerce/brands', 'intro.title', 'Manage brands', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2132, 1, 'en', 'plugins/ecommerce/brands', 'intro.description', 'Manage product brands such as Nike, Adidas, Bitis ...', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2133, 1, 'en', 'plugins/ecommerce/brands', 'intro.button_text', 'Create brand', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2134, 1, 'en', 'plugins/ecommerce/currency', 'currencies', 'Currencies', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2135, 1, 'en', 'plugins/ecommerce/currency', 'setting_description', 'List of currencies using on website', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2136, 1, 'en', 'plugins/ecommerce/currency', 'name', 'Name', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2137, 1, 'en', 'plugins/ecommerce/currency', 'symbol', 'Symbol', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2138, 1, 'en', 'plugins/ecommerce/currency', 'number_of_decimals', 'Number of decimals', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2139, 1, 'en', 'plugins/ecommerce/currency', 'exchange_rate', 'Exchange rate', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2140, 1, 'en', 'plugins/ecommerce/currency', 'is_prefix_symbol', 'Position of symbol', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2141, 1, 'en', 'plugins/ecommerce/currency', 'is_default', 'Is default?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2142, 1, 'en', 'plugins/ecommerce/currency', 'remove', 'Remove', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2143, 1, 'en', 'plugins/ecommerce/currency', 'new_currency', 'Add a new currency', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2144, 1, 'en', 'plugins/ecommerce/currency', 'save_settings', 'Save settings', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2145, 1, 'en', 'plugins/ecommerce/currency', 'before_number', 'Before number', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2146, 1, 'en', 'plugins/ecommerce/currency', 'after_number', 'After number', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2147, 1, 'en', 'plugins/ecommerce/customer', 'name', 'Customers', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2148, 1, 'en', 'plugins/ecommerce/customer', 'create', 'Create a customer', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2149, 1, 'en', 'plugins/ecommerce/customer', 'edit', 'Edit customer \":name\"', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2150, 1, 'en', 'plugins/ecommerce/customer', 'email', 'Email', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2151, 1, 'en', 'plugins/ecommerce/customer', 'email_placeholder', 'Ex: example@gmail.com', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2152, 1, 'en', 'plugins/ecommerce/customer', 'password', 'Password', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2153, 1, 'en', 'plugins/ecommerce/customer', 'change_password', 'Change password?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2154, 1, 'en', 'plugins/ecommerce/customer', 'password_confirmation', 'Password confirmation', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2155, 1, 'en', 'plugins/ecommerce/customer', 'intro.title', 'Manage customers', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2156, 1, 'en', 'plugins/ecommerce/customer', 'intro.description', 'When a customer buy your product(s), you will know their order histories.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2157, 1, 'en', 'plugins/ecommerce/customer', 'intro.button_text', 'Create customer', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2158, 1, 'en', 'plugins/ecommerce/discount', 'name', 'Discounts', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2159, 1, 'en', 'plugins/ecommerce/discount', 'create', 'Create discount', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2160, 1, 'en', 'plugins/ecommerce/discount', 'invalid_coupon', 'This coupon is invalid or expired!', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2161, 1, 'en', 'plugins/ecommerce/discount', 'cannot_use_same_time_with_other_discount_program', 'Cannot use this coupon in the same time with other discount program!', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2162, 1, 'en', 'plugins/ecommerce/discount', 'not_used', 'This coupon is not used yet!', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2163, 1, 'en', 'plugins/ecommerce/discount', 'detail', 'Detail', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2164, 1, 'en', 'plugins/ecommerce/discount', 'used', 'Used', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2165, 1, 'en', 'plugins/ecommerce/discount', 'start_date', 'Start date', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2166, 1, 'en', 'plugins/ecommerce/discount', 'end_date', 'End date', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2167, 1, 'en', 'plugins/ecommerce/discount', 'intro.title', 'Manage discount/coupon code', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2168, 1, 'en', 'plugins/ecommerce/discount', 'intro.description', 'Create coupon code or promotion for your products.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2169, 1, 'en', 'plugins/ecommerce/discount', 'intro.button_text', 'Create discount', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2170, 1, 'en', 'plugins/ecommerce/discount', 'discount', 'Discount', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2171, 1, 'en', 'plugins/ecommerce/discount', 'expired', 'Expired', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2172, 1, 'en', 'plugins/ecommerce/discount', 'coupon_code', 'Coupon code', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2173, 1, 'en', 'plugins/ecommerce/discount', 'discount_promotion', 'Discount promotion', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2174, 1, 'en', 'plugins/ecommerce/discount', 'can', 'can', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2175, 1, 'en', 'plugins/ecommerce/discount', 'cannot', 'cannot', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2176, 1, 'en', 'plugins/ecommerce/discount', 'use_with_promotion', 'be used with promotion', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2177, 1, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_title_required_if', 'Please enter the name of the promotion', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2178, 1, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_code_required_if', 'Please enter the promotion code', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2179, 1, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_value_required', 'Amount must be greater than 0', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2180, 1, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_target_required', 'No object selected for promotion', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2181, 1, 'en', 'plugins/ecommerce/ecommerce', 'settings', 'Settings', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2182, 1, 'en', 'plugins/ecommerce/ecommerce', 'name', 'Ecommerce', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2183, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.title', 'E-commerce', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2184, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.description', 'Ecommerce email config', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2185, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject', 'Subject of order confirmation email', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2186, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject_placeholder', 'The subject of email confirmation send to the customer', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2187, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_content', 'Content of order confirmation email', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2188, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject', 'Subject of email when changing order\'s status', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2189, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject_placeholder', 'Subject of email when changing order\'s status send to customer', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2190, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_content', 'Content of email when changing order\'s status', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2191, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.from_email', 'Email from', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2192, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.from_email_placeholder', 'Email from address to display in mail. Ex: example@gmail.com', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2193, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.title', 'Basic information', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2194, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.state', 'State', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2195, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.city', 'City', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2196, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.country', 'Country', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2197, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.select country', 'Select a country...', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2198, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.weight_unit_gram', 'Gram (g)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2199, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.weight_unit_kilogram', 'Kilogram (kg)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2200, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.height_unit_cm', 'Centimeter (cm)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2201, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.height_unit_m', 'Meter (m)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2202, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.store_locator_title', 'Store locators', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2203, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.store_locator_description', 'All the lists of your chains, main stores, branches, etc. The locations can be used to track sales and to help us configure tax rates to charge when selling products.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2204, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.phone', 'Phone', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2205, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.address', 'Address', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2206, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.is_primary', 'Primary?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2207, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.add_new', 'Add new', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2208, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.or', 'Or', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2209, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.change_primary_store', 'change default store locator', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2210, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.other_settings', 'Other settings', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2211, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.other_settings_description', 'Settings for cart, review...', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2212, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_cart', 'Enable shopping cart?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2213, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_tax', 'Enable tax?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2214, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.display_product_price_including_taxes', 'Display product price including taxes?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2215, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_review', 'Enable review?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2216, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_quick_buy_button', 'Enable quick buy button?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2217, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.quick_buy_target', 'Quick buy target page?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2218, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.checkout_page', 'Checkout page', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2219, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.cart_page', 'Cart page', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2220, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.add_location', 'Add location', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2221, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.edit_location', 'Edit location', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2222, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.delete_location', 'Delete location', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2223, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.change_primary_location', 'Change primary location', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2224, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.delete_location_confirmation', 'Are you sure you want to delete this location? This action cannot be undo.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2225, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.save_location', 'Save location', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2226, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.accept', 'Accept', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2227, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.select_country', 'Select country', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2228, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.zip_code_enabled', 'Enable Zip Code?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2229, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.thousands_separator', 'Thousands separator', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2230, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.decimal_separator', 'Decimal separator', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2231, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.separator_period', 'Period (.)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2232, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.separator_comma', 'Comma (,)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2233, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.separator_space', 'Space ( )', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2234, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.available_countries', 'Available countries', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2235, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.all', 'All', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2236, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.verify_customer_email', 'Verify customer\' email?', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2237, 1, 'en', 'plugins/ecommerce/ecommerce', 'store_address', 'Store address', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2238, 1, 'en', 'plugins/ecommerce/ecommerce', 'store_phone', 'Store phone', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2239, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_id', 'Order ID', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2240, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_token', 'Order token', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2241, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_name', 'Customer name', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2242, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_email', 'Customer email', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2243, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_phone', 'Customer phone', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2244, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_address', 'Customer address', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2245, 1, 'en', 'plugins/ecommerce/ecommerce', 'product_list', 'List products in order', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2246, 1, 'en', 'plugins/ecommerce/ecommerce', 'payment_detail', 'Payment detail', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2247, 1, 'en', 'plugins/ecommerce/ecommerce', 'shipping_method', 'Shipping method', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2248, 1, 'en', 'plugins/ecommerce/ecommerce', 'payment_method', 'Payment method', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2249, 1, 'en', 'plugins/ecommerce/ecommerce', 'standard_and_format', 'Standard & Format', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2250, 1, 'en', 'plugins/ecommerce/ecommerce', 'standard_and_format_description', 'Standards and formats are used to calculate things like product prices, shipping weights, and order times.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2251, 1, 'en', 'plugins/ecommerce/ecommerce', 'change_order_format', 'Edit order code format (optional)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2252, 1, 'en', 'plugins/ecommerce/ecommerce', 'change_order_format_description', 'The default order code starts at: number. You can change the start or end string to create the order code you want, for example \"DH-: number\" or \": number-A\"', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2253, 1, 'en', 'plugins/ecommerce/ecommerce', 'start_with', 'Start with', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2254, 1, 'en', 'plugins/ecommerce/ecommerce', 'end_with', 'End with', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2255, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_will_be_shown', 'Your order code will be shown', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2256, 1, 'en', 'plugins/ecommerce/ecommerce', 'weight_unit', 'Unit of weight', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2257, 1, 'en', 'plugins/ecommerce/ecommerce', 'height_unit', 'Unit length / height', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2258, 1, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.name', 'Ecommerce', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2259, 1, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.description', 'Theme options for Ecommerce', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2260, 1, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.number_products_per_page', 'Number of products per page', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2261, 1, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.max_price_filter', 'Maximum price to filter', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2262, 1, 'en', 'plugins/ecommerce/email', 'customer_new_order_title', 'Order confirmation', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2263, 1, 'en', 'plugins/ecommerce/email', 'customer_new_order_description', 'Send email confirmation to customer when an order placed', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2264, 1, 'en', 'plugins/ecommerce/email', 'order_cancellation_title', 'Order cancellation', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2265, 1, 'en', 'plugins/ecommerce/email', 'order_cancellation_description', 'Send to custom when they cancelled order', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2266, 1, 'en', 'plugins/ecommerce/email', 'delivery_confirmation_title', 'Delivering confirmation', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2267, 1, 'en', 'plugins/ecommerce/email', 'delivery_confirmation_description', 'Send to customer when order is delivering', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2268, 1, 'en', 'plugins/ecommerce/email', 'admin_new_order_title', 'Notice about new order', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2269, 1, 'en', 'plugins/ecommerce/email', 'admin_new_order_description', 'Send to administrators when an order placed', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2270, 1, 'en', 'plugins/ecommerce/email', 'order_confirmation_title', 'Order confirmation', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2271, 1, 'en', 'plugins/ecommerce/email', 'order_confirmation_description', 'Send to customer when they order was confirmed by admins', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2272, 1, 'en', 'plugins/ecommerce/email', 'payment_confirmation_title', 'Payment confirmation', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2273, 1, 'en', 'plugins/ecommerce/email', 'payment_confirmation_description', 'Send to customer when their payment was confirmed', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2274, 1, 'en', 'plugins/ecommerce/email', 'order_recover_title', 'Incomplete order', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2275, 1, 'en', 'plugins/ecommerce/email', 'order_recover_description', 'Send to custom to remind them about incomplete orders', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2276, 1, 'en', 'plugins/ecommerce/flash-sale', 'name', 'Flash sales', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2277, 1, 'en', 'plugins/ecommerce/flash-sale', 'create', 'New flash sale', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2278, 1, 'en', 'plugins/ecommerce/flash-sale', 'edit', 'Edit flash sale', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2279, 1, 'en', 'plugins/ecommerce/flash-sale', 'products', 'Products', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2280, 1, 'en', 'plugins/ecommerce/order', 'statuses.pending', 'Pending', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2281, 1, 'en', 'plugins/ecommerce/order', 'statuses.processing', 'Processing', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2282, 1, 'en', 'plugins/ecommerce/order', 'statuses.delivering', 'Delivering', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2283, 1, 'en', 'plugins/ecommerce/order', 'statuses.delivered', 'Delivered', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2284, 1, 'en', 'plugins/ecommerce/order', 'statuses.completed', 'Completed', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2285, 1, 'en', 'plugins/ecommerce/order', 'statuses.canceled', 'Canceled', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2286, 1, 'en', 'plugins/ecommerce/order', 'name', 'Orders', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2287, 1, 'en', 'plugins/ecommerce/order', 'create', 'Create an order', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2288, 1, 'en', 'plugins/ecommerce/order', 'customer.messages.cancel_error', 'The order is delivering or completed', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2289, 1, 'en', 'plugins/ecommerce/order', 'customer.messages.cancel_success', 'You do cancel the order successful', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2290, 1, 'en', 'plugins/ecommerce/order', 'incomplete_order', 'Incomplete orders', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2291, 1, 'en', 'plugins/ecommerce/order', 'order_id', 'Order ID', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2292, 1, 'en', 'plugins/ecommerce/order', 'product_id', 'Product ID', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2293, 1, 'en', 'plugins/ecommerce/order', 'customer_label', 'Customer', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2294, 1, 'en', 'plugins/ecommerce/order', 'amount', 'Amount', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2295, 1, 'en', 'plugins/ecommerce/order', 'tax_amount', 'Tax Amount', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2296, 1, 'en', 'plugins/ecommerce/order', 'shipping_amount', 'Shipping amount', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2297, 1, 'en', 'plugins/ecommerce/order', 'payment_method', 'Payment method', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2298, 1, 'en', 'plugins/ecommerce/order', 'payment_status_label', 'Payment status', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2299, 1, 'en', 'plugins/ecommerce/order', 'manage_orders', 'Manage orders', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2300, 1, 'en', 'plugins/ecommerce/order', 'order_intro_description', 'Once your store has orders, this is where you will process and track those orders.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2301, 1, 'en', 'plugins/ecommerce/order', 'create_new_order', 'Create a new order', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2302, 1, 'en', 'plugins/ecommerce/order', 'manage_incomplete_orders', 'Manage incomplete orders', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2303, 1, 'en', 'plugins/ecommerce/order', 'incomplete_orders_intro_description', 'Incomplete order is an order created when a customer adds a product to the cart, proceeds to fill out the purchase information but does not complete the checkout process.', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2304, 1, 'en', 'plugins/ecommerce/order', 'invoice_for_order', 'Invoice for order', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2305, 1, 'en', 'plugins/ecommerce/order', 'created', 'Created', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2306, 1, 'en', 'plugins/ecommerce/order', 'invoice', 'Invoice', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2307, 1, 'en', 'plugins/ecommerce/order', 'return', 'Return', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2308, 1, 'en', 'plugins/ecommerce/order', 'total_refund_amount', 'Total refund amount', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2309, 1, 'en', 'plugins/ecommerce/order', 'total_amount_can_be_refunded', 'Total amount can be refunded', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2310, 1, 'en', 'plugins/ecommerce/order', 'refund_reason', 'Refund reason (optional)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2311, 1, 'en', 'plugins/ecommerce/order', 'products', 'product(s)', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2312, 1, 'en', 'plugins/ecommerce/order', 'see_on_maps', 'See on maps', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2313, 1, 'en', 'plugins/ecommerce/order', 'order', 'Order', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2314, 1, 'en', 'plugins/ecommerce/order', 'order_information', 'Order information', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2315, 1, 'en', 'plugins/ecommerce/order', 'create_new_product', 'Create a new product', '2021-03-14 18:40:43', '2021-03-14 18:40:43'),
(2316, 1, 'en', 'plugins/ecommerce/order', 'out_of_stock', 'Out of stock', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2317, 1, 'en', 'plugins/ecommerce/order', 'products_available', 'product(s) available', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2318, 1, 'en', 'plugins/ecommerce/order', 'no_products_found', 'No products found!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2319, 1, 'en', 'plugins/ecommerce/order', 'default', 'Default', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2320, 1, 'en', 'plugins/ecommerce/order', 'system', 'System', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2321, 1, 'en', 'plugins/ecommerce/order', 'new_order_from', 'New order :order_id from :customer', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2322, 1, 'en', 'plugins/ecommerce/order', 'confirmation_email_was_sent_to_customer', 'The email confirmation was sent to customer', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2323, 1, 'en', 'plugins/ecommerce/order', 'address_name_required', 'The name field is required.', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2324, 1, 'en', 'plugins/ecommerce/order', 'address_phone_required', 'The phone field is required.', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2325, 1, 'en', 'plugins/ecommerce/order', 'address_email_required', 'The email field is required.', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2326, 1, 'en', 'plugins/ecommerce/order', 'address_email_unique', 'The customer with that email is existed, please choose other email or login with this email!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2327, 1, 'en', 'plugins/ecommerce/order', 'address_state_required', 'The state field is required.', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2328, 1, 'en', 'plugins/ecommerce/order', 'address_city_required', 'The city field is required.', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2329, 1, 'en', 'plugins/ecommerce/order', 'address_address_required', 'The address field is required.', '2021-03-14 18:40:44', '2021-03-14 18:40:44');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2330, 1, 'en', 'plugins/ecommerce/order', 'create_order_from_payment_page', 'Order was created from checkout page', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2331, 1, 'en', 'plugins/ecommerce/order', 'order_was_verified_by', 'Order was verified by %user_name%', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2332, 1, 'en', 'plugins/ecommerce/order', 'new_order', 'New order :order_id', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2333, 1, 'en', 'plugins/ecommerce/order', 'payment_was_confirmed_by', 'Payment was confirmed (amount :money) by %user_name%', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2334, 1, 'en', 'plugins/ecommerce/order', 'edit_order', 'Edit order :code', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2335, 1, 'en', 'plugins/ecommerce/order', 'confirm_order_success', 'Confirm order successfully!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2336, 1, 'en', 'plugins/ecommerce/order', 'error_when_sending_email', 'There is an error when sending email', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2337, 1, 'en', 'plugins/ecommerce/order', 'sent_confirmation_email_success', 'Sent confirmation email successfully!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2338, 1, 'en', 'plugins/ecommerce/order', 'order_was_sent_to_shipping_team', 'Order was sent to shipping team', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2339, 1, 'en', 'plugins/ecommerce/order', 'by_username', 'by %user_name%', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2340, 1, 'en', 'plugins/ecommerce/order', 'shipping_was_created_from', 'Shipping was created from order %order_id%', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2341, 1, 'en', 'plugins/ecommerce/order', 'shipping_was_canceled_success', 'Shipping was cancelled successfully!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2342, 1, 'en', 'plugins/ecommerce/order', 'shipping_was_canceled_by', 'Shipping was cancelled by %user_name%', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2343, 1, 'en', 'plugins/ecommerce/order', 'update_shipping_address_success', 'Update shipping address successfully!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2344, 1, 'en', 'plugins/ecommerce/order', 'order_was_canceled_by', 'Order was cancelled by %user_name%', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2345, 1, 'en', 'plugins/ecommerce/order', 'confirm_payment_success', 'Confirm payment successfully!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2346, 1, 'en', 'plugins/ecommerce/order', 'refund_amount_invalid', 'Refund amount must be lower or equal :price', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2347, 1, 'en', 'plugins/ecommerce/order', 'number_of_products_invalid', 'Number of products refund is not valid!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2348, 1, 'en', 'plugins/ecommerce/order', 'cannot_found_payment_for_this_order', 'Cannot found payment for this order!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2349, 1, 'en', 'plugins/ecommerce/order', 'refund_success_with_price', 'Refund success :price', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2350, 1, 'en', 'plugins/ecommerce/order', 'refund_success', 'Refund successfully!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2351, 1, 'en', 'plugins/ecommerce/order', 'order_is_not_existed', 'Order is not existed!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2352, 1, 'en', 'plugins/ecommerce/order', 'reorder', 'Reorder', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2353, 1, 'en', 'plugins/ecommerce/order', 'sent_email_incomplete_order_success', 'Sent email to remind about incomplete order successfully!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2354, 1, 'en', 'plugins/ecommerce/order', 'applied_coupon_success', 'Applied coupon \":code\" successfully!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2355, 1, 'en', 'plugins/ecommerce/order', 'new_order_notice', 'You have <span class=\"bold\">:count</span> New Order(s)', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2356, 1, 'en', 'plugins/ecommerce/order', 'view_all', 'View all', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2357, 1, 'en', 'plugins/ecommerce/order', 'cancel_order', 'Cancel order', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2358, 1, 'en', 'plugins/ecommerce/order', 'order_was_canceled_at', 'Order was canceled at', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2359, 1, 'en', 'plugins/ecommerce/order', 'completed', 'Completed', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2360, 1, 'en', 'plugins/ecommerce/order', 'uncompleted', 'Uncompleted', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2361, 1, 'en', 'plugins/ecommerce/order', 'sku', 'SKU', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2362, 1, 'en', 'plugins/ecommerce/order', 'shipping', 'Shipping', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2363, 1, 'en', 'plugins/ecommerce/order', 'warehouse', 'Warehouse', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2364, 1, 'en', 'plugins/ecommerce/order', 'sub_amount', 'Sub amount', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2365, 1, 'en', 'plugins/ecommerce/order', 'discount', 'Discount', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2366, 1, 'en', 'plugins/ecommerce/order', 'coupon_code', 'Coupon code: \":code\"', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2367, 1, 'en', 'plugins/ecommerce/order', 'shipping_fee', 'Shipping fee', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2368, 1, 'en', 'plugins/ecommerce/order', 'tax', 'Tax', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2369, 1, 'en', 'plugins/ecommerce/order', 'total_amount', 'Total amount', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2370, 1, 'en', 'plugins/ecommerce/order', 'paid_amount', 'Paid amount', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2371, 1, 'en', 'plugins/ecommerce/order', 'refunded_amount', 'Refunded amount', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2372, 1, 'en', 'plugins/ecommerce/order', 'amount_received', 'The amount actually received', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2373, 1, 'en', 'plugins/ecommerce/order', 'download_invoice', 'Download invoice', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2374, 1, 'en', 'plugins/ecommerce/order', 'note', 'Note', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2375, 1, 'en', 'plugins/ecommerce/order', 'add_note', 'Add note...', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2376, 1, 'en', 'plugins/ecommerce/order', 'save', 'Save', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2377, 1, 'en', 'plugins/ecommerce/order', 'order_was_confirmed', 'Order was confirmed', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2378, 1, 'en', 'plugins/ecommerce/order', 'confirm_order', 'Confirm order', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2379, 1, 'en', 'plugins/ecommerce/order', 'confirm', 'Confirm', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2380, 1, 'en', 'plugins/ecommerce/order', 'order_was_canceled', 'Order was canceled', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2381, 1, 'en', 'plugins/ecommerce/order', 'pending_payment', 'Pending payment', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2382, 1, 'en', 'plugins/ecommerce/order', 'payment_was_accepted', 'Payment :money was accepted', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2383, 1, 'en', 'plugins/ecommerce/order', 'payment_was_refunded', 'Payment was refunded', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2384, 1, 'en', 'plugins/ecommerce/order', 'confirm_payment', 'Confirm payment', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2385, 1, 'en', 'plugins/ecommerce/order', 'refund', 'Refund', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2386, 1, 'en', 'plugins/ecommerce/order', 'all_products_are_not_delivered', 'All products are not delivered', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2387, 1, 'en', 'plugins/ecommerce/order', 'delivery', 'Delivery', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2388, 1, 'en', 'plugins/ecommerce/order', 'history', 'History', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2389, 1, 'en', 'plugins/ecommerce/order', 'order_number', 'Order number', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2390, 1, 'en', 'plugins/ecommerce/order', 'description', 'Description', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2391, 1, 'en', 'plugins/ecommerce/order', 'from', 'from', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2392, 1, 'en', 'plugins/ecommerce/order', 'status', 'Status', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2393, 1, 'en', 'plugins/ecommerce/order', 'successfully', 'Successfully', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2394, 1, 'en', 'plugins/ecommerce/order', 'transaction_type', 'Transaction\'s type', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2395, 1, 'en', 'plugins/ecommerce/order', 'staff', 'Staff', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2396, 1, 'en', 'plugins/ecommerce/order', 'refund_date', 'Refund date', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2397, 1, 'en', 'plugins/ecommerce/order', 'n_a', 'N\\A', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2398, 1, 'en', 'plugins/ecommerce/order', 'payment_date', 'Payment date', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2399, 1, 'en', 'plugins/ecommerce/order', 'payment_gateway', 'Payment gateway', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2400, 1, 'en', 'plugins/ecommerce/order', 'transaction_amount', 'Transaction amount', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2401, 1, 'en', 'plugins/ecommerce/order', 'resend', 'Resend', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2402, 1, 'en', 'plugins/ecommerce/order', 'orders', 'Orders', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2403, 1, 'en', 'plugins/ecommerce/order', 'shipping_address', 'Shipping address', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2404, 1, 'en', 'plugins/ecommerce/order', 'default_store', 'Default store', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2405, 1, 'en', 'plugins/ecommerce/order', 'update_address', 'Update address', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2406, 1, 'en', 'plugins/ecommerce/order', 'cancel', 'Cancel', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2407, 1, 'en', 'plugins/ecommerce/order', 'have_an_account_already', 'Have an account already', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2408, 1, 'en', 'plugins/ecommerce/order', 'dont_have_an_account_yet', 'Don\'t have an account yet', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2409, 1, 'en', 'plugins/ecommerce/order', 'mark_payment_as_confirmed', 'Mark <span>:method</span> as confirmed', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2410, 1, 'en', 'plugins/ecommerce/order', 'resend_order_confirmation', 'Resend order confirmation', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2411, 1, 'en', 'plugins/ecommerce/order', 'resend_order_confirmation_description', 'Confirmation email will be sent to <strong>:email</strong>?', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2412, 1, 'en', 'plugins/ecommerce/order', 'send', 'Send', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2413, 1, 'en', 'plugins/ecommerce/order', 'update', 'Update', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2414, 1, 'en', 'plugins/ecommerce/order', 'cancel_shipping_confirmation', 'Cancel shipping confirmation?', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2415, 1, 'en', 'plugins/ecommerce/order', 'cancel_shipping_confirmation_description', 'Cancel shipping confirmation?', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2416, 1, 'en', 'plugins/ecommerce/order', 'cancel_order_confirmation', 'Cancel order confirmation?', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2417, 1, 'en', 'plugins/ecommerce/order', 'cancel_order_confirmation_description', 'Are you sure you want to cancel this order? This action cannot rollback', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2418, 1, 'en', 'plugins/ecommerce/order', 'confirm_payment_confirmation_description', 'Processed by <strong>:method</strong>. Did you receive payment outside the system? This payment won\'t be saved into system and cannot be refunded', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2419, 1, 'en', 'plugins/ecommerce/order', 'save_note', 'Save note', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2420, 1, 'en', 'plugins/ecommerce/order', 'order_note', 'Order note', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2421, 1, 'en', 'plugins/ecommerce/order', 'order_note_placeholder', 'Note about order, ex: time or shipping instruction.', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2422, 1, 'en', 'plugins/ecommerce/order', 'order_amount', 'Order amount', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2423, 1, 'en', 'plugins/ecommerce/order', 'additional_information', 'Additional information', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2424, 1, 'en', 'plugins/ecommerce/order', 'notice_about_incomplete_order', 'Notice about incomplete order', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2425, 1, 'en', 'plugins/ecommerce/order', 'notice_about_incomplete_order_description', 'Remind email about uncompleted order will be send to <strong>:email</strong>?', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2426, 1, 'en', 'plugins/ecommerce/order', 'incomplete_order_description_1', 'An incomplete order is when a potential customer places items in their shopping cart, and goes all the way through to the payment page, but then doesn\'t complete the transaction.', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2427, 1, 'en', 'plugins/ecommerce/order', 'incomplete_order_description_2', 'If you have contacted customers and they want to continue buying, you can help them complete their order by following the link:', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2428, 1, 'en', 'plugins/ecommerce/order', 'send_an_email_to_recover_this_order', 'Send an email to customer to recover this order', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2429, 1, 'en', 'plugins/ecommerce/order', 'see_maps', 'See maps', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2430, 1, 'en', 'plugins/ecommerce/order', 'one_or_more_products_dont_have_enough_quantity', 'One or more products don\'t have enough quantity!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2431, 1, 'en', 'plugins/ecommerce/payment', 'name', 'Payments', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2432, 1, 'en', 'plugins/ecommerce/payment', 'payment_method', 'Payment methods', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2433, 1, 'en', 'plugins/ecommerce/payment', 'view_payment', 'View payment #', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2434, 1, 'en', 'plugins/ecommerce/payment', 'charge_id', 'Charge ID', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2435, 1, 'en', 'plugins/ecommerce/payment', 'amount', 'Amount', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2436, 1, 'en', 'plugins/ecommerce/payment', 'currency', 'Currency', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2437, 1, 'en', 'plugins/ecommerce/payment', 'user', 'User', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2438, 1, 'en', 'plugins/ecommerce/payment', 'paypal_name_required', 'PayPal\'s name is required!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2439, 1, 'en', 'plugins/ecommerce/payment', 'paypal_name_max', 'PayPal\'s name is too long!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2440, 1, 'en', 'plugins/ecommerce/payment', 'stripe_name_required', 'Stripe\'s name is required!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2441, 1, 'en', 'plugins/ecommerce/payment', 'stripe_name_max', 'Stripe\'s name is too long!', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2442, 1, 'en', 'plugins/ecommerce/payment', 'status', 'Status', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2443, 1, 'en', 'plugins/ecommerce/payment', 'enabled', 'Enabled', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2444, 1, 'en', 'plugins/ecommerce/payment', 'disabled', 'Disabled', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2445, 1, 'en', 'plugins/ecommerce/payment', 'client_id', 'Client ID', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2446, 1, 'en', 'plugins/ecommerce/payment', 'client_secret', 'Client Secret', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2447, 1, 'en', 'plugins/ecommerce/payment', 'mode', 'Mode', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2448, 1, 'en', 'plugins/ecommerce/payment', 'sandbox', 'Sandbox', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2449, 1, 'en', 'plugins/ecommerce/payment', 'live', 'Live', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2450, 1, 'en', 'plugins/ecommerce/payment', 'enable_payment_log', 'Enable Payment Log', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2451, 1, 'en', 'plugins/ecommerce/payment', 'yes', 'Yes', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2452, 1, 'en', 'plugins/ecommerce/payment', 'no', 'No', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2453, 1, 'en', 'plugins/ecommerce/payment', 'client_key', 'Client Key', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2454, 1, 'en', 'plugins/ecommerce/payment', 'stripe', 'Stripe', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2455, 1, 'en', 'plugins/ecommerce/payment', 'paypal', 'PayPal', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2456, 1, 'en', 'plugins/ecommerce/payment', 'action', 'Action', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2457, 1, 'en', 'plugins/ecommerce/payment', 'go_back', 'Go back', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2458, 1, 'en', 'plugins/ecommerce/payment', 'view', 'View', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2459, 1, 'en', 'plugins/ecommerce/payment', 'cash_on_delivery', 'Cash on delivery (COD)', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2460, 1, 'en', 'plugins/ecommerce/payment', 'via_bank_transfer', 'Via bank transfer', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2461, 1, 'en', 'plugins/ecommerce/payment', 'payment_via_cart', 'Payment via card', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2462, 1, 'en', 'plugins/ecommerce/payment', 'card_number', 'Card number', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2463, 1, 'en', 'plugins/ecommerce/payment', 'full_name', 'Full name', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2464, 1, 'en', 'plugins/ecommerce/payment', 'payment_via_paypal', 'Payment via PayPal', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2465, 1, 'en', 'plugins/ecommerce/payment', 'mm_yy', 'MM/YY', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2466, 1, 'en', 'plugins/ecommerce/payment', 'cvc', 'CVC', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2467, 1, 'en', 'plugins/ecommerce/payment', 'details', 'Details', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2468, 1, 'en', 'plugins/ecommerce/payment', 'payer_name', 'Payer Name', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2469, 1, 'en', 'plugins/ecommerce/payment', 'email', 'Email', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2470, 1, 'en', 'plugins/ecommerce/payment', 'phone', 'Phone', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2471, 1, 'en', 'plugins/ecommerce/payment', 'country', 'Country', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2472, 1, 'en', 'plugins/ecommerce/payment', 'shipping_address', 'Shipping Address', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2473, 1, 'en', 'plugins/ecommerce/payment', 'payment_details', 'Payment Details', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2474, 1, 'en', 'plugins/ecommerce/payment', 'card', 'Card', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2475, 1, 'en', 'plugins/ecommerce/payment', 'address', 'Address', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2476, 1, 'en', 'plugins/ecommerce/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2477, 1, 'en', 'plugins/ecommerce/payment', 'new_payment', 'Payment for order :id', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2478, 1, 'en', 'plugins/ecommerce/payment', 'payment_id', 'Payment ID', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2479, 1, 'en', 'plugins/ecommerce/prices', 'name', 'Price', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2480, 1, 'en', 'plugins/ecommerce/prices', 'create', 'New price', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2481, 1, 'en', 'plugins/ecommerce/prices', 'edit', 'Edit price', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2482, 1, 'en', 'plugins/ecommerce/prices', 'list', 'List price', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2483, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'name', 'Product attribute sets', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2484, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'create', 'New product attribute set', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2485, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'edit', 'Edit product attribute set', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2486, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'visible_in_categories', 'Visible in categories', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2487, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'product_with_more_version', 'Product with more version', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2488, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'create_a_version', 'Create a version', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2489, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'enabled', 'Enabled', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2490, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attributes', 'Attributes', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2491, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'price', 'Price', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2492, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'edit_btn', 'Edit', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2493, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'remove_btn', 'Remove', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2494, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'product', 'Product', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2495, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'back_to_product', 'Back to product', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2496, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'save', 'Save', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2497, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'other_existing_versions', 'Other existing versions', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2498, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'version_information', 'Version information', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2499, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_rule', 'Add rule', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2500, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'rules', 'Rules', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2501, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'pricing', 'Pricing', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2502, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'sale_price', 'Sale price', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2503, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'sale_type', 'Sale type', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2504, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'no_sale_price', 'No sale price', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2505, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'always_on_sale', 'Always on sale', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2506, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'limited_time', 'Limited time', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2507, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'from', 'From', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2508, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'to', 'To', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2509, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'storehouse', 'Storehouse', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2510, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'no_storehouse_management', 'No storehouse management', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2511, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'with_storehouse_management', 'With storehouse management', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2512, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'quantity', 'Quantity', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2513, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'allow_customer_checkout_out_of_stock', 'Allow customer checkout when this product out of stock', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2514, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'shipping', 'Shipping', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2515, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'length', 'Length', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2516, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'wide', 'Wide', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2517, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'height', 'Height', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2518, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'weight', 'Weight', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2519, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'version_images', 'Version images', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2520, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_new_image', 'Add new image', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2521, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attribute_set', 'Attribute set', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2522, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'value', 'Value', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2523, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'dropdown_swatch', 'Dropdown Swatch', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2524, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'visual_swatch', 'Visual Swatch', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2525, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'text_swatch', 'Text Swatch', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2526, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'display_layout', 'Display Layout', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2527, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'searchable', 'Searchable', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2528, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'comparable', 'Comparable', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2529, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'use_in_product_listing', 'Used in product listing', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2530, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attributes_list', 'Attributes list', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2531, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'is_default', 'Is default?', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2532, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'title', 'Title', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2533, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'slug', 'Slug', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2534, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'color', 'Color', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2535, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'image', 'Image', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2536, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'remove', 'Remove', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2537, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_new_attribute', 'Add new attribute', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2538, 1, 'en', 'plugins/ecommerce/product-attributes', 'name', 'Product attributes', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2539, 1, 'en', 'plugins/ecommerce/product-attributes', 'create', 'New product attribute', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2540, 1, 'en', 'plugins/ecommerce/product-attributes', 'edit', 'Edit product attribute', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2541, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.title', 'Manage product attributes', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2542, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.description', 'Product attribute such as color, width, height ...', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2543, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.button_text', 'Create product attribute', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2544, 1, 'en', 'plugins/ecommerce/product-categories', 'name', 'Product categories', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2545, 1, 'en', 'plugins/ecommerce/product-categories', 'create', 'Create new product category', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2546, 1, 'en', 'plugins/ecommerce/product-categories', 'edit', 'Edit product category', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2547, 1, 'en', 'plugins/ecommerce/product-categories', 'list', 'List product categories', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2548, 1, 'en', 'plugins/ecommerce/product-categories', 'none', 'None', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2549, 1, 'en', 'plugins/ecommerce/product-categories', 'menu', 'Product categories', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2550, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.title', 'Manage product categories', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2551, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.description', 'Such as clothes, shoes, bags, jewelry ...', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2552, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.button_text', 'Create product category', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2553, 1, 'en', 'plugins/ecommerce/product-collections', 'name', 'Product collections', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2554, 1, 'en', 'plugins/ecommerce/product-collections', 'create', 'New product collection', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2555, 1, 'en', 'plugins/ecommerce/product-collections', 'edit', 'Edit product collection', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2556, 1, 'en', 'plugins/ecommerce/product-collections', 'slug_help_block', 'Label key: <code>:slug</code>. We will use this key for filter.', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2557, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.title', 'Manage product collections', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2558, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.description', 'Group your products into collections to make it easier for customers to find them by category.', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2559, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.button_text', 'Create product collection', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2560, 1, 'en', 'plugins/ecommerce/product-tag', 'name', 'Product tags', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2561, 1, 'en', 'plugins/ecommerce/product-tag', 'create', 'New product tag', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2562, 1, 'en', 'plugins/ecommerce/product-tag', 'edit', 'Edit product tag', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2563, 1, 'en', 'plugins/ecommerce/products', 'name', 'Products', '2021-03-14 18:40:44', '2021-03-14 18:40:44'),
(2564, 1, 'en', 'plugins/ecommerce/products', 'create', 'New product', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2565, 1, 'en', 'plugins/ecommerce/products', 'edit', 'Edit product - :name', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2566, 1, 'en', 'plugins/ecommerce/products', 'form.name', 'Name', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2567, 1, 'en', 'plugins/ecommerce/products', 'form.name_placeholder', 'Product\'s name (Maximum 120 characters)', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2568, 1, 'en', 'plugins/ecommerce/products', 'form.description', 'Description', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2569, 1, 'en', 'plugins/ecommerce/products', 'form.description_placeholder', 'Short description for product (Maximum 400 characters)', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2570, 1, 'en', 'plugins/ecommerce/products', 'form.categories', 'Categories', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2571, 1, 'en', 'plugins/ecommerce/products', 'form.content', 'Content', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2572, 1, 'en', 'plugins/ecommerce/products', 'form.price', 'Price', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2573, 1, 'en', 'plugins/ecommerce/products', 'form.quantity', 'Quantity', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2574, 1, 'en', 'plugins/ecommerce/products', 'form.brand', 'Brand', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2575, 1, 'en', 'plugins/ecommerce/products', 'form.width', 'Width', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2576, 1, 'en', 'plugins/ecommerce/products', 'form.height', 'Height', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2577, 1, 'en', 'plugins/ecommerce/products', 'form.weight', 'Weight', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2578, 1, 'en', 'plugins/ecommerce/products', 'form.date.end', 'From date', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2579, 1, 'en', 'plugins/ecommerce/products', 'form.date.start', 'To date', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2580, 1, 'en', 'plugins/ecommerce/products', 'form.image', 'Images', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2581, 1, 'en', 'plugins/ecommerce/products', 'form.label', 'Product collections', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2582, 1, 'en', 'plugins/ecommerce/products', 'form.price_sale', 'Price sale', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2583, 1, 'en', 'plugins/ecommerce/products', 'form.product_type.title', 'Product type', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2584, 1, 'en', 'plugins/ecommerce/products', 'form.product', 'Product', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2585, 1, 'en', 'plugins/ecommerce/products', 'form.total', 'Total', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2586, 1, 'en', 'plugins/ecommerce/products', 'form.sub_total', 'Subtotal', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2587, 1, 'en', 'plugins/ecommerce/products', 'form.shipping_fee', 'Shipping fee', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2588, 1, 'en', 'plugins/ecommerce/products', 'form.discount', 'Discount', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2589, 1, 'en', 'plugins/ecommerce/products', 'form.options', 'Options', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2590, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.height', 'Height', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2591, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.length', 'Length', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2592, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.title', 'Shipping', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2593, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.weight', 'Weight', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2594, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.wide', 'Wide', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2595, 1, 'en', 'plugins/ecommerce/products', 'form.stock.allow_order_when_out', 'Allow customer checkout when this product out of stock', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2596, 1, 'en', 'plugins/ecommerce/products', 'form.stock.in_stock', 'In stock', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2597, 1, 'en', 'plugins/ecommerce/products', 'form.stock.out_stock', 'Out stock', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2598, 1, 'en', 'plugins/ecommerce/products', 'form.stock.title', 'Stock status', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2599, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.no_storehouse', 'No storehouse management', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2600, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.storehouse', 'With storehouse management', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2601, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.title', 'Storehouse', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2602, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.quantity', 'Quantity', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2603, 1, 'en', 'plugins/ecommerce/products', 'form.tax', 'Tax', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2604, 1, 'en', 'plugins/ecommerce/products', 'form.is_default', 'Is default', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2605, 1, 'en', 'plugins/ecommerce/products', 'form.action', 'Action', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2606, 1, 'en', 'plugins/ecommerce/products', 'form.restock_quantity', 'Restock quantity', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2607, 1, 'en', 'plugins/ecommerce/products', 'form.remain', 'Remain', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2608, 1, 'en', 'plugins/ecommerce/products', 'form.choose_discount_period', 'Choose Discount Period', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2609, 1, 'en', 'plugins/ecommerce/products', 'form.cancel', 'Cancel', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2610, 1, 'en', 'plugins/ecommerce/products', 'form.no_results', 'No results!', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2611, 1, 'en', 'plugins/ecommerce/products', 'form.value', 'Value', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2612, 1, 'en', 'plugins/ecommerce/products', 'form.attribute_name', 'Attribute name', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2613, 1, 'en', 'plugins/ecommerce/products', 'form.add_more_attribute', 'Add more attribute', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2614, 1, 'en', 'plugins/ecommerce/products', 'form.continue', 'Continue', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2615, 1, 'en', 'plugins/ecommerce/products', 'form.add_new_attributes', 'Add new attributes', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2616, 1, 'en', 'plugins/ecommerce/products', 'form.add_new_attributes_description', 'Adding new attributes helps the product to have many options, such as size or color.', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2617, 1, 'en', 'plugins/ecommerce/products', 'form.create_product_variations', ':link to create product variations!', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2618, 1, 'en', 'plugins/ecommerce/products', 'form.tags', 'Tags', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2619, 1, 'en', 'plugins/ecommerce/products', 'form.write_some_tags', 'Write some tags', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2620, 1, 'en', 'plugins/ecommerce/products', 'form.variation_existed', 'This variation is existed.', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2621, 1, 'en', 'plugins/ecommerce/products', 'form.no_attributes_selected', 'No attributes selected!', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2622, 1, 'en', 'plugins/ecommerce/products', 'form.added_variation_success', 'Added variation successfully!', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2623, 1, 'en', 'plugins/ecommerce/products', 'form.updated_variation_success', 'Updated variation successfully!', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2624, 1, 'en', 'plugins/ecommerce/products', 'form.created_all_variation_success', 'Created all variations successfully!', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2625, 1, 'en', 'plugins/ecommerce/products', 'form.updated_product_attributes_success', 'Updated product attributes successfully!', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2626, 1, 'en', 'plugins/ecommerce/products', 'price', 'Price', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2627, 1, 'en', 'plugins/ecommerce/products', 'quantity', 'Quantity', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2628, 1, 'en', 'plugins/ecommerce/products', 'type', 'Type', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2629, 1, 'en', 'plugins/ecommerce/products', 'image', 'Thumbnail', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2630, 1, 'en', 'plugins/ecommerce/products', 'sku', 'Sku', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2631, 1, 'en', 'plugins/ecommerce/products', 'brand', 'Brand', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2632, 1, 'en', 'plugins/ecommerce/products', 'cannot_delete', 'Product could not be deleted', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2633, 1, 'en', 'plugins/ecommerce/products', 'product_deleted', 'Product deleted', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2634, 1, 'en', 'plugins/ecommerce/products', 'product_collections', 'Product collections', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2635, 1, 'en', 'plugins/ecommerce/products', 'products', 'Products', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2636, 1, 'en', 'plugins/ecommerce/products', 'menu', 'Products', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2637, 1, 'en', 'plugins/ecommerce/products', 'control.button_add_image', 'Add image', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2638, 1, 'en', 'plugins/ecommerce/products', 'price_sale', 'Sale price', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2639, 1, 'en', 'plugins/ecommerce/products', 'price_group_title', 'Manager product price', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2640, 1, 'en', 'plugins/ecommerce/products', 'store_house_group_title', 'Manager store house', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2641, 1, 'en', 'plugins/ecommerce/products', 'shipping_group_title', 'Manager shipping', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2642, 1, 'en', 'plugins/ecommerce/products', 'overview', 'Overview', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2643, 1, 'en', 'plugins/ecommerce/products', 'attributes', 'Attributes', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2644, 1, 'en', 'plugins/ecommerce/products', 'product_has_variations', 'Product has variations', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2645, 1, 'en', 'plugins/ecommerce/products', 'manage_products', 'Manage products', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2646, 1, 'en', 'plugins/ecommerce/products', 'add_new_product', 'Add a new product', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2647, 1, 'en', 'plugins/ecommerce/products', 'start_by_adding_new_product', 'Start by adding new products.', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2648, 1, 'en', 'plugins/ecommerce/products', 'edit_this_product', 'Edit this product', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2649, 1, 'en', 'plugins/ecommerce/products', 'delete', 'Delete', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2650, 1, 'en', 'plugins/ecommerce/products', 'related_products', 'Related products', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2651, 1, 'en', 'plugins/ecommerce/products', 'cross_selling_products', 'Cross-selling products', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2652, 1, 'en', 'plugins/ecommerce/products', 'up_selling_products', 'Up-selling products', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2653, 1, 'en', 'plugins/ecommerce/products', 'grouped_products', 'Grouped products', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2654, 1, 'en', 'plugins/ecommerce/products', 'search_products', 'Search products', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2655, 1, 'en', 'plugins/ecommerce/products', 'selected_products', 'Selected products', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2656, 1, 'en', 'plugins/ecommerce/products', 'edit_variation_item', 'Edit', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2657, 1, 'en', 'plugins/ecommerce/products', 'variations_box_description', 'Click on \"Edit attribute\" to add/remove attributes of variation or click on \"Add new variation\" to add variation.', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2658, 1, 'en', 'plugins/ecommerce/products', 'save_changes', 'Save changes', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2659, 1, 'en', 'plugins/ecommerce/products', 'continue', 'Continue', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2660, 1, 'en', 'plugins/ecommerce/products', 'edit_attribute', 'Edit attribute', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2661, 1, 'en', 'plugins/ecommerce/products', 'select_attribute', 'Select attribute', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2662, 1, 'en', 'plugins/ecommerce/products', 'add_new_variation', 'Add new variation', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2663, 1, 'en', 'plugins/ecommerce/products', 'edit_variation', 'Edit variation', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2664, 1, 'en', 'plugins/ecommerce/products', 'generate_all_variations', 'Generate all variations', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2665, 1, 'en', 'plugins/ecommerce/products', 'generate_all_variations_confirmation', 'Are you sure you want to generate all variations for this product?', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2666, 1, 'en', 'plugins/ecommerce/products', 'delete_variation', 'Delete variation?', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2667, 1, 'en', 'plugins/ecommerce/products', 'delete_variation_confirmation', 'Are you sure you want to delete this variation? This action cannot be undo.', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2668, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_name_required', 'Please enter product\'s name', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2669, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_sale_price_max', 'The discount must be less than the original price', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2670, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_sale_price_required_if', 'Must enter a discount when you want to schedule a promotion', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2671, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_end_date_after', 'End date must be after start date', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2672, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_start_date_required_if', 'Discount start date cannot be left blank when scheduling is selected', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2673, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_sale_price', 'Discounts cannot be left blank when scheduling is selected', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2674, 1, 'en', 'plugins/ecommerce/reports', 'name', 'Report', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2675, 1, 'en', 'plugins/ecommerce/reports', 'widget.order.title', 'Orders', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2676, 1, 'en', 'plugins/ecommerce/reports', 'count.revenue', 'Today revenue', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2677, 1, 'en', 'plugins/ecommerce/reports', 'count.orders', 'Today orders', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2678, 1, 'en', 'plugins/ecommerce/reports', 'count.products', 'Total products', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2679, 1, 'en', 'plugins/ecommerce/reports', 'count.customers', 'Total customers', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2680, 1, 'en', 'plugins/ecommerce/reports', 'product_name', 'Product name', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2681, 1, 'en', 'plugins/ecommerce/reports', 'quantity', 'Quantity', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2682, 1, 'en', 'plugins/ecommerce/reports', 'revenue_statistics', 'Revenue statistics', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2683, 1, 'en', 'plugins/ecommerce/reports', 'top_selling_products', 'Top selling products in this month', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2684, 1, 'en', 'plugins/ecommerce/reports', 'today', 'Today', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2685, 1, 'en', 'plugins/ecommerce/reports', 'this_week', 'This week', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2686, 1, 'en', 'plugins/ecommerce/reports', 'this_month', 'This month', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2687, 1, 'en', 'plugins/ecommerce/reports', 'this_year', 'This year', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2688, 1, 'en', 'plugins/ecommerce/reports', 'revenue_this_month', 'Revenue this month', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2689, 1, 'en', 'plugins/ecommerce/reports', 'order_processing_this_month', 'order(s) processing in this month', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2690, 1, 'en', 'plugins/ecommerce/reports', 'order_completed_this_month', 'order(s) completed in this month', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2691, 1, 'en', 'plugins/ecommerce/reports', 'product_will_be_out_of_stock', 'product(s) will be out of stock soon', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2692, 1, 'en', 'plugins/ecommerce/reports', 'product_out_of_stock', 'product(s) out of stock', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2693, 1, 'en', 'plugins/ecommerce/review', 'name', 'Reviews', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2694, 1, 'en', 'plugins/ecommerce/review', 'add_review', 'Add review', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2695, 1, 'en', 'plugins/ecommerce/review', 'delete_review', 'Delete review', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2696, 1, 'en', 'plugins/ecommerce/review', 'create_review', 'Create Review', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2697, 1, 'en', 'plugins/ecommerce/review', 'please_select_rating', 'Please select rating', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2698, 1, 'en', 'plugins/ecommerce/review', 'comment', 'Comment', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2699, 1, 'en', 'plugins/ecommerce/review', 'approve', 'Approve', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2700, 1, 'en', 'plugins/ecommerce/review', 'approved', 'Approved', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2701, 1, 'en', 'plugins/ecommerce/review', 'disapprove', 'Disapprove', '2021-03-14 18:40:45', '2021-03-14 18:40:45');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2702, 1, 'en', 'plugins/ecommerce/review', 'disapproved', 'Disapproved', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2703, 1, 'en', 'plugins/ecommerce/review', 'product', 'Product', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2704, 1, 'en', 'plugins/ecommerce/review', 'user', 'User', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2705, 1, 'en', 'plugins/ecommerce/review', 'star', 'Star', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2706, 1, 'en', 'plugins/ecommerce/review', 'status', 'Status', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2707, 1, 'en', 'plugins/ecommerce/review', 'list_review', 'Customer reviews', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2708, 1, 'en', 'plugins/ecommerce/review', 'intro.title', 'Manage customer reviews', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2709, 1, 'en', 'plugins/ecommerce/review', 'intro.description', 'Customer reviews will be shown here and you can manage it to show/hide in product detail page.', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2710, 1, 'en', 'plugins/ecommerce/shipping', 'name', 'Shipping Rules', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2711, 1, 'en', 'plugins/ecommerce/shipping', 'shipping', 'Shipping', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2712, 1, 'en', 'plugins/ecommerce/shipping', 'title', 'Title', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2713, 1, 'en', 'plugins/ecommerce/shipping', 'amount', 'Amount', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2714, 1, 'en', 'plugins/ecommerce/shipping', 'currency', 'Currency', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2715, 1, 'en', 'plugins/ecommerce/shipping', 'enable', 'Enable', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2716, 1, 'en', 'plugins/ecommerce/shipping', 'enabled', 'Enabled', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2717, 1, 'en', 'plugins/ecommerce/shipping', 'disable', 'Disable', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2718, 1, 'en', 'plugins/ecommerce/shipping', 'disabled', 'Disabled', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2719, 1, 'en', 'plugins/ecommerce/shipping', 'create_shipping', 'Create a shipping', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2720, 1, 'en', 'plugins/ecommerce/shipping', 'edit_shipping', 'Edit shipping :code', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2721, 1, 'en', 'plugins/ecommerce/shipping', 'status', 'Status', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2722, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_methods', 'Shipping methods', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2723, 1, 'en', 'plugins/ecommerce/shipping', 'create_shipping_method', 'Create shipping method', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2724, 1, 'en', 'plugins/ecommerce/shipping', 'edit_shipping_method', 'Edit shipping method', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2725, 1, 'en', 'plugins/ecommerce/shipping', 'add_shipping_region', 'Add shipping region', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2726, 1, 'en', 'plugins/ecommerce/shipping', 'country', 'Country', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2727, 1, 'en', 'plugins/ecommerce/shipping', 'state', 'State', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2728, 1, 'en', 'plugins/ecommerce/shipping', 'city', 'City', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2729, 1, 'en', 'plugins/ecommerce/shipping', 'address', 'Address', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2730, 1, 'en', 'plugins/ecommerce/shipping', 'phone', 'Phone', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2731, 1, 'en', 'plugins/ecommerce/shipping', 'email', 'Email', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2732, 1, 'en', 'plugins/ecommerce/shipping', 'zip_code', 'Zip code', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2733, 1, 'en', 'plugins/ecommerce/shipping', 'methods.default', 'Default', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2734, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_approved', 'Not approved', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2735, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.approved', 'Approved', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2736, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.picking', 'Picking', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2737, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delay_picking', 'Delay picking', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2738, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.picked', 'Picked', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2739, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_picked', 'Not picked', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2740, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delivering', 'Delivering', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2741, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delivered', 'Delivered', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2742, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_delivered', 'Not delivered', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2743, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.audited', 'Audited', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2744, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.canceled', 'Canceled', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2745, 1, 'en', 'plugins/ecommerce/shipping', 'cod_statuses.pending', 'Pending', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2746, 1, 'en', 'plugins/ecommerce/shipping', 'cod_statuses.completed', 'Completed', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2747, 1, 'en', 'plugins/ecommerce/shipping', 'delete', 'Delete', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2748, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_rules', 'Shipping Rules', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2749, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_rules_description', 'Rules to calculate shipping fee.', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2750, 1, 'en', 'plugins/ecommerce/shipping', 'select_country', 'Select country', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2751, 1, 'en', 'plugins/ecommerce/shipping', 'add_shipping_rule', 'Add shipping rule', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2752, 1, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_rate', 'Delete shipping rate for area', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2753, 1, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_rate_confirmation', 'Are you sure you want to delete <strong class=\"region-price-item-label\"></strong> from this shipping area?', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2754, 1, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_area', 'Delete shipping area', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2755, 1, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_area_confirmation', 'Are you sure you want to delete shipping area <strong class=\"region-item-label\"></strong>?', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2756, 1, 'en', 'plugins/ecommerce/shipping', 'add_shipping_fee_for_area', 'Add shipping fee for area', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2757, 1, 'en', 'plugins/ecommerce/shipping', 'confirm', 'Confirm', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2758, 1, 'en', 'plugins/ecommerce/shipping', 'save', 'Save', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2759, 1, 'en', 'plugins/ecommerce/shipping', 'greater_than', 'Greater than', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2760, 1, 'en', 'plugins/ecommerce/shipping', 'type', 'Type', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2761, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_rule_name', 'Name of shipping rule', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2762, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_fee', 'Shipping fee', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2763, 1, 'en', 'plugins/ecommerce/shipping', 'cancel', 'Cancel', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2764, 1, 'en', 'plugins/ecommerce/shipping', 'base_on_weight', 'Based on product\'s weight (grams)', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2765, 1, 'en', 'plugins/ecommerce/shipping', 'base_on_price', 'Based on product\'s price', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2766, 1, 'en', 'plugins/ecommerce/shipping', 'shipment_canceled', 'Shipment was canceled', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2767, 1, 'en', 'plugins/ecommerce/shipping', 'at', 'At', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2768, 1, 'en', 'plugins/ecommerce/shipping', 'cash_on_delivery', 'Cash on delivery (COD)', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2769, 1, 'en', 'plugins/ecommerce/shipping', 'update_shipping_status', 'Update shipping status', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2770, 1, 'en', 'plugins/ecommerce/shipping', 'update_cod_status', 'Update COD status', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2771, 1, 'en', 'plugins/ecommerce/shipping', 'history', 'History', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2772, 1, 'en', 'plugins/ecommerce/shipping', 'shipment_information', 'Shipment information', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2773, 1, 'en', 'plugins/ecommerce/shipping', 'order_number', 'Order number', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2774, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_method', 'Shipping method', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2775, 1, 'en', 'plugins/ecommerce/shipping', 'select_shipping_method', 'Select shipping method', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2776, 1, 'en', 'plugins/ecommerce/shipping', 'cod_status', 'COD status', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2777, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_status', 'Shipping status', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2778, 1, 'en', 'plugins/ecommerce/shipping', 'customer_information', 'Customer information', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2779, 1, 'en', 'plugins/ecommerce/shipping', 'sku', 'SKU', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2780, 1, 'en', 'plugins/ecommerce/shipping', 'change_status_confirm_title', 'Confirm <span class=\"shipment-status-label\"></span> ?', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2781, 1, 'en', 'plugins/ecommerce/shipping', 'change_status_confirm_description', 'Are you sure you want to confirm <span class=\"shipment-status-label\"></span> for this shipment?', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2782, 1, 'en', 'plugins/ecommerce/shipping', 'accept', 'Accept', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2783, 1, 'en', 'plugins/ecommerce/shipping', 'weight_unit', 'Weight (:unit)', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2784, 1, 'en', 'plugins/ecommerce/shipping', 'warehouse', 'Warehouse', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2785, 1, 'en', 'plugins/ecommerce/shipping', 'cod_amount', 'Cash on delivery amount (COD)', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2786, 1, 'en', 'plugins/ecommerce/shipping', 'cancel_shipping', 'Cancel shipping', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2787, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_address', 'Shipping address', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2788, 1, 'en', 'plugins/ecommerce/shipping', 'packages', 'Packages', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2789, 1, 'en', 'plugins/ecommerce/shipping', 'edit', 'Edit', '2021-03-14 18:40:45', '2021-03-14 18:40:45'),
(2790, 1, 'en', 'plugins/ecommerce/shipping', 'fee', 'Fee', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2791, 1, 'en', 'plugins/ecommerce/shipping', 'note', 'Note', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2792, 1, 'en', 'plugins/ecommerce/shipping', 'finish', 'Finish', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2793, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_fee_cod', 'Shipping fee/COD', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2794, 1, 'en', 'plugins/ecommerce/shipping', 'send_confirmation_email_to_customer', 'Send confirmation email to customer', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2795, 1, 'en', 'plugins/ecommerce/shipping', 'form_name', 'Name', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2796, 1, 'en', 'plugins/ecommerce/shipping', 'changed_shipping_status', 'Changed status of shipping to : :status . Updated by: %user_name%', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2797, 1, 'en', 'plugins/ecommerce/shipping', 'order_confirmed_by', 'Order confirmed by %user_name%', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2798, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_canceled_by', 'Shipping is cancelled by %user_name%', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2799, 1, 'en', 'plugins/ecommerce/shipping', 'update_shipping_status_success', 'Update shipping status successfully!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2800, 1, 'en', 'plugins/ecommerce/shipping', 'update_cod_status_success', 'Updated COD status of shipping successfully!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2801, 1, 'en', 'plugins/ecommerce/shipping', 'updated_cod_status_by', 'Updated COD status to :status . Updated by: %user_name%', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2802, 1, 'en', 'plugins/ecommerce/shipping', 'all', 'All', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2803, 1, 'en', 'plugins/ecommerce/shipping', 'error_when_adding_new_region', 'There is an error when adding new region!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2804, 1, 'en', 'plugins/ecommerce/shipping', 'delivery', 'Delivery', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2805, 1, 'en', 'plugins/ecommerce/shipping', 'adjustment_price_of', 'Adjustment price of :key', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2806, 1, 'en', 'plugins/ecommerce/store-locator', 'name', 'Store locators', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2807, 1, 'en', 'plugins/ecommerce/store-locator', 'description', 'This address will appear on your invoice and will be used to calculate your shipping price.', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2808, 1, 'en', 'plugins/ecommerce/store-locator', 'shop_name', 'Shop name', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2809, 1, 'en', 'plugins/ecommerce/store-locator', 'phone', 'Phone', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2810, 1, 'en', 'plugins/ecommerce/store-locator', 'email', 'Email', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2811, 1, 'en', 'plugins/ecommerce/store-locator', 'state', 'State', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2812, 1, 'en', 'plugins/ecommerce/store-locator', 'city', 'City', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2813, 1, 'en', 'plugins/ecommerce/store-locator', 'country', 'Country', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2814, 1, 'en', 'plugins/ecommerce/store-locator', 'address', 'Address', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2815, 1, 'en', 'plugins/ecommerce/store-locator', 'primary_store_is', 'Primary store is', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2816, 1, 'en', 'plugins/ecommerce/store-locator', 'store_name', 'Store name', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2817, 1, 'en', 'plugins/ecommerce/store-locator', 'select_country', 'Select country...', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2818, 1, 'en', 'plugins/ecommerce/store-locator', 'default_shipping_location', 'Default shipping location', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2819, 1, 'en', 'plugins/ecommerce/store-locator', 'default_store', 'Default store', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2820, 1, 'en', 'plugins/ecommerce/tax', 'name', 'Taxes', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2821, 1, 'en', 'plugins/ecommerce/tax', 'create', 'Create a tax', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2822, 1, 'en', 'plugins/ecommerce/tax', 'edit', 'Edit tax :title', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2823, 1, 'en', 'plugins/ecommerce/tax', 'title', 'Title', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2824, 1, 'en', 'plugins/ecommerce/tax', 'percentage', 'Percentage %', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2825, 1, 'en', 'plugins/ecommerce/tax', 'priority', 'Priority', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2826, 1, 'en', 'plugins/ecommerce/tax', 'select_tax', '-- select --', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2827, 1, 'vi', 'plugins/ecommerce/brands', 'name', 'Th????ng hi???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2828, 1, 'vi', 'plugins/ecommerce/brands', 'create', 'Th??m th????ng hi???u m???i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2829, 1, 'vi', 'plugins/ecommerce/brands', 'edit', 'S???a th????ng hi???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2830, 1, 'vi', 'plugins/ecommerce/brands', 'list', 'Danh s??ch th????ng hi???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2831, 1, 'vi', 'plugins/ecommerce/brands', 'form.name', 'T??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2832, 1, 'vi', 'plugins/ecommerce/brands', 'form.name_placeholder', 'T??n th????ng hi???u (t???i ??a 255 k?? t???)', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2833, 1, 'vi', 'plugins/ecommerce/brands', 'form.description', 'M?? t???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2834, 1, 'vi', 'plugins/ecommerce/brands', 'form.description_placeholder', 'M?? t??? ng???n cho th????ng hi???u n??y (t???i ??a 400 k?? t???)', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2835, 1, 'vi', 'plugins/ecommerce/brands', 'form.website', 'Website', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2836, 1, 'vi', 'plugins/ecommerce/brands', 'form.logo', 'Logo', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2837, 1, 'vi', 'plugins/ecommerce/brands', 'form.is_featured', 'N???i b???t?', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2838, 1, 'vi', 'plugins/ecommerce/brands', 'logo', 'Logo', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2839, 1, 'vi', 'plugins/ecommerce/brands', 'website', 'Website', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2840, 1, 'vi', 'plugins/ecommerce/brands', 'notices.no_select', 'Kh??ng c?? b???n ghi n??o ???????c ch???n!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2841, 1, 'vi', 'plugins/ecommerce/brands', 'notices.update_success_message', 'C???p nh???t th??nh c??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2842, 1, 'vi', 'plugins/ecommerce/brands', 'cannot_delete', 'Xo?? kh??ng th??nh c??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2843, 1, 'vi', 'plugins/ecommerce/brands', 'brand_deleted', 'Xo?? th????ng hi???u th??nh c??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2844, 1, 'vi', 'plugins/ecommerce/brands', 'menu', 'Th????ng hi???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2845, 1, 'vi', 'plugins/ecommerce/brands', 'intro.title', 'Qu???n l?? danh s??ch th????ng hi???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2846, 1, 'vi', 'plugins/ecommerce/brands', 'intro.description', 'C??c th????ng hi???u c???a s???n ph???m nh?? Nike, Adidas, Bitis ...', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2847, 1, 'vi', 'plugins/ecommerce/brands', 'intro.button_text', 'T???o th????ng hi???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2848, 1, 'vi', 'plugins/ecommerce/currencies', 'name', 'Ti???n t???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2849, 1, 'vi', 'plugins/ecommerce/currencies', 'create', 'Th??m lo???i ti???n t??? m???i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2850, 1, 'vi', 'plugins/ecommerce/currencies', 'edit', 'S???a ti???n t???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2851, 1, 'vi', 'plugins/ecommerce/currencies', 'list', 'Danh s??ch ti???n t???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2852, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.title', 'T??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2853, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.code', 'M??', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2854, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.symbol', 'K?? hi???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2855, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.is_prefix_symbol', 'S??? d???ng k?? hi???u tr?????c s??? ti???n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2856, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.status', 'Tr???ng th??i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2857, 1, 'vi', 'plugins/ecommerce/currencies', 'tables.order', 'S???p x???p', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2858, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.title', 'Ti??u ?????', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2859, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.code', 'M??', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2860, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.symbol', 'K?? hi???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2861, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.is_prefix_symbol', 'S??? d???ng k?? hi???u tr?????c s??? ti???n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2862, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.status', 'Tr???ng th??i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2863, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.order', 'S???p x???p', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2864, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.decimals', 'S??? k?? t??? sau d???u ph??n c??ch', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2865, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.activated', '???? k??ch ho???t', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2866, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.deactivated', '???? b??? hu??? k??ch ho???t', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2867, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.yes', 'C??', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2868, 1, 'vi', 'plugins/ecommerce/currencies', 'forms.no', 'Kh??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2869, 1, 'vi', 'plugins/ecommerce/currency', 'currencies', 'Ti???n t???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2870, 1, 'vi', 'plugins/ecommerce/currency', 'setting_description', 'C??c lo???i ti???n t??? ???????c s??? d???ng tr??n website.', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2871, 1, 'vi', 'plugins/ecommerce/currency', 'name', 'T??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2872, 1, 'vi', 'plugins/ecommerce/currency', 'symbol', 'K?? hi???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2873, 1, 'vi', 'plugins/ecommerce/currency', 'number_of_decimals', 'S??? th???p ph??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2874, 1, 'vi', 'plugins/ecommerce/currency', 'exchange_rate', 'T??? gi??', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2875, 1, 'vi', 'plugins/ecommerce/currency', 'is_prefix_symbol', 'V??? tr?? k?? hi???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2876, 1, 'vi', 'plugins/ecommerce/currency', 'is_default', 'M???c ?????nh?', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2877, 1, 'vi', 'plugins/ecommerce/currency', 'remove', 'Xo??', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2878, 1, 'vi', 'plugins/ecommerce/currency', 'new_currency', 'Th??m ti???n t??? m???i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2879, 1, 'vi', 'plugins/ecommerce/currency', 'save_settings', 'L??u c??i ?????t', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2880, 1, 'vi', 'plugins/ecommerce/currency', 'before_number', 'Tr?????c s???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2881, 1, 'vi', 'plugins/ecommerce/currency', 'after_number', 'Sau s???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2882, 1, 'vi', 'plugins/ecommerce/customer', 'name', 'Kh??ch h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2883, 1, 'vi', 'plugins/ecommerce/customer', 'create', 'Create a customer', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2884, 1, 'vi', 'plugins/ecommerce/customer', 'edit', 'Edit customer \":name\"', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2885, 1, 'vi', 'plugins/ecommerce/customer', 'email', 'Email', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2886, 1, 'vi', 'plugins/ecommerce/customer', 'email_placeholder', 'Ex: example@gmail.com', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2887, 1, 'vi', 'plugins/ecommerce/customer', 'password', 'Password', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2888, 1, 'vi', 'plugins/ecommerce/customer', 'change_password', 'Change password?', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2889, 1, 'vi', 'plugins/ecommerce/customer', 'password_confirmation', 'Password confirmation', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2890, 1, 'vi', 'plugins/ecommerce/customer', 'intro.title', 'Qu???n l?? danh s??ch kh??ch h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2891, 1, 'vi', 'plugins/ecommerce/customer', 'intro.description', 'Khi kh??ch h??ng ?????t h??ng, b???n s??? bi???t ???????c th??ng tin v?? l???ch s??? mua h??ng c???a kh??ch h??ng.', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2892, 1, 'vi', 'plugins/ecommerce/customer', 'intro.button_text', 'T???o kh??ch h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2893, 1, 'vi', 'plugins/ecommerce/discount', 'name', 'Khuy???n m??i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2894, 1, 'vi', 'plugins/ecommerce/discount', 'invalid_coupon', 'M?? khuy???n m??i kh??ng h???p l??? ho???c ???? h???t h???n!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2895, 1, 'vi', 'plugins/ecommerce/discount', 'cannot_use_same_time_with_other_discount_program', 'M?? khuy???n m??i n??y kh??ng th??? s??? d???ng chung v???i ch????ng tr??nh khuy???n m??i!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2896, 1, 'vi', 'plugins/ecommerce/discount', 'not_used', 'Ch??a s??? d???ng m?? gi???m gi?? n??y', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2897, 1, 'vi', 'plugins/ecommerce/discount', 'detail', 'Detail', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2898, 1, 'vi', 'plugins/ecommerce/discount', 'used', 'Used', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2899, 1, 'vi', 'plugins/ecommerce/discount', 'start_date', 'Start date', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2900, 1, 'vi', 'plugins/ecommerce/discount', 'end_date', 'End date', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2901, 1, 'vi', 'plugins/ecommerce/discount', 'intro.title', 'Ch????ng tr??nh khuy???n m??i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2902, 1, 'vi', 'plugins/ecommerce/discount', 'intro.description', 'T???o ra c??c m?? coupon, c??i ?????t m???t s???n ph???m, ho???c m???t nh??m s???n ph???m khuy???n m??i d??nh cho c??c kh??ch h??ng th??n thi???t c???a b???n.', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2903, 1, 'vi', 'plugins/ecommerce/discount', 'intro.button_text', 'T???o khuy???n m??i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2904, 1, 'vi', 'plugins/ecommerce/ecommerce', 'settings', 'C??i ?????t', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2905, 1, 'vi', 'plugins/ecommerce/ecommerce', 'name', 'Th????ng m???i ??i???n t???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2906, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.title', 'E-commerce', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2907, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.description', 'Ecommerce email config', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2908, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject', 'Subject of order confirmation email', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2909, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject_placeholder', 'The subject of email confirmation send to the customer', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2910, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_content', 'Content of order confirmation email', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2911, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject', 'Subject of email when changing order\'s status', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2912, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject_placeholder', 'Subject of email when changing order\'s status send to customer', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2913, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_content', 'Content of email when changing order\'s status', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2914, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.from_email', 'Email from', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2915, 1, 'vi', 'plugins/ecommerce/ecommerce', 'setting.email.from_email_placeholder', 'Email from address to display in mail. Ex: example@gmail.com', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2916, 1, 'vi', 'plugins/ecommerce/ecommerce', 'store_address', '?????a ch??? c???a h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2917, 1, 'vi', 'plugins/ecommerce/ecommerce', 'store_phone', 'S??? ??i???n tho???i c???a h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2918, 1, 'vi', 'plugins/ecommerce/ecommerce', 'order_id', 'M?? ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2919, 1, 'vi', 'plugins/ecommerce/ecommerce', 'order_token', 'Chu???i m?? ho?? ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2920, 1, 'vi', 'plugins/ecommerce/ecommerce', 'customer_name', 'T??n kh??ch h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2921, 1, 'vi', 'plugins/ecommerce/ecommerce', 'customer_email', 'Email kh??ch h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2922, 1, 'vi', 'plugins/ecommerce/ecommerce', 'customer_phone', 'S??? ??i???n tho???i kh??ch h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2923, 1, 'vi', 'plugins/ecommerce/ecommerce', 'customer_address', '?????a ch??? kh??ch h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2924, 1, 'vi', 'plugins/ecommerce/ecommerce', 'product_list', 'Danh s??ch s???n ph???m trong ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2925, 1, 'vi', 'plugins/ecommerce/ecommerce', 'payment_detail', 'Chi ti???t thanh to??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2926, 1, 'vi', 'plugins/ecommerce/ecommerce', 'shipping_method', 'Ph????ng th???c v???n chuy???n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2927, 1, 'vi', 'plugins/ecommerce/ecommerce', 'payment_method', 'Ph????ng th???c thanh to??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2928, 1, 'vi', 'plugins/ecommerce/ecommerce', 'standard_and_format', 'Ti??u chu???n & ?????nh d???ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2929, 1, 'vi', 'plugins/ecommerce/ecommerce', 'standard_and_format_description', 'C??c ti??u chu???n v?? c??c ?????nh d???ng ???????c s??? d???ng ????? t??nh to??n nh???ng th??? nh?? gi?? c??? s???n ph???m, tr???ng l?????ng v???n chuy???n v?? th???i gian ????n h??ng ???????c ?????t.', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2930, 1, 'vi', 'plugins/ecommerce/ecommerce', 'change_order_format', 'Ch???nh s???a ?????nh d???ng m?? ????n h??ng (t??y ch???n)', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2931, 1, 'vi', 'plugins/ecommerce/ecommerce', 'change_order_format_description', 'M?? ????n h??ng m???c ?????nh b???t ?????u t??? :number. B???n c?? th??? thay ?????i chu???i b???t ?????u ho???c k???t th??c ????? t???o m?? ????n h??ng theo ?? b???n, v?? d??? \"DH-:number\" ho???c \":number-A\"', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2932, 1, 'vi', 'plugins/ecommerce/ecommerce', 'start_with', 'B???t ?????u b???ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2933, 1, 'vi', 'plugins/ecommerce/ecommerce', 'end_with', 'K???t th??c b???ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2934, 1, 'vi', 'plugins/ecommerce/ecommerce', 'order_will_be_shown', 'M?? ????n h??ng c???a b???n s??? hi???n th??? theo m???u', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2935, 1, 'vi', 'plugins/ecommerce/ecommerce', 'weight_unit', '????n v??? c??n n???ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2936, 1, 'vi', 'plugins/ecommerce/ecommerce', 'height_unit', '????n v??? chi???u d??i/chi???u cao', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2937, 1, 'vi', 'plugins/ecommerce/email', 'customer_new_order_title', 'X??c nh???n ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2938, 1, 'vi', 'plugins/ecommerce/email', 'customer_new_order_description', '???????c g???i khi kh??ch h??ng t???o ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2939, 1, 'vi', 'plugins/ecommerce/email', 'customer_new_order_subject', '????n h??ng m???i {{ order_id }}', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2940, 1, 'vi', 'plugins/ecommerce/email', 'order_cancellation_title', 'H???y ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2941, 1, 'vi', 'plugins/ecommerce/email', 'order_cancellation_description', '???????c g???i khi kh??ch h??ng h???y ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2942, 1, 'vi', 'plugins/ecommerce/email', 'order_cancellation_subject', '????n h??ng ???? ???????c hu??? {{ order_id }}', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2943, 1, 'vi', 'plugins/ecommerce/email', 'delivery_confirmation_title', 'X??c nh???n giao h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2944, 1, 'vi', 'plugins/ecommerce/email', 'delivery_confirmation_description', '???????c g???i ?????n kh??ch h??ng khi b???t ?????u giao h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2945, 1, 'vi', 'plugins/ecommerce/email', 'delivery_confirmation_subject', '????n h??ng ??ang ???????c giao {{ order_id }}', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2946, 1, 'vi', 'plugins/ecommerce/email', 'admin_new_order_title', 'Th??ng b??o c?? ????n h??ng m???i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2947, 1, 'vi', 'plugins/ecommerce/email', 'admin_new_order_description', '???????c g???i cho qu???n tr??? vi??n khi c?? kh??ch mua h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2948, 1, 'vi', 'plugins/ecommerce/email', 'admin_new_order_subject', '????n h??ng m???i {{ order_id }}', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2949, 1, 'vi', 'plugins/ecommerce/email', 'order_confirmation_title', 'X??c nh???n ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2950, 1, 'vi', 'plugins/ecommerce/email', 'order_confirmation_description', 'Email ???????c g???i ?????n kh??ch h??ng khi ????n h??ng x??c nh???n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2951, 1, 'vi', 'plugins/ecommerce/email', 'order_confirmation_subject', '????n h??ng ???? ???????c x??c nh???n {{ order_id }}', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2952, 1, 'vi', 'plugins/ecommerce/email', 'payment_confirmation_title', 'X??c nh???n thanh to??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2953, 1, 'vi', 'plugins/ecommerce/email', 'payment_confirmation_description', 'Email ???????c g???i ?????n kh??ch h??ng khi ????n h??ng x??c nh???n thanh to??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2954, 1, 'vi', 'plugins/ecommerce/email', 'payment_confirmation_subject', '????n h??ng ???? ???????c x??c nh???n thanh to??n {{ order_id }}', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2955, 1, 'vi', 'plugins/ecommerce/email', 'order_recover_title', '????n h??ng ??ang ch??? ho??n t???t', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2956, 1, 'vi', 'plugins/ecommerce/email', 'order_recover_description', 'Email nh???c nh??? kh??ch h??ng ho??n t???t ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2957, 1, 'vi', 'plugins/ecommerce/email', 'order_recover_subject', '????n h??ng ??ang ch??? ho??n t???t', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2958, 1, 'vi', 'plugins/ecommerce/order', 'statuses.pending', 'Ch??a x??? l??', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2959, 1, 'vi', 'plugins/ecommerce/order', 'statuses.processing', '??ang x??? l??', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2960, 1, 'vi', 'plugins/ecommerce/order', 'statuses.delivering', '??ang giao h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2961, 1, 'vi', 'plugins/ecommerce/order', 'statuses.delivered', '???? giao h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2962, 1, 'vi', 'plugins/ecommerce/order', 'statuses.completed', 'Ho??n th??nh', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2963, 1, 'vi', 'plugins/ecommerce/order', 'statuses.canceled', 'B??? hu???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2964, 1, 'vi', 'plugins/ecommerce/order', 'name', '????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2965, 1, 'vi', 'plugins/ecommerce/order', 'customer.messages.cancel_error', '????n h??ng ??ang ???????c giao ho???c ???? ho??n th??nh', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2966, 1, 'vi', 'plugins/ecommerce/order', 'customer.messages.cancel_success', 'Hu??? ????n h??ng th??nh c??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2967, 1, 'vi', 'plugins/ecommerce/order', 'incomplete_order', '????n h??ng ch??a ho??n t???t', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2968, 1, 'vi', 'plugins/ecommerce/order', 'order_id', 'M?? ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2969, 1, 'vi', 'plugins/ecommerce/order', 'customer_label', 'Kh??ch h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2970, 1, 'vi', 'plugins/ecommerce/order', 'amount', 'T???ng c???ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2971, 1, 'vi', 'plugins/ecommerce/order', 'shipping_amount', 'Ph?? v???n chuy???n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2972, 1, 'vi', 'plugins/ecommerce/order', 'payment_method', 'Ph????ng th???c thanh to??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2973, 1, 'vi', 'plugins/ecommerce/order', 'payment_status_label', 'Tr???ng th??i thanh to??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2974, 1, 'vi', 'plugins/ecommerce/order', 'manage_orders', 'Qu???n l?? ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2975, 1, 'vi', 'plugins/ecommerce/order', 'order_intro_description', 'M???t khi c???a h??ng c???a b???n c?? ????n ?????t h??ng, ????y s??? l?? n??i b???n x??? l?? v?? theo d??i nh???ng ????n ?????t h??ng ????.', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2976, 1, 'vi', 'plugins/ecommerce/order', 'create_new_order', 'T???o ????n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2977, 1, 'vi', 'plugins/ecommerce/order', 'manage_incomplete_orders', 'Qu???n l?? ????n h??ng ch??a ho??n t???t', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2978, 1, 'vi', 'plugins/ecommerce/order', 'incomplete_orders_intro_description', '????n h??ng ch??a ho??n t???t l?? ????n h??ng ???????c t???o khi kh??ch h??ng th??m s???n ph???m v??o gi??? h??ng, ti???n h??nh ??i???n th??ng tin mua h??ng nh??ng kh??ng ho??n t???t qu?? tr??nh thanh to??n.', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2979, 1, 'vi', 'plugins/ecommerce/payment', 'name', 'Thanh to??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2980, 1, 'vi', 'plugins/ecommerce/payment', 'all_payment', 'T???t c??? thanh to??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2981, 1, 'vi', 'plugins/ecommerce/payment', 'payment_method', 'Ph????ng th???c thanh to??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2982, 1, 'vi', 'plugins/ecommerce/payment', 'checkout_success', 'Thanh to??n th??nh c??ng!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2983, 1, 'vi', 'plugins/ecommerce/payment', 'view_payment', 'Xem thanh to??n #', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2984, 1, 'vi', 'plugins/ecommerce/payment', 'charge_id', 'M?? giao d???ch', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2985, 1, 'vi', 'plugins/ecommerce/payment', 'amount', 'S??? ti???n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2986, 1, 'vi', 'plugins/ecommerce/payment', 'currency', '????n v??? ti???n t???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2987, 1, 'vi', 'plugins/ecommerce/payment', 'user', 'Ng?????i d??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2988, 1, 'vi', 'plugins/ecommerce/payment', 'paypal_name_required', 'T??n c???a ph????ng th???c PayPal l?? b???t bu???c!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2989, 1, 'vi', 'plugins/ecommerce/payment', 'paypal_name_max', 'T??n c???a ph????ng th???c PayPal qu?? d??i!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2990, 1, 'vi', 'plugins/ecommerce/payment', 'stripe_name_required', 'T??n c???a ph????ng th???c Stripe l?? b???t bu???c!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2991, 1, 'vi', 'plugins/ecommerce/payment', 'stripe_name_max', 'T??n c???a ph????ng th???c Stripe qu?? d??i!', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2992, 1, 'vi', 'plugins/ecommerce/payment', 'status', 'Tr???ng th??i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2993, 1, 'vi', 'plugins/ecommerce/payment', 'enabled', 'B???t', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2994, 1, 'vi', 'plugins/ecommerce/payment', 'disabled', 'T???t', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2995, 1, 'vi', 'plugins/ecommerce/payment', 'client_id', 'Client ID', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2996, 1, 'vi', 'plugins/ecommerce/payment', 'client_secret', 'Client Secret', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2997, 1, 'vi', 'plugins/ecommerce/payment', 'mode', 'Ch??? ?????', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2998, 1, 'vi', 'plugins/ecommerce/payment', 'sandbox', 'Sandbox', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(2999, 1, 'vi', 'plugins/ecommerce/payment', 'live', 'Live', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3000, 1, 'vi', 'plugins/ecommerce/payment', 'enable_payment_log', 'B???t l??u nh???t k?? thanh to??n', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3001, 1, 'vi', 'plugins/ecommerce/payment', 'yes', 'C??', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3002, 1, 'vi', 'plugins/ecommerce/payment', 'no', 'Kh??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3003, 1, 'vi', 'plugins/ecommerce/payment', 'client_key', 'Client Key', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3004, 1, 'vi', 'plugins/ecommerce/payment', 'stripe', 'Stripe', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3005, 1, 'vi', 'plugins/ecommerce/payment', 'paypal', 'PayPal', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3006, 1, 'vi', 'plugins/ecommerce/payment', 'action', 'H??nh ?????ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3007, 1, 'vi', 'plugins/ecommerce/payment', 'go_back', 'Quay l???i', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3008, 1, 'vi', 'plugins/ecommerce/payment', 'view', 'Xem', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3009, 1, 'vi', 'plugins/ecommerce/payment', 'cash_on_delivery', 'Thanh to??n khi nh???n h??ng (COD)', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3010, 1, 'vi', 'plugins/ecommerce/payment', 'via_bank_transfer', 'Th??ng qua chuy???n kho???n ng??n h??ng', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3011, 1, 'vi', 'plugins/ecommerce/payment', 'payment_via_cart', 'Thanh to??n b???ng th???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3012, 1, 'vi', 'plugins/ecommerce/payment', 'card_number', 'S??? th???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3013, 1, 'vi', 'plugins/ecommerce/payment', 'full_name', 'T??n tr??n th???', '2021-03-14 18:40:46', '2021-03-14 18:40:46'),
(3014, 1, 'vi', 'plugins/ecommerce/payment', 'payment_via_paypal', 'Thanh to??n th??ng qua PayPal', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3015, 1, 'vi', 'plugins/ecommerce/payment', 'mm_yy', 'MM/YY', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3016, 1, 'vi', 'plugins/ecommerce/payment', 'cvc', 'CVC', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3017, 1, 'vi', 'plugins/ecommerce/payment', 'details', 'Chi ti???t', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3018, 1, 'vi', 'plugins/ecommerce/payment', 'payer_name', 'Ng?????i thanh to??n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3019, 1, 'vi', 'plugins/ecommerce/payment', 'email', '?????a ch??? email', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3020, 1, 'vi', 'plugins/ecommerce/payment', 'phone', '??i???n tho???i', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3021, 1, 'vi', 'plugins/ecommerce/payment', 'country', 'Qu???c gia', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3022, 1, 'vi', 'plugins/ecommerce/payment', 'shipping_address', '?????a ch??? giao h??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3023, 1, 'vi', 'plugins/ecommerce/payment', 'payment_details', 'Chi ti???t giao d???ch', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3024, 1, 'vi', 'plugins/ecommerce/payment', 'card', 'Th???', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3025, 1, 'vi', 'plugins/ecommerce/payment', 'address', '?????a ch???', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3026, 1, 'vi', 'plugins/ecommerce/payment', 'could_not_get_stripe_token', 'Kh??ng th??? l???y m?? Stripe ????? thanh to??n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3027, 1, 'vi', 'plugins/ecommerce/payment', 'new_payment', 'Thanh to??n cho ????n h??ng :id', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3028, 1, 'vi', 'plugins/ecommerce/payment', 'payment_id', 'M?? thanh to??n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3029, 1, 'vi', 'plugins/ecommerce/prices', 'name', 'Price', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3030, 1, 'vi', 'plugins/ecommerce/prices', 'create', 'New price', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3031, 1, 'vi', 'plugins/ecommerce/prices', 'edit', 'Edit price', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3032, 1, 'vi', 'plugins/ecommerce/prices', 'list', 'List price', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3033, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'name', 'Product attribute sets', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3034, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'create', 'New product attribute set', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3035, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'edit', 'Edit product attribute set', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3036, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'visible_in_categories', 'Visible in categories', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3037, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'product_with_more_version', 'Product with more version', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3038, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'create_a_version', 'Create a version', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3039, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'enabled', 'Enabled', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3040, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'attributes', 'Attributes', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3041, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'price', 'Price', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3042, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'edit_btn', 'Edit', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3043, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'remove_btn', 'Remove', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3044, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'product', 'Product', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3045, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'back_to_product', 'Back to product', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3046, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'save', 'Save', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3047, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'other_existing_versions', 'Other existing versions', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3048, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'version_information', 'Version information', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3049, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'add_rule', 'Add rule', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3050, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'rules', 'Rules', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3051, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'pricing', 'Pricing', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3052, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'sale_price', 'Sale price', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3053, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'sale_type', 'Sale type', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3054, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'no_sale_price', 'No sale price', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3055, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'always_on_sale', 'Always on sale', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3056, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'limited_time', 'Limited time', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3057, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'from', 'From', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3058, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'to', 'To', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3059, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'storehouse', 'Storehouse', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3060, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'no_storehouse_management', 'No storehouse management', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3061, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'with_storehouse_management', 'With storehouse management', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3062, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'quantity', 'Quantity', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3063, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'allow_customer_checkout_out_of_stock', 'Allow customer checkout when this product out of stock', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3064, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'shipping', 'Shipping', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3065, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'length', 'Length', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3066, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'wide', 'Wide', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3067, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'height', 'Height', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3068, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'weight', 'Weight', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3069, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'version_images', 'Version images', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3070, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'add_new_image', 'Add new image', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3071, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'attribute_set', 'Attribute set', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3072, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'value', 'Value', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3073, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'dropdown_swatch', 'Dropdown Swatch', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3074, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'visual_swatch', 'Visual Swatch', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3075, 1, 'vi', 'plugins/ecommerce/product-attribute-sets', 'text_swatch', 'Text Swatch', '2021-03-14 18:40:47', '2021-03-14 18:40:47');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(3076, 1, 'vi', 'plugins/ecommerce/product-attributes', 'name', 'Thu???c t??nh s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3077, 1, 'vi', 'plugins/ecommerce/product-attributes', 'create', 'T???o', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3078, 1, 'vi', 'plugins/ecommerce/product-attributes', 'edit', 'S???a', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3079, 1, 'vi', 'plugins/ecommerce/product-attributes', 'intro.title', 'Qu???n l?? danh s??ch thu???c t??nh s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3080, 1, 'vi', 'plugins/ecommerce/product-attributes', 'intro.description', 'C??c thu???c t??nh c???a s???n ph???m nh?? m??u s???c, k??ch th?????c ...', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3081, 1, 'vi', 'plugins/ecommerce/product-attributes', 'intro.button_text', 'T???o thu???c t??nh s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3082, 1, 'vi', 'plugins/ecommerce/product-categories', 'create', 'Create new product category', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3083, 1, 'vi', 'plugins/ecommerce/product-categories', 'edit', 'Edit product category', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3084, 1, 'vi', 'plugins/ecommerce/product-categories', 'name', 'Danh m???c s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3085, 1, 'vi', 'plugins/ecommerce/product-categories', 'none', 'Kh??ng c??', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3086, 1, 'vi', 'plugins/ecommerce/product-categories', 'menu', 'Danh m???c s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3087, 1, 'vi', 'plugins/ecommerce/product-categories', 'intro.title', 'Qu???n l?? danh s??ch danh m???c s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3088, 1, 'vi', 'plugins/ecommerce/product-categories', 'intro.description', 'Danh m???c s???n ph???m nh?? qu???n ??o, gi??y d??p, linh ki???n ??i???n t??? ...', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3089, 1, 'vi', 'plugins/ecommerce/product-categories', 'intro.button_text', 'T???o danh m???c s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3090, 1, 'vi', 'plugins/ecommerce/product-collections', 'name', 'Nh??m s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3091, 1, 'vi', 'plugins/ecommerce/product-collections', 'create', 'Th??m nh??m s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3092, 1, 'vi', 'plugins/ecommerce/product-collections', 'edit', 'S???a nh??m s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3093, 1, 'vi', 'plugins/ecommerce/product-collections', 'slug_help_block', 'Label key: <code>:slug</code>. We will use this key for filter.', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3094, 1, 'vi', 'plugins/ecommerce/product-collections', 'intro.title', 'Qu???n l?? nh??m s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3095, 1, 'vi', 'plugins/ecommerce/product-collections', 'intro.description', 'Nh??m s???n ph???m gi??p qu???n l?? s???n ph???m v?? kh??ch h??ng t??m ki???m s???n ph???m m???t c??ch d??? d??ng.', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3096, 1, 'vi', 'plugins/ecommerce/product-collections', 'intro.button_text', 'T???o nh??m s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3097, 1, 'vi', 'plugins/ecommerce/products', 'name', 'S???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3098, 1, 'vi', 'plugins/ecommerce/products', 'create', 'Th??m s???n ph???m m???i', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3099, 1, 'vi', 'plugins/ecommerce/products', 'edit', 'S???a s???n ph???m - :name', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3100, 1, 'vi', 'plugins/ecommerce/products', 'form.name', 'T??n s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3101, 1, 'vi', 'plugins/ecommerce/products', 'form.name_placeholder', 'T??n s???n ph???m (T???i ??a 120 ch??? c??i)', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3102, 1, 'vi', 'plugins/ecommerce/products', 'form.description', 'M?? t??? ng???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3103, 1, 'vi', 'plugins/ecommerce/products', 'form.description_placeholder', 'M?? t??? ng???n g???n cho s???n ph???m (T???i ??a 400 ch??? c??i)', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3104, 1, 'vi', 'plugins/ecommerce/products', 'form.categories', 'Danh m???c', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3105, 1, 'vi', 'plugins/ecommerce/products', 'form.content', 'Chi ti???t s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3106, 1, 'vi', 'plugins/ecommerce/products', 'form.price', 'Gi?? c?? b???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3107, 1, 'vi', 'plugins/ecommerce/products', 'form.price_sale', 'Gi?? gi???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3108, 1, 'vi', 'plugins/ecommerce/products', 'form.quantity', 'S??? l?????ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3109, 1, 'vi', 'plugins/ecommerce/products', 'form.brand', 'Th????ng hi???u', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3110, 1, 'vi', 'plugins/ecommerce/products', 'form.width', 'R???ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3111, 1, 'vi', 'plugins/ecommerce/products', 'form.height', 'Cao', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3112, 1, 'vi', 'plugins/ecommerce/products', 'form.weight', 'C??n n???ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3113, 1, 'vi', 'plugins/ecommerce/products', 'form.image', 'H??nh ???nh', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3114, 1, 'vi', 'plugins/ecommerce/products', 'form.label', 'Nh??m s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3115, 1, 'vi', 'plugins/ecommerce/products', 'form.product_type.title', 'Lo???i s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3116, 1, 'vi', 'plugins/ecommerce/products', 'form.stock.title', 'T??nh tr???ng kho', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3117, 1, 'vi', 'plugins/ecommerce/products', 'form.stock.in_stock', 'C??n h??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3118, 1, 'vi', 'plugins/ecommerce/products', 'form.stock.out_stock', 'H???t h??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3119, 1, 'vi', 'plugins/ecommerce/products', 'form.stock.allow_order_when_out', 'Cho ph??p ?????t h??ng khi h???t', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3120, 1, 'vi', 'plugins/ecommerce/products', 'form.storehouse.title', 'Qu???n l?? kho', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3121, 1, 'vi', 'plugins/ecommerce/products', 'form.storehouse.no_storehouse', 'Kh??ng qu???n l?? kho', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3122, 1, 'vi', 'plugins/ecommerce/products', 'form.storehouse.storehouse', 'Qu???n l?? kho', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3123, 1, 'vi', 'plugins/ecommerce/products', 'form.storehouse.quantity', 'S??? l?????ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3124, 1, 'vi', 'plugins/ecommerce/products', 'form.shipping.title', 'Giao h??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3125, 1, 'vi', 'plugins/ecommerce/products', 'form.shipping.length', 'Chi???u d??i', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3126, 1, 'vi', 'plugins/ecommerce/products', 'form.shipping.wide', 'Chi???u r???ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3127, 1, 'vi', 'plugins/ecommerce/products', 'form.shipping.height', 'Chi???u cao', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3128, 1, 'vi', 'plugins/ecommerce/products', 'form.shipping.weight', 'C??n n???ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3129, 1, 'vi', 'plugins/ecommerce/products', 'form.date.start', 'Ng??y b???t ?????u', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3130, 1, 'vi', 'plugins/ecommerce/products', 'form.date.end', 'Ng??y k???t th??c', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3131, 1, 'vi', 'plugins/ecommerce/products', 'form.tags', 'Nh??n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3132, 1, 'vi', 'plugins/ecommerce/products', 'form.tax', 'Thu???', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3133, 1, 'vi', 'plugins/ecommerce/products', 'price', 'Gi?? c?? b???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3134, 1, 'vi', 'plugins/ecommerce/products', 'price_sale', 'Gi?? gi???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3135, 1, 'vi', 'plugins/ecommerce/products', 'quantity', 'S??? l?????ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3136, 1, 'vi', 'plugins/ecommerce/products', 'type', 'Lo???i s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3137, 1, 'vi', 'plugins/ecommerce/products', 'image', '???nh', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3138, 1, 'vi', 'plugins/ecommerce/products', 'sku', 'M?? s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3139, 1, 'vi', 'plugins/ecommerce/products', 'brand', 'Th????ng hi???u', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3140, 1, 'vi', 'plugins/ecommerce/products', 'cannot_delete', 'Product could not be deleted', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3141, 1, 'vi', 'plugins/ecommerce/products', 'product_deleted', 'Product deleted', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3142, 1, 'vi', 'plugins/ecommerce/products', 'product_collections', 'Nh??m s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3143, 1, 'vi', 'plugins/ecommerce/products', 'products', 'S???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3144, 1, 'vi', 'plugins/ecommerce/products', 'menu', 'S???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3145, 1, 'vi', 'plugins/ecommerce/products', 'control.button_add_image', 'Th??m h??nh ???nh', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3146, 1, 'vi', 'plugins/ecommerce/products', 'overview', 'T???ng quan', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3147, 1, 'vi', 'plugins/ecommerce/products', 'attributes', 'Thu???c t??nh', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3148, 1, 'vi', 'plugins/ecommerce/products', 'product_has_variations', 'S???n ph???m c?? nhi???u phi??n b???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3149, 1, 'vi', 'plugins/ecommerce/products', 'manage_products', 'Qu???n l?? danh s??ch s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3150, 1, 'vi', 'plugins/ecommerce/products', 'add_new_product', 'T???o s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3151, 1, 'vi', 'plugins/ecommerce/products', 'start_by_adding_new_product', 'B???t ?????u b??n h??ng b???ng vi???c th??m s???n ph???m.', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3152, 1, 'vi', 'plugins/ecommerce/reports', 'name', 'B??o c??o', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3153, 1, 'vi', 'plugins/ecommerce/reports', 'widget.order.title', '????n h??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3154, 1, 'vi', 'plugins/ecommerce/reports', 'count.revenue', 'Doanh thu h??m nay', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3155, 1, 'vi', 'plugins/ecommerce/reports', 'count.orders', '????n h??ng h??m nay', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3156, 1, 'vi', 'plugins/ecommerce/reports', 'count.products', 'S???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3157, 1, 'vi', 'plugins/ecommerce/reports', 'count.customers', 'Kh??ch h??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3158, 1, 'vi', 'plugins/ecommerce/reports', 'product_name', 'T??n s???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3159, 1, 'vi', 'plugins/ecommerce/reports', 'quantity', 'S??? l?????ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3160, 1, 'vi', 'plugins/ecommerce/reports', 'revenue_statistics', 'Th???ng k?? doanh thu', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3161, 1, 'vi', 'plugins/ecommerce/reports', 'top_selling_products', 'S???n ph???m b??n ch???y trong th??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3162, 1, 'vi', 'plugins/ecommerce/review', 'name', '????nh gi??', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3163, 1, 'vi', 'plugins/ecommerce/review', 'list_review', 'Kh??ch h??ng ????nh gi??', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3164, 1, 'vi', 'plugins/ecommerce/review', 'add_review', 'Th??m ????nh gi??', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3165, 1, 'vi', 'plugins/ecommerce/review', 'delete_review', 'X??a ????nh gi??', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3166, 1, 'vi', 'plugins/ecommerce/review', 'create_review', 'T???o ????nh gi??', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3167, 1, 'vi', 'plugins/ecommerce/review', 'please_select_rating', 'Ch???n ????nh gi??', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3168, 1, 'vi', 'plugins/ecommerce/review', 'comment', 'B??nh lu???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3169, 1, 'vi', 'plugins/ecommerce/review', 'require_login', 'H??y :login ????? ????nh gi?? s???n ph???m!', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3170, 1, 'vi', 'plugins/ecommerce/review', 'you_reviewed', 'B???n ???? ????nh gi?? s???n ph???m n??y r???i!', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3171, 1, 'vi', 'plugins/ecommerce/review', 'add_success', '????nh gi?? s???n ph???m th??nh c??ng!', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3172, 1, 'vi', 'plugins/ecommerce/review', 'delete_success', 'X??a ????nh g??a th??nh c??ng!', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3173, 1, 'vi', 'plugins/ecommerce/review', 'approve', 'Ch???p thu???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3174, 1, 'vi', 'plugins/ecommerce/review', 'approved', '???? ch???p thu???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3175, 1, 'vi', 'plugins/ecommerce/review', 'disapprove', 'Kh??ng ch???p thu???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3176, 1, 'vi', 'plugins/ecommerce/review', 'disapproved', '???? kh??ng ch???p thu???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3177, 1, 'vi', 'plugins/ecommerce/review', 'product', 'S???n ph???m', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3178, 1, 'vi', 'plugins/ecommerce/review', 'user', 'Ng?????i d??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3179, 1, 'vi', 'plugins/ecommerce/review', 'star', 'Sao', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3180, 1, 'vi', 'plugins/ecommerce/review', 'status', 'Tr???ng th??i', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3181, 1, 'vi', 'plugins/ecommerce/review', 'intro.title', 'Qu???n l?? danh s??ch nh???n x??t c???a kh??ch h??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3182, 1, 'vi', 'plugins/ecommerce/review', 'intro.description', 'L??u tr??? c??c nh???n x??t, ????nh gi?? c???a kh??ch h??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3183, 1, 'vi', 'plugins/ecommerce/shipping', 'name', 'Ph?? v???n chuy???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3184, 1, 'vi', 'plugins/ecommerce/shipping', 'shipping', 'V???n chuy???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3185, 1, 'vi', 'plugins/ecommerce/shipping', 'title', 'Title', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3186, 1, 'vi', 'plugins/ecommerce/shipping', 'country', 'Qu???c gia', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3187, 1, 'vi', 'plugins/ecommerce/shipping', 'state', 'State', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3188, 1, 'vi', 'plugins/ecommerce/shipping', 'city', 'City', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3189, 1, 'vi', 'plugins/ecommerce/shipping', 'amount', 'Amount', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3190, 1, 'vi', 'plugins/ecommerce/shipping', 'currency', 'Currency', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3191, 1, 'vi', 'plugins/ecommerce/shipping', 'enable', 'Enable', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3192, 1, 'vi', 'plugins/ecommerce/shipping', 'enabled', 'Enabled', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3193, 1, 'vi', 'plugins/ecommerce/shipping', 'disable', 'Disable', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3194, 1, 'vi', 'plugins/ecommerce/shipping', 'disabled', 'Disabled', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3195, 1, 'vi', 'plugins/ecommerce/shipping', 'create_shipping', 'Create a shipping', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3196, 1, 'vi', 'plugins/ecommerce/shipping', 'edit_shipping', 'Edit shipping #', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3197, 1, 'vi', 'plugins/ecommerce/shipping', 'status', 'Status', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3198, 1, 'vi', 'plugins/ecommerce/shipping', 'shipping_methods', 'Ph????ng th???c v???n chuy???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3199, 1, 'vi', 'plugins/ecommerce/shipping', 'create_shipping_method', 'T???o ph????ng th???c v???n chuy???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3200, 1, 'vi', 'plugins/ecommerce/shipping', 'edit_shipping_method', 'S???a ph????ng th???c v???n chuy???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3201, 1, 'vi', 'plugins/ecommerce/shipping', 'add_shipping_region', 'Th??m khu v???c v???n chuy???n', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3202, 1, 'vi', 'plugins/ecommerce/shipping', 'methods.default', 'Default', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3203, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.not_approved', 'Not approved', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3204, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.approved', 'Approved', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3205, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.picking', 'Picking', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3206, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.delay_picking', 'Delay picking', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3207, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.picked', 'Picked', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3208, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.not_picked', 'Not picked', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3209, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.delivering', 'Delivering', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3210, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.delivered', 'Delivered', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3211, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.not_delivered', 'Not delivered', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3212, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.audited', 'Audited', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3213, 1, 'vi', 'plugins/ecommerce/shipping', 'statuses.canceled', 'Canceled', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3214, 1, 'vi', 'plugins/ecommerce/shipping', 'cod_statuses.pending', 'Pending', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3215, 1, 'vi', 'plugins/ecommerce/shipping', 'cod_statuses.completed', 'Completed', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3216, 1, 'vi', 'plugins/ecommerce/store-locator', 'name', '?????a ch??? c???a h??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3217, 1, 'vi', 'plugins/ecommerce/store-locator', 'description', '?????a ch??? n??y s??? xu???t hi???n tr??n ho?? ????n c???a b???n v?? s??? ???????c s??? d???ng ????? t??nh to??n m???c gi?? v???n chuy???n c???a b???n.', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3218, 1, 'vi', 'plugins/ecommerce/store-locator', 'shop_name', 'T??n c???a h??ng', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3219, 1, 'vi', 'plugins/ecommerce/store-locator', 'phone', '??i???n tho???i', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3220, 1, 'vi', 'plugins/ecommerce/store-locator', 'address', '?????a ch???', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3221, 1, 'vi', 'plugins/ecommerce/tax', 'name', 'Thu???', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3222, 1, 'vi', 'plugins/ecommerce/tax', 'create', 'Create a tax', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3223, 1, 'vi', 'plugins/ecommerce/tax', 'edit', 'Edit tax :title', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3224, 1, 'vi', 'plugins/ecommerce/tax', 'title', 'Title', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3225, 1, 'vi', 'plugins/ecommerce/tax', 'percentage', 'Percentage %', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3226, 1, 'vi', 'plugins/ecommerce/tax', 'priority', 'Priority', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3227, 1, 'vi', 'plugins/ecommerce/tax', 'select_tax', '-- select --', '2021-03-14 18:40:47', '2021-03-14 18:40:47'),
(3228, 1, 'en', 'plugins/newsletter/newsletter', 'name', 'Newsletters', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3229, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.title', 'Newsletter', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3230, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.description', 'Config newsletter email templates', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3231, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.title', 'Email send to admin', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3232, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.description', 'Template for sending email to admin', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3233, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.title', 'Email send to user', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3234, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.description', 'Template for sending email to subscriber', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3235, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.subscribed', 'Subscribed', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3236, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.unsubscribed', 'Unsubscribed', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3237, 1, 'en', 'plugins/payment/payment', 'payments', 'Payments', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3238, 1, 'en', 'plugins/payment/payment', 'checkout_success', 'Checkout successfully!', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3239, 1, 'en', 'plugins/payment/payment', 'view_payment', 'View payment #', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3240, 1, 'en', 'plugins/payment/payment', 'charge_id', 'Charge ID', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3241, 1, 'en', 'plugins/payment/payment', 'amount', 'Amount', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3242, 1, 'en', 'plugins/payment/payment', 'currency', 'Currency', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3243, 1, 'en', 'plugins/payment/payment', 'user', 'User', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3244, 1, 'en', 'plugins/payment/payment', 'stripe', 'Stripe', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3245, 1, 'en', 'plugins/payment/payment', 'paypal', 'PayPal', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3246, 1, 'en', 'plugins/payment/payment', 'action', 'Action', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3247, 1, 'en', 'plugins/payment/payment', 'payment_via_card', 'Payment via card', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3248, 1, 'en', 'plugins/payment/payment', 'card_number', 'Card number', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3249, 1, 'en', 'plugins/payment/payment', 'full_name', 'Full name', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3250, 1, 'en', 'plugins/payment/payment', 'payment_via_paypal', 'Payment via PayPal', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3251, 1, 'en', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3252, 1, 'en', 'plugins/payment/payment', 'cvc', 'CVC', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3253, 1, 'en', 'plugins/payment/payment', 'details', 'Details', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3254, 1, 'en', 'plugins/payment/payment', 'payer_name', 'Payer Name', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3255, 1, 'en', 'plugins/payment/payment', 'email', 'Email', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3256, 1, 'en', 'plugins/payment/payment', 'phone', 'Phone', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3257, 1, 'en', 'plugins/payment/payment', 'country', 'Country', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3258, 1, 'en', 'plugins/payment/payment', 'shipping_address', 'Shipping Address', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3259, 1, 'en', 'plugins/payment/payment', 'payment_details', 'Payment Details', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3260, 1, 'en', 'plugins/payment/payment', 'card', 'Card', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3261, 1, 'en', 'plugins/payment/payment', 'address', 'Address', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3262, 1, 'en', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3263, 1, 'en', 'plugins/payment/payment', 'payment_id', 'Payment ID', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3264, 1, 'en', 'plugins/payment/payment', 'payment_methods', 'Payment methods', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3265, 1, 'en', 'plugins/payment/payment', 'transactions', 'Transactions', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3266, 1, 'en', 'plugins/payment/payment', 'payment_methods_description', 'Setup payment methods for website', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3267, 1, 'en', 'plugins/payment/payment', 'paypal_description', 'Customer can buy product and pay directly via PayPal', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3268, 1, 'en', 'plugins/payment/payment', 'use', 'Use', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3269, 1, 'en', 'plugins/payment/payment', 'stripe_description', 'Customer can buy product and pay directly using Visa, Credit card via Stripe', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3270, 1, 'en', 'plugins/payment/payment', 'edit', 'Edit', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3271, 1, 'en', 'plugins/payment/payment', 'settings', 'Settings', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3272, 1, 'en', 'plugins/payment/payment', 'activate', 'Activate', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3273, 1, 'en', 'plugins/payment/payment', 'deactivate', 'Deactivate', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3274, 1, 'en', 'plugins/payment/payment', 'update', 'Update', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3275, 1, 'en', 'plugins/payment/payment', 'configuration_instruction', 'Configuration instruction for :name', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3276, 1, 'en', 'plugins/payment/payment', 'configuration_requirement', 'To use :name, you need', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3277, 1, 'en', 'plugins/payment/payment', 'service_registration', 'Register with :name', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3278, 1, 'en', 'plugins/payment/payment', 'after_service_registration_msg', 'After registration at :name, you will have Client ID, Client Secret', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3279, 1, 'en', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Enter Client ID, Secret into the box in right hand', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3280, 1, 'en', 'plugins/payment/payment', 'method_name', 'Method name', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3281, 1, 'en', 'plugins/payment/payment', 'please_provide_information', 'Please provide information', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3282, 1, 'en', 'plugins/payment/payment', 'client_id', 'Client ID', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3283, 1, 'en', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3284, 1, 'en', 'plugins/payment/payment', 'secret', 'Secret', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3285, 1, 'en', 'plugins/payment/payment', 'stripe_key', 'Stripe Public Key', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3286, 1, 'en', 'plugins/payment/payment', 'stripe_secret', 'Stripe Private Key', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3287, 1, 'en', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3288, 1, 'en', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3289, 1, 'en', 'plugins/payment/payment', 'pay_online_via', 'Pay online via :name', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3290, 1, 'en', 'plugins/payment/payment', 'sandbox_mode', 'Sandbox mode', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3291, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method', 'Deactivate payment method', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3292, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Do you really want to deactivate this payment method?', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3293, 1, 'en', 'plugins/payment/payment', 'agree', 'Agree', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3294, 1, 'en', 'plugins/payment/payment', 'name', 'Payments', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3295, 1, 'en', 'plugins/payment/payment', 'create', 'New payment', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3296, 1, 'en', 'plugins/payment/payment', 'go_back', 'Go back', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3297, 1, 'en', 'plugins/payment/payment', 'information', 'Information', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3298, 1, 'en', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3299, 1, 'en', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3300, 1, 'en', 'plugins/payment/payment', 'methods.cod', 'Cash on delivery (COD)', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3301, 1, 'en', 'plugins/payment/payment', 'methods.bank_transfer', 'Bank transfer', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3302, 1, 'en', 'plugins/payment/payment', 'statuses.pending', 'Pending', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3303, 1, 'en', 'plugins/payment/payment', 'statuses.completed', 'Completed', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3304, 1, 'en', 'plugins/payment/payment', 'statuses.refunding', 'Refunding', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3305, 1, 'en', 'plugins/payment/payment', 'statuses.refunded', 'Refunded', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3306, 1, 'en', 'plugins/payment/payment', 'statuses.fraud', 'Fraud', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3307, 1, 'en', 'plugins/payment/payment', 'statuses.failed', 'Failed', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3308, 1, 'en', 'plugins/payment/payment', 'payment_methods_instruction', 'Guide customers to pay directly. You can choose to pay by delivery or bank transfer', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3309, 1, 'en', 'plugins/payment/payment', 'payment_method_description', 'Payment guide - (Displayed on the notice of successful purchase and payment page)', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3310, 1, 'en', 'plugins/payment/payment', 'payment_via_cod', 'Cash on delivery (COD)', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3311, 1, 'en', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Bank transfer', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3312, 1, 'en', 'plugins/payment/payment', 'payment_pending', 'Checkout successfully. Your payment is pending and will be checked by our staff.', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3313, 1, 'en', 'plugins/payment/payment', 'created_at', 'Created At', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3314, 1, 'en', 'plugins/payment/payment', 'payment_channel', 'Payment Channel', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3315, 1, 'en', 'plugins/payment/payment', 'total', 'Total', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3316, 1, 'en', 'plugins/payment/payment', 'status', 'Status', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3317, 1, 'en', 'plugins/payment/payment', 'default_payment_method', 'Default payment method', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3318, 1, 'en', 'plugins/payment/payment', 'turn_off_success', 'Turn off payment method successfully!', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3319, 1, 'en', 'plugins/payment/payment', 'saved_payment_method_success', 'Saved payment method successfully!', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3320, 1, 'en', 'plugins/payment/payment', 'saved_payment_settings_success', 'Saved payment settings successfully!', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3321, 1, 'en', 'plugins/payment/payment', 'payment_name', 'Name', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3322, 1, 'en', 'plugins/payment/payment', 'callback_url', 'Callback URL', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3323, 1, 'en', 'plugins/payment/payment', 'return_url', 'Return URL', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3324, 1, 'en', 'plugins/payment/payment', 'payment_not_found', 'Payment not found!', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3325, 1, 'vi', 'plugins/payment/payment', 'payments', 'Thanh to??n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3326, 1, 'vi', 'plugins/payment/payment', 'checkout_success', 'Thanh to??n th??nh c??ng!', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3327, 1, 'vi', 'plugins/payment/payment', 'view_payment', 'Xem thanh to??n #', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3328, 1, 'vi', 'plugins/payment/payment', 'charge_id', 'M?? thanh to??n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3329, 1, 'vi', 'plugins/payment/payment', 'amount', 'S??? ti???n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3330, 1, 'vi', 'plugins/payment/payment', 'currency', 'Lo???i ti???n t???', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3331, 1, 'vi', 'plugins/payment/payment', 'user', 'Ng?????i d??ng', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3332, 1, 'vi', 'plugins/payment/payment', 'stripe', 'Stripe', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3333, 1, 'vi', 'plugins/payment/payment', 'paypal', 'PayPal', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3334, 1, 'vi', 'plugins/payment/payment', 'action', 'H??nh ?????ng', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3335, 1, 'vi', 'plugins/payment/payment', 'payment_via_card', 'Thanh to??n qua th???', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3336, 1, 'vi', 'plugins/payment/payment', 'card_number', 'S??? th???', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3337, 1, 'vi', 'plugins/payment/payment', 'full_name', 'H??? t??n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3338, 1, 'vi', 'plugins/payment/payment', 'payment_via_paypal', 'Thanh to??n qua PayPal', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3339, 1, 'vi', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3340, 1, 'vi', 'plugins/payment/payment', 'cvc', 'CVC', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3341, 1, 'vi', 'plugins/payment/payment', 'details', 'Chi ti???t', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3342, 1, 'vi', 'plugins/payment/payment', 'payer_name', 'T??n ng?????i mua', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3343, 1, 'vi', 'plugins/payment/payment', 'email', 'Email', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3344, 1, 'vi', 'plugins/payment/payment', 'phone', '??i???n tho???i', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3345, 1, 'vi', 'plugins/payment/payment', 'country', 'Qu???c gia', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3346, 1, 'vi', 'plugins/payment/payment', 'shipping_address', '?????a ch??? giao h??ng', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3347, 1, 'vi', 'plugins/payment/payment', 'payment_details', 'Chi ti???t thanh to??n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3348, 1, 'vi', 'plugins/payment/payment', 'card', 'Th???', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3349, 1, 'vi', 'plugins/payment/payment', 'address', '?????a ch???', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3350, 1, 'vi', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Kh??ng th??? l???y m?? Stripe ????? thanh to??n.', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3351, 1, 'vi', 'plugins/payment/payment', 'payment_id', 'M?? thanh to??n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3352, 1, 'vi', 'plugins/payment/payment', 'payment_methods', 'Ph????ng th???c thanh to??n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3353, 1, 'vi', 'plugins/payment/payment', 'transactions', 'L???ch s??? giao d???ch', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3354, 1, 'vi', 'plugins/payment/payment', 'payment_methods_description', 'C??i ?????t c??c ph????ng th???c thanh to??n cho website', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3355, 1, 'vi', 'plugins/payment/payment', 'paypal_description', 'Kh??ch h??ng c?? th??? mua h??ng v?? thanh to??n tr???c ti???p th??ng qua c???ng thanh to??n PayPal', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3356, 1, 'vi', 'plugins/payment/payment', 'use', 'D??ng', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3357, 1, 'vi', 'plugins/payment/payment', 'stripe_description', 'Kh??ch h??ng c?? th??? mua h??ng v?? thanh to??n b???ng Visa, Credit card th??ng qua c???ng thanh to??n Stripe', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3358, 1, 'vi', 'plugins/payment/payment', 'edit', 'Ch???nh s???a', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3359, 1, 'vi', 'plugins/payment/payment', 'settings', 'C??i ?????t', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3360, 1, 'vi', 'plugins/payment/payment', 'activate', 'K??ch ho???t', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3361, 1, 'vi', 'plugins/payment/payment', 'deactivate', 'Hu??? k??ch ho???t', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3362, 1, 'vi', 'plugins/payment/payment', 'update', 'C???p nh???t', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3363, 1, 'vi', 'plugins/payment/payment', 'configuration_instruction', 'H?????ng d???n c???u h??nh :name', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3364, 1, 'vi', 'plugins/payment/payment', 'configuration_requirement', '????? s??? d???ng :name b???n c???n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3365, 1, 'vi', 'plugins/payment/payment', 'service_registration', '????ng k?? d???ch v??? v???i :name', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3366, 1, 'vi', 'plugins/payment/payment', 'after_service_registration_msg', 'Sau khi ho??n t???t c??c b?????c ????ng k?? t???i :name, b???n s??? c?? c??c th??ng s??? Client ID, Client Secret', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3367, 1, 'vi', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Nh???p c??c th??ng s??? Client ID, Secret v??o ?? b??n ph???i', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3368, 1, 'vi', 'plugins/payment/payment', 'method_name', 'T??n ph????ng th???c', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3369, 1, 'vi', 'plugins/payment/payment', 'please_provide_information', 'Xin vui l??ng cung c???p th??ng tin', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3370, 1, 'vi', 'plugins/payment/payment', 'client_id', 'Client ID', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3371, 1, 'vi', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3372, 1, 'vi', 'plugins/payment/payment', 'stripe_key', 'Stripe Key', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3373, 1, 'vi', 'plugins/payment/payment', 'stripe_secret', 'Stripe Secret', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3374, 1, 'vi', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3375, 1, 'vi', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3376, 1, 'vi', 'plugins/payment/payment', 'secret', 'Secret', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3377, 1, 'vi', 'plugins/payment/payment', 'pay_online_via', 'Thanh to??n online qua :name', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3378, 1, 'vi', 'plugins/payment/payment', 'sandbox_mode', 'Ch??? ????? th??? nghi???m', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3379, 1, 'vi', 'plugins/payment/payment', 'deactivate_payment_method', 'Hu??? k??ch ho???t ph????ng th???c', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3380, 1, 'vi', 'plugins/payment/payment', 'deactivate_payment_method_description', 'B???n c?? ch???c ch???n mu???n hu??? ph????ng th???c th??nh to??n n??y?', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3381, 1, 'vi', 'plugins/payment/payment', 'agree', '?????ng ??', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3382, 1, 'vi', 'plugins/payment/payment', 'name', 'Thanh to??n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3383, 1, 'vi', 'plugins/payment/payment', 'create', 'Th??m thanh to??n m???i', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3384, 1, 'vi', 'plugins/payment/payment', 'go_back', 'Tr??? l???i', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3385, 1, 'vi', 'plugins/payment/payment', 'information', 'Th??ng tin', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3386, 1, 'vi', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3387, 1, 'vi', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3388, 1, 'vi', 'plugins/payment/payment', 'methods.cod', 'Thanh to??n khi giao h??ng (COD)', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3389, 1, 'vi', 'plugins/payment/payment', 'methods.bank_transfer', 'Chuy???n kho???n qua ng??n h??ng', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3390, 1, 'vi', 'plugins/payment/payment', 'statuses.pending', 'Ch??a ho??n t???t', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3391, 1, 'vi', 'plugins/payment/payment', 'statuses.completed', '???? ho??n th??nh', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3392, 1, 'vi', 'plugins/payment/payment', 'statuses.refunding', '??ang ho??n ti???n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3393, 1, 'vi', 'plugins/payment/payment', 'statuses.refunded', '???? ho??n ti???n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3394, 1, 'vi', 'plugins/payment/payment', 'statuses.fraud', 'Gian l???n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3395, 1, 'vi', 'plugins/payment/payment', 'statuses.failed', 'Th???t b???i', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3396, 1, 'vi', 'plugins/payment/payment', 'payment_methods_instruction', 'H?????ng d???n kh??ch h??ng thanh to??n tr???c ti???p. C?? th??? ch???n thanh to??n khi giao h??ng ho???c chuy???n kho???n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3397, 1, 'vi', 'plugins/payment/payment', 'payment_method_description', 'H?????ng d???n thanh to??n ??? (Hi???n th??? ??? trang th??ng b??o mua h??ng th??nh c??ng v?? trang thanh to??n)', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3398, 1, 'vi', 'plugins/payment/payment', 'payment_via_cod', 'Thanh to??n khi nh???n h??ng (COD)', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3399, 1, 'vi', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Chuy???n kho???n qua ng??n h??ng', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3400, 1, 'vi', 'plugins/payment/payment', 'payment_pending', 'Th???c hi???n th??nh c??ng. Thanh to??n c???a b???n ??ang ???????c x??? l?? v?? s??? ???????c x??c nh???n b???i nh??n vi??n.', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3401, 1, 'vi', 'plugins/payment/payment', 'created_at', 'Ng??y t???o', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3402, 1, 'vi', 'plugins/payment/payment', 'payment_channel', 'Ph????ng th???c thanh to??n', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3403, 1, 'vi', 'plugins/payment/payment', 'total', 'T???ng c???ng', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3404, 1, 'vi', 'plugins/payment/payment', 'status', 'Tr???ng th??i', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3405, 1, 'vi', 'plugins/payment/payment', 'default_payment_method', 'Ph????ng th???c thanh to??n m???c ?????nh', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3406, 1, 'en', 'plugins/simple-slider/simple-slider', 'create', 'New slider', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3407, 1, 'en', 'plugins/simple-slider/simple-slider', 'edit', 'Edit slider', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3408, 1, 'en', 'plugins/simple-slider/simple-slider', 'menu', 'Simple sliders', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3409, 1, 'en', 'plugins/simple-slider/simple-slider', 'settings.title', 'Simple sliders', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3410, 1, 'en', 'plugins/simple-slider/simple-slider', 'settings.description', 'Settings for Simple sliders', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3411, 1, 'en', 'plugins/simple-slider/simple-slider', 'settings.using_assets', 'Using default assets?', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3412, 1, 'en', 'plugins/simple-slider/simple-slider', 'settings.using_assets_description', 'If using assets option is enabled then below scripts will be auto added to front site.', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3413, 1, 'en', 'plugins/simple-slider/simple-slider', 'add_new', 'Add new', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3414, 1, 'en', 'plugins/simple-slider/simple-slider', 'save_sorting', 'Save sorting', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3415, 1, 'en', 'plugins/simple-slider/simple-slider', 'key', 'Key', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3416, 1, 'en', 'plugins/simple-slider/simple-slider', 'slide_items', 'Slide Items', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3417, 1, 'en', 'plugins/simple-slider/simple-slider', 'update_slide_position_success', 'Updated slide position successfully!', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3418, 1, 'en', 'plugins/simple-slider/simple-slider', 'create_new_slide', 'Create a new slide', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3419, 1, 'en', 'plugins/simple-slider/simple-slider', 'edit_slide', 'Edit slide #:id', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3420, 1, 'en', 'plugins/simple-slider/simple-slider', 'simple_slider_shortcode_name', 'Simple Slider', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3421, 1, 'en', 'plugins/simple-slider/simple-slider', 'simple_slider_shortcode_description', 'Add a simple slider', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3422, 1, 'en', 'plugins/simple-slider/simple-slider', 'select_slider', 'Select a slider', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3423, 1, 'en', 'plugins/social-login/social-login', 'settings.title', 'Social Login settings', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3424, 1, 'en', 'plugins/social-login/social-login', 'settings.description', 'Configure social login options', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3425, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.title', 'Facebook login settings', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3426, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.description', 'Enable/disable & configure app credentials for Facebook login', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3427, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_id', 'App ID', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3428, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_secret', 'App Secret', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3429, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.helper', 'Please go to https://developers.facebook.com to create new app update App ID, App Secret. Callback URL is :callback', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3430, 1, 'en', 'plugins/social-login/social-login', 'settings.google.title', 'Google login settings', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3431, 1, 'en', 'plugins/social-login/social-login', 'settings.google.description', 'Enable/disable & configure app credentials for Google login', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3432, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_id', 'App ID', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3433, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_secret', 'App Secret', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3434, 1, 'en', 'plugins/social-login/social-login', 'settings.google.helper', 'Please go to https://console.developers.google.com/apis/dashboard to create new app update App ID, App Secret. Callback URL is :callback', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3435, 1, 'en', 'plugins/social-login/social-login', 'settings.github.title', 'Github login settings', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3436, 1, 'en', 'plugins/social-login/social-login', 'settings.github.description', 'Enable/disable & configure app credentials for Github login', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3437, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_id', 'App ID', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3438, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_secret', 'App Secret', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3439, 1, 'en', 'plugins/social-login/social-login', 'settings.github.helper', 'Please go to https://github.com/settings/developers to create new app update App ID, App Secret. Callback URL is :callback', '2021-03-14 18:40:48', '2021-03-14 18:40:48'),
(3440, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.title', 'Linkedin login settings', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3441, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.description', 'Enable/disable & configure app credentials for Linkedin login', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3442, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_id', 'App ID', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3443, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_secret', 'App Secret', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3444, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.helper', 'Please go to https://www.linkedin.com/developers/apps/new to create new app update App ID, App Secret. Callback URL is :callback', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3445, 1, 'en', 'plugins/social-login/social-login', 'settings.enable', 'Enable?', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3446, 1, 'en', 'plugins/social-login/social-login', 'menu', 'Social Login', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3447, 1, 'en', 'plugins/testimonials/forms', 'name', 'Customer name', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3448, 1, 'en', 'plugins/testimonials/forms', 'company', 'Company/Working place', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3449, 1, 'en', 'plugins/testimonials/forms', 'avatar', 'Avatar', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3450, 1, 'en', 'plugins/testimonials/forms', 'title', 'Title', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3451, 1, 'en', 'plugins/testimonials/forms', 'content', 'Content', '2021-03-14 18:40:49', '2021-03-14 18:40:49');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(3452, 1, 'en', 'plugins/testimonials/forms', 'publish', 'Publish', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3453, 1, 'en', 'plugins/testimonials/forms', 'unpublish', 'Unpublish', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3454, 1, 'en', 'plugins/testimonials/testimonials', 'name', 'Testimonials', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3455, 1, 'en', 'plugins/testimonials/testimonials', 'create', 'New testimonials', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3456, 1, 'en', 'plugins/testimonials/testimonials', 'edit', 'Edit testimonials', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3457, 1, 'vi', 'plugins/testimonials/forms', 'name', 'T??n kh??ch h??ng', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3458, 1, 'vi', 'plugins/testimonials/forms', 'company', 'C??ng ty/N??i l??m vi???c', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3459, 1, 'vi', 'plugins/testimonials/forms', 'avatar', 'Avatar', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3460, 1, 'vi', 'plugins/testimonials/forms', 'title', 'Ti??u ?????', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3461, 1, 'vi', 'plugins/testimonials/forms', 'content', 'N???i dung', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3462, 1, 'vi', 'plugins/testimonials/forms', 'publish', 'Xu???t b???n', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3463, 1, 'vi', 'plugins/testimonials/forms', 'unpublish', 'Kh??ng xu???t b???n', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3464, 1, 'vi', 'plugins/testimonials/testimonials', 'name', 'Nh???n x??t kh??ch h??ng', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3465, 1, 'vi', 'plugins/testimonials/testimonials', 'create', 'T???o m???i', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3466, 1, 'vi', 'plugins/testimonials/testimonials', 'edit', 'S???a nh???n x??t', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3467, 1, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3468, 1, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3469, 1, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to the resources/lang file, using \'php artisan cms:translations:export\' command or publish button.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3470, 1, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3471, 1, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3472, 1, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3473, 1, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3474, 1, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3475, 1, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3476, 1, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3477, 1, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3478, 1, 'en', 'plugins/translation/translation', 'back', 'Back', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3479, 1, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3480, 1, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3481, 1, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3482, 1, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3483, 1, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3484, 1, 'en', 'plugins/translation/translation', 'admin-translations', 'Admin translations', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3485, 1, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3486, 1, 'en', 'plugins/translation/translation', 'to', 'to', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3487, 1, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3488, 1, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3489, 1, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3490, 1, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3491, 1, 'en', 'plugins/translation/translation', 'name', 'Name', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3492, 1, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3493, 1, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3494, 1, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3495, 1, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3496, 1, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3497, 1, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3498, 1, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in /resources/lang!', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3499, 1, 'vi', 'auth', 'failed', 'Kh??ng t??m th???y th??ng tin ????ng nh???p h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3500, 1, 'vi', 'auth', 'throttle', '????ng nh???p kh??ng ????ng qu?? nhi???u l???n. Vui l??ng th??? l???i sau :seconds gi??y.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3501, 1, 'vi', 'auth', 'password', 'M???t kh???u kh??ng ch??nh x??c', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3502, 1, 'vi', 'pagination', 'previous', '&laquo; Tr?????c', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3503, 1, 'vi', 'pagination', 'next', 'Sau &raquo;', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3504, 1, 'vi', 'passwords', 'reset', 'M???t kh???u ???? ???????c c???p nh???t!', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3505, 1, 'vi', 'passwords', 'sent', 'Ch??ng t??i ???? g???i cho b???n ???????ng d???n thay ?????i m???t kh???u!', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3506, 1, 'vi', 'passwords', 'token', 'M?? x??c nh???n m???t kh???u kh??ng h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3507, 1, 'vi', 'passwords', 'user', 'Kh??ng t??m th???y th??nh vi??n v???i ?????a ch??? email n??y.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3508, 1, 'vi', 'validation', 'accepted', 'Tr?????ng :attribute ph???i ???????c ch???p nh???n.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3509, 1, 'vi', 'validation', 'active_url', 'Tr?????ng :attribute kh??ng ph???i l?? m???t URL h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3510, 1, 'vi', 'validation', 'after', 'Tr?????ng :attribute ph???i l?? m???t ng??y sau ng??y :date.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3511, 1, 'vi', 'validation', 'after_or_equal', 'Tr?????ng :attribute ph???i l?? m???t ng??y sau ho???c b???ng ng??y :date.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3512, 1, 'vi', 'validation', 'alpha', 'Tr?????ng :attribute ch??? c?? th??? ch???a c??c ch??? c??i.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3513, 1, 'vi', 'validation', 'alpha_dash', 'Tr?????ng :attribute ch??? c?? th??? ch???a ch??? c??i, s??? v?? d???u g???ch ngang.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3514, 1, 'vi', 'validation', 'alpha_num', 'Tr?????ng :attribute ch??? c?? th??? ch???a ch??? c??i v?? s???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3515, 1, 'vi', 'validation', 'array', 'Ki???u d??? li???u c???a tr?????ng :attribute ph???i l?? d???ng m???ng.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3516, 1, 'vi', 'validation', 'before', 'Tr?????ng :attribute ph???i l?? m???t ng??y tr?????c ng??y :date.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3517, 1, 'vi', 'validation', 'before_or_equal', 'Tr?????ng :attribute ph???i l?? m???t ng??y tr?????c ho???c b???ng ng??y :date.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3518, 1, 'vi', 'validation', 'between.numeric', 'Tr?????ng :attribute ph???i n???m trong kho???ng :min - :max.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3519, 1, 'vi', 'validation', 'between.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i t??? :min - :max kB.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3520, 1, 'vi', 'validation', 'between.string', 'Tr?????ng :attribute ph???i t??? :min - :max k?? t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3521, 1, 'vi', 'validation', 'between.array', 'Tr?????ng :attribute ph???i c?? t??? :min - :max ph???n t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3522, 1, 'vi', 'validation', 'boolean', 'Tr?????ng :attribute ph???i l?? true ho???c false.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3523, 1, 'vi', 'validation', 'confirmed', 'Gi?? tr??? x??c nh???n trong tr?????ng :attribute kh??ng kh???p.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3524, 1, 'vi', 'validation', 'date', 'Tr?????ng :attribute kh??ng ph???i l?? ?????nh d???ng c???a ng??y-th??ng.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3525, 1, 'vi', 'validation', 'date_equals', 'Tr?????ng :attribute ph???i l?? m???t ng??y b???ng v???i :date.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3526, 1, 'vi', 'validation', 'date_format', 'Tr?????ng :attribute kh??ng gi???ng v???i ?????nh d???ng :format.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3527, 1, 'vi', 'validation', 'different', 'Tr?????ng :attribute v?? :other ph???i kh??c nhau.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3528, 1, 'vi', 'validation', 'digits', '????? d??i c???a tr?????ng :attribute ph???i g???m :digits ch??? s???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3529, 1, 'vi', 'validation', 'digits_between', '????? d??i c???a tr?????ng :attribute ph???i n???m trong kho???ng :min and :max ch??? s???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3530, 1, 'vi', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3531, 1, 'vi', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3532, 1, 'vi', 'validation', 'email', 'Tr?????ng :attribute ph???i l?? m???t ?????a ch??? email h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3533, 1, 'vi', 'validation', 'ends_with', 'Tr?????ng :attribute ph???i k???t th??c b???ng m???t trong nh???ng gi?? tr??? sau: :values', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3534, 1, 'vi', 'validation', 'exists', 'Gi?? tr??? ???? ch???n trong tr?????ng :attribute kh??ng h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3535, 1, 'vi', 'validation', 'file', 'Tr?????ng :attribute ph???i l?? m???t t???p tin.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3536, 1, 'vi', 'validation', 'filled', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3537, 1, 'vi', 'validation', 'gt.numeric', 'Tr?????ng :attribute ph???i l???n h??n :max.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3538, 1, 'vi', 'validation', 'gt.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i l???n h??n :max KB.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3539, 1, 'vi', 'validation', 'gt.string', 'Tr?????ng :attribute ph???i l???n h??n :max k?? t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3540, 1, 'vi', 'validation', 'gt.array', 'Tr?????ng :attribute ph???i l???n h??n :max ph???n t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3541, 1, 'vi', 'validation', 'gte.numeric', 'Tr?????ng :attribute ph???i l???n h??n ho???c b???ng :max.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3542, 1, 'vi', 'validation', 'gte.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i l???n h??n ho???c b???ng :max KB.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3543, 1, 'vi', 'validation', 'gte.string', 'Tr?????ng :attribute ph???i l???n h??n ho???c b???ng :max k?? t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3544, 1, 'vi', 'validation', 'gte.array', 'Tr?????ng :attribute ph???i l???n h??n ho???c b???ng :max ph???n t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3545, 1, 'vi', 'validation', 'image', 'C??c t???p tin trong tr?????ng :attribute ph???i l?? ?????nh d???ng h??nh ???nh.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3546, 1, 'vi', 'validation', 'in', 'Gi?? tr??? ???? ch???n trong tr?????ng :attribute kh??ng h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3547, 1, 'vi', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3548, 1, 'vi', 'validation', 'integer', 'Tr?????ng :attribute ph???i l?? m???t s??? nguy??n.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3549, 1, 'vi', 'validation', 'ip', 'Tr?????ng :attribute ph???i l?? m???t ?????a ch???a IP.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3550, 1, 'vi', 'validation', 'ipv4', 'Tr?????ng :attribute ph???i l?? ?????a ch??? IPv4 h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3551, 1, 'vi', 'validation', 'ipv6', 'Tr?????ng :attribute ph???i l?? ?????a ch??? IPv6 h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3552, 1, 'vi', 'validation', 'json', 'Tr?????ng :attribute ph???i l?? chu???i JSON h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3553, 1, 'vi', 'validation', 'lt.numeric', 'Tr?????ng :attribute ph???i nh??? h??n l?? :min.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3554, 1, 'vi', 'validation', 'lt.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i nh??? h??n :min KB.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3555, 1, 'vi', 'validation', 'lt.string', 'Tr?????ng :attribute ph???i c?? nh??? h??n :min k?? t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3556, 1, 'vi', 'validation', 'lt.array', 'Tr?????ng :attribute ph???i c?? nh??? h??n :min ph???n t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3557, 1, 'vi', 'validation', 'lte.numeric', 'Tr?????ng :attribute ph???i nh??? h??n ho???c b???ng l?? :min.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3558, 1, 'vi', 'validation', 'lte.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i nh??? h??n ho???c b???ng :min KB.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3559, 1, 'vi', 'validation', 'lte.string', 'Tr?????ng :attribute ph???i c?? nh??? h??n ho???c b???ng :min k?? t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3560, 1, 'vi', 'validation', 'lte.array', 'Tr?????ng :attribute ph???i c?? nh??? h??n ho???c b???ng :min ph???n t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3561, 1, 'vi', 'validation', 'max.numeric', 'Tr?????ng :attribute kh??ng ???????c l???n h??n :max.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3562, 1, 'vi', 'validation', 'max.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute kh??ng ???????c l???n h??n :max KB.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3563, 1, 'vi', 'validation', 'max.string', 'Tr?????ng :attribute kh??ng ???????c l???n h??n :max k?? t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3564, 1, 'vi', 'validation', 'max.array', 'Tr?????ng :attribute kh??ng ???????c l???n h??n :max ph???n t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3565, 1, 'vi', 'validation', 'mimes', 'Tr?????ng :attribute ph???i l?? m???t t???p tin c?? ?????nh d???ng: :values.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3566, 1, 'vi', 'validation', 'mimetypes', 'Tr?????ng :attribute ph???i l?? m???t t???p c?? ?????nh d???ng l??: :values.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3567, 1, 'vi', 'validation', 'min.numeric', 'Tr?????ng :attribute ph???i t???i thi???u l?? :min.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3568, 1, 'vi', 'validation', 'min.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i t???i thi???u :min KB.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3569, 1, 'vi', 'validation', 'min.string', 'Tr?????ng :attribute ph???i c?? t???i thi???u :min k?? t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3570, 1, 'vi', 'validation', 'min.array', 'Tr?????ng :attribute ph???i c?? t???i thi???u :min ph???n t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3571, 1, 'vi', 'validation', 'not_in', 'Gi?? tr??? ???? ch???n trong tr?????ng :attribute kh??ng h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3572, 1, 'vi', 'validation', 'not_regex', 'Tr?????ng :attribute ?????nh d???ng kh??ng h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3573, 1, 'vi', 'validation', 'numeric', 'Tr?????ng :attribute ph???i l?? m???t s???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3574, 1, 'vi', 'validation', 'password', 'M???t kh???u kh??ng ????ng.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3575, 1, 'vi', 'validation', 'present', 'The :attribute field must be present.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3576, 1, 'vi', 'validation', 'regex', '?????nh d???ng tr?????ng :attribute kh??ng h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3577, 1, 'vi', 'validation', 'required', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3578, 1, 'vi', 'validation', 'required_if', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi tr?????ng :other l?? :value.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3579, 1, 'vi', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3580, 1, 'vi', 'validation', 'required_with', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi tr?????ng :values c?? gi?? tr???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3581, 1, 'vi', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3582, 1, 'vi', 'validation', 'required_without', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi tr?????ng :values kh??ng c?? gi?? tr???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3583, 1, 'vi', 'validation', 'required_without_all', 'Tr?????ng :attribute kh??ng ???????c b??? tr???ng khi t???t c??? :values kh??ng c?? gi?? tr???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3584, 1, 'vi', 'validation', 'same', 'Tr?????ng :attribute v?? :other ph???i gi???ng nhau.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3585, 1, 'vi', 'validation', 'size.numeric', 'Tr?????ng :attribute ph???i b???ng :size.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3586, 1, 'vi', 'validation', 'size.file', 'Dung l?????ng t???p tin trong tr?????ng :attribute ph???i b???ng :size kB.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3587, 1, 'vi', 'validation', 'size.string', 'Tr?????ng :attribute ph???i ch???a :size k?? t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3588, 1, 'vi', 'validation', 'size.array', 'Tr?????ng :attribute ph???i ch???a :size ph???n t???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3589, 1, 'vi', 'validation', 'starts_with', 'Tr?????ng :attribute ph???i ???????c b???t ?????u b???ng m???t trong nh???ng gi?? tr??? sau: :values', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3590, 1, 'vi', 'validation', 'string', 'Tr?????ng :attribute ph???i l?? m???t chu???i.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3591, 1, 'vi', 'validation', 'timezone', 'Tr?????ng :attribute ph???i l?? m???t m??i gi??? h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3592, 1, 'vi', 'validation', 'unique', 'Tr?????ng :attribute ???? c?? trong h??? th???ng.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3593, 1, 'vi', 'validation', 'uploaded', 'Tr?????ng :attribute kh??ng th??? t???i l??n.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3594, 1, 'vi', 'validation', 'url', 'Tr?????ng :attribute kh??ng gi???ng v???i ?????nh d???ng m???t URL.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3595, 1, 'vi', 'validation', 'uuid', 'Tr?????ng :attribute kh??ng ph???i l?? m???t chu???i UUID h???p l???.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3596, 1, 'vi', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3597, 1, 'vi', 'validation', 'attributes.name', 't??n', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3598, 1, 'vi', 'validation', 'attributes.username', 't??n ????ng nh???p', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3599, 1, 'vi', 'validation', 'attributes.email', 'email', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3600, 1, 'vi', 'validation', 'attributes.first_name', 't??n', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3601, 1, 'vi', 'validation', 'attributes.last_name', 'h???', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3602, 1, 'vi', 'validation', 'attributes.password', 'm???t kh???u', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3603, 1, 'vi', 'validation', 'attributes.password_confirmation', 'x??c nh???n m???t kh???u', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3604, 1, 'vi', 'validation', 'attributes.city', 'th??nh ph???', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3605, 1, 'vi', 'validation', 'attributes.country', 'qu???c gia', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3606, 1, 'vi', 'validation', 'attributes.address', '?????a ch???', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3607, 1, 'vi', 'validation', 'attributes.phone', 's??? ??i???n tho???i', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3608, 1, 'vi', 'validation', 'attributes.mobile', 'di ?????ng', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3609, 1, 'vi', 'validation', 'attributes.age', 'tu???i', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3610, 1, 'vi', 'validation', 'attributes.sex', 'gi???i t??nh', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3611, 1, 'vi', 'validation', 'attributes.gender', 'gi???i t??nh', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3612, 1, 'vi', 'validation', 'attributes.year', 'n??m', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3613, 1, 'vi', 'validation', 'attributes.month', 'th??ng', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3614, 1, 'vi', 'validation', 'attributes.day', 'ng??y', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3615, 1, 'vi', 'validation', 'attributes.hour', 'gi???', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3616, 1, 'vi', 'validation', 'attributes.minute', 'ph??t', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3617, 1, 'vi', 'validation', 'attributes.second', 'gi??y', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3618, 1, 'vi', 'validation', 'attributes.title', 'ti??u ?????', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3619, 1, 'vi', 'validation', 'attributes.content', 'n???i dung', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3620, 1, 'vi', 'validation', 'attributes.body', 'n???i dung', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3621, 1, 'vi', 'validation', 'attributes.description', 'm?? t???', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3622, 1, 'vi', 'validation', 'attributes.excerpt', 'tr??ch d???n', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3623, 1, 'vi', 'validation', 'attributes.date', 'ng??y', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3624, 1, 'vi', 'validation', 'attributes.time', 'th???i gian', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3625, 1, 'vi', 'validation', 'attributes.subject', 'ti??u ?????', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3626, 1, 'vi', 'validation', 'attributes.message', 'l???i nh???n', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3627, 1, 'vi', 'validation', 'attributes.available', 'c?? s???n', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3628, 1, 'vi', 'validation', 'attributes.size', 'k??ch th?????c', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3629, 1, 'vi', '_json', 'Home', 'Trang ch???', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3630, 1, 'vi', '_json', 'Page could not be found', 'Kh??ng t??m th???y trang y??u c???u', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3631, 1, 'vi', '_json', 'This may have occurred because of several reasons', '??i???u n??y c?? th??? x???y ra v?? m???t v??i l?? do', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3632, 1, 'vi', '_json', 'The page you requested does not exist.', 'Trang b???n y??u c???u kh??ng t???n t???i', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3633, 1, 'vi', '_json', 'The link you clicked is no longer.', 'Li??n k???t m?? b???n nh???n v??o kh??ng c??n ???????c s??? d???ng n???a', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3634, 1, 'vi', '_json', 'The page may have moved to a new location.', 'Trang n??y ???? ???????c thay ?????i sang ???????ng d???n kh??c', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3635, 1, 'vi', '_json', 'An error may have occurred.', '???? c?? l???i h??? th???ng x???y ra', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3636, 1, 'vi', '_json', 'You are not authorized to view the requested resource.', 'B???n kh??ng c?? quy???n truy c???p t???i t??i nguy??n n??y', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3637, 1, 'vi', '_json', 'Page could not be loaded', 'Kh??ng th??? t???i trang', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3638, 1, 'vi', '_json', 'Service Unavailable', 'Service Unavailable', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3639, 1, 'vi', '_json', 'Sorry, we are doing some maintenance. Please check back soon.', 'Xin l???i, ch??ng t??i ??ang th???c hi???n b???o tr??. Vui l??ng quay l???i sau.', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3640, 1, 'vi', '_json', 'Oh no', 'Oh no', '2021-03-14 18:40:49', '2021-03-14 18:40:49'),
(3641, 1, 'vi', '_json', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\":link\">clicking here</a>.', 'H??y th??? l???i sau v??i ph??t, ho???c tr??? v??? trang ch??? b???ng c??ch nh???n <a href=\":link\">v??o ????y</a>.', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3642, 1, 'vi', '_json', 'Subject', 'Ti??u ?????', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3643, 1, 'vi', '_json', 'Message', 'N???i dung', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3644, 1, 'vi', '_json', 'The field with (<span style=\"color:#FF0000;\">*</span>) is required.', 'C??c m???c c?? (<span style=\"color:#FF0000;\">*</span>) l?? b???t bu???c.', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3645, 1, 'vi', '_json', 'Send', 'G???i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3646, 1, 'vi', '_json', 'Send message successfully!', 'G???i li??n h??? th??nh c??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3647, 1, 'vi', '_json', 'Can\'t send message on this time, please try again later!', 'Kh??ng th??? g???i li??n h??? l??c n??y, vui l??ng th??? l???i sau!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3648, 1, 'vi', '_json', 'This product is out of stock or not exists!', 'S???n ph???m ???? h???t h??ng ho???c kh??ng t???n t???i!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3649, 1, 'vi', '_json', 'Product :product is out of stock!', 'S???n ph???m :product ???? h???t h??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3650, 1, 'vi', '_json', 'Maximum quantity is', 'S??? l?????ng t???i ??a l??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3651, 1, 'vi', '_json', 'Please choose attributes to buy this product', 'Vui l??ng ch???n thu???c t??nh tr?????c khi th??m s???n ph???m v??o gi??? h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3652, 1, 'vi', '_json', 'Added product :product to cart successfully!', '???? th??m th??nh c??ng s???n ph???m :product v??o gi??? h??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3653, 1, 'vi', '_json', 'One or all products are not enough quantity so cannot update!', 'M???t ho???c t???t c??? s???n ph???m kh??ng ????? s??? l?????ng n??n kh??ng th??? c???p nh???t!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3654, 1, 'vi', '_json', 'Update cart successfully!', 'C???p nh???t gi??? h??ng th??nh c??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3655, 1, 'vi', '_json', 'Cart item is not existed!', 'S???n ph???m kh??ng t???n t???i!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3656, 1, 'vi', '_json', 'Removed item from cart successfully!', 'X??a s???n ph???m kh???i gi??? h??ng th??nh c??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3657, 1, 'vi', '_json', 'Empty cart successfully!', 'X??a to??n b??? s???n ph???m trong gi??? h??ng th??nh c??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3658, 1, 'vi', '_json', 'No products in cart', 'Kh??ng c?? s???n ph???m n??o trong gi??? h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3659, 1, 'vi', '_json', 'There is an issue when ordering. Please try again later!', 'C?? l???i trong qu?? tr??nh ?????t h??ng, vui l??ng th??? l???i sau!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3660, 1, 'vi', '_json', 'Applied coupon \":code\" successfully!', '??p d???ng m?? gi???m gi?? \":code\" th??nh c??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3661, 1, 'vi', '_json', 'Removed coupon :code successfully!', 'X??a m?? gi???m gi?? :code th??nh c??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3662, 1, 'vi', '_json', 'You have reviewed this product already!', 'B???n ???? ????nh gi?? s???n ph???m n??y r???i!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3663, 1, 'vi', '_json', 'Added review successfully!', 'Th??m ????nh gi?? th??nh c??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3664, 1, 'vi', '_json', 'Deleted review successfully!', 'X??a ????nh gi?? th??nh c??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3665, 1, 'vi', '_json', 'Your cart is empty!', 'Gi??? h??ng c???a b???n ??ang tr???ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3666, 0, 'vi', '_json', 'Sub Total', 'T???m t??nh', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3667, 1, 'vi', '_json', 'View cart', 'Xem gi??? h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3668, 1, 'vi', '_json', 'Checkout', 'Thanh to??n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3669, 1, 'vi', '_json', 'Address', '?????a ch???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3670, 1, 'vi', '_json', 'Hotline', '???????ng d??y n??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3671, 1, 'vi', '_json', 'Subscribe & Receive 10% off your first order', 'Theo d??i v?? nh???n gi???m gi?? 10% cho ????n h??ng ?????u ti??n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3672, 1, 'vi', '_json', 'Please enter your email address', 'Vui l??ng nh???p ?????a ch??? email c???a b???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3673, 1, 'vi', '_json', 'Go', 'G???i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3674, 1, 'vi', '_json', 'Connect with us', 'Li??n k???t v???i ch??ng t??i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3675, 1, 'vi', '_json', 'Search for', 'T??m ki???m', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3676, 1, 'vi', '_json', 'Shopping Cart', 'Gi??? h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3677, 1, 'vi', '_json', 'View', 'Xem', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3678, 1, 'vi', '_json', 'Add to cart', 'Th??m v??o gi??? h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3679, 1, 'vi', '_json', 'Related Posts', 'B??i vi???t li??n quan', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3680, 1, 'vi', '_json', 'Search result for', 'K???t qu??? t??m ki???m cho t??? kh??a', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3681, 1, 'vi', '_json', 'There is no data to display!', 'Kh??ng c?? d??? li???u ????? hi???n th???!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3682, 1, 'vi', '_json', 'Enjoy Shopping with us', 'Th???a s???c mua s???m v???i ch??ng t??i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3683, 1, 'vi', '_json', 'Filter Products', 'L???c s???n ph???m', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3684, 1, 'vi', '_json', 'No products!', 'Kh??ng c?? s???n ph???m!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3685, 1, 'vi', '_json', 'Image', 'H??nh ???nh', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3686, 1, 'vi', '_json', 'Name', 'T??n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3687, 1, 'vi', '_json', 'Price', 'Gi??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3688, 1, 'vi', '_json', 'Quantity', 'S??? l?????ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3689, 1, 'vi', '_json', 'Discount promotion', 'Ch????ng tr??nh khuy???n m??i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3690, 1, 'vi', '_json', 'Total', 'T???ng c???ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3691, 1, 'vi', '_json', 'It is not include shipping fee', 'Kh??ng bao g???m ph?? v???n chuy???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3692, 1, 'vi', '_json', 'Update cart', 'C???p nh???t gi??? h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3693, 1, 'vi', '_json', 'SKU', 'M?? s???n ph???m', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3694, 1, 'vi', '_json', 'Remove from wishlist', 'X??a s???n ph???m kh???i m???c y??u th??ch', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3695, 1, 'vi', '_json', 'Add to wishlist', 'Th??m v??o m???c y??u th??ch', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3696, 1, 'vi', '_json', 'Qty', 'S??? l?????ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3697, 1, 'vi', '_json', 'Tags', 'Th???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3698, 1, 'vi', '_json', 'Share', 'Chia s???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3699, 1, 'vi', '_json', 'Description', 'M?? t???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3700, 1, 'vi', '_json', 'Reviews', '????nh gi??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3701, 1, 'vi', '_json', 'Review', '????nh gi??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3702, 1, 'vi', '_json', 'Please', 'Vui l??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3703, 1, 'vi', '_json', 'login', '????ng nh???p', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3704, 1, 'vi', '_json', 'to write review!', '????? vi???t ????nh gi??!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3705, 1, 'vi', '_json', 'Add your rate', 'Th??m ????nh gi?? c???a b???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3706, 1, 'vi', '_json', 'Write your review', 'Vi???t ????nh gi?? c???a b???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3707, 1, 'vi', '_json', 'Submit', 'G???i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3708, 1, 'vi', '_json', 'Related Products', 'S???n ph???m li??n quan', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3709, 1, 'vi', '_json', 'Search result for \":query\"', 'K???t qu??? t??m ki???m cho t??? kh??a \":query\"', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3710, 1, 'vi', '_json', 'Select', 'L???a ch???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3711, 1, 'vi', '_json', 'Change password', '?????i m???t kh???u', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3712, 1, 'vi', '_json', 'Current password', 'M???t kh???u hi???n t???i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3713, 1, 'vi', '_json', 'Password confirmation', 'X??c nh???n m???t kh???u', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3714, 1, 'vi', '_json', 'New password', 'M???t kh???u m???i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3715, 1, 'vi', '_json', 'Account information', 'Th??ng tin t??i kho???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3716, 0, 'vi', '_json', 'Full Name', 'H??? v?? t??n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3717, 1, 'vi', '_json', 'Date of birth', 'Ng??y sinh', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3718, 1, 'vi', '_json', 'Email', 'Email', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3719, 1, 'vi', '_json', 'Phone', 'S??? ??i???n tho???i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3720, 1, 'vi', '_json', 'Update', 'C???p nh???t', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3721, 1, 'vi', '_json', 'Please enter your email address and password', 'Vui l??ng nh???p email v?? m???t kh???u', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3722, 1, 'vi', '_json', 'Email Address', '?????a ch??? email', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3723, 1, 'vi', '_json', 'Password', 'M???t kh???u', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3724, 1, 'vi', '_json', 'Please enter your password', 'Vui l??ng nh???p m???t kh???u c???a b???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3725, 1, 'vi', '_json', 'Forgot password?', 'Qu??n m???t kh???u?', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3726, 1, 'vi', '_json', 'Don\'t have an account?', 'Ch??a c?? t??i kho???n?', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3727, 1, 'vi', '_json', 'Create one', 'T???o m???t t??i kho???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3728, 1, 'vi', '_json', 'Overview', 'T???ng quan', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3729, 1, 'vi', '_json', 'Profile', 'Th??ng tin c?? nh??n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3730, 1, 'vi', '_json', 'Orders', '????n h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3731, 1, 'vi', '_json', 'Address books', 'S??? ?????a ch???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3732, 1, 'vi', '_json', 'Wishlist', 'Danh s??ch ??a th??ch', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3733, 1, 'vi', '_json', 'Logout', '????ng xu???t', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3734, 1, 'vi', '_json', 'Profile Image', '???nh ?????i di???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3735, 1, 'vi', '_json', 'New image', '???nh m???i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3736, 1, 'vi', '_json', 'Loading', '??ang t???i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3737, 1, 'vi', '_json', 'Close', '????ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3738, 1, 'vi', '_json', 'Save', 'L??u', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3739, 1, 'vi', '_json', 'N/A', 'N/A', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3740, 1, 'vi', '_json', 'Register', '????ng k??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3741, 1, 'vi', '_json', 'Please fill in the information below', 'Vui l??ng ??i???n c??c th??ng tin b??n d?????i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3742, 1, 'vi', '_json', 'Please enter your name', 'Vui l??ng nh???p t??n c???a b???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3743, 1, 'vi', '_json', 'Please enter your password confirmation', 'Vui l??ng nh???p x??c nh???n m???t kh???u', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3744, 1, 'vi', '_json', 'Product', 'S???n ph???m', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3745, 1, 'vi', '_json', 'Remove', 'X??a', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3746, 1, 'vi', '_json', 'No item in wishlist!', 'Kh??ng c?? s???n ph???m n??o trong danh s??ch ??a th??ch!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3747, 1, 'vi', '_json', 'Add a new address', 'Th??m ?????a ch??? m???i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3748, 1, 'vi', '_json', 'Country', 'Qu???c gia', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3749, 1, 'vi', '_json', 'Select country...', 'L???a ch???n qu???c gia...', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3750, 1, 'vi', '_json', 'State', 'T???nh/Th??nh ph???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3751, 1, 'vi', '_json', 'City', 'Qu???n/Huy???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3752, 1, 'vi', '_json', 'Use this address as default.', 'S??? d???ng l??m ?????a ch??? m???c ?????nh.', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3753, 1, 'vi', '_json', 'Default', 'M???c ?????nh', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3754, 1, 'vi', '_json', 'Edit', 'S???a', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3755, 1, 'vi', '_json', 'You have an account already?', 'B???n ???? c?? t??i kho???n?', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3756, 1, 'vi', '_json', 'Select available addresses', 'L???a ch???n ?????a ch???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3757, 1, 'vi', '_json', 'Add new address...', 'Th??m ?????a ch??? m???i...', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3758, 1, 'vi', '_json', 'Order information', 'Th??ng tin ????n h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3759, 1, 'vi', '_json', 'Order number', 'M?? ????n h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3760, 1, 'vi', '_json', 'Time', 'Th???i gian', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3761, 1, 'vi', '_json', 'Order status', 'Tr???ng th??i ????n h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3762, 1, 'vi', '_json', 'Payment method', 'Ph????ng th???c thanh to??n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3763, 1, 'vi', '_json', 'Payment status', 'Tr???ng th??i thanh to??n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3764, 1, 'vi', '_json', 'Amount', 'S??? ti???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3765, 1, 'vi', '_json', 'Tax', 'Thu???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3766, 1, 'vi', '_json', 'Shipping fee', 'Ph?? giao h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3767, 1, 'vi', '_json', 'Customer information', 'Th??ng tin kh??ch h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3768, 1, 'vi', '_json', 'Order detail', 'Chi ti???t ????n h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3769, 1, 'vi', '_json', 'Print order', 'In ????n h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3770, 1, 'vi', '_json', 'Cancel order', 'H???y ????n h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3771, 1, 'vi', '_json', 'Reset Password', 'Kh??i ph???c m???t kh???u', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3772, 1, 'vi', '_json', 'Send Password Reset Link', 'G???i li??n k???t kh??i ph???c m???t kh???u', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3773, 1, 'vi', '_json', 'Product Categories', 'Danh m???c s???n ph???m', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3774, 1, 'vi', '_json', 'All Products', 'T???t c??? s???n ph???m', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3775, 1, 'vi', '_json', 'Brands', 'Th????ng hi???u', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3776, 1, 'vi', '_json', 'Product Tags', 'Th???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3777, 1, 'vi', '_json', 'Filter By Price', 'L???c theo gi??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3778, 1, 'vi', '_json', 'Oldest', 'C?? nh???t', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3779, 1, 'vi', '_json', 'Newest', 'M???i nh???t', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3780, 1, 'vi', '_json', 'low to high', 'th???p ?????n cao', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3781, 1, 'vi', '_json', 'high to low', 'cao ?????n th???p', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3782, 1, 'vi', '_json', 'Warning', 'Ch?? ??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3783, 1, 'vi', '_json', 'Are you sure you want to remove this product from cart?', 'B???n c?? ch???c mu???n x??a s???n ph???m n??y kh???i gi??? h??ng?', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3784, 1, 'vi', '_json', 'Cancel', 'H???y', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3785, 1, 'vi', '_json', 'Yes, remove it!', 'V??ng, x??a!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3786, 1, 'vi', '_json', 'Shop Now', 'Mua h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3787, 1, 'vi', '_json', 'ID number', 'M??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3788, 1, 'vi', '_json', 'Date', 'Ng??y', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3789, 1, 'vi', '_json', 'Status', 'Tr???ng th??i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3790, 1, 'vi', '_json', 'Order tracking :code', 'Order tracking :code', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3791, 1, 'vi', '_json', 'Order tracking', 'Theo d??i ????n h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3792, 1, 'vi', '_json', 'Tracking your order status', 'Theo d??i tr???ng th??i ????n h??ng c???a b???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3793, 1, 'vi', '_json', 'Order not found!', 'Kh??ng t??m th???y ????n h??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3794, 1, 'vi', '_json', 'Find', 'T??m ki???m', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3795, 1, 'vi', '_json', 'Sort by', 'S???p x???p', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3796, 1, 'vi', '_json', 'A-Z', 'A-Z', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3797, 1, 'vi', '_json', 'Z-A', 'Z-A', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3798, 1, 'vi', '_json', 'Products', 'S???n ph???m', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3799, 1, 'vi', '_json', 'By', 'Theo', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3800, 1, 'vi', '_json', 'By Price', 'Theo gi??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3801, 1, 'vi', '_json', 'Shipping information', 'Th??ng tin v???n chuy???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3802, 1, 'vi', '_json', 'Payment information', 'Th??ng tin thanh to??n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3803, 1, 'vi', '_json', 'You have a coupon code?', 'B???n c?? m?? gi???m gi???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3804, 1, 'vi', '_json', 'Subtotal', 'T???m t??nh', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3805, 1, 'vi', '_json', 'Back to cart', 'Quay l???i trang gi??? h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3806, 1, 'vi', '_json', 'Register an account with above information?', 'T???o t??i kho???n v???i c??c th??ng tin tr??n?', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3807, 1, 'vi', '_json', 'Cart', 'Gi??? h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3808, 1, 'vi', '_json', 'Note', 'Ghi ch??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3809, 1, 'vi', '_json', 'Note...', 'Ghi ch??...', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3810, 1, 'vi', '_json', 'Shipping', 'Ph????ng th???c v???n chuy???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3811, 1, 'vi', '_json', 'Your order is successfully placed', '?????t h??ng th??nh c??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3812, 1, 'vi', '_json', 'Shipping method', 'Ph????ng th???c v???n chuy???n', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3813, 1, 'vi', '_json', 'Thank you for purchasing our products!', 'C???m ??n b???n ???? mua s???n ph???m c???a ch??ng t??i!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3814, 1, 'vi', '_json', 'Discount', 'Gi???m gi??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3815, 1, 'vi', '_json', 'Total amount', 'T???ng c???ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3816, 1, 'vi', '_json', 'Sub amount', 'T???m t??nh', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3817, 1, 'vi', '_json', 'Order successfully. Order number :id', '?????t h??ng th??nh c??ng, m?? ????n h??ng :id', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3818, 1, 'vi', '_json', 'Have an account already?', 'B???n ???? c?? t??i kho???n?', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3819, 1, 'vi', '_json', 'Login with social networks', '????ng nh???p th??ng qua m???ng x?? h???i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3820, 1, 'vi', '_json', 'Currency', '????n v???', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3821, 1, 'vi', '_json', 'No orders found!', 'Ch??a c?? ????n h??ng n??o', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3822, 1, 'vi', '_json', 'Actions', 'H??nh ?????ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3823, 1, 'vi', '_json', 'Customer', 'Kh??ch h??ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3824, 1, 'vi', '_json', 'Product(s)', 'S???n ph???m', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3825, 1, 'vi', '_json', 'Coupon code', 'M?? gi???m gi??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3826, 1, 'vi', '_json', 'Coupon code discount amount', 'Gi???m gi?? s??? d???ng m?? gi???m gi??', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3827, 1, 'vi', '_json', 'Promotion discount amount', 'Gi???m gi?? ch????ng tr??nh khuy???n m??i', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3828, 1, 'vi', '_json', 'No shipping methods available!', 'Kh??ng c?? ph????ng th???c v???n chuy???n ph?? h???p!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3829, 1, 'vi', '_json', 'No products in cart. :link!', 'Ch??a c?? s???n ph???m n??o trong gi??? h??ng. :link!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3830, 1, 'vi', '_json', 'Enter coupon code...', 'Nh???p m?? gi???m gi??...', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3831, 1, 'vi', '_json', 'Apply', '??p d???ng', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3832, 1, 'vi', '_json', 'Coupon code: :code', 'M?? gi???m gi??: :code', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3833, 1, 'vi', '_json', 'Processing. Please wait...', '??ang x??? l??. Vui l??ng ?????i...', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3834, 1, 'vi', '_json', 'Continue shopping', 'Ti???p t???c mua s???m', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3835, 1, 'vi', '_json', 'Checkout successfully!', '?????t h??ng th??nh c??ng!', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3836, 1, 'vi', '_json', 'Please confirm you are not robot', 'Vui l??ng x??c nh???n kh??ng ph???i l?? ng?????i m??y', '2021-03-14 18:40:50', '2021-03-14 18:40:50'),
(3837, 1, 'vi', '_json', 'Free shipping', 'Mi???n ph?? v???n chuy???n', '2021-03-14 18:40:51', '2021-03-14 18:40:51'),
(3838, 1, 'vi', '_json', 'Error', 'L???i', '2021-03-14 18:40:51', '2021-03-14 18:40:51'),
(3839, 1, 'vi', '_json', 'Success', 'Th??nh c??ng', '2021-03-14 18:40:51', '2021-03-14 18:40:51'),
(3840, 1, 'vi', '_json', 'The customer with that email is existed, please choose other email or login with this email!', 'The customer with that email is existed, please choose other email or login with this email!', '2021-03-14 18:40:51', '2021-03-14 18:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`) VALUES
(1, 'admin@acenetics.com', NULL, '$2y$10$0j5f4mkeKukkP2X/ThRRA.CnUhOZUWfJmsufcAi5cuTKDU6Xa7bOC', NULL, '2021-03-14 18:40:36', '2021-03-14 18:40:36', 'System', 'Admin', 'botble', NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(1, 'CustomMenuWidget', 'footer_sidebar', 'september', 1, '{\"id\":\"CustomMenuWidget\",\"name\":\"Customer services\",\"menu_id\":\"customer-services\"}', '2021-03-14 18:40:32', '2021-03-14 18:40:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `ec_brands`
--
ALTER TABLE `ec_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_cart`
--
ALTER TABLE `ec_cart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customers`
--
ALTER TABLE `ec_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_customers_email_unique` (`email`);

--
-- Indexes for table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customer_password_resets`
--
ALTER TABLE `ec_customer_password_resets`
  ADD KEY `ec_customer_password_resets_email_index` (`email`),
  ADD KEY `ec_customer_password_resets_token_index` (`token`);

--
-- Indexes for table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_discounts_code_unique` (`code`);

--
-- Indexes for table `ec_discount_customers`
--
ALTER TABLE `ec_discount_customers`
  ADD PRIMARY KEY (`discount_id`,`customer_id`);

--
-- Indexes for table `ec_discount_products`
--
ALTER TABLE `ec_discount_products`
  ADD PRIMARY KEY (`discount_id`,`product_id`);

--
-- Indexes for table `ec_discount_product_collections`
--
ALTER TABLE `ec_discount_product_collections`
  ADD PRIMARY KEY (`discount_id`,`product_collection_id`);

--
-- Indexes for table `ec_flash_sales`
--
ALTER TABLE `ec_flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_orders`
--
ALTER TABLE `ec_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_products`
--
ALTER TABLE `ec_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_category_product`
--
ALTER TABLE `ec_product_category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_category_product_category_id_index` (`category_id`),
  ADD KEY `ec_product_category_product_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_collection_products`
--
ALTER TABLE `ec_product_collection_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  ADD KEY `ec_product_collection_products_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_cross_sale_relations`
--
ALTER TABLE `ec_product_cross_sale_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_related_relations`
--
ALTER TABLE `ec_product_related_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_tag_product`
--
ALTER TABLE `ec_product_tag_product`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `ec_product_tag_product_product_id_index` (`product_id`),
  ADD KEY `ec_product_tag_product_tag_id_index` (`tag_id`);

--
-- Indexes for table `ec_product_up_sale_relations`
--
ALTER TABLE `ec_product_up_sale_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_with_attribute`
--
ALTER TABLE `ec_product_with_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_with_attribute_set`
--
ALTER TABLE `ec_product_with_attribute_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_reference_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `simple_sliders`
--
ALTER TABLE `simple_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simple_slider_items`
--
ALTER TABLE `simple_slider_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_brands`
--
ALTER TABLE `ec_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ec_customers`
--
ALTER TABLE `ec_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_flash_sales`
--
ALTER TABLE `ec_flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_orders`
--
ALTER TABLE `ec_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_products`
--
ALTER TABLE `ec_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ec_product_category_product`
--
ALTER TABLE `ec_product_category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ec_product_collection_products`
--
ALTER TABLE `ec_product_collection_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ec_product_cross_sale_relations`
--
ALTER TABLE `ec_product_cross_sale_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `ec_product_related_relations`
--
ALTER TABLE `ec_product_related_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ec_product_up_sale_relations`
--
ALTER TABLE `ec_product_up_sale_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `ec_product_with_attribute`
--
ALTER TABLE `ec_product_with_attribute`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ec_product_with_attribute_set`
--
ALTER TABLE `ec_product_with_attribute_set`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `simple_sliders`
--
ALTER TABLE `simple_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `simple_slider_items`
--
ALTER TABLE `simple_slider_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3841;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
