SELECT T.Id,
		CASE
			WHEN MiddleName IS NULL THEN CONCAT(FirstName, ' ', LastName )
			ELSE CONCAT(FirstName, ' ', MiddleName, ' ', LastName )
		END AS [Full Name],
		AC.[Name] AS [From],
		HC.[Name] AS [To],
		CASE
			WHEN CancelDate IS NULL THEN CONCAT(DATEDIFF(DAY, ArrivalDate, ReturnDate),' days')
			ELSE 'Canceled'
		END AS [Duration]
FROM AccountsTrips AS [AT]
JOIN Accounts AS A ON [AT].AccountId = A.Id
JOIN Trips AS T ON T.Id = [AT].TripId
JOIN Rooms AS R ON T.RoomId = R.Id
JOIN Hotels AS H ON H.Id = R.HotelId
JOIN Cities AS AC ON A.CityId = AC.Id
JOIN Cities AS HC ON H.CityId = HC.Id
ORDER BY [Full Name], T.Id
