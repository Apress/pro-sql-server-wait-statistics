CHECKPOINT 1;
GO

DBCC DROPCLEANBUFFERS;
GO

DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);
GO

SELECT
  SOD.SalesOrderID,
  SOD.CarrierTrackingNumber,
  SOH.CustomerID,
  C.AccountNumber,
  SOH.OrderDate,
  SOH.DueDate
FROM Sales.SalesOrderDetail SOD
INNER JOIN Sales.SalesOrderHeader SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Sales.Customer C
ON SOH.CustomerID = C.CustomerID
WHERE SOD.CarrierTrackingNumber BETWEEN 'F467-41BF-8B' AND 'F4E4-4739-B4'
;

SELECT *
FROM sys.dm_os_wait_stats
WHERE wait_type LIKE 'PAGEIOLATCH_%';
