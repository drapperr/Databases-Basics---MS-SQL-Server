SELECT FirstName,LastName, TeachersCount FROM (SELECT StudentId ,COUNT(TeacherId) AS [TeachersCount] FROM StudentsTeachers
				GROUP BY StudentId) TC
JOIN Students AS S ON S.Id = TC.StudentId
ORDER BY LastName