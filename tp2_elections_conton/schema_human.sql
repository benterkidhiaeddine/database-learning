-- --------------------------------------------------------
-- Script SQL : Structure de la base de données L2I_BENTERKI
-- Auteur : Dhia Eddine BENTERKI
-- Date : 22 Octobre 2025
-- Description : Script de création des tables et contraintes
-- --------------------------------------------------------

-- Préparation de la base
SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
START TRANSACTION;
SET time_zone = '+00:00';
SET NAMES utf8mb4 COLLATE utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table : Parti
-- --------------------------------------------------------
CREATE TABLE Parti (
  nom VARCHAR(50) NOT NULL,
  nombre_adhérents INT UNSIGNED NOT NULL,
  catégorie ENUM('droite','gauche','centre','extrème_gauche','extrème_droite') NOT NULL,
  PRIMARY KEY (nom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table : Conton
-- --------------------------------------------------------
CREATE TABLE Conton (
  nom VARCHAR(50) NOT NULL,
  nb_électeurs INT UNSIGNED NOT NULL,
  departement VARCHAR(50) NOT NULL,
  montant_dep DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (nom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table : Candidat
-- --------------------------------------------------------
CREATE TABLE Candidat (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  prénom VARCHAR(50) NOT NULL,
  ville INT NOT NULL,
  parti VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_parti FOREIGN KEY (parti)
    REFERENCES Parti (nom)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table : Candidature
-- --------------------------------------------------------
CREATE TABLE Candidature (
  date DATE NOT NULL,
  adjoint INT UNSIGNED NOT NULL,
  candidat INT UNSIGNED NOT NULL,
  conton VARCHAR(50) NOT NULL,
  PRIMARY KEY (date, candidat),
  CONSTRAINT fk_candidat FOREIGN KEY (candidat)
    REFERENCES Candidat (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_adjoint FOREIGN KEY (adjoint)
    REFERENCES Candidat (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_conton FOREIGN KEY (conton)
    REFERENCES Conton (nom)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- Table : Résultat
-- --------------------------------------------------------
CREATE TABLE Résultat (
  date DATE NOT NULL,
  candidat INT UNSIGNED NOT NULL,
  tour TINYINT UNSIGNED NOT NULL,
  résultat DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (date, candidat, tour),
  CONSTRAINT fk_resultat_candidat FOREIGN KEY (candidat)
    REFERENCES Candidat (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

COMMIT;
