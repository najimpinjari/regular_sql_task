use najimpersonal

--todys task demo

create table mobiles(
mobile_id int ,
brand varchar(50),
model varchar(50),
user__id int primary key
)
insert into mobiles values(101, 'redmi','not9',1 ),
(102, 'oppo','a31',2 ),(103, 'aple','a92020',3 ),(104,'onepluse','9pro',1 ),
(105, 'redmi','not9',2 )

create table userperson(
user__id int  foreign key references mobiles(user__id) ,
name varchar(50),
email varchar(50),
phone_num varchar(40)
)
insert into userperson values(1,'sham','sham@123','7620094110'),
(2,'radhe','radhe@123','9623861913'),
(3,'gotya','gotya@123','9665738710'),
(1,'prathm','prahm@123','8308294501'),
(1,'najim','najim@123','8805557493')

select * from userperson
select * from mobiles

--Find the total number of mobiles owned by each user along with their names and email addresses:

select u.name , u.email , COUNT(m.mobile_id) as total_mobile_owned
from userperson u
join mobiles m
on u.user__id = m.user__id 
group by u.name , u.email

--List the users who own more than one mobile:

select userperson.name, userperson.email
from userperson 
join ( 
	select user__id	from mobiles
	group by user__id
	having count(*) > 1
) as multi_mobile_owner
on userperson.user__id = multi_mobile_owner.user__id

--Find the brand and model of the most owned mobile phone:

select brand,model, COUNT(*) as total_owners
from mobiles 
group by brand, model 
order by total_owners desc

