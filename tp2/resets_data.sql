-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Delete data in dependency order
DELETE FROM Résultat;
DELETE FROM Candidature;
DELETE FROM Candidat;
DELETE FROM Conton;
DELETE FROM Parti;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;