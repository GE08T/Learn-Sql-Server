-- this is a conditional select 
USE [TSQL];
GO

-- Switch case in sql can be done like this
-- it's like creating another column with a condition from existing column
-- it can be more than one 
-- IN() is built in function that let you select multiple values at once
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