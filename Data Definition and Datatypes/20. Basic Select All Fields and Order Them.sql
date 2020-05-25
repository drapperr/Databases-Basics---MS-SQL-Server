CREATE TABLE Towns(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Addresses(
	Id INT PRIMARY KEY IDENTITY,
	AddressText VARCHAR(100) NOT NULL,
	TownId INT FOREIGN KEY REFERENCES Towns(Id)
)

CREATE TABLE Departments(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50)
)

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(100) NOT NULL,
	JobTitle VARCHAR(50) NOT NULL,
	DepartmentId INT FOREIGN KEY REFERENCES Departments(Id) NOT NULL,
	HireDate DATETIME2 NOT NULL,
	Salary DECIMAL(7,2) NOT NULL,
	AdressId INT FOREIGN KEY REFERENCES Addresses(Id)
)

INSERT INTO Towns([Name])
	VALUES
	('Sofia'),
	('Plovdiv'),
	('Varna'),
	('Burgas')

INSERT INTO Departments([Name])
	VALUES
	('Engineering'),
	('Sales'),
	('Marketing'),
	('Software Development'),
	('Quality Assurance')

INSERT INTO Employees([Name],JobTitle,DepartmentId,HireDate,Salary)
	VALUES
	('Ivan Ivanov Ivanov','.NET Developer',4,'02/01/2013',3500.00),
	('Petar Petrov Petrov','Senior Engineer',1,'03/02/2004',4000.00),
	('Maria Petrova Ivanova','Intern',5,'08/28/2016',525.25),
	('Georgi Teziev Ivanov','CEO',2,'12/09/2007',3000.00),
	('Peter Pan Pan','Intern',3,'08/28/2016',599.88)

SELECT * FROM Towns
ORDER BY [Name] 

SELECT * FROM Departments
ORDER BY [Name]

SELECT * FROM Employees
ORDER BY Salary DESC