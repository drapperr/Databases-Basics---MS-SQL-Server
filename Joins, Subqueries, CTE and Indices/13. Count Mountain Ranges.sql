SELECT CountryCode, COUNT(MountainRange) AS MountainRange FROM Mountains AS M
	JOIN MountainsCountries AS MC ON MC.MountainId = M.Id
	WHERE CountryCode IN ('US', 'RU', 'BG')
	GROUP BY CountryCode
