SELECT SUM(DIFF) AS [SumDifference] FROM (SELECT (HW.DepositAmount - GW.DepositAmount) AS [DIFF] FROM WizzardDeposits AS HW
	JOIN WizzardDeposits GW ON HW.Id + 1 = GW.Id) AS R