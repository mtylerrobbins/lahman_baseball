/*Using the fielding table, group players into three groups based on their position: label 
players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as
"Infield", and those with position "P" or "C" as "Battery". 
Determine the number of putouts made by each of these three groups in 2016.*/
SELECT (
	CASE WHEN pos ILIKE '%SS%'OR pos ILIKE '%1B%' OR pos ILIKE '%2B%' OR pos ILIKE '%3B%' THEN 'Infield'
		WHEN pos ILIKE 'P%' OR pos ILIKE 'C%' THEN 'Battery'
		ELSE 'Outfield'END) AS pos_group, COUNT(playerid) AS count_pl, SUM(PO) AS putouts
FROM fielding
WHERE yearID = 2016
GROUP BY pos_group

