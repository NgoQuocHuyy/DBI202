SELECT * FROM dbo.PC
SELECT * FROM dbo.Product
SELECT * FROM dbo.Printer
SELECT * FROM dbo.Laptop
--C1
--SELECT * FROM dbo.Laptop
--CREATE TRIGGER trg_IncreasePrice
--ON dbo.Product
--AFTER INSERT
--AS
--BEGIN
	--UPDATE dbo.Laptop
	--SET price = price * 1.05
	--UPDATE dbo.PC
	--SET price = price * 1.05
	--UPDATE dbo.Printer
	--SET price = price * 1.05
--END
	--Test
--INSERT INTO dbo.Product
--(
    --maker,
    --model,
    --type
--)
--VALUES
--(   N'abc', -- maker - nchar(10)
    --123, -- model - int
    --N'printer'  -- type - nvarchar(10)
    --)
--Q2
--CREATE TRIGGER trg_PreventDelete
--ON dbo.PC
--FOR DELETE
--AS
--BEGIN
	--PRINT 'CAN NOT DELETE IN PC'
	--ROLLBACK TRANSACTION --Quay về thời điểm trước khi thực hiện hành động. Quay ngược lại thời điểm trc khi delete
--END
	--Test
--DELETE FROM dbo.PC
--WHERE model = 1001
--Q3: Hiển thị ra maker, price, model mỗi khi thực hiện update ram
CREATE TRIGGER trg_UpdateRam
ON PC
FOR UPDATE
as
BEGIN
	IF UPDATE(ram)
	BEGIN
	SELECT maker, Product.model, price FROM Product JOIN dbo.PC
	ON PC.model = Product.model
	WHERE PC.model IN( --Chỉ lấy ra maker, model, price của những row đã update ram
	SELECT model FROM inserted i) --Bảng insterted lưu những giá trị sau khi update
	END 
END
--Test
UPDATE dbo.PC
SET ram = 1000
WHERE price < 600
--Q4:Trigger tự động thêm dữ liệu vào bảng khác. Làm thế nào để tạo 1 trigger tự động chèn 1 hàng vào có dạng (null, model,'pc') vào
--bảng Product mỗi khi chèn dữ liệu vào PC
CREATE TRIGGER trg_InsertProduct
ON PC
FOR INSERT
AS 
BEGIN
	INSERT INTO dbo.Product
	(
	    maker,
	    model,
	    type
	)
	VALUES
	(   NULL, -- maker - nchar(10)
	    (SELECT model FROM inserted), -- model - int
	    N'pc'  -- type - nvarchar(10)
	    )
END
--Test
INSERT INTO dbo.PC
(
    model,
    speed,
    ram,
    hd,
    price
)
VALUES
(   1014, -- model - int
    2.22, -- speed - decimal(5, 2)
    1000, -- ram - int
    200, -- hd - int
    1044  -- price - int
    )
--Q5:Trigger để kiểm tra ràng buộc dữ liệu trước khi thêm. Làm thế nào để tạo 1 trigger kiểm tra rằng price của máy in không được
--dưới 100 trước khi thêm vào bảng Printer
CREATE TRIGGER trg_CheckPrice
ON PC
FOR insert
AS
BEGIN
	IF EXISTS(SELECT * FROM inserted i WHERE price < 100)--Nếu tồn tại price sau khi insert < 100 thì k cho insert
	BEGIN
	PRINT 'CAN NOT INSERT IF YOU INSERT PRICE < 100'
	ROLLBACK TRANSACTION
	END
	ELSE
		INSERT INTO PC
		SELECT * FROM inserted
END
--Test
INSERT INTO dbo.PC
(
    model,
    speed,
    ram,
    hd,
    price
)
VALUES
(   1015, -- model - int
    1.08, -- speed - decimal(5, 2)
    1300, -- ram - int
    120, -- hd - int
    99  -- price - int
    )
--Q6:Trigger để cập nhật dữ liệu liên quan khi xóa. Làm thế nào để tạo 1 trigger xóa tất cả các bản ghi liên quan trong bảng PC khi
--một model được xóa khỏi bảng Product
CREATE TRIGGER trg_DeleteRelatedPC
ON Product
FOR DELETE
AS 
BEGIN
	DELETE FROM dbo.PC
	WHERE model IN(SELECT model FROM deleted)
END
--Test:
DELETE FROM dbo.Product
WHERE model = 123
