use piramalemployee

--pivot

-- Pivot the average salary of employees for each department
SELECT
    department_name,
    AVG(CASE WHEN employee_id = 101 THEN salary END) AS john_salary,
    AVG(CASE WHEN employee_id = 102 THEN salary END) AS jane_salary,
    AVG(CASE WHEN employee_id = 103 THEN salary END) AS robert_salary,
    AVG(CASE WHEN employee_id = 104 THEN salary END) AS emily_salary,
    AVG(CASE WHEN employee_id = 105 THEN salary END) AS michael_salary
FROM employees0
JOIN departments0 ON employees0.department_id = departments0.department_id
GROUP BY department_name;
