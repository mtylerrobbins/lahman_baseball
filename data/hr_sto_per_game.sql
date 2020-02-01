/*Find the average number of strikeouts per game by decade since 1920. Round 
the numbers you report to 2 decimal places. Do the same for home runs per game. 
Do you see any trends?*/
SELECT FLOOR(yearid/10)*10 AS decade, ROUND(AVG(HR),2) AS HR_per_game, ROUND(AVG(SO),2) AS str_out_per_game
FROM batting
WHERE yearid>=1920
GROUP BY decade
ORDER BY decade DESC