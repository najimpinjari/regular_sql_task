use piramalemployee


--practice sql day 24/11



CREATE TABLE departments0 (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);
-- Insert values into the Departments table
INSERT INTO departments0 (department_id, department_name) VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'Engineering');



CREATE TABLE employees0 (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments0(department_id)
);
-- Insert values into the Employees table
INSERT INTO employees0 (employee_id, first_name, last_name, department_id, salary) VALUES
(101, 'John', 'Doe', 1, 50000.00),
(102, 'Jane', 'Smith', 2, 45000.00),
(103, 'Robert', 'Johnson', 1, 55000.00),
(104, 'Emily', 'Davis', 3, 60000.00),
(105, 'Michael', 'Clark', 2, 48000.00);



--Write a SQL query to rank employees based on their salary in descending order.

select 
	employee_id,first_name, last_name ,salary,
	rank() over (order by salary desc ) as salary_rank 
	from employees0

--Write a SQL query to rank departments based on the average salary
--of employees in each department in descending order.

SELECT 
    department_id, 
    department_name, 
    AVG(salary) AS average_salary, 
    RANK() OVER (ORDER BY AVG(salary) DESC) AS department_salary_rank
FROM employees0
JOIN departments0 ON employees0.department_id = departments0.department_id
GROUP BY department_id, department_name;


--