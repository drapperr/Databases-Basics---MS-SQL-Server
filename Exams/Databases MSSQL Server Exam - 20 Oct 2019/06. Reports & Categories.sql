SELECT [Description], C.[Name] AS [CategoryName] FROM Reports AS R
JOIN Categories AS C ON C.Id = R.CategoryId
ORDER BY [Description], CategoryName