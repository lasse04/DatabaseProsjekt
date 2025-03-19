from ledige_seter_på_flyvning import finn_ledige_seter, finn_ledige_seter_tur
from connection import get_cursor, close_connection

"""
Funksjon som legger til ekstra billetter i databasen.
Billettene tilhører SK888 og brukes for å teste at vi henter riktige ledige billetter
selv med mellomlandinger.
"""
def legg_til_ekstra_billetter():
    cur = get_cursor()
    with open('LeggTilEkstraBilletter.sql', 'r') as file:
        cur.executescript(file.read())


"""
Funksjon som tillater å teste funksjonene i ledige_seter_på_flyvning.py.
"""
if __name__ == "__main__":
    legg_til_ekstra_billetter()
    flyruteNr = input("Skriv inn flyruteNr: ")
    dato = input("Skriv inn dato (YYYY-MM-DD): ")

    valg = input("Vil du se ledige seter for alle delreiser eller en bestemt tur? (a/b): ").lower()

    if valg == 'a':
        print(finn_ledige_seter(flyruteNr, dato))
    elif valg == 'b':
        startStopp = int(input("Skriv inn startstopp: "))
        sluttStopp = int(input("Skriv inn sluttstopp: "))
        print(finn_ledige_seter_tur(flyruteNr, dato, startStopp, sluttStopp))
    else:
        print("Ugyldig input.")

    close_connection()