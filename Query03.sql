-- Create a Procedure
create PROCEDURE spAddTwoNumbers(@no1 INT, @no2 INT)
AS
BEGIN
  DECLARE @Result INT
  SET @Result = @no1 + @no2
  PRINT 'RESULT IS: '+ CAST(@Result AS VARCHAR)
END
GO

-- Calling the procedure:
EXECUTE spAddTwoNumbers 10, 20

-- OR 
EXECUTE spAddTwoNumbers @no1=10, @no2=20

-- OR calling the procedure by declaring two variables as shown below
DECLARE @no1 INT, @no2 INt
SET @no1 = 10
SET @no2 = 20
EXECUTE spAddTwoNumbers @no1, @no2

select * from Employee

CREATE PROCEDURE spGetEmployeesByGenderAndDepartment
  @Gender VARCHAR(20),
  @ID INT
AS
BEGIN
  SELECT Name, Gender, ID 
  FROM Employee
  WHERE Gender = @Gender AND ID = @ID
END
GO


EXECUTE spGetEmployeesByGenderAndDepartment 'M', 101

--EXEC spGetEmployeesByGenderAndDepartment 1, 'Male'

EXEC spGetEmployeesByGenderAndDepartment @ID=101, @Gender='M'


-- Create a Procedure
CREATE PROCEDURE spUpdateEmployeeByID
(
  @ID INT, 
  @Name VARCHAR(50), 
  @Gender VARCHAR(50), @DOB DATETIME, 
  @DeptID INT
)
AS
BEGIN
  UPDATE Employee SET 
      Name = @Name, 
      Gender = @Gender,
      DOB = @DOB, 
      DeptID = @DeptID
  WHERE ID = @ID
END
GO

-- Executing the Procedure
-- If you are not specifying the Parameter Names then the order is important
EXECUTE spUpdateEmployeeByID 3, 'Palak', 'Female', '1994-06-17 10:53:27.060', 3

-- If you are specifying the Parameter Names then order is not mandatory
EXECUTE spUpdateEmployeeByID @ID =3, @Gender = 'Female', @DOB = '1994-06-17 10:53:27.060', @DeptID = 3, @Name = 'Palak'




CREATE PROCEDURE spGetResult
  @No1 INT,
  @No2 INT,
  @Result INT OUTPUT
AS
BEGIN
  SET @Result = @No1 + @No2
END

-- To Execute Procedure
DECLARE @Result INT
EXECUTE spGetResult 10, 20, @Result OUT
PRINT @Result