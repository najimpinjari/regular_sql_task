use piramalemployee

select * from employees0
select * from departments0

--make a index

--Suppose you frequently run a query to retrieve employees based on their department and salary range.
--However, this query takes too long to execute, especially as the size of the dataset grows.
--Your task is to create an index to optimize the performance of this query.

--Create an index that improves the performance of the above query.
--Provide the SQL statement to create the index.


-- Create an index on department_id and salary columns


CREATE INDEX idx_department_salary ON employees0 (department_id, salary);


--In this example, we created an index named idx_department_salary on the employees0 table
--with columns department_id and salary. This index is designed to improve the performance of
--the query that filters employees based on a specific department and salary range.

