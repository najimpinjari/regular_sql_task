use piramalemployee

--assignlment 14/11/2023


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


--Problem 1:
--Write a SQL query to retrieve the names of students who have passed with grade 'A' in the 'result' table.


SELECT s.name
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE r.grade = 'A' AND r.passorfale = 'PASS';


--Problem 2:
--Find the average marks of all female students.


SELECT AVG(r.marks) AS avg_marks
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE s.gender = 'female';


--Problem 3:
--Update the result table to set the grade to 'B' for all students who passed with more than 75 marks.

UPDATE result
SET grade = 'B'
WHERE marks > 75 AND passorfale = 'PASS';


--Problem 4:
--Count the number of male students who failed.

SELECT COUNT(*) AS num_failed_male_students
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE s.gender = 'male' AND r.passorfale = 'FAIL';


--Problem 5:
--List the names of students who belong to the city 'Pune' and scored less than 60 marks.

SELECT s.name
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE s.city = 'Pune' AND r.marks < 60;


--Problem 6:
--Calculate the percentage of marks for each student in the 'result' table.

SELECT s.name, (r.marks * 100.0) / 100 AS percentage
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum;


--Problem 7:
--Find the student with the highest marks and display their name and marks.

SELECT TOP 1 s.name, r.marks
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
ORDER BY r.marks DESC;


--Problem 8:
--Calculate the total number of students.

SELECT COUNT(*) AS total_students
FROM students_all;\


--Problem 9:
--List the names of students who passed with grade 'B' or 'A'.

SELECT s.name
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE r.grade IN ('B', 'A') AND r.passorfale = 'PASS';


--Problem 10:
--Find the average marks for each grade.

SELECT r.grade, AVG(r.marks) AS avg_marks
FROM result r
GROUP BY r.grade;
