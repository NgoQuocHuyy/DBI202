--Q1:
-- Sắp xếp các sản phẩm theo giá từ thấp đến cao
SELECT ProductName, Price FROM Products
ORDER BY Price ASC;
--Q2:
-- Lấy thông tin sản phẩm kèm theo tên nhà cung cấp
SELECT Products.ProductName, Products.Price, Supplier.SupplierName
FROM Products
JOIN Supplier ON Products.SupplierID = Supplier.SupplierID;
--Q3:
-- Tính giá trung bình của tất cả sản phẩm
SELECT AVG(Price) AS AveragePrice FROM Products;
--Q4:
-- Liệt kê các nhà cung cấp có giá trị đơn hàng trung bình trên 700
SELECT SupplierID, AVG(Price) AS AvgPrice
FROM Products
GROUP BY SupplierID
HAVING AVG(Price) > 700;
--Q5:
-- Lấy thông tin của những sản phẩm có giá cao nhất
SELECT * FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);
--Q6:
-- Lấy danh sách các sản phẩm có giá từ 500 đến 1000
SELECT * FROM Products
WHERE Price BETWEEN 500 AND 1000;
--Q7:
-- Lấy tất cả sản phẩm kèm theo thông tin đơn hàng (nếu có)
SELECT Products.ProductName, Orders.OrderID
FROM Products
LEFT JOIN Orders ON Products.ProductID = Orders.ProductID;
--Q8:
-- Tạo procedure để lấy thông tin chi tiết của sản phẩm
CREATE PROCEDURE GetProductDetails
    @ProductID CHAR(20)
AS
BEGIN
    SELECT * FROM Products
    WHERE ProductID = @ProductID;
END;

-- Test the procedure
EXEC GetProductDetails @ProductID = 'P001';
--Q9:
CREATE TRIGGER CheckOrderDates
ON Orders
AFTER INSERT
AS
BEGIN
    -- Kiểm tra nếu ngày đặt hàng và ngày mua không khớp
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE OrderDate <> PurchaseDate
    )
    BEGIN
        -- Ghi nhận bằng cách cập nhật TotalAmount thành 0 cho đơn đặt hàng không khớp
        UPDATE OrderDetail
        SET TotalAmount = 0
        FROM OrderDetail
        JOIN inserted ON OrderDetail.OrderID = inserted.OrderID
    END
END;
--
INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, PurchaseDate)
VALUES ('O021', 'CU001', 'P001', '2024-07-20', '2024-07-21');

-- Kiểm tra kết quả trong bảng OrderDetail
SELECT * FROM OrderDetail WHERE OrderID = 'O021';
--
INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, TotalAmount, ProductUnitPrice)
VALUES ('OD100', 'O021', 'P001', 2, 900, 450);








