-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 16 Juin 2019 à 16:12
-- Version du serveur :  5.7.26-0ubuntu0.16.04.1
-- Version de PHP :  7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `A1`
--
CREATE DATABASE IF NOT EXISTS `A1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `A1`;

-- --------------------------------------------------------

--
-- Structure de la table `achats`
--

CREATE TABLE `achats` (
  `id_achat` int(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `payment` tinyint(1) NOT NULL DEFAULT '0',
  `date_achat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` int(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `achats`
--

INSERT INTO `achats` (`id_achat`, `id_user`, `payment`, `date_achat`, `total`) VALUES
(1, 11, 0, '2019-05-16 01:28:48', 19),
(2, 11, 0, '2019-05-16 01:29:03', 19),
(3, 11, 0, '2019-05-16 01:29:13', 19),
(4, 11, 0, '2019-05-16 01:29:47', 33),
(5, 11, 0, '2019-05-16 01:29:53', 17),
(6, 11, 0, '2019-05-16 01:30:02', 17),
(7, 11, 0, '2019-05-16 01:30:13', 29),
(8, 11, 0, '2019-05-16 01:30:23', 16),
(9, 11, 0, '2019-05-16 01:30:38', 17),
(10, 11, 0, '2019-05-16 01:30:50', 17),
(11, 11, 0, '2019-05-16 01:30:58', 17),
(12, 11, 0, '2019-05-16 01:31:11', 17),
(13, 11, 0, '2019-05-16 01:31:46', 14),
(14, 11, 0, '2019-05-16 01:31:58', 14),
(15, 11, 0, '2019-05-16 01:32:31', 16),
(16, 11, 0, '2019-05-16 01:32:42', 20),
(17, 11, 0, '2019-05-16 01:32:48', 20),
(18, 11, 0, '2019-05-16 01:32:54', 20),
(19, 11, 0, '2019-05-16 01:33:09', 13),
(20, 11, 0, '2019-05-16 01:33:19', 16),
(21, 11, 0, '2019-05-16 01:33:29', 23),
(22, 11, 0, '2019-05-16 01:33:36', 15),
(23, 11, 0, '2019-05-16 01:33:43', 23),
(24, 11, 0, '2019-05-16 01:33:58', 65),
(25, 11, 0, '2019-05-16 01:34:10', 65),
(26, 11, 0, '2019-05-16 01:34:23', 65),
(27, 12, 0, '2019-05-16 12:31:44', NULL),
(28, 12, 0, '2019-05-16 12:32:25', NULL),
(29, 12, 0, '2019-05-16 12:32:39', NULL),
(30, 12, 0, '2019-05-16 12:32:58', NULL),
(31, 12, 0, '2019-05-16 12:50:04', NULL),
(32, 12, 0, '2019-05-16 13:16:03', NULL),
(33, 13, 0, '2019-05-23 17:19:15', NULL),
(34, 1, 0, '2019-05-23 17:22:22', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `acheteurs`
--

CREATE TABLE `acheteurs` (
  `id_user` int(255) NOT NULL,
  `quartier` int(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `acheteurs`
--

INSERT INTO `acheteurs` (`id_user`, `quartier`) VALUES
(1, 0),
(5, 3),
(6, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` int(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `nom`, `description`) VALUES
(1, 'oui', ''),
(2, 'Burger', ''),
(3, 'poulet frit', ''),
(4, 'Wrap', ''),
(5, 'Salade', ''),
(6, 'boisson chaude', ''),
(7, 'Boisson froide', ''),
(8, 'Boisson alcoolisée', ''),
(9, 'pizza', ''),
(10, 'Plat chaud', ''),
(11, 'Poisson', '');

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

CREATE TABLE `log` (
  `id_user` int(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `time_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `log`
--

INSERT INTO `log` (`id_user`, `action`, `value`, `time_date`) VALUES
(1, 'CREATE', 'ACHETEUR', '2019-05-09 10:55:38'),
(1, 'LOGIN', 'a', '2019-05-09 10:55:41'),
(1, 'LOGOUT', '', '2019-05-09 10:56:02'),
(1, 'LOGIN', 'a', '2019-05-09 10:57:54'),
(1, 'LOGOUT', '', '2019-05-09 11:52:57'),
(1, 'LOGIN', 'a', '2019-05-09 15:10:22'),
(1, 'LOGIN', 'a', '2019-05-23 17:21:00'),
(1, 'LOGOUT', '', '2019-05-23 17:22:32'),
(1, 'LOGIN', 'a', '2019-05-23 17:22:44'),
(2, 'CREATE', 'ACHETEUR', '2019-05-09 10:56:19'),
(2, 'LOGIN', 'w', '2019-05-09 10:56:21'),
(2, 'LOGOUT', '', '2019-05-09 10:56:47'),
(2, 'LOGIN', 'w', '2019-05-09 10:56:51'),
(2, 'CREER_RESTAURANT', 'l', '2019-05-09 10:56:58'),
(2, 'CREER_RESTAURANT', 'lll', '2019-05-09 10:57:03'),
(2, 'CREER_PRODUIT', 'Burger', '2019-05-09 10:57:45'),
(2, 'LOGOUT', '', '2019-05-09 10:57:50'),
(2, 'LOGIN', 'w', '2019-05-16 13:15:28'),
(2, 'LOGOUT', '', '2019-05-16 13:15:34'),
(2, 'LOGIN', 'w', '2019-05-23 17:17:37'),
(2, 'LOGOUT', '', '2019-05-23 17:17:39'),
(3, 'CREATE', 'ACHETEUR', '2019-05-09 11:20:22'),
(3, 'LOGIN', 'pass', '2019-05-09 11:20:32'),
(3, 'CREER_RESTAURANT', 'Kfc', '2019-05-09 11:23:21'),
(3, 'EFFACER_RESTAURANT', 'Kfc', '2019-05-09 11:23:35'),
(3, 'CREER_RESTAURANT', 'KFC', '2019-05-09 11:24:30'),
(3, 'CREER_PRODUIT', 'ZINGERS burger', '2019-05-09 11:25:41'),
(3, 'CREER_PRODUIT', 'BUCKET FILET', '2019-05-09 11:26:42'),
(3, 'CREER_PRODUIT', 'BOX COMBI ', '2019-05-09 11:27:51'),
(3, 'CREER_PRODUIT', 'TWISTER wrap', '2019-05-09 11:28:56'),
(3, 'CREER_PRODUIT', 'KFC Salade', '2019-05-09 11:29:49'),
(3, 'CREER_PRODUIT', 'CRISPYS', '2019-05-09 11:30:58'),
(3, 'CREER_RESTAURANT', 'Mcdonalds', '2019-05-09 11:34:08'),
(3, 'CREER_PRODUIT', 'The Classic', '2019-05-09 11:35:21'),
(3, 'CREER_PRODUIT', 'Big Mac', '2019-05-09 11:36:06'),
(3, 'CREER_PRODUIT', 'CBO', '2019-05-09 11:36:47'),
(3, 'CREER_PRODUIT', 'Quinoa Curry', '2019-05-09 11:37:43'),
(3, 'CREER_PRODUIT', 'Chicken McNuggets', '2019-05-09 11:38:42'),
(3, 'CREER_PRODUIT', 'Café crème', '2019-05-09 11:40:54'),
(3, 'LOGOUT', '', '2019-05-09 11:41:02'),
(3, 'LOGIN', 'pass', '2019-05-12 08:35:48'),
(3, 'LOGOUT', '', '2019-05-12 08:35:58'),
(3, 'LOGIN', 'pass', '2019-05-12 08:36:10'),
(3, 'LOGOUT', '', '2019-05-12 08:36:12'),
(3, 'LOGIN', 'pass', '2019-05-16 01:19:00'),
(3, 'CREER_PRODUIT', 'Coca', '2019-05-16 01:22:03'),
(3, 'CREER_PRODUIT', 'Sprite', '2019-05-16 01:24:41'),
(3, 'CREER_PRODUIT', 'Mr Tea', '2019-05-16 01:28:21'),
(3, 'LOGOUT', '', '2019-05-16 01:28:26'),
(3, 'LOGIN', 'pass', '2019-05-16 01:36:38'),
(3, 'LOGOUT', '', '2019-05-16 01:36:46'),
(3, 'LOGIN', 'pass', '2019-06-15 07:06:28'),
(3, 'LOGOUT', '', '2019-06-15 07:06:32'),
(3, 'LOGIN', 'pass', '2019-06-16 08:24:49'),
(3, 'LOGOUT', '', '2019-06-16 08:24:51'),
(3, 'LOGIN', 'pass', '2019-06-16 09:29:57'),
(3, 'LOGIN', 'pass', '2019-06-16 09:31:02'),
(3, 'LOGIN', 'pass', '2019-06-16 09:32:07'),
(3, 'LOGIN', 'pass', '2019-06-16 09:35:46'),
(3, 'LOGIN', 'pass', '2019-06-16 09:37:19'),
(3, 'LOGIN', 'pass', '2019-06-16 09:40:06'),
(3, 'LOGIN', 'pass', '2019-06-16 09:40:53'),
(3, 'LOGIN', 'pass', '2019-06-16 09:42:26'),
(3, 'LOGIN', 'pass', '2019-06-16 13:52:56'),
(3, 'LOGOUT', '', '2019-06-16 13:52:58'),
(4, 'CREATE', 'ACHETEUR', '2019-05-09 11:41:35'),
(4, 'LOGIN', 'pass', '2019-05-09 11:41:41'),
(4, 'CREER_RESTAURANT', 'Le Seize Maine', '2019-05-09 11:46:33'),
(4, 'CREER_PRODUIT', 'Café Colombien', '2019-05-09 11:46:58'),
(4, 'EFFACER_PRODUIT', 'Café Colombien, Le Seize Maine', '2019-05-09 11:47:03'),
(4, 'CREER_PRODUIT', 'Café Colombien', '2019-05-09 11:48:27'),
(4, 'CREER_PRODUIT', 'Café renversé', '2019-05-09 11:49:49'),
(4, 'CREER_PRODUIT', 'Menu café croissant', '2019-05-09 11:52:30'),
(4, 'CREER_PRODUIT', 'Pizza au chorizo espagnole', '2019-05-09 11:56:01'),
(4, 'CREER_PRODUIT', 'paella', '2019-05-09 11:57:43'),
(4, 'LOGOUT', '', '2019-05-09 11:57:53'),
(4, 'LOGIN', 'pass', '2019-05-12 08:36:21'),
(4, 'LOGOUT', '', '2019-05-12 08:36:24'),
(4, 'LOGIN', 'pass', '2019-05-15 09:27:26'),
(4, 'LOGOUT', '', '2019-05-15 09:27:32'),
(4, 'LOGIN', 'pass', '2019-06-16 08:25:04'),
(4, 'LOGOUT', '', '2019-06-16 08:25:06'),
(5, 'CREATE', 'ACHETEUR', '2019-05-09 11:53:24'),
(5, 'LOGIN', 'Alex', '2019-05-09 11:53:28'),
(5, 'LOGIN', 'Alex', '2019-05-09 11:53:43'),
(5, 'LOGOUT', '', '2019-05-09 11:54:46'),
(6, 'CREATE', 'ACHETEUR', '2019-05-09 11:55:25'),
(6, 'LOGIN', 'Andresc', '2019-05-09 11:55:28'),
(6, 'LOGIN', 'Andresc', '2019-05-09 11:55:43'),
(6, 'LOGIN', 'Andresc', '2019-05-09 11:56:18'),
(6, 'LOGIN', 'Andresc', '2019-05-09 11:56:24'),
(6, 'LOGIN', 'Andresc', '2019-05-09 11:56:47'),
(6, 'LOGIN', 'Andresc', '2019-05-09 11:57:06'),
(6, 'LOGOUT', '', '2019-05-09 12:00:30'),
(6, 'LOGIN', 'Andresc', '2019-05-09 12:00:35'),
(6, 'LOGOUT', '', '2019-05-09 12:07:21'),
(6, 'LOGIN', 'Andresc', '2019-05-09 12:45:10'),
(7, 'CREATE', 'ACHETEUR', '2019-05-09 11:59:37'),
(7, 'LOGIN', 'pass', '2019-05-09 12:00:19'),
(7, 'CREER_RESTAURANT', 'Dominos Pizza', '2019-05-09 12:02:18'),
(7, 'LOGIN', 'pass', '2019-05-09 12:03:27'),
(7, 'LOGIN', 'pass', '2019-05-09 12:03:59'),
(7, 'CREER_PRODUIT', 'SALAMI PASSION', '2019-05-09 12:04:30'),
(7, 'CREER_PRODUIT', 'REINE', '2019-05-09 12:05:05'),
(7, 'CREER_PRODUIT', 'HAWAII', '2019-05-09 12:05:37'),
(7, 'CREER_PRODUIT', 'DIAVOLA', '2019-05-09 12:06:18'),
(7, 'CREER_PRODUIT', 'EXTRAVAGANZZA', '2019-05-09 12:06:53'),
(7, 'LOGOUT', '', '2019-05-09 12:06:58'),
(8, 'CREATE', 'ACHETEUR', '2019-05-09 12:08:40'),
(8, 'LOGIN', 'pass', '2019-05-09 12:09:07'),
(8, 'CREER_RESTAURANT', 'PizzaFactory', '2019-05-09 12:09:35'),
(8, 'CREER_PRODUIT', 'Poisson', '2019-05-09 12:10:44'),
(8, 'LOGOUT', '', '2019-05-09 12:10:52'),
(9, 'CREATE', 'ACHETEUR', '2019-05-09 12:57:55'),
(9, 'LOGIN', 'p', '2019-05-09 12:58:05'),
(9, 'CREER_RESTAURANT', 'PizzaRestau', '2019-05-09 12:58:36'),
(9, 'CREER_PRODUIT', 'Pizza', '2019-05-09 12:59:06'),
(9, 'LOGOUT', '', '2019-05-09 12:59:11'),
(10, 'CREATE', 'ACHETEUR', '2019-05-09 12:59:47'),
(10, 'LOGIN', 'pass', '2019-05-09 12:59:56'),
(10, 'LOGOUT', '', '2019-05-09 13:02:09'),
(10, 'LOGIN', 'pass', '2019-05-09 13:05:00'),
(11, 'CREATE', 'ACHETEUR', '2019-05-12 08:36:44'),
(11, 'LOGIN', 'a', '2019-05-12 08:37:06'),
(11, 'LOGOUT', '', '2019-05-12 08:38:04'),
(11, 'LOGIN', 'a', '2019-05-15 09:28:10'),
(11, 'LOGIN', 'a', '2019-05-15 09:58:20'),
(11, 'LOGOUT', '', '2019-05-15 09:59:53'),
(11, 'LOGIN', 'a', '2019-05-15 09:59:56'),
(11, 'LOGIN', 'a', '2019-05-15 10:04:32'),
(11, 'LOGIN', 'a', '2019-05-15 10:06:58'),
(11, 'LOGIN', 'a', '2019-05-15 10:07:45'),
(11, 'LOGIN', 'a', '2019-05-15 10:13:44'),
(11, 'LOGIN', 'a', '2019-05-15 10:19:09'),
(11, 'LOGIN', 'a', '2019-05-15 10:20:19'),
(11, 'LOGIN', 'a', '2019-05-15 10:20:42'),
(11, 'LOGIN', 'a', '2019-05-15 10:23:19'),
(11, 'LOGIN', 'a', '2019-05-15 10:23:56'),
(11, 'LOGIN', 'a', '2019-05-15 10:24:38'),
(11, 'LOGIN', 'a', '2019-05-15 10:25:04'),
(11, 'LOGIN', 'a', '2019-05-15 10:33:48'),
(11, 'LOGIN', 'a', '2019-05-15 10:35:35'),
(11, 'LOGIN', 'a', '2019-05-15 10:36:22'),
(11, 'LOGIN', 'a', '2019-05-15 10:37:19'),
(11, 'LOGIN', 'a', '2019-05-15 10:37:52'),
(11, 'LOGIN', 'a', '2019-05-15 10:39:28'),
(11, 'LOGIN', 'a', '2019-05-15 10:40:15'),
(11, 'LOGIN', 'a', '2019-05-15 10:42:34'),
(11, 'LOGIN', 'a', '2019-05-15 10:43:21'),
(11, 'LOGIN', 'a', '2019-05-15 10:43:37'),
(11, 'LOGIN', 'a', '2019-05-15 10:44:37'),
(11, 'LOGIN', 'a', '2019-05-15 12:33:38'),
(11, 'LOGIN', 'a', '2019-05-15 12:34:06'),
(11, 'LOGIN', 'a', '2019-05-15 12:34:36'),
(11, 'LOGIN', 'a', '2019-05-15 13:01:56'),
(11, 'LOGIN', 'a', '2019-05-15 13:02:34'),
(11, 'LOGIN', 'a', '2019-05-15 13:36:08'),
(11, 'LOGIN', 'a', '2019-05-15 13:39:07'),
(11, 'LOGIN', 'a', '2019-05-15 13:47:54'),
(11, 'LOGIN', 'a', '2019-05-15 13:48:13'),
(11, 'LOGIN', 'a', '2019-05-15 13:48:49'),
(11, 'LOGIN', 'a', '2019-05-15 13:50:55'),
(11, 'LOGIN', 'a', '2019-05-15 13:51:43'),
(11, 'LOGIN', 'a', '2019-05-15 13:51:55'),
(11, 'LOGIN', 'a', '2019-05-15 13:52:58'),
(11, 'LOGIN', 'a', '2019-05-15 13:53:12'),
(11, 'LOGOUT', '', '2019-05-15 13:54:59'),
(11, 'LOGIN', 'a', '2019-05-15 13:55:01'),
(11, 'LOGOUT', '', '2019-05-15 13:56:14'),
(11, 'LOGIN', 'a', '2019-05-15 13:56:16'),
(11, 'LOGIN', 'a', '2019-05-15 13:57:29'),
(11, 'LOGIN', 'a', '2019-05-15 13:58:03'),
(11, 'LOGIN', 'a', '2019-05-15 13:58:28'),
(11, 'LOGIN', 'a', '2019-05-15 13:59:02'),
(11, 'LOGIN', 'a', '2019-05-15 13:59:37'),
(11, 'LOGIN', 'a', '2019-05-15 14:00:14'),
(11, 'LOGIN', 'a', '2019-05-15 14:01:26'),
(11, 'LOGIN', 'a', '2019-05-15 14:02:39'),
(11, 'LOGIN', 'a', '2019-05-15 14:04:53'),
(11, 'LOGIN', 'a', '2019-05-15 14:07:17'),
(11, 'LOGIN', 'a', '2019-05-15 14:08:23'),
(11, 'LOGIN', 'a', '2019-05-15 14:17:20'),
(11, 'LOGIN', 'a', '2019-05-15 14:17:50'),
(11, 'LOGOUT', '', '2019-05-15 14:17:55'),
(11, 'LOGIN', 'a', '2019-05-15 14:17:57'),
(11, 'LOGIN', 'a', '2019-05-15 14:18:13'),
(11, 'LOGIN', 'a', '2019-05-15 14:19:15'),
(11, 'LOGIN', 'a', '2019-05-15 14:22:26'),
(11, 'LOGIN', 'a', '2019-05-15 14:23:07'),
(11, 'LOGIN', 'a', '2019-05-15 14:26:43'),
(11, 'LOGIN', 'a', '2019-05-15 14:27:42'),
(11, 'LOGIN', 'a', '2019-05-15 14:27:58'),
(11, 'LOGIN', 'a', '2019-05-15 14:30:06'),
(11, 'LOGIN', 'a', '2019-05-15 15:30:07'),
(11, 'LOGIN', 'a', '2019-05-15 15:31:26'),
(11, 'LOGIN', 'a', '2019-05-15 15:34:03'),
(11, 'LOGOUT', '', '2019-05-15 16:14:29'),
(11, 'LOGIN', 'a', '2019-05-15 16:14:32'),
(11, 'LOGOUT', '', '2019-05-15 16:14:37'),
(11, 'LOGIN', 'a', '2019-05-15 16:14:39'),
(11, 'LOGIN', 'a', '2019-05-15 16:20:04'),
(11, 'LOGIN', 'a', '2019-05-15 16:21:09'),
(11, 'LOGIN', 'a', '2019-05-15 16:22:53'),
(11, 'LOGIN', 'a', '2019-05-15 16:23:05'),
(11, 'LOGIN', 'a', '2019-05-15 16:27:27'),
(11, 'LOGIN', 'a', '2019-05-15 16:28:02'),
(11, 'LOGIN', 'a', '2019-05-15 16:28:28'),
(11, 'LOGIN', 'a', '2019-05-15 16:29:00'),
(11, 'LOGIN', 'a', '2019-05-15 16:30:07'),
(11, 'LOGIN', 'a', '2019-05-15 16:35:20'),
(11, 'LOGIN', 'a', '2019-05-15 16:38:58'),
(11, 'LOGIN', 'a', '2019-05-15 16:39:39'),
(11, 'LOGIN', 'a', '2019-05-15 16:40:25'),
(11, 'LOGIN', 'a', '2019-05-15 16:41:55'),
(11, 'LOGIN', 'a', '2019-05-15 16:46:42'),
(11, 'LOGIN', 'a', '2019-05-15 16:47:28'),
(11, 'LOGIN', 'a', '2019-05-15 16:48:50'),
(11, 'LOGIN', 'a', '2019-05-15 16:49:54'),
(11, 'LOGIN', 'a', '2019-05-15 16:50:20'),
(11, 'LOGIN', 'a', '2019-05-15 16:53:00'),
(11, 'LOGIN', 'a', '2019-05-15 16:55:38'),
(11, 'LOGIN', 'a', '2019-05-15 16:57:06'),
(11, 'LOGIN', 'a', '2019-05-15 16:58:30'),
(11, 'LOGIN', 'a', '2019-05-15 17:00:59'),
(11, 'LOGIN', 'a', '2019-05-15 17:02:11'),
(11, 'LOGIN', 'a', '2019-05-15 17:04:43'),
(11, 'LOGIN', 'a', '2019-05-15 17:05:09'),
(11, 'LOGIN', 'a', '2019-05-15 17:05:23'),
(11, 'LOGIN', 'a', '2019-05-15 17:06:06'),
(11, 'LOGIN', 'a', '2019-05-15 17:06:35'),
(11, 'LOGIN', 'a', '2019-05-15 17:07:47'),
(11, 'LOGIN', 'a', '2019-05-15 17:08:35'),
(11, 'LOGIN', 'a', '2019-05-15 17:08:51'),
(11, 'LOGIN', 'a', '2019-05-15 17:09:14'),
(11, 'LOGIN', 'a', '2019-05-15 17:10:33'),
(11, 'LOGIN', 'a', '2019-05-15 17:10:51'),
(11, 'LOGIN', 'a', '2019-05-15 17:11:11'),
(11, 'LOGIN', 'a', '2019-05-15 17:13:11'),
(11, 'LOGIN', 'a', '2019-05-15 17:13:45'),
(11, 'LOGIN', 'a', '2019-05-15 17:14:00'),
(11, 'LOGIN', 'a', '2019-05-15 17:14:44'),
(11, 'LOGIN', 'a', '2019-05-15 17:15:08'),
(11, 'LOGIN', 'a', '2019-05-15 17:15:55'),
(11, 'LOGIN', 'a', '2019-05-15 17:16:48'),
(11, 'LOGIN', 'a', '2019-05-15 17:18:47'),
(11, 'LOGIN', 'a', '2019-05-15 17:19:55'),
(11, 'LOGIN', 'a', '2019-05-15 17:20:38'),
(11, 'LOGIN', 'a', '2019-05-15 17:21:05'),
(11, 'LOGIN', 'a', '2019-05-15 17:21:22'),
(11, 'LOGIN', 'a', '2019-05-15 17:21:40'),
(11, 'LOGIN', 'a', '2019-05-15 17:22:12'),
(11, 'LOGIN', 'a', '2019-05-15 17:24:10'),
(11, 'LOGIN', 'a', '2019-05-15 17:24:22'),
(11, 'LOGIN', 'a', '2019-05-15 17:24:40'),
(11, 'LOGIN', 'a', '2019-05-15 17:26:03'),
(11, 'LOGIN', 'a', '2019-05-15 17:26:30'),
(11, 'LOGIN', 'a', '2019-05-15 17:29:08'),
(11, 'LOGIN', 'a', '2019-05-15 17:29:27'),
(11, 'LOGIN', 'a', '2019-05-15 17:30:00'),
(11, 'LOGIN', 'a', '2019-05-15 17:30:15'),
(11, 'LOGIN', 'a', '2019-05-15 17:30:28'),
(11, 'LOGIN', 'a', '2019-05-15 17:30:52'),
(11, 'LOGIN', 'a', '2019-05-15 17:31:17'),
(11, 'LOGIN', 'a', '2019-05-15 17:31:39'),
(11, 'LOGIN', 'a', '2019-05-15 17:32:27'),
(11, 'LOGOUT', '', '2019-05-15 17:36:52'),
(11, 'LOGIN', 'a', '2019-05-15 17:36:54'),
(11, 'LOGIN', 'a', '2019-05-15 17:38:26'),
(11, 'LOGIN', 'a', '2019-05-15 19:54:39'),
(11, 'LOGIN', 'a', '2019-05-15 19:58:35'),
(11, 'LOGIN', 'a', '2019-05-15 20:00:30'),
(11, 'LOGIN', 'a', '2019-05-15 20:01:27'),
(11, 'LOGIN', 'a', '2019-05-15 20:02:19'),
(11, 'LOGIN', 'a', '2019-05-15 20:03:24'),
(11, 'LOGIN', 'a', '2019-05-15 20:03:40'),
(11, 'LOGIN', 'a', '2019-05-15 20:04:43'),
(11, 'LOGIN', 'a', '2019-05-15 20:05:37'),
(11, 'LOGIN', 'a', '2019-05-15 20:07:24'),
(11, 'LOGIN', 'a', '2019-05-15 20:08:20'),
(11, 'LOGIN', 'a', '2019-05-15 20:08:35'),
(11, 'LOGIN', 'a', '2019-05-15 20:09:34'),
(11, 'LOGIN', 'a', '2019-05-15 20:09:51'),
(11, 'LOGIN', 'a', '2019-05-15 20:10:24'),
(11, 'LOGIN', 'a', '2019-05-15 20:10:38'),
(11, 'LOGIN', 'a', '2019-05-15 20:10:50'),
(11, 'LOGIN', 'a', '2019-05-15 20:11:22'),
(11, 'LOGIN', 'a', '2019-05-15 20:12:22'),
(11, 'LOGIN', 'a', '2019-05-15 20:12:39'),
(11, 'LOGIN', 'a', '2019-05-15 20:12:51'),
(11, 'LOGIN', 'a', '2019-05-15 20:13:04'),
(11, 'LOGIN', 'a', '2019-05-15 20:13:53'),
(11, 'LOGIN', 'a', '2019-05-15 20:15:49'),
(11, 'LOGIN', 'a', '2019-05-15 20:16:10'),
(11, 'LOGIN', 'a', '2019-05-15 20:17:56'),
(11, 'LOGIN', 'a', '2019-05-15 21:01:27'),
(11, 'LOGIN', 'a', '2019-05-15 21:15:25'),
(11, 'LOGIN', 'a', '2019-05-15 21:17:40'),
(11, 'LOGIN', 'a', '2019-05-15 21:18:17'),
(11, 'LOGIN', 'a', '2019-05-15 21:20:08'),
(11, 'LOGIN', 'a', '2019-05-15 21:24:27'),
(11, 'LOGIN', 'a', '2019-05-15 21:25:05'),
(11, 'LOGIN', 'a', '2019-05-15 21:30:20'),
(11, 'LOGIN', 'a', '2019-05-15 21:32:04'),
(11, 'LOGIN', 'a', '2019-05-15 21:32:43'),
(11, 'LOGOUT', '', '2019-05-15 21:33:04'),
(11, 'LOGIN', 'a', '2019-05-15 21:33:10'),
(11, 'LOGIN', 'a', '2019-05-15 21:34:35'),
(11, 'LOGIN', 'a', '2019-05-15 21:35:34'),
(11, 'LOGIN', 'a', '2019-05-15 21:36:29'),
(11, 'LOGIN', 'a', '2019-05-15 21:37:33'),
(11, 'LOGIN', 'a', '2019-05-15 21:38:39'),
(11, 'LOGIN', 'a', '2019-05-15 21:40:28'),
(11, 'LOGIN', 'a', '2019-05-15 21:42:02'),
(11, 'LOGIN', 'a', '2019-05-15 21:43:03'),
(11, 'LOGIN', 'a', '2019-05-15 21:44:27'),
(11, 'LOGIN', 'a', '2019-05-15 21:45:42'),
(11, 'LOGIN', 'a', '2019-05-15 21:46:00'),
(11, 'LOGIN', 'a', '2019-05-15 22:08:12'),
(11, 'LOGIN', 'a', '2019-05-15 22:09:20'),
(11, 'LOGIN', 'a', '2019-05-15 22:10:32'),
(11, 'LOGIN', 'a', '2019-05-15 22:10:53'),
(11, 'LOGIN', 'a', '2019-05-15 22:11:25'),
(11, 'LOGIN', 'a', '2019-05-15 22:14:00'),
(11, 'LOGIN', 'a', '2019-05-15 22:14:29'),
(11, 'LOGIN', 'a', '2019-05-15 22:15:42'),
(11, 'LOGIN', 'a', '2019-05-15 22:16:56'),
(11, 'LOGIN', 'a', '2019-05-15 22:18:29'),
(11, 'LOGIN', 'a', '2019-05-15 22:18:56'),
(11, 'LOGIN', 'a', '2019-05-15 22:21:35'),
(11, 'LOGIN', 'a', '2019-05-15 22:22:57'),
(11, 'LOGIN', 'a', '2019-05-15 22:24:00'),
(11, 'LOGIN', 'a', '2019-05-15 22:24:44'),
(11, 'LOGIN', 'a', '2019-05-15 22:25:02'),
(11, 'LOGIN', 'a', '2019-05-15 22:25:37'),
(11, 'LOGIN', 'a', '2019-05-15 22:26:09'),
(11, 'LOGIN', 'a', '2019-05-15 22:27:41'),
(11, 'LOGIN', 'a', '2019-05-15 22:28:00'),
(11, 'LOGIN', 'a', '2019-05-15 22:28:19'),
(11, 'LOGIN', 'a', '2019-05-15 22:28:45'),
(11, 'LOGIN', 'a', '2019-05-15 22:29:47'),
(11, 'LOGIN', 'a', '2019-05-15 22:30:51'),
(11, 'LOGIN', 'a', '2019-05-15 22:32:28'),
(11, 'LOGIN', 'a', '2019-05-15 22:47:48'),
(11, 'LOGIN', 'a', '2019-05-15 22:49:14'),
(11, 'LOGOUT', '', '2019-05-15 22:51:17'),
(11, 'LOGIN', 'a', '2019-05-15 22:51:19'),
(11, 'LOGIN', 'a', '2019-05-15 22:52:56'),
(11, 'LOGIN', 'a', '2019-05-15 22:53:44'),
(11, 'LOGIN', 'a', '2019-05-15 22:57:23'),
(11, 'LOGIN', 'a', '2019-05-15 22:58:45'),
(11, 'LOGIN', 'a', '2019-05-15 22:59:07'),
(11, 'LOGIN', 'a', '2019-05-15 23:00:40'),
(11, 'LOGIN', 'a', '2019-05-15 23:01:23'),
(11, 'LOGIN', 'a', '2019-05-15 23:12:50'),
(11, 'LOGIN', 'a', '2019-05-15 23:15:22'),
(11, 'LOGIN', 'a', '2019-05-15 23:19:29'),
(11, 'LOGIN', 'a', '2019-05-15 23:20:49'),
(11, 'LOGIN', 'a', '2019-05-15 23:21:14'),
(11, 'LOGIN', 'a', '2019-05-15 23:25:39'),
(11, 'LOGIN', 'a', '2019-05-15 23:30:20'),
(11, 'LOGIN', 'a', '2019-05-15 23:32:43'),
(11, 'LOGIN', 'a', '2019-05-15 23:33:41'),
(11, 'LOGIN', 'a', '2019-05-15 23:34:03'),
(11, 'LOGIN', 'a', '2019-05-15 23:34:25'),
(11, 'LOGIN', 'a', '2019-05-15 23:35:26'),
(11, 'LOGIN', 'a', '2019-05-15 23:44:41'),
(11, 'LOGIN', 'a', '2019-05-15 23:45:00'),
(11, 'LOGIN', 'a', '2019-05-15 23:47:57'),
(11, 'LOGIN', 'a', '2019-05-15 23:52:22'),
(11, 'LOGIN', 'a', '2019-05-15 23:55:21'),
(11, 'LOGIN', 'a', '2019-05-16 00:12:15'),
(11, 'LOGIN', 'a', '2019-05-16 00:13:02'),
(11, 'LOGIN', 'a', '2019-05-16 00:17:50'),
(11, 'LOGIN', 'a', '2019-05-16 00:18:45'),
(11, 'LOGIN', 'a', '2019-05-16 00:20:15'),
(11, 'LOGIN', 'a', '2019-05-16 00:26:59'),
(11, 'LOGIN', 'a', '2019-05-16 00:29:18'),
(11, 'LOGIN', 'a', '2019-05-16 00:30:21'),
(11, 'LOGIN', 'a', '2019-05-16 00:30:39'),
(11, 'LOGIN', 'a', '2019-05-16 00:30:56'),
(11, 'LOGIN', 'a', '2019-05-16 00:31:54'),
(11, 'LOGIN', 'a', '2019-05-16 00:32:07'),
(11, 'LOGIN', 'a', '2019-05-16 00:34:17'),
(11, 'LOGIN', 'a', '2019-05-16 00:37:15'),
(11, 'LOGIN', 'a', '2019-05-16 00:37:37'),
(11, 'LOGIN', 'a', '2019-05-16 00:38:53'),
(11, 'LOGIN', 'a', '2019-05-16 00:39:52'),
(11, 'LOGIN', 'a', '2019-05-16 00:40:08'),
(11, 'LOGIN', 'a', '2019-05-16 00:43:18'),
(11, 'LOGIN', 'a', '2019-05-16 00:44:22'),
(11, 'LOGIN', 'a', '2019-05-16 00:46:36'),
(11, 'LOGIN', 'a', '2019-05-16 00:47:56'),
(11, 'LOGIN', 'a', '2019-05-16 00:49:30'),
(11, 'LOGIN', 'a', '2019-05-16 00:50:26'),
(11, 'LOGIN', 'a', '2019-05-16 00:51:08'),
(11, 'LOGIN', 'a', '2019-05-16 00:52:38'),
(11, 'LOGIN', 'a', '2019-05-16 00:53:10'),
(11, 'LOGIN', 'a', '2019-05-16 00:56:24'),
(11, 'LOGIN', 'a', '2019-05-16 00:58:27'),
(11, 'LOGIN', 'a', '2019-05-16 00:59:44'),
(11, 'LOGIN', 'a', '2019-05-16 01:00:18'),
(11, 'LOGIN', 'a', '2019-05-16 01:01:03'),
(11, 'LOGIN', 'a', '2019-05-16 01:02:12'),
(11, 'LOGIN', 'a', '2019-05-16 01:03:36'),
(11, 'LOGIN', 'a', '2019-05-16 01:05:10'),
(11, 'LOGIN', 'a', '2019-05-16 01:07:42'),
(11, 'LOGIN', 'a', '2019-05-16 01:08:30'),
(11, 'LOGIN', 'a', '2019-05-16 01:08:51'),
(11, 'LOGIN', 'a', '2019-05-16 01:09:10'),
(11, 'LOGIN', 'a', '2019-05-16 01:09:39'),
(11, 'LOGIN', 'a', '2019-05-16 01:10:07'),
(11, 'LOGIN', 'a', '2019-05-16 01:10:38'),
(11, 'LOGIN', 'a', '2019-05-16 01:11:57'),
(11, 'LOGIN', 'a', '2019-05-16 01:13:02'),
(11, 'LOGIN', 'a', '2019-05-16 01:13:47'),
(11, 'LOGIN', 'a', '2019-05-16 01:14:11'),
(11, 'LOGIN', 'a', '2019-05-16 01:14:27'),
(11, 'LOGIN', 'a', '2019-05-16 01:15:06'),
(11, 'LOGIN', 'a', '2019-05-16 01:18:40'),
(11, 'LOGOUT', '', '2019-05-16 01:18:55'),
(11, 'LOGIN', 'a', '2019-05-16 01:28:31'),
(11, 'LOGOUT', '', '2019-05-16 01:35:17'),
(11, 'LOGIN', 'a', '2019-06-16 08:25:13'),
(11, 'LOGIN', 'a', '2019-06-16 08:33:18'),
(11, 'LOGIN', 'a', '2019-06-16 09:29:25'),
(11, 'LOGIN', 'a', '2019-06-16 09:29:46'),
(11, 'LOGIN', 'a', '2019-06-16 13:53:02'),
(11, 'LOGOUT', '', '2019-06-16 13:53:13'),
(12, 'CREATE', 'ACHETEUR', '2019-05-16 12:31:32'),
(12, 'LOGIN', 'e', '2019-05-16 12:31:34'),
(12, 'LOGIN', 'e', '2019-05-16 13:15:37'),
(12, 'LOGOUT', '', '2019-05-16 13:16:31'),
(13, 'CREATE', 'ACHETEUR', '2019-05-23 17:18:41'),
(13, 'LOGIN', 't', '2019-05-23 17:18:45'),
(13, 'LOGOUT', '', '2019-05-23 17:19:24'),
(14, 'CREATE', 'ACHETEUR', '2019-05-23 17:19:35'),
(14, 'LOGIN', 'g', '2019-05-23 17:19:38'),
(14, 'CREER_RESTAURANT', 'Projet Santé', '2019-05-23 17:19:58'),
(14, 'CREER_PRODUIT', 'dddd', '2019-05-23 17:20:42'),
(14, 'LOGOUT', '', '2019-05-23 17:20:57'),
(14, 'LOGIN', 'g', '2019-05-23 17:22:35'),
(14, 'EFFACER_RESTAURANT', 'Projet Santé', '2019-05-23 17:22:39'),
(14, 'LOGOUT', '', '2019-05-23 17:22:40');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id_produit` int(255) NOT NULL,
  `id_restaurant` int(255) NOT NULL,
  `id_categorie` int(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix_base` int(255) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `photoName` varchar(255) DEFAULT NULL,
  `bio` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `id_restaurant`, `id_categorie`, `nom`, `prix_base`, `description`, `photoName`, `bio`) VALUES
(4, 1, 1, 'Burger', 3, 'Burger', 'null.jpg', 0),
(5, 4, 2, 'ZINGERS burger', 15, 'Le nouveau Zinger Hotter est effectivement plus épicé que son prédécesseur.  Ici, le délicieux pain au sésame n\'est pas seulement garni d’une laitue fraîche et croquante ', '1557401139588-6380.png', 0),
(6, 4, 3, 'BUCKET FILET', 49, 'Notre Bucket pour deux: avec six délicieux Filet Bites juteux et tendres, panés et marinés selon la recette Originale aux onze herbes et épices, ainsi que huit Crispys panés croustillants.', '1557401200768-8950.png', 0),
(7, 4, 3, 'BOX COMBI ', 21, 'Un mélange parfait: la boîte Combi vous offre le meilleur du poulet dans une boîte. Trois Hot Wings avec panure croustillante et épices piquantes à la marinade Hot & Spicy, deux Crispys croustillants dans le filet de poulet le plus fin.', '1557401269919-7831.png', 0),
(8, 4, 1, 'TWISTER wrap', 12, 'Deux lamelles de filet de poulet fraîchement panées à la main et frites de manière à devenir bien croustillantes régalent vos papilles.', '1557401335518-1512.png', 0),
(9, 4, 1, 'KFC Salade', 10, 'Une salade bariolée: avec la salade Filet Bites de KFC, nous vous servons quatre tendres et délicieux Filet Bites, beaucoup de salade croquante, des tomates et du concombre.', '1557401387921-3862.png', 0),
(10, 4, 3, 'CRISPYS', 12, 'Pour les fans du meilleur filet de poulet pané croustillant. Avec nos lamelles de blancs de poulet légèrement épicés Hot & Spicy.', '1557401457370-3760.png', 0),
(11, 5, 2, 'The Classic', 9, 'Viande de bœuf suisse, petit pain brioché, sauces Relish et à l’ail. Aussi proposés avec du bacon suisse croustillant de Malbuner. Ni plus, ni moins.', '1557401719582-5886.jpeg', 0),
(12, 5, 2, 'Big Mac', 7, 'Viande de bœuf suisse dans un petit pain à la farine de qualité IP-Suisse, salade croquante, fromage fondu et la légendaire sauce Big Mac.', '1557401765205-4443.jpeg', 0),
(13, 5, 2, 'CBO', 8, 'poulet savoureux, fromage fondu au poivre, une tranche de délicieux bacon, salade, oignons grillés et sauce CBO dans des petits pains surmontés de lard.', '1557401806582-5963.jpeg', 0),
(14, 5, 2, 'Quinoa Curry', 8, 'Découvre le Quinoa Curry Veggie avec des tomates bien mûres, de la salade fraîche, du quinoa, le tout avec un délicieux mélange de sauces à l’ail et au curry.', '1557401862294-5325.jpeg', 0),
(15, 5, 3, 'Chicken McNuggets', 16, '20 pieces de tendres morceaux de blanc de poulet panés servis avec une délicieuse sauce. Plusieurs sauces au choix:', '1557401920955-2843.jpeg', 0),
(16, 5, 6, 'Café crème', 4, '100% arabica, grains d’Amérique centrale, d’Amérique du Sud et d’Inde, torréfiés avec soin de manière traditionnelle dans l’entreprise familiale Rast Kaffee. Notre café est toujours fraîchement préparé pour toi.', '1557402052937-5704.jpeg', 0),
(18, 6, 6, 'Café Colombien', 4, 'du café organique Colombien, avec le meilleur gout de l\'Amérique latine', '1557402505942-1557.jpeg', 1),
(19, 6, 6, 'Café renversé', 4, 'du café Brésilien avec su lait suisse la meilleur combinaison  ', '1557402588130-8572.jpeg', 1),
(20, 6, 6, 'Menu café croissant', 5, 'Nous vous offrons plus qu\'un simple café ! Tous les matins jusqu\'à 10h00, un mini-croissant au beurre vous est offert à la consommation', '1557402749249-1424.jpeg', 0),
(21, 6, 9, 'Pizza au chorizo espagnole', 12, 'avec le meilleur gout du méditerranée', '1557402960454-3191.jpeg', 1),
(22, 6, 10, 'paella', 29, 'paella original du méditerranée', '1557403062086-2465.jpeg', 1),
(23, 7, 9, 'SALAMI PASSION', 13, 'Sauce tomate, extra mozzarella, extra salami', '1557403468662-1539.jpeg', 0),
(24, 7, 9, 'REINE', 13, 'Sauce tomate, mozzarella, jambon, extra champignons', '1557403504328-4882.jpeg', 0),
(25, 7, 9, 'HAWAII', 13, 'Sauce tomate, mozzarella, jambon, ananas', '1557403536117-8184.jpeg', 0),
(26, 7, 9, 'DIAVOLA', 13, 'Sauce tomate, mozzarella, salami, jalapeños, poivrons, oignons rouges', '1557403577449-3981.jpeg', 0),
(27, 7, 9, 'EXTRAVAGANZZA', 13, 'Sauce tomate, extra mozzarella, salami, jambon, bœuf, champignons, poivrons, olives, oignons rouges', '1557403611920-1819.jpeg', 0),
(28, 8, 11, 'Poisson', 12, 'Nouveau filet de poisson', '1557403843477-2236.jpeg', 1),
(29, 9, 9, 'Pizza', 13, '', '1557406745419-4845.jpeg', 0),
(30, 4, 7, 'Coca', 4, 'soda de type cola fabriquée par The Coca-Cola Company. Cette marque a été déposée en 1886.', '1557969723779-6038.jpeg', 0),
(31, 4, 7, 'Sprite', 4, ' boisson gazeuse à base d\'extraits de citron et de lime créée par The Coca-Cola Company en 1961. Son goût est proche de la limonade. Le Sprite contient de l\'eau gazéifiée.', '1557969881273-2327.jpeg', 0),
(32, 4, 7, 'Mr Tea', 4, 'arômes de citron, de pêche, de pomme et de fruits rouges. Sa saveur et sa composition soulignent le naturel et le vrai goût de cette feuille ancienne.', '1557970101491-8931.webp', 0);

-- --------------------------------------------------------

--
-- Structure de la table `produits_achete`
--

CREATE TABLE `produits_achete` (
  `id_achat` int(255) NOT NULL,
  `id_produit` int(255) NOT NULL,
  `prix_final` int(255) NOT NULL,
  `quantite` int(255) DEFAULT '1',
  `evaluation` int(255) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produits_achete`
--

INSERT INTO `produits_achete` (`id_achat`, `id_produit`, `prix_final`, `quantite`, `evaluation`) VALUES
(1, 5, 15, 1, 1),
(1, 30, 4, 1, 1),
(2, 5, 15, 1, 1),
(2, 30, 4, 1, 1),
(3, 5, 15, 1, 1),
(3, 30, 4, 1, 1),
(4, 21, 12, 1, 1),
(4, 27, 13, 1, 1),
(4, 31, 4, 1, 1),
(4, 32, 4, 1, 1),
(5, 29, 13, 1, 1),
(5, 32, 4, 1, 1),
(6, 26, 13, 1, 1),
(6, 32, 4, 1, 1),
(7, 21, 12, 1, 1),
(7, 23, 13, 1, 1),
(7, 32, 4, 1, 1),
(8, 21, 12, 1, 1),
(8, 32, 4, 1, 1),
(9, 25, 13, 1, 1),
(9, 32, 4, 1, 1),
(10, 23, 13, 1, 1),
(10, 32, 4, 1, 1),
(11, 23, 13, 1, 1),
(11, 32, 4, 1, 1),
(12, 23, 13, 1, 1),
(12, 32, 4, 1, 1),
(13, 9, 10, 1, 1),
(13, 31, 4, 1, 1),
(14, 9, 10, 1, 1),
(14, 31, 4, 1, 1),
(15, 21, 12, 1, 1),
(15, 32, 4, 1, 1),
(16, 15, 16, 1, 1),
(16, 19, 4, 1, 1),
(17, 15, 16, 1, 1),
(17, 19, 4, 1, 1),
(18, 15, 16, 1, 1),
(18, 19, 4, 1, 1),
(19, 11, 9, 1, 1),
(19, 30, 4, 1, 1),
(20, 11, 9, 1, 1),
(20, 12, 7, 1, 1),
(21, 12, 7, 1, 1),
(21, 13, 8, 1, 1),
(21, 14, 8, 1, 1),
(22, 12, 7, 1, 1),
(22, 14, 8, 1, 1),
(23, 12, 7, 1, 1),
(23, 13, 8, 1, 1),
(23, 14, 8, 1, 1),
(24, 6, 49, 1, 1),
(24, 30, 16, 4, 1),
(25, 6, 49, 1, 1),
(25, 30, 16, 4, 1),
(26, 6, 49, 1, 1),
(26, 30, 16, 4, 1),
(27, 4, 3, 1, 1),
(28, 5, 15, 1, 1),
(28, 24, 52, 4, 1),
(29, 23, 13, 1, 1),
(29, 32, 4, 1, 1),
(30, 5, 15, 1, 1),
(30, 18, 4, 1, 1),
(30, 20, 5, 1, 1),
(30, 21, 12, 1, 1),
(30, 30, 4, 1, 1),
(30, 32, 4, 1, 1),
(31, 5, 15, 1, 1),
(31, 11, 9, 1, 1),
(31, 12, 7, 1, 1),
(31, 13, 8, 1, 1),
(31, 15, 16, 1, 1),
(31, 16, 4, 1, 1),
(31, 18, 4, 1, 1),
(31, 23, 13, 1, 1),
(31, 25, 13, 1, 1),
(31, 29, 13, 1, 1),
(32, 4, 15, 5, 1),
(32, 5, 45, 3, 1),
(32, 8, 12, 1, 1),
(32, 9, 10, 1, 1),
(32, 30, 4, 1, 1),
(32, 31, 24, 6, 1),
(33, 6, 49, 1, 1),
(33, 30, 4, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produits_panier`
--

CREATE TABLE `produits_panier` (
  `id_user` int(255) NOT NULL,
  `id_produit` int(255) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `quantite` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `recommandations`
--

CREATE TABLE `recommandations` (
  `id_user` int(255) NOT NULL,
  `id_produit` int(255) NOT NULL,
  `date_recommendation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `quartier` int(255) DEFAULT NULL,
  `photoName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `id_user`, `nom`, `description`, `adresse`, `telephone`, `quartier`, `photoName`) VALUES
(1, 2, 'l', '-', '', '-', 0, 'null.jpg'),
(2, 2, 'lll', '-', '', '-', 0, 'null.jpg'),
(4, 3, 'KFC', 'Le meilleur goût et la meilleure qualité de produits possibles. Voilà pourquoi nos chefs KFC n’utilisent que de la viande de poulets élevés naturellement et uniquement les filets de poulet les plus fins.', 'rue carouge 12', '022 125 12 12', 0, '1557401068623-5499.png'),
(5, 3, 'Mcdonalds', 'Nous sommes le restaurant de burgers le plus apprécié de Suisse et faisons tout pour le rester. Nous suivons les tendances culinaires, testons de nouvelles technologies pour améliorer notre service.', 'plainpalais', '022 456 12 13', 0, '1557401646897-1102.jpeg'),
(6, 4, 'Le Seize Maine', 'Des fruits et légumes régionaux, des produits laitiers et de la viande Suisse, du poisson MSC. Nous visons l\'objectif zéro déchet', 'Rue des Etangs 16 ', '027 722 05 55 ', 4, '1557402391839-3719.jpeg'),
(7, 7, 'Dominos Pizza', 'Domino\'s Pizza est une franchise internationale de restauration rapide, principalement de préparation et de livraison de pizza. Son siège se situe à Ann Arbor Township dans le Michigan, aux États-Unis.', 'gaillard, 121', '022 456 12 12', 3, '1557403336990-1649.jpeg'),
(8, 8, 'PizzaFactory', '-', '', '-', 0, '1557403774173-3735.jpeg'),
(9, 9, 'PizzaRestau', '-', '', '+41 22', 0, '1557406715242-3475.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `surname`, `password`, `email`) VALUES
(1, 'a', 'a', 'a'),
(2, 'w', 'w', 'w'),
(3, 'andres', 'pass', 'andres@gmail.com'),
(4, 'luz', 'pass', 'luz@mail.com'),
(5, 'Alex', 'Alex', 'Alex@gmail.com'),
(6, 'Andresc', 'Andresc', 'Andresc@gmail.com'),
(7, 'domino', 'pass', 'frsqui@gmail.com'),
(8, 'Jean', 'pass', 'aaa'),
(9, 'p', 'p', 'p'),
(10, 'and', 'pass', 'aodhfkj'),
(11, 'an', 'a', 'a'),
(12, 'e', 'e', 'e'),
(13, 't', 't', 't'),
(14, 'g', 'g', 'g');

-- --------------------------------------------------------

--
-- Structure de la table `vendeurs`
--

CREATE TABLE `vendeurs` (
  `id_user` int(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `bancaire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vendeurs`
--

INSERT INTO `vendeurs` (`id_user`, `nom`, `prenom`, `adresse`, `bancaire`) VALUES
(2, 'w', 'w', 'w', 'w'),
(3, 'caballero', 'andres', 'avenue du lignon', 'CH 1234 1234 1324 1354'),
(4, 'cantillo', 'luz ', 'avenue du lain, 3', 'CH 4561 4561 4651 4651'),
(7, 'caba', 'jean', 'avenue du rhon, 23', 'CH 1234 1234 1234 1234'),
(8, 'Jean', 'Jean', 'Csarouge', 'a'),
(9, 'p', 'p', 'p', 'p'),
(14, 'g', 'g', 'g', 'g');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `achats`
--
ALTER TABLE `achats`
  ADD PRIMARY KEY (`id_achat`),
  ADD KEY `fk3_acheteurs` (`id_user`);

--
-- Index pour la table `acheteurs`
--
ALTER TABLE `acheteurs`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_user`,`time_date`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `propose` (`id_restaurant`),
  ADD KEY `conserne1` (`id_categorie`);

--
-- Index pour la table `produits_achete`
--
ALTER TABLE `produits_achete`
  ADD PRIMARY KEY (`id_achat`,`id_produit`),
  ADD KEY `define` (`id_produit`);

--
-- Index pour la table `produits_panier`
--
ALTER TABLE `produits_panier`
  ADD PRIMARY KEY (`id_user`,`id_produit`),
  ADD KEY `contient` (`id_produit`);

--
-- Index pour la table `recommandations`
--
ALTER TABLE `recommandations`
  ADD PRIMARY KEY (`id_user`,`id_produit`),
  ADD KEY `conserne2` (`id_produit`);

--
-- Index pour la table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`),
  ADD KEY `appartient` (`id_user`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `surname` (`surname`);

--
-- Index pour la table `vendeurs`
--
ALTER TABLE `vendeurs`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `achats`
--
ALTER TABLE `achats`
  MODIFY `id_achat` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id_restaurant` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `achats`
--
ALTER TABLE `achats`
  ADD CONSTRAINT `fk3_acheteurs` FOREIGN KEY (`id_user`) REFERENCES `acheteurs` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `acheteurs`
--
ALTER TABLE `acheteurs`
  ADD CONSTRAINT `est_acheteur` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `login` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `conserne1` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id_categorie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `propose` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurants` (`id_restaurant`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produits_achete`
--
ALTER TABLE `produits_achete`
  ADD CONSTRAINT `define` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rattache` FOREIGN KEY (`id_achat`) REFERENCES `achats` (`id_achat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produits_panier`
--
ALTER TABLE `produits_panier`
  ADD CONSTRAINT `contient` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dispose` FOREIGN KEY (`id_user`) REFERENCES `acheteurs` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `recommandations`
--
ALTER TABLE `recommandations`
  ADD CONSTRAINT `conserne2` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recoit` FOREIGN KEY (`id_user`) REFERENCES `acheteurs` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `appartient` FOREIGN KEY (`id_user`) REFERENCES `vendeurs` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vendeurs`
--
ALTER TABLE `vendeurs`
  ADD CONSTRAINT `est_vendeur` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
