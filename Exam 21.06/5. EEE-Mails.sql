SELECT FirstName, LastName, FORMAT(BirthDate,'MM-dd-yyyy') AS [BirthDate], C.[Name] AS [Hometown], Email FROM Accounts AS A
JOIN Cities AS C ON C.Id = A.CityId
WHERE Email LIKE 'e%'
ORDER BY C.[Name]