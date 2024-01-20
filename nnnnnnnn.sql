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


--List the users who have liked more than one Facebook page.

SELECT users.username
FROM users
JOIN (
    SELECT user_id
    FROM facebook
    GROUP BY user_id
    HAVING COUNT(*) > 1
) AS users_with_multiple_likes ON users.user_id = users_with_multiple_likes.user_id;


--Find the users who have liked all the Facebook pages.

SELECT u.username
FROM users u
WHERE NOT EXISTS (
    SELECT f.page_id
    FROM facebook f
    WHERE NOT EXISTS (
        SELECT 1
        FROM facebook liked_pages
        WHERE liked_pages.user_id = u.user_id
          AND liked_pages.page_id = f.page_id
    )
);


--Retrieve the Facebook pages that have been liked by users with consecutive user_ids (no gaps).

SELECT f.page_name
FROM facebook f
WHERE NOT EXISTS (
    SELECT 1
    FROM facebook missing_user
    WHERE missing_user.user_id = f.user_id + 1
) OR f.user_id = (SELECT MAX(user_id) FROM users);


--Find the users who liked a Facebook page within 5 minutes of registering.

SELECT u.username, f.page_name, f.liked_date
FROM users u
JOIN facebook f ON u.user_id = f.user_id
WHERE TIMESTAMPDIFF(MINUTE, u.register_date, f.liked_date) <= 5;


--List the users who have liked all the pages that were liked by user 'sham'.

SELECT DISTINCT u.username
FROM users u
JOIN facebook f ON u.user_id = f.user_id
WHERE NOT EXISTS (
    SELECT 1
    FROM facebook f_sham
    WHERE f_sham.user_id = (SELECT user_id FROM users WHERE username = 'sham')
      AND NOT EXISTS (
          SELECT 1
          FROM facebook f_user
          WHERE f_user.user_id = u.user_id
            AND f_user.page_id = f_sham.page_id
      )
);
