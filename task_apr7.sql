use ADODOTNET

-- Create employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Insert some sample data into the employees table
INSERT INTO employees (id, name, department, salary) VALUES
(1, 'John Doe', 'Engineering', 60000.00),
(2, 'Jane Smith', 'Engineering', 65000.00),
(3, 'David Lee', 'Marketing', 55000.00),
(4, 'Emily Brown', 'Marketing', 58000.00),
(5, 'Michael Johnson', 'Sales', 62000.00),
(6, 'Sarah White', 'Sales', 59000.00);

-- Query to find the average salary of employees in each department
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;



DELIMITER //

CREATE PROCEDURE CalculateAverageSalaryPerDepartment()
BEGIN
    SELECT department, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department;
END//

CALL CalculateAverageSalaryPerDepartment();



