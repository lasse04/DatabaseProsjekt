from FinnFlyplassInfo import finn_flyplass_info, hent_inndata
from connection import close_connection

"""
Funksjon som tester funksjonen finn_flyplass_info i FinnFlyplassInfo.py
Gir altså mulighet for å teste brukstilfelle 6 med egne verdier.
"""
if __name__ == "__main__":
    flyplassKode, ukedag, inn_ut = hent_inndata()
    finn_flyplass_info(flyplassKode, ukedag, inn_ut)
    close_connection()