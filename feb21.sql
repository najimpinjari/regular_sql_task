use ADODOTNET

-- Table 1: Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Inserting sample values into Employees table
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Position, Salary) VALUES
(1, 'John Doe', 101, 'Manager', 70000.00),
(2, 'Jane Smith', 102, 'Developer', 60000.00),
(3, 'Michael Lee', 101, 'Analyst', 55000.00),
(4, 'Emily Brown', 103, 'Designer', 58000.00);

-- Table 2: Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100)
);

-- Inserting sample values into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(101, 'IT', 'New York'),
(102, 'Marketing', 'Los Angeles'),
(103, 'Design', 'Chicago'),
(104, 'HR', 'Houston');


--create a view that lists all tasks along with the names of the employees they are assigned to.
--We'll also create a user-defined function that calculates the number of days left until the 
--deadline for each task.


-- User-defined function to calculate days left until the deadline
CREATE FUNCTION dbo.DaysUntilDeadline (@Deadline DATE)
RETURNS INT
AS
BEGIN
    DECLARE @DaysLeft INT;
    SET @DaysLeft = DATEDIFF(DAY, GETDATE(), @Deadline);
    RETURN @DaysLeft;
END;
GO

-- Create a view to display tasks along with employee names and days left until the deadline
CREATE VIEW TaskDetails
AS
SELECT 
    T.TaskID,
    T.Description,
    T.Deadline,
    E.Name AS AssignedTo,
    dbo.DaysUntilDeadline(T.Deadline) AS DaysLeft
FROM 
    Tasks T
JOIN 
    Employees E ON T.AssignedTo = E.EmployeeID;




	-- Query the TaskDetails view
SELECT * FROM TaskDetails;
