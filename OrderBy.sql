exec sp_help 'dbo.Employee';

drop table if exists dbo.Employee;

use PracticeDB;

-- Create Person table
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

--Insert some test data into Person table
INSERT INTO Employee VALUES('PRANAYA','PRANAYA@G.COM','Male', 'IT', 25000, 30,'MUMBAI')
INSERT INTO Employee VALUES('TARUN','TARUN@G.COM','Male', 'Payroll', 30000, 27,'ODISHA')
INSERT INTO Employee VALUES('PRIYANKA','PRIYANKA@G.COM','Female', 'IT', 27000, 25,'BANGALORE')
INSERT INTO Employee VALUES('PREETY','PREETY@G.COM','Female', 'HR', 35000, 26,'BANGALORE')
INSERT INTO Employee VALUES('RAMESH','RAMESH@G.COM','Male','IT', 26000, 27,'MUMBAI')
INSERT INTO Employee VALUES('PRAMOD','PRAMOD@G.COM','Male','HR', 29000, 28,'ODISHA')
INSERT INTO Employee VALUES('ANURAG','ANURAG@G.COM','Male', 'Payroll', 27000, 26,'ODISHA')
INSERT INTO Employee VALUES('HINA','HINA@G.COM','Female','HR', 26000, 30,'MUMBAI')
INSERT INTO Employee VALUES('SAMBIT','HINA@G.COM','Male','Payroll', 30000, 25,'ODISHA')
GO

select * from Employee order by Name;

select * from Employee order by Name desc;

SELECT * FROM Employee WHERE Gender = 'Male' ORDER BY Name DESC;

SELECT Name, EmailID, Salary FROM Employee WHERE Salary > 26000 ORDER BY 1 DESC;

SELECT Name, EmailID, Salary FROM Employee WHERE Salary > 26000 ORDER BY Name DESC;


SELECT Name, Gender, EmailID, Salary
FROM Employee
WHERE Salary > 25000
ORDER BY Gender DESC, Name ASC;


SELECT Name, Gender, EmailID, Salary
FROM Employee
WHERE Salary > 25000
ORDER BY 2 DESC, 1 ASC;

--Understanding the OFFSET and FETCH options used in the Order By Clause in SQL Server:

SELECT * FROM Employee ORDER by Name ASC OFFSET 5 ROWS

SELECT * FROM Employee ORDER by Name ASC OFFSET 5 ROWS Fetch next 3 rows only;
SELECT * FROM Employee ORDER by Name ASC OFFSET 0 ROWS fetch next 5 rows only;

--find top 3 highest paid employees

select Name, Salary from Employee order by Salary desc OFFSET 0 ROWS fetch next 3 rows only;

--Using TOP n Clause in SQL Server with Examples


SELECT TOP(3)
ID, Name, EmailID, Gender, CITY, Department
FROM Employee
WHERE Gender = 'Male'
ORDER BY ID;

--Using TOP PERCENT keyword in SQL Server:
SELECT TOP (70) PERCENT
ID, Name, EmailID, Gender, CITY, Department
FROM Employee
WHERE Gender = 'Male'
ORDER BY ID;

--Using TOP with TIES in SQL Server:
drop table if exists dbo.Person;

CREATE TABLE Person
(
  ID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(50),
  Salary int
)
GO

INSERT INTO Person VALUES('PRANAYA', 20000)
INSERT INTO Person VALUES('KUMAR', 30000)
INSERT INTO Person VALUES('ROUT', 25000)
INSERT INTO Person VALUES('PRANAYA', 25000)
INSERT INTO Person VALUES('KUMAR', 30000)
INSERT INTO Person VALUES('ROUT', 25000)
INSERT INTO Person VALUES('PRIYANKA', 20000)
INSERT INTO Person VALUES('PREETY', 30000)
GO

SELECT TOP (3) Name FROM Person
ORDER BY Name

SELECT TOP (3) WITH TIES Name FROM Person ORDER BY Name ASC

SELECT TOP (30) PERCENT Name FROM Person ORDER BY Name ASC

SELECT TOP (30) PERCENT WITH TIES Name FROM Person ORDER BY Name ASC

SELECT COUNT(*) AS TotalEmployee FROM Employee

SELECT Department, COUNT(*) AS TotalEmployee
FROM Employee 
GROUP BY Department


--Write a query to get the number of employees working in each Gender per department.
SELECT Department, Gender, EmployeeCount = COUNT(*) 
FROM Employee 
GROUP BY Department, Gender 
ORDER BY Department

SELECT Department, MIN(Salary) AS 'Lowest salary'
FROM Employee
GROUP BY Department
HAVING MIN(Salary) > 25000;

SELECT City, COUNT(*) AS 'Number of employees'
FROM Employee
GROUP BY City
HAVING COUNT(*) > 2;

SELECT Department, SUM(Salary) AS Total_Salary
FROM Employee
GROUP BY Department
HAVING SUM(Salary) > 14000;



Create table Sales
(
    Product nvarchar(50),
    SaleAmount int
)
Go

Insert into Sales values ('iPhone', 500)
Insert into Sales values ('Laptop', 800)
Insert into Sales values ('iPhone', 1000)
Insert into Sales values ('Speakers', 400)
Insert into Sales values ('Laptop', 600)
Go

SELECT Product, SUM(SaleAmount) AS TotalSales
FROM Sales
WHERE Product in ('iPhone', 'Speakers')
GROUP BY Product

SELECT Product, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY Product
HAVING Product in ('iPhone', 'Speakers')

-- After connecting, verify connection
SELECT @@SERVERNAME AS ServerName;
SELECT @@VERSION AS SQLServerVersion;
SELECT SUSER_SNAME() AS CurrentUser;
SELECT DB_NAME() AS CurrentDatabase;

-- Verify database creation
SELECT name, database_id, create_date 
FROM sys.databases 
WHERE name IN ('PracticeDB', 'store_db');