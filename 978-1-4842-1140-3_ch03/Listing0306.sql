-- Baseline between 8 and 9 on workdays
-- Not including measurements done today
SELECT
  CONVERT(VARCHAR(5), ws_DateTime, 108) AS 'Time',
  AVG(ws_WaitTime) AS 'Baseline'
FROM WaitStats
WHERE ws_WaitType = 'PAGEIOLATCH_SH'
AND ws_DayOfWeek IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday','Friday')
AND (ws_Hour >= 8 AND ws_Hour < 9)
AND CONVERT(VARCHAR(5), ws_DateTime, 105) < CONVERT(VARCHAR(5), GETDATE(), 105)
GROUP BY CONVERT(VARCHAR(5), ws_DateTime, 108);