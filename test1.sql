use [practice]

-- Step 1: Create the table
CREATE TABLE Employees1 (
    ID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender CHAR(1),
    Salary DECIMAL(10, 2)
);

-- Step 2: Insert values into the table, including duplicates
-- Insert new random values into the Employees1 table
INSERT INTO Employees1 (ID, FirstName, LastName, Gender, Salary)
VALUES
    (1, 'Alice', 'Johnson', 'F',  100000),
    (2, 'Bob', 'Williams', 'M',  500000 ),
    (3, 'Carol', 'Brown', 'F',  660000),
    (4, 'David', 'Smith', 'M',  70000),
    (5, 'Eva', 'Davis', 'F',  380000),
    (6, 'ram', 'Miller', 'M',  339000),
    (7, 'Grace', 'Wilson', 'F',  106000),
    (8, 'Henry', 'Moore', 'M',  100900),
    (9, 'Ivy', 'Taylor', 'F',  900000),
    (10, 'Jack', 'Anderson', 'M',  200000);


select * from Employees1
DELETE FROM employees1;

WITH ctedelete AS (
    SELECT 
        ID, 
        FirstName, 
        LastName, 
        Gender, 
        Salary,
        ROW_NUMBER() OVER (PARTITION BY FirstName, LastName, Gender, Salary ORDER BY ID) AS rownumber
    FROM 
        employees1
)
DELETE FROM employees1
WHERE ID IN (
    SELECT ID 
    FROM ctedelete 
    WHERE rownumber > 1
);


with ctedelte as
(
	select FirstName,
		row_number() over( partition by FirstName order by FirstName ) as delete_duplicate 
		from employees1 
)
delete from ctedelte 
where delete_duplicate > 1 

with ctethired as
(
	select Salary ,
		DENSE_RANK() over (order by salary desc ) as thired_high 
		from Employees1
)
select Salary
 from ctethired 

 where thired_high = 2


 --Question: Find all female employees (Gender = 'F').

 select * from Employees1 where Gender = 'f'

 --Question: Get employees with a salary between 100,000 and 500,000.

select firstname, salary from Employees1 where Salary between 100000 and 500000  

--Question: Retrieve all employees sorted by salary in descending order.

select firstname , Salary from Employees1 order by Salary desc 
select * from Employees1 order by Salary desc 

--Question: Count the number of employees for each gender.

select gender , count(*) as employee_count from Employees1 group by gender 

--Question: Find the highest salary in the Employees1 table.

select max(salary) as max_salary from Employees1


select avg(salary) as avg_salary from Employees1
