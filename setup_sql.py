import sqlite3
from pathlib import Path


def setup_database():

    database_name = "horses.db"
    connection = sqlite3.connect(database_name)
    connection.execute("PRAGMA foreign_keys = ON")

    connection.executescript("""
    DROP TABLE IF EXISTS HorseRaces;
    DROP TABLE IF EXISTS Races;
    DROP TABLE IF EXISTS Horses;
    DROP TABLE IF EXISTS Stables;
    DROP TABLE IF EXISTS Addresses;
    """)
    connection.commit()


    try:
        schema = Path("schema.sql").read_text()
        inserts = Path("inserts.sql").read_text()
        connection.executescript(schema)
        connection.executescript(inserts)
        connection.commit()
        print("Database created and data inserted successfully.")
    except Exception:
        connection.rollback()
        raise
    finally:
        connection.close()