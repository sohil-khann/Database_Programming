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

