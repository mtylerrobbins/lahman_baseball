/*Find all players in the database who played at Vanderbilt University. Create a list showing
each player’s first and last names as well as the total salary they earned in the major leagues.
Sort this list in descending order by the total salary earned.
Which Vanderbilt player earned the most money in the majors?*/

SELECT DISTINCT CONCAT(p.namefirst,' ', p.namelast)AS fullname, sum(s.salary)
FROM people AS p
JOIN collegeplaying AS c
ON p.playerid = c.playerid
JOIN salaries AS s
ON p.playerid = s.playerid
WHERE schoolid ILIKE '%Vandy%' 
GROUP BY fullname
ORDER BY sum(s.salary)DESC


