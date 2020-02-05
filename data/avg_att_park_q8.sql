SELECT ROUND(hg.attendance/games,2) AS avg_attend, team,hg.park, p.park_name,t.name
FROM homegames as hg
JOIN parks as p
ON p.park = hg.park
JOIN teams as t
ON hg.team = t.teamid
WHERE year = 2016 AND hg.games >= 10
GROUP BY hg.team,hg.park,p.park_name,hg.attendance, t.name,games
ORDER BY avg_attend DESC
LIMIT 5