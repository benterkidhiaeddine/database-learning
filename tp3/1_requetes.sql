-- Exercice 1
SELECT numéro_de_rue , nom_de_rue , nom_de_ville FROM SQL_Adresse;



SELECT nom , prénom  FROM SQL_Etudiant;


SELECT libellé , num_enseignant   FROM SQL_EU;


SELECT DISTINCT code_postal , nom_de_ville  FROM SQL_Adresse;
SELECT code_postal , nom_de_ville  FROM SQL_Adresse;


SELECT * FROM SQL_Etudiant
WHERE nom = "Nom1";


SELECT num_étudiant  FROM SQL_EtudiantEU
WHERE code_eu  = "SL2IBD";


SELECT *  FROM SQL_Enseignant
WHERE prénom  = "Philippe";


SELECT *  FROM SQL_Enseignant
WHERE prénom  LIKE "%pp%"
OR prénom LIKE "%ll%" ;




SELECT nom_de_rue  FROM SQL_Adresse
WHERE nom_de_ville = "Nice";


-- Exercice 2


-- 1. Afficher tous les noms et prénoms d’étudiants qui suivent l’UE « SL2IBD » ou l’UE « SL2IPI ».
SELECT nom , prénom 
FROM SQL_Etudiant JOIN SQL_EtudiantEU
ON SQL_Etudiant.numéro = SQL_EtudiantEU.num_étudiant
WHERE SQL_EtudiantEU.code_eu = "SL2IBD" OR SQL_EtudiantEU.code_eu = "SL2IPI";


-- 2. Afficher tous les noms et prénoms d’étudiants ainsi que le libellé des UEs toujours pour ceux qui
-- suivent l’UE « SL2IBD » ou l’UE « SL2IPI »
SELECT nom , prénom , libellé
FROM SQL_Etudiant JOIN SQL_EtudiantEU JOIN SQL_EU
ON SQL_Etudiant.numéro = SQL_EtudiantEU.num_étudiant AND SQL_EtudiantEU.code_eu = SQL_EU.code
WHERE SQL_EtudiantEU.code_eu = "SL2IBD" OR SQL_EtudiantEU.code_eu = "SL2IPI";


-- 3. Afficher tous les étudiants dont le nom est « Nom1 », mais en affichant que le prénom de l’étudiant
-- et le nom de la rue où il habite.
SELECT prénom , nom_de_rue
FROM SQL_Etudiant JOIN SQL_Adresse
ON SQL_Etudiant.num_adresse = SQL_Adresse.numéro
WHERE SQL_Etudiant.nom = "Nom1";


-- 4. Afficher le nom du responsable de chacune des UEs « SL2IBD » et « SL2IPI »
SELECT nom 
FROM SQL_Enseignant JOIN SQL_EU
ON SQL_EU.num_enseignant = SQL_Enseignant.numéro
WHERE SQL_EU.code = "SL2IBD" OR  SQL_EU.code = "SL2IPI";


-- 5. Afficher le nom de l’étudiant, le libellé de l’UE et la note de CC de chacun des étudiants.
SELECT nom ,  libellé, note_cc
FROM SQL_Etudiant JOIN SQL_EtudiantEU JOIN SQL_EU
ON SQL_Etudiant.numéro = SQL_EtudiantEU.num_étudiant AND SQL_EtudiantEU.code_eu = SQL_EU.code;



-- 6. Afficher le nom de l’étudiant, le libellé de l’UE et la note de CC de chacun des étudiants dont le nom commence par « Nom ».
SELECT nom ,  libellé, note_cc
FROM SQL_Etudiant JOIN SQL_EtudiantEU JOIN SQL_EU
ON SQL_Etudiant.numéro = SQL_EtudiantEU.num_étudiant AND SQL_EtudiantEU.code_eu = SQL_EU.code
WHERE SQL_Etudiant.nom LIKE "Nom%";



-- Exercice 3

-- 1. Donner la somme des heures associées aux UE « SL2IBD » et « SL2IPI »
SELECT SUM(nombre_heures) FROM SQL_EU
WHERE code = "SL2IBD" OR code = "SL2IPI";



-- 2. Compter le nombre d’étudiant ayant suivi l’UE « SL2IPI ».
SELECT COUNT(num_étudiant ) FROM SQL_EtudiantEU
WHERE code_eu = "SL2IPI";


-- 3. Compter le nombre de prénoms d’étudiant, différents.
SELECT COUNT(DISTINCT prénom) FROM SQL_Etudiant;



-- 4. Donner le nom et le prénom des étudiants qui suivent l’UE « SL2IBD » mais pas l’UE « SL2IAL».
SELECT nom, prénom
FROM SQL_Etudiant 
JOIN SQL_EtudiantEU
  ON SQL_Etudiant.numéro = SQL_EtudiantEU.num_étudiant
WHERE SQL_EtudiantEU.code_eu = 'SL2IBD'

EXCEPT

SELECT nom, prénom
FROM SQL_Etudiant 
JOIN SQL_EtudiantEU
  ON SQL_Etudiant.numéro = SQL_EtudiantEU.num_étudiant
WHERE SQL_EtudiantEU.code_eu = 'SL2IAL';



-- 5. Donner le numéro des étudiants qui ont une note examen dans l’UE « SL2IBD » supérieure à la
-- moyenne des notes obtenues à l’examen de cette UE.
SELECT nom, prénom
FROM SQL_Etudiant 
JOIN SQL_EtudiantEU
  ON SQL_Etudiant.numéro = SQL_EtudiantEU.num_étudiant
WHERE  SQL_EtudiantEU.note_examen  > (
    SELECT AVG(note_examen) FROM SQL_EtudiantEU
    WHERE code_eu = "SL2IBD");
 

-- 6. Donner le libelle des UE dont la moyenne de contrôle continue est supérieure à 10.

SELECT libellé, AVG(note_cc) AS moyenne_cc 
FROM SQL_EU 
JOIN SQL_EtudiantEU
  ON SQL_EU.code = SQL_EtudiantEU.code_eu
GROUP BY code_eu
HAVING moyenne_cc > 10;
 

-- 7. Donner le nom des étudiants qui n’ont pas la moins bonne note dans l’UE « SL2IBD ».

SELECT nom 
FROM SQL_Etudiant 
JOIN SQL_EtudiantEU
  ON SQL_Etudiant.numéro = SQL_EtudiantEU.num_étudiant
WHERE note_examen  > (
    	SELECT MIN(note_examen) FROM SQL_EtudiantEU
    	WHERE code_eu = "SL2IBD"
    );
 


 