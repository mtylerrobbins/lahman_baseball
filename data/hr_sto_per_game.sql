/* 
QUESTION::
Find the average number of strikeouts per game by decade since 1920. Round 
the numbers you report to 2 decimal places. Do the same for home runs per game. 
Do you see any trends?
SOURCES::
batting
Facts::
DIMENSIONS::
ANSWER::
*/ 
SELECT (yearid/10)*10 AS decade, ROUND(AVG(HR),2) AS AVG_HR_per_game, ROUND(SUM(so)/(SUM(g)::numeric/2),2) AS AVG_str_out_per_game
FROM teams
WHERE yearid>=1920
GROUP BY decade
ORDER BY decade DESC