USE master
GO

-- Create demo database
CREATE DATABASE [trans_demo]
ON PRIMARY
  ( 
  NAME = N'trans_demo', FILENAME = N'D:\Data\trans_demo.mdf' , SIZE = 153600KB , FILEGROWTH = 10%
  )
LOG ON 
  ( 
  NAME = N'trans_demo_log', FILENAME = N'D:\Log\trans_demo.ldf' , SIZE = 51200KB , FILEGROWTH = 10%
  )
GO

-- Make sure recovery model is set to full
ALTER DATABASE [trans_demo] SET RECOVERY FULL 
GO

-- Create a simple test table
USE trans_demo
GO

CREATE TABLE transactions
  (
  t_guid VARCHAR(50)
  )
GO
