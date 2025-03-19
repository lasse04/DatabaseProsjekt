from connection import get_cursor, close_connection

"""
Funksjon som finner antall fly av hver flytype som tilhører et flyselskap.
Kjører SQL-spørringen i FinnFlåte.sql.
Skriver det ut på en oversiktlig måte.
"""
def finn_flåte():
    cur = get_cursor()
    print("Flyflåter:")
    with open('FinnFlåte.sql', 'r') as f:
        sql = f.read()
        cur.execute(sql)
        rows = cur.fetchall()
        for row in rows:
            print(row)

if __name__ == '__main__':
    finn_flåte()
    close_connection()