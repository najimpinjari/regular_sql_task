use piramalemployee

--Assignment 18/11

--1. Create a table named "Employees" with columns:

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL
);


--2. Insert three records into the "Employees" table.

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(1, 'John', 'Doe', 'HR', 60000),
(2, 'Jane', 'Smith', 'IT', 70000),
(3, 'Alice', 'Johnson', 'Marketing', 55000);


--3. Update the salary of employees in the "Marketing" department by 10%.

UPDATE Employees
SET Salary = Salary * 1.1
WHERE Department = 'Marketing';


--4. Delete all records from the "Employees" table where the salary is less than 50000.

DELETE FROM Employees
WHERE Salary < 50000;

--5. Create a table named "Projects" with columns:

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    StartDate DATE,
    EndDate DATE
);


--6. Insert two records into the "Projects" table.

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate)
VALUES
(1, 'ProjectA', '2023-01-01', '2023-06-30'),
(2, 'ProjectB', '2023-03-15', '2023-09-30');


--7. Select all employees who are not assigned to any project.

SELECT *
FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM EmployeeProjectAssignment);


--8. Display the total number of employees in each department.

SELECT Department, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY Department;


--9. Find the average salary of all employees.

SELECT AVG(Salary) AS AverageSalary
FROM Employees;


--10. Create a view named "EmployeeSummary" that shows the employee ID, full name, department, and salary for all employees.

CREATE VIEW EmployeeSummary AS
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName, Department, Salary
FROM Employees;





