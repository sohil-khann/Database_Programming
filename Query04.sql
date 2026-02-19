--https://docs.google.com/document/d/1v2RM-0RdoKc78SzzKk0RJAQ_JW_pnrLW8ciV-wzEfzQ/edit?tab=t.3aave234vt2q#heading=h.bll7wmnspq3

--Design a secure banking database system capable of handling customer accounts and fund transfers safely.
create database BankDB;

use BankDB;

create table Customers( CustomerID INT primary key Identity(1,1),
FullName VARCHAR(100) NOT NULL,
MobileNumber VARCHAR(15) UNIQUE,
City VARCHAR(50));

select* from Customers;

create table Accounts(AccountID int primary key identity(1,1),
CustomerID int foreign key references Customers(CustomerID),
AccountNumber varchar(20) unique,
Balance decimal(12,2) default(0.00) check(Balance>=0),
AccountType varchar(20) not null );

create table Transactions( TransactionID INT primary key Identity(1,1),
FromAccount Varchar(30),
ToAccount varchar(30),
Amount DECIMAL(12,2),
TransactionDate DATETIME Default GETDATE());
--
--drop table Transactions
select* from Accounts;

--Insert minimum 5 records in each table.


insert into Customers(FullName,MobileNumber,City)values('Sohil khan','9876543210','Mathura');

insert into Customers(FullName,MobileNumber,City)values('Abhay','9876543211','Manipur');

insert into Customers(FullName,MobileNumber,City)values('Charan','9876543212','meruth');

insert into Customers(FullName,MobileNumber,City)values('Jaykant','9876543213','Mumbai');

insert into Customers(FullName,MobileNumber,City)values('Sohan','9876543214','Agra');

--Accounts

insert into Accounts(CustomerID,AccountNumber,Balance,AccountType)values(1,'ACC101',5555.00,'saving');
insert into Accounts(CustomerID,AccountNumber,Balance,AccountType)values(2,'ACC102',6555.00,'saving');
insert into Accounts(CustomerID,AccountNumber,Balance,AccountType)values(3,'ACC103',7555.00,'saving');
insert into Accounts(CustomerID,AccountNumber,Balance,AccountType)values(4,'ACC104',7555.00,'saving');
insert into Accounts(CustomerID,AccountNumber,Balance,AccountType)values(5,'ACC105',8555.00,'saving');


--Display customer and account details using JOIN.
select c.FullName,c.MobileNumber, c.City,a.AccountNumber,a.Balance,a.AccountType from Customers c full join Accounts a on a.AccountID=c.CustomerID;


--Using subquery, find customers with balance greater than average.
select FullName,MobileNumber, City from Customers where CustomerID in
(select  CustomerId from Accounts where Balance>(select avg(Balance) from Accounts));
go
--create procedure

create procedure spTransferMoney(
 @FromAccount varchar(30),
 @ToAccount varchar(30),
 @Amount decimal(12,2))
 
 As begin
	 -- Check if FromAccount has sufficient balance
	 if (select Balance from Accounts where AccountNumber = @FromAccount) >= @Amount
	 begin
		 -- Begin transaction
		 begin transaction
		 -- Deduct amount from FromAccount
		 update Accounts set Balance = Balance- @Amount where AccountNumber=@FromAccount;

		 --add amount to Toaccount
		 update Accounts Set Balance=Balance+@Amount where AccountNumber=@ToAccount;

		 -- Insert transaction record
		 insert into Transactions(FromAccount, ToAccount, Amount) values(@FromAccount,@ToAccount, @Amount);
		 
		 commit transaction

		 end
		 else
		 begin
			 print 'Insufficient balance in FromAccount'
			 rollback transaction
		 end

		 end

go
exec spTransferMoney @FromAccount='ACC101', @ToAccount='ACC102', @Amount=50.00;

select * from Accounts

select * from Transactions

drop procedure spTransferMoney;

go

--Create a trigger preventing balance below 1000.
create trigger trgLowBalance on Accounts 
after update 
as begin
 -- Check if any updated row in the "inserted" virtual table has a balance < 1000
    IF EXISTS (SELECT 1 FROM inserted WHERE Balance < 1000)
    BEGIN
        print ('Balance cannot be less than 1000');
        ROLLBACK TRANSACTION;
    end
	end;

go

update Accounts set Balance=900 where AccountNumber='ACC101';

drop trigger trgLowBalance;
go
	--Create a view summarizing account details.

	create view AccountSummery as  select a.AccountNumber, c.FullName, a.Balance, a.AccountType from Accounts a join Customers c on a.CustomerID=c.CustomerID;

	go
	select * from AccountSummery;

	drop view AccountSummery;


	go
--Use a cursor to add 5% annual interest.
Declare curAccount cursor for select AccountNumber, Balance from Accounts where AccountType='saving';
open curAccount;
declare @AccountNumber varchar(30);
declare @Balance decimal(12,2);
fetch next from curAccount into @AccountNumber, @Balance;
while @@fetch_status=0
begin
update Accounts set Balance=Balance+(@Balance*0.05) where AccountNumber=@AccountNumber;
fetch next from curAccount into @AccountNumber, @Balance;
end

close curAccount; 
deallocate curAccount;
--Create an index on AccountNumber.
go
  create nonclustered index idx_AccountNumber on Accounts(AccountNumber);

  --drop index idx_AccountNumber on Accounts;


--Use CTE to rank customers by balance.
go
WITH CTE_CustomerBalance as (
    SELECT c.FullName, a.Balance, RANK() OVER(ORDER BY a.Balance DESC) as BalanceRank
    FROM Customers c
    JOIN Accounts a ON c.CustomerID = a.CustomerID
)
SELECT * FROM CTE_CustomerBalance;

--select * from CTE_CustomerBalance;

