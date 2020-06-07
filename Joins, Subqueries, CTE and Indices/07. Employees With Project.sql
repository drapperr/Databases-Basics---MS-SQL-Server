SELECT TOP(5) E.EmployeeID, FirstName, P.[Name] FROM Employees AS E
	JOIN EmployeesProjects AS EP ON EP.EmployeeID = E.EmployeeID
	JOIN Projects AS P ON EP.ProjectID = P.ProjectID
	WHERE P.StartDate > '2002-08-13' AND P.EndDate IS NULL
	ORDER BY E.EmployeeID
