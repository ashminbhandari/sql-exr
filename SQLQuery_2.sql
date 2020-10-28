SELECT CustomerID, ContactName, Phone, Fax, Country, Region FROM Customers WHERE Country IN ('USA', 'UK')
SELECT CustomerID, ContactName, Country, Region FROM Customers WHERE Country = 'USA' OR Region = 'SP'
SELECT CustomerID, OrderID FROM Orders WHERE YEAR(OrderDate) = 1997 AND Month(OrderDate) >= 7 AND Month(OrderDate) <= 9 
SELECT * FROM Customers WHERE CompanyName LIKE '[abcdefg]%[ne]'
SELECT * FROM Customers WHERE CompanyName LIKE '_[^aeiou]%'
SELECT * FROM Customers WHERE Address LIKE '%P.O. Box%'
SELECT Country, COUNT(Country) AS CountryCount FROM Customers GROUP BY Country 
SELECT Country, Region, COUNT(*) AS CountryAndRegionCount FROM Customers GROUP BY Country, Region HAVING Region IS NOT NULL
SELECT Country, Region, City, COUNT(*) AS CountryRegionCityCount FROM Customers GROUP BY Country, Region, City HAVING Region IS NOT NULL
SELECT ContactTitle, COUNT(ContactTitle) AS ContactTitleCount FROM Customers Group BY ContactTitle
SELECT Orders.CustomerID, Customers.ContactName, COUNT(*) AS OrdersMade FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID GROUP BY Orders.CustomerID, Customers.ContactName
SELECT TOP 10 CustomerID, COUNT(CustomerID) AS OrdersMade FROM Orders GROUP BY CustomerID ORDER BY OrdersMade DESC 
SELECT CustomerID, COUNT(CustomerID) AS OrdersMade FROM Orders GROUP BY CustomerID HAVING COUNT(CustomerID) >= 5 
SELECT YEAR(OrderDate) AS Year, COUNT(CustomerID) AS OrdersCount FROM Orders GROUP BY YEAR(OrderDate) 
SELECT YEAR(OrderDate) AS Year, DATEPART(QQ, OrderDate) AS Quarter, COUNT(CustomerID) AS OrderCount FROM Orders GROUP BY DATEPART(QQ, OrderDate), YEAR(OrderDate) ORDER BY Year ASC
SELECT YEAR(OrderDate) AS Year, DATEPART(MM, OrderDate) AS Month, COUNT(CustomerID) AS OrderCount FROM Orders GROUP BY DATEPART(MM, OrderDate), YEAR(OrderDate) ORDER BY Year ASC
SELECT AVG(Freight) AS Average, SUM(Freight) AS Total, MIN(Freight) AS Minimum, MAX(Freight) AS Maximum FROM Orders GROUP BY OrderID
SELECT CustomerID, AVG(Freight) AS Average, SUM(Freight) AS Total, MIN(Freight) AS Minimum, MAX(Freight) AS Maximum FROM Orders GROUP BY CustomerID
SELECT ShipCountry, AVG(Freight) AS Average, SUM(Freight) AS Total, MIN(Freight) AS Minimum, MAX(Freight) AS Maximum FROM Orders GROUP BY ShipCountry
SELECT ShipVia, AVG(Freight) AS Average, SUM(Freight) AS Total, MIN(Freight) AS Minimum, MAX(Freight) AS Maximum FROM Orders GROUP BY ShipVia
SELECT OrderID, ProductID, (UnitPrice * Quantity - UnitPrice * Quantity * Discount) AS [Total Sale] FROM [Order Details]
SELECT OrderID, COUNT(DISTINCT(ProductID)) AS "Types of products ordered" FROM [Order Details] GROUP BY OrderID
SELECT OrderID, SUM((UnitPrice * Quantity - UnitPrice * Quantity * Discount)) AS TotalSale FROM [Order Details] GROUP BY OrderID
SELECT ProductID, SUM(Quantity) AS "Total Quantity Ordered" FROM [Order Details] GROUP BY ProductID 
SELECT Top 10 Quantity, OrderID, ProductID FROM [Order Details] 
SELECT Orders.CustomerID, Customers.ContactName, COUNT(Orders.OrderID) AS 'Total Orders' FROM Orders INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID WHERE Customers.Region = 'SP' AND Year(Orders.OrderDate) = 1997 GROUP BY Orders.CustomerID, Customers.ContactName ORDER BY Customers.ContactName
SELECT Customers.ContactName, COUNT(Orders.CustomerID) AS 'Orders Made' FROM Orders INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID WHERE Customers.Region = 'SP' AND Year(Orders.OrderDate) = 1998 GROUP BY Orders.CustomerID, Customers.ContactName HAVING COUNT(Orders.CustomerID) >= 7