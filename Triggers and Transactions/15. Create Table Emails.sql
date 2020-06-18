CREATE TABLE NotificationEmails(
	Id INT PRIMARY KEY IDENTITY,
	Recipient INT NOT NULL,
	[Subject] VARCHAR(MAX),
	Body VARCHAR(MAX)
)
GO

CREATE TRIGGER CreateEmailForLogs
ON Logs
AFTER INSERT
AS
	INSERT INTO NotificationEmails(Recipient, [Subject], Body)
	VALUES(
	(SELECT AccountId FROM inserted),
	CONCAT('Balance change for account: ', (SELECT AccountId FROM inserted)),
	CONCAT('On ', GETDATE(), ' your balance was changed from', (SELECT OldSum FROM inserted), ' to', (SELECT NewSum FROM inserted), '.')
	)