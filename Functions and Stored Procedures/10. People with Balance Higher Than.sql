CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan (@number DECIMAL(18,2))
AS
BEGIN
	SELECT FirstName, LastName FROM Accounts AS A
	JOIN AccountHolders AS AH ON AH.Id = A.AccountHolderId
	GROUP BY FirstName, LastName
	HAVING SUM(Balance) > @number
	ORDER BY FirstName, LastName
END
