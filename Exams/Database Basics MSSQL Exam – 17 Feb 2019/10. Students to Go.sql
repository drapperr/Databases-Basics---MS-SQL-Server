SELECT CONCAT(FirstName,' ', LastName) AS [Full Name] FROM Students
WHERE Id NOT IN (SELECT DISTINCT StudentId FROM StudentsExams)
ORDER BY [Full Name]