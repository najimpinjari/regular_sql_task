use piramalemployee	

-- Retrieve the first name, last name, and salary of all employees
SELECT first_name, last_name, salary
FROM employees0;


-- Find the average salary of employees in each department
SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments0 d
JOIN employees0 e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;


-- Find the average salary of employees in each department
SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments0 d
JOIN employees0 e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;


-- Rank employees within each department based on their salary
SELECT
    d.department_name,
    e.first_name,
    e.last_name,
    e.salary,
    RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_rank
FROM employees0 e
JOIN departments0 d ON e.department_id = d.department_id;



---- Find departments that have employees earning the highest salary in the company
SELECT
    d.department_name,
    e.first_name,
    e.last_name,
    e.salary
FROM employees0 e
JOIN departments0 d ON e.department_id = d.department_id
WHERE (e.salary, e.department_id) IN (
    SELECT MAX(salary), department_id
    FROM employees0
    GROUP BY department_id
);


---- Find the department with the highest average salary, considering only departments with average salary above $50,000
SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments0 d
JOIN employees0 e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING AVG(e.salary) > 50000
ORDER BY average_salary DESC
LIMIT 1;
