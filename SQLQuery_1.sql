SELECT TerritoryDescription FROM Territories WHERE TerritoryDescription LIKE '%Santa%'
SELECT TerritoryDescription FROM Territories WHERE TerritoryDescription LIKE 'C%'
SELECT TerritoryDescription FROM Territories WHERE TerritoryDescription LIKE '%boro%'
SELECT ContactName, ContactTitle FROM Customers WHERE ContactTitle LIKE '%Owner%'
SELECT CompanyName, HomePage FROM Suppliers WHERE HomePage IS NOT NULL
SELECT CompanyName, HomePage FROM Suppliers WHERE HomePage IS NULL
SELECT ProductName, CAST(UnitPrice AS DECIMAL(10,2)) AS UnitPrice FROM Products WHERE UnitPrice >= 50
SELECT ProductName, CAST(UnitPrice AS DECIMAL(10,2)) AS UnitPrice FROM Products WHERE UnitPrice < 10
SELECT ProductName, CAST(UnitPrice AS DECIMAL(10,2)) AS UnitPrice FROM Products WHERE UnitPrice <= 10
SELECT ProductName, CAST(UnitPrice AS DECIMAL(10,2)) AS UnitPrice FROM Products WHERE UnitPrice >= 15 AND UnitPrice <= 20
SELECT ProductName, UnitsOnOrder FROM Products WHERE UnitsOnOrder > 0
SELECT FirstName, LastName, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age FROM Employees
SELECT FirstName, LastName, DATEDIFF(YEAR, HireDate, GETDATE()) AS 'Years with NorthWind' FROM Employees
SELECT CAST(SUM(Freight) AS DECIMAL(10,2)) AS FreightTotal FROM Orders
SELECT CAST(SUM(Freight) AS DECIMAL(10,2)) AS FreightTotal FROM Orders GROUP BY Year(OrderDate) HAVING Year(OrderDate) = 1996
SELECT CAST(SUM(Freight) AS DECIMAL(10,2)) AS FreightTotal FROM Orders GROUP BY Year(OrderDate) HAVING Year(OrderDate) = 1997
SELECT CAST(SUM(Freight) AS DECIMAL(10,2)) AS FreightTotal FROM Orders GROUP BY Year(OrderDate) HAVING Year(OrderDate) = 1998
SELECT OrderID, ShipCountry FROM Orders WHERE ShipCountry IN ('Switzerland', 'Venezuela', 'Austria')
SELECT DISTINCT(ShipCity) AS ShipCity FROM Orders WHERE ShipCountry IN ('Belgium', 'Mexico', 'Sweden')
SELECT CategoryName, ProductName FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID WHERE CategoryName IN ('Dairy Products', 'Seafood', 'Beverages')