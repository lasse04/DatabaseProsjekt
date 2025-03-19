from connection import get_cursor

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