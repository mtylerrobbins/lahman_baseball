WITH Award_mgr AS(
	SELECT am.playerid, am.lgid,yearid
	FROM awardsmanagers AS am
	WHERE awardid ILIKE 'TSN Manager of the Year'),
	
 al_mgr AS(SELECT DISTINCT am.playerid
	FROM award_mgr AS am
	WHERE am.lgid ='AL'
),	
nl_mgr AS(
	SELECT DISTINCT am.playerid
	FROM award_mgr AS am
	WHERE am.lgid ='NL'
),
combine_mgr AS( SELECT playerid
			   FROM al_mgr
			   INTERSECT
			   SELECT playerid
			   FROM nl_mgr
)
	SELECT am.playerid,CONCAT(p.namefirst,' ', p.namelast) AS fullname,am.lgid,am.yearid, t.name
	FROM award_mgr AS am
	INNER JOIN combine_mgr AS cm
	ON am.playerid = cm.playerid
	INNER JOIN managers m
	ON m.yearid = am.yearid AND m.playerid = am.playerid
	INNER JOIN teams as t
	ON m.teamid = t.teamid AND m.yearid = t.yearid
	INNER JOIN people as p
	ON p.playerid = am.playerid