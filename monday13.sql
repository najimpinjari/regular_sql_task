use WEB_API_crudDB

select * from student 


CREATE TABLE Employeetbl (
    id INT PRIMARY KEY identity,
    name VARCHAR(255),
    gender VARCHAR(10),
    age INT,
    designation VARCHAR(255),
    salary int
);

INSERT INTO Employeetbl (name, gender, age, designation, salary) 
VALUES 
('arbaj', 'male', 24, 'manager', 50000),
('rupesh', 'male', 29, 'Jrmaneger', 40000),
('najim', 'male', 24, 'intern', 20000),
('shifa', 'female', 24, 'HR', 40000);

select * from Employeetbl
