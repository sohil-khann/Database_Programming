--Create database EmployeeDB
Create database EmployeeDB
Go

Use EmployeeDB
Go

--Create Employee table
CREATE TABLE Employee
(
  ID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(100),
  EmailID VARCHAR(100),
  Gender VARCHAR(100),
  Department VARCHAR(100),
  Salary INT,
  Age INT,
  CITY VARCHAR(100)
)
GO

--Insert some data into Employee table
INSERT INTO Employee VALUES('Pranaya','Pranaya@g.com','Male', 'IT', 25000, 30,'Mumbai')
INSERT INTO Employee VALUES('Tarun','Tarun@g.com','Male', 'Payroll', 30000, 27,'Odisha')
INSERT INTO Employee VALUES('Priyanka','Priyanka@g.com','Female', 'IT', 27000, 25,'Bangalore')
INSERT INTO Employee VALUES('Preety','Preety@g.com','Female', 'HR', 35000, 26,'Bangalore')
INSERT INTO Employee VALUES('Ramesh','Ramesh@g.com','Male','IT', 26000, 27,'Mumbai')
INSERT INTO Employee VALUES('Pramod','Pramod@g.com','Male','HR', 29000, 28,'Odisha')
INSERT INTO Employee VALUES('Anurag','Anurag@g.com','Male', 'Payroll', 27000, 26,'Odisha')
INSERT INTO Employee VALUES('Hina','Hina@g.com','Female','HR', 26000, 30,'Mumbai')
INSERT INTO Employee VALUES('Sambit','Sambit@g.com','Male','Payroll', 30000, 25,'Odisha')
INSERT INTO Employee VALUES('Manoj','Manoj@g.com','Male','HR', 30000, 28,'Odisha')
INSERT INTO Employee VALUES('Sara',' Sara@g.com','Female', 'Payroll', 28000, 27,'Mumbai')
INSERT INTO Employee VALUES('Lima','Lima@g.com','Female','HR', 30000, 30,'Bangalore')
INSERT INTO Employee VALUES('Dipak','Dipak@g.com','Male','Payroll', 32000, 25,'Bangalore')
GO

--local variable
DECLARE @TotalSalary DECIMAL(10,2);

SELECT @TotalSalary = SUM(Salary)
FROM Employee;

IF @TotalSalary > 100000
    PRINT 'High Sales Day';
select @TotalSalary as TotalSalary;


DECLARE @MyVariable INT
SET @MyVariable = 10
SET @MyVariable = @MyVariable * 5
SELECT @MyVariable AS MyResult
GO 



SELECT 100 + 200 
SELECT 45 - 74 
SELECT 25 * 4 
SELECT 36 / 6 

SELECT 17 % 4 

SELECT ID, Name, Department, Salary,  
       Salary * 0.11 / 2.54 + 27.36 AS CalulatedSalary
FROM   Employee

SELECT GETDATE() + 1-- Gives Current date + 1 day
SELECT GETDATE() -1 

SELECT * FROM Employee WHERE CITY <> 'Mumbai'
SELECT * FROM Employee WHERE CITY != 'Mumbai'



