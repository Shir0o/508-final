CREATE OR REPLACE VIEW avg_participation AS
SELECT AVG(damageDealt) AS 'avgDmgDealt', AVG(damageTaken) AS 'avgDmgTaken', AVG(individualIncome) AS 'avgIndividualIncome'
FROM STATISTICS;