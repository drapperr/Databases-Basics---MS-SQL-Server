DROP TABLE [People]
CREATE TABLE [People] (
	[Id] int PRIMARY KEY IDENTITY(1,1),
	[Name] nvarchar(200) NOT NULL,
	[Picture] varbinary(2000),
	[Height] real,
	[Weight] real,
	[Grender] nchar(1),
	[Birthdate] datetime2 NOT NULL,
	[Biography] nvarchar(max)
);

INSERT INTO [People] ([Name],[Picture],[Height],[Weight],[Grender],[Birthdate],[Biography])
	VALUES ('Pesho',Null,2.32,3.21,'m','12-03-2000','Im Pesho'),
			('Gosho',Null,23.99,1.44,'m','11-19-2001','Im Gosho'),
			('Petko',Null,22.41,2.32,'m','01-06-2010','Im Petko'),
			('Kiro',Null,14.23,1.21,'m','05-21-2005','Im Kiro'),
			('Mitko',Null,13.34,2.33,'m','03-15-2008','Im Mitko')