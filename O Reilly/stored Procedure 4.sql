---- here modifying insert student procedure 
---- so that it can return id of newly addded student

--USE [school]
--GO
--/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 3/19/2022 10:31:43 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Author:		<Author,,Name>
---- Create date: <Create Date,,>
---- Description:	<Description,,>
---- =============================================
--ALTER PROCEDURE [dbo].[InsertStudent]
--	-- Add the parameters for the stored procedure here
--	@firstname nvarchar(50),
--	@lastname nvarchar(50),
--	@dateofbirth datetime,
--	-- this is change
--	@studentID int OUTPUT -- AS it is return value
--AS
--BEGIN
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;

--    -- Insert statements for procedure here
--	insert into Students (lastName,firstName,dateOfBirth,enrollmentDate) 
--	values
--	(@lastname,@firstname,@dateofbirth,getdate());

--	select @studentID = SCOPE_IDENTITY(); -- gives last student id
--END

use school
exec [dbo].[SelectAllStudents];
-- calling procedure
DECLARE @studentID int
exec [dbo].[InsertStudent] 'thomoa','james','1992-03-04', @studentID OUTPUT
exec [dbo].[SelectAllStudents];

exec [dbo].[SelectStudentByID] @studID = @studentID;
