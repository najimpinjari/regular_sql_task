use piramalemployee

select * from employees0
select * from departments0

-- Let's create a stored procedure that retrieves
--the employees from a specified department along with their ranking based on salary. 
--We'll create a stored procedure that takes a department ID as a parameter and returns
--the relevant information.



-- Create the stored procedure

CREATE PROCEDURE GetEmployeesWithRanking(IN departmentId INT)
BEGIN
    SELECT 
        employee_id, 
        first_name, 
        last_name, 
        salary, 
        RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees0
    WHERE department_id = department_id;
END 


-- Call the stored procedure with department ID 2 as an example
CALL GetEmployeesWithRanking(2);

