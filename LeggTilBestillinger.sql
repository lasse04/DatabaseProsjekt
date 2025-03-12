-- Lag en kunde

INSERT INTO Kunde (navn, telefonNr, epost, nasjonalitet) VALUES ('Padel Pål', '12345678', 'padel@pål.no', 'Norge');

-- Lag billettkjøp

INSERT INTO Billettkjøp (kundeNr) VALUES (1);
INSERT INTO Billettkjøp (kundeNr) VALUES (1);
INSERT INTO Billettkjøp (kundeNr) VALUES (1);
INSERT INTO Billettkjøp (kundeNr) VALUES (1);
INSERT INTO Billettkjøp (kundeNr) VALUES (1);
INSERT INTO Billettkjøp (kundeNr) VALUES (1);
INSERT INTO Billettkjøp (kundeNr) VALUES (1);
INSERT INTO Billettkjøp (kundeNr) VALUES (1);
INSERT INTO Billettkjøp (kundeNr) VALUES (1);
INSERT INTO Billettkjøp (kundeNr) VALUES (1);

-- Lag reiser

INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 1);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 2);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 3);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 4);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 5);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 6);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 7);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 8);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 9);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 10);

-- Lag billetter

INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'WF1302', 1, 1, 'Dash-8 100', '2A', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'WF1302', 1, 2, 'Dash-8 100', '2B', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'WF1302', 1, 3, 'Dash-8 100', '2C', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'WF1302', 1, 4, 'Dash-8 100', '2D', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'WF1302', 1, 5, 'Dash-8 100', '3A', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'WF1302', 1, 6, 'Dash-8 100', '3B', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'WF1302', 1, 7, 'Dash-8 100', '3C', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'WF1302', 1, 8, 'Dash-8 100', '3D', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'WF1302', 1, 9, 'Dash-8 100', '4A', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'WF1302', 1, 10, 'Dash-8 100', '4B', 1, 2);