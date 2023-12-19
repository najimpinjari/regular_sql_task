use piramalemployee

--make a scelar function 

CREATE FUNCTION ConcatenateStrings(@string1 NVARCHAR(MAX), @string2 NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    RETURN @string1 + ' ' + @string2;
END;
