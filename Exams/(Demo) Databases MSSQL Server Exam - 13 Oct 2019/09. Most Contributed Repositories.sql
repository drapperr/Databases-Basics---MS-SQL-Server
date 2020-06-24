SELECT TOP(5) R.Id,Name,COUNT(*) AS [Commits] FROM Repositories AS R
JOIN RepositoriesContributors AS RC ON RC.RepositoryId = R.Id
JOIN Users AS U ON U.Id = RC.ContributorId
JOIN Commits AS C ON C.RepositoryId = R.Id
GROUP BY R.Id,Name
ORDER BY Commits DESC,R.Id, R.Name