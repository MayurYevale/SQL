-- this script when run on another machine will 
-- create exact database with all procedures  but
-- NOT CONTAIN DATA 
USE [master]
GO
/****** Object:  Database [school]    Script Date: 3/21/2022 9:52:47 AM ******/
CREATE DATABASE [school]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'school', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\school.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'school_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\school_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [school] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [school].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [school] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [school] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [school] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [school] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [school] SET ARITHABORT OFF 
GO
ALTER DATABASE [school] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [school] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [school] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [school] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [school] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [school] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [school] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [school] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [school] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [school] SET  ENABLE_BROKER 
GO
ALTER DATABASE [school] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [school] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [school] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [school] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [school] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [school] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [school] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [school] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [school] SET  MULTI_USER 
GO
ALTER DATABASE [school] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [school] SET DB_CHAINING OFF 
GO
ALTER DATABASE [school] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [school] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [school] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [school] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [school] SET QUERY_STORE = OFF
GO
USE [school]
GO
/****** Object:  UserDefinedFunction [dbo].[allPersons]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[allPersons]
(
	
)
RETURNS 
@persons TABLE  -- return persons table 
(
	-- Add the column definitions for the TABLE variable here
	firstaname nvarchar(50),
	lastname nvarchar(50),
	datejoined datetime,
	personnel_type nvarchar(50)	-- staff or student 
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	insert into @persons
	select 
		[firstName],
		[lastName],
		[enrollmentDate],
		'Student'
	from Students;
	insert into @persons
	select 
		[FirstName],
		[Lastname],
		[DateJoined],
		'Teacher'
	from Teacher;




	RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[getCouseTitleById]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getCouseTitleById]
(
	-- Add the parameters for the function here
	@courseId int 
)
RETURNS nvarchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @name nvarchar(50)

	-- Add the T-SQL statements to compute the return value here
	SELECT @name = Title from Courses
	where CourseID = @courseId

	-- Return the result of the function
	RETURN @name

END
GO
/****** Object:  UserDefinedFunction [dbo].[getHighestGrade]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getHighestGrade] 
(
	-- Add the parameters for the function here
	--<@Param1, sysname, @p1> <Data_Type_For_Param1, , int>
	-- no parameters required
)
RETURNS float -- as grade is float data type
AS
BEGIN
-- logic for function is between begin and end

	-- Declare the return variable here
	DECLARE @grade float

	-- Add the T-SQL statements to compute the return value here
	select @grade = max(grade) from Enrollments

	-- Return the result of the function
	RETURN @grade

END
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NULL,
	[StudentID] [int] NULL,
	[CourseID] [int] NULL,
	[Grade] [float] NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[gradeRange]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	 function to return grade between two values
-- =============================================
CREATE FUNCTION [dbo].[gradeRange] 
(	
	-- Add the parameters for the function here
	@firstGrade float,
	@secondGrade float
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT  [Id]
      ,[TeacherID]
      ,[StudentID]
      ,[CourseID]
      ,[Grade] from Enrollments 
	where grade between @firstGrade and @secondGrade
)
GO
/****** Object:  Table [dbo].[Students]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[dateOfBirth] [datetime] NOT NULL,
	[enrollmentDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[NoOfCredits] [int] NULL,
	[CourseCode] [nvarchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Student_Courses]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Student_Courses]
AS
SELECT dbo.Students.firstName AS [First Name], dbo.Students.lastName AS [Last Name], dbo.Courses.CourseCode AS Code, dbo.Courses.Title AS Course
FROM   dbo.Courses INNER JOIN
             dbo.Enrollments ON dbo.Courses.CourseID = dbo.Enrollments.CourseID INNER JOIN
             dbo.Students ON dbo.Enrollments.StudentID = dbo.Students.id
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[DateJoined] [date] NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[New_Name]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[New_Name]
AS
SELECT t.FirstName AS [Teacher First name], s.firstName AS [Student First name], c.Title AS [ Title], c.CourseCode AS Code
FROM   dbo.Enrollments AS e INNER JOIN
             dbo.Teacher AS t ON t.Id = e.TeacherID INNER JOIN
             dbo.Students AS s ON s.id = e.StudentID INNER JOIN
             dbo.Courses AS c ON c.CourseID = e.CourseID
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Courses]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Students]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Teacher]
GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertStudent]
	-- Add the parameters for the stored procedure here
	@firstname nvarchar(50),
	@lastname nvarchar(50),
	@dateofbirth datetime,
	-- this is change
	@studentID int OUTPUT -- AS it is return value
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Students (lastName,firstName,dateOfBirth,enrollmentDate) 
	values
	(@lastname,@firstname,@dateofbirth,getdate());

	select @studentID = SCOPE_IDENTITY(); -- gives last student id
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllStudents]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllStudents]
	-- Add the parameters for the stored procedure here
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Students
END
GO
/****** Object:  StoredProcedure [dbo].[SelectStudentByID]    Script Date: 3/21/2022 9:52:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectStudentByID] 
	-- Add the parameters for the stored procedure here
	@studID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Students where
	id = @studID;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 206
               Right = 841
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 9
               Left = 898
               Bottom = 206
               Right = 1120
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'New_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'New_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[13] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Courses"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Enrollments"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Students"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 206
               Right = 841
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Student_Courses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Student_Courses'
GO
USE [master]
GO
ALTER DATABASE [school] SET  READ_WRITE 
GO
