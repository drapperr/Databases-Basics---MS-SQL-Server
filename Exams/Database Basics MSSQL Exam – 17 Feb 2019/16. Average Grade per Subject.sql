SELECT CONCAT(T.FirstName, ' ', T.LastName) AS [Teacher Full Name],
				SU.[Name] AS [Subject Name],
				CONCAT(ST.FirstName, ' ',ST.LastName) AS [Student Full Name],
				CONVERT(DECIMAL(3,2),Grade) AS [Grade]
FROM (SELECT SG.StudentId,SubjectId,TeacherId,Grade, 
		DENSE_RANK() OVER (PARTITION BY TeacherId ORDER BY Grade DESC) AS [StudentRank] 
	FROM (SELECT StudentId, SubjectId, AVG(Grade) AS [Grade] 
			FROM StudentsSubjects
			GROUP BY StudentId, SubjectId) AS [SG]
	JOIN StudentsTeachers AS [ST] ON ST.StudentId = SG.StudentId) AS R
JOIN Students AS ST ON ST.Id = R.StudentId
JOIN Subjects AS SU ON SU.Id =R.SubjectId
JOIN Teachers AS T ON T.Id  = R.TeacherId
WHERE StudentRank = 1
ORDER BY [Subject Name],[Teacher Full Name],Grade DESC

SELECT * FROM Subjects