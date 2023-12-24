use najimpersonal

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


-- Question: Retrieve the employee names and department names for employees in departments other than 'HR'.

SELECT employee_name, department_name
FROM employees2
JOIN departments1 ON employees2.department_id = departments1.department_id
WHERE departments1.department_name <> 'HR';


--12. Question: Find the department with the highest number of employees.


SELECT department_name
FROM departments1
JOIN (
    SELECT department_id, COUNT(*) AS employee_count
    FROM employees2
    GROUP BY department_id
    ORDER BY employee_count DESC
    LIMIT 1
) AS max_employee_count ON departments1.department_id = max_employee_count.department_id;



--14. Question: Calculate the average number of employees per department.

SELECT AVG(employee_count) AS average_employees_per_department
FROM (
    SELECT department_id, COUNT(*) AS employee_count
    FROM employees2
    GROUP BY department_id
) AS department_employee_counts;


