/*Find the player who had the most success stealing bases in 2016, where success is measured as the 
percentage of stolen base attempts which are successful. (A stolen base attempt results either in a 
stolen base or being caught stealing.) 
Consider only players who attempted at least 20 stolen bases.*/
SELECT CONCAT(namefirst,' ',namelast) AS player_name,SB,CS, ROUND(CAST((CAST(SB AS float))/(CAST(SB+CS AS float))*100 AS numeric),2) AS sb_percent 
FROM people as p
JOIN batting as b
ON b.playerid = p.playerid
WHERE b.yearid = 2016 AND CS+SB >=20
ORDER BY sb_percent DESC
/*SELECT (CAST(SB AS float))/(CAST(SB+CS AS float))*100
FROM batting
WHERE yearid = 2016 AND SB !=0 AND CS!=0*/
/*SELECT SB, CS
FROM batting*/