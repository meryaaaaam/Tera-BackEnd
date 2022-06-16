-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 16 juin 2022 à 11:23
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
(1, 'assets/img/cars/373119_2019_Audi_Q5-inter-2.jpg', 'inter', '124', 1, '2022-06-15 08:44:24', '2022-06-15 08:44:24'),
(2, 'assets/img/cars/373117_2019_Audi_Q5-back.jpg', 'back', '124', 1, '2022-06-15 08:44:24', '2022-06-15 08:44:24'),
(3, 'assets/img/cars/373120_2019_Audi_Q5-int.jpg', 'back', '124', 1, '2022-06-15 08:44:24', '2022-06-15 08:44:24'),
(4, 'assets/img/cars/BMW M4 (2).jpg', 'inter', '124', 2, '2022-06-15 08:58:55', '2022-06-15 08:58:55'),
(5, 'assets/img/cars/BMW M4 (1).jpg', 'back', '124', 2, '2022-06-15 08:58:55', '2022-06-15 08:58:55'),
(6, 'assets/img/cars/BMW M4 (4).jpg', 'back', '124', 2, '2022-06-15 08:58:55', '2022-06-15 08:58:55'),
(7, 'assets/img/cars/porsche-01.jpg', 'inter', '124', 3, '2022-06-15 09:14:27', '2022-06-15 09:14:27'),
(8, 'assets/img/cars/porsche-03.jpg', 'back', '124', 3, '2022-06-15 09:14:27', '2022-06-15 09:14:27'),
(9, 'assets/img/cars/porsche-02.jpg', 'back', '124', 3, '2022-06-15 09:14:27', '2022-06-15 09:14:27');

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
(15, '2022_06_09_093744_create_reservations_table', 2),
(16, '2022_06_09_095808_create_reservations_vehicules_table', 2),
(17, '2022_5_10_105259_create_users_table', 3);

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
(36, '911', 'Coupe, Convertible', '2001', '2022-06-15 09:10:27', '2022-06-15 09:10:27', 44);

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
(5, 'Caméra de recul', 'assets/img/svg/camera.svg', NULL, NULL);

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
  `period` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `amount`, `start`, `end`, `period`, `created_at`, `updated_at`) VALUES
(1, 220.00, '2022-06-15 10:15:00', '2022-06-25 19:55:00', NULL, '2022-06-16 06:46:17', '2022-06-16 06:46:17');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `addresse`, `email`, `email_verified_at`, `password`, `phone`, `date_nais`, `link`, `photo`, `bio`, `address_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '--', 'Admin', NULL, 'contact@smartegy.ca', NULL, '$2y$10$KV3pOc73M1tAfgE.JqyeF.mr/B54a.A6IKdIoCl9n5G69xJK91dRC', '(514) 900-3341', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-16 07:17:53', '2022-06-16 07:17:53'),
(2, 'Ted', 'mosbey', 'Ted', NULL, 'ted@smartegy.ca', NULL, '$2y$10$AGF264Tb7Gjgi2b./nNcGe1RECE5aksz6AL7dhaqCEcEm6SkciIWu', '(514) 900-3341', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-16 07:18:48', '2022-06-16 07:18:48'),
(3, 'monica', 'Geller', 'monica', NULL, 'monica@smartegy.ca', NULL, '$2y$10$.EYbYBbJJHmB4AFMHn8LROcyu9JLRzKMgHVmwu2QnUE/fLluBbNHq', '(514) 900-3341', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-16 07:19:17', '2022-06-16 07:19:17'),
(4, 'Elliot', 'Smith', 'Elliot', NULL, 'elliot@smartegy.ca', NULL, '$2y$10$nGAfN38J/8x3/FAkvUUhe./VfqyAVskK0xzEJKWwZ.x8DARtzUalm', '(514) 900-3341', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-16 07:19:54', '2022-06-16 07:19:54'),
(5, 'Ross', 'Geller', 'Ross', NULL, 'ross@smartegy.ca', NULL, '$2y$10$8.2g1LJzJ/i0g0iTsKBSXOA8SJscZCwdeq35nO11UogLFcmElVVXi', '(514) 900-3341', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-16 07:21:31', '2022-06-16 07:21:31');

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
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`id`, `km`, `Price_H`, `Price_D`, `location`, `portes`, `carburant`, `siege`, `description`, `transmission`, `photo`, `extras`, `description_line`, `matricule`, `nb_reservation`, `user_id`, `created_at`, `updated_at`, `model_id`) VALUES
(1, 80.78, 10.50, 20.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 5, 'Essence', 5, 'Audi Q5: great vehicle for a weekend getaway or just getting around the city. Spacious trunk and all wheel drive. The sunroof is a great feature for a sunny This vehicle comes with rubber mats so you don’t have to worry about any spills etc. If it happens we can just hose them down like new!', 'automatique', 'assets/img/cars/373122_2019_Audi_Q5-2.jpg', NULL, NULL, '2C3ZC84GHHH2689940', 0, 2, '2022-06-15 08:44:24', '2022-06-15 08:44:24', 14),
(2, 80.78, 10.50, 20.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 5, 'Essence', 5, '2020 BMW M4 Coupe Twin Turbocharged 3.0L Inline6 Automatic, 7-speed with paddle shift  Currently 45,600 Miles', 'automatique', 'assets/img/cars/BMW M4 (3).jpg', NULL, NULL, '2C3ZC84GH2689940', 0, 3, '2022-06-15 08:58:55', '2022-06-15 08:58:55', 35),
(3, 180.78, 11.50, 100.00, '4710 St Catherine E, Montréal , Qc , H1V 1Z2', 3, 'Essence', 4, 'Tour with this 6 speed manual transmission Martini 911 Carrera Cabriolet.  Inspired by the legendary Porsche racing team, Martini sports the worlrenowned Martini racing stripes insignia. This vehicle is guaranteed to turn heads and get you noticed when you pull up.  Apple CarPlay, Bluetooth, and the Bose sound system and subwoofer impresses even the most discerning audiophiles. This car comes standard with a convertible top, but you can replace it with the hard top just by adding the gear rack - hard top option for just $40/day. It makes long distance drives much more quiet and peaceful.Also, don’t forget to add the optional windscreen for $40/day for max comfort. It makes a heckuva difference on highways and you can drive with the top down in short sleeves and shorts no matter what the temperature is outside! Also, you won’t mess your hair up during your date or big meeting ;)Although a 4 seater, rear seats are meant for smaller humans.  Convertible mode, child seat booster and wind deflector available as upgrade options for your trip (See extra add -ons).', 'automatique', 'assets/img/cars/porsche-04.jpg', NULL, NULL, 'CC3ZC84GH2689940', 0, 3, '2022-06-15 09:14:26', '2022-06-15 09:14:26', 36);

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
(1, 3, 1, '2022-06-15 09:27:18', '2022-06-15 09:27:18'),
(2, 3, 2, '2022-06-15 09:27:18', '2022-06-15 09:27:18'),
(3, 3, 3, '2022-06-15 09:27:18', '2022-06-15 09:27:18');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `makes`
--
ALTER TABLE `makes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `models`
--
ALTER TABLE `models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `reservations_vehicules`
--
ALTER TABLE `reservations_vehicules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `vehicule_options`
--
ALTER TABLE `vehicule_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

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
