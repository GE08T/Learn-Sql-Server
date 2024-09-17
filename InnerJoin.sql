-- inner join is like show u the 2 of same record in to table
-- it doesn't see u non matching record 

-- this is when you want productname from procucts and categoryname from categories
-- with a join in category_id because they exist in the same table
SELECT
	p.productname, c.categoryname
FROM Production.Products AS p
INNER JOIN Production.Categories AS c ON p.categoryid = c.categoryid; 

-- this example for customer and orders you can also type it like this
-- not only you can type with aliases but also with table name
-- but remember when you type the name of table be carefull with the record that has the same in table  
SELECT
	Sales.Customers.custid, contactname, orderid
FROM Sales.Customers
INNER JOIN Sales.Orders ON Customers.custid = Orders.custid;
