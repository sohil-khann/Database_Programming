-- 1. Create the function first (as a standalone object)
CREATE FUNCTION dbo.MultiplyNumbers 
(
    @Number1 INT,
    @Number2 INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT;
    SELECT @Result = @Number1 * @Number2;
    RETURN @Result;
END;
GO

-- 2. Create the stored procedure that calls the function
CREATE PROCEDURE dbo.CalculateProduct
    @FirstNumber INT,
    @SecondNumber INT
AS
BEGIN
    -- Declare a local variable to store the function's result
    DECLARE @Product INT;
    
    -- Call the function and store the result in the variable
    SELECT @Product = dbo.MultiplyNumbers(@FirstNumber, @SecondNumber);
    
    -- Print the result
    PRINT 'The product is: ' + CAST(@Product AS VARCHAR(10));
END;
GO

-- 3. Execute the stored procedure
EXEC dbo.CalculateProduct @FirstNumber = 3, @SecondNumber = 4;
GO


--scaler functions are used to perform operations on individual values and return a single value as a result. In this example, the function dbo.MultiplyNumbers takes two integer parameters, multiplies them together, and returns the product as an integer. The stored procedure dbo.CalculateProduct calls this function with the provided parameters and prints the result.

CREATE FUNCTION SVF1(@X INT)
RETURNS INT
AS
BEGIN
  RETURN @X * @X *@X
END
SELECT dbo.SVF1(5)


-- Create Department Table
CREATE TABLE Department
(
  ID INT PRIMARY KEY,
  DepartmentName VARCHAR(50)
)
GO

-- Populate the Department Table with test data
INSERT INTO Department VALUES(1, 'IT')
INSERT INTO Department VALUES(2, 'HR')
INSERT INTO Department VALUES(3, 'Sales')
GO

--drop table Employees
-- Create Employee Table
CREATE TABLE Employees
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  DeptID INT FOREIGN KEY REFERENCES Department(ID)
)
GO

-- Populate the Employee Table with test data
INSERT INTO Employees VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
INSERT INTO Employees VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
INSERT INTO Employees VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
INSERT INTO Employees VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
INSERT INTO Employees VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
INSERT INTO Employees VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
GO


create Procedure spGetEmployeeName
As
Begin
  Select e.Name as EmployeeName from Employees e
  inner join Department d on e.DeptID = d.ID
  where d.DepartmentName = 'IT'
  End
  GO

  Execute spGetEmployeeName

  drop procedure spGetEmployeeName

