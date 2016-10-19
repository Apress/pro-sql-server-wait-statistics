SELECT TOP 10 
  QText.TEXT AS 'Query',
  QStats.execution_count AS 'Nr of Executions',
  QStats.total_worker_time/1000 AS 'Total CPU Time (ms)',
  QStats.last_worker_time/1000 AS 'Last CPU Time (ms)',
  QStats.last_execution_time AS 'Last Execution',
  QPlan.query_plan AS 'Query Plan'
FROM sys.dm_exec_query_stats QStats
CROSS APPLY sys.dm_exec_sql_text(QStats.sql_handle) QText
CROSS APPLY sys.dm_exec_query_plan(QStats.plan_handle) QPlan
ORDER BY QStats.total_worker_time DESC;