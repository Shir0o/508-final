(SELECT (individualKill + individualAssist) / individualDeath
FROM SCORE
WHERE individualDeath != 0)
UNION
(SELECT individualKill + individualAssist
FROM SCORE
WHERE individualDeath = 0);

SELECT datePlayed, 
FROM MATCHES NATURAL JOIN SCORE