CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Title VARCHAR(50) NOT NULL,
	Notes VARCHAR(100)
)

CREATE TABLE Customers(
	AccountNumber INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	PhoneNumber CHAR(10) NOT NULL,
	EmergerncyName VARCHAR(50),
	EmergencyNumber CHAR(10),
	Notes VARCHAR(100)
)

CREATE TABLE RoomStatus(
	Id INT PRIMARY KEY IDENTITY,
	RoomStatus VARCHAR(50) NOT NULL,
	Notes VARCHAR(100),
)

CREATE TABLE RoomTypes(
	Id INT PRIMARY KEY IDENTITY,
	RoomTypes VARCHAR(50) NOT NULL,
	Notes VARCHAR(100)
)

CREATE TABLE BedTypes(
	Id INT PRIMARY KEY IDENTITY,
	BedType VARCHAR(50) NOT NULL,
	Notes VARCHAR(100)
)

CREATE TABLE Rooms(
	RoomNumber INT PRIMARY KEY IDENTITY,
	RoomType INT FOREIGN KEY REFERENCES RoomTypes(Id) NOT NULL,
	BedType INT FOREIGN KEY REFERENCES BedTypes(Id) NOT NULL,
	Rate INT NOT NULL,
	RoomStatus INT FOREIGN KEY REFERENCES RoomStatus(Id) NOT NULL,
	Notes VARCHAR(50)
)

CREATE TABLE Payments(
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	PaymentDate DATETIME2 NOT NULL,
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL,
	FirstDateOccupied DATETIME2,
	LastDateOccupied DATETIME2,
	TotalDays INT NOT NULL,
	AmountCharged DECIMAL(5,2),
	TaxRate INT,
	TaxAmount DECIMAL(5,2),
	PaymentTotal DECIMAL(5,2) NOT NULL,
	Notes VARCHAR(100)
)

CREATE TABLE Occupancies(
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	DateOccupied DATETIME2 NOT NULL,
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL,
	RoomNumber INT FOREIGN KEY REFERENCES Rooms(RoomNumber) NOT NULL,
	RateApplied VARCHAR(50),
	PhoneCharge VARCHAR(50),
	Notes VARCHAR(100)
)

INSERT INTO Employees(FirstName,LastName,Title)
	VALUES
	('Pesho1','Peshew1','T1'),
	('Pesho2','Peshew2','T2'),
	('Pesho3','Peshew3','T3')

INSERT INTO Customers(FirstName,LastName,PhoneNumber)
	VALUES
	('Peska1','Peshew1','0881231234'),
	('Peska2','Peshew2','0892123123'),
	('Peska3','Peshew3','0872131233')

INSERT INTO RoomStatus(RoomStatus)
	VALUES
	('S1'),
	('S2'),
	('S3')

INSERT INTO RoomTypes(RoomTypes)
	VALUES
	('T1'),
	('T2'),
	('T3')

INSERT INTO BedTypes(BedType)
	VALUES
	('B1'),
	('B2'),
	('B3')

INSERT INTO Rooms(RoomType,BedType,Rate,RoomStatus)
	VALUES
	(1,1,100,1),
	(2,2,98,2),
	(3,3,95,3)

INSERT INTO Payments(EmployeeId,PaymentDate,AccountNumber,TotalDays,PaymentTotal)
	VALUES
	(1,'2020',1,5,150.80),
	(2,'2020',2,10,500.21),
	(3,'2020',3,1,50)

INSERT INTO Occupancies(EmployeeId,DateOccupied,AccountNumber,RoomNumber)
	VALUES
	(1,'2020',1,1),
	(2,'2020',2,2),
	(3,'2020',3,3)