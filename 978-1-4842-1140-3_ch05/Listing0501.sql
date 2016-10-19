USE [master]
GO

DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);

BACKUP DATABASE [AdventureWorks] 
  TO  DISK = N'E:\Backup\aw_backup.bak' 
WITH 
  NAME = N'AdventureWorks-Full Database Backup',
  STATS = 2;
GO

SELECT *
FROM sys.dm_os_wait_stats
WHERE wait_type = 'ASYNC_IO_COMPLETION';