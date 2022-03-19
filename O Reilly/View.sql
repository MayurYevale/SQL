-- VIEWS
use school

--create view Student_Courses as
--SELECT dbo.Students.firstName AS [First Name], dbo.Students.lastName AS [Last Name], dbo.Courses.CourseCode AS Code, dbo.Courses.Title AS Course
--FROM   dbo.Courses INNER JOIN
--             dbo.Enrollments ON dbo.Courses.CourseID = dbo.Enrollments.CourseID INNER JOIN
--             dbo.Students ON dbo.Enrollments.StudentID = dbo.Students.id


-- we can save view 
--select * from Student_Courses;-- from view directly



--go
--create view Student_Subject_Lecturers as
--select 
--t.FirstName [Teacher First name],
--s.firstName [Student First name],
--c.Title [ Title],
--c.CourseCode [Code]
--from Enrollments e
--inner join Teacher t on t.Id = e.TeacherID
--inner join Students s on s.id = e.StudentID
--inner join Courses c on c.CourseID = e.CourseID;



select * from Student_Subject_Lecturers
where [Code] = 'CS100'	-- CONDITION ON view
order by [ Title];

-- REANAME THE VIEW
exec sp_rename 'Student_Subject_Lecturers','New_Name';
select * from New_Name;

-- MAKE CHANGES TO VIEW
--go
--alter view Student_Subject_Lecturers as
--select 
--t.FirstName [Teacher First name],
--s.firstName [Student First name],
--c.Title [ Title],
--c.CourseCode [Code]
--from Enrollments e
--inner join Teacher t on t.Id = e.TeacherID
--inner join Students s on s.id = e.StudentID
--inner join Courses c on c.CourseID = e.CourseID;