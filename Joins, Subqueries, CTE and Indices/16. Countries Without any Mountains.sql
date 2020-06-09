SELECT COUNT(*) FROM Countries AS C
	LEFT JOIN MountainsCountries AS MC ON MC.CountryCode = C.CountryCode
	WHERE MC.MountainId IS NULL