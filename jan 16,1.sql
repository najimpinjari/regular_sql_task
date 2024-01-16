use najimpersonal

create table users(
user_id int primary key,
username varchar(255),
email varchar(255) unique
)

insert into users values 
(1, 'sham','sham@gmail.com'),
(2,'pratham' , 'pratham1@gmail.com'),
( 3, 'radhesh','radhes2@gmail.com'),
(4, 'gotya', 'gotya3@gmail.com'),
(5,'najim' , 'najim@123gmail.com')

create table facebook (
page_id int primary key,
page_name varchar(255),
user_id int foreign key references users(user_id),
liked_date datetime,
);

insert into facebook values 
(101, 'TechNews', 1, '2022-01-01 12:00:00'),
(102, 'TravelAdventures', 2, '2022-02-15 15:30:00'),
(103, 'HealthyLiving', 1, '2022-03-20 10:45:00'),
(104, 'GourmetRecipes', 3, '2022-04-05 08:00:00')

--SELECT facebook.page_name, users.username, facebook.liked_date

FROM facebook
JOIN users ON facebook.user_id = users.user_id
ORDER BY facebook.liked_date;

--List the Facebook pages along with the usernames of users who liked them,
--ordered by the liked date.

SELECT facebook.page_name, users.username, facebook.liked_date
FROM facebook
JOIN users ON facebook.user_id = users.user_id
ORDER BY facebook.liked_date;


--Find the users who have not liked any Facebook page.

SELECT users.username
FROM users
LEFT JOIN facebook ON users.user_id = facebook.user_id
WHERE facebook.page_id IS NULL;


