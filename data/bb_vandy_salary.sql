/*
QUESTION: Find all players in the database who played at Vanderbilt University. Create a list showing
each player’s first and last names as well as the total salary they earned in the major leagues.
Sort this list in descending order by the total salary earned.
Which Vanderbilt player earned the most money in the majors?
SOURCES::
D
*/

SELECT p.namefirst,p.namelast, sum(s.salary)::numeric::money AS salary
FROM people AS p
JOIN collegeplaying AS c
ON p.playerid = c.playerid
INNER JOIN salaries AS s
ON p.playerid = s.playerid
JOIN Schools AS sc
ON sc.schoolid = c.schoolid
WHERE schoolname ILIKE '%Vanderbilt%' 
GROUP BY namefirst,namelast,c.playerid
ORDER BY salary DESC


