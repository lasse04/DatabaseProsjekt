from connection import get_cursor, close_connection
from konfigurer_seter import konfigurer_seter
from FinnFlyplassInfo import finn_flyplass_info, hent_RuteMellomFlyplass
cur = get_cursor()


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

def get_airports():
    cur.execute("SELECT * FROM Flyplass")
    rows = cur.fetchall()
    for row in rows:
        print(row)

def print_setekonfigurasjon(flytype):
    cur.execute("SELECT * FROM Sete WHERE flytypeNavn = ?", (flytype,))
    rows = cur.fetchall()
    for row in rows:
        print(row)

def brukertilfelle2():
    with open('LeggTilBrukstilfelle 2.sql', 'r') as f:
        cur.executescript(f.read())

def legg_til_flyruter():
    with open('LeggTilFlyruter.sql', 'r') as f:
        cur.executescript(f.read())

def legg_til_flyvninger():
    with open('LeggTilFlyvninger.sql', 'r') as f:
        cur.executescript(f.read())

def get_fleet():
    print("Flyflåter:")
    with open('FinnFlåte.sql', 'r') as f:
        sql = f.read()
        cur.execute(sql)
        rows = cur.fetchall()
        for row in rows:
            print(row)

if __name__ == '__main__':
    delete_db()
    create_db()
    add_airports()
    brukertilfelle2()
    konfigurer_seter()
    legg_til_flyruter()
    legg_til_flyvninger()

    
    

    # Lukker databasetilkoblingen
    close_connection()