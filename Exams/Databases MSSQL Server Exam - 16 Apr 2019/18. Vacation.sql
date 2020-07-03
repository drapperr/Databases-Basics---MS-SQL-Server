CREATE FUNCTION udf_CalculateTickets(@origin VARCHAR(50), @destination VARCHAR(50), @peopleCount INT)  
RETURNS VARCHAR(50)
AS
BEGIN
	IF(@peopleCount<=0)
	RETURN CONCAT('Invalid people count!','')

	DECLARE @IsValidFlight INT = (SELECT TOP(1) Id FROM Flights
									WHERE Origin = @origin AND Destination = @destination)

	IF(@IsValidFlight IS NULL)
	RETURN CONCAT('Invalid flight!','')

	DECLARE @TicketPrice DECIMAL(17,2) =  (SELECT TOP(1) Price FROM Flights AS F
							JOIN Tickets AS T ON T.FlightId = F.Id
							WHERE Origin = @origin AND Destination = @destination)

	RETURN CONCAT('Total price ',@TicketPrice * @peopleCount)
END


SELECT dbo.udf_CalculateTickets('Kolyshley','Rancabolang', 33)
SELECT dbo.udf_CalculateTickets('Kolyshley','Rancabolang', -1)
SELECT dbo.udf_CalculateTickets('Invalid','Rancabolang', 33)