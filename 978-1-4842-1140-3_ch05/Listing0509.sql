DECLARE @ID VARCHAR(250) 
DECLARE @SQL VarChar(MAX)
SET @ID = FLOOR(RAND()*(20000-1)+1);
 
SET @SQL =
  '
  SELECT
    ' + @ID + ',
    SUM(soh.SubTotal),
    COUNT(soh.SubTotal)
  FROM sales.SalesOrderHeader soh
  INNER JOIN person.Person p
    ON soh.SalesPersonID = p.BusinessEntityID
  WHERE p.BusinessEntityID = ' + @ID + '
  '

EXEC (@SQL)
