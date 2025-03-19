from connection import get_cursor, close_connection
from konfigurer_seter import konfigurer_seter
from FinnFlyplassInfo import finn_flyplass_info, hent_RuteMellomFlyplass
cur = get_cursor()


"""
Hovedprogrammet i prosjektet.
Initialiserer og legger inn all data i databasen.

Denne må kjøres før man kan kjøre de andre filene i prosjektet.

Inneholder mange hjelpefunksjoner som kjører SQL-spørringer fra filer.
"""

def create_db():
    with open('KonstruerDatabase.sql', 'r') as f:
        cur.executescript(f.read())
    print("Database konstruert.")

def delete_db():
    with open('SlettAlt.sql', 'r') as f:
        cur.executescript(f.read())
    print("Database slettet.")

def add_airports():
    with open('LeggTilFlyplasser.sql', 'r') as f:
        cur.executescript(f.read())

def brukertilfelle2():
    with open('LeggTilBrukstilfelle 2.sql', 'r') as f:
        cur.executescript(f.read())

def legg_til_flyruter():
    with open('LeggTilFlyruter.sql', 'r') as f:
        cur.executescript(f.read())

def legg_til_flyvninger():
    with open('LeggTilFlyvninger.sql', 'r') as f:
        cur.executescript(f.read())

def legg_til_bestillinger():
    with open('LeggTilBestillinger.sql', 'r') as f:
        cur.executescript(f.read())


"""
Inngangsfunksjonen til programmet.
"""
if __name__ == '__main__':
    delete_db()
    create_db()
    add_airports()
    brukertilfelle2()
    konfigurer_seter()
    legg_til_flyruter()
    legg_til_flyvninger()
    legg_til_bestillinger()

    # Lukker databasetilkoblingen
    close_connection()