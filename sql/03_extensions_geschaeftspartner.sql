-- Erweiterung: Zusammenführung von Kunden und Lieferanten
-- in eine gemeinsame Tabelle GESCHÄFTSPARTNER

-- Neue Tabelle
CREATE TABLE GESCHÄFTSPARTNER (
  partnernummer NUMBER(6),
  name          VARCHAR2(30),
  straße        VARCHAR2(30) NOT NULL,
  plz           VARCHAR2(5)  NOT NULL,
  ort           VARCHAR2(45),
  CONSTRAINT Partner_PK
    PRIMARY KEY (partnernummer)
);

-- Sequence für laufende Partnernummern
CREATE SEQUENCE qp_seq;

-- Kunden übernehmen
INSERT INTO GESCHÄFTSPARTNER (partnernummer, name, straße, plz, ort)
  SELECT qp_seq.NEXTVAL, name, straße, plz, ort
  FROM KUNDEN;

-- Lieferanten übernehmen
INSERT INTO GESCHÄFTSPARTNER (partnernummer, name, straße, plz, ort)
  SELECT qp_seq.NEXTVAL, name, straße, plz, ort
  FROM LIEFERANTEN;

-- partnernummer zu Kunden/Lieferanten hinzufügen
ALTER TABLE KUNDEN
  ADD partnernummer NUMBER(6);

ALTER TABLE LIEFERANTEN
  ADD partnernummer NUMBER(6);

-- Foreign Keys auf GESCHÄFTSPARTNER
ALTER TABLE KUNDEN
  ADD FOREIGN KEY (partnernummer)
  REFERENCES GESCHÄFTSPARTNER (partnernummer);

ALTER TABLE LIEFERANTEN
  ADD FOREIGN KEY (partnernummer)
  REFERENCES GESCHÄFTSPARTNER (partnernummer);

-- Beispielhafte Zuordnung einzelner Partnernummern
-- (Ausschnitt, kann um weitere UPDATEs ergänzt werden)
UPDATE LIEFERANTEN
  SET partnernummer = 23
  WHERE name = 'Your Brends Herrenarmbänder';

UPDATE LIEFERANTEN
  SET partnernummer = 22
  WHERE name = 'Schmuck-und-Herrenartikel';

UPDATE KUNDEN
  SET partnernummer = 41
  WHERE name = 'Rick Grimes';

UPDATE KUNDEN
  SET partnernummer = 42
  WHERE name = 'Carl Grimes';

UPDATE KUNDEN
  SET partnernummer = 43
  WHERE name = 'Hershel Greene';

UPDATE KUNDEN
  SET partnernummer = 44
  WHERE name = 'Daryl Dixon';
