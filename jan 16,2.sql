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

--Find the users who do not own any mobile:

select userperson.name , userperson.email
from userperson
left join mobiles 
on userperson.user__id = mobiles.mobile_id
where mobiles.mobile_id = null

--List the users along with the count of distinct phone numbers they have used for their mobiles:

select userperson.name, userperson.email , COUNT(distinct userperson.phone_num) as distinct_phone_num
from userperson 
join mobiles 
on userperson.user__id = mobiles.mobile_id
group by userperson.name, userperson.email

