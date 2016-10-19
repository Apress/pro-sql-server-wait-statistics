-- Step 1 Clear sys.dm_os_wait_stats
DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);

-- Step 2 Open a new Query Window inside
-- SQL Server Management Studio

-- Step 3 go back to this Query Window
-- and run the query below
SELECT * 
FROM sys.dm_os_wait_stats
WHERE wait_type = 'PREEMPTIVE_OS_AUTHENTICATIONOPS';
