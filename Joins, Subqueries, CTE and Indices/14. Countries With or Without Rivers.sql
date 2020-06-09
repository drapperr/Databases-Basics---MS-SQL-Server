SELECT TOP(5) CountryName, RiverName FROM Countries AS C 
	LEFT JOIN CountriesRivers AS CR ON C.CountryCode = CR.CountryCode
	LEFT JOIN Rivers AS R ON R.Id = CR.RiverId
	WHERE ContinentCode = 'AF'
	ORDER BY CountryName