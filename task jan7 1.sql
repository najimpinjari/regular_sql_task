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



--Add a posts table: Create a table to store posts made by users on Facebook.
--The table should have a post_id as the primary key, user_id as a foreign key 
--referencing the users table, 
--content of the post, and the post creation date.

create table posts (
  post_id int primary key,
  user_id int foreign key references users(user_id),
  content text,
  post_date datetime
);

insert into posts values
(1, 1, 'Excited about the latest tech developments!', '2022-01-05 18:30:00'),
(2, 2, 'Just arrived in a beautiful new destination! 🌍 #TravelGoals', '2022-02-20 09:15:00'),
(3, 3, 'Trying out a new healthy recipe today. Cant wait to share it with you all!', '2022-03-25 12:45:00'),
(4, 1, 'Reached a milestone in coding today! #CodingLife', '2022-04-10 16:00:00')



--Create a comments table: Add a table to store comments on posts. 
--This table should have a comment_id as the primary key, post_id as 
--a foreign key referencing the posts table, user_id as a foreign key referencing 
--the users table, and the content of the comment.


create table comments (
  comment_id int primary key,
  post_id int foreign key references posts(post_id),
  user_id int foreign key references users(user_id),
  content text,
  comment_date datetime
);

insert into comments values
(1, 1, 2, 'Great news! Looking forward to your updates.'),
(2, 3, 4, 'That recipe sounds amazing! Share it soon!'),
(3, 4, 3, 'Congratulations on the milestone! #CodingAchievement');
