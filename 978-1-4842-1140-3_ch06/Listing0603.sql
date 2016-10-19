-- clear sys.dm_os_wait_stats
DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);

-- backup database
BACKUP DATABASE [AdventureWorks] 
  TO DISK = N'F:\Backup\aw_21042015.bak' 
WITH 
  NAME = N'AdventureWorks-Full Database Backup',
  BUFFERCOUNT = 200;
GO

-- Query BACKUPBUFFER waits
SELECT * 
FROM sys.dm_os_wait_stats
WHERE wait_type = 'BACKUPBUFFER';
