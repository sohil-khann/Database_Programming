
CREATE TABLE Customer
(
    CustomerID INT PRIMARY KEY,
    CustomerCode VARCHAR(10),
    CustomerName VARCHAR(50)
)
--What happens when the inner transactions commit in SQL Server?
BEGIN TRANSACTION T1
      INSERT INTO Customer VALUES (10, 'Code_10', 'Ramesh')
      INSERT INTO Customer VALUES (11, 'Code_11', 'Suresh')

      BEGIN TRANSACTION T2
            INSERT INTO Customer VALUES (12, 'Code_12', 'Priyanka')
            INSERT INTO Customer VALUES (13, 'Code_13', 'Preety')   
            PRINT @@TRANCOUNT  -- Here TRANCOUNT value 2

      COMMIT TRANSACTION T2 -- This does not physically commit
      PRINT @@TRANCOUNT -- Here TRANCOUNT value 1

COMMIT TRANSACTION T1 -- This does a physically commit
PRINT @@TRANCOUNT -- Here TRANCOUNT value 0


--savepoints

BEGIN TRANSACTION 

 SAVE TRANSACTION SavePoint1
     INSERT INTO Customer VALUES (1, 'Code_1', 'Ramesh')
     INSERT INTO Customer VALUES (2, 'Code_2', 'Suresh')

 SAVE TRANSACTION SavePoint2
     INSERT INTO Customer VALUES (3, 'Code_3', 'Priyanka')
     INSERT INTO Customer VALUES (4, 'Code_4', 'Preety')

 SAVE TRANSACTION SavePoint3
     INSERT INTO Customer VALUES (5, 'Code_5', 'John')
     INSERT INTO Customer VALUES (6, 'Code_6', 'David')

select * from Customer

Rollback Transaction SavePoint2;

Commit Transaction;

--SavePoint with Nested Transaction in SQL Server:
truncate table Customer

BEGIN TRANSACTION T1
    SAVE TRANSACTION SavePoint1
         INSERT INTO Customer VALUES (10, 'Code_10', 'Ramesh')
         INSERT INTO Customer VALUES (11, 'Code_11', 'Suresh')
 
     BEGIN TRANSACTION T2
          SAVE TRANSACTION SavePoint2
               INSERT INTO Customer VALUES (12, 'Code_12', 'Priyanka')
               INSERT INTO Customer VALUES (13, 'Code_13', 'Preety')   

     COMMIT TRANSACTION T2 
     ROLLBACK TRANSACTION SavePoint2

COMMIT TRANSACTION T1 

---Example: Savepoints with the same savepoint name in SQL Server Transaction

BEGIN TRANSACTION 

 SAVE TRANSACTION SavePoint1
     INSERT INTO Customer VALUES (1, 'Code_1', 'Ramesh')
     INSERT INTO Customer VALUES (2, 'Code_2', 'Suresh')

 SAVE TRANSACTION SavePoint1
     INSERT INTO Customer VALUES (3, 'Code_3', 'Priyanka')
     INSERT INTO Customer VALUES (4, 'Code_4', 'Preety')

 SAVE TRANSACTION SavePoint3
     INSERT INTO Customer VALUES (5, 'Code_5', 'John')
     INSERT INTO Customer VALUES (6, 'Code_6', 'David')

     ROLLBACK TRANSACTION SavePoint1

COMMIT TRANSACTION 