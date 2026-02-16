use EmployeeDB

--without partition by clause, row number will be generated for the entire result set.
SELECT Name, Department, Salary,
ROW_NUMBER() OVER (ORDER BY Department) AS RowNumber
FROM Employee

--with partition by clause, row number will be generated for each department.
SELECT Name, Department, Salary,
       ROW_NUMBER() OVER 
       (
            PARTITION BY Department
            ORDER BY Name
       ) AS RowNumber
FROM Employee

TRUNCATE TABLE Employee

exec sp_help 'Employee'

set insert_identity_insert Employee on 
-- Created by GitHub Copilot in SSMS - review carefully before executing
SET IDENTITY_INSERT dbo.Employee ON;

INSERT INTO dbo.Employee (ID, Name, EmailID, Gender, Department, Salary, Age, CITY) VALUES
(101, 'James', 'james@example.com', 'M', 'IT', 15000, 28, 'New York'),
(102, 'Rasol', 'rasol@example.com', 'M', 'HR', 15000, 32, 'Chicago'),
(103, 'Stokes', 'stokes@example.com', 'M', 'HR', 15000, 45, 'Chicago'),
(104, 'Aisha', 'aisha@example.com', 'F', 'Finance', 20000, 29, 'Dallas'),
(105, 'Miguel', 'miguel@example.com', 'M', 'IT', 18000, 35, 'New York'),
(106, 'James', 'james.duplicate@example.com', 'M', 'IT', 15000, 28, 'New York'),
(107, 'Rasol', 'rasol@example.com', 'M', 'HR', 15000, 32, 'Chicago'),
(108, 'Sara', 'sara@example.com', 'F', 'Marketing', 17000, 26, 'Boston'),
(109, 'Liu', 'liu@example.com', 'F', 'Marketing', 17000, 26, 'Boston'),
(110, 'Aisha', 'aisha@example.com', 'F', 'Finance', 20000, 29, 'Dallas');

SET IDENTITY_INSERT dbo.Employee off;

-- To delete duplicate records from the Employee table based on the ID column, you can use a Common Table Expression (CTE) with the ROW_NUMBER() function to identify duplicates and then delete them. Here's how you can do it:
WITH DeleteDuplicateCTE AS
(
     SELECT *, 
     ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID) AS RowNumber
     FROM Employee
)
DELETE FROM DeleteDuplicateCTE 
WHERE RowNumber > 1

select * from Employee

CREATE PROCEDURE spDisplayWelcome
AS
BEGIN
  PRINT 'WELCOME TO PROCEDURE in SQL Server'
END

EXECUTE spDisplayWelcome
--Or
EXEC spDisplayWelcome
--Or
spDisplayWelcome


CREATE PROCEDURE spGetEmployee
As
BEGIN
  SELECT Name,Gender  FROM Employee
END

-- How to change the body of a stored procedure
-- User Alter procedure to change the body
ALTER PROCEDURE spGetEmployee
AS
BEGIN
  SELECT Name, Gender
  FROM Employee 
  ORDER BY Name
END

-- To change the procedure name from spGetEmployee to spGetEmployee1
-- Use sp_rename system defined stored procedure
EXEC sp_rename 'spGetEmployee', 'spGetEmployee1'

 sp_helptext spGetEmployeeDetails



  Drop proc spGetEmployee1 

  --or
  Drop Procedure spGetEmployee1

