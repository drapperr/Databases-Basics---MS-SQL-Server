SELECT FirstName, LastName, COUNT(Origin+Destination) AS [Total Trips] FROM Passengers AS P
LEFT JOIN Tickets AS T ON T.PassengerId = P.Id
LEFT JOIN Flights AS F ON F.Id = T.FlightId
GROUP BY FirstName, LastName
ORDER BY [Total Trips] DESC,FirstName,LastName