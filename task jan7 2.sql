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



--Let's create a stored procedure that retrieves information about a
--specific user and the Facebook pages they have liked. The procedure will
--take a user_id as input and return the user's username, email, and a list of pages 
--they have liked with the page_id, page_name, and liked_date.


-- Create stored procedure
DELIMITER //

CREATE PROCEDURE GetUserAndPagesLiked(IN in_user_id INT)
BEGIN
  DECLARE v_username VARCHAR(255);
  DECLARE v_email VARCHAR(255);

  -- Get user details
  SELECT username, email INTO v_username, v_email
  FROM users
  WHERE user_id = in_user_id;

  -- Get pages liked by the user
  SELECT f.page_id, f.page_name, f.liked_date
  FROM facebook f
  WHERE f.user_id = in_user_id;

END //

DELIMITER ;



-- Call the stored procedure for user with user_id = 1
CALL GetUserAndPagesLiked(1);
