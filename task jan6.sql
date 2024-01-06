use dataLemur

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


select * from users 
select * from facebook

--Write a query to retrieve the usernames and email
--addresses of users who have liked at least one Facebook page.

select u.username , u.email 
from users u
join facebook f 
on u.user_id = f.user_id

--Find the total number of Facebook pages liked by each user. 
--Include users even if they have not liked any pages, displaying 0 for those users.

select u.user_id , u.username , count( f.page_id ) as total_like 
from users u
left join facebook f 
on u.user_id = f.user_id
group by u.user_id , u.username 
	
--Find users who have not liked any Facebook pages.

select u.user_id , u.username
from users u 
left join facebook f 
on u.user_id = f.user_id
where f.user_id is null



--List the usernames of users who liked a Facebook page with the name 'TechNews'.


select u.username
from users u 
join facebook f
on u.user_id = f.user_id
where f.page_name  = 'TechNews'

--Find the user who liked the most Facebook pages, along with the count of pages liked.

select users.user_id , users.username , count(facebook.page_id) as total_likes
from users 
left join facebook 
on users.user_id = facebook.user_id
group by users.user_id, users.username	
order by total_likes

select * from users 
select * from facebook
--List the usernames of users who liked a Facebook page in the year 2022.
select users.username
from users 
right join facebook 
on users.user_id = facebook.user_id
where year( facebook.liked_date) = 2022


--Find the users who have liked the same Facebook page as user_id = 1.

select u.username
from users u 
join facebook f1 on u.user_id = f1.user_id
join facebook f2 on u.user_id = f2.user_id
where f1.user_id = 1 and f2.user_id	!= 1;


--List the usernames of users who have liked at least two different Facebook pages.

select u.username
from users u
join facebook f 
on u.user_id = f.user_id
group by u.user_id, u.username
having count ( distinct f.page_id) >= 2 ;

