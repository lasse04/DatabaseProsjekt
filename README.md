# Databaseprosjekt

For å kjøre programmet må man først kjøre [main.py](/main.py) filen - den initialiserer databasen og setter inn dataen fra de ulike brukstilfellene.

Prosjektet er laget med Python 3.10.11

## Brukstilfelle 1:

Den er løst i [LeggTilFlyplasser.sql](/LeggTilFlyplasser.sql)

## Brukstilfelle 2:

Den er løst i [LeggTilBrukstilfelle2.sql](/LeggTilBrukstilfelle%202.sql)

## Brukstilfelle 3:

Den er løst i [LeggTilFlyruter.sql](/LeggTilFlyruter.sql)

## Brukstilfelle 4:

Den er løst i [LeggTilFlyvninger.sql](/LeggTilFlyvninger.sql)

## Brukstilfelle 5:

Den er løst i FinnFlåte.sql
For å se resultat kan man kjøre [finn_flåte.py](/finn_flåte.py)

## Brukstilfelle 6:

Den er løst i [FinnFlyplassInfo.py](/FinnFlyplassInfo.py).

Kjør [FinnFlyplassInfo.py](/FinnFlyplassInfo.py) for å se eksempelet vårt, eller kjør [TestFinnFlyplassInfo.py](/TestFinnFlyplassInfo.py) for å teste med egne verdier.

## Brukstilfelle 7:

Den er løst i [LeggTilBestillinger.sql](/LeggTilBestillinger.sql)

## Brukstilfelle 8:

Den er løst i [ledige_seter_på_flyvning.py](/ledige_seter_på_flyvning.py).

Kjør filen for å teste det.

Eksempeldataen oppgitt i brukstilfellene tester ikke funksjonalitet for hver "delflyvning",
da det kun er kjøpt billetter for WF1302, som ikke har mellomlandinger.

Vi har derfor laget ekstra billetter som tilhører SK888, som kan brukes til å teste at den fungerer med mellomlandinger.

Dette, og generell testing, kan gjøres i [test_ledige_seter_på_flyvning.py](/test_ledige_seter_på_flyvning.py)
