SELECT CONCAT(FirstName, ' ', LastName) AS [Full Name],
				Origin,
				Destination
			FROM Passengers AS P
JOIN Tickets AS T ON T.PassengerId = P .Id
JOIN Flights AS F ON F.Id = T.FlightId
ORDER BY [Full Name], Origin, Destination