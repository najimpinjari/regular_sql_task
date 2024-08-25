use [sqlrevision]

select * from NewStaf

select max(salary) from NewStaf where salary <
(select max(salary) from NewStaf where salary  <
(select max(salary) from NewStaf ))

with ctesalary as (
	select salary ,
	DENSE_RANK() over (order by salary desc ) as thired_high
	from NewStaf
)
select salary	
from ctesalary
where thired_high = 3

with ctedelete as(
	select name ,
	ROW_NUMBER() over (partition by name order by name ) as delete_thired
	from NewStaf
)
delete from ctedelete
where delete_thired > 1

--2. Find Employees with the Highest Salary in Each Department:

select dipartment , max(salary) 
from NewStaf
group by dipartment


--3. Find the Total Number of Employees in Each Department:

select dipartment , count(*) as totoal_count
from NewStaf
group by dipartment

--4. Find Employees Whose Salary is Above the Average Salary:

select * 
from NewStaf
where salary > (select avg(salary) from NewStaf)

--5. Retrieve Duplicate Records from a Table:

select name , gender , count(*)
from NewStaf
group by name , gender 
having count(*) > 1;

--6. Delete Duplicate Records from a Table:

delete from NewStaf
where id not in 
	(
	select min(id)
	from NewStaf
	group by name , gender , salary
	)

--7. Find the 2nd Lowest Salary:

select min(salary)
from NewStaf
where salary >(select min(salary) from NewStaf)

--8. Display Employees Who Do Not Have a Department:

select * from NewStaf
where dipartment is null

---9. Find the Employee with the Maximum Salary:

select * from NewStaf
where salary = ( select max(salary) from NewStaf)

--10. Find the Number of Employees in the Organization:

select count(*)
from NewStaf

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');


CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Salary INT,
    DepartmentID int foreign key references departments(DepartmentID)
);


INSERT INTO Employees (ID, FirstName, LastName, Gender, Salary, DepartmentID)
VALUES 
(1, 'Ben', 'Hoskins', 'Male', 70000, 1),
(2, 'Mark', 'Hastings', 'Male', 60000, 2),
(3, 'Steve', 'Pound', 'Male', 45000, 3),
(4, 'Ben', 'Hoskins', 'Male', 70000, 1),
(5, 'Philip', 'Hastings', 'Male', 45000, 2),
(6, 'Mary', 'Lambeth', 'Female', 30000, 4),
(7, 'Valarie', 'Vikings', 'Female', 35000, 4),
(8, 'John', 'Stanmore', 'Male', 80000, 3);


--1. Find the Fourth Highest Salary:

	select salary 
	from(
		select distinct salary 
		from Employees
		order by salary desc 
		limit 3 ,1 ) as subquery 


	--2. List All Employees Along with Their Department Names:

	select e.firstname , e.lastname , d.departmentname 
	from Employees e 
	join Departments d 
	on e.DepartmentID = d.DepartmentID 