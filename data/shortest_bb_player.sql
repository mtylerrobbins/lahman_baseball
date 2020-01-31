--Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?

SELECT p.namefirst,p.namelast, min(p.height), COUNT(a.g_all), a.teamID
FROM people AS p
JOIN appearances AS a
ON p.playerid = a.playerid
GROUP BY height,namefirst, namelast,a.teamID
ORDER BY height
LIMIT 1