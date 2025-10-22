SELECT 
    Candidat.nom,
    Candidat.prénom,
    Résultat.résultat,
    Résultat.date,
    Résultat.tour
FROM Candidat
INNER JOIN Résultat 
    ON Candidat.id = Résultat.candidat
WHERE Résultat.résultat > (
    SELECT Résultat.résultat
    FROM Candidat
    INNER JOIN Résultat ON Candidat.id = Résultat.candidat
    INNER JOIN Candidature ON Résultat.candidat = Candidature.candidat
    INNER JOIN Conton ON Candidature.conton = Conton.nom
    WHERE 
        Candidat.nom = 'Dupont'
        AND Candidat.prénom = 'Olivier'
        AND YEAR(Candidature.date) = 2011
        AND Conton.nom = 'NICE3'
        AND Résultat.tour = 1
    LIMIT 1
);
