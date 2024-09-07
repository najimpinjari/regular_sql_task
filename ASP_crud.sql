use Crud_ASP


CREATE TABLE Employeesnew (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Gender varchar(10) NOT NULL,
    Age INT NOT NULL,
    Designation NVARCHAR(100) NOT NULL,
    City NVARCHAR(100) NOT NULL
);

INSERT INTO Employeesnew (Name, Gender, Age, Designation, City)
VALUES 
('John Doe', 'Male', 30, 'Software Developer', 'Mumbai'),
('Jane Smith', 'Female', 28, 'Project Manager', 'Pune'),
('Alice Johnson', 'Female', 35, 'Business Analyst', 'Delhi'),
('Bob Brown', 'Male', 40, 'UX Designer', 'Bangalore'),
('Charlie Davis', 'Male', 25, 'Intern', 'Hyderabad');


CREATE PROCEDURE spAddEmployee
    @Name NVARCHAR(100),
    @Gender VARCHAR(10),
    @Age INT,
    @Designation NVARCHAR(100),
    @City NVARCHAR(100)
AS
BEGIN
    INSERT INTO Employeesnew (Name, Gender, Age, Designation, City)
    VALUES (@Name, @Gender, @Age, @Designation, @City);
END;

CREATE PROCEDURE spUpdateEmployee
    @Id INT,
    @Name NVARCHAR(100),
    @Gender VARCHAR(10),
    @Age INT,
    @Designation NVARCHAR(100),
    @City NVARCHAR(100)
AS
BEGIN
    UPDATE Employeesnew
    SET
        Name = @Name,
        Gender = @Gender,
        Age = @Age,
        Designation = @Designation,
        City = @City
    WHERE
        Id = @Id;
END;


CREATE PROCEDURE spDeleteEmployee
    @Id INT
AS
BEGIN
    DELETE FROM Employeesnew
    WHERE Id = @Id;
END;


CREATE PROCEDURE spGetAllEmployees
AS
BEGIN
    SELECT *  FROM Employeesnew;
END;



select * from Employeesnew

