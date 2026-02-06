---create database PracticeDB;

--use PracticeDB;
--drop table if exists dbo.Employees;
create table dbo.Employees
(
	EmployeeID int identity(1,1) primary key,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Email nvarchar(100) not null unique,
	HireDate date not null
);

insert into dbo.Employees (FirstName, LastName, Email, HireDate) values

('Jane', 'Smith', 'jane@mail.com','2019-03-22');	

select * from dbo.Employees where EmployeeID=1;
select * from dbo.Employees;
