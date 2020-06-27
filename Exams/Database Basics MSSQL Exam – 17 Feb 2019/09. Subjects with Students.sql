SELECT CONCAT(FirstName,' ',LastName) AS [FullName],
		CONCAT(S.[Name],'-',S.Lessons) AS [Subjects],
		SC.Students
		FROM Teachers AS T
JOIN Subjects AS S ON T.SubjectId = S.Id
JOIN (SELECT TeacherId, COUNT(StudentId) AS [Students] FROM StudentsTeachers
GROUP BY TeacherId) AS SC ON SC.TeacherId = T.Id
ORDER BY Students DESC, FullName, Subjects