-- ============================
-- TABLE 1 : Client
-- ============================
CREATE TABLE IF NOT EXISTS Client (
    client_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    adresse VARCHAR(255),
    telephone VARCHAR(30),
    PRIMARY KEY (client_id)
);

-- ============================
-- TABLE 2 : Systeme
-- ============================
CREATE TABLE IF NOT EXISTS Systeme (
    code_systeme VARCHAR(100) NOT NULL,
    PRIMARY KEY (code_systeme)
);

-- ============================
-- TABLE 3 : Voiture
-- ============================
CREATE TABLE IF NOT EXISTS Voiture (
    plaque VARCHAR(50) UNIQUE NOT NULL,
    marque VARCHAR(100) NOT NULL,
    modele VARCHAR(100) NOT NULL,
    couleur VARCHAR(50),
    date_immatriculation DATE,
    client_id BIGINT UNSIGNED NOT NULL,
    code_systeme VARCHAR(100) NOT NULL,
    PRIMARY KEY (plaque),
    FOREIGN KEY (client_id) REFERENCES Client(client_id)
        ON DELETE CASCADE,
    FOREIGN KEY (code_systeme) REFERENCES Systeme(code_systeme)
        ON DELETE CASCADE
);

-- ============================
-- TABLE 4 : DonneesVoiture
-- ============================
CREATE TABLE IF NOT EXISTS DonneesVoiture (
    donnee_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    date_reception DATE NOT NULL,
    heure_reception TIME NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    alarme_active BOOLEAN NOT NULL,
    portes_verrouillees BOOLEAN NOT NULL,
    code_systeme VARCHAR(100) NOT NULL,
    PRIMARY KEY (donnee_id),
    FOREIGN KEY (code_systeme) REFERENCES Systeme(code_systeme)
        ON DELETE CASCADE
);

-- ============================
-- TABLE 5 : Partenaire
-- ============================
CREATE TABLE IF NOT EXISTS Partenaire (
    partenaire_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    adresse VARCHAR(255),
    telephone VARCHAR(30),
    PRIMARY KEY (partenaire_id)
);

-- ============================
-- TABLE 6 : Installation
-- ============================
CREATE TABLE IF NOT EXISTS Installation (
    partenaire_id BIGINT UNSIGNED NOT NULL,
    date_installation DATE NOT NULL,
    code_systeme VARCHAR(100) NOT NULL,
    PRIMARY KEY (code_systeme, partenaire_id),
    FOREIGN KEY (code_systeme) REFERENCES Systeme(code_systeme)
        ON DELETE CASCADE,
    FOREIGN KEY (partenaire_id) REFERENCES Partenaire(partenaire_id)
        ON DELETE CASCADE
);
