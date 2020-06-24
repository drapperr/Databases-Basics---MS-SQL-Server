CREATE FUNCTION udf_UserTotalCommits(@username VARCHAR(MAX)) 
RETURNS INT
AS
BEGIN
	IF((SELECT TOP(1) Id FROM Users
						WHERE Username = @username) IS NULL)
	RETURN 0

	RETURN ISNULL((SELECT TOP(1) COUNT(Id) FROM Commits
	WHERE ContributorId = (SELECT TOP(1) Id FROM Users
						WHERE Username = @username)
	GROUP BY ContributorId),0)
END




SELECT dbo.udf_UserTotalCommits('BlaImmagiIana')

select* from users  