-- Insertion des partis politiques
INSERT INTO Parti (nom, nombre_adhérents, catégorie) VALUES
('Parti Rouge', 12000, 'extrème_gauche'),
('Union Populaire', 9500, 'gauche'),
('Parti Bleu', 18000, 'droite'),
('Mouvement du Centre', 7600, 'centre'),
('Front National', 14500, 'extrème_droite');

-- Insertion des cantons
INSERT INTO Conton (nom, nb_électeurs, departement, montant_dep) VALUES
('NICE1', 25000, 'Alpes-Maritimes', 50000),
('NICE2', 28000, 'Alpes-Maritimes', 60000),
('NICE3', 32000, 'Alpes-Maritimes', 80000),
('NICE4', 27000, 'Alpes-Maritimes', 55000),
('CANNES1', 30000, 'Alpes-Maritimes', 70000);

-- Insertion des candidats
INSERT INTO Candidat (id, nom, prénom, ville, parti) VALUES
(1, 'Dupont', 'Olivier', 1, 'Union Populaire'),
(2, 'Martin', 'Sophie', 2, 'Parti Rouge'),
(3, 'Durand', 'Paul', 3, 'Parti Bleu'),
(4, 'Petit', 'Claire', 4, 'Mouvement du Centre'),
(5, 'Lemoine', 'Antoine', 5, 'Front National'),
(6, 'Garcia', 'Laura', 6, 'Parti Rouge'),
(7, 'Bernard', 'Luc', 7, 'Parti Rouge'),
(8, 'Robert', 'Julie', 8, 'Union Populaire');

-- Insertion des candidatures (année 2011)
INSERT INTO Candidature (date, adjoint, candidat, conton) VALUES
('2011-03-15', 7, 1, 'NICE3'),   -- Dupont (Nice3, adjoint = Bernard)
('2011-03-15', 6, 2, 'NICE4'),   -- Martin (extrême gauche) à NICE4
('2011-03-15', 4, 3, 'NICE3'),   -- Durand à NICE3
('2011-03-15', 5, 4, 'NICE2'),   -- Petit à NICE2
('2011-03-15', 1, 5, 'NICE1'),   -- Lemoine à NICE1
('2011-03-15', 8, 6, 'NICE3'),   -- Garcia à NICE3
('2011-03-15', 3, 7, 'NICE4'),   -- Bernard (adjoint = Durand) à NICE4
('2012-03-15', 2, 3, 'NICE3'),   -- Durand se représente à NICE3 en 2012
('2013-03-15', 4, 3, 'NICE3'),   -- Durand se représente encore à NICE3
('2011-03-15', 1, 8, 'CANNES1'); -- Robert à Cannes1

-- Insertion des résultats du premier tour
INSERT INTO Résultat (date, candidat, tour, résultat) VALUES
('2011-03-15', 1, 1, 12000),  -- Dupont (NICE3)
('2011-03-15', 2, 1, 13000),  -- Martin (NICE4)
('2011-03-15', 3, 1, 15000),  -- Durand (NICE3)
('2011-03-15', 4, 1, 9000),   -- Petit (NICE2)
('2011-03-15', 5, 1, 11000),  -- Lemoine (NICE1)
('2011-03-15', 6, 1, 14000),  -- Garcia (NICE3)
('2011-03-15', 7, 1, 7000),   -- Bernard (NICE4)
('2011-03-15', 8, 1, 8000),   -- Robert (CANNES1)
('2012-03-15', 3, 1, 16000),  -- Durand (NICE3, 2012)
('2013-03-15', 3, 1, 15500);  -- Durand (NICE3, 2013)
