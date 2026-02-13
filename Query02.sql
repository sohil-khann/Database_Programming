CREATE TABLE tblOrder
(
    Id INT,
    CustomerId INT,
    ProductId Varchar(100),
    ProductName VARCHAR(50)
)
GO

DECLARE @i int = 0
WHILE @i < 3000 
BEGIN
    SET @i = @i + 1
    IF(@i < 500)
    Begin
        INSERT INTO tblOrder VALUES (@i, 1, 'Product - 10120', 'Laptop')
    END
    ELSE IF(@i < 1000)
    Begin
        INSERT INTO tblOrder VALUES (@i, 3, 'Product - 1020', 'Mobile')
    End
    Else if(@i < 1500)
    Begin
        INSERT INTO tblOrder VALUES (@i, 2, 'Product - 101', 'Desktop')
    End
    Else if(@i < 2000)
    Begin
        INSERT INTO tblOrder VALUES (@i, 3, 'Product - 707', 'Pendrive')
    End
    Else if(@i < 2500)
    Begin
        INSERT INTO tblOrder VALUES (@i, 2, 'Product - 999', 'HD')
    End
    Else if(@i < 3000)
    Begin
        INSERT INTO tblOrder VALUES (@i, 1, 'Product - 100', 'Tablet')
    End
END

SELECT * FROM tblOrder WHERE ProductId = 'Product – 101';

--non clustered index
CREATE NONCLUSTERED INDEX IX_tblOrder_ProductId
ON dbo.tblOrder (ProductId)
INCLUDE ([Id],[CustomerId],[ProductName])
GO




SELECT * FROM tblOrder WHERE CustomerId = 3 and ProductName = 'Pendrive';


--composite non clustered index

CREATE NONCLUSTERED INDEX IX_tblOrder_CustomerId_ProductName 
ON tblOrder(CustomerId ASC, ProductName DESC)
INCLUDE ([Id],[ProductId]);

SELECT * FROM tblOrder WHERE CustomerId = 3 and ProductName = 'Pendrive';

