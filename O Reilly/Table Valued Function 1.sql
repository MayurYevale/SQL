-- in this script Table Valued Function
use school

-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
---- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Author:		<Author,,Name>
---- Create date: <Create Date,,>
---- Description:	 function to return grade between two values
---- =============================================
--CREATE FUNCTION gradeRange 
--(	
--	-- Add the parameters for the function here
--	@firstGrade float,
--	@secondGrade float
--)
--RETURNS TABLE 
--AS
--RETURN 
--(
--	-- Add the SELECT statement with parameter references here
--	SELECT grade from Enrollments 
--	where grade between @firstGrade and @secondGrade
--)
--GO


-- calling above table valued function

select * from dbo.gradeRange(50,84) 
order by grade;


