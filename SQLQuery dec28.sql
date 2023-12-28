use najimpersonal
	
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting sample data
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
    (101, 1, '2023-01-15'),
    (102, 2, '2023-02-20');



	--Write a SQL query to find the total amount spent by each customer,
	--including their full name and the sum of the prices of all products
	--they have ordered. Assume that one order can include multiple products.

	SELECT
    C.CustomerID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    SUM(P.Price) AS TotalAmountSpent
FROM
    Customers C
JOIN
    Orders O ON C.CustomerID = O.CustomerID
JOIN
    OrderDetails OD ON O.OrderID = OD.OrderID
JOIN
    Products P ON OD.ProductID = P.ProductID
GROUP BY
    C.CustomerID, CustomerName;
