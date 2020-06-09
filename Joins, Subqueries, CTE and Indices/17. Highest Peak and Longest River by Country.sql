SELECT TOP(5) CountryName, MAX(P.Elevation) AS [HighestPeakElevation], MAX(R.[Length]) AS [LongestRiverLength] FROM Countries AS C
	JOIN MountainsCountries AS MC ON MC.CountryCode = C.CountryCode
	JOIN Mountains AS M ON M.Id = MC.MountainId
	JOIN Peaks AS P ON P.MountainId = M.Id
	JOIN CountriesRivers AS CR ON CR.CountryCode = C.CountryCode
	JOIN Rivers AS R ON R.Id = CR.RiverId
	GROUP BY CountryName
	ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, CountryName
	

