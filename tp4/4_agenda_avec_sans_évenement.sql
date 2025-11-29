SELECT nom_agenda
FROM Agenda 
LEFT JOIN Evénement 
    ON Agenda.id = Evénement.agenda_id
LEFT JOIN EvénementInvité
    ON Evénement.id = EvénementInvité.événement_id
WHERE Agenda.confidentialité = 'défaut'
  AND EvénementInvité.utilisateur_émail IS NULL;