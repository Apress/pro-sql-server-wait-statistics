SELECT 
  r.session_id AS 'Session ID',
  r.command AS 'Type of Request',
  qt.[text] AS 'Query Text',
  t.task_address AS 'Task Address',
  t.task_state AS 'Task State',
  w.worker_address AS 'Worker Address',
  w.[state] AS 'Worker State',
  s.scheduler_address AS 'Scheduler Address',
  s.[status] AS 'Scheduler State'
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) qt
INNER JOIN sys.dm_os_tasks t
ON r.task_address = t.task_address
INNER JOIN sys.dm_os_workers w
ON t.worker_address = w.worker_address
INNER JOIN sys.dm_os_schedulers s
ON w.scheduler_address = s.scheduler_address
WHERE r.session_id = 53