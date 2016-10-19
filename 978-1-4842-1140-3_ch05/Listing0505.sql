-- Make sure AdventureWorks is in Full recovery model
ALTER DATABASE AdventureWorks SET RECOVERY FULL
GO

-- Perform full backup
BACKUP DATABASE [AdventureWorks]   
TO  DISK = N'F:\Backup\AW_Full.bak' 
GO

-- Make some changes to AW database
USE AdventureWorks
GO

UPDATE Person.Address
SET City = 'Portland'
WHERE City = 'Bothell'

-- Backup Transaction Log
BACKUP LOG [AdventureWorks] 
TO  DISK = N'F:\Backup\AW_Log.trn' 
GO

-- Restore the previous full backup with NORECOVERY
USE [master]
GO

RESTORE DATABASE [AdventureWorks] 
FROM  DISK = N'F:\Backup\AW_Full.bak' 
WITH  NORECOVERY, REPLACE
GO

-- Clear sys.dm_os_wait_stats
dbcc sqlperf ('sys.dm_os_wait_stats', CLEAR)

-- Restore last Transaction Log backup
RESTORE LOG [AdventureWorks] FROM  DISK = N'F:\Backup\AW_Log.trn'
GO

-- Check IO_COMPLETION waits
SELECT *
FROM sys.dm_os_wait_stats
WHERE wait_type = 'IO_COMPLETION'
