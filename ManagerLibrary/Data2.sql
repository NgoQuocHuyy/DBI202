-- SELECT statement for Members table
SELECT * FROM Members;

-- SELECT statement for Staffs table
SELECT * FROM Staffs;

-- SELECT statement for Categories table
SELECT * FROM Categories;

-- SELECT statement for Authors table
SELECT * FROM Authors;

-- SELECT statement for Books table
SELECT * FROM Books;

-- SELECT statement for BorrowRecords table
SELECT * FROM BorrowRecords;

-- SELECT statement for ReturnRecords table
SELECT * FROM ReturnRecords;

-- SELECT statement for Borrow_ReturnDetail table
SELECT * FROM Borrow_ReturnDetail;

-- SELECT statement for Book_CategoriesDetail table
SELECT * FROM Book_CategoriesDetail;

-- SELECT statement for Book_AuthorDetail table
SELECT * FROM Book_AuthorDetail;
--In ra những quyển sách xuất bản năm 2000, sx tăng dần
SELECT * FROM dbo.Books
WHERE publishedYear = 2000
ORDER BY quantity
--Sử dụng Trigger Insert trong bảng borrowRecord để mỗi lần mượn 1 quyển quantity giảm 1 đơn vị
CREATE TRIGGER trg_DecreaseBookQuantity
ON BorrowRecords
AFTER INSERT 
AS 
BEGIN
UPDATE dbo.Books
SET quantity = quantity - 1
WHERE bookID IN
(SELECT b.bookID FROM dbo.Books b JOIN inserted i
ON b.bookID = i.bookID)
END
--Test Trigger  trg_DecreaseBookQuantity
INSERT INTO dbo.BorrowRecords
(
    bookID,
    memberID,
    staffID,
    borrowDate,
    allowedDays
)
VALUES
(   1,         -- bookID - int
    3,         -- memberID - int
    2,         -- staffID - int
    GETDATE(), -- borrowDate - date
    10          -- allowedDays - int
    ) --Sau đó lên trên chạy lại select Books ta thấy quantity từ 10 xuống 9
--Tạo Trigger để trả sách, số lượng quantity lại tăng lên 1
CREATE TRIGGER trg_IncreaseBookQuantity
ON  Borrow_ReturnDetail
AFTER INSERT 
AS 
BEGIN 
UPDATE dbo.Books
SET quantity = quantity + 1
WHERE bookID IN
(SELECT Books.bookID FROM dbo.Books JOIN dbo.BorrowRecords
ON BorrowRecords.bookID = Books.bookID
JOIN inserted i ON i.borrowID = BorrowRecords.borrowID)
END 
--Test  trg_IncreaseBookQuantity
INSERT INTO dbo.ReturnRecords
(
    staffID,
    returnDate
)
VALUES
(   4,        -- staffID - int
    '2024-6-13' -- returnDate - date
    )
INSERT INTO dbo.Borrow_ReturnDetail
(
    borrowID,
    returnID
)
VALUES
(   16,       -- borrowID - int
    16     -- returnID - int   
    )
--

