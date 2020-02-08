/*From 1970 – 2016, what is the largest number of wins for a team that did not win the world series?*/

/*WITH wsw AS(SELECT name, yearid, wswin, w
			FROM teams
		    WHERE wswin IS NOT NULL AND yearid BETWEEN 1970 AND 2016/* AND wswin = 'N'*/),
			MAX_ws AS(SELECT MAX(w) AS max_wins,yearid
			FROM wsw
			GROUP BY yearid	 ),

ws_comp AS (SELECT wsw.name,wsw.yearid, CASE WHEN w = max_wins THEN 'Y'
			ELSE 'N' END AS had_max_w,  wswin,w,max_wins
			FROM wsw
			JOIN MAX_ws AS mws
			ON mws.yearid = wsw.yearid
			ORDER BY w DESC)

SELECT wsw.name, wsw.name,wsw.yearid, wsw.wswin,wsw.w,wsc.max_wins, wsc.had_max_w
FROM ws_comp AS wsc
JOIN wsw 
ON wsw.yearid = wsc.yearid
WHERE wsc.wswin = 'N' AND wsc.had_max_w = 'Y'
ORDER BY w DESC
LIMIT 1*/






--Seattle Mariners SEA 116 2001

--What is the smallest number of wins for a team that did win the world series? 
/*WITH wsw AS(SELECT name, yearid, wswin, w
			FROM teams
		    WHERE wswin IS NOT NULL AND yearid BETWEEN 1970 AND 2016/* AND wswin = 'N'*/),
			MAX_ws AS(SELECT MAX(w) AS max_wins,yearid
			FROM wsw
			GROUP BY yearid	 ),

ws_comp AS (SELECT wsw.name,wsw.yearid, CASE WHEN w = max_wins THEN 'Y'
			ELSE 'N' END AS had_max_w,  wswin,w,max_wins
			FROM wsw
			JOIN MAX_ws AS mws
			ON mws.yearid = wsw.yearid
			ORDER BY w DESC)

SELECT wsw.name, wsw.name,wsw.yearid, wsw.wswin,wsw.w,wsc.max_wins, wsc.had_max_w
FROM ws_comp AS wsc
JOIN wsw 
ON wsw.yearid = wsc.yearid
WHERE wsw.wswin = 'Y' AND wsc.had_max_w = 'N'
ORDER BY w */



--Los Angeles Dodgers LAN 63 1981

/*Doing this will probably 
result in an unusually small number of wins for a world series champion – determine why this is the 
case. Then redo your query, excluding the problem year. */

/*	WITH wsw AS(SELECT name, yearid, wswin, w
			FROM teams
		    WHERE wswin IS NOT NULL AND yearid BETWEEN 1970 AND 2016 AND yearid != '1981'),
			MAX_ws AS(SELECT MAX(w) AS max_wins,yearid
			FROM wsw
			GROUP BY yearid	 ),

ws_comp AS (SELECT wsw.name,wsw.yearid, CASE WHEN w = max_wins THEN 'Y'
			ELSE 'N' END AS had_max_w,  wswin,w,max_wins
			FROM wsw
			JOIN MAX_ws AS mws
			ON mws.yearid = wsw.yearid
			ORDER BY w DESC)

SELECT wsw.name, wsw.name,wsw.yearid, wsw.wswin,wsw.w,wsc.max_wins, wsc.had_max_w
FROM ws_comp AS wsc
JOIN wsw 
ON wsw.yearid = wsc.yearid
WHERE wsw.wswin = 'Y' AND wsc.had_max_w = 'N'
ORDER BY w*/


--St. Louis Cardinals SLN 83 in 2006

/*How often from 1970 – 2016 was it the case 
that a team with the most wins also won the world series?*/

/*WITH wsw AS(SELECT name, yearid, wswin, w
			FROM teams
		    WHERE wswin IS NOT NULL AND yearid BETWEEN 1970 AND 2016/* AND wswin = 'N'*/),
			MAX_ws AS(SELECT MAX(w) AS max_wins,yearid
			FROM wsw
			GROUP BY yearid	 ),

ws_comp AS (SELECT wsw.name,wsw.yearid, CASE WHEN w = max_wins THEN 'Y'
			ELSE 'N' END AS had_max_w,  wswin,w,max_wins
			FROM wsw
			JOIN MAX_ws AS mws
			ON mws.yearid = wsw.yearid
			ORDER BY w DESC)

SELECT COUNT(*)
FROM ws_comp AS wsc
JOIN wsw 
ON wsw.yearid = wsc.yearid
WHERE wsw.wswin = 'Y' AND wsc.had_max_w = 'Y' AND max_wins = wsw.w*/


--14 times

--What percentage of the time?

WITH wsw AS(SELECT name, yearid, wswin, w
			FROM teams
		    WHERE wswin IS NOT NULL AND yearid BETWEEN 1970 AND 2016/* AND wswin = 'N'*/),
			MAX_ws AS(SELECT MAX(w) AS max_wins,yearid
			FROM wsw
			GROUP BY yearid	 ),

ws_comp AS (SELECT wsw.name,wsw.yearid, CASE WHEN w = max_wins THEN 1
			ELSE 0 END AS had_max_w,  wswin,w,max_wins
			FROM wsw
			JOIN MAX_ws AS mws
			ON mws.yearid = wsw.yearid
			ORDER BY w DESC)

--SELECT CAST(COUNT(*)AS float)/CAST(count(wsw.yearid)AS float)
SELECT ROUND(CAST(COUNT(wsc.had_max_w) AS numeric)/CAST(Count(wsw.yearid) AS numeric)),2)
FROM ws_comp AS wsc
JOIN wsw 
ON wsw.yearid = wsc.yearid
WHERE wsw.wswin = 'Y' AND wsc.had_max_w = 1 --AND max_wins = wsw.w

--14/47 OR 29.79%

/*WITH match_list AS (SELECT name, teamid, MAX(w) AS max_win_win_ws,yearid

FROM teams
WHERE yearid BETWEEN 1970 AND 2016 AND wswin = 'Y' AND yearid != 1981
GROUP BY yearid, name,teamid,yearid
ORDER BY yearid DESC
)

SELECT COUNT(*)/COUNT(ml.yearid Betwee) --count_ws_win/( sum(COUNT(DISTINCT ml.yearid)+1)OVER())
FROM match_list AS ml
JOIN teams as t
ON t.teamid = ml.teamid AND t.yearid = ml.yearid*/



/*SELECT count(DISTINCT yearid)AS year
FROM teams*/