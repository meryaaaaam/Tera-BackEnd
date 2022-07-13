-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 13 juil. 2022 à 11:21
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
-- Base de données : `tera`
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
(1, '4890 St Catherine Z', 'Montréal', 'H1V 1Z2', 'Qc', '2022-06-16 08:52:07', '2022-06-27 11:27:06'),
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
(14, 'Null', 'Null', 'Null', 'Null', '2022-07-01 19:11:40', '2022-07-01 19:11:40');

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
(1, '3c0186292cd37c9e0440a5c03288b616x.webp', '3c0186292cd37c9e0440a5c03288b616x.webp', '42712', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(2, '5a26578d2e2284d584eace595355cedax.webp', '5a26578d2e2284d584eace595355cedax.webp', '50872', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(3, '08f8f11b69cbc6884e35dd6452757a5dx.webp', '08f8f11b69cbc6884e35dd6452757a5dx.webp', '40374', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(4, '8e9a2e3272d6d21633409463cf1337f5x.webp', '8e9a2e3272d6d21633409463cf1337f5x.webp', '56808', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(5, '9b8291d712eda5a76572cfb5effce9e5x.webp', '9b8291d712eda5a76572cfb5effce9e5x.webp', '35452', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(6, '9b9893746865ce551fa1edeea7372308x.webp', '9b9893746865ce551fa1edeea7372308x.webp', '38874', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(7, '949b561335eaaab2177a2d583f7e4227x.webp', '949b561335eaaab2177a2d583f7e4227x.webp', '33948', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(8, '966acdad8a59a294cac34e99817f25c3x.webp', '966acdad8a59a294cac34e99817f25c3x.webp', '49080', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(9, '4252b577819d656c4c12da4d55382c3bx.webp', '4252b577819d656c4c12da4d55382c3bx.webp', '36042', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(10, '6995e3c8da46048e6daed90f55e66857x.webp', '6995e3c8da46048e6daed90f55e66857x.webp', '20284', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(11, '8846064921e23b3d0fab713c2b0ac53cx.webp', '8846064921e23b3d0fab713c2b0ac53cx.webp', '70118', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(12, 'a5decbefd6aa82e16e420c8c99acf57ax.webp', 'a5decbefd6aa82e16e420c8c99acf57ax.webp', '51866', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(13, 'afb2ccee52453f14d3909f717d92412ax.webp', 'afb2ccee52453f14d3909f717d92412ax.webp', '37950', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(14, 'b8c663e00fc40d87a9b7b1c3dd78a48cx.webp', 'b8c663e00fc40d87a9b7b1c3dd78a48cx.webp', '59558', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(15, 'bbeff9abe7144f64a387c73415cbe34dx.jpg', 'bbeff9abe7144f64a387c73415cbe34dx.jpg', '57545', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(16, 'bf5c46e82320d9847ae22d0b09c9f6b6x.webp', 'bf5c46e82320d9847ae22d0b09c9f6b6x.webp', '30034', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(17, 'ed7e0959615dcbfdb85e821018b4be2ex.webp', 'ed7e0959615dcbfdb85e821018b4be2ex.webp', '51382', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
(18, 'fab6aa4e19bfe902891a7d41ce268422x.webp', 'fab6aa4e19bfe902891a7d41ce268422x.webp', '48498', 1, '2022-06-30 07:26:24', '2022-06-30 07:26:24'),
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
(32, 'BMW M4 (4).jpg', 'BMW M4 (4).jpg', '1500448', 3, '2022-07-01 18:31:26', '2022-07-01 18:31:26'),
(33, 'porsche-02.jpg', 'porsche-02.jpg', '704894', 4, '2022-07-01 18:39:57', '2022-07-01 18:39:57'),
(34, 'porsche-03.jpg', 'porsche-03.jpg', '2312149', 4, '2022-07-01 18:39:57', '2022-07-01 18:39:57'),
(35, 'porsche-04.jpg', 'porsche-04.jpg', '1500448', 4, '2022-07-01 18:39:57', '2022-07-01 18:39:57'),
(36, 'b4b9bbcff464beacd82dff6ea81e0381.jpg', 'b4b9bbcff464beacd82dff6ea81e0381.jpg', '88155', 5, '2022-07-01 18:52:03', '2022-07-01 18:52:03'),
(37, 'devon-janse-van-rensburg-cTCYujspoLs-unsplash.jpg', 'devon-janse-van-rensburg-cTCYujspoLs-unsplash.jpg', '1764785', 6, '2022-07-01 19:13:42', '2022-07-01 19:13:42'),
(38, 'devon-janse-van-rensburg-FQT-gz0aJdc-unsplash.jpg', 'devon-janse-van-rensburg-FQT-gz0aJdc-unsplash.jpg', '2022550', 6, '2022-07-01 19:13:42', '2022-07-01 19:13:42'),
(39, 'devon-janse-van-rensburg-NjEGKWnr6lQ-unsplash.jpg', 'devon-janse-van-rensburg-NjEGKWnr6lQ-unsplash.jpg', '2083511', 6, '2022-07-01 19:13:42', '2022-07-01 19:13:42');

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
(10, '2022_05_27_085755_create_vehicules_table', 2),
(11, '2022_05_27_090947_create_roles_table', 2),
(12, '2022_05_27_091022_create_user_roles_table', 2),
(13, '2022_05_27_124726_create_vehicule_options_table', 2),
(14, '2022_06_01_161621_create_galleries_table', 2),
(17, '2022_5_10_105259_create_users_table', 3),
(20, '2022_06_28_124310_add_solde_to_vehicule', 5),
(22, '2022_06_28_140437_add_solde_to_user', 5),
(23, '2022_06_28_130404_create_cards_table', 6),
(28, '2022_06_30_132523_add_available_to_vehicules', 8),
(31, '2022_06_09_093744_create_reservations_table', 9),
(32, '2022_06_09_095808_create_reservations_vehicules_table', 9);

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
(136, 'Sedona', 'Van/Minivan', '2018', '2022-06-29 09:56:53', '2022-06-29 09:56:53', 27);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `amount`, `start`, `end`, `period`, `days`, `hours`, `created_at`, `updated_at`) VALUES
(2, 294.00, '2022-06-30 08:15:00', '2022-07-01 23:59:00', '1.6555555555556 Jour(s)', 2, 0, '2022-07-01 08:32:53', '2022-07-01 08:32:53'),
(3, 294.00, '2022-07-02 08:15:00', '2022-07-03 23:59:00', '1.6555555555556 Jour(s)', 2, 0, '2022-07-01 08:33:17', '2022-07-01 08:33:17'),
(4, 183.47, '2022-07-04 08:15:00', '2022-07-04 13:59:00', '6 Heure(s)', 0, 6, '2022-07-01 08:33:28', '2022-07-01 08:33:28'),
(5, 294.00, '2022-07-23 08:15:00', '2022-07-25 13:59:00', '2.2388888888889 Jour(s)', 2, 0, '2022-07-01 08:33:38', '2022-07-01 08:33:38'),
(6, 183.47, '2022-07-25 18:15:00', '2022-07-25 23:59:00', '6 Heure(s)', 0, 6, '2022-07-01 08:33:50', '2022-07-01 08:33:50'),
(7, 196.00, '2022-07-27 18:15:00', '2022-07-28 23:59:00', '1.2388888888889 Jour(s)', 1, 0, '2022-07-01 08:34:52', '2022-07-01 08:34:52'),
(8, 294.00, '2022-07-30 08:15:00', '2022-08-01 08:59:00', '2.0305555555556 Jour(s)', 2, 0, '2022-07-01 08:36:36', '2022-07-01 08:36:36'),
(9, 196.00, '2022-08-01 10:15:00', '2022-08-02 18:59:00', '1 Jour(s)', 1, 0, '2022-07-01 08:37:45', '2022-07-01 08:37:45'),
(10, 597.00, '2022-07-04 09:15:00', '2022-07-06 14:59:00', '2 Jour(s)', 2, 0, '2022-07-01 09:46:28', '2022-07-01 09:46:28'),
(11, 597.00, '2022-07-01 09:15:00', '2022-07-03 14:59:00', '2 Jour(s)', 2, 0, '2022-07-01 09:46:43', '2022-07-01 09:46:43'),
(12, 881.07, '2022-07-06 16:15:00', '2022-07-07 07:59:00', '16 Heure(s)', 0, 16, '2022-07-01 09:59:26', '2022-07-01 09:59:26'),
(13, 97.07, '2022-09-30 16:15:00', '2022-09-30 17:59:00', '2 Heure(s)', 0, 2, '2022-07-01 18:06:16', '2022-07-01 18:06:16'),
(14, 208.00, '2022-09-02 16:15:00', '2022-09-02 17:59:00', '2 Heure(s)', 0, 2, '2022-07-02 05:48:38', '2022-07-02 05:48:38'),
(15, 558.00, '2022-09-03 16:15:00', '2022-09-05 17:59:00', '2 Jour(s)', 2, 0, '2022-07-02 05:49:13', '2022-07-02 05:49:13'),
(16, 930.00, '2022-09-23 16:15:00', '2022-09-27 17:59:00', '4 Jour(s)', 4, 0, '2022-07-02 05:52:16', '2022-07-02 05:52:16');

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
(2, 2, 1, '2022-07-01 08:32:53', '2022-07-01 08:32:53'),
(3, 3, 1, '2022-07-01 08:33:17', '2022-07-01 08:33:17'),
(4, 4, 1, '2022-07-01 08:33:28', '2022-07-01 08:33:28'),
(5, 5, 1, '2022-07-01 08:33:38', '2022-07-01 08:33:38'),
(6, 6, 1, '2022-07-01 08:33:50', '2022-07-01 08:33:50'),
(7, 7, 1, '2022-07-01 08:34:52', '2022-07-01 08:34:52'),
(8, 8, 1, '2022-07-01 08:36:36', '2022-07-01 08:36:36'),
(9, 9, 1, '2022-07-01 08:37:45', '2022-07-01 08:37:45'),
(10, 10, 2, '2022-07-01 09:46:28', '2022-07-01 09:46:28'),
(11, 11, 2, '2022-07-01 09:46:43', '2022-07-01 09:46:43'),
(12, 12, 2, '2022-07-01 09:59:26', '2022-07-01 09:59:26'),
(13, 13, 2, '2022-07-01 18:06:16', '2022-07-01 18:06:16'),
(14, 14, 5, '2022-07-02 05:48:38', '2022-07-02 05:48:38'),
(15, 15, 4, '2022-07-02 05:49:13', '2022-07-02 05:49:13'),
(16, 16, 4, '2022-07-02 05:52:16', '2022-07-02 05:52:16');

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
  `balance` double(8,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `addresse`, `email`, `email_verified_at`, `password`, `phone`, `date_nais`, `link`, `photo`, `bio`, `address_id`, `remember_token`, `created_at`, `updated_at`, `balance`) VALUES
(1, 'Admin', 'Admin', 'Admin', NULL, 'admin@smartegy.ca', NULL, '$2y$10$KV3pOc73M1tAfgE.JqyeF.mr/B54a.A6IKdIoCl9n5G69xJK91dRC', '(514) 900-3342', '1976-02-13', NULL, 'user2_1656495627.jpg', NULL, 1, NULL, '2022-06-16 07:17:53', '2022-06-29 07:40:27', 0.00),
(2, 'Ted', 'mosbey', 'Ted_mosbey', NULL, 'ted@smartegy.ca', NULL, '$2y$10$AGF264Tb7Gjgi2b./nNcGe1RECE5aksz6AL7dhaqCEcEm6SkciIWu', '(514) 900-3341', '1976-02-13', 'linkkk', 'user7_1656522569.jpg', 'mmmmmmmmmm', 11, NULL, '2022-06-16 07:18:48', '2022-06-29 15:09:30', 0.00),
(3, 'monica', 'Geller', 'monica', NULL, 'monica@smartegy.ca', NULL, '$2y$10$.EYbYBbJJHmB4AFMHn8LROcyu9JLRzKMgHVmwu2QnUE/fLluBbNHq', '(514) 900-3341', NULL, NULL, 'woman_1656709900.jpg', NULL, 14, NULL, '2022-06-16 07:19:17', '2022-07-01 19:11:40', 0.00),
(4, 'Elliot', 'Smith', 'Elliot', NULL, 'elliot@smartegy.ca', NULL, '$2y$10$nGAfN38J/8x3/FAkvUUhe./VfqyAVskK0xzEJKWwZ.x8DARtzUalm', '(514) 900-3341', NULL, NULL, 'user8_1656707300.jpg', NULL, 12, NULL, '2022-06-16 07:19:54', '2022-07-01 18:28:21', 0.00),
(5, 'Ross', 'Geller', 'Ross', NULL, 'ross@smartegy.ca', NULL, '$2y$10$8.2g1LJzJ/i0g0iTsKBSXOA8SJscZCwdeq35nO11UogLFcmElVVXi', '(514) 900-3341', NULL, NULL, 'user3_1656708409.jpg', NULL, 13, NULL, '2022-06-16 07:21:31', '2022-07-01 18:46:50', 0.00);

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
(5, 3, 5, '2022-06-16 07:21:31', '2022-06-16 07:21:31');

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
  `available` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`id`, `km`, `Price_H`, `Price_D`, `location`, `portes`, `carburant`, `siege`, `description`, `transmission`, `photo`, `extras`, `description_line`, `matricule`, `nb_reservation`, `user_id`, `created_at`, `updated_at`, `model_id`, `balance`, `bail`, `available`) VALUES
(1, 120000.00, 32.00, 98.00, 'somwhere', 5, 'Diesel', 5, NULL, 'Automatique', '9b9893746865ce551fa1edeea7372308x.webp', NULL, NULL, 'KMHCT5AE1FU221809', 9, 2, '2022-06-30 07:26:24', '2022-07-01 08:37:45', 10, 0.00, 500.00, 1),
(2, 110000.00, 56.00, 199.00, 'somwhre', 5, 'Électrique', 5, NULL, 'Automatique', '20201111073318_BMW-iX-2022-1600-01.jpg', NULL, NULL, 'KMHCT5AE1FU221800', 4, 2, '2022-06-30 07:58:36', '2022-07-01 18:06:16', 34, 0.00, 500.00, 0),
(3, 120000.00, 69.00, 96.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 5, 'Essence', 5, NULL, 'Automatique', 'BMW M4 (3).jpg', NULL, NULL, '1C4RJFCGXEC418314', 0, 4, '2022-07-01 18:31:25', '2022-07-01 18:31:25', 35, 0.00, 500.00, 0),
(4, 260000.00, 46.00, 186.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 2, 'Diesel', 2, NULL, 'Manuelle', 'porsche-01.jpg', NULL, NULL, '1C4PJMBX2JD528758', 2, 4, '2022-07-01 18:39:57', '2022-07-02 05:52:16', 36, 0.00, 500.00, 0),
(5, 65000.00, 120.00, 360.00, 'somwhere', 5, 'Diesel', 5, NULL, 'Manuelle', '96b52162612226e8839f0b21a943976e.jpg', NULL, NULL, 'ZFBERFDT0F6956980', 1, 5, '2022-07-01 18:52:03', '2022-07-02 05:48:38', 84, 0.00, 500.00, 0),
(6, 87020.00, 65.50, 98.56, 'somwhere', 5, 'Essence', 5, NULL, 'Automatique', 'devon-janse-van-rensburg-yoqHLUayUTg-unsplash.jpg', NULL, NULL, '1GTW7BFG0K1340946', 0, 3, '2022-07-01 19:13:42', '2022-07-01 19:13:42', 35, 0.00, 500.00, 0);

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
(25, 6, 5, '2022-07-01 19:13:42', '2022-07-01 19:13:42');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cards_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT pour la table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `makes`
--
ALTER TABLE `makes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `models`
--
ALTER TABLE `models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT pour la table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `reservations_vehicules`
--
ALTER TABLE `reservations_vehicules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `vehicule_options`
--
ALTER TABLE `vehicule_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
-- Contraintes pour la table `reservations_vehicules`
--
ALTER TABLE `reservations_vehicules`
  ADD CONSTRAINT `reservations_vehicules_reservation_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservations_vehicules_vehicule_id_foreign` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`) ON DELETE CASCADE;

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
