SELECT TOP(2) DepositGroup FROM (
	SELECT DepositGroup, AVG(MagicWandSize) AS [AverageWand]  FROM WizzardDeposits
	GROUP BY DepositGroup
	) AS RESULT
	ORDER BY AverageWand