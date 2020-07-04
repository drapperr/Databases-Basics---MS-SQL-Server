SELECT TOP(5) C.[Name] AS [CategoryName], COUNT(*) AS [ReportsNumber] FROM Reports AS R
JOIN Categories AS C ON R.CategoryId = C.Id
GROUP BY C.[Name]
ORDER BY ReportsNumber DESC,CategoryName