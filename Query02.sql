--Exec sp_help 'dbo.Employees';



--Exec sp_databases;
--select name from sys.databases;

create database store_db;
use store_db;

CREATE TABLE Customers ( 
    customer_id INT IDENTITY(100,1) PRIMARY KEY, 
    customer_name VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE 
);

INSERT INTO Customers (customer_name, email) 
VALUES 
('Raju', 'raju@example.com'), 
('Sham', 'sham@example.com'), 
('Baburao', 'baburao@example.com');

select * from Customers;

CREATE TABLE Orders ( 
    order_id INT IDENTITY(500,1) PRIMARY KEY, 
    order_date DATE NOT NULL, 
    total_amount DECIMAL(10, 2), 
    customer_id INT, 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) 
);

INSERT INTO Orders (order_date, total_amount, customer_id) 
VALUES 
('2025-09-15', 1500.00, 100), -- This links to Raju (customer_id 100) 
('2025-09-28', 800.00, 101), -- This links to Sham (customer_id 101) 
('2025-10-05', 2200.00, 100), -- This links to Raju (customer_id 100) 
('2025-10-12', 500.00, 102), -- This links to Baburao (customer_id 102) 
('2025-10-17', 1200.00, 101); -- New order for Sham (customer_id 101)


select * from Orders;

