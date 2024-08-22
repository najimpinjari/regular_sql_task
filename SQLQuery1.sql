use [sqlrevision]

select * from NewStaf


create procedure SPfind 
as 
begin	
	select * from newstaf
end 

	
execute SPfind

create proc SPfindbygender 
@gender_name varchar(50)
as 
begin 
	select	* from NewStaf where gender	= @gender_name
end 

execute SPfindbygender 'male'

with ctd_delete as (
	select salary ,
		DENSE_RANK() over (order by salary desc ) as thired_salray 
		from NewStaf
)
select salary	
from ctd_delete 
where thired_salray = 2

with ctd_duplicate as(
	select name ,
		ROW_NUMBER() over (partition by name order by name ) as duplicated_delete
		from NewStaf
)
delete from ctd_duplicate
where duplicated_delete > 1


