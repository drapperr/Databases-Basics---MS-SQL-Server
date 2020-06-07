SELECT FirstName, LastName, HireDate,D.[Name] FROM Employees AS E
	JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
	WHERE HireDate > '1.1.1999' AND D.[Name] IN ('Sales', 'Finance')
	ORDER BY HireDate