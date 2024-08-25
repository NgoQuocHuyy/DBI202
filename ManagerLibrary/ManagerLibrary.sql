--Tao bao Member
CREATE TABLE Members(
memberID INT IDENTITY(1,1) PRIMARY KEY,
fullName NVARCHAR(255) NOT NULL,
email VARCHAR(255) null,
phone VARCHAR(20) NOT NULL,
[address] NVARCHAR(255) NOT NULL,
CONSTRAINT chk_phone1 CHECK (phone LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CONSTRAINT chk_email1 CHECK (email LIKE '%_@__%.__%')
);


--Tao bang Staff
CREATE TABLE Staffs(
staffID INT IDENTITY(1,1) PRIMARY KEY ,
fullName NVARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
phone VARCHAR(20) NOT NULL,
[address] NVARCHAR(255) NOT NULL,
salary DECIMAL(18,2) NOT NULL,
CONSTRAINT chk_phone2 CHECK (phone LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CONSTRAINT chk_email2 CHECK (email LIKE '%_@__%.__%'),
CONSTRAINT chk_salary CHECK(salary>0)
);

--- Tao bang Categories
CREATE TABLE Categories(
categoryID INT PRIMARY KEY IDENTITY(1,1),
categoryName NVARCHAR(255) NOT NULL
)

--- Tao bang Author
CREATE TABLE Authors(
authorID INT PRIMARY KEY IDENTITY(1,1),
[name] NVARCHAR(255) NOT NULL,
biography NVARCHAR(MAX) NULL
);

--Tao bang Books
CREATE TABLE Books(
bookID INT PRIMARY KEY IDENTITY(1,1),
title NVARCHAR(255) NOT NULL,
publishedYear INT NOT NULL,
quantity INT NOT NULL,
CONSTRAINT chk_publishYear CHECK (publishedYear>=2000 AND publishedYear<=YEAR(GETDATE())),
CONSTRAINT chk_quantity CHECK(quantity>=0)
--);

--Tao bang BorrowRecords
CREATE TABLE BorrowRecords(
borrowID INT PRIMARY KEY IDENTITY(1,1),
bookID INT NOT NULL,
memberID INT NOT NULL,
staffID INT NOT NULL,
borrowDate DATE NOT NULL,
allowedDays INT NOT NULL,
FOREIGN KEY (bookID) REFERENCES dbo.Books(bookID),
FOREIGN KEY(memberID) REFERENCES dbo.Members(memberID),
FOREIGN KEY (staffID) REFERENCES dbo.Staffs(staffID),
CONSTRAINT chk_borrowDate CHECK (borrowDate<=GETDATE()),
CONSTRAINT chk_allowedDays CHECK(allowedDays>=7)
);

--Tao bang Return Record
CREATE TABLE ReturnRecords(
returnID INT PRIMARY KEY IDENTITY(1,1),
staffID INT NOT NULL FOREIGN KEY REFERENCES dbo.Staffs(StaffID),
returnDate DATE NOT NULL
)

--Tao bang cho quan he Borrow_Return Detail
CREATE TABLE Borrow_ReturnDetail(
borrowID INT,
returnID INT,
fineAmount DECIMAL(18,2) DEFAULT 0 NULL,
note NVARCHAR(MAX) NULL,
PRIMARY KEY(borrowID,returnID),
FOREIGN KEY (borrowID) REFERENCES dbo.BorrowRecords(borrowID),
FOREIGN KEY (returnID) REFERENCES dbo.ReturnRecords(returnID),
CONSTRAINT chk_fineAmount CHECK (fineAmount>=0) 
);

-- Tao bang cho quan he Book_Categories Detail

CREATE TABLE Book_CategoriesDetail(
bookID INT,
categoryID INT,
history NVARCHAR(MAX) NULL,
PRIMARY KEY (bookID,categoryID),
FOREIGN KEY (bookID) REFERENCES dbo.Books(bookID),
FOREIGN KEY (categoryID) REFERENCES dbo.Categories(categoryID)
);

-- Tao bang cho quan he Book_Author Detail

CREATE TABLE Book_AuthorDetail(
bookID INT,
authorID INT,
note NVARCHAR(MAX) NULL,
PRIMARY KEY (bookID,authorID),
FOREIGN KEY (bookID) REFERENCES dbo.Books(bookID),
FOREIGN KEY (authorID) REFERENCES dbo.Authors(AuthorID)
);
