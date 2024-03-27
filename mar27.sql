use ADODOTNET

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

-- Insert sample data into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES
    (101, 'IT', 'New York'),
    (102, 'Engineering', 'San Francisco'),
    (103, 'HR', 'Los Angeles');

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert sample data into Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Position, Salary)
VALUES
    (1, 'John', 'Doe', 101, 'Manager', 60000.00),
    (2, 'Jane', 'Smith', 102, 'Developer', 55000.00),
    (3, 'Michael', 'Johnson', 101, 'Analyst', 50000.00),
    (4, 'Emily', 'Brown', 103, 'HR Manager', 58000.00);


	-- creates the two tables (Departments and Employees) and populates them with sample data:

DELIMITER //

CREATE PROCEDURE CreateAndPopulateTables()
BEGIN
    -- Create Departments table
    CREATE TABLE IF NOT EXISTS Departments (
        DepartmentID INT PRIMARY KEY,
        DepartmentName VARCHAR(50),
        Location VARCHAR(50)
    );

    -- Insert sample data into Departments table if it's empty
    INSERT INTO Departments (DepartmentID, DepartmentName, Location)
    SELECT 101, 'IT', 'New York' FROM DUAL
    WHERE NOT EXISTS (SELECT * FROM Departments WHERE DepartmentID = 101);
    
    INSERT INTO Departments (DepartmentID, DepartmentName, Location)
    SELECT 102, 'Engineering', 'San Francisco' FROM DUAL
    WHERE NOT EXISTS (SELECT * FROM Departments WHERE DepartmentID = 102);
    
    INSERT INTO Departments (DepartmentID, DepartmentName, Location)
    SELECT 103, 'HR', 'Los Angeles' FROM DUAL
    WHERE NOT EXISTS (SELECT * FROM Departments WHERE DepartmentID = 103);

    -- Create Employees table
    CREATE TABLE IF NOT EXISTS Employees (
        EmployeeID INT PRIMARY KEY,
        FirstName VARCHAR(50),
        LastName VARCHAR(50),
        DepartmentID INT,
        Position VARCHAR(50),
        Salary DECIMAL(10, 2),
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
    );

    -- Insert sample data into Employees table if it's empty
    INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Position, Salary)
    SELECT 1, 'John', 'Doe', 101, 'Manager', 60000.00 FROM DUAL
    WHERE NOT EXISTS (SELECT * FROM Employees WHERE EmployeeID = 1);
    
    INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Position, Salary)
    SELECT 2, 'Jane', 'Smith', 102, 'Developer', 55000.00 FROM DUAL
    WHERE NOT EXISTS (SELECT * FROM Employees WHERE EmployeeID = 2);
    
    INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Position, Salary)
    SELECT 3, 'Michael', 'Johnson', 101, 'Analyst', 50000.00 FROM DUAL
    WHERE NOT EXISTS (SELECT * FROM Employees WHERE EmployeeID = 3);
    
    INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Position, Salary)
    SELECT 4, 'Emily', 'Brown', 103, 'HR Manager', 58000.00 FROM DUAL
    WHERE NOT EXISTS (SELECT * FROM Employees WHERE EmployeeID = 4);
END //

DELIMITER ;
