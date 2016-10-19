INSERT INTO AO_Test
  (
  ID,
  RandomData
  )
VALUES
  (
  NEWID(),
  CONVERT(VARCHAR(50), NEWID())
  );
GO 10000