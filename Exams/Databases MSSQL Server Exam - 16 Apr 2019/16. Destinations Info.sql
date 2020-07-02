SELECT Destination, COUNT(T.Id) AS [FilesCount] FROM Tickets AS T
RIGHT JOIN Flights AS F ON F.Id =T.FlightId
GROUP BY Destination
ORDER BY [FilesCount] DESC,Destination
