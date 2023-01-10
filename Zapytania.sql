#players

INSERT INTO players (nick, email, password) VALUES ("artor", "artor@gmail.com", "haslo1");
INSERT INTO players (nick, email, password) VALUES ("klpo", "klpo@gmail.com", "haslo2");
INSERT INTO players (nick, email, password) VALUES ("tuk", "tuk@gmail.com", "haslo3");

#villages

INSERT INTO villages (name, x, y, players_id) VALUES ("Paryż", 100, 100, 1);
INSERT INTO villages (name, x, y, players_id) VALUES ("Berlin", 200, 200, 2);
INSERT INTO villages (name, x, y, players_id) VALUES ("Madryt", 300, 300, 3);

#resources

INSERT INTO resources (name, descriptions) VALUES ("drewno", "Aby pozyskać należy sciąć drzewo");
INSERT INTO resources (name, descriptions) VALUES ("glina", "Aby pozyskać zniszcz skałe osadową");
INSERT INTO resources (name, descriptions) VALUES ("żelazo", "Aby pozyskac wykop rudę");

#buildings

INSERT INTO buildings (name) VALUES ("dół z gliną");
INSERT INTO buildings (name) VALUES ("huta żelaza");
INSERT INTO buildings (name) VALUES ("chata drwala");

#troops

INSERT INTO troops (name, descriptions, damage, distance_damage, defense) VALUES ("łucznik", "strzela z luku", 0, 20, 10);
INSERT INTO troops (name, descriptions, damage, distance_damage, defense) VALUES ("miecznik", "operuje mieczem", 20, 0, 70);
INSERT INTO troops (name, descriptions, damage, distance_damage, defense) VALUES ("kusznik", "strzela z kuszy", 0, 30, 10);
INSERT INTO troops (name, descriptions, damage, distance_damage, defense) VALUES ("rycerz", "operuje mieczem i tarcza", 30, 0, 100);	

#login

SELECT * FROM players id WHERE password LIKE "haslo1" and email LIKE "artor@gmail.com"

#villages_has_resources

INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (1, 1, 1000);
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (2, 1, 900);
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (3, 1, 800);
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (1, 2, 1000);
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (2, 2, 900);
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (3, 2, 800);
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (1, 3, 1000);
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (2, 3, 900);
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (3, 3, 800);

#villages_has_buildings

INSERT INTO villages_has_buildings (villages_id, buildings_id, value) VALUES (1, 1, 1);
INSERT INTO villages_has_buildings (villages_id, buildings_id, value) VALUES (2, 1, 1);
INSERT INTO villages_has_buildings (villages_id, buildings_id, value) VALUES (3, 1, 1);
INSERT INTO villages_has_buildings (villages_id, buildings_id, value) VALUES (3, 2, 1);

#villages_has_troops

INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (1, 1, 100);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (1, 2, 100);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (1, 3, 10);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (1, 4, 10);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (2, 1, 100);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (2, 2, 100);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (2, 3, 10);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (2, 4, 10);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (3, 1, 100);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (3, 2, 100);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (3, 3, 10);
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (3, 4, 10);

#zasoby z wioski drugiego gracza

SELECT * FROM players 
JOIN villages ON players.id = villages.players_id 
JOIN villages_has_resources ON villages.id = villages_has_resources.villages_id
JOIN resources ON resources.name = resources.resources_name
WHERE players.id = 2

#żołnierze pierwszego gracza

SELECT * FROM players
JOIN villages ON players.id = villages.players_id
JOIN villages_has_troops ON villages.id = villages_has_troops.villages_id
WHERE players.id = 1 

#budynki z pierszej wioski trzeciego gracza

SELECT * FROM players
JOIN villages ON players.id = villages.players_id
JOIN villages_has_buildings ON villages.id = villages_has_buildings.villages_id
WHERE players.id = 3
