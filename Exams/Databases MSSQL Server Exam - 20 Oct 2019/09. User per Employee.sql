SELECT CONCAT(FirstName,' ',LastName) AS [FullName], COUNT(R.Id) AS [UsersCount] FROM Employees AS E 
LEFT JOIN Reports AS R ON R.EmployeeId= E.Id
LEFT JOIN Users AS U ON R.UserId = U.Id
GROUP BY FirstName,LastName
ORDER BY [UsersCount] DESC, FullName 