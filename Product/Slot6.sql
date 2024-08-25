SELECT * FROM dbo.Product
SELECT * FROM dbo.Laptop
SELECT * FROM dbo.PC
SELECT * FROM dbo.Printer
--Q1
SELECT DISTINCT PC.model, speed, price
FROM dbo.Product, dbo.PC
WHERE Product.model = PC.model AND maker = 'A'
ORDER BY price ASC
--
SELECT DISTINCT PC.model, speed, price FROM dbo.Product JOIN dbo.PC
ON PC.model = Product.model
WHERE maker = 'A'
ORDER BY price ASC

--Q2
SELECT maker, Product.model, type, price FROM dbo.Product LEFT JOIN dbo.PC
ON PC.model = Product.model
--Q3
SELECT * FROM dbo.Product RIGHT JOIN dbo.Laptop
ON Laptop.model = Product.model

--Q4
SELECT * FROM dbo.Product FULL OUTER JOIN dbo.Printer
ON Printer.model = Product.model
--Q5
SELECT DISTINCT A.maker, A.model AS 'Model1', B.model AS 'Model2' FROM dbo.Product A, dbo.Product B
WHERE A.maker = B.maker
AND A.type = 'laptop' AND B.type = 'laptop' --Chỉ xét các cặp laptop
AND A.model < B.model --Loại bỏ trường hợp trùng nhau
--Q6
SELECT Product.model FROM dbo.PC JOIN dbo.Product
ON Product.model = PC.model
WHERE maker = 'A'
UNION
SELECT Product.model FROM dbo.Laptop JOIN dbo.Product
ON Product.model = Laptop.model
WHERE maker = 'A'
--Q7
SELECT ram FROM dbo.Laptop
INTERSECT
SELECT ram FROM dbo.PC
--Q8
SELECT speed FROM dbo.PC
EXCEPT SELECT speed FROM dbo.Laptop
--Q9
SELECT TOP 1 maker FROM dbo.Product JOIN dbo.PC
ON PC.model = Product.model
ORDER BY speed DESC