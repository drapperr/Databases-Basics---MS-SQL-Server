SELECT FirstName, LastName, Destination, Price FROM (SELECT *, DENSE_RANK () OVER (PARTITION BY PassengerId ORDER BY Price DESC)  AS [PriceRank] FROM Tickets) AS T
JOIN Flights AS F ON F.Id = T.FlightId
JOIN Passengers AS PA ON PA.Id = T.PassengerId
WHERE PriceRank = 1
ORDER BY Price DESC,FirstName, LastName, Destination
