CREATE PROCEDURE usp_WithdrawMoney (@AccountId INT, @MoneyAmount DECIMAL(20,4))
AS
BEGIN
	IF(@MoneyAmount < 0)
	THROW 51000, 'The MoneyAmount cant be negative.', 1;

	IF(@AccountId NOT IN (SELECT Id FROM Accounts))
	THROW 52000, 'The given AccountId does not exist.', 1; 

	UPDATE Accounts
	SET Balance -= @MoneyAmount
	WHERE Id = @AccountId
END

GO

EXEC usp_WithdrawMoney 5, 25