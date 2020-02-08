/*
QUESTION::
Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game 
in 2016 (where average attendance is defined as total attendance divided by number of games). Only consider parks where there 
were at least 10 games played. Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.
SOURCES::
DIMENSIONS::
FACTS::
ANSWER::
*/

SELECT *
FROM(SELECT ROUND(hg.attendance/games,2) AS avg_attend, team,hg.park, p.park_name,t.name
FROM homegames as hg
JOIN parks as p
ON p.park = hg.park
JOIN teams as t
ON hg.team = t.teamid
WHERE year = 2016 AND hg.games >= 10
GROUP BY hg.team,hg.park,p.park_name,hg.attendance, t.name,games
ORDER BY avg_attend DESC
LIMIT 5) AS cte

UNION

SELECT*
FROM (SELECT ROUND(hg.attendance/games,2) AS avg_attend, team,hg.park, p.park_name,t.name
FROM homegames as hg
JOIN parks as p
ON p.park = hg.park
JOIN teams as t
ON hg.team = t.teamid
WHERE year = 2016 AND hg.games >= 10
GROUP BY hg.team,hg.park,p.park_name,hg.attendance, t.name,games
ORDER BY avg_attend ASC
LIMIT 5) AS subquery
ORDER BY avg_attend