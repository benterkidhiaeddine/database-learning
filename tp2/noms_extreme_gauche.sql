SELECT DISTINCT Candidat.nom
 FROM Candidat INNER JOIN Parti ON Candidat.parti = Parti.nom
 WHERE Parti.catégorie = "extrème_gauche";
