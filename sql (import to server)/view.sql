CREATE OR REPLACE VIEW avg_participation AS
SELECT AVG(damageDealt) AS 'avgDmgDealt', AVG(damageTaken) AS 'avgDmgTaken', AVG(individualIncome) AS 'avgIndividualIncome', AVG(creepScore) AS 'avgCreepScore'
FROM STATISTICS;

CREATE OR REPLACE VIEW info AS
SELECT *
FROM TEAM NATURAL JOIN (SELECT * 
						FROM COMPOSE NATURAL JOIN (SELECT * 
												   FROM STATISTICS NATURAL JOIN PLAY) game_stat) player_stat, avg_participation;