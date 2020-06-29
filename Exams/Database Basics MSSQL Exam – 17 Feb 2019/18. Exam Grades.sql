CREATE FUNCTION udf_ExamGradesToUpdate(@studentId INT, @grade DECIMAL(3,2)) 
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @Result VARCHAR(MAX)
	IF (@studentId NOT IN (SELECT StudentId FROM StudentsExams))
	RETURN 'The student with provided id does not exist in the school!'

	IF(@grade > 6)
	RETURN'Grade cannot be above 6.00!'
	ELSE
	BEGIN
		DECLARE @CountOfGrades INT = (SELECT COUNT(*) FROM StudentsExams
									  WHERE (StudentId = @studentId) AND (Grade >= @grade AND Grade <= @grade+0.50))
		DECLARE @StudentName NVARCHAR(30) = (SELECT TOP(1) FirstName FROM Students WHERE Id = @studentId)
		RETURN CONCAT('You have to update ',@CountOfGrades ,' grades for the student ',@StudentName)
	END
	RETURN ''
END