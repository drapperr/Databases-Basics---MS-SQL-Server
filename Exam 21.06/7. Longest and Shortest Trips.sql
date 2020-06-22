SELECT A.Id AS [AccountId],
	CONCAT(FirstName,' ',LastName) AS [FullName] ,
	MAX(DATEDIFF(DAY, ArrivalDate,ReturnDate)) AS [LongestTrip],
	MIN(DATEDIFF(DAY, ArrivalDate,ReturnDate)) AS [ShortestTrip]
	FROM Accounts AS A
JOIN AccountsTrips AS [AT] ON [AT].AccountId = A.Id
JOIN Trips AS T ON [AT].TripId = T.Id
WHERE CancelDate IS NULL AND MiddleName IS  NULL
GROUP BY A.Id, FirstName, LastName
ORDER BY LongestTrip DESC ,ShortestTrip