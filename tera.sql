-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 14 juin 2022 à 10:05
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
(1, '4710 St Catherine E', 'Montréal ', 'H1V 1Z2', 'Qc ', NULL, NULL);

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
(1, 'assets/img/cars/tesla.jpg', 'tesla.jpg', '54814', 1, '2022-06-09 09:16:35', '2022-06-09 09:16:35'),
(2, 'assets/img/cars/tesla model3.jpg', 'tesla model3.jpg', '3018833', 4, '2022-06-09 09:18:03', '2022-06-09 09:18:03'),
(3, 'assets/img/cars/tesla4.jpg', 'tesla4.jpg', '40708', 2, '2022-06-09 09:20:54', '2022-06-09 09:20:54'),
(4, 'assets/img/cars/bmw-2021-suv-electrique-autonome-1-615x410.webp', 'bmw-2021-suv-electrique-autonome-1-615x410.webp', '78556', 6, '2022-06-09 09:24:27', '2022-06-09 09:24:27'),
(5, 'assets/img/cars/black ford mangan gt-02.jpg', 'black ford mangan gt-02.jpg', '1213487', 7, '2022-06-09 09:25:44', '2022-06-09 09:25:44'),
(6, 'assets/img/cars/dodge-02.jpg', 'dodge-02.jpg', '11880', 8, '2022-06-09 09:27:34', '2022-06-09 09:27:34'),
(7, 'assets/img/cars/nissan.jpg', 'nissan.jpg', '41617', 10, '2022-06-09 09:29:06', '2022-06-09 09:29:06'),
(8, 'assets/img/cars/nissan-03.jpg', 'nissan-03.jpg', '116376', 12, '2022-06-09 09:31:20', '2022-06-09 09:31:20'),
(9, 'assets/img/cars/BMW M4 (2).jpg', 'BMW M4 (2).jpg', '2312149', 13, '2022-06-10 07:10:25', '2022-06-10 07:10:25'),
(10, 'assets/img/cars/tesla.jpg', 'tesla.jpg', '125', 20, '2022-06-10 07:53:20', '2022-06-10 07:53:20'),
(11, 'assets/img/cars/tesla22.jpg', 'tesla.jpg', '125', 20, '2022-06-10 07:53:20', '2022-06-10 07:53:20'),
(12, 'assets/img/cars/tesla.jpg', 'tesla.jpg', '125', 22, '2022-06-10 07:54:05', '2022-06-10 07:54:05'),
(13, 'assets/img/cars/tesla22.jpg', 'tesla2.jpg', '125', 22, '2022-06-10 07:54:05', '2022-06-10 07:54:05'),
(14, 'assets/img/cars/tesla32.jpg', 'tesla3.jpg', '125', 22, '2022-06-10 07:54:05', '2022-06-10 07:54:05');

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
(4, 'Ford', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(9, 'Dodge', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(10, 'Nissan', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(14, 'BMW', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(17, 'Chevrolet', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(19, 'Mercedes-Benz', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(29, 'Audi', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(30, 'Jeep', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(38, 'Ferrari', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(39, 'Tesla', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(44, 'Porsche', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51'),
(53, 'Alfa Romeo', NULL, '2022-06-09 08:40:51', '2022-06-09 08:40:51');

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
(11, '2022_05_27_090947_create_roles_table', 2),
(12, '2022_05_27_091022_create_user_roles_table', 2),
(13, '2022_05_27_124726_create_vehicule_options_table', 2),
(14, '2022_06_01_161621_create_galleries_table', 2),
(15, '2022_06_09_093744_create_reservations_table', 2),
(16, '2022_06_09_095808_create_reservations_vehicules_table', 2);

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
(2, 'Altima', 'Sedan', '2019', '2022-06-09 08:53:25', '2022-06-09 08:53:25', 10),
(6, 'Transit 150 Wagon', 'Van/Minivan', '2019', '2022-06-09 08:53:25', '2022-06-09 08:53:25', 4),
(8, 'Transit 250 Van', 'Van/Minivan', '2019', '2022-06-09 08:53:25', '2022-06-09 08:53:25', 4),
(9, 'Model 3', 'Sedan', '2019', '2022-06-09 08:53:25', '2022-06-09 08:53:25', 39),
(10, 'Titan King Cab', 'Pickup', '2019', '2022-06-09 08:53:25', '2022-06-09 08:53:25', 10),
(13, 'Mercedes-AMG GT', 'Coupe, Sedan, Convertible', '2019', '2022-06-09 08:53:25', '2022-06-09 08:53:25', 19),
(16, 'Sentra', 'Sedan', '2019', '2022-06-09 08:53:25', '2022-06-09 08:53:25', 10),
(17, 'X6', 'SUV', '2019', '2022-06-09 08:53:25', '2022-06-09 08:53:25', 14),
(18, 'Blazer', 'SUV', '2019', '2022-06-09 08:53:25', '2022-06-09 08:53:25', 17),
(19, 'Mercedes-AMG CLS', 'Sedan', '2019', '2022-06-09 08:53:25', '2022-06-09 08:53:25', 19),
(21, 'X6', 'SUV', '2019', '2022-06-09 08:54:23', '2022-06-09 08:54:23', 14),
(22, 'Z4', 'Convertible', '2019', '2022-06-09 08:54:23', '2022-06-09 08:54:23', 14),
(23, '8 Series', 'Coupe, Convertible', '2019', '2022-06-09 08:54:23', '2022-06-09 08:54:23', 14),
(24, 'X2', 'SUV', '2019', '2022-06-09 08:54:23', '2022-06-09 08:54:23', 14),
(25, '5 Series', 'Sedan', '2019', '2022-06-09 08:54:23', '2022-06-09 08:54:23', 14),
(26, 'Transit 150 Wagon', 'Van/Minivan', '2019', '2022-06-09 08:54:44', '2022-06-09 08:54:44', 4),
(27, 'Transit 250 Van', 'Van/Minivan', '2019', '2022-06-09 08:54:44', '2022-06-09 08:54:44', 4),
(28, 'EcoSport', 'SUV', '2019', '2022-06-09 08:54:44', '2022-06-09 08:54:44', 4),
(29, 'F350 Super Duty Super Cab', 'Pickup', '2019', '2022-06-09 08:54:44', '2022-06-09 08:54:44', 4),
(30, 'Fusion', 'Sedan', '2019', '2022-06-09 08:54:44', '2022-06-09 08:54:44', 4),
(31, 'Durango', 'SUV', '2019', '2022-06-09 08:55:02', '2022-06-09 08:55:02', 9),
(32, 'Charger', 'Sedan', '2019', '2022-06-09 08:55:02', '2022-06-09 08:55:02', 9),
(33, 'Journey', 'SUV', '2019', '2022-06-09 08:55:02', '2022-06-09 08:55:02', 9),
(34, 'Challenger', 'Coupe', '2019', '2022-06-09 08:55:02', '2022-06-09 08:55:02', 9),
(35, 'Grand Caravan Passenger', 'Van/Minivan', '2019', '2022-06-09 08:55:02', '2022-06-09 08:55:02', 9),
(36, 'Q5', 'SUV', '2019', '2022-06-09 08:55:21', '2022-06-09 08:55:21', 29),
(37, 'A8', 'Sedan', '2019', '2022-06-09 08:55:21', '2022-06-09 08:55:21', 29),
(38, 'S3', 'Sedan', '2019', '2022-06-09 08:55:21', '2022-06-09 08:55:21', 29),
(39, 'RS 5', 'Sedan, Coupe', '2019', '2022-06-09 08:55:21', '2022-06-09 08:55:21', 29),
(40, 'A7', 'Sedan', '2019', '2022-06-09 08:55:21', '2022-06-09 08:55:21', 29),
(41, 'Blazer', 'SUV', '2019', '2022-06-09 08:55:45', '2022-06-09 08:55:45', 17),
(42, 'Sonic', 'Sedan, Hatchback', '2019', '2022-06-09 08:55:45', '2022-06-09 08:55:45', 17),
(43, 'Colorado Extended Cab', 'Pickup', '2019', '2022-06-09 08:55:45', '2022-06-09 08:55:45', 17),
(44, 'Express 2500 Passenger', 'Van/Minivan', '2019', '2022-06-09 08:55:45', '2022-06-09 08:55:45', 17),
(45, 'Malibu', 'Sedan', '2019', '2022-06-09 08:55:45', '2022-06-09 08:55:45', 17),
(46, 'model 4', 'Sedan', '2019', '2022-06-09 09:19:19', '2022-06-09 09:19:19', 39);

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
(1, 'Admin', NULL, NULL),
(2, 'Hote', NULL, NULL),
(3, 'user', '2022-06-09 10:07:26', '2022-06-09 10:07:26');

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
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `addresse`, `email`, `email_verified_at`, `password`, `phone`, `date_nais`, `link`, `address_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', NULL, 'admin@smartegy.ca', NULL, '$2y$10$PmjN3BSWsQR1YJjGqR1skuBo.RiWToqdKtnGySp0Yu5QMwHIiGOqq', '(514) 900-3341', NULL, NULL, 1, NULL, '2022-06-09 08:07:47', '2022-06-09 08:07:47'),
(2, 'monica', 'geller', 'mon', NULL, 'monicageller@smartegy.ca', NULL, '$2y$10$wirX20pMMYmG947SSchV6eJ2g.EpwCNJUMpL0eHMDi0bfbojjO4R2', '(514) 900-3341', NULL, NULL, 1, NULL, '2022-06-09 08:07:53', '2022-06-09 08:07:53'),
(3, 'barney', 'stinson', 'theBarnical', NULL, 'thebarnical@smartegy.ca', NULL, '$2y$10$ubu8zdxjj7QvaQkpoHHQQ.b20n7Humsxv5oEucf.UQZL1QG68ZRGG', '(514) 900-3341', NULL, NULL, 1, NULL, '2022-06-09 08:08:23', '2022-06-09 08:08:23'),
(4, 'Ted', 'mosbey', 'Ted', NULL, 'ted@smartegy.ca', NULL, '$2y$10$tHJKkiL7IY6B/7vaB4FB1.6zVPz.XDe53.GZe9YwqrsXwiSvPFLse', '(514) 900-3341', NULL, NULL, 1, NULL, '2022-06-09 08:09:09', '2022-06-09 08:09:09'),
(5, 'Robin', 'Schw', 'Robin', NULL, 'robin@smartegy.ca', NULL, '$2y$10$ygoR.0d1vd07pc.eib0r9eOE3hMHk5QlTLUWNIfiMZ/VBiQiAmbcK', '(514) 900-3341', NULL, NULL, 1, NULL, '2022-06-09 08:09:28', '2022-06-09 08:09:28'),
(6, 'Lily', 'And', 'Lily', NULL, 'Lily@smartegy.ca', NULL, '$2y$10$t0LLSsXgs1WKpcP2YC4rw.7Fx2eg/9cqtKhzcTx3XIFJAexGaikYy', '(514) 900-3341', NULL, NULL, 1, NULL, '2022-06-09 08:09:56', '2022-06-09 08:09:56');

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
(1, 1, 1, '2022-06-09 08:07:47', '2022-06-09 08:07:47'),
(2, 3, 2, '2022-06-09 08:07:53', '2022-06-09 08:07:53'),
(3, 3, 3, '2022-06-09 08:08:23', '2022-06-09 08:08:23'),
(4, 3, 4, '2022-06-09 08:09:09', '2022-06-09 08:09:09'),
(5, 3, 5, '2022-06-09 08:09:28', '2022-06-09 08:09:28'),
(6, 3, 6, '2022-06-09 08:09:56', '2022-06-09 08:09:56');

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

INSERT INTO `vehicules` (`id`, `km`, `Price_H`, `Price_D`, `location`, `matricule`, `nb_reservation`, `user_id`, `created_at`, `updated_at`, `model_id`) VALUES
(1, 111.00, 15.00, 32.00, 'Qc', '5UXKR9C57F0K52911', 0, 2, '2022-06-09 09:16:35', '2022-06-09 09:16:35', 9),
(2, 74.33, 32.00, 42.00, 'Qc', '5UXKR0C57F0K52986', 0, 2, '2022-06-09 09:17:49', '2022-06-09 09:17:49', 9),
(4, 32.11, 15.00, 34.10, 'Qc', '5UXKR9C57F0K52912', 0, 2, '2022-06-09 09:20:45', '2022-06-09 09:20:45', 46),
(6, 11.80, 16.00, 32.00, 'Qc', '5UXKR9C57F0K52915', 0, 3, '2022-06-09 09:24:27', '2022-06-09 09:24:27', 36),
(7, 54.11, 12.00, 32.00, 'Qc', '5UXKR9C57F0K52918', 0, 3, '2022-06-09 09:25:44', '2022-06-09 09:25:44', 6),
(8, 42.31, 19.00, 60.00, 'Qc', '5UXKR9C57F0K52920', 0, 3, '2022-06-09 09:27:34', '2022-06-09 09:27:34', 32),
(10, 11.00, 12.00, 32.00, 'Qc', '5UXKR9C57F0Q52912', 0, 6, '2022-06-09 09:29:06', '2022-06-09 09:29:06', 2),
(12, 70.45, 22.20, 32.00, 'Qc', '5UXKR9Q57F0K53918', 0, 4, '2022-06-09 09:31:20', '2022-06-09 09:31:20', 10),
(13, 123.00, 12.00, 12.00, 'somwhere', '123', 0, 2, '2022-06-10 07:10:24', '2022-06-10 07:10:24', 6),
(18, 111.00, 32.00, 32.00, '4710 St Catherine E , Montréal  , Qc  , H1V 1Z2', '5UXKR9C577F0K52911', 0, 1, '2022-06-10 07:52:14', '2022-06-10 07:52:14', 9),
(20, 111.00, 32.00, 32.00, '4710 St Catherine E , Montréal  , Qc  , H1V 1Z2', '5UXKR9Q577F0K52911', 0, 1, '2022-06-10 07:53:20', '2022-06-10 07:53:20', 9),
(22, 111.00, 32.00, 32.00, '4710 St Catherine E , Montréal  , Qc  , H1V 1Z2', '5UXKR9Q577QF0K52911', 0, 1, '2022-06-10 07:54:05', '2022-06-10 07:54:05', 9);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `makes`
--
ALTER TABLE `makes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `models`
--
ALTER TABLE `models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `vehicule_options`
--
ALTER TABLE `vehicule_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
