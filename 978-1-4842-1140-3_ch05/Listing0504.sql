SELECT
  objtype,
  COUNT_BIG (*) AS 'Total Plans',
  SUM(CAST(size_in_bytes AS DECIMAL(12,2)))/1024/1024 AS 'Size (MB)'
FROM sys.dm_exec_cached_plans
GROUP BY objtype;