USE [master]
GO

DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);

exec xp_getnetname;

SELECT * 
FROM sys.dm_os_wait_stats
WHERE wait_type = 'PREEMPTIVE_OS_GETPROCADDRESS';