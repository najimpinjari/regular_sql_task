use piramalemployee

--This version includes the creation of the scalar
--function and a brief example demonstrating how to use it.


CREATE FUNCTION ConcatenateStrings(@string1 NVARCHAR(MAX), @string2 NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    RETURN @string1 + ' ' + @string2;
END;

-- Example of using the scalar function
DECLARE @output NVARCHAR(MAX);
SET @output = dbo.ConcatenateStrings('Hello', 'World');
SELECT @output AS Result;
