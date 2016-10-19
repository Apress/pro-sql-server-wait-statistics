-- Create Baseline database
CREATE DATABASE [Baseline]
  ON  PRIMARY 
    ( 
    NAME = N'Baseline', FILENAME = N'E:\Data\baseline_data.mdf' , SIZE = 1536000KB , FILEGROWTH = 10%
    )
 LOG ON 
    ( 
	NAME = N'Baseline_log', FILENAME = N'E:\Log\baseline_log.ldf' , SIZE = 102400KB , FILEGROWTH = 10%
	)
GO

ALTER DATABASE [Baseline] SET RECOVERY SIMPLE 
GO