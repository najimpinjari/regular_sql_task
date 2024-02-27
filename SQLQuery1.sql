use ADODOTNET

	select * from Trainer

insert into Trainer value ('atul', 'pune', 2)

create proc uspInsertTrainer
@Name varchar(50) ,@city varchar(50), @Experience int 
as 
begin
	insert into Trainer value (@Name , @city , @Experience)
	return scope_identity()
end

execute uspInsertTrainer @Name = 'atul' , @city = 'pune',@Experience = 3  

select count(Id) from Trainer

	select * from Trainer