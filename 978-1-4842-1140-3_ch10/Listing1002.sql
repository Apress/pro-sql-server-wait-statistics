DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR)

USE [master]
GO

ALTER DATABASE [AdventureWorks] 
  MODIFY FILE 
  ( 
  NAME = N'AdventureWorks_Data', 
  SIZE = 10485760KB 
  );
GO

SELECT * 
FROM sys.dm_os_wait_stats
WHERE wait_type = 'PREEMPTIVE_OS_WRITEFILEGATHER';