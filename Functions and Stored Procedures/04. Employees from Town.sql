CREATE PROCEDURE usp_GetEmployeesFromTown @townName NVARCHAR(50)
AS
BEGIN
	SELECT FirstName, LastName FROM Employees E
	JOIN Addresses AS A ON E.AddressID = A.AddressID
	JOIN Towns AS T ON A.TownID = T.TownID
	WHERE T.[Name] = @townName
END

EXEC usp_GetEmployeesFromTown 'Sofia'