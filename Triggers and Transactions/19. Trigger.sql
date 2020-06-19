CREATE OR ALTER TRIGGER CheckLevel
ON UserGameItems
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @MinLevel INT = (SELECT TOP(1) MinLevel FROM inserted AS UGI
							JOIN Items AS I ON I.Id = UGI.ItemId
							JOIN UsersGames AS UG ON UG.Id = UGI.UserGameId)
	DECLARE @UserLevel INT = (SELECT TOP(1) [Level] FROM inserted AS UGI
							JOIN Items AS I ON I.Id = UGI.ItemId
							JOIN UsersGames AS UG ON UG.Id = UGI.UserGameId)

	IF (@UserLevel < @MinLevel)
	THROW 51000, 'User cant take this item', 1
END

GO

UPDATE UsersGames
SET Cash += 50000
WHERE Id IN (SELECT UG.Id FROM UsersGames AS UG
JOIN Games AS G ON G.Id= UG.GameId
WHERE G.[Name] = 'Bali')