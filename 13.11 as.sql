use piramalemployee

--assignlment 13/11/2023


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


--problems 1/10

--Question: Retrieve the names of students who have the highest grade in each city.

--WITH RankedGrades AS (
    SELECT name, grade, city,
           ROW_NUMBER() OVER (PARTITION BY city ORDER BY grade DESC) as rank
    FROM students_all s
    JOIN result r ON s.rollnum = r.rollnum
)
SELECT name, grade, city
FROM RankedGrades
WHERE rank = 1;


--Question: Calculate the average marks of students, excluding the top 10% and bottom 10%.

WITH MarkPercentiles AS (
    SELECT marks,
           PERCENTILE_CONT(0.1) WITHIN GROUP (ORDER BY marks) OVER () as lower_bound,
           PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY marks) OVER () as upper_bound
    FROM result
)
SELECT AVG(marks) as average_marks
FROM MarkPercentiles
WHERE marks > lower_bound AND marks < upper_bound;


--Question: Find the top 3 cities with the highest percentage of students who passed.

WITH PassPercentage AS (
    SELECT city, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM result WHERE passorfale = 'PASS') as pass_percentage
    FROM students_all s
    JOIN result r ON s.rollnum = r.rollnum
    WHERE passorfale = 'PASS'
    GROUP BY city
)
SELECT city, pass_percentage
FROM PassPercentage
ORDER BY pass_percentage DESC
LIMIT 3;



--Question: Identify students who have consecutive grades (e.g., A, B, C).

WITH GradeSequences AS (
    SELECT name, grade,
           LAG(grade) OVER (PARTITION BY name ORDER BY grade) as prev_grade,
           LEAD(grade) OVER (PARTITION BY name ORDER BY grade) as next_grade
    FROM students_all s
    JOIN result r ON s.rollnum = r.rollnum
)
SELECT name, grade
FROM GradeSequences
WHERE grade = next_grade AND next_grade = prev_grade;


--Question: Calculate the cumulative percentage of students passing as the roll numbers increase.

WITH CumulativePassPercentage AS (
    SELECT r.rollnum, COUNT(*) * 100.0 / r.rollnum as cumulative_percentage
    FROM result r
    JOIN students_all s ON r.rollnum = s.rollnum
    WHERE passorfale = 'PASS'
    GROUP BY r.rollnum
)
SELECT rollnum, cumulative_percentage
FROM CumulativePassPercentage
ORDER BY rollnum;


--Question: Retrieve the names and grades of students who passed.

SELECT name, grade
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
WHERE passorfale = 'PASS';

--Question: Calculate the average marks of male and female students separately.

	SELECT gender, AVG(marks) as average_marks
FROM students_all s
JOIN result r ON s.rollnum = r.rollnum
GROUP BY gender;



