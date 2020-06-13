CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber @number DECIMAL(18,4)
AS SELECT FirstName, LastName FROM Employees
	WHERE Salary >= @number

EXEC usp_GetEmployeesSalaryAboveNumber 48100