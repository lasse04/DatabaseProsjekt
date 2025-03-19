from connection import get_cursor, close_connection

"""
Funksjon som skriver ut alle flyplasser i databasen.
"""
def get_airports():
    cur = get_cursor()
    cur.execute("SELECT * FROM Flyplass")
    rows = cur.fetchall()
    for row in rows:
        print(row)

if __name__ == '__main__':
    print("Flyplasser i databasen: ")
    get_airports()
    close_connection()