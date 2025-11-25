-- Informationssysteme I – Datenbankerstellung mit SQL
-- Basisschema nach Praktikumsaufgabe 1 & 2
-- Autor: Steven Illg

-- Tabelle: Kunden
CREATE TABLE Kunden (
  Kundennummer NUMBER(7) NOT NULL
    CHECK (Kundennummer >= 1000),
  Name         VARCHAR2(55) NOT NULL,
  Straße       VARCHAR2(55) NOT NULL,
  PLZ          VARCHAR2(5)  NOT NULL,
  Ort          VARCHAR2(45),
  CONSTRAINT Kunden_PK
    PRIMARY KEY (Kundennummer)
);

-- Tabelle: Bestellungen
CREATE TABLE Bestellungen (
  Bestellnummer NUMBER(6) NOT NULL
    CHECK (Bestellnummer >= 100000),
  Kundennummer  NUMBER(7) NOT NULL,
  Bestelldatum  DATE      NOT NULL,
  Status        NUMBER(1) NOT NULL
    CHECK (Status IN (1, 2, 3, 4, 5)),
  CONSTRAINT Bestellungen_PK
    PRIMARY KEY (Bestellnummer),
  CONSTRAINT Bestellungen_FK
    FOREIGN KEY (Kundennummer)
    REFERENCES Kunden (Kundennummer)
);

-- Tabelle: Bestellpositionen
CREATE TABLE Bestellpositionen (
  Bestellnummer NUMBER(6) NOT NULL,
  Artikelnummer NUMBER(5) NOT NULL,
  Menge         NUMBER(4) NOT NULL,
  CONSTRAINT Bestellpositionen_PK
    PRIMARY KEY (Bestellnummer, Artikelnummer),
  CONSTRAINT Bestellpositionen_FK
    FOREIGN KEY (Bestellnummer)
    REFERENCES Bestellungen (Bestellnummer),
  CONSTRAINT Bestellpositionen2_FK
    FOREIGN KEY (Artikelnummer)
    REFERENCES Artikel (Artikelnummer)
);

-- Tabelle: Artikel
CREATE TABLE Artikel (
  Artikelnummer NUMBER(5)   NOT NULL
    CHECK (Artikelnummer >= 10000),
  Artikelname   VARCHAR2(50) NOT NULL,
  Produktgruppe VARCHAR2(30) NOT NULL,
  Verkaufspreis NUMBER(6,2)  NOT NULL,
  CONSTRAINT Artikel_PK
    PRIMARY KEY (Artikelnummer)
);

-- Tabelle: Konditionen
CREATE TABLE Konditionen (
  Lieferantennummer NUMBER(7) NOT NULL,
  Artikelnummer     NUMBER(5) NOT NULL,
  Einkaufspreis     NUMBER(6,2) NOT NULL,
  CONSTRAINT Konditionen_PK
    PRIMARY KEY (Lieferantennummer, Artikelnummer),
  CONSTRAINT Konditionen_FK
    FOREIGN KEY (Lieferantennummer)
    REFERENCES Lieferanten (Lieferantennummer),
  CONSTRAINT Konditionen2_FK
    FOREIGN KEY (Artikelnummer)
    REFERENCES Artikel (Artikelnummer)
);

-- Tabelle: Lieferanten
CREATE TABLE Lieferanten (
  Lieferantennummer NUMBER(7)  NOT NULL,
  Name              VARCHAR2(30) NOT NULL,
  Straße            VARCHAR2(55) NOT NULL,
  PLZ               VARCHAR2(5)  NOT NULL,
  Ort               VARCHAR2(45),
  CONSTRAINT Lieferanten_PK
    PRIMARY KEY (Lieferantennummer)
);
