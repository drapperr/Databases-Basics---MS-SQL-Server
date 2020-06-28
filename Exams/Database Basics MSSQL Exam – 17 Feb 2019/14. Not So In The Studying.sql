SELECT CONCAT(FirstName, ' ' ,
			(CASE WHEN MiddleName IS NOT NULL THEN MiddleName + ' ' END) ,
			LastName) AS [Full Name] 
		FROM Students
WHERE Id NOT IN (SELECT DISTINCT StudentId FROM StudentsSubjects)
ORDER BY [Full Name]


