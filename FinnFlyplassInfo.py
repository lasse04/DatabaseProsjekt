from connection import get_cursor, close_connection

# Hjelpefunksjon som henter flyplasskoder fra databasen
def hent_flyplasser():
    cur = get_cursor()
    cur.execute("SELECT flyplassKode FROM Flyplass")
    rows = cur.fetchall()
    return [row[0] for row in rows]

# Hjelpefunksjon som henter ruter mellom flyplasser fra databasen, fra viewet RuteMellomFlyplass
def hent_RuteMellomFlyplass():
    cur = get_cursor()
    cur.execute("SELECT * FROM RuteMellomFlyplass")
    rows = cur.fetchall()
    return rows


"""
Funksjon som lar bruker velge en flyplass, ukedag og avgang/ankomst.
Viser deretter alle flyruter som passer til valgene, formatert på en fin måte.
"""
def finn_flyplass_info():
    gyldige_flyplasser = hent_flyplasser()
    print(gyldige_flyplasser)
    print("-------")
    print(f'Velg en flyplass ({", ".join(gyldige_flyplasser)}): ')
    flyplassKode = input("Flyplasskode: ")

    while flyplassKode not in gyldige_flyplasser:
        print("Flyplasskoden finnes ikke.")
        flyplassKode = input("Flyplasskode: ")

    print("-------")
    print(f'Velg en ukedag (1-7): ')
    ukedag = input("Ukedag: ")

    while not ukedag.isdigit() or int(ukedag) < 1 or int(ukedag) > 7:
        print("Ukedagen er ugyldig.")
        ukedag = input("Ukedag: ")


    print("-------")
    print("Velg avgang eller ankomst: ")
    inn_ut = input("Avgang/ankomst: ").lower()

    while inn_ut not in ['avgang', 'ankomst']:
        print("Ugyldig input.")
        inn_ut = input("Avgang/ankomst: ").lower()

    
    ruter: list = hent_RuteMellomFlyplass()
    
    if inn_ut == "avgang":
        ruter = [rute[:-1] for rute in ruter if rute[1] == flyplassKode and ukedag in rute[-1]]
        ruter = [rute[:-1] for rute in ruter]
        ruter = [rute[:1] + rute[2:] for rute in ruter]
        resultat = {}
        for element in ruter:
            if element[0] not in resultat:
                resultat[element[0]] = list(element[1:])
            else:
                if type(resultat[element[0]][0]) == list:
                    resultat[element[0]][0].append(element[1])
                else:
                    resultat[element[0]][0] = [resultat[element[0]][0], element[1]]
        
        ruter = [[key] + value for key, value in resultat.items()]


        
    else:
        ruter = [rute[:-1] for rute in ruter if rute[2] == flyplassKode and ukedag in rute[-1]]
        ruter = [rute[:3] + rute[4:] for rute in ruter]
        ruter = [rute[:2] + rute[3:] for rute in ruter]
        resultat = {}
        for element in ruter:
            if element[0] not in resultat:
                resultat[element[0]] = list(element[1:])
            else:
                if type(resultat[element[0]][0]) == list:
                    resultat[element[0]][0].append(element[1])
                else:
                    resultat[element[0]][0] = [resultat[element[0]][0], element[1]]
        
        ruter = [[key] + value for key, value in resultat.items()]


    print("-------")
    print("Ruter:")
    for rute in ruter:
        print(rute)



if __name__ == '__main__':
    finn_flyplass_info()
    close_connection()