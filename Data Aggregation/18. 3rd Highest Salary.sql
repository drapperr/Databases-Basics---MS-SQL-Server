SELECT DepartmentID, Salary AS [ThirdHighestSalary] FROM (SELECT DISTINCT DepartmentID, Salary ,DENSE_RANK() OVER   
    (PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Rank]  FROM Employees ) AS R
	WHERE [Rank] = 3