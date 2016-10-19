-- Restore database
USE [master]
RESTORE DATABASE [AdventureWorks] 
FROM DISK = N'F:\Backup\AWBackup.bak'
WITH  FILE = 1, REPLACE;
GO