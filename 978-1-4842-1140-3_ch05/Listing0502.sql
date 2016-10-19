DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);

CREATE DATABASE [IO_test]
ON  PRIMARY 
  ( 
  NAME = N'IO_test', FILENAME = N'E:\Data\IO_test.mdf' , SIZE = 512000KB , FILEGROWTH = 10% 
  )
LOG ON 
  ( 
  NAME = N'IO_test_log', FILENAME = N'E:\Log\IO_test_log.ldf' , SIZE = 102400KB , FILEGROWTH = 10%
  );
GO

SELECT *
FROM sys.dm_os_wait_stats
WHERE wait_type = 'ASYNC_IO_COMPLETION';