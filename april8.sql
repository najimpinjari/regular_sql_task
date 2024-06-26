use ADODOTNET

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    QuantityInStock INT
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Sample Data into Customers Table
INSERT INTO Customers (CustomerID, Name, Email, Address, PhoneNumber)
VALUES 
    (1, 'John Doe', 'john@example.com', '123 Main St, Cityville', '123-456-7890'),
    (2, 'Jane Smith', 'jane@example.com', '456 Elm St, Townsville', '987-654-3210');

-- Insert Sample Data into Products Table
INSERT INTO Products (ProductID, Name, Description, Price, QuantityInStock)
VALUES 
    (1, 'Widget', 'A small widget', 10.99, 50),
    (2, 'Gadget', 'A fancy gadget', 29.99, 20),
    (3, 'Thingamajig', 'An odd thingamajig', 15.49, 10);

-- Insert Sample Data into Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
    (1, 1, '2024-04-01', 50.45),
    (2, 2, '2024-04-02', 35.98);

-- Insert Sample Data into OrderDetails Table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
VALUES 
    (1, 1, 1, 3, 10.99),
    (2, 1, 2, 1, 29.99),
    (3, 2, 3, 2, 15.49);

-- Retrieve all customers along with their orders
SELECT c.Name AS CustomerName, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Calculate the total revenue generated by the store
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

-- Find out which products are out of stock
SELECT Name AS ProductName
FROM Products
WHERE QuantityInStock = 0;

-- Retrieve the top 5 best-selling products
SELECT p.Name AS ProductName, SUM(od.Quantity) AS TotalQuantitySold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalQuantitySold DESC
LIMIT 5;

-- Update the quantity in stock for a particular product (e.g., ProductID = 1)
UPDATE Products
SET QuantityInStock = QuantityInStock - 5
WHERE ProductID = 1;

-- Delete a customer along with all their associated orders and order details (e.g., CustomerID = 2)
DELETE FROM Customers WHERE CustomerID = 2;
DELETE FROM Orders WHERE CustomerID = 2;
DELETE FROM OrderDetails WHERE OrderID NOT IN (SELECT OrderID FROM Orders);
