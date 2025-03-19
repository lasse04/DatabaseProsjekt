-- Ekstra data som skal illustrere "ledige seter"-funksjonalitet med mellomlandinger/flere delreiser

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

INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 11);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 12);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 13);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 14);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 15);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 16);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 17);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 18);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 19);
INSERT INTO Reise (reiseType, referanseNr) VALUES ('utreise', 20);

-- Lag billetter

INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'SK888', 1, 11, 'Airbus a320neo', '10A', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'SK888', 1, 12, 'Airbus a320neo', '10B', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'SK888', 1, 13, 'Airbus a320neo', '10C', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'SK888', 1, 14, 'Airbus a320neo', '10D', 1, 2);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'SK888', 1, 15, 'Airbus a320neo', '10E', 2, 3);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'SK888', 1, 16, 'Airbus a320neo', '10F', 2, 3);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'SK888', 1, 17, 'Airbus a320neo', '20A', 2, 3);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'SK888', 1, 18, 'Airbus a320neo', '20B', 2, 3);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'SK888', 1, 19, 'Airbus a320neo', '20C', 1, 3);
INSERT INTO Billett (billettType, pris, flyruteNr, løpeNr, reiseID, flytypeNavn, seteNr, startStopp, sluttStopp) VALUES ('budsjett', 599, 'SK888', 1, 20, 'Airbus a320neo', '20D', 1, 3);

