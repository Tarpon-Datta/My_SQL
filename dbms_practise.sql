CREATE TABLE(
Hero_id VARCHAR(30),
Name VARCHAR(30),
Location VARCHAR(100),
PRIMARY KEY (Hero_id)
);

CREATE TABLE(
Villain_id VARCHAR(30),
Name VARCHAR(30),
Location VARCHAR(100),
Primary KEY(Villian_id)
);

CREATE TABLE(
Battle_id VARCHAR(30),
Hero_id VARCHAR(30),
villain_id VARCHAR(30),
Battle_Date DATE,
Hero_points int,
Battle_location VARCHAR(100),
PRIMARY KEY(Battle_id),
FOREIGN KEY(Hero_id) REFERENCES Heroes(Hero_id),
FOREIGN KEY(Villain_id) REFERENCES Villains(Villain_id)
);


