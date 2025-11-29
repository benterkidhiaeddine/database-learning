SELECT * 
FROM Evénement 
JOIN EvénementInvité 
ON Evénement.id = EvénementInvité.événement_id;