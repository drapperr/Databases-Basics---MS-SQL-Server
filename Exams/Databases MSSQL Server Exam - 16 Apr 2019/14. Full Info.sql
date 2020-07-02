SELECT CONCAT(FirstName, ' ', LastName) AS [Full Name],
		P.Name AS [Plane Name],
		CONCAT(Origin,' - ' ,Destination) AS [Trip],
		LT.Type AS [Luggage Type] 
		FROM Tickets AS T
JOIN Flights AS F ON F.Id = T.FlightId
JOIN Planes AS P ON P.Id =F.PlaneId
JOIN Luggages AS L ON L.Id = T.LuggageId
JOIN LuggageTypes AS LT ON LT.Id = L.LuggageTypeId
JOIN Passengers AS PA ON PA.Id = T.PassengerId
ORDER BY [Full Name],[Plane Name],Origin,Destination,[Luggage Type]
