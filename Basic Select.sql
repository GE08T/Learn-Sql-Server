-- this is a basic select 
-- it does same as mysql
USE [TSQL];
GO

SELECT * FROM Sales.Customers;

-- it is give the [] when you copy that line of code
SELECT * FROM [Sales].[Customers];

-- you can select a column that you want in a table like this
SELECT 
	contactname,
	postalcode,
	city,
	region,
	country
FROM Sales.Customers;

-- distinct to remove duplicate value of column
SELECT DISTINCT 
	country
FROM Sales.Customers;

-- aliases can used to rename the column and to simplify to call the column
SELECT 
	c.contactname AS Name, c.contacttitle AS Tittle, c.companyname AS [Company Name]
FROM Sales.Customers AS c;

