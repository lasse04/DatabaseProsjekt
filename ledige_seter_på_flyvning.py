from connection import get_cursor, close_connection
from formater_seter import formater_seter


"""
Funksjon som finner ledige seter for enhver delflyvning på en gitt flyvning.
Flyvningen gives av flyruteNr og dato.

Med delflyvning menes en flyvning mellom to påfølgende stopp på en flyrute,
ikke enhver mulig 'tur' mellom to stopp på flyruten.

Returnerer en dictionary med stoppnummer som nøkkel og en liste med ledige seter som verdi.

"""
def finn_ledige_seter(flyruteNr: str, dato: str):
    cursor = get_cursor()
    
    billett_sql = """SELECT startStopp, sluttStopp, seteNr FROM Billett
            JOIN Flyvning ON Billett.flyruteNr = Flyvning.flyruteNr
            WHERE Billett.flyruteNr = ? AND dato = ?
            """
            
    cursor.execute(billett_sql, (flyruteNr, dato))

    billetter = cursor.fetchall()
    
    sete_sql = """SELECT seteNr FROM Sete
            WHERE flytypeNavn = (SELECT flytypeNavn FROM Flyrute WHERE flyruteNr = ?)
            """

    cursor.execute(sete_sql, (flyruteNr,))
    seter = cursor.fetchall()

    seter = [sete[0] for sete in seter]


    antall_stopp_sql = """ SELECT MAX(sekvensNr) FROM FlyruteStopp
                        WHERE flyruteNr = ?"""

    cursor.execute(antall_stopp_sql, (flyruteNr,))
    antall_stopp = cursor.fetchone()[0]


    ledige_seter = {}
    for stopp in range(1, antall_stopp):
        ledige_seter[stopp] = seter.copy()
        for billett in billetter:
            if billett[0] <= stopp and billett[1] > stopp:
                ledige_seter[stopp].remove(billett[2])

    ledige_seter = {stopp: formater_seter(seter) for stopp, seter in ledige_seter.items()}
    return ledige_seter



"""
Funksjon som finner ledige seter for en tur mellom to stopp på en flyrute.
Her kan man velge vilkårlige stopp på flyruten, og det returneres en liste med alle seter
som er ledige på hele den strekningen.

Antar at brukeren gir gyldige input.
"""
def finn_ledige_seter_tur(flyruteNr, dato, startStopp, sluttStopp):
    if startStopp >= sluttStopp:
        return []
    
    ledige_seter = finn_ledige_seter(flyruteNr, dato)

    ledige_seter_tur = ledige_seter[startStopp]

    for stopp in range(startStopp + 1, sluttStopp):
        ledige_seter_tur = list(set(ledige_seter_tur) & set(ledige_seter[stopp]))

    return formater_seter(ledige_seter_tur)

if __name__ == "__main__":
    ledige_seter = finn_ledige_seter_tur("WF1302", '2025-04-01', 1, 2)
    for seter in ledige_seter:
        print(f"{seter}")

    close_connection()
    