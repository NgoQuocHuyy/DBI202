SELECT LastName, FirstName, Title, City, Country 
FROM Employees 
WHERE country = 'USA'
--
SELECT LOWER(LastName +'  '+ FirstName) AS 'Full Name', TitleOfCourtesy
FROM dbo.Employees
--
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Country
FROM dbo.Customers
WHERE country = 'UK'
--
SELECT ProductID, ProductName, UnitPrice, UnitsInStock
FROM dbo.Products
WHERE UnitsInStock > 4 AND UnitsInStock < 11