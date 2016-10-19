-- PAGEIOLATCH_SH waits, today between 8 and 9 AM
SELECT
  CONVERT(VARCHAR(5), ws_DateTime, 108) AS 'Time',
  ws_WaitTime AS 'Wait Time'
FROM WaitStats
WHERE ws_WaitType = 'PAGEIOLATCH_SH'
AND (ws_Hour >= 8 AND ws_Hour < 9)
AND CONVERT(VARCHAR(5), ws_DateTime, 105) = CONVERT(VARCHAR(5), GETDATE(), 105)