INSERT INTO [Towns] ([Id],[Name])
	Values (1,'Sofia'),
			(2,'Plovdiv'),
			(3,'Varna')
INSERT INTO [Minions] ([Id],[Name],[Age],[TownId])
	Values (1,'Kevin',22,1),
			(2,'Bob',15,3),
			(3,'Steward',Null,2)

TRUNCATE TABLE [Minions]
DROP TABLE [Minions]
DROP TABLE [Towns]




