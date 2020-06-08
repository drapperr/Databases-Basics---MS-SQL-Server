SELECT TOP(50) E.EmployeeID, CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName,
	CONCAT(M.FirstName, ' ', M.LastName) AS ManagerName,
	d.[Name] AS DepartmentName FROM Employees E 
	JOIN Employees AS M ON E.ManagerID = M.EmployeeID
	JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
	ORDER BY E.EmployeeID
	