use adodotnet

create proc spForSelectName
as 
begin
	select Name from UserTable 
	where Name = 'najim'
end

create proc spforname
as 
begin
	select * from UserTable
end
execute spForSelectName



	insert into UserTable VAlues
	('radhesh',23,'nasik'),
	('prathm',24,'satara'),
	('sham',25,'jalgoan'),
	('jayesh',26,'dhule'),
	('najim',25,'pune'),
	('pathna',23,'pune'),
	('amisha',23,'nasik');


select * from UserTable

CREATE PROCEDURE SelectDistinctValues
    @TableName NVARCHAR(100),
    @ColumnName NVARCHAR(100)
AS
BEGIN
    DECLARE @SqlQuery NVARCHAR(MAX);

    -- Construct the dynamic SQL query
    SET @SqlQuery = 'SELECT DISTINCT ' + QUOTENAME(@ColumnName) + ' FROM ' + QUOTENAME(@TableName);

    -- Execute the dynamic SQL query
    EXEC sp_executesql @SqlQuery;
END;
