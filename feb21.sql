use ADODOTNET

-- Create Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert some sample data into Departments table
INSERT INTO Departments (department_id, department_name)
VALUES 
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'Marketing');

-- Create Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Insert some sample data into Employees table
INSERT INTO Employees (employee_id, employee_name, department_id)
VALUES 
    (101, 'John Doe', 1),  -- John Doe works in HR department
    (102, 'Jane Smith', 2), -- Jane Smith works in Finance department
    (103, 'Michael Johnson', 3); -- Michael Johnson works in Marketing department
--


--et's write a SQL query to join the "Employees" table with itself to 
--get each employee's name along with the name of their manager

SELECT e.employee_name AS employee_name, m.employee_name AS manager_name
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id;



--, let's retrieve employee details along with the names
--of their managers and their respective positions:


SELECT e.employee_name AS employee_name, e.position AS employee_position,
       m.employee_name AS manager_name, m.position AS manager_position
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id;

