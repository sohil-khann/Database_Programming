---Cascading Referential Integrity Constraint

CREATE TABLE Gender 
( 
    Id     INT PRIMARY KEY, 
    Gender NVARCHAR(50) 
)

-- Insert some test data in Gender Table
Insert into Gender values (1, 'Male')
Insert into Gender values (2, 'Female')
Insert into Gender values (3, 'Unknown')

CREATE TABLE [Person](
  [Id] [int] PRIMARY KEY,
  [Name] [varchar](100) NOT NULL,
  [Email] [varchar](100) NOT NULL,
  [GenderID] [int] NULL
)

-- Add a foreign key reference using query
Alter table Person add constraint 
Person_GenderId_FK FOREIGN KEY (GenderId) references Gender(ID)


--Insert some test data in Person Table
Insert into Person values (1, 'abc','abc@gmail.com',1)
Insert into Person values (2, 'pqr','pqr@gmail.com',2)
Insert into Person values (3, 'xyz','xyz@gmail.com',3)

--Delete 
delete from Gender where Id=1;

drop table Person;


CREATE TABLE [Person](
  [Id] [int] PRIMARY KEY,
  [Name] [varchar](100) NOT NULL,
  [Email] [varchar](100) NOT NULL,
  [GenderID] [int] CONSTRAINT FK_Person_GenderID FOREIGN KEY REFERENCES dbo.Gender(Id) 
  
)

--Insert some test data in Person Table
Insert into Person values (1, 'abc','abc@gmail.com',1)
Insert into Person values (2, 'pqr','pqr@gmail.com',2)
Insert into Person values (3, 'xyz','xyz@gmail.com',3)

Insert into Person values (4, 'pranaya','pranaya@g.com',3); -- Not Allowed
select * from Person where GenderID=2;

DELETE FROM Gender WHERE Id = 2  -- Allowed

UPDATE Gender SET Id = 4 where Gender = 'Male';  -- Allowed



