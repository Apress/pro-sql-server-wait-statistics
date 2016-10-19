-- Create database
-- Make sure to change the file locations if needed
USE [master]
GO

CREATE DATABASE [OLTP_Test] CONTAINMENT = NONE
ON PRIMARY 
	( 
	NAME = N'OLTP_Test', FILENAME = N'E:\Data\OLTP_Test_Data.mdf' , SIZE = 51200KB , FILEGROWTH = 10%
	)
LOG ON 
	( 
	NAME = N'OLTP_Test_log', FILENAME = N'E:\Log\OLTP_Test_Log.ldf' , SIZE = 10240KB , FILEGROWTH = 10%
	);
GO

-- Add the Memory-Optimized Filegroup
ALTER DATABASE OLTP_Test ADD FILEGROUP OLTP_MO CONTAINS MEMORY_OPTIMIZED_DATA;
GO

-- Add a file to the newly created Filegroup.
-- Change drive/folder location if needed.
ALTER DATABASE OLTP_Test ADD FILE (name='OLTP_mo_01', filename='E:\data\OLTP_Test_mo_01.ndf') TO FILEGROUP OLTP_MO;
GO

-- Create our test table
USE [OLTP_Test]
GO

CREATE TABLE OLTP
	(
	ID INT IDENTITY (1,1) PRIMARY KEY NONCLUSTERED,
	RandomData1 VARCHAR(50),
	RandomData2 VARCHAR(50),
	ID2 UNIQUEIDENTIFIER
	)
WITH (MEMORY_OPTIMIZED=ON);
GO 
