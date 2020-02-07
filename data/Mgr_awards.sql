WITH match_list AS( SELECT namefirst,
				   namelast,
				   am.lgid, 
				  --mh.teamid,
				   awardid,
				   name
				FROM awardsmanagers AS am
				   INNER JOIN people AS p
				   ON am.playerid = p.playerid
				   JOIN managershalf AS mh
					ON am.playerid = p.playerid
				   JOIN teams as t
				    ON mh.teamid = t.teamid)
				--WHERE awardid ILIKE 'TSN Manager of the Year' AND am.lgid IN('AL'))
				
			SELECT  CONCAT(ml.namefirst,' ', ml.namelast) AS fullname, 
				   --lgid AS league--,
				   ml.name
				FROM match_list AS ml
				WHERE awardid ILIKE 'TSN Manager of the Year' AND lgid IN('NL')		   
				  INTERSECT
				SELECT  CONCAT(ml.namefirst,' ', ml.namelast) AS fullname, 
				  -- lgid AS league,
				   ml.name
				FROM match_list AS ml
				WHERE awardid ILIKE 'TSN Manager of the Year' AND lgid IN('AL')	


