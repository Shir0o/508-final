# CREATE DATABASE finalProject;

USE finalProject;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Champions;
DROP TABLE IF EXISTS Score;
DROP TABLE IF EXISTS Statistics;
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
	datePlayed TIMESTAMP NOT NULL,
	teamKill SMALLINT,
	teamAssist SMALLINT,
	teamIncome SMALLINT,
	FOREIGN KEY (datePlayed) REFERENCES Matches(datePlayed),
	CHECK (teamKill >= 0),
	CHECK (assist >= 0),
	CHECK (income >= 0)
);

CREATE TABLE Champions (
	championName ENUM('Riven', 'Janna', 'Fiora', 'Irelia', 'Ahri', 'Akali', 'Ashe', 'Jinx', 'Karma', 'Katarina'),
	attackType ENUM('Range', 'Melee'),
	role ENUM('Top', 'Jungle', 'Mid', 'Adc', 'Support'),
	PRIMARY KEY (championName)
);

CREATE TABLE Score (
	championName ENUM('Riven', 'Janna', 'Fiora', 'Irelia', 'Ahri', 'Akali', 'Ashe', 'Jinx', 'Karma', 'Katarina'),
	datePlayed TIMESTAMP NOT NULL,
    individualKill SMALLINT,
    individualDeath SMALLINT,
	individualAssist SMALLINT,
	invididualIncome SMALLINT, 
	FOREIGN KEY (championName) REFERENCES Champions(championName),
	FOREIGN KEY (datePlayed) REFERENCES Matches(datePlayed),
	CHECK (individualKill >= 0),
	CHECK (individualDeath >= 0),
	CHECK (individualAssist >= 0),
	CHECK (invididualIncome >= 0)
);

CREATE TABLE Statistics (
	championName ENUM('Riven', 'Janna', 'Fiora', 'Irelia', 'Ahri', 'Akali', 'Ashe', 'Jinx', 'Karma', 'Katarina', 'Lee sin', 'Zed', 'Ezreal', 'Thresh'),
	creepScore SMALLINT,
	income SMALLINT,
	rating ENUM('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F+', 'F', 'F-'),
	damageDealt SMALLINT,
	damageTaken SMALLINT,
	FOREIGN KEY (championName) REFERENCES Champions(championName),
	CHECK (creepScore >= 0),
	CHECK (income >= 0),
	CHECK (damageDealt >= 0),
	CHECK (damageTaken >= 0)
);