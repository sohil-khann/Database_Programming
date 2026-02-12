-- Create a database
CREATE DATABASE EmployeeDB
GO

Use EmployeeDB
GO

--Create PermanentEmployee Table
CREATE TABLE PermanentEmployee
(
  EmployeeId INT,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  Department varchar(50),
  Age INT
)
GO

--Insert Rows into PermanentEmployee Table
INSERT INTO PermanentEmployee VALUES (1,'Pranaya','Male','IT',20)
INSERT INTO PermanentEmployee VALUES (2,'Priyanka','Female','IT',22)
INSERT INTO PermanentEmployee VALUES (3,'Sudhanshu','Male','HR',25)
INSERT INTO PermanentEmployee VALUES (4,'Subrat','Male','Sales',60)
INSERT INTO PermanentEmployee VALUES (5,'Tarun','Male','Sales',54)
INSERT INTO PermanentEmployee VALUES (6,'Lipika','Female','HR',27)
INSERT INTO PermanentEmployee VALUES (7,'Smita','Female','IT',40)
INSERT INTO PermanentEmployee VALUES (8,'Smith','Male','HR',29)
GO


-- Create ContractEmployee Table
CREATE TABLE ContractEmployee
(
  EmployeeId INT,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  Department varchar(50),
  Age INT
)
GO

--Insert rows into ContractEmployee Table
INSERT INTO ContractEmployee VALUES (9,'Anurag','Male','IT',33)
INSERT INTO ContractEmployee VALUES (10,'Sara','Female','IT',15)
INSERT INTO ContractEmployee VALUES (11,'Sambit','Male','HR',29)
INSERT INTO ContractEmployee VALUES (12,'James','Male','Sales',37)
INSERT INTO ContractEmployee VALUES (13,'Pam','Female','Sales',25)
GO

SELECT * FROM PermanentEmployee WHERE Age > (SELECT MAX(AGE) FROM ContractEmployee)

SELECT * FROM PermanentEmployee WHERE Age > ALL (SELECT AGE FROM ContractEmployee)

SELECT * FROM PermanentEmployee WHERE Age > ANY (SELECT MIN(Age) FROM ContractEmployee)

SELECT * FROM PermanentEmployee WHERE Age > ANY (SELECT Age FROM ContractEmployee)