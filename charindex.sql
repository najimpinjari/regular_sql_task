use piramalemployee

declare @email varchar(100) = 'vihaan@gmail.com'
print charindex('@', @email)
if charindex('@', @email) != 0
print 'VALID EMAIL'
else
print 'INVALID EMAIL'