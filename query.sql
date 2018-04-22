# What is the KDA of a player in a match?
(SELECT playerName, (individualKill + individualAssist) / individualDeath AS 'KDA'
FROM (SELECT playerName, datePlayed, championName, individualKill, individualAssist, individualDeath 
	  FROM COMPOSE NATURAL JOIN (SELECT datePlayed, id, championName, individualKill, individualAssist, individualDeath 
								 FROM STATISTICS NATURAL JOIN PLAY) game_stat) player_stat
WHERE individualDeath != 0)
UNION
(SELECT playerName, individualKill + individualAssist AS 'KDA'
FROM (SELECT playerName, datePlayed, championName, individualKill, individualAssist, individualDeath 
	  FROM COMPOSE NATURAL JOIN (SELECT datePlayed, id, championName, individualKill, individualAssist, individualDeath 
								 FROM STATISTICS NATURAL JOIN PLAY) game_stat) player_stat
WHERE individualDeath = 0);
                           
# What is a player’s overall win rate with a champion?
SELECT playerName, matchWon / matchPlayed AS 'Win rate'
FROM PLAYERS;

# What is a player’s overall KDA with a champion?
(SELECT playerName, (totalKill + totalAssist) / totalDeath AS 'KDA'
FROM (SELECT playerName, championName, SUM(individualKill) AS 'totalKill', SUM(individualAssist) AS 'totalAssist', SUM(individualDeath) AS 'totalDeath' 
	  FROM COMPOSE NATURAL JOIN STATISTICS
	  GROUP BY playerName, championName) player_stat
WHERE totalDeath != 0)
UNION
(SELECT playerName, totalKill + totalAssist AS 'KDA'
FROM (SELECT playerName, championName, SUM(individualKill) AS 'totalKill', SUM(individualAssist) AS 'totalAssist', SUM(individualDeath) AS 'totalDeath' 
	  FROM COMPOSE NATURAL JOIN STATISTICS
	  GROUP BY playerName, championName) player_stat
WHERE totalDeath = 0);

# What is the player’s team composition (combination of champions) in a match?
SELECT id, championName
FROM COMPOSE
WHERE id = 1
ORDER BY id;

# What is the opponent’s team composition (combination of champions) in a match?
SELECT id, championName
FROM PLAY NATURAL JOIN COMPOSE
ORDER BY datePlayed;

# What is a player's overall win rate on a champion?
SELECT playerName, championName, (numWon / numPlayed) * 100 AS 'Champion win rate'
FROM (SELECT playerName, championName, COUNT(id) AS 'numPlayed'
	  FROM COMPOSE
	  GROUP BY playerName, championName) played NATURAL JOIN (SELECT playerName, championName, COUNT(p.id) AS 'numWon'
															  FROM PLAY p, COMPOSE c
															  WHERE p.teamWon = c.id
															  GROUP BY playerName, championName) won;

# How many times has a player played on a specific champion?
SELECT playerName, championName, COUNT(id) AS 'numPlayed'
FROM COMPOSE
GROUP BY playerName, championName;

# How many times has a player won on a specific champion?
SELECT playerName, championName, COUNT(p.id) AS 'numWon'
FROM PLAY p, COMPOSE c
WHERE p.teamWon = c.id
GROUP BY playerName, championName;

# What is the P/Kill of a player in a match?
SELECT playerName, datePlayed, (individualKill + individualAssist) / teamKill * 100 AS 'Kill participation'
FROM TEAM NATURAL JOIN (SELECT * 
						FROM COMPOSE NATURAL JOIN (SELECT * 
												   FROM STATISTICS NATURAL JOIN PLAY) game_stat) player_stat;

# List all the games that are won
SELECT teamWon, datePlayed
FROM PLAY;

# List all the games that are lost
SELECT id, datePlayed
FROM PLAY
WHERE id != teamWon;

# List all the games with a specific champion
SELECT championName, datePlayed
FROM COMPOSE NATURAL JOIN PLAY
WHERE championName = 'Riven';

# List all the games played on a specific game mode
SELECT *
FROM MATCHES
WHERE modes = 'Summoner\'s Rift';

# What is a player's damage dealt participation?
SELECT playerName, player_stat.damageDealt - avg_participation.avgDmgDealt AS 'Damage dealt compared with average'
FROM TEAM NATURAL JOIN (SELECT * 
						FROM COMPOSE NATURAL JOIN (SELECT * 
												   FROM STATISTICS NATURAL JOIN PLAY) game_stat) player_stat, avg_participation;

# What is a player's damage taken participation?
SELECT playerName, player_stat.damageTaken - avg_participation.avgDmgTaken AS 'Damage taken compared with average'
FROM TEAM NATURAL JOIN (SELECT * 
						FROM COMPOSE NATURAL JOIN (SELECT * 
												   FROM STATISTICS NATURAL JOIN PLAY) game_stat) player_stat, avg_participation;

# What is a player's individual income participation?
SELECT playerName, player_stat.individualIncome - avg_participation.avgIndividualIncome AS 'Individual income compared with average'
FROM TEAM NATURAL JOIN (SELECT * 
						FROM COMPOSE NATURAL JOIN (SELECT * 
												   FROM STATISTICS NATURAL JOIN PLAY) game_stat) player_stat, avg_participation;

# What is a player's preferred role?
SELECT playerName, positions, COUNT(positions) AS 'Preferred role count'
FROM COMPOSE
GROUP BY playerName, positions;

# What is a player's preferred role in the team (protect, control, support, deal damage, take damage, assassinate, ...)?
SELECT playerName, positions, MAX(preferredRoleCount) AS 'Maximum preferred role count'
FROM (SELECT playerName, positions, COUNT(positions) AS 'preferredRoleCount'
	  FROM COMPOSE
	  GROUP BY playerName, positions) prefer_role
GROUP BY playerName, positions;

# What is a player's gold income in a match?
# What is a player's statistic compared with another player's (better/worst parts)?
# What is a player’s game rating in a match?