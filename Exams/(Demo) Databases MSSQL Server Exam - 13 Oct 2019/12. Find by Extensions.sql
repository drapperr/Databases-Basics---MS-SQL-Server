CREATE PROCEDURE usp_FindByExtension(@extension VARCHAR(MAX))
AS
BEGIN 
	SELECT Id, Name, CONCAT(Size,'KB') AS [Size] FROM Files
	WHERE RIGHT(Name,LEN(Name)-CHARINDEX('.',Name)) = @extension
	ORDER BY Id,Name,Size DESC
END

EXEC usp_FindByExtension 'txt'