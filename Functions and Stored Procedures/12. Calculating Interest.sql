CREATE PROCEDURE usp_CalculateFutureValueForAccount (@accId INT, @inerestRate FLOAT)
AS
BEGIN
	SELECT A.Id AS [Account Id], FirstName, LastName, Balance AS [Current Balance], dbo.ufn_CalculateFutureValue(Balance, @inerestRate, 5) AS [Balance in 5 years] FROM Accounts AS A
	JOIN AccountHolders AS AH ON AH.Id = A.AccountHolderId
	WHERE A.Id = @accId
END