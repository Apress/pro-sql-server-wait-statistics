-- Check if temp table is present
-- Drop if exist
IF OBJECT_ID('tempdb..#XE_Data') IS NOT NULL
DROP TABLE #XE_Data

-- Create temp table to hold raw XE data
CREATE TABLE #XE_Data 
  (
  XE_Data XML
  );
GO

-- Write contents of the XE file
-- into our table
INSERT INTO #XE_Data 
  (
  XE_Data
  )
SELECT
  CAST (event_data AS XML)
FROM sys.fn_xe_file_target_read_file 
  (
  'E:\Data\WaitStats_XE_0_130702270937280000.xel',
  'E:\Data\WaitStats_XE_0_130702270940210000.xem', 
  null, 
  null
  );
GO

-- Query information from our temp table
SELECT
  XE_Data.value ('(/event/@timestamp)[1]', 'DATETIME') AS 'Date/Time',
  XE_Data.value ('(/event/data[@name=''opcode'']/text)[1]', 'VARCHAR(100)') AS 'Operation',
  XE_Data.value ('(/event/data[@name=''wait_type'']/text)[1]', 'VARCHAR(100)') AS 'Wait Type',
  XE_Data.value ('(/event/data[@name=''duration'']/value)[1]', 'BIGINT') AS 'Wait Time',
  XE_Data.value ('(/event/data[@name=''signal_duration'']/value)[1]', 'BIGINT') AS 'Signal Wait Time',
  XE_Data.value ('(/event/action[@name=''sql_text'']/value)[1]', 'VARCHAR(100)') AS 'Query'
FROM #XE_Data
ORDER BY 'Date/Time' ASC
;