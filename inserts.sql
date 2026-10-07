-- this file will insert initial data into the database
-- 15 addresses
-- Addresses 1-5: stable addresses
-- Addresses 6-15: race addresses

INSERT INTO Addresses (street_name, city, state, zip) VALUES
('101 Oak Street', 'Denver', 'CO', '80201'),
('202 Pine Street', 'Aurora', 'CO', '80012'),
('303 Maple Street', 'Boulder', 'CO', '80301'),
('404 Cedar Street', 'Lakewood', 'CO', '80226'),
('505 Birch Street', 'Arvada', 'CO', '80002'),
('10 Raceway Drive', 'Denver', 'CO', '80202'),
('20 Raceway Drive', 'Aurora', 'CO', '80013'),
('30 Raceway Drive', 'Boulder', 'CO', '80302'),
('40 Raceway Drive', 'Lakewood', 'CO', '80227'),
('50 Raceway Drive', 'Arvada', 'CO', '80003'),
('60 Raceway Drive', 'Fort Collins', 'CO', '80521'),
('70 Raceway Drive', 'Pueblo', 'CO', '81001'),
('80 Raceway Drive', 'Thornton', 'CO', '80229'),
('90 Raceway Drive', 'Westminster', 'CO', '80031'),
('100 Raceway Drive', 'Greeley', 'CO', '80631');


-- 5 stables
INSERT INTO Stables (address_id) VALUES
(1),
(2),
(3),
(4),
(5);


-- 20 horses
INSERT INTO Horses (height, weight, name, breed, stable_id) VALUES
(15.2, 950, 'Thunder', 'Arabian', 1),
(16.0, 1100, 'Storm', 'Thoroughbred', 1),
(15.5, 1000, 'Blaze', 'Quarter Horse', 1),
(16.1, 1150, 'Lightning', 'Morgan', 1),

(14.8, 900, 'Comet', 'Arabian', 2),
(15.9, 1080, 'Midnight', 'Thoroughbred', 2),
(16.2, 1180, 'Rocket', 'Quarter Horse', 2),
(15.3, 980, 'Daisy', 'Morgan', 2),

(15.7, 1040, 'Spirit', 'Arabian', 3),
(16.3, 1200, 'Champion', 'Thoroughbred', 3),
(15.1, 930, 'Willow', 'Quarter Horse', 3),
(16.0, 1120, 'Ranger', 'Morgan', 3),

(15.4, 990, 'Star', 'Arabian', 4),
(16.4, 1220, 'Majesty', 'Thoroughbred', 4),
(15.8, 1060, 'Dusty', 'Quarter Horse', 4),
(16.1, 1160, 'Copper', 'Morgan', 4),

(15.0, 920, 'Goldie', 'Arabian', 5),
(16.2, 1170, 'King', 'Thoroughbred', 5),
(15.6, 1020, 'Sundance', 'Quarter Horse', 5),
(16.3, 1190, 'Pearl', 'Morgan', 5);


-- 15 races
-- Races 11-15 reuse addresses from races 1-5

INSERT INTO Races
    (race_date, address_id, first_place, second_place, third_place)
VALUES
('2026-01-10',  6,  1,  2,  3),
('2026-01-17',  7,  6,  7,  8),
('2026-01-24',  8, 11, 12, 13),
('2026-01-31',  9, 16, 17, 18),
('2026-02-07', 10,  4,  5,  6),
('2026-02-14', 11,  9, 10, 11),
('2026-02-21', 12, 14, 15, 16),
('2026-02-28', 13,  2,  8, 14),
('2026-03-07', 14,  4, 12, 20),
('2026-03-14', 15,  1,  6, 11),
('2026-03-21',  6,  3,  7, 12),
('2026-03-28',  7,  5,  9, 13),
('2026-04-04',  8,  2,  5,  8),
('2026-04-11',  9,  4,  7, 10),
('2026-04-18', 10,  1,  8, 12);


-- Horses participating in each race
INSERT INTO HorseRaces (horse_id, race_id) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(6, 2), (7, 2), (8, 2), (9, 2), (10, 2),
(11, 3), (12, 3), (13, 3), (14, 3), (15, 3),
(16, 4), (17, 4), (18, 4), (19, 4), (20, 4),

(2, 5), (4, 5), (6, 5), (8, 5), (10, 5),
(9, 6), (10, 6), (11, 6), (12, 6), (13, 6),
(14, 7), (15, 7), (16, 7), (17, 7), (18, 7),
(2, 8), (6, 8), (8, 8), (14, 8), (18, 8),
(4, 9), (8, 9), (12, 9), (16, 9), (20, 9),
(1, 10), (6, 10), (11, 10), (16, 10), (20, 10),

(3, 11), (7, 11), (12, 11), (15, 11), (19, 11),
(5, 12), (9, 12), (13, 12), (17, 12), (20, 12),
(2, 13), (5, 13), (8, 13), (11, 13), (14, 13),
(4, 14), (7, 14), (10, 14), (13, 14), (16, 14),
(1, 15), (8, 15), (12, 15), (18, 15), (20, 15);