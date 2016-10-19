USE [Baseline]
GO

-- Check if the temp table already exists
-- if it does drop it.
IF EXISTS
  (
  SELECT *
  FROM tempdb.dbo.sysobjects
  WHERE ID = OBJECT_ID(N'tempdb..#ws_Capture')
  )		
DROP TABLE #ws_Capture;

-- Create temp table to hold our first measurement
CREATE TABLE #ws_Capture
  (
  wst_WaitType VARCHAR(50),
  wst_WaitTime INT,
  wst_WaitingTasks INT,
  wst_SignalWaitTime INT
  );

-- Insert our first measurement into the temp table
INSERT INTO #ws_Capture
  SELECT
    wait_type,
	wait_time_ms,
	waiting_tasks_count,
	signal_wait_time_ms
  FROM sys.dm_os_wait_stats;

-- Wait for the next measurement
-- In this case we will wait 15 minutes
WAITFOR DELAY '00:15:00'

-- Combine the first measurement with a new
-- measurement and calculate the deltas
-- Write the results into the WaitStats table
INSERT INTO WaitStats
SELECT 
  GETDATE() AS 'DateTime',
  DATEPART(DAY,GETDATE()) AS 'Day',
  DATEPART(MONTH,GETDATE()) AS 'Month',
  DATEPART(YEAR,GETDATE()) AS 'Year',
  DATEPART(HOUR, GETDATE()) AS 'Hour',
  DATEPART(MINUTE, GETDATE()) AS 'Minute',
  DATENAME(DW, GETDATE()) AS 'DayOfWeek',
  dm.wait_type AS 'WaitType',
  dm.wait_time_ms - ws.wst_WaitTime AS 'WaitTime',
  dm.waiting_tasks_count - ws.wst_WaitingTasks AS 'WaitingTasks',
  dm.signal_wait_time_ms - ws.wst_SignalWaitTime AS 'SignalWaitTime'
FROM sys.dm_os_wait_stats dm
INNER JOIN #ws_Capture ws
ON dm.wait_type = ws.wst_WaitType;

-- Clean up the temp table
DROP TABLE #ws_Capture;