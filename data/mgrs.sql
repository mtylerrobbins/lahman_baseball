SELECT (SELECT playerid
FROM awardsmanagers 
WHERE awardid ILIKE 'TSN Manager of the Year' AND am.lgid = 'NL' 
) AS BOTH, CONCAT(namefirst,' ', namelast) AS fullname ,am.lgid, mh.teamid

FROM awardsmanagers AS am
JOIN people AS p
ON am.playerid = p.playerid 
JOIN managershalf AS mh
ON am.playerid = p.playerid
WHERE awardid ILIKE 'TSN Manager of the Year' AND /*am.lgid = 'NL' OR*/ am.lgid = 'AL' 
--GROUP BY fullname, am.lgid ,am.lgid,mh.teamid
ORDER BY fullname 
