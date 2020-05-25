CREATE DATABASE Movies

USE Movies

CREATE TABLE Directors(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
);

CREATE TABLE Genres(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	GenreName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
);

CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	CategoryName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
);

CREATE TABLE Movies(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Title NVARCHAR(100) NOT NULL,
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id) NOT NULL,
	CopyrightYear DATE NOT NULL,
	[Length] INT NOT NULL,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id) NOT NULL,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
	Raiting INT,
	Notes NVARCHAR(MAX)
);

INSERT INTO Directors(DirectorName)
VALUES
('Pesho1'),
('Pesho2'),
('Pesho3'),
('Pesho4'),
('Pesho5')

INSERT INTO Genres(GenreName)
VALUES
('Genre1'),
('Genre2'),
('Genre3'),
('Genre4'),
('Genre5')

INSERT INTO Categories(CategoryName)
VALUES
('Category1'),
('Category2'),
('Category3'),
('Category4'),
('Category5')

INSERT INTO Movies(Title,DirectorId,CopyrightYear,[Length],GenreId,CategoryId)
VALUES
('t1',1,'2001',1,1,1),
('t2',2,'2002',2,2,2),
('t3',3,'2003',3,3,3),
('t4',4,'2004',4,4,4),
('t5',5,'2005',5,5,5)

SELECT * FROM Movies