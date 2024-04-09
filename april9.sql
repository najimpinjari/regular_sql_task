use ADODOTNET

CREATE PROCEDURE InsertCustomer
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Customers (FirstName, LastName, Email)
    VALUES (@FirstName, @LastName, @Email);
END




EXEC InsertCustomer 'John', 'Doe', 'john.doe@example.com';
