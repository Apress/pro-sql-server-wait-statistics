-- Create a table in the AdventureWorks database
USE [AdventureWorks]
GO

CREATE TABLE check_test
  (
  ID UNIQUEIDENTIFIER,
  RandomData VARCHAR(50)
  );
GO

-- Clear sys.dm_os_wait_stats
DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);

-- Insert a few rows into our table
INSERT INTO check_test
  (
  ID,
  RandomData
  )
VALUES
  (
  NEWID(),
  CONVERT(varchar(50), NEWID())
  );
GO 100

CHECKPOINT 1;

-- Query Wait Statistics
SELECT *
FROM sys.dm_os_wait_stats
WHERE wait_type = 'CHECKPOINT_QUEUE';

SELECT *
FROM sys.dm_os_waiting_tasks
WHERE wait_type = 'CHECKPOINT_QUEUE';