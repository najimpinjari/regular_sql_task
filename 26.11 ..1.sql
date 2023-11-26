use piramalemployee

select * from employees0
select * from departments0

--Write a query to find the department with the highest salary gap, 
--where the salary gap is defined as the difference between the highest and lowest
--salaries within the department. 
--Include the department name and the salary gap

SELECT 
    d.department_name,
    MAX(e.salary) - MIN(e.salary) AS salary_gap
FROM departments0 d
JOIN employees0 e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY salary_gap DESC
LIMIT 1;


--Write a query to identify employees who earn more than the average salary in their respective departments. 
--Include the employee name, department name, and salary.

	SELECT 
    e.first_name,
    e.last_name,
    d.department_name,
    e.salary
FROM employees0 e
JOIN departments0 d ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees0
    WHERE department_id = e.department_id
);


--Write a query to find departments that have at least two employees 
--and an average salary above a specified threshold.
--Include the department name and the average salary.

SELECT 
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments0 d
JOIN employees0 e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) >= 2 AND AVG(e.salary) > 48000;


--