USE b22_authenticationDB
go
select * from Roles
select * from UserRoles
select * from Users
select * from Product

create table Product (
ProductId int primary key identity,
Name varchar(500),
Price int,
AddDate datetime2
)