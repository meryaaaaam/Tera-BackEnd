-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 25 oct. 2022 à 14:03
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `7rentals`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `address`, `city`, `code`, `state`, `created_at`, `updated_at`) VALUES
(1, '4890 St Catherine Z', 'Montréal', 'H1V 1Z2', 'Québec', '2022-06-16 08:52:07', '2022-08-24 18:29:54'),
(2, '4710 St Catherine E', ', Montréal', 'H1V 1Z2', 'Qc', '2022-06-27 09:55:42', '2022-06-27 09:55:42'),
(3, '4710 St Catherine E', ', Montréal', 'H1V 1Z2', 'Qc', '2022-06-27 09:56:59', '2022-06-27 09:56:59'),
(4, '4710 St Catherine E', ', Montréal', 'H1V 1Z2', 'Qc', '2022-06-27 10:03:55', '2022-06-27 10:03:55'),
(5, '4710 St Catherine E', ', Montréal', 'H1V 1Z2', 'Qc', '2022-06-27 10:04:14', '2022-06-27 10:04:14'),
(6, '4710 St Catherine E', ', Montréal', 'H1V 1Z2', 'Qc', '2022-06-27 10:04:34', '2022-06-27 10:04:34'),
(7, '4710 St Catherine E', ', Montréal', 'H1V 1Z2', 'Qc', '2022-06-27 10:06:19', '2022-06-27 10:06:19'),
(8, '4710 St Catherine E', ', Montréal', 'H1V 1Z2', 'Qc', '2022-06-27 10:06:41', '2022-06-27 10:06:41'),
(9, '4710 St Catherine E', ', Montréal', 'H1V 1Z2', 'Qc', '2022-06-27 10:07:38', '2022-06-27 10:07:38'),
(10, '4890 St Catherine Z', ', Montréal', 'H1V 1Z2', 'Qc', '2022-06-27 11:25:09', '2022-06-27 11:25:09'),
(11, '4890 St Catherine Z', ', Montréal', 'H1V 1Z2', 'Qc', '2022-06-27 11:25:39', '2022-06-27 11:25:39'),
(12, 'Null', 'Null', 'Null', 'Null', '2022-07-01 18:28:21', '2022-07-01 18:28:21'),
(13, 'Null', 'Null', 'Null', 'Null', '2022-07-01 18:46:50', '2022-07-01 18:46:50'),
(14, 'Null', 'Null', 'Null', 'Null', '2022-07-01 19:11:40', '2022-07-01 19:11:40'),
(15, '4172 40th Street', 'Calgary,', 'AB T2P 2V7', 'Alberta', '2022-07-27 11:12:19', '2022-07-27 11:12:19'),
(16, '7 Boulevard Allard', 'Sainte-Corrine', 'NB A6R2E6', 'Qc', '2022-08-16 16:38:36', '2022-08-16 16:38:36'),
(17, '26217 Pont Yvan Bureau 283', 'Saint-Pénélope-de-Ladrière', 'PE T8Y6R0', 'Qc', '2022-08-16 16:58:45', '2022-08-16 16:58:45'),
(18, '8131 160 Ave NW', 'Edmonton', 'T5Z 0G3', 'Alberta', '2022-08-16 20:37:32', '2022-08-16 20:37:32'),
(19, '5 rue du Château', 'Saint-Étienne', '42100', 'Rhône-Alpes , France', '2022-08-18 19:04:50', '2022-08-18 19:04:50'),
(20, '12439 Route Nadeau Suite 301', 'Sainte-Zacharie-de-Rivière-du-Loup', 'QC E3J9Y1', 'Québec', '2022-08-25 16:03:51', '2022-08-25 16:03:51');

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_status` enum('Pending','Approved','Declined') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vehicule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `host_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Driving_licence_side1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Driving_licence_side2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_date` date DEFAULT NULL,
  `cvv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `save` tinyint(1) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cashes`
--

CREATE TABLE `cashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cashout_status` enum('Pending','Validated','Declined') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_cash_out` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cashes`
--

INSERT INTO `cashes` (`id`, `amount`, `user_id`, `created_at`, `updated_at`, `cashout_status`, `is_cash_out`) VALUES
(1, '10.00', 2, '2022-09-19 09:42:45', '2022-09-19 10:50:21', 'Validated', 1),
(2, '20.00', 2, '2022-09-19 10:00:51', '2022-09-19 11:00:47', 'Validated', 1),
(3, '200.00', 3, '2022-09-19 11:10:32', '2022-09-19 11:10:50', 'Validated', 1),
(4, '92.09', 3, '2022-09-19 11:27:08', '2022-09-19 11:27:21', 'Validated', 1),
(5, '100.00', 3, '2022-09-19 11:51:10', '2022-09-19 12:02:06', 'Validated', 1),
(6, '100.00', 3, '2022-09-19 11:52:17', '2022-09-19 12:04:06', 'Validated', 1),
(7, '150.00', 3, '2022-09-19 11:54:24', '2022-09-19 11:55:53', 'Validated', 1);

-- --------------------------------------------------------

--
-- Structure de la table `disputes`
--

CREATE TABLE `disputes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reservation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `disputes`
--

INSERT INTO `disputes` (`id`, `date`, `description`, `host_id`, `host_name`, `client_id`, `client_name`, `reservation_id`, `created_at`, `updated_at`) VALUES
(1, '2022-08-26 21:48:16', '--', '2', 'Ted mosbey', '13', 'Luke williams', 10, '2022-08-27 11:48:16', '2022-08-27 11:48:16'),
(3, '2022-09-13 14:54:14', 'TEST', '3', 'monica Geller', '8', 'Glen waiston', 27, '2022-09-13 12:54:14', '2022-09-13 12:54:14'),
(6, '2022-09-14 13:42:41', 'TEST TEST TEST', '4', 'Elliot Smith', '6', 'barney stinson', 30, '2022-09-14 11:42:41', '2022-09-14 11:42:41'),
(8, '2022-09-14 15:32:17', 'TEST', '4', 'Elliot Smith', '11', 'Jackson Tremblay', 1, '2022-09-14 13:32:17', '2022-09-14 13:32:17'),
(9, '2022-09-14 15:46:26', '-----------------------', '3', 'monica Geller', '8', 'Glen waiston', 29, '2022-09-14 13:46:26', '2022-09-14 13:46:26'),
(10, '2022-09-15 13:05:10', 'aaaaaaaaaaaaaaaaaaaaa', '2', 'Ted mosbey', '5', 'Ross Geller', 11, '2022-09-15 11:05:10', '2022-09-15 11:05:10');

-- --------------------------------------------------------

--
-- Structure de la table `extras`
--

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `information_support` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_information` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `price_detail` enum('heure','jour','voyage') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fees`
--

CREATE TABLE `fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double(8,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fees`
--

INSERT INTO `fees` (`id`, `label`, `value`, `description`, `created_at`, `updated_at`) VALUES
(1, 'client_fee', 4.99, NULL, '2022-09-15 14:00:53', '2022-09-15 12:20:46'),
(2, 'host_fee', 10.00, NULL, '2022-09-15 14:00:53', '2022-09-15 12:20:46');

-- --------------------------------------------------------

--
-- Structure de la table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `galleries`
--

INSERT INTO `galleries` (`id`, `path`, `name`, `size`, `vehicule_id`, `created_at`, `updated_at`) VALUES
(2, '5a26578d2e2284d584eace595355cedax.webp', '5a26578d2e2284d584eace595355cedax.webp', '50872', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(4, '8e9a2e3272d6d21633409463cf1337f5x.webp', '8e9a2e3272d6d21633409463cf1337f5x.webp', '56808', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(5, '9b8291d712eda5a76572cfb5effce9e5x.webp', '9b8291d712eda5a76572cfb5effce9e5x.webp', '35452', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(19, 'BMW-MY22-iX-Gallery-22.jpg', 'BMW-MY22-iX-Gallery-22.jpg', '117504', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(20, 'BMW-MY22-iX-Gallery-21.jpg', 'BMW-MY22-iX-Gallery-21.jpg', '147971', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(21, 'BMW-MY22-iX-Gallery-20.jpg', 'BMW-MY22-iX-Gallery-20.jpg', '247916', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(22, 'BMW-MY22-iX-Gallery-19.jpg', 'BMW-MY22-iX-Gallery-19.jpg', '131313', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(23, 'BMW-MY22-iX-Gallery-18.jpg', 'BMW-MY22-iX-Gallery-18.jpg', '385747', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(24, 'BMW-MY22-iX-Gallery-17.jpg', 'BMW-MY22-iX-Gallery-17.jpg', '180852', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(25, 'BMW-MY23-iX-Gallery-Interior-15.jpg', 'BMW-MY23-iX-Gallery-Interior-15.jpg', '124094', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(26, 'BMW-MY23-Gallery-iX-Exterior-09.jpg', 'BMW-MY23-Gallery-iX-Exterior-09.jpg', '147995', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(27, 'BMW-MY23-iX-Gallery-Exterior-08.jpg', 'BMW-MY23-iX-Gallery-Exterior-08.jpg', '215043', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(28, 'BMW-MY23-iX-Gallery-Exterior-07.jpg', 'BMW-MY23-iX-Gallery-Exterior-07.jpg', '181963', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(29, 'BMW-MY23-iX-Gallery-Exterior-04.jpg', 'BMW-MY23-iX-Gallery-Exterior-04.jpg', '82358', 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(30, 'BMW M4 (1).jpg', 'BMW M4 (1).jpg', '704894', 3, '2022-07-01 18:31:26', '2022-07-01 18:31:26'),
(31, 'BMW M4 (2).jpg', 'BMW M4 (2).jpg', '2312149', 3, '2022-07-01 18:31:26', '2022-07-01 18:31:26'),
(33, 'porsche-02.jpg', 'porsche-02.jpg', '704894', 4, '2022-07-01 18:39:57', '2022-07-01 18:39:57'),
(34, 'porsche-03.jpg', 'porsche-03.jpg', '2312149', 4, '2022-07-01 18:39:57', '2022-07-01 18:39:57'),
(35, 'porsche-04.jpg', 'porsche-04.jpg', '1500448', 4, '2022-07-01 18:39:57', '2022-07-01 18:39:57'),
(36, 'b4b9bbcff464beacd82dff6ea81e0381.jpg', 'b4b9bbcff464beacd82dff6ea81e0381.jpg', '88155', 5, '2022-07-01 18:52:03', '2022-07-01 18:52:03'),
(37, 'devon-janse-van-rensburg-cTCYujspoLs-unsplash.jpg', 'devon-janse-van-rensburg-cTCYujspoLs-unsplash.jpg', '1764785', 6, '2022-07-01 19:13:42', '2022-07-01 19:13:42'),
(38, 'devon-janse-van-rensburg-FQT-gz0aJdc-unsplash.jpg', 'devon-janse-van-rensburg-FQT-gz0aJdc-unsplash.jpg', '2022550', 6, '2022-07-01 19:13:42', '2022-07-01 19:13:42'),
(39, 'devon-janse-van-rensburg-NjEGKWnr6lQ-unsplash.jpg', 'devon-janse-van-rensburg-NjEGKWnr6lQ-unsplash.jpg', '2083511', 6, '2022-07-01 19:13:42', '2022-07-01 19:13:42'),
(40, 'Audi-Q5.jpg', 'Audi-Q5.jpg', '2421699', 7, '2022-07-27 12:13:23', '2022-07-27 12:13:23'),
(41, 'img-1-960x.webp', 'img-1-960x.webp', '46642', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(42, 'img-3-960x.jpg', 'img-3-960x.jpg', '47773', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(43, 'img-4-960x.webp', 'img-4-960x.webp', '30740', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(44, 'img-10-960x.jpg', 'img-10-960x.jpg', '90561', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(45, 'img-11-960x.jpg', 'img-11-960x.jpg', '115034', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(46, 'img-12-960x.jpg', 'img-12-960x.jpg', '116179', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(47, 'img-13-960x.jpg', 'img-13-960x.jpg', '101000', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(48, 'img-14-960x.jpg', 'img-14-960x.jpg', '72553', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(49, 'img-17-960x.jpg', 'img-17-960x.jpg', '110872', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(50, 'img-18-960x.jpg', 'img-18-960x.jpg', '107525', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(51, 'img-19-960x.jpg', 'img-19-960x.jpg', '69752', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(52, 'img-20-960x.jpg', 'img-20-960x.jpg', '85439', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(53, 'img-21-960x.webp', 'img-21-960x.webp', '77654', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(54, 'img-22-960x.webp', 'img-22-960x.webp', '77826', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(55, 'img-23-960x.jpg', 'img-23-960x.jpg', '85479', 8, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(56, 'd329dcf344c6aa79c2e23822f55f5c34.jpg', 'd329dcf344c6aa79c2e23822f55f5c34.jpg', '63152', 9, '2022-08-19 18:36:24', '2022-08-19 18:36:24'),
(57, 'Tesla-Model-3-Main-Image.webp', 'Tesla-Model-3-Main-Image.webp', '61170', 9, '2022-08-19 18:36:24', '2022-08-19 18:36:24'),
(58, 'tesla-model-3-with-ssr-gtx01-wheels-and-ohlins-suspension-2.jpg', 'tesla-model-3-with-ssr-gtx01-wheels-and-ohlins-suspension-2.jpg', '370266', 9, '2022-08-19 18:36:24', '2022-08-19 18:36:24'),
(59, 'tesla4.jpg', 'tesla4.jpg', '40708', 10, '2022-08-19 19:01:16', '2022-08-19 19:01:16'),
(60, '5605c790bf7e2331414d1d136e6953de.jpg', '5605c790bf7e2331414d1d136e6953de.jpg', '52071', 11, '2022-08-25 16:16:12', '2022-08-25 16:16:12'),
(61, 'Azure-05.jpg', 'Azure-05.jpg', '346656', 12, '2022-09-05 18:02:27', '2022-09-05 18:02:27'),
(62, '289570860_8108184219199598_8727793974881349128_n.jpg', '289570860_8108184219199598_8727793974881349128_n.jpg', '455887', 13, '2022-09-19 07:36:21', '2022-09-19 07:36:21'),
(63, '289798053_8108184805866206_860349433539011101_n.jpg', '289798053_8108184805866206_860349433539011101_n.jpg', '509502', 13, '2022-09-19 07:36:21', '2022-09-19 07:36:21'),
(64, '290258018_8108183585866328_6667553707725541876_n.jpg', '290258018_8108183585866328_6667553707725541876_n.jpg', '644238', 13, '2022-09-19 07:36:21', '2022-09-19 07:36:21'),
(66, '6995e3c8da46048e6daed90f55e66857x_1664446955.webp', '6995e3c8da46048e6daed90f55e66857x_1664446955.webp\n', '33948', 1, '2022-09-29 08:22:36', '2022-09-29 08:22:36'),
(67, '949b561335eaaab2177a2d583f7e4227x_1664447296.webp', '949b561335eaaab2177a2d583f7e4227x_1664447296.webp', '33948', 1, '2022-09-29 08:28:16', '2022-09-29 08:28:16'),
(68, '4252b577819d656c4c12da4d55382c3bx_1664447297.webp', '4252b577819d656c4c12da4d55382c3bx_1664447297.webp', '36042', 1, '2022-09-29 08:28:17', '2022-09-29 08:28:17'),
(69, '8846064921e23b3d0fab713c2b0ac53cx_1664447297.webp', '8846064921e23b3d0fab713c2b0ac53cx_1664447297.webp', '70118', 1, '2022-09-29 08:28:17', '2022-09-29 08:28:17'),
(70, 'a5decbefd6aa82e16e420c8c99acf57ax_1664447298.webp', 'a5decbefd6aa82e16e420c8c99acf57ax_1664447298.webp', '51866', 1, '2022-09-29 08:28:18', '2022-09-29 08:28:18'),
(71, 'afb2ccee52453f14d3909f717d92412ax_1664447298.webp', 'afb2ccee52453f14d3909f717d92412ax_1664447298.webp', '37950', 1, '2022-09-29 08:28:18', '2022-09-29 08:28:18'),
(72, 'b8c663e00fc40d87a9b7b1c3dd78a48cx_1664447299.webp', 'b8c663e00fc40d87a9b7b1c3dd78a48cx_1664447299.webp', '59558', 1, '2022-09-29 08:28:19', '2022-09-29 08:28:19'),
(73, 'bbeff9abe7144f64a387c73415cbe34dx_1664447299.jpg', 'bbeff9abe7144f64a387c73415cbe34dx_1664447299.jpg', '57545', 1, '2022-09-29 08:28:19', '2022-09-29 08:28:19'),
(74, 'bf5c46e82320d9847ae22d0b09c9f6b6x_1664447300.webp', 'bf5c46e82320d9847ae22d0b09c9f6b6x_1664447300.webp', '30034', 1, '2022-09-29 08:28:20', '2022-09-29 08:28:20'),
(75, 'ed7e0959615dcbfdb85e821018b4be2ex_1664447300.webp', 'ed7e0959615dcbfdb85e821018b4be2ex_1664447300.webp', '51382', 1, '2022-09-29 08:28:20', '2022-09-29 08:28:20');

-- --------------------------------------------------------

--
-- Structure de la table `makes`
--

CREATE TABLE `makes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `makes`
--

INSERT INTO `makes` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Buick', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(2, 'MINI', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(3, 'Volvo', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(4, 'Ford', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(5, 'HUMMER', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(6, 'GMC', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(7, 'Subaru', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(8, 'Mitsubishi', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(9, 'Dodge', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(10, 'Nissan', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(11, 'Honda', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(12, 'Lincoln', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(13, 'Hyundai', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(14, 'BMW', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(15, 'Bentley', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(16, 'Lexus', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(17, 'Chevrolet', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(18, 'Jaguar', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(19, 'Mercedes-Benz', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(20, 'Volkswagen', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(21, 'Aston Martin', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(22, 'Land Rover', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(23, 'Pontiac', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(24, 'Cadillac', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(25, 'FIAT', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(26, 'Saab', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(27, 'Kia', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(28, 'Lamborghini', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(29, 'Audi', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(30, 'Jeep', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(31, 'MAZDA', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(32, 'Suzuki', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(33, 'Toyota', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(34, 'Acura', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(35, 'Saturn', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(36, 'Chrysler', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(37, 'Isuzu', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(38, 'Ferrari', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(39, 'Tesla', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(40, 'INFINITI', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(41, 'Oldsmobile', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(42, 'Ram', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(43, 'Eagle', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(44, 'Porsche', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(45, 'Mercury', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(46, 'Scion', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(47, 'Lotus', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(48, 'Plymouth', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(49, 'Freightliner', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(50, 'Rolls-Royce', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(51, 'SRT', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(52, 'Maybach', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(53, 'Alfa Romeo', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(54, 'Geo', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(55, 'smart', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(56, 'Daewoo', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(57, 'Maserati', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(58, 'Daihatsu', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(59, 'Genesis', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(60, 'McLaren', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(61, 'Fisker', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46'),
(62, 'Panoz', NULL, '2022-06-15 08:37:46', '2022-06-15 08:37:46');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2022_05_10_105233_create_addresses_table', 1),
(5, '2022_05_11_164722_create_makes_table', 1),
(6, '2022_05_11_170722_create_models_table', 1),
(7, '2022_05_11_172053_create_options_table', 1),
(8, '2022_05_11_172107_create_extras_table', 1),
(9, '2022_5_10_105259_create_users_table', 1),
(10, '2022_05_27_085755_create_vehicules_table', 2),
(11, '2022_05_27_090947_create_roles_table', 3),
(12, '2022_05_27_091022_create_user_roles_table', 3),
(13, '2022_05_27_124726_create_vehicule_options_table', 3),
(14, '2022_06_01_161621_create_galleries_table', 3),
(15, '2022_06_09_093744_create_reservations_table', 3),
(16, '2022_06_09_095808_create_reservations_vehicules_table', 3),
(17, '2022_06_28_124310_add_solde_to_vehicule', 4),
(18, '2022_06_28_130404_create_cards_table', 4),
(19, '2022_06_28_140437_add_solde_to_user', 4),
(20, '2022_06_30_132523_add_available_to_vehicules', 4),
(21, '2022_07_26_111452_create_payments_table', 5),
(22, '2022_07_26_113048_create_bookings_table', 6),
(23, '2022_07_26_113252_create_disputes_table', 7),
(24, '2022_07_27_151853_add_status_to_users', 8),
(25, '2022_08_26_092343_add_vehicule_id_to_bookings', 8),
(26, '2022_08_26_094708_add_host_id_to_bookings', 8),
(27, '2022_08_29_113938_create_reviews_table', 8),
(28, '2022_08_29_141016_add_custer_name_to_reviews', 8),
(29, '2022_08_29_141505_add_liketo_reviews', 8),
(30, '2022_08_31_085628_add_review_nb_to_vehicules', 8),
(31, '2022_08_31_092017_add_rate_to_vehicules', 8),
(33, '2022_09_01_130646_add_is_approved_to_payments', 9),
(34, '2022_09_02_110106_add_operation_status_to_payments', 10),
(35, '2022_09_15_135059_create_fees_table', 11),
(36, '2022_09_19_111147_create_cashes_table', 12),
(38, '2022_09_19_120816_add_cash_id_to_payment', 13),
(39, '2022_09_19_124808_add_cash_status_to_cashe', 13),
(40, '2022_09_19_130710_add_is_cash_out_to_cashe', 14),
(41, '2022_09_19_133108_add_host_fee_to_payments', 15);

-- --------------------------------------------------------

--
-- Structure de la table `models`
--

CREATE TABLE `models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `make_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `models`
--

INSERT INTO `models` (`id`, `name`, `type`, `year`, `created_at`, `updated_at`, `make_id`) VALUES
(1, 'X6', 'SUV', '2019', '2022-06-15 08:38:42', '2022-06-15 08:38:42', 14),
(2, 'Z4', 'Convertible', '2019', '2022-06-15 08:38:42', '2022-06-15 08:38:42', 14),
(3, '8 Series', 'Coupe, Convertible', '2019', '2022-06-15 08:38:42', '2022-06-15 08:38:42', 14),
(4, 'X2', 'SUV', '2019', '2022-06-15 08:38:42', '2022-06-15 08:38:42', 14),
(5, '5 Series', 'Sedan', '2019', '2022-06-15 08:38:42', '2022-06-15 08:38:42', 14),
(6, 'Mercedes-AMG GT', 'Coupe, Sedan, Convertible', '2019', '2022-06-15 08:39:07', '2022-06-15 08:39:07', 19),
(7, 'Mercedes-AMG CLS', 'Sedan', '2019', '2022-06-15 08:39:07', '2022-06-15 08:39:07', 19),
(8, 'GLC Coupe', 'SUV', '2019', '2022-06-15 08:39:07', '2022-06-15 08:39:07', 19),
(9, 'Durango', 'SUV', '2019', '2022-06-15 08:39:38', '2022-06-15 08:39:38', 9),
(10, 'Charger', 'Sedan', '2019', '2022-06-15 08:39:38', '2022-06-15 08:39:38', 9),
(11, 'Journey', 'SUV', '2019', '2022-06-15 08:39:38', '2022-06-15 08:39:38', 9),
(12, 'Challenger', 'Coupe', '2019', '2022-06-15 08:39:38', '2022-06-15 08:39:38', 9),
(13, 'Grand Caravan Passenger', 'Van/Minivan', '2019', '2022-06-15 08:39:38', '2022-06-15 08:39:38', 9),
(14, 'Q5', 'SUV', '2019', '2022-06-15 08:40:08', '2022-06-15 08:40:08', 29),
(15, 'A8', 'Sedan', '2019', '2022-06-15 08:40:08', '2022-06-15 08:40:08', 29),
(16, 'S3', 'Sedan', '2019', '2022-06-15 08:40:08', '2022-06-15 08:40:08', 29),
(17, 'RS 5', 'Sedan, Coupe', '2019', '2022-06-15 08:40:08', '2022-06-15 08:40:08', 29),
(18, 'A7', 'Sedan', '2019', '2022-06-15 08:40:08', '2022-06-15 08:40:08', 29),
(19, 'RS 3', 'Sedan', '2019', '2022-06-15 08:40:08', '2022-06-15 08:40:08', 29),
(20, 'A6', 'Sedan', '2019', '2022-06-15 08:40:08', '2022-06-15 08:40:08', 29),
(21, 'TT', 'Coupe', '2019', '2022-06-15 08:40:08', '2022-06-15 08:40:08', 29),
(22, 'e-tron', 'SUV', '2019', '2022-06-15 08:40:08', '2022-06-15 08:40:08', 29),
(23, 'A3', 'Sedan, Convertible', '2019', '2022-06-15 08:40:08', '2022-06-15 08:40:08', 29),
(24, 'Highlander Hybrid', 'SUV', '2019', '2022-06-15 08:41:28', '2022-06-15 08:41:28', 33),
(25, 'RAV4 Hybrid', 'SUV', '2019', '2022-06-15 08:41:28', '2022-06-15 08:41:28', 33),
(26, 'Highlander', 'SUV', '2019', '2022-06-15 08:41:28', '2022-06-15 08:41:28', 33),
(27, 'Corolla', 'Sedan', '2019', '2022-06-15 08:41:28', '2022-06-15 08:41:28', 33),
(28, 'Mirai', 'Sedan', '2019', '2022-06-15 08:41:28', '2022-06-15 08:41:28', 33),
(29, 'RAV4', 'SUV', '2019', '2022-06-15 08:41:28', '2022-06-15 08:41:28', 33),
(30, 'Avalon Hybrid', 'Sedan', '2019', '2022-06-15 08:41:28', '2022-06-15 08:41:28', 33),
(31, 'Prius', 'Hatchback', '2019', '2022-06-15 08:41:28', '2022-06-15 08:41:28', 33),
(32, 'Land Cruiser', 'SUV', '2019', '2022-06-15 08:41:28', '2022-06-15 08:41:28', 33),
(33, 'C-HR', 'SUV', '2019', '2022-06-15 08:41:28', '2022-06-15 08:41:28', 33),
(34, 'IX', 'SUV', '2021', '2022-06-15 08:53:59', '2022-06-15 08:53:59', 14),
(35, 'M4', 'sedan', '2020', '2022-06-15 08:53:59', '2022-06-15 08:53:59', 14),
(36, '911', 'Coupe, Convertible', '2001', '2022-06-15 09:10:27', '2022-06-15 09:10:27', 44),
(37, 'Enclave', 'SUV', '2008', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 1),
(38, 'Convertible', 'Convertible', '2006', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 2),
(39, 'XC90', 'SUV', '2019', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 3),
(40, 'Taurus', 'Sedan, Wagon', '1999', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 4),
(41, 'XC60', 'SUV', '2020', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 3),
(42, 'H2', 'SUV, Pickup', '2006', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 5),
(43, 'Sierra 1500 Crew Cab', 'Pickup', '2016', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 6),
(44, 'Canyon Crew Cab', 'Pickup', '2008', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 6),
(45, 'Outback', 'SUV', '2016', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 7),
(46, 'Outlander', 'SUV', '2010', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 8),
(47, 'Ram Van 1500', 'Van/Minivan', '1998', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 9),
(48, 'Pathfinder', 'SUV', '2014', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 10),
(49, 'Civic', 'Sedan, Coupe', '2014', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 11),
(50, 'Outback', 'Wagon', '2009', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 7),
(51, 'Navigator L', 'SUV', '2009', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 12),
(52, 'Yukon Denali', 'SUV', '2000', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 6),
(53, 'Tucson', 'SUV', '2007', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 13),
(54, '7 Series', 'Sedan', '2018', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 14),
(55, 'Caravan Passenger', 'Van/Minivan', '1992', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 9),
(56, 'Accent', 'Sedan, Hatchback', '2008', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 13),
(57, 'Frontier King Cab', 'Pickup', '2017', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 10),
(58, 'Altima', 'Sedan', '2019', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 10),
(59, 'Clarity Plug-in Hybrid', 'Sedan', '2018', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 11),
(60, 'Verano', 'Sedan', '2014', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 1),
(61, 'Azure', 'Convertible', '2007', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 15),
(62, 'RC', 'Coupe', '2017', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 16),
(63, 'Sonic', 'Sedan, Hatchback', '2012', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 17),
(64, 'NV2500 HD Cargo', 'Van/Minivan', '2013', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 10),
(65, 'Sonoma Club Coupe Cab', 'Pickup', '1995', '2022-06-29 09:55:44', '2022-06-29 09:55:44', 6),
(66, 'X-Type', 'Sedan, Wagon', '2007', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 18),
(67, 'SL-Class', 'Convertible', '2004', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 19),
(68, 'Sportvan G30', 'Van/Minivan', '1995', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 17),
(69, 'Sierra 2500 HD Crew Cab', 'Pickup', '2004', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 6),
(70, 'e-Golf', 'Hatchback', '2016', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 20),
(71, 'DBS', 'Coupe, Convertible', '2010', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 21),
(72, 'Beretta', 'Coupe', '1996', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 17),
(73, 'Range Rover Sport', 'SUV', '2020', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 22),
(74, 'Firebird', 'Convertible, Hatchback', '1996', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 23),
(75, 'SRX', 'SUV', '2011', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 24),
(76, 'E350 Super Duty Cargo', 'Van/Minivan', '2011', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 4),
(77, 'Frontier Crew Cab', 'Pickup', '2015', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 10),
(78, 'F250 Super Duty Super Cab', 'Pickup', '2003', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 4),
(79, 'Escape', 'SUV', '2017', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 4),
(80, 'Golf SportWagen', 'Wagon', '2019', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 20),
(81, '500 Abarth', 'Hatchback', '2019', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 25),
(82, '9000', 'Sedan, Hatchback', '1994', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 26),
(83, 'Sorento', 'SUV', '2006', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 27),
(84, 'Murcielago', 'Coupe, Convertible', '2009', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 28),
(85, 'Rio', 'Sedan, Hatchback', '2020', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 27),
(86, 'A5', 'Coupe, Convertible', '2011', '2022-06-29 09:55:45', '2022-06-29 09:55:45', 29),
(87, '7 Series', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 14),
(88, 'Clarity Plug-in Hybrid', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 11),
(89, 'Sierra 2500 HD Crew Cab', 'Pickup', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 6),
(90, 'CTS-V', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 24),
(91, 'NV200', 'Van/Minivan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 10),
(92, 'MKZ', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 12),
(93, 'Yukon', 'SUV', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 6),
(94, 'F150 Regular Cab', 'Pickup', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 4),
(95, 'Yaris', 'Hatchback', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 33),
(96, 'M5', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 14),
(97, 'Sierra 3500 HD Regular Cab', 'Pickup', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 6),
(98, 'XJ', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 18),
(99, 'IS', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 16),
(100, 'Golf Alltrack', 'Wagon', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 20),
(101, 'ProMaster Cargo Van', 'Van/Minivan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 42),
(102, 'Cherokee', 'SUV', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 30),
(103, 'Impreza', 'Sedan, Wagon', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 7),
(104, 'Forte', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 27),
(105, 'QX30', 'SUV', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 40),
(106, 'Equinox', 'SUV', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 17),
(107, 'Civic Type R', 'Hatchback', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 11),
(108, 'ATS', 'Sedan, Coupe', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 24),
(109, 'RLX', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 34),
(110, 'Elantra', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 13),
(111, 'Q5', 'SUV', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 29),
(112, 'Mercedes-AMG SLC', 'Convertible', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 19),
(113, 'Express 3500 Cargo', 'Van/Minivan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 17),
(114, 'Versa', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 10),
(115, 'Express 2500 Passenger', 'Van/Minivan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 17),
(116, 'Explorer', 'SUV', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 4),
(117, 'Clarity Fuel Cell', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 11),
(118, 'Sonic', 'Sedan, Hatchback', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 17),
(119, 'A5', 'Sedan, Coupe, Convertible', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 29),
(120, 'Transit 350 HD Van', 'Van/Minivan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 4),
(121, 'Malibu', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 17),
(122, 'Navigator L', 'SUV', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 12),
(123, 'Rogue Sport', 'SUV', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 10),
(124, 'Mercedes-AMG SL', 'Convertible', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 19),
(125, 'XT5', 'SUV', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 24),
(126, 'Outback', 'SUV', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 7),
(127, 'Accent', 'Sedan', '2018', '2022-06-29 09:56:52', '2022-06-29 09:56:52', 13),
(128, '500c', 'Convertible', '2018', '2022-06-29 09:56:53', '2022-06-29 09:56:53', 25),
(129, 'A6', 'Sedan', '2018', '2022-06-29 09:56:53', '2022-06-29 09:56:53', 29),
(130, 'Q7', 'SUV', '2018', '2022-06-29 09:56:53', '2022-06-29 09:56:53', 29),
(131, 'F350 Super Duty Regular Cab', 'Pickup', '2018', '2022-06-29 09:56:53', '2022-06-29 09:56:53', 4),
(132, 'Expedition', 'SUV', '2018', '2022-06-29 09:56:53', '2022-06-29 09:56:53', 4),
(133, '812 Superfast', 'Coupe', '2018', '2022-06-29 09:56:53', '2022-06-29 09:56:53', 38),
(134, 'NX', 'SUV', '2018', '2022-06-29 09:56:53', '2022-06-29 09:56:53', 16),
(135, 'F250 Super Duty Regular Cab', 'Pickup', '2018', '2022-06-29 09:56:53', '2022-06-29 09:56:53', 4),
(136, 'Sedona', 'Van/Minivan', '2018', '2022-06-29 09:56:53', '2022-06-29 09:56:53', 27),
(137, 'Model 3', 'Sedan', '2019', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(138, 'Model S', 'Sedan', '2019', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(139, 'Model S', 'Sedan', '2014', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(140, 'Model X', 'SUV', '2016', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(141, 'Model X', 'SUV', '2019', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(142, 'Model S', 'Sedan', '2013', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(143, 'Model X', 'SUV', '2017', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(144, 'Model X', 'SUV', '2018', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(145, 'Model 3', 'Sedan', '2018', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(146, 'Model S', 'Sedan', '2015', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(147, 'Model S', 'Sedan', '2012', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(148, 'Model S', 'Sedan', '2017', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(149, 'Model S', 'Sedan', '2016', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(150, 'Model S', 'Sedan', '2018', '2022-08-19 18:20:50', '2022-08-19 18:20:50', 39),
(151, 'Huracan Evo', 'Coupé et Spyder', '2020', '2022-09-19 09:29:24', '2022-09-19 09:29:24', 28);

-- --------------------------------------------------------

--
-- Structure de la table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `options`
--

INSERT INTO `options` (`id`, `label`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'GPS', 'assets/img/svg/gps.svg', NULL, NULL),
(2, 'Bluetooth', 'assets/img/svg/bluetooth.svg', NULL, NULL),
(3, ' Port USB', 'assets/img/svg/usb.svg', NULL, NULL),
(4, 'Sièges chauffants', 'assets/img/svg/siege.svg', NULL, NULL),
(5, 'Caméra de recul', 'assets/img/svg/camera.svg', NULL, NULL),
(6, 'Sunroof/Moonroof', 'assets/img/svg/cabriolet.svg', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorizing_merchant_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` date DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_security_deposit` tinyint(1) DEFAULT NULL,
  `security_deposit_amount` decimal(8,2) DEFAULT NULL,
  `client_fee` decimal(8,2) DEFAULT NULL,
  `reservation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `payment_status` enum('Deposit Received','Deposit Returned','Validated','Pending','Amount Received','Amount Returned','Operation Failed') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `is_cash_out` tinyint(1) DEFAULT NULL,
  `cashout_status` enum('Pending','Validated','Declined','Operation Failed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash_id` bigint(20) UNSIGNED DEFAULT NULL,
  `host_fee` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payments`
--

INSERT INTO `payments` (`id`, `transaction_id`, `authorizing_merchant_id`, `amount`, `message`, `auth_code`, `order_number`, `type`, `created`, `payment_method`, `is_security_deposit`, `security_deposit_amount`, `client_fee`, `reservation_id`, `created_at`, `updated_at`, `is_approved`, `payment_status`, `is_cash_out`, `cashout_status`, `cash_id`, `host_fee`) VALUES
(5, '10000274', '383610961', '305.66', 'Approved', 'TEST', '10000242', 'PA1', '2022-09-01', 'CC', 0, NULL, '4.99', 2, '2022-09-01 13:43:14', '2022-09-01 13:43:14', 1, 'Pending', NULL, NULL, 0, NULL),
(6, '10000275', '383610961', '305.66', 'Approved', 'TEST', '10000242', 'PA2', '2022-09-01', 'CC', 1, '500.00', '4.99', 2, '2022-09-01 13:43:15', '2022-09-01 13:43:15', 1, 'Pending', NULL, NULL, 0, NULL),
(10, '10000283', '383610961', '196.99', 'Approved', 'TEST', '10000244', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 4, '2022-09-02 05:46:43', '2022-09-02 05:46:43', 1, 'Pending', NULL, NULL, 0, NULL),
(11, '10000284', '383610961', '196.99', 'Approved', 'TEST', '10000245', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 4, '2022-09-02 05:46:45', '2022-09-02 05:46:45', 1, 'Pending', NULL, NULL, 0, NULL),
(12, '10000285', '383610961', '196.99', 'Approved', 'TEST', '10000246', 'PAC1', '2022-09-02', 'CC', 0, NULL, NULL, 4, '2022-09-02 05:47:59', '2022-09-02 05:47:59', 1, 'Pending', NULL, NULL, 0, NULL),
(13, '10000319', '383610961', '504.79', 'Approved', 'TEST', '10000248', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 6, '2022-09-02 07:17:51', '2022-09-02 07:17:51', 1, 'Pending', NULL, NULL, 0, NULL),
(14, '10000320', '383610961', '504.79', 'Approved', 'TEST', '10000249', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 6, '2022-09-02 07:17:53', '2022-09-02 07:17:53', 1, 'Pending', NULL, NULL, 0, NULL),
(15, '10000322', '383610961', '553.79', 'Approved', 'TEST', '10000250', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 5, '2022-09-02 07:25:57', '2022-09-02 07:25:57', 1, 'Pending', NULL, NULL, 0, NULL),
(16, '10000323', '383610961', '553.79', 'Approved', 'TEST', '10000251', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 5, '2022-09-02 07:25:58', '2022-09-02 07:25:58', 1, 'Pending', NULL, NULL, 0, NULL),
(17, '10000324', '383610961', '553.79', 'Approved', 'TEST', '10000251', 'PAC1', '2022-09-02', 'CC', 0, NULL, NULL, 5, '2022-09-02 07:27:00', '2022-09-02 07:27:00', 1, 'Pending', NULL, NULL, 0, NULL),
(18, '10000329', '383610961', '356.79', 'Approved', 'TEST', '10000252', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 7, '2022-09-02 07:36:44', '2022-09-02 07:36:44', 1, 'Pending', NULL, NULL, 0, NULL),
(19, '10000330', '383610961', '356.79', 'Approved', 'TEST', '10000253', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 7, '2022-09-02 07:36:45', '2022-09-02 07:36:45', 1, 'Pending', NULL, NULL, 0, NULL),
(20, '10000331', '383610961', '356.79', 'Approved', 'TEST', '10000254', 'PAC1', '2022-09-02', 'CC', 0, NULL, NULL, 7, '2022-09-02 07:37:22', '2022-09-02 07:37:22', 1, 'Pending', NULL, NULL, 0, NULL),
(21, '10000338', '383610961', '356.79', 'Approved', 'TEST', '10000255', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 8, '2022-09-02 08:17:12', '2022-09-02 08:17:12', 1, 'Pending', NULL, NULL, 0, NULL),
(22, '10000339', '383610961', '356.79', 'Approved', 'TEST', '10000256', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 8, '2022-09-02 08:17:14', '2022-09-02 08:17:14', 1, 'Pending', NULL, NULL, 0, NULL),
(23, '10000340', '383610961', '356.79', 'Approved', 'TEST', '10000257', 'PAC1', '2022-09-02', 'CC', 0, NULL, NULL, 8, '2022-09-02 08:17:22', '2022-09-02 08:17:22', 1, 'Pending', NULL, NULL, 0, NULL),
(24, '10000341', '383610961', NULL, 'Approved', 'TEST', '10000258', 'PAC2', '2022-09-02', 'CC', 1, NULL, NULL, 8, '2022-09-02 08:17:31', '2022-09-02 08:17:31', 1, 'Pending', NULL, NULL, 0, NULL),
(26, '10000347', '383610961', '500.00', 'Approved', 'TEST', '10000260', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 9, '2022-09-02 08:28:44', '2022-09-02 08:28:44', 1, 'Pending', NULL, NULL, 0, NULL),
(27, '10000348', '383610961', '500.00', 'Approved', 'TEST', '10000261', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 9, '2022-09-02 08:28:45', '2022-09-02 08:28:45', 1, 'Pending', NULL, NULL, 0, NULL),
(28, '10000352', '383610961', '500.00', 'Approved', 'TEST', '10000262', 'PAC1', '2022-09-02', 'CC', 0, NULL, NULL, 9, '2022-09-02 08:30:39', '2022-09-02 08:30:39', 1, 'Pending', NULL, NULL, 0, NULL),
(29, '10000353', '383610961', '0.00', 'Approved', 'TEST', '10000263', 'PAC2', '2022-09-02', 'CC', 1, '0.00', '4.99', 9, '2022-09-02 08:31:02', '2022-09-02 08:31:02', 1, 'Pending', NULL, NULL, 0, NULL),
(30, '10000357', '383610961', '369.90', 'Approved', 'TEST', '10000264', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 10, '2022-09-02 08:37:29', '2022-09-02 08:37:29', 1, 'Pending', NULL, NULL, 0, NULL),
(31, '10000358', '383610961', '369.90', 'Approved', 'TEST', '10000265', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 10, '2022-09-02 08:37:30', '2022-09-02 08:37:30', 1, 'Pending', NULL, NULL, 0, NULL),
(32, '10000359', '383610961', '500.00', 'Approved', 'TEST', '10000266', 'PAC2', '2022-09-02', 'CC', 1, '500.00', '4.99', 10, '2022-09-02 08:37:39', '2022-09-02 08:37:39', 1, 'Pending', NULL, NULL, 0, NULL),
(33, '10000361', '383610961', '369.90', 'Approved', 'TEST', '10000267', 'PAC1', '2022-09-02', 'CC', 0, NULL, NULL, 10, '2022-09-02 08:38:49', '2022-09-02 08:38:49', 1, 'Pending', NULL, NULL, 0, NULL),
(34, '10000364', '383610961', '500.00', 'Approved', 'TEST', '10000268', 'R', '2022-09-02', 'CC', 1, '0.00', '4.99', 10, '2022-09-02 08:42:11', '2022-09-02 08:42:11', 1, 'Pending', NULL, NULL, 0, NULL),
(35, '10000367', '383610961', '36.99', 'Approved', 'TEST', '10000269', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 11, '2022-09-02 08:52:36', '2022-09-02 08:52:36', 1, 'Pending', NULL, NULL, 0, NULL),
(36, '10000368', '383610961', '36.99', 'Approved', 'TEST', '10000270', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 11, '2022-09-02 08:52:37', '2022-09-02 08:52:37', 1, 'Pending', NULL, NULL, 0, NULL),
(37, '10000369', '383610961', '36.99', 'Approved', 'TEST', '10000271', 'PAC1', '2022-09-02', 'CC', 0, NULL, NULL, 11, '2022-09-02 08:52:48', '2022-09-02 08:52:48', 1, 'Pending', NULL, NULL, 0, NULL),
(38, '10000370', '383610961', '500.00', 'Approved', 'TEST', '10000272', 'PAC2', '2022-09-02', 'CC', 1, '500.00', '4.99', 11, '2022-09-02 08:53:00', '2022-09-02 08:53:00', 1, 'Pending', NULL, NULL, 0, NULL),
(39, '10000373', '383610961', '500.00', 'Approved', 'TEST', '10000273', 'VR2', '2022-09-02', 'CC', 1, '500.00', '4.99', 11, '2022-09-02 08:57:20', '2022-09-02 08:57:20', 1, 'Pending', NULL, NULL, 0, NULL),
(40, '10000374', '383610961', '60.99', 'Approved', 'TEST', '10000274', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 12, '2022-09-02 09:10:45', '2022-09-02 09:10:45', 1, 'Pending', NULL, NULL, 0, NULL),
(41, '10000375', '383610961', '60.99', 'Approved', 'TEST', '10000275', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 12, '2022-09-02 09:10:46', '2022-09-02 09:10:46', 1, 'Pending', NULL, NULL, 0, NULL),
(42, '10000376', '383610961', '500.00', 'Approved', 'TEST', '10000276', 'PAC2', '2022-09-02', 'CC', 1, '500.00', '4.99', 12, '2022-09-02 09:12:44', '2022-09-02 09:12:44', 1, 'Pending', NULL, NULL, 0, NULL),
(43, '10000377', '383610961', '350.00', 'Approved', 'TEST', '10000276', 'R', '2022-09-02', 'CC', 1, '500.00', '4.99', 12, '2022-09-02 09:12:45', '2022-09-02 09:12:45', 1, 'Pending', NULL, NULL, 0, NULL),
(44, '10000378', '383610961', '60.99', 'Approved', 'TEST', '10000277', 'PAC1', '2022-09-02', 'CC', 0, '500.00', NULL, 12, '2022-09-02 09:13:31', '2022-09-02 09:13:31', 1, 'Pending', NULL, NULL, 0, NULL),
(45, '10000379', '383610961', '36.99', 'Approved', 'TEST', '10000278', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 13, '2022-09-02 10:29:19', '2022-09-02 10:29:19', 1, 'Pending', NULL, NULL, 0, NULL),
(46, '10000380', '383610961', '36.99', 'Approved', 'TEST', '10000279', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 13, '2022-09-02 10:29:20', '2022-09-02 10:29:20', 1, 'Pending', NULL, NULL, 0, NULL),
(47, '10000381', '383610961', '36.99', 'Approved', 'TEST', '10000280', 'PAC1', '2022-09-02', 'CC', 0, '500.00', NULL, 13, '2022-09-02 10:32:19', '2022-09-02 10:32:19', 1, 'Pending', NULL, NULL, 0, NULL),
(51, '10000387', '383610961', '50.97', 'Approved', 'TEST', '10000281', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 15, '2022-09-02 11:39:49', '2022-09-02 11:39:49', 1, 'Pending', NULL, NULL, 0, NULL),
(52, '10000389', '383610961', '65.94', 'Approved', 'TEST', '10000282', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 15, '2022-09-02 11:40:06', '2022-09-02 11:40:06', 1, 'Pending', NULL, NULL, 0, NULL),
(53, '10000390', '383610961', '65.94', 'Approved', 'TEST', '10000283', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 15, '2022-09-02 11:40:08', '2022-09-02 11:40:08', 1, 'Pending', NULL, NULL, 0, NULL),
(54, '10000391', '383610961', '0.00', 'Approved', 'TEST', '10000284', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 16, '2022-09-02 11:40:35', '2022-09-02 11:40:35', 1, 'Pending', NULL, NULL, 0, NULL),
(55, '10000392', '383610961', '0.00', 'Approved', 'TEST', '10000285', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 16, '2022-09-02 11:40:37', '2022-09-02 11:40:37', 1, 'Pending', NULL, NULL, 0, NULL),
(56, '10000393', '383610961', '211.47', 'Approved', 'TEST', '10000286', 'PA1', '2022-09-02', 'CC', 0, NULL, '4.99', 17, '2022-09-02 11:42:34', '2022-09-02 11:42:34', 1, 'Pending', NULL, NULL, 0, NULL),
(57, '10000394', '383610961', '211.47', 'Approved', 'TEST', '10000287', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 17, '2022-09-02 11:42:36', '2022-09-02 11:42:36', 1, 'Pending', NULL, NULL, 0, NULL),
(58, '10000395', '383610961', NULL, 'Approved', 'TEST', '10000286', 'PAC1', '2022-09-02', 'CC', 1, NULL, '4.99', 17, '2022-09-02 11:43:20', '2022-09-02 11:43:20', 1, 'Pending', NULL, NULL, 0, NULL),
(60, '10000409', '383610961', '305.66', 'Approved', 'TEST', '10000242', 'PAC1', '2022-09-02', 'CC', 1, NULL, '4.99', 2, '2022-09-02 11:59:00', '2022-09-02 11:59:00', 1, 'Pending', NULL, NULL, 0, NULL),
(61, '10000415', '383610961', '211.47', 'Approved', 'TEST', '10000286', 'PAC1', '2022-09-02', 'CC', 1, NULL, '4.99', 17, '2022-09-02 12:04:20', '2022-09-02 12:04:20', 1, 'Pending', NULL, NULL, 0, NULL),
(62, '10000418', '383610961', '70.49', 'Approved', 'TEST', '10000287', 'PA1', '2022-09-02', 'CC', 0, '500.00', '4.99', 18, '2022-09-02 12:16:37', '2022-09-02 12:16:37', 1, 'Pending', NULL, NULL, 0, NULL),
(63, '10000419', '383610961', '70.49', 'Approved', 'TEST', '10000288', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 18, '2022-09-02 12:16:38', '2022-09-02 12:16:38', 1, 'Pending', NULL, NULL, 0, NULL),
(64, '10000420', '383610961', '70.49', 'Approved', 'TEST', '10000289', 'PA1', '2022-09-02', 'CC', 0, '500.00', '4.99', 19, '2022-09-02 12:19:28', '2022-09-02 12:19:28', 1, 'Pending', NULL, NULL, 0, NULL),
(65, '10000421', '383610961', '70.49', 'Approved', 'TEST', '10000290', 'PA2', '2022-09-02', 'CC', 1, '500.00', '4.99', 19, '2022-09-02 12:19:30', '2022-09-02 12:19:30', 1, 'Pending', NULL, NULL, 0, NULL),
(66, '10000422', '383610961', '70.49', 'Approved', 'TEST', '10000289', 'PAC1', '2022-09-02', 'CC', 1, '500.00', '4.99', 19, '2022-09-02 12:19:41', '2022-09-02 12:19:41', 1, 'Pending', NULL, NULL, 0, NULL),
(67, '10000423', '383610961', '70.49', 'Approved', 'TEST', '10000289', 'VR1', '2022-09-02', 'CC', 1, '500.00', '4.99', 19, '2022-09-02 12:19:43', '2022-09-02 12:19:43', 1, 'Pending', NULL, NULL, 0, NULL),
(68, '10000424', '383610961', '500.00', 'Approved', 'TEST', '10000290', 'PAC2', '2022-09-02', 'CC', 1, '500.00', '4.99', 19, '2022-09-02 12:19:44', '2022-09-02 12:19:44', 1, 'Pending', NULL, NULL, 0, NULL),
(69, '10000425', '383610961', '500.00', 'Approved', 'TEST', '10000290', 'VR2', '2022-09-02', 'CC', 1, '500.00', '4.99', 19, '2022-09-02 12:19:46', '2022-09-02 12:19:46', 1, 'Pending', NULL, NULL, 0, NULL),
(70, '10000426', '383610961', '70.49', 'Approved', 'TEST', '10000287', 'PAC1', '2022-09-02', 'CC', 1, '500.00', '4.99', 18, '2022-09-02 12:20:49', '2022-09-02 12:20:49', 1, 'Pending', NULL, NULL, 0, NULL),
(71, '10000427', '383610961', '70.49', 'Approved', 'TEST', '10000287', 'VR1', '2022-09-02', 'CC', 1, '500.00', '4.99', 18, '2022-09-02 12:20:50', '2022-09-02 12:20:50', 1, 'Pending', NULL, NULL, 0, NULL),
(72, '10000428', '383610961', '500.00', 'Approved', 'TEST', '10000288', 'PAC2', '2022-09-02', 'CC', 1, '500.00', '4.99', 18, '2022-09-02 12:20:51', '2022-09-02 12:20:51', 1, 'Pending', NULL, NULL, 0, NULL),
(73, '10000429', '383610961', '500.00', 'Approved', 'TEST', '10000288', 'VR2', '2022-09-02', 'CC', 1, '500.00', '4.99', 18, '2022-09-02 12:20:53', '2022-09-02 12:20:53', 1, 'Pending', NULL, NULL, 0, NULL),
(74, '10000432', '383610961', '500.00', 'Approved', 'TEST', '10000289', 'PAC2', '2022-09-02', 'CC', 1, '500.00', '4.99', 10, '2022-09-03 04:51:47', '2022-09-03 04:51:47', 1, 'Pending', NULL, NULL, 0, NULL),
(75, '10000435', '383610961', '406.97', 'Approved', 'TEST', '10000290', 'PA1', '2022-09-05', 'CC', 0, '500.00', '4.99', 20, '2022-09-05 17:52:19', '2022-09-05 17:52:19', 1, 'Pending', NULL, NULL, 0, NULL),
(76, '10000436', '383610961', '406.97', 'Approved', 'TEST', '10000291', 'PA2', '2022-09-05', 'CC', 1, '500.00', '4.99', 20, '2022-09-05 17:52:19', '2022-09-05 17:52:19', 1, 'Pending', NULL, NULL, 0, NULL),
(77, '10000437', '383610961', '46.97', 'Approved', 'TEST', '10000291', 'PA1', '2022-09-05', 'CC', 0, '500.00', '4.99', 21, '2022-09-05 18:04:38', '2022-09-05 18:04:38', 1, 'Pending', NULL, NULL, 0, NULL),
(78, '10000438', '383610961', '46.97', 'Approved', 'TEST', '10000292', 'PA2', '2022-09-05', 'CC', 1, '500.00', '4.99', 21, '2022-09-05 18:04:38', '2022-09-05 18:04:38', 1, 'Pending', NULL, NULL, 0, NULL),
(79, '10000439', '383610961', '46.97', 'Approved', 'TEST', '10000292', 'PAC1', '2022-09-05', 'CC', 0, '500.00', NULL, 21, '2022-09-05 18:04:55', '2022-09-05 18:04:55', 1, 'Pending', NULL, NULL, 0, NULL),
(80, '10000440', '383610961', '46.97', 'Approved', 'TEST', '10000293', 'PA1', '2022-09-05', 'CC', 0, '500.00', '4.99', 22, '2022-09-05 18:09:52', '2022-09-05 18:09:52', 1, 'Pending', NULL, NULL, 0, NULL),
(81, '10000441', '383610961', '46.97', 'Approved', 'TEST', '10000294', 'PA2', '2022-09-05', 'CC', 1, '500.00', '4.99', 22, '2022-09-05 18:09:53', '2022-09-05 18:09:53', 1, 'Pending', NULL, NULL, 0, NULL),
(82, '10000447', '383610961', '46.97', 'Approved', 'TEST', '10000295', 'PAC1', '2022-09-05', 'CC', 0, '500.00', NULL, 22, '2022-09-05 18:14:53', '2022-09-05 18:14:53', 1, 'Pending', NULL, NULL, 0, NULL),
(86, '10000452', '383610961', '406.97', 'Approved', 'TEST', '10000299', 'PAC1', '2022-09-08', 'CC', 0, '500.00', NULL, 20, '2022-09-08 16:00:58', '2022-09-08 16:00:58', 1, 'Pending', NULL, NULL, 0, NULL),
(87, '10000459', '383610961', '406.97', 'Approved', 'TEST', '10000300', 'PAC1', '2022-09-08', 'CC', 0, '500.00', NULL, 20, '2022-09-08 17:13:55', '2022-09-08 17:13:55', 1, 'Pending', NULL, NULL, 0, NULL),
(101, '10000508', '383610961', '182.97', 'Approved', 'TEST', '10000497', 'PA1', '2022-09-13', 'CC', 0, '500.00', '4.99', 24, '2022-09-13 08:43:29', '2022-09-13 08:43:29', 1, 'Pending', NULL, NULL, 0, NULL),
(102, '10000509', '383610961', '182.97', 'Approved', 'TEST', '10000498', 'PA2', '2022-09-13', 'CC', 1, '500.00', '4.99', 24, '2022-09-13 08:43:30', '2022-09-13 08:43:30', 1, 'Pending', NULL, NULL, 0, NULL),
(110, '10000515', '383610961', '424.18', 'Approved', 'TEST', '10000504', 'PA1', '2022-09-13', 'CC', 0, '500.00', '4.99', 23, '2022-09-13 09:02:18', '2022-09-13 09:02:18', 1, 'Pending', NULL, NULL, 0, NULL),
(111, '10000516', '383610961', '424.18', 'Approved', 'TEST', '10000505', 'PA2', '2022-09-13', 'CC', 1, '500.00', '4.99', 23, '2022-09-13 09:02:19', '2022-09-13 09:02:19', 1, 'Pending', NULL, NULL, 0, NULL),
(112, '10000517', '383610961', '424.18', 'Approved', 'TEST', '10000504', 'PAC1', '2022-09-13', 'CC', 1, '500.00', '4.99', 23, '2022-09-13 09:02:45', '2022-09-13 09:02:45', 1, 'Amount Received', NULL, NULL, 0, NULL),
(113, '10000518', '383610961', '424.18', 'Approved', 'TEST', '10000504', 'VR1', '2022-09-13', 'CC', 1, '500.00', '4.99', 23, '2022-09-13 09:02:47', '2022-09-13 09:02:47', 1, 'Amount Returned', NULL, NULL, 0, NULL),
(114, '10000519', '383610961', '500.00', 'Approved', 'TEST', '10000505', 'PAC2', '2022-09-13', 'CC', 1, '500.00', '4.99', 23, '2022-09-13 09:02:48', '2022-09-13 09:02:48', 1, '', NULL, NULL, 0, NULL),
(115, '10000520', '383610961', '500.00', 'Approved', 'TEST', '10000505', 'VR2', '2022-09-13', 'CC', 1, '500.00', '4.99', 23, '2022-09-13 09:02:50', '2022-09-13 09:02:50', 1, '', NULL, NULL, 0, NULL),
(119, '10000526', '383610961', '182.97', 'Approved', 'TEST', '10000497', 'PAC1', '2022-09-13', 'CC', 1, '500.00', '4.99', 24, '2022-09-13 10:05:11', '2022-09-13 10:05:11', 1, 'Amount Received', NULL, NULL, 0, NULL),
(120, '10000527', '383610961', '500.00', 'Approved', 'TEST', '10000498', 'PAC2', '2022-09-13', 'CC', 1, '500.00', '4.99', 24, '2022-09-13 10:12:05', '2022-09-13 10:12:05', 1, 'Deposit Received', NULL, NULL, 0, NULL),
(121, '10000528', '383610961', '500.00', 'Approved', 'TEST', '10000498', 'VR2', '2022-09-13', 'CC', 1, '500.00', '4.99', 24, '2022-09-13 10:12:07', '2022-09-13 10:12:07', 1, 'Deposit Returned', NULL, NULL, 0, NULL),
(125, '10000529', '383610961', '207.10', 'Approved', 'TEST', '10000518', 'PA1', '2022-09-13', 'CC', 0, '500.00', '4.99', 3, '2022-09-13 10:19:14', '2022-09-13 10:19:14', 1, 'Pending', NULL, NULL, 0, NULL),
(126, '10000530', '383610961', '207.10', 'Approved', 'TEST', '10000519', 'PA2', '2022-09-13', 'CC', 1, '500.00', '4.99', 3, '2022-09-13 10:19:15', '2022-09-13 10:19:15', 1, 'Pending', NULL, NULL, 0, NULL),
(127, '10000531', '383610961', '207.10', 'Approved', 'TEST', '10000518', 'PAC1', '2022-09-13', 'CC', 0, '500.00', NULL, 3, '2022-09-13 10:19:25', '2022-09-13 10:19:25', 1, 'Amount Received', NULL, NULL, 0, NULL),
(128, '10000532', '383610961', '256.38', 'Approved', 'TEST', '10000521', 'PA1', '2022-09-13', 'CC', 0, '500.00', '4.99', 25, '2022-09-13 10:19:38', '2022-09-13 10:19:38', 1, 'Pending', NULL, NULL, 0, NULL),
(129, '10000533', '383610961', '256.38', 'Approved', 'TEST', '10000522', 'PA2', '2022-09-13', 'CC', 1, '500.00', '4.99', 25, '2022-09-13 10:19:39', '2022-09-13 10:19:39', 1, 'Pending', NULL, NULL, 0, NULL),
(130, '10000534', '383610961', '226.44', 'Approved', 'TEST', '10000523', 'PA1', '2022-09-13', 'CC', 0, '500.00', '4.99', 26, '2022-09-13 10:19:46', '2022-09-13 10:19:46', 1, 'Pending', NULL, NULL, 0, NULL),
(131, '10000535', '383610961', '226.44', 'Approved', 'TEST', '10000524', 'PA2', '2022-09-13', 'CC', 1, '500.00', '4.99', 26, '2022-09-13 10:19:51', '2022-09-13 10:19:51', 1, 'Pending', NULL, NULL, 0, NULL),
(132, '10000536', '383610961', '256.38', 'Approved', 'TEST', '10000521', 'PAC1', '2022-09-13', 'CC', 0, '500.00', NULL, 25, '2022-09-13 10:20:00', '2022-09-13 10:20:00', 1, 'Amount Received', NULL, NULL, 0, NULL),
(133, '10000537', '383610961', '226.44', 'Approved', 'TEST', '10000523', 'PAC1', '2022-09-13', 'CC', 0, '500.00', NULL, 26, '2022-09-13 10:20:07', '2022-09-13 10:20:07', 1, 'Amount Received', NULL, NULL, 0, NULL),
(134, '10000538', '383610961', '500.00', 'Approved', 'TEST', '10000519', 'PAC2', '2022-09-13', 'CC', 1, '500.00', '4.99', 3, '2022-09-13 10:28:07', '2022-09-13 10:28:07', 1, '', NULL, NULL, 0, NULL),
(135, '10000539', '383610961', '500.00', 'Approved', 'TEST', '10000519', 'VR2', '2022-09-13', 'CC', 1, '500.00', '4.99', 3, '2022-09-13 10:28:08', '2022-09-13 10:28:08', 1, '', NULL, NULL, 0, NULL),
(136, '10000540', '383610961', '500.00', 'Approved', 'TEST', '10000522', 'PAC2', '2022-09-13', 'CC', 1, '500.00', '4.99', 25, '2022-09-13 10:28:54', '2022-09-13 10:28:54', 1, '', NULL, NULL, 0, NULL),
(137, '10000541', '383610961', '500.00', 'Approved', 'TEST', '10000522', 'VR2', '2022-09-13', 'CC', 1, '500.00', '4.99', 25, '2022-09-13 10:28:55', '2022-09-13 10:28:55', 1, '', NULL, NULL, 0, NULL),
(138, '10000542', '383610961', '500.00', 'Approved', 'TEST', '10000524', 'PAC2', '2022-09-13', 'CC', 1, '500.00', '4.99', 26, '2022-09-13 10:31:35', '2022-09-13 10:31:35', 1, '', NULL, NULL, 0, NULL),
(139, '10000543', '383610961', '500.00', 'Approved', 'TEST', '10000524', 'VR2', '2022-09-13', 'CC', 1, '500.00', '4.99', 26, '2022-09-13 10:31:36', '2022-09-13 10:31:36', 1, '', NULL, NULL, 0, NULL),
(140, '10000544', '383610961', '211.47', 'Approved', 'TEST', '10000533', 'PA1', '2022-09-13', 'CC', 0, '500.00', '4.99', 28, '2022-09-13 10:37:14', '2022-09-13 10:37:14', 1, 'Pending', NULL, NULL, 0, NULL),
(141, '10000545', '383610961', '211.47', 'Approved', 'TEST', '10000534', 'PA2', '2022-09-13', 'CC', 1, '500.00', '4.99', 28, '2022-09-13 10:37:15', '2022-09-13 10:37:15', 1, 'Pending', NULL, NULL, 0, NULL),
(142, '10000546', '383610961', '70.49', 'Approved', 'TEST', '10000535', 'PA1', '2022-09-13', 'CC', 0, '500.00', '4.99', 29, '2022-09-13 10:41:06', '2022-09-13 10:41:06', 1, 'Pending', NULL, NULL, 0, NULL),
(143, '10000547', '383610961', '70.49', 'Approved', 'TEST', '10000536', 'PA2', '2022-09-13', 'CC', 1, '500.00', '4.99', 29, '2022-09-13 10:41:07', '2022-09-13 10:41:07', 1, 'Pending', NULL, NULL, 0, NULL),
(145, '10000549', '383610961', '211.47', 'Approved', 'TEST', '10000533', 'PAC1', '2022-09-13', 'CC', 0, '500.00', NULL, 28, '2022-09-13 10:41:40', '2022-09-13 10:41:40', 1, 'Amount Received', NULL, NULL, 0, NULL),
(146, '10000550', '383610961', '221.97', 'Approved', 'TEST', '10000539', 'PA1', '2022-09-14', 'CC', 0, '500.00', '4.99', 30, '2022-09-14 11:40:24', '2022-09-14 11:40:24', 1, 'Pending', NULL, NULL, 0, NULL),
(147, '10000551', '383610961', '221.97', 'Approved', 'TEST', '10000540', 'PA2', '2022-09-14', 'CC', 1, '500.00', '4.99', 30, '2022-09-14 11:40:26', '2022-09-14 11:40:26', 1, 'Pending', NULL, NULL, 0, NULL),
(148, '10000552', '383610961', '221.97', 'Approved', 'TEST', '10000539', 'PAC1', '2022-09-14', 'CC', 0, '500.00', NULL, 30, '2022-09-14 11:42:13', '2022-09-14 11:42:13', 1, 'Amount Received', NULL, NULL, 0, NULL),
(149, '10000554', '383610961', '321.88', 'Approved', 'TEST', '10000542', 'PA1', '2022-09-14', 'CC', 0, '500.00', '4.99', 27, '2022-09-14 12:56:27', '2022-09-14 12:56:27', 1, 'Pending', NULL, NULL, 0, NULL),
(150, '10000555', '383610961', '321.88', 'Approved', 'TEST', '10000543', 'PA2', '2022-09-14', 'CC', 1, '500.00', '4.99', 27, '2022-09-14 12:56:28', '2022-09-14 12:56:28', 1, 'Pending', NULL, NULL, 0, NULL),
(151, '10000556', '383610961', '321.88', 'Approved', 'TEST', '10000542', 'PAC1', '2022-09-14', 'CC', 0, '500.00', NULL, 27, '2022-09-14 12:56:40', '2022-09-14 12:56:40', 1, 'Amount Received', NULL, NULL, 0, NULL),
(152, '10000557', '383610961', '500.00', 'Approved', 'TEST', '10000543', 'PAC2', '2022-09-14', 'CC', 1, '500.00', '4.99', 27, '2022-09-14 12:57:12', '2022-09-14 12:57:12', 1, 'Deposit Received', NULL, NULL, 0, NULL),
(153, '10000558', '383610961', '500.00', 'Approved', 'TEST', '10000543', 'VR2', '2022-09-14', 'CC', 1, '500.00', '4.99', 27, '2022-09-14 12:57:13', '2022-09-14 12:57:13', 1, 'Deposit Returned', NULL, NULL, 0, NULL),
(154, '10000559', '383610961', '500.00', 'Approved', 'TEST', '10000540', 'PAC2', '2022-09-14', 'CC', 1, '500.00', '4.99', 30, '2022-09-14 13:22:51', '2022-09-14 13:22:51', 1, 'Deposit Received', NULL, NULL, 0, NULL),
(159, '10000566', '383610961', '577.96', 'Approved', 'TEST', '10000549', 'PA1', '2022-09-14', 'CC', 0, '500.00', '4.99', 1, '2022-09-14 13:31:26', '2022-09-14 13:31:26', 1, 'Pending', NULL, NULL, 0, NULL),
(160, '10000568', '383610961', '587.94', 'Approved', 'TEST', '10000556', 'PA1', '2022-09-14', 'CC', 0, '500.00', '4.99', 1, '2022-09-14 13:31:51', '2022-09-14 13:31:51', 1, 'Pending', NULL, NULL, 0, NULL),
(161, '10000569', '383610961', '587.94', 'Approved', 'TEST', '10000557', 'PA2', '2022-09-14', 'CC', 1, '500.00', '4.99', 1, '2022-09-14 13:31:52', '2022-09-14 13:31:52', 1, 'Pending', NULL, NULL, 0, NULL),
(162, '10000570', '383610961', '577.96', 'Approved', 'TEST', '10000549', 'PAC1', '2022-09-14', 'CC', 0, '500.00', NULL, 1, '2022-09-14 13:31:59', '2022-09-14 13:31:59', 1, 'Amount Received', NULL, NULL, 0, NULL),
(163, '10000571', '383610961', '500.00', 'Approved', 'TEST', '10000557', 'PAC2', '2022-09-14', 'CC', 1, '500.00', '4.99', 1, '2022-09-14 13:42:07', '2022-09-14 13:42:07', 1, 'Deposit Received', NULL, NULL, 0, NULL),
(164, '10000572', '383610961', '500.00', 'Approved', 'TEST', '10000557', 'VR2', '2022-09-14', 'CC', 1, '500.00', '4.99', 1, '2022-09-14 13:42:08', '2022-09-14 13:42:08', 1, 'Deposit Returned', NULL, NULL, 0, NULL),
(165, '10000573', '383610961', '211.47', 'Approved', 'TEST', '10000562', 'PA1', '2022-09-14', 'CC', 0, '500.00', '4.99', 31, '2022-09-14 13:44:30', '2022-09-14 13:44:30', 1, 'Pending', NULL, NULL, 0, NULL),
(166, '10000574', '383610961', '211.47', 'Approved', 'TEST', '10000563', 'PA2', '2022-09-14', 'CC', 1, '500.00', '4.99', 31, '2022-09-14 13:44:31', '2022-09-14 13:44:31', 1, 'Pending', NULL, NULL, 0, NULL),
(167, '10000575', '383610961', '211.47', 'Approved', 'TEST', '10000562', 'PAC1', '2022-09-14', 'CC', 0, '500.00', NULL, 31, '2022-09-14 13:45:32', '2022-09-14 13:45:32', 1, 'Amount Received', NULL, NULL, 0, NULL),
(168, '10000576', '383610961', '500.00', 'Approved', 'TEST', '10000563', 'PAC2', '2022-09-14', 'CC', 1, '500.00', '4.99', 31, '2022-09-14 13:45:46', '2022-09-14 13:45:46', 1, 'Deposit Received', NULL, NULL, 0, NULL),
(169, '10000577', '383610961', '500.00', 'Approved', 'TEST', '10000563', 'VR2', '2022-09-14', 'CC', 1, '500.00', '4.99', 31, '2022-09-14 13:45:48', '2022-09-14 13:45:48', 1, 'Deposit Returned', NULL, NULL, 0, NULL),
(170, '10000578', '383610961', '500.00', 'Approved', 'TEST', '10000534', 'PAC2', '2022-09-14', 'CC', 1, '500.00', '4.99', 28, '2022-09-14 13:45:56', '2022-09-14 13:45:56', 1, 'Deposit Received', NULL, NULL, 0, NULL),
(171, '10000579', '383610961', '500.00', 'Approved', 'TEST', '10000534', 'VR2', '2022-09-14', 'CC', 1, '500.00', '4.99', 28, '2022-09-14 13:45:57', '2022-09-14 13:45:57', 1, 'Deposit Returned', NULL, NULL, 0, NULL),
(172, '10000580', '383610961', '70.49', 'Approved', 'TEST', '10000535', 'PAC1', '2022-09-14', 'CC', 0, '500.00', NULL, 29, '2022-09-14 13:46:15', '2022-09-14 13:46:15', 1, 'Amount Received', NULL, NULL, 0, NULL),
(173, '10000581', '383610961', '500.00', 'Approved', 'TEST', '10000536', 'PAC2', '2022-09-14', 'CC', 1, '500.00', '4.99', 29, '2022-09-14 13:46:54', '2022-09-14 13:46:54', 1, 'Deposit Received', NULL, NULL, 0, NULL),
(174, '10000582', '383610961', '269.97', 'Approved', 'TEST', '10000571', 'PA1', '2022-09-19', 'CC', 0, '500.00', '4.99', 32, '2022-09-19 07:46:57', '2022-09-19 07:46:57', 1, 'Pending', NULL, NULL, 0, NULL),
(175, '10000583', '383610961', '269.97', 'Approved', 'TEST', '10000572', 'PA2', '2022-09-19', 'CC', 1, '500.00', '4.99', 32, '2022-09-19 07:46:59', '2022-09-19 07:46:59', 1, 'Pending', NULL, NULL, 0, NULL),
(176, '10000584', '383610961', '269.97', 'Approved', 'TEST', '10000571', 'PAC1', '2022-09-19', 'CC', 0, '500.00', NULL, 32, '2022-09-19 07:47:55', '2022-09-19 07:47:55', 1, 'Amount Received', NULL, NULL, 0, NULL),
(177, '10000585', '383610961', '500.00', 'Approved', 'TEST', '10000572', 'PAC2', '2022-09-19', 'CC', 1, '500.00', '4.99', 32, '2022-09-19 08:20:51', '2022-09-19 08:20:51', 1, 'Deposit Received', NULL, NULL, 0, NULL),
(178, '10000586', '383610961', '500.00', 'Approved', 'TEST', '10000572', 'VR2', '2022-09-19', 'CC', 1, '500.00', '4.99', 32, '2022-09-19 08:20:53', '2022-09-19 08:20:53', 1, 'Deposit Returned', NULL, NULL, 0, NULL),
(179, '10000587', '383610961', '269.97', 'Approved', 'TEST', '10000576', 'PA1', '2022-09-19', 'CC', 0, '500.00', '4.99', 33, '2022-09-19 08:22:58', '2022-09-19 08:22:58', 1, 'Pending', NULL, NULL, 0, NULL),
(180, '10000588', '383610961', '269.97', 'Approved', 'TEST', '10000577', 'PA2', '2022-09-19', 'CC', 1, '500.00', '4.99', 33, '2022-09-19 08:22:59', '2022-09-19 08:22:59', 1, 'Pending', NULL, NULL, 0, NULL),
(181, '10000589', '383610961', '269.97', 'Approved', 'TEST', '10000576', 'PAC1', '2022-09-19', 'CC', 0, '500.00', NULL, 33, '2022-09-19 08:23:12', '2022-09-19 08:23:12', 1, 'Amount Received', NULL, NULL, 0, NULL),
(182, '10000590', '383610961', '500.00', 'Approved', 'TEST', '10000577', 'PAC2', '2022-09-19', 'CC', 1, '500.00', '4.99', 33, '2022-09-19 08:23:25', '2022-09-19 08:23:25', 1, 'Deposit Received', NULL, NULL, 0, NULL),
(183, '10000591', '383610961', '500.00', 'Approved', 'TEST', '10000577', 'VR2', '2022-09-19', 'CC', 1, '500.00', '4.99', 33, '2022-09-19 08:23:26', '2022-09-19 08:23:26', 1, 'Deposit Returned', NULL, NULL, 0, NULL),
(184, '10000592', '383610961', '179.98', 'Approved', 'TEST', '10000581', 'PA1', '2022-09-19', 'CC', 0, '500.00', '4.99', 34, '2022-09-19 09:21:59', '2022-09-19 09:21:59', 1, 'Pending', NULL, NULL, 0, NULL),
(185, '10000593', '383610961', '179.98', 'Approved', 'TEST', '10000582', 'PA2', '2022-09-19', 'CC', 1, '500.00', '4.99', 34, '2022-09-19 09:22:00', '2022-09-19 09:22:00', 1, 'Pending', NULL, NULL, 0, NULL),
(186, '10000594', '383610961', '179.98', 'Approved', 'TEST', '10000581', 'PAC1', '2022-09-19', 'CC', 0, '500.00', NULL, 34, '2022-09-19 09:22:15', '2022-09-19 09:22:15', 1, 'Amount Received', NULL, NULL, 0, NULL),
(187, '10000595', '383610961', '500.00', 'Approved', 'TEST', '10000582', 'PAC2', '2022-09-19', 'CC', 1, '500.00', '4.99', 34, '2022-09-19 09:22:22', '2022-09-19 09:22:22', 1, 'Deposit Received', NULL, NULL, 0, NULL),
(188, '10000596', '383610961', '500.00', 'Approved', 'TEST', '10000582', 'VR2', '2022-09-19', 'CC', 1, '500.00', '4.99', 34, '2022-09-19 09:22:24', '2022-09-19 09:22:24', 1, 'Deposit Returned', NULL, NULL, 0, NULL),
(197, '10000605', '383610961', '20.00', 'Approved', 'TEST', '10000594', 'PA1', '2022-09-19', 'CC', NULL, NULL, '4.99', NULL, '2022-09-19 11:00:44', '2022-09-19 11:00:44', 1, 'Pending', 1, 'Validated', 2, NULL),
(198, '10000606', '383610961', '20.00', 'Approved', 'TEST', '10000594', 'PAC1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:00:47', '2022-09-19 11:00:47', 1, 'Pending', 1, 'Validated', 2, NULL),
(199, '10000607', '383610961', '10.00', 'Approved', 'TEST', '10000596', 'PA1', '2022-09-19', 'CC', NULL, NULL, '4.99', NULL, '2022-09-19 11:01:56', '2022-09-19 11:01:56', 1, 'Pending', 1, 'Validated', 1, NULL),
(200, '10000608', '383610961', '10.00', 'Approved', 'TEST', '10000596', 'PAC1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:01:58', '2022-09-19 11:01:58', 1, 'Pending', 1, 'Validated', 1, NULL),
(201, '10000609', '383610961', '200.00', 'Approved', 'TEST', '10000598', 'PA1', '2022-09-19', 'CC', NULL, NULL, '4.99', NULL, '2022-09-19 11:10:48', '2022-09-19 11:10:48', 1, 'Pending', 1, 'Validated', 3, NULL),
(202, '10000610', '383610961', '200.00', 'Approved', 'TEST', '10000598', 'PAC1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:10:50', '2022-09-19 11:10:50', 1, 'Pending', 1, 'Validated', 3, NULL),
(203, '10000611', '383610961', '92.09', 'Approved', 'TEST', '10000600', 'PA1', '2022-09-19', 'CC', NULL, NULL, '4.99', NULL, '2022-09-19 11:27:18', '2022-09-19 11:27:18', 1, 'Pending', 1, 'Validated', 4, NULL),
(204, '10000612', '383610961', '92.09', 'Approved', 'TEST', '10000600', 'PAC1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:27:21', '2022-09-19 11:27:21', 1, 'Pending', 1, 'Validated', 4, NULL),
(205, '10000613', '383610961', '10.00', 'Approved', 'TEST', '10000602', 'PA1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:51:19', '2022-09-19 11:51:19', 1, 'Pending', 1, 'Validated', 5, '90.00'),
(206, '10000615', '383610961', '10.00', 'Approved', 'TEST', '10000603', 'PA1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:51:45', '2022-09-19 11:51:45', 1, 'Pending', 1, 'Validated', 5, '90.00'),
(207, '10000617', '383610961', '10.00', 'Approved', 'TEST', '10000605', 'PA1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:52:31', '2022-09-19 11:52:31', 1, 'Pending', 1, 'Validated', 6, '90.00'),
(208, '10000619', '383610961', '10.00', 'Approved', 'TEST', '10000607', 'PA1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:54:00', '2022-09-19 11:54:00', 1, 'Pending', 1, 'Validated', 5, '90.00'),
(209, '10000621', '383610961', '10.00', 'Approved', 'TEST', '10000609', 'PA1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:54:12', '2022-09-19 11:54:12', 1, 'Pending', 1, 'Validated', 6, '90.00'),
(210, '10000623', '383610961', '10.00', 'Approved', 'TEST', '10000611', 'PA1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:54:31', '2022-09-19 11:54:31', 1, 'Pending', 1, 'Validated', 6, '90.00'),
(212, '10000627', '383610961', '135.00', 'Approved', 'TEST', '10000615', 'PA1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:55:51', '2022-09-19 11:55:51', 1, 'Pending', 1, 'Validated', 7, '15.00'),
(213, '10000628', '383610961', '135.00', 'Approved', 'TEST', '10000615', 'PAC1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 11:55:53', '2022-09-19 11:55:53', 1, 'Pending', 1, 'Validated', 7, '135.00'),
(214, '10000629', '383610961', '90.00', 'Approved', 'TEST', '10000618', 'PA1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 12:02:03', '2022-09-19 12:02:03', 1, 'Pending', 1, 'Validated', 5, '10.00'),
(215, '10000630', '383610961', '90.00', 'Approved', 'TEST', '10000618', 'PAC1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 12:02:06', '2022-09-19 12:02:06', 1, 'Pending', 1, 'Validated', 5, '10.00'),
(216, '10000631', '383610961', '90.00', 'Approved', 'TEST', '10000620', 'PA1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 12:04:04', '2022-09-19 12:04:04', 1, 'Pending', 1, 'Validated', 6, '10.00'),
(217, '10000632', '383610961', '90.00', 'Approved', 'TEST', '10000620', 'PAC1', '2022-09-19', 'CC', NULL, NULL, NULL, NULL, '2022-09-19 12:04:06', '2022-09-19 12:04:06', 1, 'Pending', 1, 'Validated', 6, '10.00');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_status` enum('Pending','Approved','Declined','Done','Demande Dispute','Deposit Collected','Deposit Returned Back') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `amount`, `start`, `end`, `period`, `days`, `hours`, `customer_id`, `booking_title`, `booking_status`, `created_at`, `updated_at`) VALUES
(1, 587.94, '2022-07-04 17:41:11', '2022-07-06 20:41:11', '2 Jour(s)', 2, 0, '11', 'Porsche 911 Coupe, Convertible 2001', 'Deposit Returned Back', '2022-09-01 08:08:15', '2022-09-14 13:42:08'),
(2, 295.68, '2022-07-04 17:41:11', '2022-07-06 20:41:11', '2 Jour(s)', 2, 0, '12', 'BMW M4 sedan 2020', 'Declined', '2022-09-01 13:43:04', '2022-09-02 11:59:00'),
(3, 207.10, '2022-07-07 17:41:11', '2022-07-08 20:41:11', '1 Jour(s)', 1, 0, '12', 'BMW M4 sedan 2020', 'Done', '2022-09-01 13:44:39', '2022-09-13 10:28:08'),
(4, 192.00, '2022-07-07 17:41:11', '2022-07-08 20:41:11', '1 Jour(s)', 1, 0, '9', 'BMW M4 sedan 2020', 'Pending', '2022-09-02 05:46:17', '2022-09-02 05:46:17'),
(5, 553.79, '2022-07-08 23:41:11', '2022-07-09 20:41:11', '21 Heure(s)', 0, 21, '9', 'BMW M4 sedan 2020', 'Pending', '2022-09-02 06:00:27', '2022-09-02 07:25:57'),
(6, 504.79, '2022-07-08 23:41:11', '2022-07-09 20:41:11', '21 Heure(s)', 0, 21, '9', 'Porsche 911 Coupe, Convertible 2001', 'Pending', '2022-09-02 07:06:45', '2022-09-02 07:17:51'),
(7, 356.79, '2022-07-08 23:41:11', '2022-07-09 20:41:11', '21 Heure(s)', 0, 21, '13', 'Bentley Azure Convertible 2007', 'Pending', '2022-09-02 07:36:26', '2022-09-02 07:36:44'),
(8, 356.79, '2022-07-09 23:41:11', '2022-07-10 20:41:11', '21 Heure(s)', 0, 21, '13', 'Bentley Azure Convertible 2007', 'Approved', '2022-09-02 08:16:51', '2022-09-02 08:17:31'),
(9, 500.00, '2022-07-09 23:41:11', '2022-07-10 20:41:11', '21 Heure(s)', 0, 21, '13', 'Dodge Charger Sedan 2019', 'Demande Dispute', '2022-09-02 08:28:24', '2022-09-03 04:20:12'),
(10, 369.90, '2022-07-11 03:41:11', '2022-07-11 13:41:11', '10 Heure(s)', 0, 10, '13', 'Dodge Charger Sedan 2019', 'Demande Dispute', '2022-09-02 08:36:14', '2022-09-02 08:37:39'),
(11, 36.99, '2022-07-11 14:41:11', '2022-07-11 15:41:11', '1 Heure(s)', 0, 1, '5', 'Dodge Charger Sedan 2019', 'Demande Dispute', '2022-09-02 08:52:20', '2022-09-15 11:05:10'),
(12, 60.99, '2022-07-11 14:41:11', '2022-07-11 15:41:11', '1 Heure(s)', 0, 1, '8', 'BMW IX SUV 2021', 'Done', '2022-09-02 09:10:36', '2022-09-02 09:12:45'),
(13, 36.99, '2022-07-12 14:41:11', '2022-07-12 15:41:11', '1 Heure(s)', 0, 1, '8', 'Dodge Charger Sedan 2019', 'Approved', '2022-09-02 09:46:40', '2022-09-02 10:29:19'),
(15, 65.94, '2022-09-02 15:39:32', '2022-09-02 18:39:32', '3 Heure(s)', 0, 3, '20', 'Bentley Azure Convertible 2007', 'Pending', '2022-09-02 11:39:48', '2022-09-02 11:40:06'),
(16, 0.00, '2022-09-02 15:39:47', '2022-09-02 15:39:47', '0 Heure(s)', 0, 0, '20', 'Ford Explorer SUV 2018', 'Pending', '2022-09-02 11:40:33', '2022-09-02 11:40:33'),
(17, 211.47, '2022-09-02 15:42:21', '2022-09-02 18:42:21', '3 Heure(s)', 0, 3, '12', 'BMW M4 sedan 2020', 'Declined', '2022-09-02 11:42:32', '2022-09-02 12:04:21'),
(18, 70.49, '2022-07-12 14:41:11', '2022-07-12 15:41:11', '1 Heure(s)', 0, 1, '8', 'BMW M4 sedan 2020', 'Declined', '2022-09-02 12:16:24', '2022-09-02 12:20:49'),
(19, 70.49, '2022-07-13 14:41:11', '2022-07-13 15:41:11', '1 Heure(s)', 0, 1, '9', 'BMW M4 sedan 2020', 'Declined', '2022-09-02 12:16:57', '2022-09-02 12:19:41'),
(20, 406.97, '2022-09-18 11:47:11', '2022-09-21 14:47:11', '3 Jour(s)', 3, 0, '18', 'Dodge Charger Sedan 2019', 'Pending', '2022-09-05 17:52:17', '2022-09-05 17:52:19'),
(21, 46.97, '2022-09-11 12:02:34', '2022-09-14 12:02:34', '3 Jour(s)', 3, 0, '18', 'Bentley Azure Convertible 2007', 'Pending', '2022-09-05 18:04:36', '2022-09-05 18:04:38'),
(22, 46.97, '2022-10-09 12:05:56', '2022-10-12 12:05:56', '3 Jour(s)', 3, 0, '3', 'Bentley Azure Convertible 2007', 'Pending', '2022-09-05 18:09:51', '2022-09-05 18:09:52'),
(23, 424.18, '2022-09-25 19:10:07', '2022-09-28 19:10:07', '3 Jour(s)', 3, 0, '18', 'BMW M4 sedan 2020', 'Declined', '2022-09-07 01:12:36', '2022-09-13 09:02:45'),
(24, 182.97, '2022-09-08 14:47:03', '2022-09-08 17:47:03', '3 Heure(s)', 0, 3, '12', 'BMW IX SUV 2021', 'Done', '2022-09-08 20:50:20', '2022-09-13 10:12:04'),
(25, 256.38, '2022-09-13 15:48:30', '2022-09-13 18:48:30', '3 Heure(s)', 0, 3, '16', 'BMW M4 sedan 2020', 'Done', '2022-09-13 06:58:48', '2022-09-13 10:28:55'),
(26, 226.44, '2022-09-13 11:11:24', '2022-09-13 14:11:24', '3 Heure(s)', 0, 3, '20', 'BMW M4 sedan 2020', 'Done', '2022-09-13 07:11:37', '2022-09-13 10:31:36'),
(27, 321.88, '2022-09-14 11:27:13', '2022-09-14 15:27:13', '4 Heure(s)', 0, 4, '8', 'BMW M4 sedan 2020', 'Deposit Returned Back', '2022-09-13 07:27:38', '2022-09-14 12:57:13'),
(28, 211.47, '2022-09-13 19:35:55', '2022-09-13 22:35:55', '3 Heure(s)', 0, 3, '16', 'BMW M4 sedan 2020', 'Done', '2022-09-13 10:37:11', '2022-09-14 13:45:57'),
(29, 70.49, '2022-09-13 14:40:47', '2022-09-13 15:40:47', '1 Heure(s)', 0, 1, '8', 'BMW M4 sedan 2020', 'Deposit Collected', '2022-09-13 10:41:03', '2022-09-14 13:46:54'),
(30, 221.97, '2022-09-14 15:28:26', '2022-09-14 18:28:26', '3 Heure(s)', 0, 3, '6', 'BMW M4 sedan 2020', 'Deposit Collected', '2022-09-14 11:40:17', '2022-09-14 13:22:51'),
(31, 211.47, '2022-09-14 17:43:58', '2022-09-14 20:43:58', '3 Heure(s)', 0, 3, '5', 'BMW M4 sedan 2020', 'Done', '2022-09-14 13:44:27', '2022-09-14 13:45:48'),
(32, 269.97, '2022-09-19 11:24:53', '2022-09-19 14:24:53', '3 Heure(s)', 0, 3, '12', 'Lamborghini Huracan Evo Coupé et Spyder 2020', 'Done', '2022-09-19 07:46:54', '2022-09-19 08:20:53'),
(33, 269.97, '2022-09-19 15:22:29', '2022-09-19 18:22:29', '3 Heure(s)', 0, 3, '6', 'Lamborghini Huracan Evo Coupé et Spyder 2020', 'Done', '2022-09-19 08:22:55', '2022-09-19 08:23:26'),
(34, 179.98, '2022-09-19 21:21:21', '2022-09-19 23:21:21', '2 Heure(s)', 0, 2, '20', 'Lamborghini Huracan Evo Coupé et Spyder 2020', 'Done', '2022-09-19 09:21:56', '2022-09-19 09:22:24');

-- --------------------------------------------------------

--
-- Structure de la table `reservations_vehicules`
--

CREATE TABLE `reservations_vehicules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reservation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vehicule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservations_vehicules`
--

INSERT INTO `reservations_vehicules` (`id`, `reservation_id`, `vehicule_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2022-09-01 08:08:15', '2022-09-01 08:08:15'),
(2, 2, 6, '2022-09-01 13:43:04', '2022-09-01 13:43:04'),
(3, 3, 6, '2022-09-01 13:44:39', '2022-09-01 13:44:39'),
(4, 4, 3, '2022-09-02 05:46:17', '2022-09-02 05:46:17'),
(5, 5, 3, '2022-09-02 06:00:27', '2022-09-02 06:00:27'),
(6, 6, 4, '2022-09-02 07:06:45', '2022-09-02 07:06:45'),
(7, 7, 7, '2022-09-02 07:36:26', '2022-09-02 07:36:26'),
(8, 8, 7, '2022-09-02 08:16:51', '2022-09-02 08:16:51'),
(9, 9, 1, '2022-09-02 08:28:24', '2022-09-02 08:28:24'),
(10, 10, 1, '2022-09-02 08:36:14', '2022-09-02 08:36:14'),
(11, 11, 1, '2022-09-02 08:52:20', '2022-09-02 08:52:20'),
(12, 12, 2, '2022-09-02 09:10:36', '2022-09-02 09:10:36'),
(13, 13, 1, '2022-09-02 09:46:40', '2022-09-02 09:46:40'),
(15, 15, 7, '2022-09-02 11:39:48', '2022-09-02 11:39:48'),
(16, 16, 8, '2022-09-02 11:40:33', '2022-09-02 11:40:33'),
(17, 17, 6, '2022-09-02 11:42:32', '2022-09-02 11:42:32'),
(18, 18, 6, '2022-09-02 12:16:24', '2022-09-02 12:16:24'),
(19, 19, 6, '2022-09-02 12:16:57', '2022-09-02 12:16:57'),
(20, 20, 1, '2022-09-05 17:52:17', '2022-09-05 17:52:17'),
(21, 21, 12, '2022-09-05 18:04:36', '2022-09-05 18:04:36'),
(22, 22, 12, '2022-09-05 18:09:51', '2022-09-05 18:09:51'),
(23, 23, 6, '2022-09-07 01:12:36', '2022-09-07 01:12:36'),
(24, 24, 2, '2022-09-08 20:50:20', '2022-09-08 20:50:20'),
(25, 25, 6, '2022-09-13 06:58:48', '2022-09-13 06:58:48'),
(26, 26, 6, '2022-09-13 07:11:37', '2022-09-13 07:11:37'),
(27, 27, 6, '2022-09-13 07:27:39', '2022-09-13 07:27:39'),
(28, 28, 6, '2022-09-13 10:37:11', '2022-09-13 10:37:11'),
(29, 29, 6, '2022-09-13 10:41:03', '2022-09-13 10:41:03'),
(30, 30, 3, '2022-09-14 11:40:17', '2022-09-14 11:40:17'),
(31, 31, 6, '2022-09-14 13:44:27', '2022-09-14 13:44:27'),
(32, 32, 13, '2022-09-19 07:46:54', '2022-09-19 07:46:54'),
(33, 33, 13, '2022-09-19 08:22:55', '2022-09-19 08:22:55'),
(34, 34, 13, '2022-09-19 09:21:56', '2022-09-19 09:21:56');

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rate` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like` int(11) DEFAULT 0,
  `unlike` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reviews`
--

INSERT INTO `reviews` (`id`, `rate`, `date`, `comment`, `customer_id`, `title`, `vehicule_id`, `created_at`, `updated_at`, `customer_name`, `customer_photo`, `like`, `unlike`) VALUES
(1, 4, '2022-09-06 18:18:48', 'Belle voiture, agréable à conduire.', '18', 'BMW M4 sedan 2020', 6, '2022-09-07 01:18:48', '2022-09-07 01:18:48', 'amine berrima', 'https://7rentals.com/backend/public/storage/image/', 0, 0),
(2, 4, '2022-09-13 09:00:46', 'The car did great! It was clean and drove smoothly! Ben was very timely in responding to any questions I had.', '16', 'BMW M4 sedan 2020', 6, '2022-09-13 07:00:46', '2022-09-13 07:00:46', 'Jaxson Robinson', 'https://7rentals.com/backend/public/storage/image/user4_1660657053.jpg', 0, 0),
(3, 5, '2022-09-13 09:12:23', 'Great, clean car and very nice interactions with owner.', '20', 'BMW M4 sedan 2020', 6, '2022-09-13 07:12:23', '2022-09-13 07:12:23', 'Evan Beckman', 'https://7rentals.com/backend/public/storage/image/sarah-parmenter_1661418340.jpeg', 0, 0),
(4, 5, '2022-09-13 09:28:39', 'Great vehicle. Communication with monica was great, she responded to my questions quickly.', '8', 'BMW M4 sedan 2020', 6, '2022-09-13 07:28:39', '2022-09-13 07:28:39', 'Glen waiston', 'https://7rentals.com/backend/public/storage/image/Williams_1660904000.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('Admin','Hote','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2022-06-15 10:33:25', '2022-06-15 10:33:25'),
(2, 'Hote', '2022-06-15 10:33:25', '2022-06-15 10:33:25'),
(3, 'user', '2022-06-15 10:33:45', '2022-06-15 10:33:45');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_nais` date DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `balance` double(8,2) DEFAULT 0.00,
  `user_status` enum('Pending','Approved','Declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `isActive` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `addresse`, `email`, `email_verified_at`, `password`, `phone`, `date_nais`, `link`, `photo`, `bio`, `address_id`, `remember_token`, `created_at`, `updated_at`, `balance`, `user_status`, `isActive`) VALUES
(1, 'Admin', 'Admin', 'Admin', NULL, 'admin@smartegy.ca', '2022-08-25 08:06:13', '$2y$10$YuXutyRBryZjKp.M/3Jdg.TqGEBn/cg3Y5MFu9hyf4iH/qrrA61z2', '(514) 900-3342', '1976-02-14', 'smartegy.ca', '275782751_358605019609732_4985228106918467620_n_1660831865.jpg', NULL, 1, NULL, '2022-06-16 07:17:53', '2022-08-25 08:06:13', 0.00, 'Pending', 1),
(2, 'Ted', 'mosbey', 'Ted_mosbey', NULL, 'ted@smartegy.ca', '2022-08-26 17:12:03', '$2y$10$AGF264Tb7Gjgi2b./nNcGe1RECE5aksz6AL7dhaqCEcEm6SkciIWu', '(514) 900-3341', '1976-02-13', 'linkkk', 'user7_1664372364.jpg', 'mmmmmmmmmm', 11, NULL, '2022-06-16 07:18:48', '2022-09-28 11:39:24', 832.89, 'Pending', 1),
(3, 'monica', 'Geller', 'monica', NULL, 'monica@smartegy.ca', NULL, '$2y$10$.EYbYBbJJHmB4AFMHn8LROcyu9JLRzKMgHVmwu2QnUE/fLluBbNHq', '(514) 900-3341', NULL, NULL, 'woman_1656709900.jpg', NULL, 14, NULL, '2022-06-16 07:19:17', '2022-09-19 12:04:06', 2650.00, 'Pending', 1),
(4, 'Elliot', 'Smith', 'Elliot', NULL, 'elliot@smartegy.ca', '2022-08-26 18:59:09', '$2y$10$nGAfN38J/8x3/FAkvUUhe./VfqyAVskK0xzEJKWwZ.x8DARtzUalm', '(514) 900-3341', NULL, NULL, 'user8_1656707300.jpg', NULL, 12, NULL, '2022-06-16 07:19:54', '2022-09-14 13:31:51', 7187.28, 'Pending', 1),
(5, 'Ross', 'Geller', 'Ross', NULL, 'ross@smartegy.ca', NULL, '$2y$10$8.2g1LJzJ/i0g0iTsKBSXOA8SJscZCwdeq35nO11UogLFcmElVVXi', '(514) 900-3341', NULL, NULL, 'user3_1656708409.jpg', NULL, 13, NULL, '2022-06-16 07:21:31', '2022-07-01 18:46:50', 0.00, 'Pending', 1),
(6, 'barney', 'stinson', 'Barney', NULL, 'barney@smartegy.ca', NULL, '$2y$10$mI0UPXZVNxOZ6otifiO4I.m/PSY7j6UfVKgSA4bUhgsMg2G4GvwAq', '(514) 900-3341', '1987-08-10', NULL, 'blogs-the-feed-how-i-met-your-mother-barney-stinson_1662647322.webp', NULL, NULL, NULL, '2022-07-22 06:05:27', '2022-09-08 21:28:42', 0.00, 'Pending', 1),
(7, 'meryam', 'chouaiti', 'Meryam', NULL, 'mariemchouaiti@gmail.com', NULL, '$2y$10$hU826HupZTO/ByBUPTaN3eqvS8v3bDihFNdZ7EUQyu8RGI7TIhfua', '+21620702695', '1998-04-10', NULL, NULL, NULL, NULL, NULL, '2022-07-26 08:49:53', '2022-07-26 08:49:53', 0.00, 'Pending', 1),
(8, 'Glen', 'waiston', 'Glen', NULL, 'glen@smartegy.ca', NULL, '$2y$10$gVD2SAhkGfEYYHNT0IprG.UHgMx1A9hozRviOeP82AqSRpeNfY0QW', '+1514 9003341', '1987-02-10', 'link', 'GQ-Yeun2Size-Oct1818_1663164033.webp', NULL, 15, NULL, '2022-07-27 11:11:30', '2022-09-14 11:05:04', 467.94, 'Pending', 1),
(9, 'Julio', 'armigo', 'Julio', NULL, 'Julio@smartegy.ca', NULL, '$2y$10$dbbiTSPVlrVTiqyu6/TR1e3Fuqi5QsObZRvwSkn3RHwrk03dBUAJ.', '+155874', '2022-08-10', NULL, NULL, NULL, NULL, NULL, '2022-08-12 09:41:30', '2022-08-12 09:41:30', 0.00, 'Pending', 1),
(10, 'Amanda', 'Tribianni', 'Amanda', NULL, 'amanda@smartegy.ca', NULL, '$2y$10$viGePE2ggLIgU9rlhSvnVuI/pFYpf7/yJavEjpWJAZt720tBpFn6a', '(514) 900-3341', NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-12 10:01:00', '2022-08-12 10:01:00', 0.00, 'Pending', 1),
(11, 'Jackson', 'Tremblay', 'Jackson_Tremblay', NULL, 'Jackson@smartegy.ca', NULL, '$2y$10$2SkI1RNmrupx4KcEXMLWc.ALbk5uVv6fM6bmxC/u1fMHg5PXsbOqK', '(+1) 7278733310', '1987-02-11', NULL, NULL, NULL, NULL, NULL, '2022-08-12 10:04:11', '2022-08-12 10:04:11', 0.00, 'Pending', 1),
(12, 'Emmett', 'Lavoie', 'Lavoie', NULL, 'Emmet@smartegy.ca', '2022-08-26 08:03:16', '$2y$10$vGLRhz.uvksf722A1jUfuOoaWqKbBrByMIFOmHismx4YvukEXIbGa', '+1 325 622 2594', '1958-08-05', NULL, 'portrait-happy-young-woman-looking-camera_23-2147892777_1663070920.jpg', NULL, NULL, NULL, '2022-08-12 10:13:55', '2022-08-26 08:03:16', 0.00, 'Pending', 1),
(13, 'Luke', 'Williams', 'Williams', NULL, 'Williams@smartegy.ca', '2022-08-26 11:56:55', '$2y$10$ybfEHaz2nc7IU3W3FkiDcem7r5IpELyFmm6bJ4yYUFV5/xmFC5sBy', '+1 545 824 8700', '1999-08-27', NULL, 'Williams_1660643926.jpg', NULL, 17, NULL, '2022-08-12 15:40:09', '2022-08-26 11:56:55', -9683.55, 'Pending', 1),
(14, 'Aria', 'Jones', 'Aria', NULL, 'Aria@smartegy.ca', NULL, '$2y$10$zg5ZlMZ466P/4ZvgnQbaKOADlZkL68hllZmeGEnWCJ59Py/4OFo7u', '+1 646 421 7166', '1990-08-11', NULL, NULL, NULL, NULL, NULL, '2022-08-12 16:01:26', '2022-08-12 16:01:26', 0.00, 'Pending', 1),
(15, 'Layla', 'Miller', 'layller', NULL, 'MillerLayla@smartegy.ca', NULL, '$2y$10$YuXutyRBryZjKp.M/3Jdg.TqGEBn/cg3Y5MFu9hyf4iH/qrrA61z2', '+1 613 555 0172', '1987-04-11', NULL, '15_1660642716.webp', NULL, 16, NULL, '2022-08-16 16:36:50', '2022-08-16 16:38:36', 0.00, 'Pending', 1),
(16, 'Jaxson', 'Robinson', 'RobinsonJx', NULL, 'RobinsonJax@smartegy.ca', NULL, '$2y$10$e0IQcVs8abJ2pRJTLqsoDOiM7TCImomEc/56hq6BVnviBlU0EbH5e', '+1 716 359 6784', '1998-08-11', NULL, 'user4_1660657053.jpg', NULL, 18, NULL, '2022-08-16 20:35:40', '2022-08-16 20:37:33', 0.00, 'Pending', 1),
(17, 'Mélanie', 'Duguay', 'Mélanieee', NULL, 'Duguay@smartegy.ca', NULL, '$2y$10$7WfdUneU.mg66..BZV/xUOG.Z2wW5EKk7cA3AaEdmIYjP7PIXU7/2', '+33-735-555-350', '1987-08-10', 'linkaaaaa', '7b0d384177516db45d6a79703ab7d4ad_1660897044.jpg', NULL, 19, NULL, '2022-08-18 19:01:37', '2022-08-25 07:17:53', 0.00, 'Declined', 1),
(18, 'amine', 'berrima', 'aminetest', NULL, 'amineleblaugrana@gmail.com', NULL, '$2y$10$DskmhveaoZDtBRgeb8GcCus4vzeNfKrzoLjHfEMFEhHJm4f7fjRVu', '+21621581524', '1992-08-22', NULL, NULL, NULL, NULL, NULL, '2022-08-19 19:40:15', '2022-09-05 18:09:52', -113.16, 'Pending', 1),
(19, 'Yedil', 'Zerhboub', 'YedilCEO', NULL, 'yedil.zerhboub@gmail.com', NULL, '$2y$10$J0mCTk5QdCWtU2.koG9mkObD63nnsc9qv5ogdq6f7jqaNnaID4EmC', '4387015549', '1996-06-24', NULL, NULL, NULL, NULL, NULL, '2022-08-23 12:23:31', '2022-08-23 12:23:31', 0.00, 'Pending', 1),
(20, 'Evan', 'Beckman', 'Evan', NULL, 'Evan@smartegy.ca', NULL, '$2y$10$kI3yzGmX5mbwsQ4UWMKCO.zRaV1Xaw9BK1UAyGsD4j/0mWBGtNJK.', '+330604818974', '1998-04-11', NULL, 'sarah-parmenter_1661418340.jpeg', NULL, 20, NULL, '2022-08-25 16:02:35', '2022-09-02 11:36:44', 434.91, 'Declined', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-06-16 07:17:53', '2022-06-16 07:17:53'),
(2, 3, 2, '2022-06-16 07:18:48', '2022-06-16 07:18:48'),
(3, 3, 3, '2022-06-16 07:19:17', '2022-06-16 07:19:17'),
(4, 3, 4, '2022-06-16 07:19:54', '2022-06-16 07:19:54'),
(5, 3, 5, '2022-06-16 07:21:31', '2022-06-16 07:21:31'),
(6, 3, 6, '2022-07-22 06:05:27', '2022-07-22 06:05:27'),
(7, 3, 7, '2022-07-26 08:49:53', '2022-07-26 08:49:53'),
(8, 3, 8, '2022-07-27 11:11:30', '2022-07-27 11:11:30'),
(9, 3, 9, '2022-08-12 09:41:30', '2022-08-12 09:41:30'),
(10, 3, 10, '2022-08-12 10:01:00', '2022-08-12 10:01:00'),
(11, 3, 11, '2022-08-12 10:04:11', '2022-08-12 10:04:11'),
(12, 3, 12, '2022-08-12 10:13:55', '2022-08-12 10:13:55'),
(13, 3, 13, '2022-08-12 15:40:10', '2022-08-12 15:40:10'),
(14, 3, 14, '2022-08-12 16:01:26', '2022-08-12 16:01:26'),
(15, 3, 15, '2022-08-16 16:36:50', '2022-08-16 16:36:50'),
(16, 3, 16, '2022-08-16 20:35:40', '2022-08-16 20:35:40'),
(17, 3, 17, '2022-08-18 19:01:37', '2022-08-18 19:01:37'),
(18, 3, 18, '2022-08-19 19:40:15', '2022-08-19 19:40:15'),
(19, 3, 19, '2022-08-23 12:23:31', '2022-08-23 12:23:31'),
(20, 3, 20, '2022-08-25 16:02:35', '2022-08-25 16:02:35');

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

CREATE TABLE `vehicules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `km` double(8,2) NOT NULL,
  `Price_H` double(8,2) NOT NULL,
  `Price_D` double(8,2) NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `portes` int(11) NOT NULL,
  `carburant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siege` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transmission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_line` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matricule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_reservation` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `bail` double(8,2) NOT NULL DEFAULT 0.00,
  `available` tinyint(1) NOT NULL DEFAULT 0,
  `nb_review` int(11) NOT NULL DEFAULT 0,
  `rate` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`id`, `km`, `Price_H`, `Price_D`, `location`, `portes`, `carburant`, `siege`, `description`, `transmission`, `photo`, `extras`, `description_line`, `matricule`, `nb_reservation`, `user_id`, `created_at`, `updated_at`, `model_id`, `balance`, `bail`, `available`, `nb_review`, `rate`) VALUES
(1, 120.00, 32.00, 98.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 5, 'Diesel', 5, NULL, 'Automatique', 'fab6aa4e19bfe902891a7d41ce268422x_1664375478.webp', NULL, NULL, 'KMHCT5AE1FU221809', 5, 2, '2022-06-30 07:26:24', '2022-09-28 12:31:18', 10, 0.00, 500.00, 1, 0, 0.00),
(2, 110.00, 56.00, 199.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 5, 'Électrique', 5, NULL, 'Automatique', '20201111073318_BMW-iX-2022-1600-01.jpg', NULL, NULL, 'KMHCT5AE1FU221800', 2, 2, '2022-06-30 07:58:36', '2022-09-08 20:50:20', 34, 0.00, 500.00, 0, 0, 0.00),
(3, 158.00, 69.00, 96.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 5, 'Essence', 5, NULL, 'Automatique', 'BMW M4 (3).jpg', NULL, NULL, '1C4RJFCGXEC418314', 3, 4, '2022-07-01 18:31:25', '2022-09-14 11:40:17', 35, 0.00, 500.00, 0, 0, 0.00),
(4, 260.00, 46.00, 186.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 2, 'Diesel', 2, NULL, 'Manuelle', 'porsche-01.jpg', NULL, NULL, '1C4PJMBX2JD528758', 2, 4, '2022-07-01 18:39:57', '2022-09-02 07:06:45', 36, 0.00, 500.00, 0, 0, 0.00),
(5, 65.00, 120.00, 360.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 5, 'Diesel', 5, NULL, 'Manuelle', '96b52162612226e8839f0b21a943976e.jpg', NULL, NULL, 'ZFBERFDT0F6956980', 0, 5, '2022-07-01 18:52:03', '2022-08-16 19:45:34', 84, 0.00, 500.00, 0, 0, 0.00),
(6, 87.00, 65.50, 98.56, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 5, 'Essence', 5, NULL, 'Automatique', 'devon-janse-van-rensburg-yoqHLUayUTg-unsplash.jpg', NULL, NULL, '1GTW7BFG0K1340946', 12, 3, '2022-07-01 19:13:42', '2022-09-14 13:44:27', 35, 0.00, 500.00, 0, 4, 4.50),
(7, 120.30, 12.00, 12.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 2, 'Essence', 4, 'aa', 'Manuelle', 'Audi-Q5.jpg', NULL, NULL, 'aaaa', 3, 8, '2022-07-27 12:13:23', '2022-09-02 11:39:48', 61, 0.00, 500.00, 0, 0, 0.00),
(8, 158.30, 42.00, 85.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 3, 'Diesel', 4, NULL, 'Manuelle', 'image_2022-08-16_104747459.png', NULL, NULL, '1C6SRFHTXNN408751', 1, 15, '2022-08-16 16:53:56', '2022-09-02 11:40:33', 116, 0.00, 500.00, 0, 0, 0.00),
(9, 125.21, 87.00, 165.00, '55 st Louais , Qc', 5, 'Électrique', 5, NULL, 'Manuelle', 'tesla-model-3-with-ssr-gtx01-wheels-and-ohlins-suspension-2.jpg', NULL, NULL, '1C4PJMBXXND524446', 0, 1, '2022-08-19 18:36:24', '2022-08-31 21:54:54', 145, 0.00, 500.00, 0, 0, 0.00),
(10, 56.00, 42.00, 132.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 5, 'Essence', 5, NULL, 'Automatique', 'tesla-model-3-with-ssr-gtx01-wheels-and-ohlins-suspension-2.jpg', NULL, NULL, '1C4RJFJG4JC387963', 0, 8, '2022-08-19 19:01:16', '2022-08-30 10:15:25', 145, 0.00, 500.00, 0, 0, 0.00),
(11, 698750.00, 65.00, 165.00, '4172 40th Street Calgary,AB T2P 2V7,Alberta', 5, 'Essence', 5, NULL, 'Manuelle', 'original.jpg', NULL, NULL, '1FATP8UH5G5313426', 1, 20, '2022-08-25 16:16:12', '2022-09-02 10:55:39', 6, 0.00, 500.00, 0, 0, 0.00),
(12, 15000.00, 10.00, 8.00, 'montreal', 3, 'Essence', 2, 'blabla', 'Automatique', 'Azure-05.jpg', NULL, NULL, '12345', 2, 18, '2022-09-05 18:02:27', '2022-09-05 18:09:51', 61, 0.00, 500.00, 0, 0, 0.00),
(13, 220.00, 85.00, 149.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 3, 'Essence', 2, '4 wheel power disc brakes,am/fm/cd radio w/ipod hookup,air conditioning,alarm system,aluminum wheels,automatic trunk release,bucket seats,courtesy lights,electric clock,heater/defroster,instrumentation,intermittent wipers,leather seating,navigation,padded sun visors & dash,power door locks,power steering,power windows,remote keyless entry', 'Automatique', '290955109_8108182879199732_2161376710283655925_n.jpg', NULL, NULL, 'ZHWUM4ZF4LLA14351', 3, 2, '2022-09-19 07:36:21', '2022-09-19 09:21:56', 151, 0.00, 500.00, 0, 0, 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `vehicule_options`
--

CREATE TABLE `vehicule_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vehicule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicule_options`
--

INSERT INTO `vehicule_options` (`id`, `vehicule_id`, `option_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(2, 1, 5, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(3, 1, 4, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(4, 1, 2, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(5, 1, 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(6, 2, 5, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(7, 2, 4, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(8, 2, 3, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(9, 2, 2, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(10, 2, 1, '2022-06-30 07:58:36', '2022-06-30 07:58:36'),
(11, 3, 2, '2022-07-01 18:31:25', '2022-07-01 18:31:25'),
(12, 3, 1, '2022-07-01 18:31:26', '2022-07-01 18:31:26'),
(13, 3, 3, '2022-07-01 18:31:26', '2022-07-01 18:31:26'),
(14, 3, 4, '2022-07-01 18:31:26', '2022-07-01 18:31:26'),
(15, 3, 5, '2022-07-01 18:31:26', '2022-07-01 18:31:26'),
(16, 4, 2, '2022-07-01 18:39:57', '2022-07-01 18:39:57'),
(17, 4, 3, '2022-07-01 18:39:57', '2022-07-01 18:39:57'),
(18, 5, 3, '2022-07-01 18:52:03', '2022-07-01 18:52:03'),
(19, 5, 2, '2022-07-01 18:52:03', '2022-07-01 18:52:03'),
(20, 5, 1, '2022-07-01 18:52:03', '2022-07-01 18:52:03'),
(21, 6, 4, '2022-07-01 19:13:42', '2022-07-01 19:13:42'),
(22, 6, 3, '2022-07-01 19:13:42', '2022-07-01 19:13:42'),
(23, 6, 2, '2022-07-01 19:13:42', '2022-07-01 19:13:42'),
(24, 6, 1, '2022-07-01 19:13:42', '2022-07-01 19:13:42'),
(25, 6, 5, '2022-07-01 19:13:42', '2022-07-01 19:13:42'),
(26, 7, 3, '2022-07-27 12:13:23', '2022-07-27 12:13:23'),
(27, 7, 4, '2022-07-27 12:13:23', '2022-07-27 12:13:23'),
(28, 8, 2, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(29, 8, 3, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(30, 8, 4, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(31, 8, 5, '2022-08-16 16:53:56', '2022-08-16 16:53:56'),
(32, 9, 3, '2022-08-19 18:36:24', '2022-08-19 18:36:24'),
(33, 9, 4, '2022-08-19 18:36:24', '2022-08-19 18:36:24'),
(34, 9, 5, '2022-08-19 18:36:24', '2022-08-19 18:36:24'),
(35, 10, 2, '2022-08-19 19:01:16', '2022-08-19 19:01:16'),
(36, 10, 3, '2022-08-19 19:01:16', '2022-08-19 19:01:16'),
(37, 10, 4, '2022-08-19 19:01:16', '2022-08-19 19:01:16'),
(38, 11, 1, '2022-08-25 16:16:12', '2022-08-25 16:16:12'),
(39, 11, 2, '2022-08-25 16:16:12', '2022-08-25 16:16:12'),
(40, 11, 3, '2022-08-25 16:16:12', '2022-08-25 16:16:12'),
(41, 11, 4, '2022-08-25 16:16:12', '2022-08-25 16:16:12'),
(42, 12, 4, '2022-09-05 18:02:27', '2022-09-05 18:02:27'),
(43, 12, 3, '2022-09-05 18:02:27', '2022-09-05 18:02:27'),
(44, 12, 2, '2022-09-05 18:02:27', '2022-09-05 18:02:27'),
(45, 13, 1, '2022-09-19 07:36:21', '2022-09-19 07:36:21'),
(46, 13, 2, '2022-09-19 07:36:21', '2022-09-19 07:36:21'),
(47, 13, 3, '2022-09-19 07:36:21', '2022-09-19 07:36:21'),
(48, 13, 4, '2022-09-19 07:36:21', '2022-09-19 07:36:21'),
(49, 13, 5, '2022-09-19 07:36:21', '2022-09-19 07:36:21');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_payment_id_foreign` (`payment_id`),
  ADD KEY `bookings_vehicule_id_foreign` (`vehicule_id`);

--
-- Index pour la table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cards_user_id_foreign` (`user_id`);

--
-- Index pour la table `cashes`
--
ALTER TABLE `cashes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashes_user_id_foreign` (`user_id`);

--
-- Index pour la table `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disputes_reservation_id_foreign` (`reservation_id`);

--
-- Index pour la table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_vehicule_id_foreign` (`vehicule_id`);

--
-- Index pour la table `makes`
--
ALTER TABLE `makes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `models_make_id_foreign` (`make_id`);

--
-- Index pour la table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_reservation_id_foreign` (`reservation_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservations_vehicules`
--
ALTER TABLE `reservations_vehicules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_vehicules_reservation_id_foreign` (`reservation_id`),
  ADD KEY `reservations_vehicules_vehicule_id_foreign` (`vehicule_id`);

--
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_vehicule_id_foreign` (`vehicule_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_address_id_foreign` (`address_id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`),
  ADD KEY `user_roles_user_id_foreign` (`user_id`);

--
-- Index pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicules_matricule_unique` (`matricule`),
  ADD KEY `vehicules_user_id_foreign` (`user_id`),
  ADD KEY `vehicules_model_id_foreign` (`model_id`);

--
-- Index pour la table `vehicule_options`
--
ALTER TABLE `vehicule_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicule_options_vehicule_id_foreign` (`vehicule_id`),
  ADD KEY `vehicule_options_option_id_foreign` (`option_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cashes`
--
ALTER TABLE `cashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `disputes`
--
ALTER TABLE `disputes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT pour la table `makes`
--
ALTER TABLE `makes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `models`
--
ALTER TABLE `models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT pour la table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `reservations_vehicules`
--
ALTER TABLE `reservations_vehicules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `vehicule_options`
--
ALTER TABLE `vehicule_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_vehicule_id_foreign` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cashes`
--
ALTER TABLE `cashes`
  ADD CONSTRAINT `cashes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `disputes`
--
ALTER TABLE `disputes`
  ADD CONSTRAINT `disputes_reservation_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`);

--
-- Contraintes pour la table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_vehicule_id_foreign` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_make_id_foreign` FOREIGN KEY (`make_id`) REFERENCES `makes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_reservation_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`);

--
-- Contraintes pour la table `reservations_vehicules`
--
ALTER TABLE `reservations_vehicules`
  ADD CONSTRAINT `reservations_vehicules_reservation_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_vehicules_vehicule_id_foreign` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_vehicule_id_foreign` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD CONSTRAINT `vehicules_model_id_foreign` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vehicule_options`
--
ALTER TABLE `vehicule_options`
  ADD CONSTRAINT `vehicule_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicule_options_vehicule_id_foreign` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
