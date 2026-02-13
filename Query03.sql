use ECommerceDB;

-- Create the ProductSales table
CREATE TABLE ProductSales
(
  ProductSalesID INT,
  OrderID INT,
  ProductID INT,
  QunatitSold INT
)
GO

-- Populate the ProductSakes table with some test data
INSERT INTO ProductSales VALUES(1, 1001, 501, 3)
INSERT INTO ProductSales VALUES(2, 1001, 502, 2)
INSERT INTO ProductSales VALUES(3, 1001, 503, 4)
INSERT INTO ProductSales VALUES(4, 1002, 501, 1)
INSERT INTO ProductSales VALUES(5, 1002, 502, 2)
INSERT INTO ProductSales VALUES(6, 1003, 503, 2)
INSERT INTO ProductSales VALUES(7, 1003, 501, 3)
INSERT INTO ProductSales VALUES(8, 1004, 502, 4)
INSERT INTO ProductSales VALUES(9, 1004, 503, 4)
INSERT INTO ProductSales VALUES(10, 1001, 501, 3)
INSERT INTO ProductSales VALUES(11, 1001, 502, 2)
INSERT INTO ProductSales VALUES(12, 1001, 503, 4)
INSERT INTO ProductSales VALUES(13, 1002, 501, 1)
INSERT INTO ProductSales VALUES(14, 1002, 502, 2)
INSERT INTO ProductSales VALUES(15, 1003, 503, 2)
INSERT INTO ProductSales VALUES(16, 1003, 501, 3)
INSERT INTO ProductSales VALUES(17, 1004, 502, 4)
INSERT INTO ProductSales VALUES(18, 1004, 503, 4)


SELECT PS.ProductID, 
  SUM(PS.QunatitSold) AS TotalQuantitySold
FROM  ProductSales AS PS  
GROUP  BY PS.ProductID

CREATE NONCLUSTERED INDEX IX_ProductSales_ProductID ON ProductSales(ProductID)

CREATE NONCLUSTERED INDEX IX_ProductSales_ProductID_QunatitSold ON ProductSales(ProductID, QunatitSold)

SELECT ProductID, QunatitSold FROM ProductSales

