DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR)

USE AdventureWorks
GO

SELECT * 
FROM Sales.SalesOrderDetail;

SELECT *
FROM sys.dm_os_wait_stats
WHERE wait_type = 'PREEMPTIVE_OS_ENCRYPTMESSAGE'
OR wait_type = 'PREEMPTIVE_OS_DECRYPTMESSAGE';