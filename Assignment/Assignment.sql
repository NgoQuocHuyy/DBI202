CREATE TABLE Categories (
    CategoryID NVARCHAR(20) NOT NULL PRIMARY KEY,
    CategoryName NVARCHAR(200) not null
);

CREATE TABLE Supplier(
	SupplierID NVARCHAR(20) NOT NULL PRIMARY KEY,
	SupplierName NVARCHAR(50) NOT NULL,
	Address NVARCHAR(225) NOT NULL,
	Email NVARCHAR(100) CHECK (Email LIKE '%_@__%.__%'),
	PhoneNumber CHAR(11) NOT NULL CHECK (
        PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' 
        OR PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);
CREATE TABLE Products (
    ProductID CHAR(20) NOT NULL PRIMARY KEY,
    ProductName NVARCHAR(50) NOT NULL,
    Price INT CHECK (Price>0),
    CategoryID NVARCHAR(20) NOT NULL,
    SupplierID NVARCHAR(20) NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
CREATE TABLE Customers (
CustomerID CHAR(20) NOT NULL PRIMARY KEY,
CustomerName NVARCHAR(255) NOT NULL,
 Email NVARCHAR(100) CHECK (Email LIKE '%_@__%.__%'),
 Address nvarchar(100) not null,
 PhoneNumber CHAR(11) NOT NULL CHECK (
PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
             OR PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);
create  table Orders(
 OrderID char(20) not null primary key,
  CustomerID char(20) not null,
 ProductID char(20) not null,
  OrderDate date not null,
 purchaseDate date not null,
  foreign key(CustomerID) REFERENCES dbo.Customers(CustomerID),
 foreign key (ProductID) references dbo.Products(ProductID)
);
CREATE TABLE OrderDetail(
    OrderDetailID CHAR(20) NOT NULL PRIMARY KEY,
    OrderID CHAR(20) NOT NULL,
    ProductID CHAR(20) NOT NULL, 
    Quantity INT NOT NULL CHECK (Quantity > 0),
    TotalAmount INT NOT NULL,
    ProductUnitPrice INT NOT NULL CHECK (ProductUnitPrice>0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
create  table Company(
    CompanyID nvarchar(20) not null primary key,
    CompanyName nvarchar(225) not null,
    Email NVARCHAR(100) NOT NULL CHECK (Email LIKE '%_@__%.__%')
);
create table CompanyOfProduct(
    CompanyID nvarchar(20) not null,
   SupplierID nvarchar(20) not null,
    foreign key (CompanyID) references Company(CompanyID),
    foreign key (SupplierID) references Supplier(SupplierID)
);
CREATE TABLE Warranty (
    WarrantyID CHAR(20) NOT NULL PRIMARY KEY,
    ProductID char(20) not null,
    WarrantyDate DATE NOT NULL,
    TypeOfWarranty NVARCHAR(255) NOT NULL,
	CompanyID nvarchar(20) not null,
    foreign key (ProductID) references Products(ProductID),
    foreign key (CompanyID) references Company(CompanyID)
);
CREATE TABLE Employee(
	EmployeeID CHAR(20) NOT NULL PRIMARY KEY,
    OrderID char(20) not null,
	EmployeeName NVARCHAR(225) NOT NULL,
	PhoneNumber CHAR(11) NOT NULL,
	Email NVARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);



