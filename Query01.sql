--Create Product table
CREATE TABLE Product
(
 ProductID INT PRIMARY KEY, 
 Name VARCHAR(40), 
 Price INT,
 Quantity INT
 )
 GO

 -- Populate Product Table with test data
 INSERT INTO Product VALUES(101, 'Product-1', 100, 10)
 INSERT INTO Product VALUES(102, 'Product-2', 200, 15)
 INSERT INTO Product VALUES(103, 'Product-3', 300, 20)
 INSERT INTO Product VALUES(104, 'Product-4', 400, 25)

exec sp_help 'Product'


--Example of COMMIT transaction in SQL Server with DML statements
Begin transaction
-- Insert a new product
insert into Product values(105, 'Product-5', 500, 30)
update Product set Price = 250 where ProductID = 103
delete from Product where ProductID = 105
select * from Product
commit transaction

--Understanding @@Error Global variable in SQL Server:

BEGIN TRANSACTION
INSERT INTO Product VALUES(110,'Product-10',600, 30)
--INSERT INTO Product VALUES(110,'Product-10',600, 30)

IF(@@ERROR > 0)
BEGIN
    Rollback Transaction
END
ELSE
BEGIN
   Commit Transaction
END

--explicit transaction 
CREATE PROC SPAddCustommer
AS
BEGIN
   BEGIN TRANSACTION
      INSERT INTO Customer VALUES(3, 'CODE_3', 'Pam')
      INSERT INTO Customer VALUES(4, 'CODE_4', 'Sara')
      IF(@@ERROR > 0)
      BEGIN
         ROLLBACK TRANSACTION
      END
      ELSE
      BEGIN
         COMMIT TRANSACTION
      END  
END


