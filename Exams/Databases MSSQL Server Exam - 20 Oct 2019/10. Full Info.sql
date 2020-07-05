SELECT CASE 
			WHEN EmployeeId IS NULL THEN 'None' 
			ELSE CONCAT(FirstName, ' ', LastName)
		END AS [Employee],
		CASE 
			WHEN E.DepartmentId IS NULL THEN 'None'
			ELSE D.[Name]
		END AS [Department],
		c.[Name] AS Category,
		[Description],
		FORMAT(OpenDate, 'dd.MM.yyyy') AS [OpenDate],
		S.[Label] AS [Status],
		U.[Name] AS [User]
FROM Reports AS R
LEFT JOIN Employees AS E ON E.Id = R.EmployeeId
LEFT JOIN Departments AS D ON D.Id = E.DepartmentId
JOIN Categories AS C ON C.Id = R.CategoryId
JOIN [Status] AS S ON S.Id = R.StatusId
JOIN Users AS U ON U.Id = R.UserId
ORDER BY FirstName DESC,LastName DESC, Department, Category, [Description], OpenDate,[Status],[User]