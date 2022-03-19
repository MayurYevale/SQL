use school;
--database name

/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT TOP (1000) [Id]
--      ,[TeacherID]
--      ,[StudentID]
--      ,[CourseID]
--      ,[Grade]
--  FROM [school].[dbo].[Enrollments]


select * from Enrollments e
inner join Teacher t on t.Id = e.TeacherID


select * from Enrollments e
left join Teacher t on t.Id = e.TeacherID; -- all rows from enrollment and matching from Teacher


select * from Enrollments e
right join Teacher t on t.Id = e.TeacherID; -- all rows from teacher and matching from enrollment

-- FUll JOIN , select all records regardless of matching
select * from Enrollments e 
full join 
Teacher t on t.Id = e.TeacherID


