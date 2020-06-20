SELECT [Email Provider], COUNT(Id) AS [Number Of Users] FROM ( SELECT Id, RIGHT(Email, LEN(Email) - CHARINDEX('@', Email)) AS [Email Provider] FROM Users) AS R
GROUP BY [Email Provider]
ORDER BY [Number Of Users] DESC, [Email Provider]