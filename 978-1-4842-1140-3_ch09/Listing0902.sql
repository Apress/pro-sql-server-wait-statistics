DBCC SQLPERF('sys.dm_os_wait_stats, CLEAR')

INSERT INTO Mirror_Test
  (
  ID,
  RandomData
  )
VALUES
  (
  NEWID(),
  CONVERT(VARCHAR(50), NEWID())
  );
GO 10000