-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 22, 2025 at 09:09 AM
-- Server version: 10.6.22-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `L2I_BENTERKI`
--

-- --------------------------------------------------------

--
-- Table structure for table `Candidat`
--

CREATE TABLE `Candidat` (
  `id` int(50) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prénom` varchar(50) NOT NULL,
  `ville` int(11) NOT NULL,
  `parti` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Candidature`
--

CREATE TABLE `Candidature` (
  `date` date NOT NULL,
  `adjoint` int(10) UNSIGNED NOT NULL,
  `candidat` int(10) UNSIGNED NOT NULL,
  `conton` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Conton`
--

CREATE TABLE `Conton` (
  `nom` varchar(50) NOT NULL,
  `nb_électeurs` int(10) UNSIGNED NOT NULL,
  `departement` varchar(50) NOT NULL,
  `montant_dep` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Parti`
--

CREATE TABLE `Parti` (
  `nom` varchar(50) NOT NULL,
  `nombre_adhérents` int(11) UNSIGNED NOT NULL,
  `catégorie` enum('droite','gauche','centre','extrème_gauche','extrème_droite') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Résultat`
--

CREATE TABLE `Résultat` (
  `date` date NOT NULL,
  `candidat` int(10) UNSIGNED NOT NULL,
  `tour` tinyint(3) UNSIGNED NOT NULL,
  `résultat` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Candidat`
--
ALTER TABLE `Candidat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parti_fk` (`parti`);

--
-- Indexes for table `Candidature`
--
ALTER TABLE `Candidature`
  ADD PRIMARY KEY (`date`,`candidat`),
  ADD KEY `candidat` (`candidat`),
  ADD KEY `adjoint` (`adjoint`),
  ADD KEY `conton` (`conton`);

--
-- Indexes for table `Conton`
--
ALTER TABLE `Conton`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `Parti`
--
ALTER TABLE `Parti`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `Résultat`
--
ALTER TABLE `Résultat`
  ADD PRIMARY KEY (`date`,`candidat`,`tour`),
  ADD KEY `candidat` (`candidat`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Candidat`
--
ALTER TABLE `Candidat`
  ADD CONSTRAINT `parti_fk` FOREIGN KEY (`parti`) REFERENCES `Parti` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Candidature`
--
ALTER TABLE `Candidature`
  ADD CONSTRAINT `Candidature_ibfk_1` FOREIGN KEY (`candidat`) REFERENCES `Candidat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Candidature_ibfk_2` FOREIGN KEY (`adjoint`) REFERENCES `Candidat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Candidature_ibfk_3` FOREIGN KEY (`conton`) REFERENCES `Conton` (`nom`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Résultat`
--
ALTER TABLE `Résultat`
  ADD CONSTRAINT `Résultat_ibfk_1` FOREIGN KEY (`candidat`) REFERENCES `Candidat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
