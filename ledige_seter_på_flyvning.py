from connection import get_cursor
from formater_seter import formater_seter
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


def finn_ledige_seter_tur(flyruteNr, dato, startStopp, sluttStopp):
    ledige_seter = finn_ledige_seter(flyruteNr, dato)

    ledige_seter_tur = ledige_seter[startStopp]

    for stopp in range(startStopp + 1, sluttStopp):
        ledige_seter_tur = list(set(ledige_seter_tur) & set(ledige_seter[stopp]))

    return formater_seter(ledige_seter_tur)

if __name__ == "__main__":
    ledige_seter = finn_ledige_seter_tur("WF1302", '2025-04-01', 1, 2)
    for seter in ledige_seter:
        print(f"{seter}")