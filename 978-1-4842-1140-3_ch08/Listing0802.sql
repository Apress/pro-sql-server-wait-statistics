-- Create the table
CREATE TABLE Insert_Test2
  (
  ID UNIQUEIDENTIFIER,
  RandomData VARCHAR(50)
  );

-- Create a Non-Clustered Index on the ID column
CREATE NONCLUSTERED INDEX idx_ID
ON Insert_Test2 (ID);
GO