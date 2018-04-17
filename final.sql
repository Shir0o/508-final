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
	FOREIGN KEY (datePlayed) REFERENCES Matched(datePlayed),
	CHECK (kill >= 0),
	CHECK (assist >= 0),
	CHECK (income >= 0)
);