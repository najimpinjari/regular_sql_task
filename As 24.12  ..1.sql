create database najimpersonal


--24/12 assignment 1


-- Table: departments
CREATE TABLE departments1 (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);

-- Insert sample values into departments table
INSERT INTO departments1 (department_id, department_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Marketing');

-- Table: employees
CREATE TABLE employees2 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    department_id INT REFERENCES departments1(department_id)
);

-- Insert sample values into employees table
INSERT INTO employees2 (employee_id, employee_name, department_id) VALUES
(101, 'John Doe', 1),  -- John Doe belongs to HR department
(102, 'Jane Smith', 2),  -- Jane Smith belongs to IT department
(103, 'Bob Johnson', 1);  -- Bob Johnson also belongs to HR department


-- Question: Retrieve employees who belong to the 'IT' department.
SELECT employee_name
FROM employees2
JOIN departments1 ON employees2.department_id = departments1.department_id
WHERE department_name = 'IT';


-- Question: List all employees and their corresponding department names.
SELECT employee_name, department_name
FROM employees2
JOIN departments1 ON employees2.department_id = departments1.department_id;

-- Question: Identify departments with no employees.

SELECT department_name
FROM departments1
LEFT JOIN employees2 ON departments1.department_id = employees2.department_id
WHERE employees2.employee_id IS NULL;




