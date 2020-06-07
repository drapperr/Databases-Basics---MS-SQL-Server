SELECT DISTINCT TOP(3) E.EmployeeID, E.FirstName FROM Employees AS E
	LEFT JOIN EmployeesProjects AS P ON E.EmployeeID = P.EmployeeID
	WHERE ProjectID IS NULL
	ORDER BY E.EmployeeID
	