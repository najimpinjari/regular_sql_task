use [najimpersonal]


-- Create the table
CREATE TABLE NewEmployee (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    gender CHAR(1),
    salary DECIMAL(10, 2),
    city VARCHAR(100)
);

-- Insert 10 records
INSERT INTO NewEmployee (id, name, gender, salary, city) VALUES
(1, 'Alice Johnson', 'F', 70000.00, 'New York'),
(2, 'Bob Smith', 'M', 80000.00, 'Los Angeles'),
(3, 'Carol White', 'F', 75000.00, 'Chicago'),
(4, 'David Brown', 'M', 85000.00, 'Houston'),
(5, 'Eva Green', 'F', 72000.00, 'Phoenix'),
(6, 'Frank Black', 'M', 78000.00, 'Philadelphia'),
(7, 'Grace Lee', 'F', 76000.00, 'San Antonio'),
(8, 'Henry Adams', 'M', 83000.00, 'San Diego'),
(9, 'Ivy Davis', 'F', 71000.00, 'Dallas'),
(10, 'Jack Wilson', 'M', 82000.00, 'San Jose');


select * from NewEmployee

	select * from NewEmployee order by gender

	select count(id) from NewEmployee

	select max(salary) as max_salary from NewEmployee 

	select min(salary) as min_salary from NewEmployee

	select avg(salary) as avg_salary from NewEmployee 

	select sum(salary)  as total_salary from NewEmployee 

	select city from NewEmployee where name = 'Alice Johnson'

	select city from NewEmployee group by gender

	select city , count(*) as total_num
	from NewEmployee 
	group by city

	select city, sum(salary) as total_expenditure
	from NewEmployee 
	group by city
	order by  total_expenditure

	select gender ,avg(salary) as avg_salary
	from NewEmployee 
	group by gender 

	select gender , count(*) as total_count_gender_vise
	from NewEmployee 
	group by gender

	select  gender , max(salary) as max_salary
	from NewEmployee 
	group by gender

	--Q: Which cities have a total salary expenditure greater than $75,000?

	select city , max(salary) as totol_slary
	from NewEmployee  
	group by city
	having max(salary) > 75000

	--Q: Which genders have an average salary greater than $75,000?

	select gender , avg(salary)
	from NewEmployee  
	group by gender 
	having avg(salary) > 75000;

	--Retrieve the details of employees whose salaries are above the average salary of all employees.

select * 
from NewEmployee 
where salary > (select avg(salary) from NewEmployee)


--Retrieve the details of employees who earn more than the maximum salary in the 'San Jose' city.

select * 
from NewEmployee 
where salary > (select max(salary)from NewEmployee where city = 'San Jose' )

--List the names of employees who live in cities where the total salary expenditure is less than $150,000.

select name 
from NewEmployee 
where city in (select city from NewEmployee group by city having sum(salary) < 150000)

--Find the details of employees who have the highest salary in their respective cities.

select * city, salary 
from NewEmployee 
where in (select city , max(salary) from NewEmployee group by city )

select SCOPE_IDENTITY()

select 
	name ,
	gender ,
	case
		when gender = 'M' then 'male'
		when gender = 'F' then 'female'
		else 'other '
	end as gender_full
from NewEmployee

-- Create the EmployeeDepartment table
CREATE TABLE EmployeeDepartment (
    id INT PRIMARY KEY,
    employee_id INT,
    department_name VARCHAR(100),
    FOREIGN KEY (employee_id) REFERENCES NewEmployee(id)
);

-- Insert records into EmployeeDepartment
INSERT INTO EmployeeDepartment (id, employee_id, department_name) VALUES
(1, 1, 'Marketing'),
(2, 2, 'Engineering'),
(3, 3, 'Finance'),
(4, 4, 'Operations'),
(5, 5, 'HR'),
(6, 6, 'Sales'),
(7, 7, 'IT'),
(8, 8, 'Research'),
(9, 9, 'Customer Support'),
(10, 10, 'Product Development');


select * from NewEmployee 
select * from EmployeeDepartment

--Returns rows when there is a match in both tables.

select n.id , n.name , n.salary , e.department_name 
from NewEmployee n 
inner join EmployeeDepartment e
on n.id = e.employee_id 

--Returns all rows from the left table (NewEmployee), and the matched rows from the
--right table (EmployeeDepartment). Returns null on the right side when there is no match.

select n.id , n.name , n.salary , e.department_name 
from NewEmployee n 
left join EmployeeDepartment  e 
on n.id = e.employee_id 

-- Basic Right Join
SELECT ne.id, ne.name, ed.department_name
FROM NewEmployee ne
RIGHT JOIN EmployeeDepartment ed 
ON ne.id = ed.employee_id;

--Returns the Cartesian product of the two tables, i.e., all possible combinations of rows.

select n.name as new_name , e.department_name as new_dep 
from NewEmployee n 
cross join EmployeeDepartment e

--Returns all rows when there is a match in either table. If there is no match, 
--the result is null on the side that lacks a match.

select n.name , n.city , n.gender , e.department_name , e.employee_id 
from NewEmployee  n 
full outer join EmployeeDepartment e 
on e.id  = n.id 
	

select id,name , isnull(gender , 'not Specify') as no_gender  
from NewEmployee 

select id, name , coalesce(salary ,0 ) as salary
from NewEmployee 

	create proc EmpGender 
	@gender_name varchar(50)
	as 
	begin 
		select * from NewEmployee where gender = @gender_name
	end

	execute EmpGender  'm'

	-- Create a stored procedure with parameters to get employees by city
CREATE PROCEDURE GetEmployeesByCity
    @city VARCHAR(100)
AS
BEGIN
    SELECT * FROM NewEmployee WHERE city = @city;
END;


execute GetEmployeesByCity 'New York'

select * from NewEmployee 