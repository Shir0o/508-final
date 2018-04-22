# CREATE DATABASE finalProject;

USE finalProject;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Champions;
DROP TABLE IF EXISTS Statistics;
DROP TABLE IF EXISTS Compose;
DROP TABLE IF EXISTS Play;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Players (
	playerName VARCHAR(16) NOT NULL,
	matchPlayed MEDIUMINT,
	matchWon MEDIUMINT,
	PRIMARY KEY (playerName),
	CHECK (matchPlayed >= 0),
	CHECK (matchWon >= 0)
);

CREATE TABLE Matches (
    datePlayed TIMESTAMP NOT NULL,
    matchLength TIME NOT NULL,
    modes ENUM('Summoner\'s Rift', 'Twisted Treeline', 'Howling Abyss', 'Acension', 'Doom Bots', 'Legend of the Poro King', 'Ultra Rapid Fire', 'Hexakill', 'Nemesis Draft', 'One For All'),
    PRIMARY KEY (datePlayed),
    CHECK (datePlayed >= CURRENT_DATE()),
    CHECK (matchLength > 0)
);

CREATE TABLE Team (
	id INT NOT NULL,
	teamKill SMALLINT,
	teamAssist SMALLINT,
	teamIncome INT,
    PRIMARY KEY (id),
	CHECK (id >= 0),
	CHECK (teamKill >= 0),
	CHECK (teamAssist >= 0),
	CHECK (teamIncome >= 0)
);

CREATE TABLE Champions (
	championName ENUM('Riven', 'Janna', 'Fiora', 'Irelia', 'Ahri', 'Akali', 'Ashe', 'Jinx', 'Karma', 'Katarina'),
	attackType ENUM('Range', 'Melee'),
	PRIMARY KEY (championName)
);

CREATE TABLE Statistics (
	championName ENUM('Riven', 'Janna', 'Fiora', 'Irelia', 'Ahri', 'Akali', 'Ashe', 'Jinx', 'Karma', 'Katarina', 'Lee sin', 'Zed', 'Ezreal', 'Thresh'),
	datePlayed TIMESTAMP NOT NULL,
    creepScore SMALLINT,
	income INT,
	rating ENUM('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F+', 'F', 'F-'),
	damageDealt INT,
	damageTaken INT,
    individualKill SMALLINT,
    individualDeath SMALLINT,
	individualAssist SMALLINT,
	invididualIncome SMALLINT, 
    PRIMARY KEY (datePlayed),
	FOREIGN KEY (championName) REFERENCES Champions(championName),
    FOREIGN KEY (datePlayed) REFERENCES Matches(datePlayed),
	CHECK (datePlayed >= CURRENT_DATE()),
	CHECK (individualKill >= 0),
	CHECK (individualDeath >= 0),
	CHECK (individualAssist >= 0),
	CHECK (invididualIncome >= 0),
	CHECK (creepScore >= 0),
	CHECK (income >= 0),
	CHECK (damageDealt >= 0),
	CHECK (damageTaken >= 0)
);

CREATE TABLE Compose (
    playerName VARCHAR(16) NOT NULL,
    id INT NOT NULL,
    championName ENUM('Riven', 'Janna', 'Fiora', 'Irelia', 'Ahri', 'Akali', 'Ashe', 'Jinx', 'Karma', 'Katarina'),
	positions ENUM('Top', 'Jungle', 'Mid', 'Adc', 'Support'),
    PRIMARY KEY (playerName),
    FOREIGN KEY (playerName) REFERENCES Players(playerName),
    FOREIGN KEY (id) REFERENCES Team(id),
	FOREIGN KEY (championName) REFERENCES Champions(championName),
    CHECK (id >= 0)
);

CREATE TABLE Play (
    id INT NOT NULL,
    datePlayed TIMESTAMP NOT NULL,
    teamWon INT NOT NULL,
    PRIMARY KEY (datePlayed),
    FOREIGN KEY (id) REFERENCES Team(id),
    FOREIGN KEY (datePlayed) REFERENCES Matches(datePlayed),
    FOREIGN KEY (teamWon) REFERENCES Team(id),
	CHECK (datePlayed >= CURRENT_DATE()),
    CHECK (id >= 0)
);