SELECT G.[Name] AS [Game],
		GT.[Name] AS [Game Type],
		U.Username,
		UG.[Level],
		UG.Cash,
		C.[Name] AS [Character]
		FROM Games AS G
JOIN UsersGames AS UG ON UG.GameId = G.Id
JOIN Users AS U ON U.Id = UG.UserId
JOIN GameTypes AS GT ON GT.Id = G.GameTypeId
JOIN Characters AS C ON C.Id = UG.CharacterId
ORDER BY [Level] DESC,Username,Game