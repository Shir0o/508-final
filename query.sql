SELECT ((individualKill + individualAssist) / individualDeath) AS "KDA"
FROM SCORE
WHERE individualDeath != 0
UNION
SELECT playerName, (individualKill + individualAssist) AS "KDA"
FROM SCORE
WHERE individualDeath == 0;