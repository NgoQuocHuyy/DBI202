CREATE TABLE Categories ( --Categories
    CategoryID NVARCHAR(20) NOT NULL PRIMARY KEY, --CategoryID
    CategoryName NVARCHAR(200) --CategoryName
);

CREATE TABLE Products ( --Product
    ProductID CHAR(20) NOT NULL PRIMARY KEY, --ProductID
    ProductName NVARCHAR(50) NOT NULL, --ProductName
    CategoryID NVARCHAR(20), 
    Price INT, 
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE StoreHouse ( --StoreHouse
    StoreHouseID CHAR(20) NOT NULL PRIMARY KEY, --StoreHouseID
    Address NVARCHAR(255) NOT NULL, --Address
    Manager NVARCHAR(255) NOT NULL --Manager
);

CREATE TABLE ManageProduct ( --ManageProduct
    ProductID CHAR(20) NOT NULL,
    StoreHouseID CHAR(20) NOT NULL,
    Quantity INT,
    InDate DATE NOT NULL,
    OutDate DATE NOT NULL,
    CONSTRAINT chk_Quantity CHECK(Quantity >= 0),
    CONSTRAINT chk_Day CHECK(OutDate >= InDate),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (StoreHouseID) REFERENCES StoreHouse(StoreHouseID)
);

CREATE TABLE Customers ( --Customer
    CustomerID CHAR(20) NOT NULL PRIMARY KEY,
    CustomerName NVARCHAR(255) NOT NULL,
    Email NVARCHAR(100),
    PhoneNumber CHAR(11),
    Address NVARCHAR(100) NOT NULL,
    CONSTRAINT chk_Email CHECK (Email LIKE '%_@__%.__%'),
    CONSTRAINT chk_PhoneNumber CHECK (
        PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' 
        OR PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE Orders ( --Order
    OrderID CHAR(20) NOT NULL PRIMARY KEY,
    ProductID CHAR(20) NOT NULL,
    CustomerID CHAR(20) NOT NULL,
    Quantity INT, 
    PurchaseDate DATE NOT NULL,
    StoreHouseID CHAR(20) NOT NULL,
    Total INT NOT NULL, 
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreHouseID) REFERENCES StoreHouse(StoreHouseID)
);

CREATE TABLE Warranty ( --Warranty
    WarrantyID CHAR(20) NOT NULL PRIMARY KEY,
    OrderID CHAR(20) NOT NULL,
    ProductName NVARCHAR(50) NOT NULL,
    WarrantyDate DATE NOT NULL,
    TypeOfWarranty NVARCHAR(255) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
