SELECT FirstName, LastName, Age FROM Passengers AS P
LEFT JOIN Tickets AS T ON T.PassengerId = P.Id
WHERE T.Id IS NULL
ORDER BY Age DESC, FirstName, LastName