CREATE TABLE ExcludedStudents(
	StudentId INT, 
	StudentName NVARCHAR(30)
)

go

CREATE TRIGGER CreateLogForDeletedStudents
ON Students
INSTEAD OF DELETE
AS
	INSERT INTO ExcludedStudents(StudentId, StudentName)
	SELECT Id, FirstName + ' ' + LastName FROM deleted