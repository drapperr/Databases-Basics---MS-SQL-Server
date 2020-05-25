CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	CategoryName VARCHAR(50) NOT NULL,
	DailyRate INT,
	WeeklyRate INT,
	MountlyRate INT,
	WeekendRate INT
)

CREATE TABLE Cars(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	PlateNumber INT NOT NULL,
	Manufaturer VARCHAR(50) NOT NULL,
	CarYear DATETIME2 NOT NULL,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
	Doors INT NOT NULL,
	Picture VARBINARY,
	Condition VARCHAR(50),
	Avaible BIT NOT NULL
)

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Title VARCHAR(50) NOT NULL,
	Notes VARCHAR(100)
)

CREATE TABLE Customers(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	DriverLicenceNumber INT  NOT NULL,
	FullName VARCHAR(100) NOT NULL,
	Adress VARCHAR(200) NOT NULL,
	City VARCHAR(50) NOT NULL,
	ZIPCode INT NOT NULL,
	Notes VARCHAR(100)
)

CREATE TABLE RentalOrders(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id) NOT NULL,
	CarId INT FOREIGN KEY REFERENCES Cars(Id) NOT NULL,
	TankLevel INT NOT NULL,
	KilometrageStart INT NOT NULL,
	KilometrageEnd INT,
	TotalKilometrage INT,
	StartDate DATETIME2 NOT NULL,
	EndDate DATETIME2,
	TotalDays INT,
	RateApplied INT,
	TaxRate INT,
	OrderStatus VARCHAR(50),
	Notes VARCHAR(100)
)

INSERT INTO Categories(CategoryName)
	VALUES
	('Cars'),
	('Trucks'),
	('Motorcycles')

INSERT INTO Cars(PlateNumber,Manufaturer,CarYear,CategoryId,Doors,Avaible)
	VALUES
	(111,'M1','1991',1,4,'true'),
	(222,'M2','1992',1,2,'false'),
	(333,'M3','1993',1,3,'true')

INSERT INTO Employees(FirstName,LastName,Title)
	VALUES
	('Pesho1','Peshew','T1'),
	('Pesho2','Peshew','T2'),
	('Pesho3','Peshew','T3')

INSERT INTO Customers(DriverLicenceNumber,FullName,Adress,City,ZIPCode)
	VALUES
	(12345,'Petre1','A..','Sofia',1000),
	(12367,'Petre2','A..','Sofia',1000),
	(12323,'Petre3','A..','Sofia',1000)

INSERT INTO RentalOrders(EmployeeId,CustomerId,CarId,TankLevel,KilometrageStart,StartDate)
	VALUES
	(1,1,1,100,100000,'05/05/2020'),
	(2,2,2,200,200000,'05/05/2020'),
	(3,3,3,300,300000,'05/05/2020')
