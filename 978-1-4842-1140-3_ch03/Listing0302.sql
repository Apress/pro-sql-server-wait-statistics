USE []BaseLine]
GO

CREATE TABLE WaitStats
  (
  ws_ID INT IDENTITY(1,1) PRIMARY KEY,
  ws_DateTime DATETIME,
  ws_Day INT,
  ws_Month INT,
  ws_Year INT,
  ws_Hour INT,
  ws_Minute INT,
  ws_DayOfWeek VARCHAR(15),
  ws_WaitType VARCHAR(50),
  ws_WaitTime INT,
  ws_WaitingTasks INT,
  ws_SignalWaitTime INT
  )