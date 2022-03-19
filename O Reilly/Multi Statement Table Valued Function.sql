use school

-- ================================================
---- Template generated from Template Explorer using:
---- Create Multi-Statement Function (New Menu).SQL
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
---- Create date: <Create Date,,>
---- Description:	<Description,,>
---- =============================================
--CREATE FUNCTION allPersons
--(
	
--)
--RETURNS 
--@persons TABLE  -- return persons table 
--(
--	-- Add the column definitions for the TABLE variable here
--	firstaname nvarchar(50),
--	lastname nvarchar(50),
--	datejoined datetime,
--	personnel_type nvarchar(50)	-- staff or student 
--)
--AS
--BEGIN
--	-- Fill the table variable with the rows for your result set
--	insert into @persons
--	select 
--		[firstName],
--		[lastName],
--		[enrollmentDate],
--		'Student'
--	from Students;
--	insert into @persons
--	select 
--		[FirstName],
--		[Lastname],
--		[DateJoined],
--		'Teacher'
--	from Teacher;




--	RETURN 
--END
--GO

-- above is MULTI STATEMENT TABLE VALUED FUNCTION 
-- WHICH RETURNS A TABLE
select * from [dbo].[allPersons]()

