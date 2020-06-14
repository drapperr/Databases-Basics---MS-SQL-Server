CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(50), @word VARCHAR(50))
RETURNS BIT AS
	BEGIN
		DECLARE @lengthWord INT = LEN(@word)
		WHILE (@lengthWord > 0)
		BEGIN
			DECLARE @ch CHAR(1) = SUBSTRING(@word, @lengthWord, 1)
			IF (CHARINDEX(@ch, @setOfLetters) = 0) RETURN 0
			SET @lengthWord -=1
		END
		RETURN 1
	END

GO 

SELECT dbo.ufn_IsWordComprised('oistmiahf', 'halves')