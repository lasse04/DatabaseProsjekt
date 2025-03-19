from connection import get_cursor, close_connection

"""
Funksjon som skriver ut setekonfigurasjonen til et fly basert på flytypenavn.
"""
def print_setekonfigurasjon(flytype):
    cur = get_cursor()

    cur.execute("SELECT * FROM Sete WHERE flytypeNavn = ?", (flytype,))
    rows = cur.fetchall()
    for row in rows:
        print(row)


if __name__ == '__main__':
    # Ingen sjekker på riktig flytype, forventer at brukeren skriver inn en gyldig flytype
    flytype = input("Skriv inn flytypenavn (Airbus a320neo, Boeing 737, Dash-8 100): ")
    print_setekonfigurasjon(flytype)
    close_connection()