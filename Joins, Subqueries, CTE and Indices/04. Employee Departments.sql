SELECT TOP(5) EmployeeID, FirstName, Salary, D.[Name] FROM Employees AS E
	JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
	WHERE Salary > 15000
	ORDER BY E.DepartmentID