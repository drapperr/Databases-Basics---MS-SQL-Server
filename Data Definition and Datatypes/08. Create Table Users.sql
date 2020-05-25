CREATE TABLE Users(
	Id BIGINT PRIMARY KEY IDENTITY NOT NULL,
	Username VARCHAR(30) UNIQUE NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX) 
	CHECK(DATALENGTH(ProfilePicture) <= 900 * 1024),
	LastLoginTime DATETIME2 NOT NULL,
	IsDeleted BIT NOT NULL
)

INSERT INTO Users (Username, [Password], LastLoginTime, IsDeleted)
VALUES
('Pesho','1234','04.01.2001',0),
('Pesho2','12345','04.01.2001',1),
('Pesho3','12346','04.01.2001',0),
('Pesho4','12347','04.01.2001',1),
('Pesho1','12348','04.01.2001',0)

SELECT * FROM Users