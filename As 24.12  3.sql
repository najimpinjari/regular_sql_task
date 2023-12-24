use najimpersonal

- Table: departments
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


-- Question: Find the department names and the number of employees in each department.
SELECT department_name, COUNT(employee_id) AS num_employees
FROM departments1
LEFT JOIN employees2 ON departments1.department_id = employees2.department_id
GROUP BY department_name;


--SELECT department_name, COUNT(employee_id) AS num_employees


FROM departments1
LEFT JOIN employees2 ON departments1.department_id = employees2.department_id
GROUP BY department_name;


-- Question: List all employees along with their department names, ordered alphabetically by department name.
SELECT employee_name, department_name
FROM employees2
LEFT JOIN departments1 ON employees2.department_id = departments1.department_id
ORDER BY department_name, employee_name;
