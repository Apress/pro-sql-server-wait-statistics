DECLARE @i INT
SET @i = 1

WHILE @i < 10000

  BEGIN

    INSERT INTO transactions
	  (t_guid)
    VALUES 
	  (newid())

  SET @i = @i + 1

END