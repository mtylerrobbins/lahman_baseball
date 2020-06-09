--Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?

SELECT p.namefirst|| ' '|| p.namelast AS fullname, min(p.height), a.g_all), a.teamID,t.name
FROM people AS p
JOIN appearances AS a
ON p.playerid = a.playerid
JOIN teams as t
ON a.teamid = t.teamid AND a.yearid = t.yearid
GROUP BY height,namefirst, namelast,a.teamID,t.name, g.all
ORDER BY height
LIMIT 1