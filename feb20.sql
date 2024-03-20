use ADODOTNET

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Inserting sample data into Department table
INSERT INTO Department (department_id, department_name) VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'Finance');

-- Inserting sample data into Employee table
INSERT INTO Employee (employee_id, employee_name, department_id) VALUES
(1, 'John Doe', 1),
(2, 'Jane Smith', 2),
(3, 'Michael Johnson', 1),
(4, 'Emily Davis', 3);




--create a stored procedure that retrieves tasks assigned to a specific employee. Here's the SQL code:

CREATE PROCEDURE GetTasksByEmployeeID
    @employeeID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT task_id, task_description
    FROM Task
    WHERE employee_id = @employeeID;
END;
