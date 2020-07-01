SELECT [Type], COUNT(PassengerId) AS [MostUsedLuggage] FROM Luggages AS L
JOIN LuggageTypes AS LT ON L.LuggageTypeId = LT.Id
GROUP BY [Type]
ORDER BY MostUsedLuggage DESC, [Type]