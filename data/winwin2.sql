/*From 1970 – 2016, what is the largest number of wins for a team that did not win the world series?

Seattle Mariners SEA 116 2001

What is the smallest number of wins for a team that did win the world series? 

Los Angeles Dodgers LAN 63 1981

Doing this will probably 
result in an unusually small number of wins for a world series champion – determine why this is the 
case. Then redo your query, excluding the problem year. 

In 1981 There was a strike that forced the cancellation of 713 games in the season.
If removed then it returns:

St. Louis Cardinals SLN 83 in 2006

How often from 1970 – 2016 was it the case 
that a team with the most wins also won the world series?

45 times

What percentage of the time?

45/146 OR 30.82%

*/SELECT name, teamid, MAX(w) AS max_win_win_ws, yearid
FROM teams
WHERE yearid BETWEEN 1970 AND 2016 AND wswin = 'Y' AND yearid != 1981
GROUP BY name,teamid,yearid
ORDER BY max_win_win_ws DESC

/*SELECT count(DISTINCT yearid)AS year
FROM teams*/