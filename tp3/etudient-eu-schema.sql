CREATE TABLE IF NOT EXISTS SQL_Adresse (
    numéro BIGINT UNSIGNED AUTO_INCREMENT NOT NULL ,
    numéro_de_rue INT UNSIGNED  NOT NULL ,
    nom_de_rue VARCHAR(50) NOT NULL, 
    nom_de_ville VARCHAR(50) NOT NULL, 
    code_postal INT(5) UNSIGNED ZEROFILL NOT NULL ,
    caractère ENUM("t", "b" , " ") NULL,
    PRIMARY KEY (numéro)
) ENGINE=InnoDB;



CREATE TABLE IF NOT EXISTS SQL_Etudiant (
    numéro INT UNSIGNED NOT NULL,
    nom VARCHAR(30) NOT NULL, 
    prénom VARCHAR(30) NOT NULL, 
    num_adresse BIGINT UNSIGNED NOT NULL ,
    PRIMARY KEY (numéro),
    FOREIGN KEY (num_adresse) REFERENCES SQL_Adresse(numéro) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
) ENGINE=InnoDB;




CREATE TABLE IF NOT EXISTS SQL_Enseignant (
    numéro INT UNSIGNED NOT NULL,
    nom VARCHAR(30) NOT NULL, 
    prénom VARCHAR(30) NOT NULL, 
    age TINYINT UNSIGNED NOT NULL ,
    ville  VARCHAR(50) NOT NULL, 
    nombre_heures SMALLINT UNSIGNED NOT NULL, 
    PRIMARY KEY (numéro)
) ENGINE=InnoDB;




CREATE TABLE IF NOT EXISTS SQL_EU (
    code CHAR(6) NOT NULL,
    libellé VARCHAR(30) NOT NULL, 
    nombre_heures TINYINT UNSIGNED NOT NULL, 
    num_enseignant INT UNSIGNED NOT NULL ,
    PRIMARY KEY (code),
    FOREIGN KEY (num_enseignant) REFERENCES SQL_Enseignant(numéro) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE

) ENGINE=InnoDB ;


CREATE TABLE IF NOT EXISTS SQL_EtudiantEU (
    note_cc DECIMAL(4, 2),
    note_examen DECIMAL(4, 2),
    code_eu CHAR(6) NOT NULL ,
    num_étudiant INT UNSIGNED NOT NULL, 
    FOREIGN KEY (code_eu) REFERENCES SQL_EU(code) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
   
    FOREIGN KEY (num_étudiant) REFERENCES SQL_Etudiant(numéro) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,


    PRIMARY KEY (code_eu, num_étudiant)

) ENGINE=InnoDB;
