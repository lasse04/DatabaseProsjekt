
-- LEGG TIL RUTE WF1311
-- flyruteNr, ukedagsKode, oppstartsDato, sluttDato, flyselskapKode, flytypeNavn
INSERT INTO Flyrute VALUES ('WF1311', '12345', NULL, NULL, 'WF', 'Dash-8 100');

-- flyruteNr sekvensNr planlagtAnkomst planlagtAvgang flyplassKode
INSERT INTO FlyruteStopp VALUES ('WF1311', 1, NULL, '15:15:00', 'TRD');
INSERT INTO FlyruteStopp VALUES ('WF1311', 2, '16:20:00', NULL, 'BOO');

-- flyruteNr startStopp, sluttStopp, pris, billettType
INSERT INTO FlyrutePris VALUES ('WF1311', 1, 2, 599, 'budsjett');
INSERT INTO FlyrutePris VALUES ('WF1311', 1, 2, 899, 'økonomi');
INSERT INTO FlyrutePris VALUES ('WF1311', 1, 2, 2018, 'premium');

-- LEGG TIL RUTE WF1302
INSERT INTO Flyrute VALUES ('WF1302', '12345', NULL, NULL, 'WF', 'Dash-8 100');

INSERT INTO FlyruteStopp VALUES ('WF1302', 1, NULL, '07:35:00', 'BOO');
INSERT INTO FlyruteStopp VALUES ('WF1302', 2, '08:40:00', NULL, 'TRD');

INSERT INTO FlyrutePris VALUES ('WF1302', 1, 2, 599, 'budsjett');
INSERT INTO FlyrutePris VALUES ('WF1302', 1, 2, 899, 'økonomi');
INSERT INTO FlyrutePris VALUES ('WF1302', 1, 2, 2018, 'premium');


-- LEGG TIL RUTE DY753
INSERT INTO Flyrute VALUES ('DY753', '1234567', NULL, NULL, 'DY', 'Boeing 737 800');

INSERT INTO FlyruteStopp VALUES ('DY753', 1, NULL, '10:20:00', 'TRD');
INSERT INTO FlyruteStopp VALUES ('DY753', 2, '11:15:00', NULL, 'OSL');

INSERT INTO FlyrutePris VALUES ('DY753', 1, 2, 500, 'budsjett');
INSERT INTO FlyrutePris VALUES ('DY753', 1, 2, 1000, 'økonomi');
INSERT INTO FlyrutePris VALUES ('DY753', 1, 2, 1500, 'premium');

-- LEGG TIL RUTE SK332
INSERT INTO Flyrute VALUES ('SK332', '1234567', NULL, NULL, 'SK', 'Airbus a320neo');

INSERT INTO FlyruteStopp VALUES ('SK332', 1, NULL, '08:00:00', 'OSL');
INSERT INTO FlyruteStopp VALUES ('SK332', 2, '09:05:00', NULL, 'TRD');

INSERT INTO FlyrutePris VALUES ('SK332', 1, 2, 500, 'budsjett');
INSERT INTO FlyrutePris VALUES ('SK332', 1, 2, 1000, 'økonomi');
INSERT INTO FlyrutePris VALUES ('SK332', 1, 2, 1500, 'premium');

-- LEGG TIL RUTE SK888
INSERT INTO Flyrute VALUES ('SK888', '12345', NULL, NULL, 'SK', 'Airbus a320neo');

INSERT INTO FlyruteStopp VALUES ('SK888', 1, NULL, '10:00:00', 'TRD');
INSERT INTO FlyruteStopp VALUES ('SK888', 2, '11:10:00', '11:40:00', 'BGO');
INSERT INTO FlyruteStopp VALUES ('SK888', 3, '12:10:00', NULL, 'SVG');

INSERT INTO FlyrutePris VALUES ('SK888', 1, 2, 800, 'budsjett');
INSERT INTO FlyrutePris VALUES ('SK888', 1, 2, 1500, 'økonomi');
INSERT INTO FlyrutePris VALUES ('SK888', 1, 2, 2000, 'premium');

INSERT INTO FlyrutePris VALUES ('SK888', 2, 3, 350, 'budsjett');
INSERT INTO FlyrutePris VALUES ('SK888', 2, 3, 700, 'økonomi');
INSERT INTO FlyrutePris VALUES ('SK888', 2, 3, 1000, 'premium');

INSERT INTO FlyrutePris VALUES ('SK888', 1, 3, 1000, 'budsjett');
INSERT INTO FlyrutePris VALUES ('SK888', 1, 3, 1700, 'økonomi');
INSERT INTO FlyrutePris VALUES ('SK888', 1, 3, 2200, 'premium');
