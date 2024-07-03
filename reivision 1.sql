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

select upper(department_name) from EmployeeDepartment 
select lower(department_name) from EmployeeDepartment 
select len(department_name) from EmployeeDepartment 
select substring(department_name , 1,4) from EmployeeDepartment
select concat(department_name , id ) from EmployeeDepartment 
select replace(department_name , 'IT', 'Information Technology ') from EmployeeDepartment 


SELECT REPLACE(department_name, 'IT', 'IT department') FROM EmployeeDepartment;
SELECT  PATINDEX('%new%', department_name) FROM EmployeeDepartment; 
SELECT LEFT(department_name, 1) FROM EmployeeDepartment ; 
SELECT REVERSE(department_name) FROM EmployeeDepartment; 

 SELECT STUFF(department_name, 2, 2, '***') FROM EmployeeDepartment; 

 SELECT CHARINDEX('IT', department_name) FROM EmployeeDepartment;

select Getdate()  
select Current_timestamp
select Sysdatetime()
select SysDateTimeOffset()
select GetUTCDate()
select SysUTCDateTime()


CREATE FUNCTION GetFullNameById (@employee_id INT)
RETURNS VARCHAR(100)
as 
begin 
	declare @full_name varchar(100)

	select @full_name= name 
	from NewEmployee 
	where id = @employee_id 

	return @full_name
end

select dbo.GetFullNameById(4)

CREATE FUNCTION function_name (parameters) 
RETURNS data_type 
AS						<= Syntax
BEGIN –
 Function logic 
	RETURN result;
END


CREATE FUNCTION GET_GENDER_BY_ID (@id int)
returns varchar(10)
as 
	begin 
		declare @gender varchar(10)
		select @gender = gender 
		from NewEmployee
		where @id = id 
			return @gender
	end
	select dbo.GET_GENDER_BY_ID(3)--f

drop function GET_GENDER_BY_ID


create function get_city_by_id (@id int)
returns table 
as 
return (
		select id, name , city
		from NewEmployee
		where id = @id 
);
select * 
from dbo.get_city_by_id(2)

drop function  GetFullNameById
-- Declare a variable to store the result
DECLARE @full_name VARCHAR(100);

-- Call the scalar function to get the full name for employee ID 3
SET @full_name = dbo.GetFullNameById(3); -- Assuming dbo is the schema where the function is created

-- Output the full name
SELECT @full_name AS FullName;

-- Retrieve full name for employee ID 3 using the function in a SELECT statement
SELECT dbo.GetFullNameById() 




CREATE FUNCTION function_name (parameters) 
RETURNS data_type 
AS
BEGIN -- Function logic 
	RETURN result;
END


CREATE FUNCTION GetEmployeeInfoById (@employee_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT name, salary
    FROM NewEmployee
    WHERE id = @employee_id
);

exec dbo.GetEmployeeInfoById(3)

-- Create a table-valued function to retrieve employees by city
CREATE FUNCTION GetEmployeesByCity (@city_name VARCHAR(100))
RETURNS TABLE
AS RETURN (
    SELECT id, name, gender, salary
    FROM NewEmployee
    WHERE city = @city_name
);

-- Create a table-valued function to retrieve employees by city
CREATE FUNCTION GetEmployeesBy_city (@city_name VARCHAR(233))
RETURNS TABLE
AS
RETURN (
    SELECT id, name, gender, salary
    FROM NewEmployee
    WHERE city = @city_name
);


SELECT id, name, gender, salary
FROM dbo.GetEmployeesBy_city('New York')
FROM dbo.GetEmployeesBy_city('it'),
FROM dbo.GetEmployeesBy_city('New York'); 


DROP proc dbo.GetEmployeesByCity;
-- Example: Delete the GetEmployeesByCity function
DROP FUNCTION dbo.GetEmployeesByCity;


select * from inserted -- errorselect * from NewEmployeelimit = 5;SELECT TOP 5 *
FROM NewEmployee;

CREATE TABLE EmployeeAuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    Action VARCHAR(50),
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Gender CHAR(1),
    Salary DECIMAL(10, 2),
    City VARCHAR(100),
    ActionDate DATETIME DEFAULT GETDATE()
);


CREATE TRIGGER trgEmployeeInsert
ON NewEmployee
AFTER INSERT
AS
BEGIN
    INSERT INTO EmployeeAuditLog (Action, EmployeeID, EmployeeName, Gender, Salary, City)
    SELECT 
        'INSERT' AS Action,
        id AS EmployeeID,
        name AS EmployeeName,
        gender AS Gender,
        salary AS Salary,
        city AS City
    FROM 
        inserted;
END;


INSERT INTO NewEmployee (id, name, gender, salary, city)
VALUES (11, 'Kate Brown', 'F', 79000.00, 'Boston');

delete from NewEmployee where id = 11


select * from newemployee
select * from EmployeeAuditLog


BEGIN TRANSACTION;

-- Update salaries by increasing them by 5%
UPDATE NewEmployee
SET salary = salary * 1.05;

-- Insert into SalaryChangeLog to log the salary change
INSERT INTO SalaryChangeLog (EmployeeID, OldSalary, NewSalary, ChangeDate)
SELECT id, salary / 1.05, salary, GETDATE()
FROM NewEmployee;
ROLLBACK TRANSACTION

COMMIT TRANSACTION;


Read committed 

SELECT 
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS RowNum,
    name, salary
FROM NewEmployee;

WITH RankedEmployees AS (
    SELECT 
        name, 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS SalaryRank
    FROM NewEmployee
)
SELECT name, salary
FROM RankedEmployees
WHERE SalaryRank = 3;


WITH RankedEmployees AS (
    SELECT 
        name, 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS SalaryRank
    FROM NewEmployee
)
SELECT name, salary
FROM RankedEmployees
WHERE SalaryRank = 2;

SELECT MAX(salary) AS MaxSalary
FROM NewEmployee;


select name , salary , city 
	from NewEmployee 
	where id = 1 
