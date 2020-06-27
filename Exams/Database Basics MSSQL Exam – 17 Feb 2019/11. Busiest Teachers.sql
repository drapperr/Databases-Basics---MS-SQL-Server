SELECT TOP(10) FirstName, LastName, StudentsCount FROM (SELECT TeacherId, COUNT(StudentId) AS [StudentsCount] FROM StudentsTeachers
GROUP BY TeacherId) AS SC
JOIN Teachers AS T ON T.Id = SC.TeacherId
ORDER BY StudentsCount DESC, FirstName, LastName