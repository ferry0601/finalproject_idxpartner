CREATE PROCEDURE summary_order_status
(
	 @StatusID int
)
AS
BEGIN
	SELECT 
		d.OrderID , a.FullName as CustomerName, b.ProductName, d.Quantity, c.StatusOrder 
	FROM
		FactSalesOrder d
	INNER JOIN DimCustomer a ON d.CustomerID = a.CustomerID
	INNER JOIN DimProduct b ON d.ProductID = b.ProductID
	INNER JOIN DimStatusOrder c ON d.StatusID = c.StatusID
	WHERE CONVERT(int, c.StatusID) = CONVERT(int, @StatusID);

END;


	
