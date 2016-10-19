DBCC SQLPERF ('sys.dm_os_wait_stats', CLEAR);

SELECT *
FROM Person.Person;

SELECT *
FROM sys.dm_os_wait_stats
WHERE wait_type = 'ASYNC_NETWORK_IO';