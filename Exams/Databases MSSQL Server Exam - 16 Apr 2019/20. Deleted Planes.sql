CREATE TABLE DeletedPlanes(
	Id INT NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	Seats INT NOT NULL, 
	[Range] INT NOT NULL
)

go
CREATE TRIGGER RecordDeletedPlanes
    ON Planes
    FOR DELETE
AS
INSERT INTO DeletedPlanes
SELECT * FROM deleted