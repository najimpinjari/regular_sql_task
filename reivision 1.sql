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

	select gender , max(salary) 