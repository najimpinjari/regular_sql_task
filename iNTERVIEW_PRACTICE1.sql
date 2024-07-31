use [practice]

-- Create the table
CREATE TABLE Employes (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Salary INT
);

-- Insert the values
INSERT INTO Employes VALUES
(1, 'Ben', 'Hoskins', 'Male', 70000),
(2, 'Mark', 'Hastings', 'Male', 60000),
(3, 'Steve', 'Pound', 'Male', 45000),
(4, 'dan', 'dikosta', 'Male', 71000),
(5, 'Philip', 'Hastings', 'Male', 45000),
(6, 'Mary', 'Lambeth', 'Female', 30000),
(7, 'Valarie', 'Vikings', 'Female', 35000),
(8, 'John', 'Stanmore', 'Male', 80000);
INSERT INTO Employes VALUES
(9, 'John', 'Stanmore', 'Male', 80000);

select * from Employes
drop table Employes

--How to Delete Duplicates Rows from Table.

with CTE as (
select * ,
ROW_NUMBER() over (partition by firstname, lastname, gender, salary order by id ) as row_num
from Employes
) 
delete from Employes
where id in (select id from CTE where row_num > 1)

--2. How to Find 4th Highest Salary from Employees Table (Explain Different Ways).
--using subquery 

SELECT TOP 1 SALARY
FROM (
SELECT DISTINCT TOP 4 SALARY
FROM Employes
ORDER BY SALARY DESC
) RESULT ORDER BY SALARY--using row number with salaryrank as (select salary ,	ROW_NUMBER() over (order by salary desc) as Row_num 	from Employes)select salary from salaryrank where Row_num = 4 ;--using densrankwith salaryrank as 	(select salary ,		dense_rank() over (order by salary desc ) as rank_new4		from Employes)select salary from salaryrank where rank_new4 = 4 
