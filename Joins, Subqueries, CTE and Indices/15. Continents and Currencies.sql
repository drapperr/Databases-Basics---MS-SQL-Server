
SELECT OC.ContinentCode,
	   OC.CurrencyCode,
	   OC.CurrencyUsage
  FROM Continents AS c
  JOIN (
	   SELECT ContinentCode,
	   COUNT(CurrencyCode) AS [CurrencyUsage],
	   CurrencyCode ,
	   DENSE_RANK() OVER (PARTITION BY ContinentCode
	                      ORDER BY COUNT(CurrencyCode) DESC
						  ) AS [Rank]
	   FROM Countries
	   GROUP BY ContinentCode, CurrencyCode
	   HAVING COUNT(CurrencyCode) > 1
	   )
	   AS OC
    ON c.ContinentCode = OC.ContinentCode
 WHERE OC.Rank = 1