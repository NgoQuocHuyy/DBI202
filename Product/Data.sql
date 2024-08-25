--Q1: 
SELECT * FROM dbo.Product
SELECT * FROM dbo.Laptop
SELECT * FROM dbo.PC
SELECT * FROM dbo.Printer

SELECT DISTINCT maker  AS 'Manufacturer' FROM dbo.Product
--Q2
SELECT  TOP 5 model, price 
FROM dbo.Laptop
ORDER BY price DESC
--Q3
SELECT Maker, model, type FROM dbo.Product
WHERE Maker LIKE 'A%'
--Q4
SELECT model, price FROM dbo.Printer
ORDER BY price DESC
--Q5
SELECT model, ram FROM dbo.PC
WHERE ram BETWEEN 512 AND 2048
ORDER BY ram ASC
--Q6
SELECT model, type FROM dbo.Printer
WHERE color = 1
--Q7
SELECT TOP 3 model, speed AS 'Speed GHz' FROM dbo.PC
ORDER BY speed DESC
--Q8
SELECT model, price AS 'Price in $' FROM dbo.PC
WHERE price < 1000
--Q9
SELECT model, type, price FROM dbo.Printer
WHERE type = 'laser' AND price < 500
--Q10
SELECT model, screen AS 'Screen Size', price FROM dbo.Laptop
WHERE screen > 15 AND price < 2000
ORDER BY price ASC