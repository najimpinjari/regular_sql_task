use ADODOTNET

-- Creating the first table: School
CREATE TABLE School (
    SchoolID INT PRIMARY KEY,
    SchoolName VARCHAR(50),
    Location VARCHAR(50)
);

-- Creating the second table: Teacher
CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(50),
    SchoolID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (SchoolID) REFERENCES School(SchoolID)
);

-- Inserting sample values into School table
INSERT INTO School (SchoolID, SchoolName, Location)
VALUES 
    (1, 'ABC School', 'City A'),
    (2, 'XYZ School', 'City B'),
    (3, 'PQR School', 'City C');

-- Inserting sample values into Teacher table
INSERT INTO Teacher (TeacherID, TeacherName, SchoolID, Salary)
VALUES
    (101, 'John Doe', 1, 50000.00),
    (102, 'Jane Smith', 2, 55000.00),
    (103, 'Michael Johnson', 1, 52000.00),
    (104, 'Emily Brown', 3, 53000.00),
    (105, 'David Wilson', 1, 54000.00);


	-- find max salary 

	select max(Salary)as max_salary
	from Teacher

	--find the second max salary 
	
	select max(Salary) as second_max_salary from Teacher
	where Salary < ( select max(Salary)from Teacher )

	--find third 

	select max(Salary) as third_max_Salary from Teacher	
	where Salary <(select max(Salary) from Teacher
	where Salary < (select max(Salary) from Teacher))

	--same output using ranking funtion 

	with third_max_Salary as(
	select Salary, 
		ROW_NUMBER()over (order by Salary desc) as third_Salary
		from Teacher
	)
	select Salary from third_max_Salary
	where third_Salary = 3;