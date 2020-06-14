CREATE PROCEDURE usp_EmployeesBySalaryLevel @levelOfSalary VARCHAR(7) AS
	SELECT FirstName, LastName FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @levelOfSalary

EXECUTE usp_EmployeesBySalaryLevel 'HIGH'