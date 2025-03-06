CREATE TABLE Flyplass (
    flyplassKode CHAR(3),
    navn VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (flyplassKode)
)

CREATE TABLE RuteMellomFlyplass(
    fraFlyplass CHAR(3),
    tilFlyplass CHAR(3),
    PRIMARY KEY (fraFlyplass, tilFlyplass),
    FOREIGN KEY (fraFlyplass) REFERENCES Flyplass(flyplassKode),
    FOREIGN KEY (tilFlyplass) REFERENCES Flyplass(flyplassKode)
)
