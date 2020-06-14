CREATE PROCEDURE usp_GetTownsStartingWith @str VARCHAR(50)
AS 
BEGIN
	SELECT [Name] AS [Town] FROM Towns
		WHERE [Name] LIKE @str + '%'
END

EXEC usp_GetTownsStartingWith 'b'