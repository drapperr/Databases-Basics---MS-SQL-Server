SELECT Name,Seats, ISNULL(COUNT(T.PassengerId) ,0) AS [Passengers Count] FROM Planes AS P
LEFT JOIN Flights AS F ON F.PlaneId=P.Id
LEFT JOIN Tickets AS T ON T.FlightId=F.Id
GROUP BY Name,Seats
ORDER BY [Passengers Count] DESC, Name,Seats