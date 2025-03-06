CREATE TABLE Flyplass (
    flyplassKode CHAR(3),
    navn VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (flyplassKode)
)

CREATE TABLE RuteMellomFlyplass(
    fraFlyplass CHAR(3),
    tilFlyplass CHAR(3),
    PRIMARY KEY (fraFlyplass, tilFlyplass),
    FOREIGN KEY (fraFlyplass) REFERENCES Flyplass(flyplassKode) ON DELETE CASCADE,
    FOREIGN KEY (tilFlyplass) REFERENCES Flyplass(flyplassKode) ON DELETE CASCADE
)

CREATE TABLE Flyrute(
    flyruteNr VARCHAR(10),
    ukedagsKode VARCHAR(7) NOT NULL,
    oppstartsDato DATE,
    sluttDato DATE,
    flyselskapKode CHAR(2) NOT NULL
    flytypeNavn VARCHAR(50) NOT NULL,
    PRIMARY KEY (flyruteNr),
    FOREIGN KEY (flyselskapKode) REFERENCES Flyselskap(flyselskapKode) ON DELETE CASCADE
    FOREIGN KEY (flytypeNavn) REFERENCES Flytype(flytypeNavn) ON DELETE CASCADE
)

CREATE TABLE FlyruteStopp(
    flyruteNr VARCHAR(10),
    sekvensNr INT,
    planlagtAnkomst TIME NOT NULL,
    planlagtAvgang TIME NOT NULL,
    flyplassKode CHAR(3) NOT NULL,
    PRIMARY KEY (flyruteNr, sekvensNr),
    FOREIGN KEY (flyruteNr) REFERENCES Flyrute(flyruteNr) ON DELETE CASCADE,
    FOREIGN KEY (flyplassKode) REFERENCES Flyplass(flyplassKode) ON DELETE CASCADE
)

CREATE TABLE FlyrutePris(
    flyruteNr VARCHAR(10),
    startStopp INT,
    sluttStopp INT,
    pris DECIMAL(10,2) NOT NULL,
    billettType VARCHAR(50) NOT NULL,
    CHECK billettType in ('budsjett', 'økonomi', 'premium'),
    PRIMARY KEY (flyruteNr, startStopp, sluttStopp),
    FOREIGN KEY (flyruteNr) REFERENCES Flyrute(flyruteNr) ON DELETE CASCADE
    FOREIGN KEY (startStopp) REFERENCES FlyruteStopp(sekvensNr) ON DELETE CASCADE
    FOREIGN KEY (sluttStopp) REFERENCES FlyruteStopp(sekvensNr) ON DELETE CASCADE
)

CREATE TABLE Flytype(
    flytypeNavn VARCHAR(50),
    
    startProduksjonsÅr INT NOT NULL,
    CHECK (startProduksjonsÅr BETWEEN 1900 AND 2100),
    
    sluttProduksjonsÅr INT,
    CHECK (sluttProduksjonsÅr BETWEEN 1900 AND 2100),
    
    flyprodusentNavn VARCHAR(50) NOT NULL,
    PRIMARY KEY (flytypeNavn)
    FOREIGN KEY (flyprodusentNavn) REFERENCES Flyprodusent(flyprodusentNavn) ON DELETE CASCADE
)

CREATE TABLE Flyselskap(
    flyselskapKode CHAR(2),
    navn VARCHAR(50) NOT NULL,
    PRIMARY KEY (flyselskapKode)
)

CREATE TABLE BrukerFlytype(
    flyselskapKode CHAR(2),
    flytypeNavn VARCHAR(50),
    PRIMARY KEY (flyselskapKode, flytypeNavn),
    FOREIGN KEY (flyselskapKode) REFERENCES Flyselskap(flyselskapKode) ON DELETE CASCADE
    FOREIGN KEY (flytypeNavn) REFERENCES Flytype(flytypeNavn) ON DELETE CASCADE
)

CREATE TABLE Fly(
    registreringsNr VARCHAR(6),
    navn VARCHAR(50) NOT NULL,
    førsteDriftsÅr INT NOT NULL,
    CHECK (førsteDriftsÅr BETWEEN 1900 AND 2100),
    flyselskapKode CHAR(2) NOT NULL,
    flytypeNavn VARCHAR(50) NOT NULL,
    PRIMARY KEY (registreringsNr),
    FOREIGN KEY (flyselskapKode) REFERENCES Flyselskap(flyselskapKode) ON DELETE CASCADE
    FOREIGN KEY (flytypeNavn) REFERENCES Flytype(flytypeNavn) ON DELETE CASCADE
)

CREATE TABLE Flyprodusent(
    flyprodusentNavn VARCHAR(50),
    stiftelsesÅr INT,
    CHECK (stiftelsesÅr BETWEEN 1900 AND 2100),
    PRIMARY KEY (flyprodusentNavn)
)

CREATE TABLE FlyprodusentNasjonaliteter(
    flyprodusentNavn VARCHAR(50),
    nasjonalitet VARCHAR(50),
    PRIMARY KEY (flyprodusentNavn, nasjonalitet),
    FOREIGN KEY (flyprodusentNavn) REFERENCES Flyprodusent(flyprodusentNavn) ON DELETE CASCADE
)

CREATE TABLE FlyprodusentSerieNr(
    flyprodusentNavn VARCHAR(50),
    serieNr INT,
    flyRegistreringsNr VARCHAR(6) NOT NULL,
    PRIMARY KEY (flyprodusentNavn, serieNr),
    FOREIGN KEY (flyprodusentNavn) REFERENCES Flyprodusent(flyprodusentNavn) ON DELETE CASCADE
    FOREIGN KEY (flyRegistreringsNr) REFERENCES Fly(flyRegistreringsNr) ON DELETE CASCADE
)

CREATE TABLE Flyvning(
    flyruteNr VARCHAR(10),
    løpeNr INT,
    flyvningStatus VARCHAR(50) NOT NULL,
    CHECK flyvningStatus in ('planned', 'active', 'completed', 'cancelled'),
    dato DATE NOT NULL,
    flyRegistreringsNr VARCHAR(6),
    PRIMARY KEY (flyruteNr, løpeNr),
    FOREIGN KEY (flyruteNr) REFERENCES Flyrute(flyruteNr) ON DELETE CASCADE
    FOREIGN KEY (flyRegistreringsNr) REFERENCES Fly(flyRegistreringsNr) ON DELETE CASCADE
)

CREATE TABLE StoppPåFlyvning(
    flyruteNr VARCHAR(10),
    løpeNr INT,
    sekvensNr INT,
    ankomstTid TIME,
    avgangTid TIME,
    PRIMARY KEY (flyruteNr, løpeNr, sekvensNr),
    FOREIGN KEY (flyruteNr) REFERENCES Flyrute(flyruteNr) ON DELETE CASCADE
    FOREIGN KEY (løpeNr) REFERENCES Flyvning(løpeNr) ON DELETE CASCADE
    FOREIGN KEY (sekvensNr) REFERENCES FlyruteStopp(sekvensNr) ON DELETE CASCADE
)

CREATE TABLE Sete(
    flytypeNavn VARCHAR(50),
    seteNr VARCHAR(4)
    PRIMARY KEY (flytypeNavn, seteNr),
    FOREIGN KEY (flytypeNavn) REFERENCES Flytype(flytypeNavn) ON DELETE CASCADE
)

CREATE TABLE Fordelsprogram(
    flyseskapKode CHAR(2),
    navn VARCHAR(50) NOT NULL,
    beskrivelse VARCHAR(255),
    PRIMARY KEY (flyseskapKode, navn),
    FOREIGN KEY (flyseskapKode) REFERENCES Flyselskap(flyseskapKode) ON DELETE CASCADE
)

CREATE TABLE HarFordelsprogram(
    flyselskapKode CHAR(2),
    fordelsprogramNavn VARCHAR(50),
    kundeNr INT,
    PRIMARY KEY (flyselskapKode, fordelsprogramNavn, kundeNr),
    FOREIGN KEY (flyselskapKode) REFERENCES Flyselskap(flyselskapKode) ON DELETE CASCADE
    FOREIGN KEY (fordelsprogramNavn) REFERENCES Fordelsprogram(fordelsprogramNavn) ON DELETE CASCADE
    FOREIGN KEY (kundeNr) REFERENCES Kunde(kundeNr) ON DELETE CASCADE
)

CREATE TABLE Kunde(
    kundeNr INT,
    navn VARCHAR(50) NOT NULL,
    telefonNr VARCHAR(12) NOT NULL,
    epost VARCHAR(50) NOT NULL UNIQUE,
    nasjonalitet VARCHAR(50) NOT NULL,
    PRIMARY KEY (kundeNr)
)

CREATE TABLE Billettkjøp(
    referanseNr INT,
    kjøpsPris DECIMAL(10,2) NOT NULL,
    kundeNr INT NOT NULL,
    PRIMARY KEY (referanseNr),
    FOREIGN KEY (kundeNr) REFERENCES Kunde(kundeNr) ON DELETE CASCADE
)

CREATE TABLE Reise(
    reiseID INT,
    reiseType VARCHAR(50) NOT NULL,
    CHECK reiseType in ('utreise', 'hjemreise'),
    innsjekkingsTidspunkt TIME,
    referanseNr INT NOT NULL,
    PRIMARY KEY (reiseID),
    FOREIGN KEY (referanseNr) REFERENCES Billettkjøp(referanseNr) ON DELETE CASCADE
)

CREATE TABLE Billett(
    billettID INT,
    billettType VARCHAR(50) NOT NULL,
    CHECK billettType in ('budsjett', 'økonomi', 'premium'),
    pris DECIMAL(10,2) NOT NULL,
    flyruteNr VARCHAR(10) NOT NULL,
    reiseID INT NOT NULL,
    løpeNr INT NOT NULL,
    seteNr VARCHAR(4) NOT NULL,
    startStopp INT NOT NULL,
    sluttStopp INT NOT NULL,
    PRIMARY KEY (billettID),
    FOREIGN KEY (flyruteNr) REFERENCES Flyrute(flyruteNr) ON DELETE CASCADE
    FOREIGN KEY (reiseID) REFERENCES Reise(reiseID) ON DELETE CASCADE
    FOREIGN KEY (løpeNr) REFERENCES Flyvning(løpeNr) ON DELETE CASCADE
    FOREIGN KEY (seteNr) REFERENCES Sete(seteNr) ON DELETE CASCADE
    FOREIGN KEY (startStopp) REFERENCES FlyruteStopp(sekvensNr) ON DELETE CASCADE
    FOREIGN KEY (sluttStopp) REFERENCES FlyruteStopp(sekvensNr) ON DELETE CASCADE
)

CREATE TABLE Bagasje(
    registreringsNr INT,
    vekt DECIMAL(10,2) NOT NULL,
    innleveringsTidspunkt TIME NOT NULL,
    billettID INT NOT NULL,
    PRIMARY KEY (registreringsNr),
    FOREIGN KEY (billettID) REFERENCES Billett(billettID) ON DELETE CASCADE
)