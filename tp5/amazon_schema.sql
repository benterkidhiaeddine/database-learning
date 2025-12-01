CREATE TABLE IF NOT EXISTS Amazon_Client (
    code INT NOT NULL,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    codeAdresse VARCHAR(255),
    telephone VARCHAR(20),
    PRIMARY KEY (code)
);

CREATE TABLE IF NOT EXISTS Amazon_Categorie (
    code INT NOT NULL,
    nom VARCHAR(100),
    PRIMARY KEY (code)
);

CREATE TABLE IF NOT EXISTS Amazon_Produit (
    code INT NOT NULL,
    nom VARCHAR(100),
    description TEXT,
    codeCategorie INT,
    prix DECIMAL(10,2),
    PRIMARY KEY (code),
    FOREIGN KEY (codeCategorie) REFERENCES Amazon_Categorie(code)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Amazon_Stock (
    `date` DATE,
    codeProduit INT,
    unites INT,
    PRIMARY KEY (`date`, codeProduit),
    FOREIGN KEY (codeProduit) REFERENCES Amazon_Produit(code)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Amazon_Commande (
    code INT NOT NULL,
    `date` DATE,
    codeClient INT,
    codeProduit INT,
    quantite INT,
    PRIMARY KEY (code),
    FOREIGN KEY (codeClient) REFERENCES Amazon_Client(code)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (codeProduit) REFERENCES Amazon_Produit(code)
    ON DELETE CASCADE
    ON UPDATE CASCADE   
);
