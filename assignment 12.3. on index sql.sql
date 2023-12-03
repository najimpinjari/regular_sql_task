use piramalemployee
-assignment no 2

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

	--Let's create an index on the UserId column, which is the primary key of the Users2 table.

	-- Index for Primary Key
CREATE UNIQUE INDEX idx_Users2_UserId ON Users2 (UserId);

-- Index for Unique Email
CREATE UNIQUE INDEX idx_Users2_Email ON Users2 (Email);
