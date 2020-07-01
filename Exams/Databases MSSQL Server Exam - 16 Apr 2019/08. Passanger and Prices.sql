SELECT TOP(10) FirstName, LastName, Price FROM Passengers AS P
JOIN Tickets AS T ON T.PassengerId = P.Id
ORDER BY Price DESC, FirstName, LastName