PRAGMA foreign_keys = ON;

CREATE TABLE Addresses (
    address_id INTEGER PRIMARY KEY AUTOINCREMENT,
    street_name TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    zip TEXT NOT NULL
);

CREATE TABLE Stables (
    stable_id INTEGER PRIMARY KEY AUTOINCREMENT,
    address_id INTEGER NOT NULL,

    FOREIGN KEY (address_id)
        REFERENCES Addresses(address_id)
);

CREATE TABLE Horses (
    horse_id INTEGER PRIMARY KEY AUTOINCREMENT,
    height REAL NOT NULL CHECK (height > 0),
    weight REAL NOT NULL CHECK (weight > 0),
    name TEXT NOT NULL,
    breed TEXT NOT NULL,
    stable_id INTEGER,

    FOREIGN KEY (stable_id)
        REFERENCES Stables(stable_id)
        ON DELETE SET NULL
);

CREATE TABLE Races (
    race_id INTEGER PRIMARY KEY AUTOINCREMENT,
    race_date TEXT NOT NULL,
    address_id INTEGER NOT NULL,
    first_place INTEGER,
    second_place INTEGER,
    third_place INTEGER,

    FOREIGN KEY (address_id)
        REFERENCES Addresses(address_id),

    FOREIGN KEY (first_place)
        REFERENCES Horses(horse_id)
        ON DELETE SET NULL,

    FOREIGN KEY (second_place)
        REFERENCES Horses(horse_id)
        ON DELETE SET NULL,

    FOREIGN KEY (third_place)
        REFERENCES Horses(horse_id)
        ON DELETE SET NULL,

    CHECK (
        (first_place IS NULL OR second_place IS NULL
            OR first_place <> second_place)
        AND
        (first_place IS NULL OR third_place IS NULL
            OR first_place <> third_place)
        AND
        (second_place IS NULL OR third_place IS NULL
            OR second_place <> third_place)
    )
);

CREATE TABLE HorseRaces (
    horse_id INTEGER NOT NULL,
    race_id INTEGER NOT NULL,

    PRIMARY KEY (horse_id, race_id),

    FOREIGN KEY (horse_id)
        REFERENCES Horses(horse_id)
        ON DELETE CASCADE,

    FOREIGN KEY (race_id)
        REFERENCES Races(race_id)
        ON DELETE CASCADE
);