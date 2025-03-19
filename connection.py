
"""
Hjelpefil for å håndtere tilkobling til databasen.
"""
import sqlite3
con = sqlite3.connect('DatabaseProsjekt.db')

def get_cursor():
    return con.cursor()

def close_connection():
    con.close()