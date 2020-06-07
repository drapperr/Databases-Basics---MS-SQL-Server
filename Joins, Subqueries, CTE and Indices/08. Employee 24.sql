SELECT E.EmployeeID, FirstName, 
	CASE 
		WHEN YEAR(P.StartDate) >= 2005 THEN NULL
		ELSE P.[Name]
	END AS ProjectName
	FROM Employees AS E
	JOIN EmployeesProjects AS EP ON EP.EmployeeID = E.EmployeeID
	JOIN Projects AS P ON EP.ProjectID = P.ProjectID
	WHERE E.EmployeeID = 24