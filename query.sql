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
SELECT playerName, championName, datePlayed, individualKill, individualAssist, individualDeath 
FROM COMPOSE NATURAL JOIN STATISTICS;

# What is the player’s team composition (combination of champions) in a match?


# What is the opponent’s team composition (combination of champions) in a match?
# What is a player's overall win rate on a champion against a specific champion?
# What are champion’s counters (League is based on matchup of champions such as some champions over power others) ?
# What are champion’s allies (Which champs work better)?
# What items should the player build against counter champions?
# What items should the player build to work well with allies?
# What is the P/Kill of a player in a match?
# List all the games that are won/lost
# List all the games with a specific champion
# List all the games played on a specific game mode
# Is the player performing consistently on a given time period?
# What is a player's team participation/coordination?
# What is a player's preferred play style (aggressive, defensive, in the middle)?
# What is a player's preferred role in the team (protect, control, support, deal damage, take damage, assassinate, ...)?
# What is a player's gold income in a match?
# What is a player's statistic compared with another player's (better/worst parts)?
# What is a player’s game rating in a match?