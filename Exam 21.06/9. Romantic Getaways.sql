SELECT A.Id, A.Email, C.Name AS [City], COUNT(T.Id) AS [Trips] FROM Accounts AS A
JOIN AccountsTrips AS [AT] ON [AT].AccountId = A.Id
JOIN Trips AS T ON T.Id= [AT].TripId
JOIN Rooms AS R ON R.Id = T.RoomId
JOIN Hotels AS H ON H.Id = R.HotelId
JOIN Cities AS C ON A.CityId = C.Id
WHERE A.CityId = H.CityId
GROUP BY A.Id, A.Email, C.Name
ORDER BY Trips DESC, A.Id