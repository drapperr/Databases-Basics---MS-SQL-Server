SELECT TOP(10) FirstName, LastName, Grade FROM Students AS S
JOIN (SELECT StudentId, CONVERT(decimal(3,2) ,AVG(Grade)) AS [Grade] FROM StudentsExams
GROUP BY StudentId) AS SG ON SG.StudentId = S.Id
ORDER BY Grade DESC