use piramalemployee
--assignment no 3

-- Create Users table with Primary Key
CREATE TABLE Users2 (
    UserId INT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Insert values into Users table
INSERT INTO Users2 VALUES 
    (1, 'John Doe', 'john.doe@example.com'),
    (2, 'Jane Smith', 'jane.smith@example.com'),
    (3, 'Bob Johnson', 'bob.johnson@example.com');

-- Create Orders table with Foreign Key referencing Users table
CREATE TABLE Orders2 (
    OrderId INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    OrderDate DATE NOT NULL,
    UserId INT foreign key REFERENCES Users2(UserId)
);

-- Insert values into Orders table
INSERT INTO Orders2
VALUES 
    (101, 'Product A', '2023-01-15', 1),
    (102, 'Product B', '2023-02-01', 2),
    (103, 'Product C', '2023-03-10', 3);

	--
--Error handling is an important aspect of database programming to ensure that issues are 
--identified and addressed appropriately. Below are examples of how you can add error handling
--to the SQL statements provided earlier.

-- Problem 1: Retrieve a list of all orders with the corresponding user information
BEGIN TRY
    SELECT Orders2.OrderId, Users2.UserName, Users2.Email, Orders2.ProductName, Orders2.OrderDate
    FROM Orders2
    JOIN Users2 ON Orders2.UserId = Users2.UserId;
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
