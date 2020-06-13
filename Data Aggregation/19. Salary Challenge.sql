SELECT TOP(10) FirstName, LastName, E.DepartmentID FROM Employees AS E 
	JOIN (SELECT DepartmentID, AVG(Salary) AS AVGSalary FROM Employees AS E
	GROUP BY DepartmentID) AS AVGS ON E.DepartmentID = AVGS.DepartmentID
	WHERE E.Salary > AVGS.AVGSalary