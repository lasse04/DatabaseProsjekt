from connection import get_cursor, close_connection
from konfigurer_seter import konfigurer_seter
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

if __name__ == '__main__':
    delete_db()
    create_db()
    add_airports()
    get_airports()
    brukertilfelle2()
    konfigurer_seter()
    
    

    # Lukker databasetilkoblingen
    close_connection()