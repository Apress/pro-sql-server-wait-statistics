USE [OLTP_Test];
GO

-- Clear sys.dm_os_wait_stats
DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);

-- Insert some rows
INSERT INTO OLTP
	(
	RandomData1,
	RandomData2,
	ID2
	)
VALUES
  	(
  	CONVERT(VARCHAR(50), NEWID()),
  	CONVERT(VARCHAR(50), NEWID()),
  	NEWID()
  	);
GO 1000

-- Perform a CHECKPOINT
CHECKPOINT

-- Query sys.dm_os_wait_stats for WAIT_XTP_CKPT_CLOSE waits
SELECT * 
FROM sys.dm_os_wait_stats
WHERE wait_type = 'WAIT_XTP_CKPT_CLOSE';