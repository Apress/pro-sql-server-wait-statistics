SELECT
  SalesOrderID,
  SalesOrderDetailID,
  ProductID,
  CarrierTrackingNumber
FROM 
Sales.SalesOrderDetail
ORDER BY CarrierTrackingNumber ASC