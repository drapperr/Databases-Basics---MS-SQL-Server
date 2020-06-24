SELECT Username, AVG(Size) AS[Size]  FROM Commits AS C
JOIN Users AS U ON U.Id= C.ContributorId
JOIN Files AS F ON F.CommitId = C.Id
GROUP BY Username
ORDER BY Size DESC, Username