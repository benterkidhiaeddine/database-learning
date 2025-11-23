SELECT DISTINCT Candidat.nom
FROM Candidat INNER JOIN Candidature ON Candidat.id = Candidature.candidat INNER JOIN Conton ON Candidature.conton = Conton.nom
WHERE YEAR(Candidature.date) = 2011 AND Conton.nom = "NICE4";
