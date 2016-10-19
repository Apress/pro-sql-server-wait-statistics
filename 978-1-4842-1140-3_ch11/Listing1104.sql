DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);

WAITFOR DELAY '00:00:30';

SELECT *
FROM sys.dm_os_wait_stats
WHERE wait_type = 'WAITFOR';