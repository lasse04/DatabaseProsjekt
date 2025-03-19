-- SQL filen som brukes for å finne flåten til et fly, i finn_flåte.py
SELECT Flyselskap.flyselskapKode, Flyselskap.navn, Flytype.flytypeNavn, count(registreringsNr) AS antallFly
FROM Flyselskap JOIN Fly ON (Fly.flyselskapKode = Flyselskap.flyselskapKode)
JOIN Flytype ON (Fly.flytypeNavn = Flytype.flytypeNavn)

GROUP BY Flyselskap.flyselskapKode, Flytype.flytypeNavn