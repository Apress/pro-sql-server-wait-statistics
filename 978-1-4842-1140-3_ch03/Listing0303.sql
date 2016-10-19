USE [Baseline]
GO

-- Insert Wait Stats into Baseline table
INSERT INTO WaitStats
SELECT 
  GETDATE() AS 'DateTime',
  DATEPART(DAY,GETDATE()) AS 'Day',
  DATEPART(MONTH,GETDATE()) AS 'Month',
  DATEPART(YEAR,GETDATE()) AS 'Year',
  DATEPART(HOUR, GETDATE()) AS 'Hour',
  DATEPART(MINUTE, GETDATE()) AS 'Minute',
  DATENAME(DW, GETDATE()) AS 'DayOfWeek',
  wait_type AS 'WaitType',
  wait_time_ms AS 'WaitTime',
  waiting_tasks_count AS 'WaitingTasks',
  signal_wait_time_ms AS 'SignalWaitTime'
FROM sys.dm_os_wait_stats;

-- Clear sys.dm_os_wait_stats
DBCC SQLPERF ('sys.dm_os_wait_stats',CLEAR)
GO