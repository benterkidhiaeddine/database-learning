-- 1. Afficher le code et le libellé des EU qui durent exatement 42 heures 

SELECT code, libelle
FROM UE 
WHERE nombre_heures = 42;



--  2. Selectionner le nombre d'inscriptions


SELECT COUNT(*)
FROM EtudiantUE;


-- 3. Lister le nom des étudiants ayant obtenu une note d'examen supérieure à 18.00

SELECT  Etudiant.nom 
FROM Etudiant
JOIN  EtudiantUE
ON Etudiant.numero = EtudiantUE.num_etudient
WHERE note_examen > 18;

-- 4. Lister le code et le libellé des UE dont  la note minimale à l'examen < 10.00
SELECT DISTINCT UE.code , UE.libelle
FROM UE 
WHERE 10 > (
    SELECT MIN(EtudiantUE.note_examen) 
    FROM EtudiantUE 
    WHERE EtudiantUE.code_ue = UE.code
)



 