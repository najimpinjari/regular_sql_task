use piramalemployee

select * from employees0
select * from departments0

--Write a query to find the department with the highest average salary.
--Include the department name and the average salary.

SELECT 
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments0 d
JOIN employees0 e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY average_salary DESC
LIMIT 1;


--Write a query to calculate the total salary expense for each department. 
--Include the department name and the total salary expense.

SELECT 
    d.department_name,
    SUM(e.salary) AS total_salary_expense
FROM departments0 d
JOIN employees0 e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;


--Write a query to find the employee with the highest salary in each department.
--Include the department name, employee name, and salary.

SELECT 
    d.department_name,
    e.first_name,
    e.last_name,
    e.salary
FROM (
    SELECT 
        department_id,
        MAX(salary) AS max_salary
    FROM employees0
    GROUP BY department_id
) max_salaries
JOIN employees0 e ON max_salaries.department_id = e.department_id AND max_salaries.max_salary = e.salary
JOIN departments0 d ON e.department_id = d.department_id;


