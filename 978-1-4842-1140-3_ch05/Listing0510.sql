USE trans_demo
GO

DECLARE @i INT
SET @i = 1

WHILE @i < 100

  BEGIN

    INSERT INTO transactions
	  (t_guid)
    VALUES 
	  (newid())

  SET @i = @i + 1

  -- Force a checkpoint to occur within 1 second
  CHECKPOINT 1

END