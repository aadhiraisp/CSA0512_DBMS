CREATE DATABASE IF NOT EXISTS ShopNestDB;
USE ShopNestDB;

-- Create Customer Table
CREATE TABLE Customer (
    CustomerID VARCHAR(12) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerEmail VARCHAR(150) UNIQUE NOT NULL
);

-- Create Category Table
CREATE TABLE Category (
    CategoryID VARCHAR(12) PRIMARY KEY,
    CategoryName VARCHAR(80) NOT NULL UNIQUE
);

-- Create Supplier Table
CREATE TABLE Supplier (
    SupplierID VARCHAR(12) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    SupplierPhone VARCHAR(20) NOT NULL
);

-- Create Warehouse Table
CREATE TABLE Warehouse (
    WarehouseID VARCHAR(12) PRIMARY KEY,
    WarehouseCity VARCHAR(80) NOT NULL
);

-- Create Postal Code Table
CREATE TABLE PostalCode (
    ShipPIN CHAR(6) PRIMARY KEY,
    ShipCity VARCHAR(80) NOT NULL,
    ShipState VARCHAR(80) NOT NULL
);

-- Create Postal Address Table
CREATE TABLE PostalAddress (
    ShipStreet VARCHAR(150) NOT NULL,
    ShipCity VARCHAR(80) NOT NULL,
    ShipPIN CHAR(6) NOT NULL,
    PRIMARY KEY (ShipStreet, ShipCity),
    FOREIGN KEY (ShipPIN) REFERENCES PostalCode(ShipPIN)
);

-- Create Product Table
CREATE TABLE Product (
    ProductID VARCHAR(12) PRIMARY KEY,
    ProductName VARCHAR(120) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
    CategoryID VARCHAR(12) NOT NULL,
    SupplierID VARCHAR(12) NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- Create Order Header Table
CREATE TABLE OrderHeader (
    OrderID VARCHAR(12) PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID VARCHAR(12) NOT NULL,
    ShipStreet VARCHAR(150) NOT NULL,
    ShipCity VARCHAR(80) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ShipStreet, ShipCity)
        REFERENCES PostalAddress(ShipStreet, ShipCity)
);

-- Create Order Item Table
CREATE TABLE OrderItem (
    OrderID VARCHAR(12),
    ProductID VARCHAR(12),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    WarehouseID VARCHAR(12) NOT NULL,
    PricePaid DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES OrderHeader(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

-- Create Product Tag Table
CREATE TABLE ProductTag (
    ProductID VARCHAR(12),
    Tag VARCHAR(50),
    PRIMARY KEY (ProductID, Tag),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Create Product Colour Table
CREATE TABLE ProductColour (
    ProductID VARCHAR(12),
    Colour VARCHAR(50),
    PRIMARY KEY (ProductID, Colour),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Create 5NF Tables
CREATE TABLE SupplierCategory (
    SupplierID VARCHAR(12),
    CategoryID VARCHAR(12),
    PRIMARY KEY (SupplierID, CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE CategoryWarehouse (
    CategoryID VARCHAR(12),
    WarehouseID VARCHAR(12),
    PRIMARY KEY (CategoryID, WarehouseID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

CREATE TABLE SupplierWarehouse (
    SupplierID VARCHAR(12),
    WarehouseID VARCHAR(12),
    PRIMARY KEY (SupplierID, WarehouseID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID)
);

-- Insert Customer Details
INSERT INTO Customer VALUES
('C01','Arun','arun@example.com'),
('C02','Priya','priya@example.com'),
('C03','Kavin','kavin@example.com');

-- Insert Category Details
INSERT INTO Category VALUES
('CAT1','Drinkware'),
('CAT2','Stationery');

-- Insert Supplier Details
INSERT INTO Supplier VALUES
('S01','Alpha Supplies','9000000001'),
('S02','Beta Traders','9000000002');

-- Insert Warehouse Details
INSERT INTO Warehouse VALUES
('W1','Chennai'),
('W2','Salem');

-- Insert Postal Codes
INSERT INTO PostalCode VALUES
('600001','Chennai','Tamil Nadu'),
('636001','Salem','Tamil Nadu'),
('625001','Madurai','Tamil Nadu');

-- Insert Postal Addresses
INSERT INTO PostalAddress VALUES
('12 Lake Road','Chennai','600001'),
('8 Park Street','Salem','636001'),
('4 Main Road','Madurai','625001');

-- Insert Product Details
INSERT INTO Product VALUES
('P10','Bottle',250.00,'CAT1','S01'),
('P20','Notebook',100.00,'CAT2','S02'),
('P30','Pen',50.00,'CAT2','S02');

-- Insert Order Details
INSERT INTO OrderHeader VALUES
('O101','2026-10-01','C01','12 Lake Road','Chennai'),
('O102','2026-10-02','C02','8 Park Street','Salem'),
('O103','2026-10-03','C03','4 Main Road','Madurai');

-- Insert Order Items
INSERT INTO OrderItem VALUES
('O101','P10',2,'W1',250.00),
('O101','P20',1,'W2',100.00),
('O102','P10',1,'W1',240.00),
('O102','P20',3,'W2',100.00),
('O103','P30',1,'W2',50.00),
('O103','P20',2,'W2',95.00);

-- Insert Product Tags
INSERT INTO ProductTag VALUES
('P10','Reusable'),
('P10','BPA-free'),
('P20','Ruled'),
('P30','Smooth'),
('P30','Fine-tip');

-- Insert Product Colours
INSERT INTO ProductColour VALUES
('P10','Blue'),
('P10','Green'),
('P20','White'),
('P30','Black');

-- Insert 5NF Relationship Data
INSERT INTO SupplierCategory VALUES
('S01','CAT1'),
('S02','CAT2');

INSERT INTO CategoryWarehouse VALUES
('CAT1','W1'),
('CAT2','W2');

INSERT INTO SupplierWarehouse VALUES
('S01','W1'),
('S02','W2');

-- Display Tables
SELECT * FROM Customer;
SELECT * FROM Category;
SELECT * FROM Supplier;
SELECT * FROM Warehouse;
SELECT * FROM Product;
SELECT * FROM OrderHeader;
SELECT * FROM OrderItem;
SELECT * FROM ProductTag;
SELECT * FROM ProductColour;

-- Check Duplicate Customer Details
SELECT CustomerID, COUNT(*)
FROM Customer
GROUP BY CustomerID
HAVING COUNT(*) > 1;

-- Check Product Details
SELECT ProductID, ProductName, UnitPrice
FROM Product;

-- Display Order Details
SELECT O.OrderID, O.OrderDate, C.CustomerName,
       P.ProductName, I.Quantity, I.PricePaid
FROM OrderHeader O
JOIN Customer C ON O.CustomerID = C.CustomerID
JOIN OrderItem I ON O.OrderID = I.OrderID
JOIN Product P ON I.ProductID = P.ProductID;

-- Display Product and Supplier Details
SELECT P.ProductID, P.ProductName,
       S.SupplierName, S.SupplierPhone
FROM Product P
JOIN Supplier S ON P.SupplierID = S.SupplierID;

-- Display Product Tags
SELECT * FROM ProductTag;

-- Display Product Colours
SELECT * FROM ProductColour;

-- Create Indexes
CREATE INDEX idx_customer ON OrderHeader(CustomerID);
CREATE INDEX idx_product ON OrderItem(ProductID);
CREATE INDEX idx_orderdate ON OrderHeader(OrderDate);

-- Check Query Execution Plan
EXPLAIN SELECT * FROM OrderHeader
WHERE CustomerID = 'C01';

EXPLAIN SELECT * FROM OrderItem
WHERE ProductID = 'P10';

-- Create Product Price History
CREATE TABLE ProductPriceHistory (
    PriceID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID VARCHAR(12) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    ValidFrom DATE NOT NULL,
    ValidTo DATE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Insert Price History
INSERT INTO ProductPriceHistory
(ProductID, UnitPrice, ValidFrom, ValidTo)
VALUES
('P10',250.00,'2026-09-01','2026-10-01'),
('P10',240.00,'2026-10-01',NULL),
('P20',100.00,'2026-09-01','2026-10-01'),
('P20',95.00,'2026-10-01',NULL);

-- Display Price History
SELECT * FROM ProductPriceHistory;

-- Display Actual Price Paid by Customers
SELECT O.OrderID, P.ProductName,
       I.Quantity, I.PricePaid,
       (I.Quantity * I.PricePaid) AS TotalAmount
FROM OrderItem I
JOIN OrderHeader O ON I.OrderID = O.OrderID
JOIN Product P ON I.ProductID = P.ProductID;

-- Update Product Price
UPDATE Product
SET UnitPrice = 260.00
WHERE ProductID = 'P10';

-- Delete a Product Tag
DELETE FROM ProductTag
WHERE ProductID = 'P10' AND Tag = 'BPA-free';

-- Final Table Display
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM OrderHeader;
SELECT * FROM OrderItem;
SELECT * FROM ProductPriceHistory;