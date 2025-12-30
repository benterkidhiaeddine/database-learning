SELECT nom
FROM Employé E 
WHERE E.salaire = (
    SELECT salaire FROM Employé E2
    WHERE E2. nom = "Dupont"
)
AND nom != "Dupont";
