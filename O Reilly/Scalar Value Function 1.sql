use school;
--select max(grade),min(grade) from Enrollments

--select GETDATE()
--select year(getdate())

-- now we will create function for getting max grade

-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Author:		<Author,,Name>
---- Create date: <Create Date, ,>
---- Description:	<Description, ,>
---- =============================================
--CREATE FUNCTION getHighestGrade 
--(
--	-- Add the parameters for the function here
--	--<@Param1, sysname, @p1> <Data_Type_For_Param1, , int>
--	-- no parameters required
--)
--RETURNS float -- as grade is float data type
--AS
--BEGIN
---- logic for function is between begin and end

--	-- Declare the return variable here
--	DECLARE @grade float

--	-- Add the T-SQL statements to compute the return value here
--	select @grade = max(grade) from Enrollments

--	-- Return the result of the function
--	RETURN @grade

--END
--GO


-- calling above function
select [dbo].[getHighestGrade]()

