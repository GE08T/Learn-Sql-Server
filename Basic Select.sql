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

SELECT 
	p.categoryid, p.productname,
	CASE	 
		WHEN p.categoryid = 1 THEN 'Beverages'
		WHEN p.categoryid = 2 THEN 'Condiments'
		WHEN p.categoryid = 3 THEN 'Confections'
		WHEN p.categoryid = 4 THEN 'Dairy Products'
		WHEN p.categoryid = 5 THEN 'Grains/Cereals'
		WHEN p.categoryid = 6 THEN 'Grains/Poultry'
		WHEN p.categoryid = 7 THEN 'Produce'
		WHEN p.categoryid = 8 THEN 'Seafood'
		ELSE 'Others'
	END AS Categoryname,
  CASE
		WHEN p.categoryid IN(1, 7, 8) THEN 'Campaign Products'
		ELSE 'Non-Campaign Products'
  END AS iscampaign
FROM Production.Products AS p;

-- this is basic where in sql it's like where in mysql
SELECT 
	e.firstname AS FIRST_NAME, e.lastname AS LAST_NAME, e.city AS CITY, e.country AS COUNTRY
FROM HR.Employees AS e
WHERE e.city = 'Seattle' AND e.country = 'USA';
