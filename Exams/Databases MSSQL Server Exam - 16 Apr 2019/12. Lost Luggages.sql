SELECT PassportId, [Address] FROM Passengers AS P
LEFT JOIN Luggages AS L ON L.PassengerId = P.Id
WHERE L.Id IS NULL
ORDER BY PassportId, [Address]