# SQL-ASSIGNMENT
use piramalemployee
go
--
--assignlment 12/11/2023


create table students_all
( rollnum int identity primary key,
name varchar (40),
city varchar(50),
gender varchar(40)
)

insert into students_all values ('vedant','jalgaon','male'),('pratham', 'satara','male'),
('shaym','parola','male'),('prathna','pune','female'),('amisha','nagpur','female')

create table result (
rollnum int  foreign key references students_all(rollnum),
grade varchar(10),
marks int ,
passorfale varchar(10)
)

insert into result values (1, 'A' , 87, 'PASS' ),(2, 'C' , 51, 'FAIL' ),
(3, 'B' , 67, 'PASS' ),(4, 'C' , 43, 'FAIL' ),(5, 'B' , 70, 'PASS' )

SELECT * from students_all
select * from result

--Problem 1:
--Write a query to display the names and grades of all students who passed.

SELECT name, grade
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE passorfale = 'PASS';


--Problem 2:
--Create a query to show the names of students who failed along with their marks.
SELECT name, marks
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE passorfale = 'FAIL';



--Problem 3:
--Retrieve the names of students who scored more than 60 marks.
SELECT name
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE marks > 60;

--Problem 4:
--Show the count of male and female students in the students_all table.
SELECT gender, COUNT(*) as count
FROM students_all
GROUP BY gender;

--Problem 5:
--List the names of students who passed with grade 'A' and have a city containing the letter 'a'.
SELECT s.name, r.grade
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE r.grade = 'A' AND CHARINDEX('a', s.city) > 0;

--Problem 6:
--Display the roll numbers, names, and marks of students who failed.
SELECT s.rollnum, s.name, r.marks
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE passorfale = 'FAIL';

--Problem 7:
--Find the average marks of male and female students separately.
SELECT gender, AVG(marks) as avg_marks
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
GROUP BY gender;

--Problem 8:
--Show the details of students who scored the highest marks along with their grade.
SELECT s.rollnum, s.name, r.marks, r.grade
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
ORDER BY r.marks DESC
LIMIT 1;

--Problem 9:
--List the names of students along with their grades who have the same grade as student 'vedant'.
SELECT s.name, r.grade
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE r.grade = (SELECT grade FROM result WHERE rollnum = 1);

--Problem 10:
--Retrieve the names and cities of students who failed and live in 'pune' or 'nagpur'
SELECT s.name, s.city
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE passorfale = 'FAIL' AND (s.city = 'pune' OR s.city = 'nagpur');
