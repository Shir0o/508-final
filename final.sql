CREATE TABLE Players (
	name VARCHAR(16) NOT NULL
	matchPlayed MEDIUMINT,
	matchWon MEDIUMINT,
	PRIMARY KEY (name),
	CHECK (matchPlayed >= 0),
	CHECK (matchWon >= 0)
);

CREATE TABLE Matches (
	datePlayed TIMESTAMP NOT NULL,
	matchLength TIME NOT NULL,
	modes ENUM('Summoner\'s Rift', 'Twisted Treeline', 'Howling Abyss', 'Acension', 'Doom Bots', 'Legend of the Poro King', 'Ultra Rapid Fire', 'Hexakill', 'Nemesis Draft', 'One For All'),
	PRIMARY KEY (datePlayed),
	CHECK (datePlayed >= CURRENT_DATE())
	CHECK (matchLength > 0)
);

CREATE TABLE Team (
	datePlayed TIMESTAMP NOT NULL,
	kill SMALLINT,
	assist SMALLINT,
	income SMALLINT,
	FOREIGN KEY (datePlayed) REFERENCES Matches(datePlayed),
	CHECK (kill >= 0),
	CHECK (assist >= 0),
	CHECK (income >= 0)
);

CREATE TABLE Champions (
	name ENUM('Riven', 'Janna', 'Fiora', 'Irelia', 'Ahri', 'Akali', 'Ashe', 'Jinx', 'Karma', 'Katarina'),
	attackType ENUM('Range', 'Melee'),
	role ENUM('Top', 'Jungle', 'Mid', 'Adc', 'Support'),
	PRIMARY KEY name
);

CREATE TABLE Score (
	name ENUM('Riven', 'Janna', 'Fiora', 'Irelia', 'Ahri', 'Akali', 'Ashe', 'Jinx', 'Karma', 'Katarina'),
	kill SMALLINT,
	assist SMALLINT,
	income SMALLINT, 
	FOREIGN KEY (name) REFERENCES Champions(name),
	CHECK (kill >= 0),
	CHECK (assist >= 0),
	CHECK (income >= 0)
);

CREATE TABLE Statistics (
	name ENUM('Riven', 'Janna', 'Fiora', 'Irelia', 'Ahri', 'Akali', 'Ashe', 'Jinx', 'Karma', 'Katarina'),
	creepScore SMALLINT,
	income SMALLINT, 
	rating ENUM('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F+', 'F', 'F-'),
	damageDealt SMALLINT,
	damageTaken SMALLINT,
	FOREIGN KEY (name) REFERENCES Champions(name),
	CHECK (creepScore >= 0),
	CHECK (income >= 0),
	CHECK (damageDealt >= 0),
	CHECK (damageTaken >= 0)
);