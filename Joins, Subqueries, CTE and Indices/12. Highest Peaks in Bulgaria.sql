SELECT C.CountryCode, MountainRange, PeakName, Elevation FROM Peaks AS P
	JOIN Mountains AS M ON P.MountainId = M.Id
	JOIN MountainsCountries AS MC ON M.Id = MC.MountainId
	JOIN Countries AS C ON C.CountryCode = MC.CountryCode
	WHERE C.CountryName = 'Bulgaria' AND Elevation > 2835
	ORDER BY Elevation DESC