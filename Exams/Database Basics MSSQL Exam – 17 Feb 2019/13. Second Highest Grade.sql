SELECT FirstName, LastName , Grade FROM (SELECT *, ROW_NUMBER () OVER (PARTITION BY StudentId ORDER BY Grade DESC) AS [GradeRank] FROM StudentsSubjects) AS SG
JOIN Students AS S ON S.Id = SG.StudentId
WHERE GradeRank = 2
ORDER BY FirstName, LastName