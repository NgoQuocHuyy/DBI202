SELECT * FROM dbo.Product
SELECT * FROM dbo.Laptop
SELECT * FROM dbo.PC
SELECT * FROM dbo.Printer
--Q1
SELECT maker, AVG(price) AS 'AvgPrice'
FROM dbo.PC JOIN dbo.Product
ON Product.model = PC.model
GROUP BY maker
--Q2
SELECT maker, COUNT(*) AS 'ProductCount' FROM dbo.Product
GROUP BY maker
HAVING COUNT(*) > 5
--Q3
SELECT maker, MAX(price) AS 'MaxPrice' FROM dbo.Printer JOIN dbo.Product
ON Product.model = Printer.model
GROUP BY maker
--Q4:
SELECT maker FROM dbo.Laptop JOIN dbo.Product
ON Product.model = Laptop.model
WHERE price < (SELECT AVG(price) FROM dbo.Laptop)
GROUP BY maker
--Q5
SELECT maker, SUM(ram) AS 'TotalRAM' FROM dbo.PC JOIN dbo.Product
ON Product.model = PC.model
GROUP BY maker
--Q6:
SELECT TOP 1 maker FROM dbo.Product JOIN dbo.Laptop
ON Laptop.model = Product.model
GROUP BY maker
ORDER BY COUNT(*) DESC 
--C2:
SELECT maker FROM dbo.Laptop JOIN dbo.Product
ON Product.model = Laptop.model
GROUP BY maker
HAVING COUNT(*) = 
(SELECT MAX(X.NumberLaptop) FROM 
(SELECT maker, COUNT(*) AS NumberLaptop FROM dbo.Laptop JOIN dbo.Product
ON Product.model = Laptop.model
GROUP BY maker) AS X)

