CREATE FUNCTION ufn_CashInUsersGames (@gameName NVARCHAR(50))
RETURNS TABLE
AS
RETURN SELECT(
		SELECT SUM(Cash) AS [SumCash] FROM (
					SELECT G.[Name],
							UG.Cash,
							ROW_NUMBER() OVER (PARTITION BY G.[Name] ORDER BY UG.CASH DESC) AS [RowNum]
					FROM Games AS G
					JOIN UsersGames AS UG
					ON G.Id = UG.GameId
					WHERE G.[Name] = @gameName) AS [RownNumQuery]
		WHERE [RowNum] % 2 != 0
)