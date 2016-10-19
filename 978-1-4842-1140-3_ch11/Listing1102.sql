DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);

EXEC master..xp_dirtree 'c:\windows';

SELECT * 
FROM sys.dm_os_wait_stats
WHERE wait_type = 'MSQL_XP';