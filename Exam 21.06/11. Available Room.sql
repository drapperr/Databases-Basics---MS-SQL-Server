CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATETIME2, @People INT)
RETURNS VARCHAR(MAX)
AS
BEGIN 
	IF((SELECT COUNT(*) FROM Hotels AS H
		JOIN Rooms AS R ON R.HotelId = H.Id
		JOIN Trips AS T ON T.RoomId = R.Id
		WHERE ((@Date BETWEEN ArrivalDate AND ReturnDate) AND CancelDate IS NULL) AND (H.Id = @HotelId))>0)
	RETURN 'No rooms available'

	DECLARE @Room TABLE(Id INT, [Type] VARCHAR(50), Beds INT, Total DECIMAL(15,2))

	INSERT INTO @Room
	SELECT TOP(1) R.Id,[Type],Beds, (BaseRate + Price) AS [Total] FROM Hotels AS H
	JOIN Rooms AS R ON R.HotelId = H.Id
	JOIN Trips AS T ON T.RoomId = R.Id
	WHERE (H.Id = @HotelId) AND (Beds >= @People)
	ORDER BY Total DESC

	IF((SELECT COUNT(*) FROM @Room) = 0)
	RETURN 'No rooms available'

	DECLARE @Id INT = (SELECT Id FROM @Room)
	DECLARE @Type VARCHAR(50) = (SELECT [Type] FROM @Room)
	DECLARE @Beds INT = (SELECT Beds FROM @Room)
	DECLARE @Total DECIMAL(15,2) = (SELECT Total FROM @Room)

	RETURN CONCAT('Room ',@Id,': ',@Type,' (',@Beds,' beds) - $',@Total * @People)
END

SELECT dbo.udf_GetAvailableRoom(112, '2011-12-17', 2)

SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)

