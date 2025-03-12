-- Legg til Flyselskap
INSERT INTO Flyselskap VALUES ('DY', 'Norwegian');
INSERT INTO Flyselskap VALUES ('SK', 'SAS');
INSERT INTO Flyselskap VALUES ('WF', 'Widerøe');


-- Legg til Flyprodusent
INSERT INTO Flyprodusent VALUES ('The Boeing Company', 1916);
INSERT INTO Flyprodusent VALUES ('Airbus Group', 1970);
INSERT INTO Flyprodusent VALUES ('De Havilland Canada', 1928);

-- Legg til nasjonaliteter for flyprodusenter
INSERT INTO FlyprodusentNasjonaliteter VALUES ('The Boeing Company', 'USA');
INSERT INTO FlyprodusentNasjonaliteter VALUES ('Airbus Group', 'Frankrike');
INSERT INTO FlyprodusentNasjonaliteter VALUES ('Airbus Group', 'Tyskland');
INSERT INTO FlyprodusentNasjonaliteter VALUES ('Airbus Group', 'Spania');
INSERT INTO FlyprodusentNasjonaliteter VALUES ('Airbus Group', 'Storbritannia');
INSERT INTO FlyprodusentNasjonaliteter VALUES ('De Havilland Canada', 'Canada');


-- Legg til Flytyper
-- Setekonfigurasjon legges til ved eget python skript for å gjøre livet enklere.
INSERT INTO Flytype VALUES ('Boeing 737 800', 1997, 2020, 'The Boeing Company');
INSERT INTO Flytype VALUES ('Airbus a320neo', 2016, NULL, 'Airbus Group');
INSERT INTO Flytype VALUES ('Dash-8 100', 1984, 2005, 'De Havilland Canada');

-- Legg til BrukerFlytype
INSERT INTO BrukerFlytype VALUES ('DY', 'Boeing 737 800');
INSERT INTO BrukerFlytype VALUES ('SK', 'Airbus a320neo');
INSERT INTO BrukerFlytype VALUES ('WF', 'Dash-8 100');

-- Legg til Norwegian sine Fly
-- Regnr, navn, driftsår, flyselskapKode, flytypeNavn
INSERT INTO Fly VALUES ('LN-ENU', NULL, 2015, 'DY', 'Boeing 737 800');
INSERT INTO Fly VALUES ('LN-ENR', 'Jan Bålsrud' , 2018, 'DY', 'Boeing 737 800');
INSERT INTO Fly VALUES ('LN-NIQ', 'Max Manus', 2011, 'DY', 'Boeing 737 800');
INSERT INTO Fly VALUES ('LN-ENS', NULL, 2017, 'DY', 'Boeing 737 800');

INSERT INTO FlyprodusentSerieNr VALUES ('The Boeing Company', 42069, 'LN-ENU');
INSERT INTO FlyprodusentSerieNr VALUES ('The Boeing Company', 42093, 'LN-ENR');
INSERT INTO FlyprodusentSerieNr VALUES ('The Boeing Company', 39403, 'LN-NIQ');
INSERT INTO FlyprodusentSerieNr VALUES ('The Boeing Company', 42281, 'LN-ENS');

-- Legg til SAS sine Fly
INSERT INTO Fly VALUES ('SE-RUB', 'Birger Viking', 2020, 'SK', 'Airbus a320neo');
INSERT INTO Fly VALUES ('SE-DIR', 'Nora Viking', 2023, 'SK', 'Airbus a320neo');
INSERT INTO Fly VALUES ('SE-RUP', 'Ragnhild Viking', 2024, 'SK', 'Airbus a320neo');
INSERT INTO Fly VALUES ('SE-RZE', 'Ebbe Viking', 2024, 'SK', 'Airbus a320neo');

INSERT INTO FlyprodusentSerieNr VALUES ('Airbus Group', 9518, 'SE-RUB');
INSERT INTO FlyprodusentSerieNr VALUES ('Airbus Group', 11421, 'SE-DIR');
INSERT INTO FlyprodusentSerieNr VALUES ('Airbus Group', 12066, 'SE-RUP');
INSERT INTO FlyprodusentSerieNr VALUES ('Airbus Group', 12166, 'SE-RZE');

-- Legg til Widerøe sine Fly
INSERT INTO Fly VALUES ('LN-WIH', 'Oslo', 1994, 'WF', 'Dash-8 100');
INSERT INTO Fly VALUES ('LN-WIA', 'Nordland', 1993, 'WF', 'Dash-8 100');
INSERT INTO Fly VALUES ('LN-WIL', 'Narvik', 1995, 'WF', 'Dash-8 100');

INSERT INTO FlyprodusentSerieNr VALUES ('De Havilland Canada', 383, 'LN-WIH');
INSERT INTO FlyprodusentSerieNr VALUES ('De Havilland Canada', 359, 'LN-WIA');
INSERT INTO FlyprodusentSerieNr VALUES ('De Havilland Canada', 298, 'LN-WIL');