
SELECT Flyselskap.flyselskapKode, Flyselskap.navn, Flytype.flytypeNavn, count(registreringsNr) AS antallFly
FROM Flyselskap JOIN Fly ON (Fly.flyselskapKode = Flyselskap.flyselskapKode)
JOIN Flytype ON (Fly.flytypeNavn = Flytype.flytypeNavn)

GROUP BY Flyselskap.flyselskapKode, Flytype.flytypeNavn