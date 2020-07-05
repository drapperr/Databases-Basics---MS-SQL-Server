CREATE PROCEDURE usp_AssignEmployeeToReport(@EmployeeId INT, @ReportId INT)
AS
	DECLARE @EmployeeDepartmentId INT = (SELECT TOP(1) DepartmentId FROM Employees 
										WHERE Id = @EmployeeId)
	DECLARE @CategoryDepartmentId INT = (SELECT TOP(1) DepartmentId FROM Reports AS R
										JOIN Categories AS C ON C.Id = R.CategoryId
										WHERE R.Id = @ReportId)

	IF(@EmployeeDepartmentId != @CategoryDepartmentId)
	THROW 51000, 'Employee doesn''t belong to the appropriate department!' , 1
	

	UPDATE Reports
	SET EmployeeId = @EmployeeId
	WHERE Id = @ReportId

EXEC usp_AssignEmployeeToReport 30, 1
EXEC usp_AssignEmployeeToReport 17, 2