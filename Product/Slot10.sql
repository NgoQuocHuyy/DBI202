SELECT * FROM dbo.Books
SELECT * FROM dbo.Genres
SELECT * FROM dbo.LoanDetails
SELECT * FROM dbo.Loans
SELECT * FROM dbo.Members
--Q1: Tính tổng giá cho mỗi loại sản phẩm(PC, Laptop, Printer)
CREATE PROC TotalByPrice
AS
BEGIN
	SELECT p.[type], SUM(price) AS TotalPrice
	FROM Product p
	JOIN (SELECT model, price FROM PC UNION ALL SELECT model, 
	price FROM Laptop UNION ALL SELECT model, price FROM dbo.Printer) AS pr
	ON pr.model = p.model
	GROUP BY p.type

END
--Test
EXEC TotalByPrice
--Q2:Đếm số lượng sản phẩm theo nhà sản xuất
CREATE PROC CountProductsByMaker
AS
BEGIN
	SELECT maker, COUNT(*) AS NumberOfProducts
	FROM dbo.Product
	GROUP BY maker
END
--Test
EXEC CountProductsByMaker
--Q3: Tính giá trị trung bình , cao nhất và thấp nhất của PC theo nhà sản xuất
CREATE PROC AvgMinMaxPriceOfPCByMaker
AS
BEGIN
	SELECT p.maker, AVG(pc.price) AS AvgPrice, MAX(pc.price) AS MaxPrice, MIN(pc.price) AS MinPrice
	FROM dbo.Product p
	JOIN dbo.PC
	ON PC.model = p.model
	GROUP BY p.maker
END
--Test
EXEC AvgMinMaxPriceOfPCByMaker
--Q4: Tìm giá trị trung bình của Laptop theo kích thước màn hình
CREATE FUNCTION AvgPriceByScreenSize
(
	@screenSize numeric(5, 1)
)
RETURNS decimal(10,2)
AS
BEGIN
	RETURN(
	SELECT AVG(price) FROM dbo.Laptop
	WHERE screen = @screenSize
	)
END
GO
--Test
PRINT dbo.AvgPriceByScreenSize(17)
