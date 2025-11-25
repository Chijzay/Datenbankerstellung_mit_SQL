# Datenbankerstellung mit SQL

Dieses Repository enthält das Begleitmaterial zu meinem selbst verfasstes Fachbuch, das die vollständige Ausarbeitung der ersten fünf Praktikumsaufgaben des Moduls Informationssysteme I umfasst. Anhand eines durchgehenden Beispiels zeige ich, wie relationale Datenbanken für ein Handelsunternehmen modelliert und Schritt für Schritt mit SQL umgesetzt werden. Von den ersten SQL-Anweisungen über CREATE / ALTER TABLE, INSERT, über Schlüsselkonzepte und Integritätsbedingungen, bis hin zu komplexe Queries, Views und Erweiterungen.

## Inhalt

- **/examples**
  - `queries_examples.sql` – ausgewählte SQL-Abfragen (JOINs, Aggregationen usw.) aus den Übungen.

- **/sql**
  - `01_schema_base.sql` – Basisschema mit den Tabellen  
  `Kunden`, `Bestellungen`, `Bestellpositionen`, `Artikel`, `Konditionen`, `Lieferanten`.
  - `02_sample_data.sql` – Beispieldatensätze für alle Tabellen (u. a. zum Testen von Queries).
  - `03_extensions_geschaeftspartner.sql` – Erweiterung zur gemeinsamen Tabelle
  `GESCHÄFTSPARTNER` inklusive Sequence und ALTER TABLE Befehlen.

- `Steven Illg - Datenbankerstellung mit SQL.pdf`

  Vollständige Ausarbeitung der Praktikumsaufgaben 1–5 in Form eines Fachbuchs mit ausführlichen Erläuterungen, Diagrammen und Glossar. Das Werk vermittelt praxisnah die nachfolgenden Grundlagen der Datenbankmodellierung und SQL-Entwicklung:
  - Datenmodellierung und ER-Diagramme
  - Aufbau relationaler Tabellen mit Primär-, Fremd- und zusammengesetzten Schlüsseln
  - SQL-Befehle (CREATE, INSERT, UPDATE, DELETE, SELECT, WHERE, ORDER BY, CHECK, etc.)
  - Erstellung eines vollständigen Beispiel-Datenbankschemas
  - Konzeptionelle und relationale Modellierung
  - Praktische Herleitung aller Lösungen inklusive Erklärungen, Grafiken und Hinweisen

## Nutzung

1. Schema anlegen:

   @sql/01_schema_base.sql

2. Beispieldaten einspielen:

   @sql/02_sample_data.sql

3. (Optional) Erweiterung GESCHÄFTSPARTNER ausführen:

   @sql/03_extensions_geschaeftspartner.sql

Die Skripte sind an Oracle SQL Developer angelehnt (NUMBER, VARCHAR2, DATE). Bei anderen SQL-Dialekten können kleinere Anpassungen notwendig sein.

Erstellt wurde das Werk im Sommersemester 2015 im Rahmen des Wirtschaftsinformatik-Studiums an der HAW Hamburg. Es dient als verständlich erklärtes Beispiel für die Datenbankentwicklung mit SQL und zeigt meinen strukturierten und analytischen Ansatz bei der Lösungsdokumentation.




