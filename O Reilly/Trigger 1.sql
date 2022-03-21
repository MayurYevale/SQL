-- CREATING TRIGGER
use school

---- ================================================
---- Template generated from Template Explorer using:
---- Create Trigger (New Menu).SQL
----
---- Use the Specify Values for Template Parameters 
---- command (Ctrl-Shift-M) to fill in the parameter 
---- values below.
----
---- See additional Create Trigger templates for more
---- examples of different Trigger statements.
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
---- Create date: <Create Date,,>
---- Description:	<Description,,>
---- =============================================
--CREATE TRIGGER dbo.CreateEnrollment -- dbo is schema name , crete is trigger name
--   ON  dbo.students  
--   AFTER INSERT -- after inserting student , trigger will activate
--AS 
--BEGIN
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;

--    -- Insert statements for trigger here
--	declare @studentID int
--	select @studentID = id from inserted;

--	insert into dbo.Enrollments(CourseID,Grade,StudentID,TeacherID)
--	values 
--	(1, null, @studentID, 2)
--END
--GO

-- Create Triggered
-- triggered is called when student is inserted
DECLARE @StudentID int
exec [dbo].[InsertStudent] 'pandit','chandrama','2000-02-03' ,@StudentID OUTPUT

select * from Enrollments;
select * from Students;

