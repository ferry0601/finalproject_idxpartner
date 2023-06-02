DROP TABLE IF EXISTS DimCustomer
CREATE TABLE DimCustomer (
	CustomerID int NOT NULL PRIMARY KEY,
	FullName varchar(50) NOT NULL,
	Age int NOT NULL,
	Gender varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	NoHp varchar(50) NOT NULL
)

DROP TABLE  IF EXISTS DimProduct
CREATE TABLE DimProduct (
	ProductID int NOT NULL PRIMARY KEY,
	ProductName varchar(50) NOT NULL,
	ProductCategory varchar(50) NOT NULL,
	ProductUnitPrice int
)

DROP TABLE IF EXISTS  DimStatusOrder
CREATE TABLE DimStatusOrder (
	StatusID int NOT NULL PRIMARY KEY,
	StatusOrder varchar(50) NOT NULL,
	StatusOrderDesc varchar(50) NOT NULL
)

DROP TABLE IF EXISTS FactSalesOrder
CREATE TABLE FactSalesOrder (
	OrderID int NOT NULL PRIMARY KEY,
	CustomerID int NOT NULL FOREIGN KEY REFERENCES DimCustomer(CustomerID),
	ProductID int NOT NULL FOREIGN KEY REFERENCES DimProduct(ProductID),
	Quantity int NOT NULL,
	Amount int NOT NULL,
	StatusID int NOT NULL FOREIGN KEY REFERENCES DimStatusOrder(StatusID),
	OrderDate date NOT NULL
);