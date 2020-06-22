CREATE PROCEDURE usp_SwitchRoom(@TripId INT , @TargetRoomId INT)
AS 

DECLARE @TripHotelId INT =(SELECT TOP(1) HotelId FROM Trips AS T 
							JOIN Rooms AS R ON R.Id = T.RoomId
							WHERE T.Id = @TripId)

DECLARE @TargetRoomHotelId INT =(SELECT TOP(1) HotelId FROM Rooms
								WHERE Id = @TargetRoomId)

IF (@TripHotelId != @TargetRoomHotelId)
THROW 51000, 'Target room is in another hotel!' ,1

DECLARE @NeededBeds INT = (SELECT COUNT(*) FROM Trips AS T
							JOIN AccountsTrips AS [AT] ON [AT].TripId = T.Id
							WHERE Id = @TripId)

DECLARE @TotalBeds INT = (SELECT TOP(1) Beds FROM Rooms
								WHERE Id = @TargetRoomId)

DECLARE @TripsOnTargetRoom INT = (SELECT COUNT(*) FROM Trips AS T
									JOIN AccountsTrips AS [AT] ON [AT].TripId = T.Id
									WHERE RoomId = @TargetRoomId)

IF (@NeededBeds > (@TotalBeds - @TripsOnTargetRoom))
THROW 52000, 'Not enough beds in target room!' ,1

UPDATE Trips
SET RoomId = @TargetRoomId
WHERE Id = @TripId

GO

EXEC usp_SwitchRoom 10, 11
SELECT RoomId FROM Trips WHERE Id = 10
EXEC usp_SwitchRoom 10, 7
EXEC usp_SwitchRoom 10, 8            




