select 'Hello' union select 'Hello' union select 'Helloworld' 
select * from Product;

alter table Product add  Availability binary null

alter table Product drop column Availability

select * from Product order by Price desc offset 1 rows fetch next 1 rows only

SELECT MAX(Price) AS SecondHighestPrice
FROM Product
WHERE Price < (SELECT MAX(Price) FROM Product);

SELECT TOP 1 *
FROM Product
WHERE Price < (SELECT MAX(Price) FROM Product)
ORDER BY Price DESC;

