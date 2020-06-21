DELETE FROM AccountsTrips
WHERE AccountId IN (SELECT Id FROM Accounts
					WHERE Id = 47) 

DELETE FROM Accounts
WHERE Id = 47