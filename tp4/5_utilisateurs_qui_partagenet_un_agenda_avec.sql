SELECT nom FROM Utilisateur
WHERE not EXISTS (
    SELECT * FROM AgendaInvité
    WHERE AgendaInvité.utilisateur_émail != Utilisateur.émail
);