from connection import get_cursor
cur = get_cursor()

"""
Funksjonene i denne filen skal ikke kjøres herfra,
men blir importert og utført i main.py!
"""


"""
Funksjon som konfigurerer setene til Boeing 737.
"""
def konfigurer_boeing737():
    flytype = "Boeing 737 800"
    for i in range(1, 32):
        for char in 'ABCDEF':
            sete = f'{i}{char}'
            cur.execute("INSERT INTO Sete (flytypeNavn, seteNr) VALUES (?, ?)", (flytype, sete))

"""
Funksjon som konfigurerer setene til Airbus a320neo.
"""  
def konfigurer_airbus():
    flytype = "Airbus a320neo"
    for i in range(1, 31):
        for char in 'ABCDEF':
            sete = f'{i}{char}'
            cur.execute("INSERT INTO Sete (flytypeNavn, seteNr) VALUES (?, ?)", (flytype, sete))

"""
Funksjon som konfigurerer setene til Dash-8 100.
"""
def konfigurer_dash():
    flytype = "Dash-8 100"

    cur.execute("INSERT INTO Sete (flytypeNavn, seteNr) VALUES (?, ?)", (flytype, '1C'))
    cur.execute("INSERT INTO Sete (flytypeNavn, seteNr) VALUES (?, ?)", (flytype, '1D'))

    for i in range(2, 11):
        for char in 'ABCD':
            sete = f'{i}{char}'
            cur.execute("INSERT INTO Sete (flytypeNavn, seteNr) VALUES (?, ?)", (flytype, sete))


def konfigurer_seter():
    konfigurer_boeing737()
    konfigurer_airbus()
    konfigurer_dash()