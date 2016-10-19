BEGIN TRAN

UPDATE Sales.SalesOrderDetail
SET CarrierTrackingNumber = '4E0A-4F89-AD'
WHERE SalesOrderID = '43661';
