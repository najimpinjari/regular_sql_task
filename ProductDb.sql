use WEB_API_crudDB
go
select * from Employee

create table Product(
Id int primary key identity ,
Name varchar(50),
Price decimal,
AvailbleQueantity int
)
go
insert into Product values ('Mens Shirt' , 599,10)
go
select * from Product

create table Category(
Id int primary key identity ,
Name varchar(50)
)
select * from Category

Insert into Category values ('Mens Wear'),('Kids Wear')

delete from category 
where id between 3 and 6
go
alter table Product
add CategoryId int foreign key references Category(Id)

select * from Product
select * from Category

update Product set categoryId = 1 where id = 1
