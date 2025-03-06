CREATE TABLE Flyplass(
    flyplassKode TEXT,
    navn TEXT NOT NULL UNIQUE,
    PRIMARY KEY (flyplassKode)
);

CREATE TABLE RuteMellomFlyplass(
    fraFlyplass TEXT,
    tilFlyplass TEXT,
    PRIMARY KEY (fraFlyplass, tilFlyplass),
    FOREIGN KEY (fraFlyplass) REFERENCES Flyplass(flyplassKode) ON DELETE CASCADE,
    FOREIGN KEY (tilFlyplass) REFERENCES Flyplass(flyplassKode) ON DELETE CASCADE
);

CREATE TABLE Flyprodusent(
    flyprodusentNavn TEXT,
    stiftelsesÅr INT,
    CHECK (stiftelsesÅr BETWEEN 1900 AND 2100),
    PRIMARY KEY (flyprodusentNavn)
);

CREATE TABLE FlyprodusentNasjonaliteter(
    flyprodusentNavn TEXT,
    nasjonalitet TEXT,
    PRIMARY KEY (flyprodusentNavn, nasjonalitet),
    FOREIGN KEY (flyprodusentNavn) REFERENCES Flyprodusent(flyprodusentNavn) ON DELETE CASCADE
);

CREATE TABLE Flyselskap(
    flyselskapKode TEXT,
    navn TEXT NOT NULL,
    PRIMARY KEY (flyselskapKode)
);

CREATE TABLE Flytype(
    flytypeNavn TEXT,
    startProduksjonsAar INT NOT NULL
    CHECK (startProduksjonsAar BETWEEN 1900 AND 2100),
    sluttProduksjonsAar INT
    CHECK (sluttProduksjonsAar BETWEEN 1900 AND 2100),
    flyprodusentNavn TEXT NOT NULL,
    PRIMARY KEY (flytypeNavn),
    FOREIGN KEY (flyprodusentNavn) REFERENCES Flyprodusent(flyprodusentNavn) ON DELETE CASCADE
);


CREATE TABLE BrukerFlytype(
    flyselskapKode TEXT,
    flytypeNavn TEXT,
    PRIMARY KEY (flyselskapKode, flytypeNavn),
    FOREIGN KEY (flyselskapKode) REFERENCES Flyselskap(flyselskapKode) ON DELETE CASCADE,
    FOREIGN KEY (flytypeNavn) REFERENCES Flytype(flytypeNavn) ON DELETE CASCADE
);

CREATE TABLE Flyrute(
    flyruteNr TEXT,
    ukedagsKode TEXT NOT NULL,
    oppstartsDato DATE,
    sluttDato DATE,
    flyselskapKode TEXT NOT NULL,
    flytypeNavn TEXT NOT NULL,
    PRIMARY KEY (flyruteNr),
    FOREIGN KEY (flyselskapKode) REFERENCES Flyselskap(flyselskapKode) ON DELETE CASCADE,
    FOREIGN KEY (flytypeNavn) REFERENCES Flytype(flytypeNavn) ON DELETE CASCADE
);

CREATE TABLE FlyruteStopp(
    flyruteNr TEXT,
    sekvensNr INT,
    planlagtAnkomst TIME NOT NULL,
    planlagtAvgang TIME NOT NULL,
    flyplassKode TEXT NOT NULL,
    PRIMARY KEY (flyruteNr, sekvensNr),
    FOREIGN KEY (flyruteNr) REFERENCES Flyrute(flyruteNr) ON DELETE CASCADE,
    FOREIGN KEY (flyplassKode) REFERENCES Flyplass(flyplassKode) ON DELETE CASCADE
);

CREATE TABLE FlyrutePris(
    flyruteNr TEXT,
    startStopp INT,
    sluttStopp INT,
    pris INT NOT NULL,
    billettType TEXT NOT NULL,
    CHECK (billettType in ('budsjett', 'økonomi', 'premium')),
    PRIMARY KEY (flyruteNr, startStopp, sluttStopp),
    FOREIGN KEY (flyruteNr) REFERENCES Flyrute(flyruteNr) ON DELETE CASCADE,
    FOREIGN KEY (flyruteNr, startStopp) REFERENCES FlyruteStopp(flyruteNr, sekvensNr) ON DELETE CASCADE,
    FOREIGN KEY (flyruteNr, sluttStopp) REFERENCES FlyruteStopp(flyruteNr, sekvensNr) ON DELETE CASCADE
);



CREATE TABLE Fly(
    registreringsNr TEXT,
    navn TEXT NOT NULL,
    førsteDriftsÅr INT NOT NULL
    CHECK (førsteDriftsÅr BETWEEN 1900 AND 2100),
    flyselskapKode TEXT NOT NULL,
    flytypeNavn TEXT NOT NULL,
    PRIMARY KEY (registreringsNr),
    FOREIGN KEY (flyselskapKode) REFERENCES Flyselskap(flyselskapKode) ON DELETE CASCADE,
    FOREIGN KEY (flytypeNavn) REFERENCES Flytype(flytypeNavn) ON DELETE CASCADE
);



CREATE TABLE FlyprodusentSerieNr(
    flyprodusentNavn TEXT,
    serieNr INT,
    flyRegistreringsNr TEXT NOT NULL,
    PRIMARY KEY (flyprodusentNavn, serieNr),
    FOREIGN KEY (flyprodusentNavn) REFERENCES Flyprodusent(flyprodusentNavn) ON DELETE CASCADE,
    FOREIGN KEY (flyRegistreringsNr) REFERENCES Fly(flyRegistreringsNr) ON DELETE CASCADE
);

CREATE TABLE Flyvning(
    flyruteNr TEXT,
    løpeNr INT,
    flyvningStatus TEXT NOT NULL
    CHECK (flyvningStatus in ('planned', 'active', 'completed', 'cancelled')),
    dato DATE NOT NULL,
    flyRegistreringsNr TEXT,
    PRIMARY KEY (flyruteNr, løpeNr),
    FOREIGN KEY (flyruteNr) REFERENCES Flyrute(flyruteNr) ON DELETE CASCADE,
    FOREIGN KEY (flyRegistreringsNr) REFERENCES Fly(flyRegistreringsNr) ON DELETE CASCADE
);

CREATE TABLE StoppPåFlyvning(
    flyruteNr TEXT,
    løpeNr INT,
    sekvensNr INT,
    ankomstTid TIME,
    avgangTid TIME,
    PRIMARY KEY (flyruteNr, løpeNr, sekvensNr),
    FOREIGN KEY (flyruteNr) REFERENCES Flyrute(flyruteNr) ON DELETE CASCADE,
    FOREIGN KEY (flyruteNr, løpeNr) REFERENCES Flyvning(flyruteNr, løpeNr) ON DELETE CASCADE,
    FOREIGN KEY (flyruteNr, sekvensNr) REFERENCES FlyruteStopp(flyruteNr, sekvensNr) ON DELETE CASCADE
);

CREATE TABLE Sete(
    flytypeNavn TEXT,
    seteNr TEXT,
    PRIMARY KEY (flytypeNavn, seteNr),
    FOREIGN KEY (flytypeNavn) REFERENCES Flytype(flytypeNavn) ON DELETE CASCADE
);

CREATE TABLE Fordelsprogram(
    flyselskapKode TEXT,
    navn TEXT NOT NULL,
    beskrivelse TEXT,
    PRIMARY KEY (flyselskapKode, navn),
    FOREIGN KEY (flyselskapKode) REFERENCES Flyselskap(flyselskapKode) ON DELETE CASCADE
);


CREATE TABLE Kunde(
    kundeNr INT,
    navn TEXT NOT NULL,
    telefonNr TEXT NOT NULL,
    epost TEXT NOT NULL UNIQUE,
    nasjonalitet TEXT NOT NULL,
    PRIMARY KEY (kundeNr)
);

CREATE TABLE HarFordelsprogram(
    flyselskapKode TEXT,
    fordelsprogramNavn TEXT,
    kundeNr INT,
    PRIMARY KEY (flyselskapKode, fordelsprogramNavn, kundeNr),
    FOREIGN KEY (flyselskapKode, fordelsprogramNavn) REFERENCES Fordelsprogram(flyselskapKode, fordelsprogramNavn) ON DELETE CASCADE,
    FOREIGN KEY (kundeNr) REFERENCES Kunde(kundeNr) ON DELETE CASCADE
);

CREATE TABLE Billettkjøp(
    referanseNr INT,
    kjøpsPris INT NOT NULL,
    kundeNr INT NOT NULL,
    PRIMARY KEY (referanseNr),
    FOREIGN KEY (kundeNr) REFERENCES Kunde(kundeNr) ON DELETE CASCADE
);

CREATE TABLE Reise(
    reiseID INT,
    reiseType TEXT NOT NULL
    CHECK (reiseType in ('utreise', 'hjemreise')),
    innsjekkingsTidspunkt TIME,
    referanseNr INT NOT NULL,
    PRIMARY KEY (reiseID),
    FOREIGN KEY (referanseNr) REFERENCES Billettkjøp(referanseNr) ON DELETE CASCADE
);

CREATE TABLE Billett(
    billettID INT,
    billettType TEXT NOT NULL
    CHECK (billettType in ('budsjett', 'økonomi', 'premium')),
    pris INT NOT NULL,
    flyruteNr TEXT NOT NULL,
    reiseID INT NOT NULL,
    løpeNr INT NOT NULL,
    flytypeNavn TEXT NOT NULL,
    seteNr TEXT NOT NULL,
    startStopp INT NOT NULL,
    sluttStopp INT NOT NULL,
    PRIMARY KEY (billettID),
    FOREIGN KEY (flyruteNr) REFERENCES Flyrute(flyruteNr) ON DELETE CASCADE,
    FOREIGN KEY (reiseID) REFERENCES Reise(reiseID) ON DELETE CASCADE,
    FOREIGN KEY (flyruteNr, løpeNr) REFERENCES Flyvning(flyruteNr, løpeNr) ON DELETE CASCADE,
    FOREIGN KEY (flytypeNavn, seteNr) REFERENCES Sete(flytypeNavn, seteNr) ON DELETE CASCADE,
    FOREIGN KEY (flyruteNr, startStopp) REFERENCES FlyruteStopp(flyruteNr, sekvensNr) ON DELETE CASCADE,
    FOREIGN KEY (flyruteNr, sluttStopp) REFERENCES FlyruteStopp(flyruteNr, sekvensNr) ON DELETE CASCADE
);

CREATE TABLE Bagasje(
    registreringsNr INT,
    vekt REAL NOT NULL,
    innleveringsTidspunkt TIME NOT NULL,
    billettID INT NOT NULL,
    PRIMARY KEY (registreringsNr),
    FOREIGN KEY (billettID) REFERENCES Billett(billettID) ON DELETE CASCADE
);