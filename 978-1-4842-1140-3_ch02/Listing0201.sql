SELECT 
  r.session_id AS 'Session ID',
  r.start_time AS 'Request Start',
  r.[status] AS 'Current State',
  r.[command] AS 'Request Command',
  t.[text] AS 'Query',
  p.query_plan AS 'Execution Plan'
FROM sys.dm_exec_requests r
OUTER APPLY sys.dm_exec_sql_text(r.sql_handle) AS t
OUTER APPLY sys.dm_exec_query_plan(r.plan_handle) p
WHERE r.session_id > 50 AND r.session_id <> @@SPID