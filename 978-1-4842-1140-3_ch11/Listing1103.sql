DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);

DBCC CHECKDB('AdventureWorks');

SELECT *
FROM sys.dm_os_wait_stats
WHERE wait_type = 'OLEDB';