CREATE EVENT SESSION [WaitStats Query] ON SERVER 

ADD EVENT sqlos.wait_info
  (
  ACTION(sqlserver.sql_text)
  WHERE ([sqlserver].[session_id]=(53))
  ) 
ADD TARGET package0.event_file
  (
  SET filename = N'E:\Data\WaitStats_XE.xel', metadatafile = N'E:\Data\WaitStats_XE.xem'
  );
