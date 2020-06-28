SELECT [Quarter], [Name] AS [SubjectName], COUNT(StudentId) AS StudentsCount FROM StudentsExams AS SE
JOIN (SELECT Id,SubjectId,
	CASE
		 WHEN DATEPART(MONTH, [Date]) BETWEEN 1 AND 3 THEN 'Q1'
		 WHEN DATEPART(MONTH, [Date]) BETWEEN 4 AND 6 THEN 'Q2'
		 WHEN DATEPART(MONTH, [Date]) BETWEEN 7 AND 9 THEN 'Q3'
		 WHEN DATEPART(MONTH, [Date]) BETWEEN 10 AND 12 THEN 'Q4'
		 WHEN [Date] IS NULL THEN 'TBA'
	END AS [Quarter] FROM Exams) AS E ON E.Id = SE.ExamId
JOIN Subjects AS S ON S.Id = E.SubjectId
WHERE Grade >= 4
GROUP BY [Quarter], [Name]
ORDER BY [Quarter]