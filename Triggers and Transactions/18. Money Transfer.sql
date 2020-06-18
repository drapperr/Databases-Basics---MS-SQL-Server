CREATE PROCEDURE usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount DECIMAL(20,4))
AS
BEGIN
	BEGIN TRANSACTION
		EXEC usp_WithdrawMoney @SenderId, @Amount
		EXEC usp_DepositMoney @ReceiverId,@Amount
	COMMIT
END