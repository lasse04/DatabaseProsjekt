import sqlite3
con = sqlite3.connect('DatabaseProsjekt.db')
cur = con.cursor()

def create_table():
    with open('KonstruerDatabase.sql', 'r') as f:
        cur.executescript(f.read())
    print("Table created successfully")

def add_airports():
    with open('LeggTilFlyplasser.sql', 'r') as f:
        cur.executescript(f.read())

def get_airports():
    cur.execute("SELECT * FROM Flyplass")
    rows = cur.fetchall()
    for row in rows:
        print(row)

if __name__ == '__main__':
    #create_table()
    #add_airports()
    get_airports()
    con.commit()
    con.close()