use ADODOTNET

	create table UserTable (
	Id int primary key identity ,
	Name Nvarchar(100),
	Age int,
	city Nvarchar(100)
	)
	go

	insert into UserTable VAlues
	('radhesh',23,'nasik'),
	('prathm',24,'satara'),
	('sham',25,'jalgoan'),
	('jayesh',26,'dhule'),
	('najim',25,'pune'),
	('pathna',23,'pune'),
	('amisha',23,'nasik');

select * from UserTable


--2)Create dynamic  stored procedure takes a @TableName and a @columnName
--as parameters, and it selects all distinct values from that column in the specified table.

--first create store procedure for the task

create procedure spSelectDistinctValues 

	@TableName nvarchar(100),  -- decraring a variable 
	@ColumnName nvarchar(100)	--declaring a variable 

as	
begin
	declare @SqlQuery nvarchar(max)

	set @SqlQuery = 'Select Distinct' + QUOTENAME(@ColumnName) +'from' + QUOTENAME(@TableName)
	
	-- for execcuting the dynamic query		

	exec sp_executesql @SqlQuery;
end;


execute spSelectDistinctValues @TableName = 'UserTable' ,@ColumnName = 'age'