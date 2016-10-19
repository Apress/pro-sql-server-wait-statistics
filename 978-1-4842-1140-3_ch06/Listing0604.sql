-- clear sys.dm_os_wait_stats
DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);


BACKUP DATABASE [AdventureWorks] 
  TO DISK = N'F:\Backup\aw_21042015.bak' 
WITH 
  NAME = N'AdventureWorks-Full Database Backup';
GO

-- Query BACKUPIO waits
SELECT * 
FROM sys.dm_os_wait_stats
WHERE wait_type = 'BACKUPIO'
OR wait_type = 'ASYNC_IO_COMPLETION';

