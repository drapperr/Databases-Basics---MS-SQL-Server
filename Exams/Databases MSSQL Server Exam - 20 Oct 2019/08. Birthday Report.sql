SELECT Username, C.[Name] AS [CategoryName] FROM Reports AS R
JOIN Categories AS C ON C.Id = R.CategoryId
JOIN Users AS U ON U.Id = R.UserId
WHERE FORMAT(OpenDate, 'dd-MM') =  FORMAT(Birthdate, 'dd-MM')
ORDER BY Username, CategoryName