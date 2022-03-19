use school;


--select * from Students;
--select * from Courses;
--select * from Teacher;
--select * from Enrollments;

--  JOINs
--select * from Enrollments
--inner join Teacher on Teacher.id = Enrollments.TeacherID
--inner join Students on Students.id = Enrollments.StudentID
--inner join Courses on Courses.CourseID = Enrollments.CourseID



select 
t.Firstname [Teacher First Name],
t.Lastname [Teacher Last Name],
s.firstName [Student First Name],
s.lastName [Stuendt Last Name],
c.Title [Course],
c.NoOfCredits [Credits],
c.CourseCode [Course Code]
from Enrollments e
inner join Teacher t on t.id = e.TeacherID
inner join Students s on s.id = e.StudentID
inner join Courses c on c.CourseID = e.CourseID
order by c.NoOfCredits;






