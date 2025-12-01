-- 1. Nombre d’unités disponibles du/des produit/produits "Ventilateur".

SELECT unites
FROM Amazon_Produit
JOIN Amazon_Stock
    ON Amazon_Produit.code = Amazon_Stock.codeProduit
WHERE Amazon_Produit.nom = "Ventilateur"
ORDER BY Amazon_Stock.date DESC
LIMIT 1;


-- 2. Nombre de commandes de livres effectués par "Marie Pascal" (N.B. Livre est une
-- categorie). 


SELECT Count(*)
FROM Amazon_Client 
JOIN Amazon_Commande 
    ON Amazon_Client.code = Amazon_Commande.codeClient 
JOIN Amazon_Produit
    ON Amazon_Commande.codeProduit = Amazon_Produit.code
Join Amazon_Categorie 
    ON Amazon_Categorie.code = Amazon_Produit.codeCategorie
WHERE Amazon_Client.nom = "Pascal" AND Amazon_Client.prenom = "Marie" AND Amazon_Categorie.nom = "Livres";




--3. Les clients (code) qui ont acheté sur Amazon pendent le mois de novembre 2013.
-- Pour chaque client, donner la quantité totale des produits achetés. Optionnel : le
-- resultat doit être ordonnée selon le client qui a acheté la quantité la plus grande des
-- produits. 

SELECT  SUM(quantité) AS quantité_total_acheté
FROM Amazon_Commande 
WHERE Amazon_Commande.date BETWEEN  "2013-11-01" AND "2013-11-30"
GROUP BY codeClient 
ORDER BY quantité_total_acheté DESC;


-- 4. Noms des produits qui ne sont pas achetés
SELECT Amazon_Produit.nom
FROM Amazon_Produit
LEFT JOIN Amazon_Commande
ON Amazon_Produit.code = Amazon_Commande.codeProduit
WHERE Amazon_Commande.code IS NULL;


-- 5. Les produits dont le prix est superieur aux prix moyen des produits de la même
--categorie.

SELECT  *
FROM Amazon_Produit p
WHERE p.prix > (
    SELECT AVG(p2.prix) 
    FROM Amazon_Produit p2
    WHERE p2.codeCategorie = p.codeCategorie
);

