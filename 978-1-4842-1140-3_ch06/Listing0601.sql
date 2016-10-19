-- enable trace flags
DBCC TRACEON (3213);
DBCC TRACEON (3605);

-- backup database
BACKUP DATABASE [AdventureWorks] 
  TO  DISK = N'F:\Backup\aw_21042015.bak' 
WITH NAME = N'AdventureWorks-Full Database Backup';
GO

-- disable trace flags
DBCC TRACEOFF (3213);
DBCC TRACEOFF (3605);
