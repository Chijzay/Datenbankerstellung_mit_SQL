-- Beispiel-Queries zu den Übungsaufgaben
-- (dies ist nur ein Auszug – weitere Abfragen können aus dem Buch ergänzt werden)

-- Alle Kunden
SELECT * FROM KUNDEN;

-- Anzahl der Bestellpositionen je Bestellung
SELECT bestellnummer,
       COUNT(*) AS anzahl
FROM   BESTELLPOSITIONEN
GROUP BY bestellnummer
ORDER BY bestellnummer ASC;

-- Gesamtwert der Bestellungen je Kunde
SELECT K.kundennummer,
       name,
       SUM(menge * verkaufspreis) AS gesamtwert
FROM   KUNDEN K,
       BESTELLUNGEN B,
       BESTELLPOSITIONEN BPOS,
       ARTIKEL A
WHERE  K.kundennummer = B.kundennummer
  AND  B.bestellnummer = BPOS.bestellnummer
  AND  BPOS.artikelnummer = A.artikelnummer
GROUP BY K.kundennummer, name
ORDER BY K.kundennummer ASC;

-- Komplexe Mehrfach-JOIN-Abfrage über 6 Tabellen
SELECT K.name AS kundenname, L.name AS lieferantenname
FROM KUNDEN K, BESTELLUNGEN B,
     BESTELLPOSITIONEN BPOS, ARTIKEL A,
     LIEFERANTEN L, KONDITIONEN KON
WHERE K.kundennummer = B.kundennummer
  AND B.bestellnummer = BPOS.bestellnummer
  AND BPOS.artikelnummer = A.artikelnummer
  AND A.artikelnummer = KON.artikelnummer
  AND KON.lieferantennummer = L.lieferantennummer
  AND L.name = 'Clock-Work GmbH'
GROUP BY K.name, L.name
ORDER BY kundenname ASC;

-- NOT IN / NOT EXISTS – Kunden ohne Bestellungen
SELECT kundennummer, name 
FROM KUNDEN
WHERE kundennummer NOT IN (
      SELECT kundennummer FROM BESTELLUNGEN
)
ORDER BY kundennummer ASC;

-- Subquery mit ALL – Kunden, die alle Artikel bestellt haben
SELECT name
FROM KUNDEN K, BESTELLUNGEN B, BESTELLPOSITIONEN BPOS, ARTIKEL A
WHERE K.kundennummer = B.kundennummer
  AND B.bestellnummer = BPOS.bestellnummer
  AND BPOS.artikelnummer = A.artikelnummer
  AND A.artikelnummer >= ALL (SELECT artikelnummer FROM ARTIKEL)
GROUP BY name;

-- CASE-Statement – Preis-Kategorisierung (billig/mittel/teuer)
SELECT artikelnummer, artikelname,
  CASE
    WHEN verkaufspreis <= 50 THEN 'billig'
    WHEN verkaufspreis <= 150 THEN 'mittel'
    ELSE 'teuer'
  END AS preiseinstufung
FROM ARTIKEL
ORDER BY preiseinstufung ASC;

-- LEFT OUTER JOIN – zeige alle Artikel, auch nicht bestellte
SELECT artikelname, bestelldatum
FROM ARTIKEL A
LEFT OUTER JOIN BESTELLPOSITIONEN BPOS ON A.artikelnummer = BPOS.artikelnummer
LEFT OUTER JOIN BESTELLUNGEN B ON BPOS.bestellnummer = B.bestellnummer
GROUP BY artikelname, bestelldatum
ORDER BY bestelldatum ASC;
