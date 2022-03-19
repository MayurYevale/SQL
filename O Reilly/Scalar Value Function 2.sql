---- ================================================
---- Template generated from Template Explorer using:
---- Create Scalar Function (New Menu).SQL
----
---- Use the Specify Values for Template Parameters 
---- command (Ctrl-Shift-M) to fill in the parameter 
---- values below.
----
---- This block of comments will not be included in
---- the definition of the function.
---- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Author:		<Author,,Name>
---- Create date: <Create Date, ,>
---- Description:	<Description, ,>
---- =============================================
--CREATE FUNCTION getCouseTitleById
--(
--	-- Add the parameters for the function here
--	@courseId int 
--)
--RETURNS nvarchar(50)
--AS
--BEGIN
--	-- Declare the return variable here
--	DECLARE @name nvarchar(50)

--	-- Add the T-SQL statements to compute the return value here
--	SELECT @name = Title from Courses
--	where CourseID = @courseId

--	-- Return the result of the function
--	RETURN @name

--END
--GO
 use school
 select dbo.getCouseTitleById(2)
