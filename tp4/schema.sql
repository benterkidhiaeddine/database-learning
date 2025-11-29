CREATE TABLE IF NOT EXISTS Utilisateur (
    émail VARCHAR(30),
    nom VARCHAR(30) NOT NULL,
    prénom VARCHAR(30) NOT NULL,
    PRIMARY KEY (émail)

) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Profile (
    introduction TEXT,
    profession VARCHAR(50),
    utilisateur_émail VARCHAR(30) NOT NULL,
    PRIMARY KEY (utilisateur_émail),
    FOREIGN KEY (utilisateur_émail) REFERENCES Utilisateur(émail)
    ON DELETE CASCADE
    ON UPDATE CASCADE

) ENGINE=InnoDB;



CREATE TABLE IF NOT EXISTS ExpériencePro (
    nom_entreprise VARCHAR(50) NOT NULL,
    fonction VARCHAR(50) NOT NULL,
    durée_mois INT UNSIGNED NOT NULL,
    date_début DATE NOT NULL,
    date_fin DATE NULL,
    utilisateur_émail VARCHAR(30) NOT NULL,
    PRIMARY KEY (utilisateur_émail , date_début),
    FOREIGN KEY (utilisateur_émail) REFERENCES Profile(utilisateur_émail)
    ON DELETE CASCADE
    ON UPDATE CASCADE

) ENGINE=InnoDB;




CREATE TABLE IF NOT EXISTS Agenda (
    id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL ,
    nom_agenda VARCHAR(50) NOT NULL,
    description TEXT NULL,
    lieu VARCHAR(50),
    confidentialité  ENUM("défaut", "public", "privé") NOT NULL,
    utilisateur_émail VARCHAR(30) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (utilisateur_émail) REFERENCES Profile(utilisateur_émail)
    ON DELETE CASCADE
    ON UPDATE CASCADE

) ENGINE=InnoDB;



CREATE TABLE IF NOT EXISTS AgendaInvité (
    agenda_id BIGINT UNSIGNED  NOT NULL ,
    utilisateur_émail VARCHAR(30) NOT NULL,
    PRIMARY KEY (agenda_id, utilisateur_émail),
    FOREIGN KEY (utilisateur_émail) REFERENCES Profile(utilisateur_émail)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (agenda_id) REFERENCES Agenda(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE

) ENGINE=InnoDB;



CREATE TABLE IF NOT EXISTS Evénement (
    id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL ,
    lieu VARCHAR(50) NOT NULL ,
    description TEXT NOT NULL,
    date DATE NOT NULL,
    heure_début TIME NOT NULL,
    heure_fin TIME NOT NULL, 

    agenda_id BIGINT UNSIGNED NOT NULL ,
    PRIMARY KEY (id),
    FOREIGN KEY (agenda_id) REFERENCES Agenda(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE

) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS EvénementInvité (
    événement_id BIGINT UNSIGNED  NOT NULL ,
    utilisateur_émail VARCHAR(30) NOT NULL,
    PRIMARY KEY (événement_id, utilisateur_émail),
    FOREIGN KEY (utilisateur_émail) REFERENCES Profile(utilisateur_émail)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (événement_id) REFERENCES Evénement(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE

) ENGINE=InnoDB;


