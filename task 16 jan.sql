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


--Retrieve the usernames and page names of users who have liked a Facebook page.

SELECT users.username, facebook.page_name
FROM users
JOIN facebook ON users.user_id = facebook.user_id;


--Find the number of likes each Facebook page has received.

SELECT page_name, COUNT(*) AS like_count
FROM facebook
GROUP BY page_name;


---Update the email address of the user with user_id 2 to 'pratham_updated@gmail.com'.

UPDATE users
SET email = 'pratham_updated@gmail.com'
WHERE user_id = 2;
