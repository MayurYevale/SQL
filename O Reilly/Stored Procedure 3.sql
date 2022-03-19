---- this procedure is to insert values to table
use school

---- ================================================
---- Template generated from Template Explorer using:
---- Create Procedure (New Menu).SQL
----
---- Use the Specify Values for Template Parameters 
---- command (Ctrl-Shift-M) to fill in the parameter 
---- values below.
----
---- This block of comments will not be included in
---- the definition of the procedure.
---- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Author:		<Author,,Name>
---- Create date: <Create Date,,>
---- Description:	<Description,,>
---- =============================================
--CREATE PROCEDURE InsertStudent
--	-- Add the parameters for the stored procedure here
--	@firstname nvarchar(50),
--	@lastname nvarchar(50),
--	@dateofbirth datetime
--AS
--BEGIN
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;

--    -- Insert statements for procedure here
--	insert into Students (lastName,firstName,dateOfBirth,enrollmentDate) 
--	values
--	(@lastname,@firstname,@dateofbirth,getdate());
--END
--GO

exec [dbo].[SelectAllStudents];
-- calling procedure
exec [dbo].[InsertStudent] @lastname='desai',@firstname='abhi',@dateofbirth='2002-02-02';
exec [dbo].[SelectAllStudents];

